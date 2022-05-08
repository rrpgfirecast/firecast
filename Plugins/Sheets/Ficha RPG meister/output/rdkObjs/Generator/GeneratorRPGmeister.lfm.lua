require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGeneratorRPGmeister()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmGeneratorRPGmeister");
    obj:setFormType("tablesDock");
    obj:setDataType("Ambesek.Generator.RPGmeister");
    obj:setTitle("Generator RPGmeister");
    obj:setAlign("client");
    obj:setTheme("dark");


		--local races = NDB.load("races.xml");
		--local classes = NDB.load("classes.xml");

		-- DEBUG FUNCTIONS

		local function dump(o)
		   if type(o) == 'table' then
			  local s = '{ '
			  for k,v in pairs(o) do
				 if type(k) ~= 'number' then k = '"'..k..'"' end
				 s = s .. '['..k..'] = ' .. dump(v) .. ','
			  end
			  return s .. '} '
		   else
			  return tostring(o)
		   end
		end

		local function write(str)
			local mesa = Firecast.getMesaDe(sheet);
			if str==nil then
				mesa.activeChat:escrever("NIL");
			else
				mesa.activeChat:escrever(str);
			end
		end;

		-- AUTO UPDATE FUNCTIONS

		local function isNewVersion(installed, downloaded)
			local installedVersion = {};
			local installedIndex = 0;
			for i in string.gmatch(installed, "[^%.]+") do
				installedIndex = installedIndex +1;
				installedVersion[installedIndex] = i;
			end

			local downloadedVersion = {};
			local downloadedIndex = 0;
			for i in string.gmatch(downloaded, "[^%.]+") do
				downloadedIndex = downloadedIndex +1;
				downloadedVersion[downloadedIndex] = i;
			end

			for i=1, math.min(installedIndex, downloadedIndex), 1 do 
				if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
					return false;
				elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
					return true;
				end;
			end;

			if downloadedIndex > installedIndex then
				return true;
			else
				return false;
			end;
		end;

		-- JSON DECODE FUNCTIONS

		local escape_char_map = {
			[ "\\" ] = "\\\\",
			[ "\"" ] = "\\\"",
			[ "\b" ] = "\\b",
			[ "\f" ] = "\\f",
			[ "\n" ] = "\\n",
			[ "\r" ] = "\\r",
			[ "\t" ] = "\\t",
		}

		local escape_char_map_inv = { [ "\\/" ] = "/" }
		for k, v in pairs(escape_char_map) do
			escape_char_map_inv[v] = k
		end

		local parse

		local function create_set(...)
			local res = {}
			for i = 1, select("#", ...) do
			res[ select(i, ...) ] = true
			end
			return res
		end

		local space_chars	= create_set(" ", "\t", "\r", "\n")
		local delim_chars	= create_set(" ", "\t", "\r", "\n", "]", "}", ",")
		local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
		local literals	= create_set("true", "false", "null")

		local literal_map = {
		  [ "true"  ] = true,
		  [ "false" ] = false,
		  [ "null"  ] = nil,
		}

		local function next_char(str, idx, set, negate)
		  for i = idx, #str do
			if set[str:sub(i, i)] ~= negate then
			  return i
			end
		  end
		  return #str + 1
		end

		local function decode_error(str, idx, msg)
		  local line_count = 1
		  local col_count = 1
		  for i = 1, idx - 1 do
			col_count = col_count + 1
			if str:sub(i, i) == "\n" then
			  line_count = line_count + 1
			  col_count = 1
			end
		  end
		  error( string.format("%s at line %d col %d", msg, line_count, col_count) )
		end

		local function codepoint_to_utf8(n)
		  -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
		  local f = math.floor
		  if n <= 0x7f then
			return string.char(n)
		  elseif n <= 0x7ff then
			return string.char(f(n / 64) + 192, n % 64 + 128)
		  elseif n <= 0xffff then
			return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
		  elseif n <= 0x10ffff then
			return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
							   f(n % 4096 / 64) + 128, n % 64 + 128)
		  end
		  error( string.format("invalid unicode codepoint '%x'", n) )
		end

		local function parse_unicode_escape(s)
		  local n1 = tonumber( s:sub(3, 6),  16 )
		  local n2 = tonumber( s:sub(9, 12), 16 )
		  -- Surrogate pair?
		  if n2 then
			return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
		  else
			return codepoint_to_utf8(n1)
		  end
		end

		local function parse_string(str, i)
		  local has_unicode_escape = false
		  local has_surrogate_escape = false
		  local has_escape = false
		  local last
		  for j = i + 1, #str do
			local x = str:byte(j)

			if x < 32 then
			  decode_error(str, j, "control character in string")
			end

			if last == 92 then -- "\\" (escape char)
			  if x == 117 then -- "u" (unicode escape sequence)
				local hex = str:sub(j + 1, j + 5)
				if not hex:find("%x%x%x%x") then
				  decode_error(str, j, "invalid unicode escape in string")
				end
				if hex:find("^[dD][89aAbB]") then
				  has_surrogate_escape = true
				else
				  has_unicode_escape = true
				end
			  else
				local c = string.char(x)
				if not escape_chars[c] then
				  decode_error(str, j, "invalid escape char '" .. c .. "' in string")
				end
				has_escape = true
			  end
			  last = nil

			elseif x == 34 then -- '"' (end of string)
			  local s = str:sub(i + 1, j - 1)
			  if has_surrogate_escape then
				s = s:gsub("\\u[dD][89aAbB]..\\u....", parse_unicode_escape)
			  end
			  if has_unicode_escape then
				s = s:gsub("\\u....", parse_unicode_escape)
			  end
			  if has_escape then
				s = s:gsub("\\.", escape_char_map_inv)
			  end
			  return s, j + 1

			else
			  last = x
			end
		  end
		  decode_error(str, i, "expected closing quote for string")
		end

		local function parse_number(str, i)
		  local x = next_char(str, i, delim_chars)
		  local s = str:sub(i, x - 1)
		  local n = tonumber(s)
		  if not n then
			decode_error(str, i, "invalid number '" .. s .. "'")
		  end
		  return n, x
		end

		local function parse_literal(str, i)
		  local x = next_char(str, i, delim_chars)
		  local word = str:sub(i, x - 1)
		  if not literals[word] then
			decode_error(str, i, "invalid literal '" .. word .. "'")
		  end
		  return literal_map[word], x
		end

		local function parse_array(str, i)
		  local res = {}
		  local n = 1
		  i = i + 1
		  while 1 do
			local x
			i = next_char(str, i, space_chars, true)
			-- Empty / end of array?
			if str:sub(i, i) == "]" then
			  i = i + 1
			  break
			end
			-- Read token
			x, i = parse(str, i)
			res[n] = x
			n = n + 1
			-- Next token
			i = next_char(str, i, space_chars, true)
			local chr = str:sub(i, i)
			i = i + 1
			if chr == "]" then break end
			if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
		  end
		  return res, i
		end

		local function parse_object(str, i)
		  local res = {}
		  i = i + 1
		  while 1 do
			local key, val
			i = next_char(str, i, space_chars, true)
			-- Empty / end of object?
			if str:sub(i, i) == "}" then
			  i = i + 1
			  break
			end
			-- Read key
			if str:sub(i, i) ~= '"' then
			  decode_error(str, i, "expected string for key")
			end
			key, i = parse(str, i)
			-- Read ':' delimiter
			i = next_char(str, i, space_chars, true)
			if str:sub(i, i) ~= ":" then
			  decode_error(str, i, "expected ':' after key")
			end
			i = next_char(str, i + 1, space_chars, true)
			-- Read value
			val, i = parse(str, i)
			-- Set
			res[key] = val
			-- Next token
			i = next_char(str, i, space_chars, true)
			local chr = str:sub(i, i)
			i = i + 1
			if chr == "}" then break end
			if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
		  end
		  return res, i
		end

		local char_func_map = {
		  [ '"' ] = parse_string,
		  [ "0" ] = parse_number,
		  [ "1" ] = parse_number,
		  [ "2" ] = parse_number,
		  [ "3" ] = parse_number,
		  [ "4" ] = parse_number,
		  [ "5" ] = parse_number,
		  [ "6" ] = parse_number,
		  [ "7" ] = parse_number,
		  [ "8" ] = parse_number,
		  [ "9" ] = parse_number,
		  [ "-" ] = parse_number,
		  [ "t" ] = parse_literal,
		  [ "f" ] = parse_literal,
		  [ "n" ] = parse_literal,
		  [ "[" ] = parse_array,
		  [ "{" ] = parse_object,
		}

		parse = function(str, idx)
		  local chr = str:sub(idx, idx)
		  local f = char_func_map[chr]
		  if f then
			return f(str, idx)
		  end
		  decode_error(str, idx, "unexpected character '" .. chr .. "'")
		end

		function decode(str)
		  if type(str) ~= "string" then
			error("expected argument of type string, got " .. type(str))
		  end
		  local res, idx = parse(str, next_char(str, 1, space_chars, true))
		  idx = next_char(str, idx, space_chars, true)
		  if idx <= #str then
			decode_error(str, idx, "trailing garbage")
		  end
		  return res
		end

		local function InitSkills()
			local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasPericias)
			if #nodes>0 then return end

			generatorSheet.npc.campoDasPericias = NDB.load("rpgmeisterskills.xml");
		end
		


    obj.scope = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.scope:setParent(obj);
    obj.scope:setName("scope");
    obj.scope:setAlign("client");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scope);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(150);
    obj.label1:setField("raca");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(150);
    obj.label2:setField("classe1");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(150);
    obj.button1:setText("Subir de Nível");
    obj.button1:setName("button1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setAlign("left");
    obj.label3:setWidth(75);
    obj.label3:setText("Nível");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setAlign("left");
    obj.label4:setWidth(75);
    obj.label4:setField("nep");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setAlign("left");
    obj.label5:setWidth(100);
    obj.label5:setField("xpAtual");
    obj.label5:setName("label5");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.scope);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Raça & Classe");
    obj.tab1:setName("tab1");

    obj.frmGeneratorRace = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeneratorRace:setParent(obj.tab1);
    obj.frmGeneratorRace:setName("frmGeneratorRace");
    obj.frmGeneratorRace:setAlign("client");


		local function filterRaces(filter)
			local races = generatorSheet.db.races
			local i = 0
			local index = 0;
			local raceList = {}
			local raceId = {}
			local raceWeight = {}
			while races[i+1]~=nil do
				-- next race on the list
				i = i + 1

				if races[i]["planes"][filter] > 0 then
					-- next slot on the list for a valid race
					index = index + 1

					raceList[index] = races[i].name;
					raceId[index] = i;
					raceWeight[index] = (tonumber(raceWeight[index-1]) or 0) + races[i]["planes"][filter]
				end
			end

			self.raceSelector.items = raceList
			self.raceSelector.values = raceId

			generatorSheet.raceWeight = raceWeight
			generatorSheet.raceQtd = index
		end

		local function RngRace()
			if generatorSheet.raceWeight == nil then return end;
			local raceWeight = generatorSheet.raceWeight
			local index = generatorSheet.raceQtd
			local maxWeight = raceWeight[index]

			local rng = math.random(maxWeight)
			local selected = 1;

			for i=2, index, 1 do
				if rng > raceWeight[i-1] and rng <= raceWeight[i] then 
					selected = i 
				end
			end;

			generatorSheet.raceSelector = self.raceSelector.values[selected]
			self.raceSelector.text = self.raceSelector.items[selected]
		end

		local function filterClasses(filter)
			local classes = generatorSheet.db.classes
			local i = 0
			local index = 0;
			local classeList = {}
			local classeId = {}
			local classeWeight = {}
			while classes[i+1]~=nil do
				-- next classe on the list
				i = i + 1

				if classes[i]["planes"][filter] > 0 then
					-- next slot on the list for a valid classe
					index = index + 1

					classeList[index] = classes[i].name;
					classeId[index] = i;
					classeWeight[index] = (tonumber(classeWeight[index-1]) or 0) + classes[i]["planes"][filter]
				end
			end

			self.classeSelector.items = classeList
			self.classeSelector.values = classeId

			generatorSheet.classeWeight = classeWeight
			generatorSheet.classeQtd = index
		end

		local function RngClasse()
			if generatorSheet.classeWeight == nil then return end;
			local classeWeight = generatorSheet.classeWeight
			local index = generatorSheet.classeQtd
			local maxWeight = classeWeight[index]

			local rng = math.random(maxWeight)
			local selected = 1;

			for i=2, index, 1 do
				if rng > classeWeight[i-1] and rng <= classeWeight[i] then 
					selected = i 
				end
			end;

			generatorSheet.classeSelector = self.classeSelector.values[selected]
			self.classeSelector.text = self.classeSelector.items[selected]
		end

		local function starts_with(str, start)
			return Utils.compareStringPtBr(str:sub(1, #start), start) == 0
		end

		local function FindCC(cc)
			local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasCaracteristicasClasse);
			for i=1, #nodes, 1 do
                if starts_with(nodes[i].nomeHabilidade,cc) then
                	return nodes[i]
                end
            end

			return nil
		end

		local function FindSkill(skill)
			local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasPericias);
			for i=1, #nodes, 1 do
                if starts_with(nodes[i].nomePericia,skill) then
                	return nodes[i]
                end
            end

			return nil
		end

		local function UpdateMaxSkills(classe, lvl)
			local int = tonumber(generatorSheet.npc.totalInt) or 0
			local nepInt = tonumber(generatorSheet.npc.nepInt) or 0

			local initInt = int - nepInt
			local modInt = math.floor(initInt/2) - 5

			local SP = (tonumber(generatorSheet.skills) or 0) + modInt + (tonumber(classe.skillsPoints) or 0)
			SP = math.max(SP,1)
			local basePt = SP * (lvl+3)

			if lvl>= 4 and generatorSheet.npc.nv4 == "4" then
				initInt = initInt + 1
				if (math.floor(initInt/2) - 5) > modInt then 
					modInt = modInt + 1
					basePt = basePt + (lvl-3)
				end
			end
			if lvl>= 8 and generatorSheet.npc.nv8 == "4" then
				initInt = initInt + 1
				if (math.floor(initInt/2) - 5) > modInt then 
					modInt = modInt + 1
					basePt = basePt + (lvl-7)
				end
			end
			if lvl>= 12 and generatorSheet.npc.nv12 == "4" then
				initInt = initInt + 1
				if (math.floor(initInt/2) - 5) > modInt then 
					modInt = modInt + 1
					basePt = basePt + (lvl-11)
				end
			end
			if lvl>= 16 and generatorSheet.npc.nv16 == "4" then
				initInt = initInt + 1
				if (math.floor(initInt/2) - 5) > modInt then 
					modInt = modInt + 1
					basePt = basePt + (lvl-15)
				end
			end
			if lvl>= 20 and generatorSheet.npc.nv20 == "4" then
				initInt = initInt + 1
				if (math.floor(initInt/2) - 5) > modInt then 
					modInt = modInt + 1
					basePt = basePt + (lvl-19)
				end
			end

			generatorSheet.npc.skillsMax = basePt
		end

		local function LevelUpdate()
			local lvl = tonumber(generatorSheet.npc.lvl) or 1
			lvl = lvl + 1
			if lvl > 20 then return end
			generatorSheet.npc.lvl = lvl

			local ajuste = tonumber(generatorSheet.npc.ajuste) or 0
			generatorSheet.npc.nep = ajuste+lvl
			generatorSheet.npc.xpAtual = ((ajuste+lvl-1) + 1) * (ajuste+lvl-1) * 1000 / 2;

			local index = tonumber(generatorSheet.npc.classeSelector) or 0
			local classe = generatorSheet.db.classes[index]

			generatorSheet.npc.classe1 = classe.name .. " " .. lvl

			if classe.bba == 0 then
				generatorSheet.npc.bba = math.floor(lvl/2)
			elseif classe.bba == 1 then
				generatorSheet.npc.bba = math.floor(lvl*3/4)
			else
				generatorSheet.npc.bba = lvl
			end

			if classe.fort == 0 then
				generatorSheet.npc.baseFort = math.floor(lvl/3)
			else
				generatorSheet.npc.baseFort = 2 + math.floor(lvl/2)
			end

			if classe.ref == 0 then
				generatorSheet.npc.baseRef = math.floor(lvl/3)
			else
				generatorSheet.npc.baseRef = 2 + math.floor(lvl/2)
			end

			if classe.will == 0 then
				generatorSheet.npc.baseVon = math.floor(lvl/3)
			else
				generatorSheet.npc.baseVon = 2 + math.floor(lvl/2)
			end

			local con = tonumber(generatorSheet.npc.totalCon) or 0
			con = math.floor(con/2) - 5
			con = con * lvl

			generatorSheet.npc.dvs = lvl .. "d" .. classe.hd .. "+" .. con
			generatorSheet.npc.pvTotal = math.floor(classe.hd + (lvl-1)*((classe.hd/2) + 0.5) + con)

			-- Adicionando caracteristicas de classe
			local cc = classe.levels[lvl]

			if lvl == 1 then
				local rclItem = self.campoDasCaracteristicasClasse:append()
				if rclItem ~= nil then
					rclItem.nivelHabilidade = lvl
					rclItem.nomeHabilidade = "Proficiências"
					rclItem.obtencaoHabilidade = classe.name .. " " .. lvl
					rclItem.descricao = classe.proficiency
				end
			end

			local i = 1
			while cc.unique ~= nil and cc.unique[i] ~= nil do
				local rclItem = self.campoDasCaracteristicasClasse:append()
				if rclItem ~= nil then
					rclItem.nivelHabilidade = lvl
					rclItem.nomeHabilidade = cc.unique[i]
					rclItem.obtencaoHabilidade = classe.name .. " " .. lvl
				end

				i = i + 1
			end

			local i = 1
			while cc.upgradeable ~= nil and cc.upgradeable[i] ~= nil do
				local node = FindCC(cc.upgradeable[i][1])

				if node == nil then
					-- Add new item
					local rclItem = self.campoDasCaracteristicasClasse:append()
					if rclItem ~= nil then
						rclItem.nivelHabilidade = lvl
						rclItem.nomeHabilidade = cc.upgradeable[i][1] .. " " .. (cc.upgradeable[i][2] or "")
						rclItem.obtencaoHabilidade = classe.name .. " " .. lvl
					end
				else
					-- Update old item 
					node.nivelHabilidade = lvl
					node.nomeHabilidade = cc.upgradeable[i][1] .. " " .. (cc.upgradeable[i][2] or "")
					node.obtencaoHabilidade = classe.name .. " " .. lvl
				end
				i = i + 1
			end

			local i = 1
			while cc.cumulative ~= nil and cc.cumulative[i] ~= nil do
				local node = FindCC(cc.cumulative[i][1])

				if node == nil then
					-- Add new item
					local rclItem = self.campoDasCaracteristicasClasse:append()
					if rclItem ~= nil then
						rclItem.nivelHabilidade = lvl
						rclItem.nomeHabilidade = cc.cumulative[i][1] .. ": " .. (cc.cumulative[i][2] or "")
						rclItem.obtencaoHabilidade = classe.name .. " " .. lvl
					end
				else
					-- Update old item 
					node.nivelHabilidade = lvl
					node.nomeHabilidade = node.nomeHabilidade .. ", " .. (cc.cumulative[i][2] or "")
					node.obtencaoHabilidade = classe.name .. " " .. lvl
				end
				i = i + 1
			end

			-- TALENTOS

			local feats = tonumber(cc.feats) or 0;

			local i = 1
			while cc.featForce ~= nil and cc.featForce[i] ~= nil do
				local rclItem = self.campoDosTalentos:append()
				if rclItem ~= nil then
					rclItem.nivelHabilidade = lvl
					rclItem.nomeHabilidade = cc.featForce[i]
					rclItem.obtencaoHabilidade = classe.name .. " " .. lvl
					rclItem.lock = true
				end

				feats = feats - 1
				i = i + 1
			end

			for i=1, feats, 1 do 
				local rclItem = self.campoDosTalentos:append()
				if rclItem ~= nil then
					rclItem.nivelHabilidade = lvl
					rclItem.obtencaoHabilidade = classe.name .. " " .. lvl
				end
			end

			if lvl == 1 or lvl%3 == 0 then 
				local rclItem = self.campoDosTalentos:append()
				if rclItem ~= nil then
					rclItem.nivelHabilidade = lvl
					rclItem.obtencaoHabilidade = "NEP " .. lvl
				end
			end

			-- PERICIAS

			InitSkills()

			UpdateMaxSkills(classe, lvl)

			-- MAGIAS

			local spellItems = NDB.getChildNodes(generatorSheet.npc.campoDosItens)
			local spellItem = nil
			if #spellItems > 0 then 
				spellItem = spellItems[1]
				spellItem.NC = lvl
			end

			if classe.spellType == "3" and cc.spells ~= nil and spellItem ~= nil then 
				local i = 1
				local spellMin = tonumber(classe.spellMin) or 0

				while cc.spells[i] ~= nil do 
					spellItem["base" .. spellMin] = cc.spells[i]

					spellMin = spellMin + 1
					i = i + 1
				end
			end

			if classe.spellType == "3" and cc.spellsKnown ~= nil and spellItem ~= nil then 
				local i = 1
				local spellMin = tonumber(classe.spellMin) or 0

				while cc.spellsKnown[i] ~= nil do 
					spellItem["conhecidas" .. spellMin] = cc.spellsKnown[i]
					
					spellMin = spellMin + 1
					i = i + 1
				end
			end
		end;

		local function UpdateClassSkills()
			local index = tonumber(generatorSheet.npc.raceSelector) or 0
			local race = generatorSheet.db.races[index]

			local index = tonumber(generatorSheet.npc.classeSelector) or 0
			local classe = generatorSheet.db.classes[index]

			local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasPericias);
			for i=1, #nodes, 1 do
				nodes[i].racialPericia = nil
				nodes[i].isClass = nil
			end

			if race~= nil then
				local i = 1
				while race.skillsClass~=nil and race.skillsClass[i]~=nil do
					local skill = FindSkill(race.skillsClass[i])

					if skill==nil then 
						skill = self.rclListaDasPericias:append()
					end

					if skill~= nil then
						skill.isClass = (tonumber(race.skillsRace[i]) or 0) >= 0
						skill.nomePericia = race.skillsClass[i]

						if race.skillsRace ~= nil and race.skillsRace[i]~= nil then
							skill.racialPericia = race.skillsRace[i]
						end

						if race.skillsRaceOther ~= nil and race.skillsRaceOther[i]~= nil then
							skill.descricao = race.skillsRaceOther[i]
						end
					end
					i = i + 1
				end
			end

			if classe~=nil then 
				local i = 1
				while classe.skillsClass~=nil and classe.skillsClass[i]~=nil do
					local skill = FindSkill(classe.skillsClass[i])

					if skill==nil then 
						skill = self.rclListaDasPericias:append()
					end

					if skill~= nil then
						skill.isClass = true
						skill.nomePericia = classe.skillsClass[i]
					end
					i = i + 1
				end
			end
		end
		


    obj.popFeatSelection = GUI.fromHandle(_obj_newObject("popup"));
    obj.popFeatSelection:setParent(obj.frmGeneratorRace);
    obj.popFeatSelection:setName("popFeatSelection");
    obj.popFeatSelection:setAlign("client");
    obj.popFeatSelection:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popFeatSelection, "autoScopeNode",  "false");
    obj.popFeatSelection:setMargins({left=50,right=50,top=50,bottom=50});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.popFeatSelection);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(4);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.FeatClassPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatClassPart:setParent(obj.flowLayout1);
    obj.FeatClassPart:setMinWidth(300);
    obj.FeatClassPart:setMaxWidth(600);
    obj.FeatClassPart:setHeight(25);
    obj.FeatClassPart:setMinScaledWidth(280);
    obj.FeatClassPart:setName("FeatClassPart");
    obj.FeatClassPart:setAdjustHeightToLine(false);
    obj.FeatClassPart:setMargins({left=5});


					rawset(self.FeatClassPart, "_recalcHeight", 					
						function ()
							self.FeatClassPart.height = self.FeatClass.height + 25;
						end);
				


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.FeatClassPart);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setText("Classe");
    obj.label6:setAlign("left");
    obj.label6:setWidth(225);
    obj.label6:setMargins({left=5});
    obj.label6:setName("label6");

    obj.FeatClass = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatClass:setParent(obj.rectangle1);
    obj.FeatClass:setName("FeatClass");
    obj.FeatClass:setField("FeatClass");
    obj.FeatClass:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatClass:setAlign("top");
    obj.FeatClass:setLayout("vertical");
    obj.FeatClass:setAutoHeight(true);
    obj.FeatClass:setHitTest(false);
    obj.FeatClass:setMinQt(0);

    obj.FeatCombatPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatCombatPart:setParent(obj.flowLayout1);
    obj.FeatCombatPart:setMinWidth(300);
    obj.FeatCombatPart:setMaxWidth(600);
    obj.FeatCombatPart:setHeight(25);
    obj.FeatCombatPart:setMinScaledWidth(280);
    obj.FeatCombatPart:setName("FeatCombatPart");
    obj.FeatCombatPart:setAdjustHeightToLine(false);
    obj.FeatCombatPart:setMargins({left=5});


					rawset(self.FeatCombatPart, "_recalcHeight", 					
						function ()
							self.FeatCombatPart.height = self.FeatCombat.height + 25;
						end);
				


    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.FeatCombatPart);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setText("Combate");
    obj.label7:setAlign("left");
    obj.label7:setWidth(225);
    obj.label7:setMargins({left=5});
    obj.label7:setName("label7");

    obj.FeatCombat = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatCombat:setParent(obj.rectangle2);
    obj.FeatCombat:setName("FeatCombat");
    obj.FeatCombat:setField("FeatCombat");
    obj.FeatCombat:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatCombat:setAlign("top");
    obj.FeatCombat:setLayout("vertical");
    obj.FeatCombat:setAutoHeight(true);
    obj.FeatCombat:setHitTest(false);
    obj.FeatCombat:setMinQt(0);

    obj.FeatCastingPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatCastingPart:setParent(obj.flowLayout1);
    obj.FeatCastingPart:setMinWidth(300);
    obj.FeatCastingPart:setMaxWidth(600);
    obj.FeatCastingPart:setHeight(25);
    obj.FeatCastingPart:setMinScaledWidth(280);
    obj.FeatCastingPart:setName("FeatCastingPart");
    obj.FeatCastingPart:setAdjustHeightToLine(false);
    obj.FeatCastingPart:setMargins({left=5});


					rawset(self.FeatCastingPart, "_recalcHeight", 					
						function ()
							self.FeatCastingPart.height = self.FeatCasting.height + 25;
						end);
				


    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.FeatCastingPart);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setText("Conjuração");
    obj.label8:setAlign("left");
    obj.label8:setWidth(225);
    obj.label8:setMargins({left=5});
    obj.label8:setName("label8");

    obj.FeatCasting = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatCasting:setParent(obj.rectangle3);
    obj.FeatCasting:setName("FeatCasting");
    obj.FeatCasting:setField("FeatCasting");
    obj.FeatCasting:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatCasting:setAlign("top");
    obj.FeatCasting:setLayout("vertical");
    obj.FeatCasting:setAutoHeight(true);
    obj.FeatCasting:setHitTest(false);
    obj.FeatCasting:setMinQt(0);

    obj.FeatCreationPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatCreationPart:setParent(obj.flowLayout1);
    obj.FeatCreationPart:setMinWidth(300);
    obj.FeatCreationPart:setMaxWidth(600);
    obj.FeatCreationPart:setHeight(25);
    obj.FeatCreationPart:setMinScaledWidth(280);
    obj.FeatCreationPart:setName("FeatCreationPart");
    obj.FeatCreationPart:setAdjustHeightToLine(false);
    obj.FeatCreationPart:setMargins({left=5});


					rawset(self.FeatCreationPart, "_recalcHeight", 					
						function ()
							self.FeatCreationPart.height = self.FeatCreation.height + 25;
						end);
				


    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.FeatCreationPart);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle4);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout5);
    obj.label9:setText("Criação de Item");
    obj.label9:setAlign("left");
    obj.label9:setWidth(225);
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");

    obj.FeatCreation = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatCreation:setParent(obj.rectangle4);
    obj.FeatCreation:setName("FeatCreation");
    obj.FeatCreation:setField("FeatCreation");
    obj.FeatCreation:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatCreation:setAlign("top");
    obj.FeatCreation:setLayout("vertical");
    obj.FeatCreation:setAutoHeight(true);
    obj.FeatCreation:setHitTest(false);
    obj.FeatCreation:setMinQt(0);

    obj.FeatGeneralPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatGeneralPart:setParent(obj.flowLayout1);
    obj.FeatGeneralPart:setMinWidth(300);
    obj.FeatGeneralPart:setMaxWidth(600);
    obj.FeatGeneralPart:setHeight(25);
    obj.FeatGeneralPart:setMinScaledWidth(280);
    obj.FeatGeneralPart:setName("FeatGeneralPart");
    obj.FeatGeneralPart:setAdjustHeightToLine(false);
    obj.FeatGeneralPart:setMargins({left=5});


					rawset(self.FeatGeneralPart, "_recalcHeight", 					
						function ()
							self.FeatGeneralPart.height = self.FeatGeneral.height + 25;
						end);
				


    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.FeatGeneralPart);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle5);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout6);
    obj.label10:setText("Geral");
    obj.label10:setAlign("left");
    obj.label10:setWidth(225);
    obj.label10:setMargins({left=5});
    obj.label10:setName("label10");

    obj.FeatGeneral = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatGeneral:setParent(obj.rectangle5);
    obj.FeatGeneral:setName("FeatGeneral");
    obj.FeatGeneral:setField("FeatGeneral");
    obj.FeatGeneral:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatGeneral:setAlign("top");
    obj.FeatGeneral:setLayout("vertical");
    obj.FeatGeneral:setAutoHeight(true);
    obj.FeatGeneral:setHitTest(false);
    obj.FeatGeneral:setMinQt(0);

    obj.FeatMetamagicPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatMetamagicPart:setParent(obj.flowLayout1);
    obj.FeatMetamagicPart:setMinWidth(300);
    obj.FeatMetamagicPart:setMaxWidth(600);
    obj.FeatMetamagicPart:setHeight(25);
    obj.FeatMetamagicPart:setMinScaledWidth(280);
    obj.FeatMetamagicPart:setName("FeatMetamagicPart");
    obj.FeatMetamagicPart:setAdjustHeightToLine(false);
    obj.FeatMetamagicPart:setMargins({left=5});


					rawset(self.FeatMetamagicPart, "_recalcHeight", 					
						function ()
							self.FeatMetamagicPart.height = self.FeatMetamagic.height + 25;
						end);
				


    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.FeatMetamagicPart);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle6);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setText("Metamagico");
    obj.label11:setAlign("left");
    obj.label11:setWidth(225);
    obj.label11:setMargins({left=5});
    obj.label11:setName("label11");

    obj.FeatMetamagic = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatMetamagic:setParent(obj.rectangle6);
    obj.FeatMetamagic:setName("FeatMetamagic");
    obj.FeatMetamagic:setField("FeatMetamagic");
    obj.FeatMetamagic:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatMetamagic:setAlign("top");
    obj.FeatMetamagic:setLayout("vertical");
    obj.FeatMetamagic:setAutoHeight(true);
    obj.FeatMetamagic:setHitTest(false);
    obj.FeatMetamagic:setMinQt(0);

    obj.FeatSkillPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatSkillPart:setParent(obj.flowLayout1);
    obj.FeatSkillPart:setMinWidth(300);
    obj.FeatSkillPart:setMaxWidth(600);
    obj.FeatSkillPart:setHeight(25);
    obj.FeatSkillPart:setMinScaledWidth(280);
    obj.FeatSkillPart:setName("FeatSkillPart");
    obj.FeatSkillPart:setAdjustHeightToLine(false);
    obj.FeatSkillPart:setMargins({left=5});


					rawset(self.FeatSkillPart, "_recalcHeight", 					
						function ()
							self.FeatSkillPart.height = self.FeatSkill.height + 25;
						end);
				


    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.FeatSkillPart);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle7);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setText("Perícia");
    obj.label12:setAlign("left");
    obj.label12:setWidth(225);
    obj.label12:setMargins({left=5});
    obj.label12:setName("label12");

    obj.FeatSkill = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatSkill:setParent(obj.rectangle7);
    obj.FeatSkill:setName("FeatSkill");
    obj.FeatSkill:setField("FeatSkill");
    obj.FeatSkill:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatSkill:setAlign("top");
    obj.FeatSkill:setLayout("vertical");
    obj.FeatSkill:setAutoHeight(true);
    obj.FeatSkill:setHitTest(false);
    obj.FeatSkill:setMinQt(0);

    obj.FeatRacePart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.FeatRacePart:setParent(obj.flowLayout1);
    obj.FeatRacePart:setMinWidth(300);
    obj.FeatRacePart:setMaxWidth(600);
    obj.FeatRacePart:setHeight(25);
    obj.FeatRacePart:setMinScaledWidth(280);
    obj.FeatRacePart:setName("FeatRacePart");
    obj.FeatRacePart:setAdjustHeightToLine(false);
    obj.FeatRacePart:setMargins({left=5});


					rawset(self.FeatRacePart, "_recalcHeight", 					
						function ()
							self.FeatRacePart.height = self.FeatRace.height + 25;
						end);
				


    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.FeatRacePart);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle8);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout9);
    obj.label13:setText("Raça");
    obj.label13:setAlign("left");
    obj.label13:setWidth(225);
    obj.label13:setMargins({left=5});
    obj.label13:setName("label13");

    obj.FeatRace = GUI.fromHandle(_obj_newObject("recordList"));
    obj.FeatRace:setParent(obj.rectangle8);
    obj.FeatRace:setName("FeatRace");
    obj.FeatRace:setField("FeatRace");
    obj.FeatRace:setTemplateForm("frmGeneratorFeatSelector");
    obj.FeatRace:setAlign("top");
    obj.FeatRace:setLayout("vertical");
    obj.FeatRace:setAutoHeight(true);
    obj.FeatRace:setHitTest(false);
    obj.FeatRace:setMinQt(0);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmGeneratorRace);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox2);
    obj.layout10:setAlign("top");
    obj.layout10:setName("layout10");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout10);
    obj.button2:setAlign("left");
    obj.button2:setText("Geral");
    obj.button2:setMargins({right=5});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout10);
    obj.button3:setAlign("left");
    obj.button3:setText("Oficial");
    obj.button3:setMargins({right=5});
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout10);
    obj.button4:setAlign("left");
    obj.button4:setText("Paraiso");
    obj.button4:setMargins({right=5});
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout10);
    obj.button5:setAlign("left");
    obj.button5:setText("Efíria");
    obj.button5:setMargins({right=5});
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout10);
    obj.button6:setAlign("left");
    obj.button6:setText("Centelha");
    obj.button6:setMargins({right=5});
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout10);
    obj.button7:setAlign("left");
    obj.button7:setText("SobAlec");
    obj.button7:setMargins({right=5});
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout10);
    obj.button8:setAlign("left");
    obj.button8:setText("Ardeal");
    obj.button8:setMargins({right=5});
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout10);
    obj.button9:setAlign("left");
    obj.button9:setText("Abismo");
    obj.button9:setMargins({right=5});
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout10);
    obj.button10:setAlign("left");
    obj.button10:setText("Diaféle");
    obj.button10:setMargins({right=5});
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout10);
    obj.button11:setAlign("left");
    obj.button11:setText("Inferno");
    obj.button11:setMargins({right=5});
    obj.button11:setName("button11");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox2);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setMargins({top=5});
    obj.layout11:setName("layout11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setText("Raça");
    obj.label14:setAlign("left");
    obj.label14:setWidth(50);
    obj.label14:setMargins({right=5});
    obj.label14:setName("label14");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout11);
    obj.button12:setAlign("left");
    obj.button12:setText("Aleatório");
    obj.button12:setMargins({right=5});
    obj.button12:setName("button12");

    obj.raceSelector = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.raceSelector:setParent(obj.layout11);
    obj.raceSelector:setAlign("client");
    obj.raceSelector:setName("raceSelector");
    obj.raceSelector:setField("raceSelector");
    obj.raceSelector:setItems({});
    obj.raceSelector:setValues({});

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox2);
    obj.layout12:setAlign("top");
    obj.layout12:setMargins({top=5});
    obj.layout12:setName("layout12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout12);
    obj.button13:setAlign("left");
    obj.button13:setText("Geral");
    obj.button13:setMargins({right=5});
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout12);
    obj.button14:setAlign("left");
    obj.button14:setText("Oficial");
    obj.button14:setMargins({right=5});
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout12);
    obj.button15:setAlign("left");
    obj.button15:setText("Paraiso");
    obj.button15:setMargins({right=5});
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout12);
    obj.button16:setAlign("left");
    obj.button16:setText("Efíria");
    obj.button16:setMargins({right=5});
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout12);
    obj.button17:setAlign("left");
    obj.button17:setText("Centelha");
    obj.button17:setMargins({right=5});
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout12);
    obj.button18:setAlign("left");
    obj.button18:setText("SobAlec");
    obj.button18:setMargins({right=5});
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout12);
    obj.button19:setAlign("left");
    obj.button19:setText("Ardeal");
    obj.button19:setMargins({right=5});
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout12);
    obj.button20:setAlign("left");
    obj.button20:setText("Abismo");
    obj.button20:setMargins({right=5});
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout12);
    obj.button21:setAlign("left");
    obj.button21:setText("Diaféle");
    obj.button21:setMargins({right=5});
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout12);
    obj.button22:setAlign("left");
    obj.button22:setText("Inferno");
    obj.button22:setMargins({right=5});
    obj.button22:setName("button22");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setMargins({top=5});
    obj.layout13:setName("layout13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setText("Classe");
    obj.label15:setAlign("left");
    obj.label15:setWidth(50);
    obj.label15:setMargins({right=5});
    obj.label15:setName("label15");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout13);
    obj.button23:setAlign("left");
    obj.button23:setText("Aleatório");
    obj.button23:setMargins({right=5});
    obj.button23:setName("button23");

    obj.classeSelector = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.classeSelector:setParent(obj.layout13);
    obj.classeSelector:setAlign("client");
    obj.classeSelector:setName("classeSelector");
    obj.classeSelector:setField("classeSelector");
    obj.classeSelector:setItems({});
    obj.classeSelector:setValues({});

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(175);
    obj.layout14:setMargins({top=5});
    obj.layout14:setName("layout14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(270);
    obj.layout15:setName("layout15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout16);
    obj.label16:setAlign("left");
    obj.label16:setText("");
    obj.label16:setWidth(40);
    obj.label16:setMargins({right=5});
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout16);
    obj.label17:setAlign("left");
    obj.label17:setText("Total");
    obj.label17:setWidth(40);
    obj.label17:setMargins({right=5});
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout16);
    obj.label18:setAlign("left");
    obj.label18:setText("Inicial");
    obj.label18:setWidth(40);
    obj.label18:setMargins({right=5});
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout16);
    obj.label19:setAlign("left");
    obj.label19:setText("NEP");
    obj.label19:setWidth(40);
    obj.label19:setMargins({right=5});
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout16);
    obj.label20:setAlign("left");
    obj.label20:setText("Raça");
    obj.label20:setWidth(40);
    obj.label20:setMargins({right=5});
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout16);
    obj.label21:setAlign("left");
    obj.label21:setText("Extra");
    obj.label21:setWidth(40);
    obj.label21:setMargins({right=5});
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout17);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setMargins({right=5});
    obj.rectangle9:setName("rectangle9");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle9);
    obj.label22:setText("For");
    obj.label22:setAlign("client");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout17);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setMargins({right=5});
    obj.rectangle10:setName("rectangle10");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle10);
    obj.label23:setField("totalFor");
    obj.label23:setAlign("client");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout17);
    obj.edit1:setField("inicialFor");
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(40);
    obj.edit1:setMargins({right=5});
    obj.edit1:setType("number");
    obj.edit1:setMin(1);
    obj.edit1:setMax(18);
    obj.edit1:setName("edit1");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setMargins({right=5});
    obj.rectangle11:setName("rectangle11");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle11);
    obj.label24:setField("nepFor");
    obj.label24:setAlign("client");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout17);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setMargins({right=5});
    obj.rectangle12:setName("rectangle12");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle12);
    obj.label25:setField("racaFor");
    obj.label25:setAlign("client");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout17);
    obj.edit2:setField("extraFor");
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(40);
    obj.edit2:setMargins({right=5});
    obj.edit2:setName("edit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout15);
    obj.dataLink1:setFields({'inicialFor','nepFor','racaFor'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout15);
    obj.dataLink2:setFields({'extraFor'});
    obj.dataLink2:setName("dataLink2");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout18);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setMargins({right=5});
    obj.rectangle13:setName("rectangle13");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle13);
    obj.label26:setText("Des");
    obj.label26:setAlign("client");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout18);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(40);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setMargins({right=5});
    obj.rectangle14:setName("rectangle14");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle14);
    obj.label27:setField("totalDes");
    obj.label27:setAlign("client");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout18);
    obj.edit3:setField("inicialDes");
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(40);
    obj.edit3:setMargins({right=5});
    obj.edit3:setType("number");
    obj.edit3:setMin(1);
    obj.edit3:setMax(18);
    obj.edit3:setName("edit3");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout18);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setMargins({right=5});
    obj.rectangle15:setName("rectangle15");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle15);
    obj.label28:setField("nepDes");
    obj.label28:setAlign("client");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout18);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setMargins({right=5});
    obj.rectangle16:setName("rectangle16");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle16);
    obj.label29:setField("racaDes");
    obj.label29:setAlign("client");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout18);
    obj.edit4:setField("extraDes");
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(40);
    obj.edit4:setMargins({right=5});
    obj.edit4:setName("edit4");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout15);
    obj.dataLink3:setFields({'inicialDes','nepDes','racaDes'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout15);
    obj.dataLink4:setFields({'extraDes'});
    obj.dataLink4:setName("dataLink4");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout19);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(40);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setMargins({right=5});
    obj.rectangle17:setName("rectangle17");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle17);
    obj.label30:setText("Con");
    obj.label30:setAlign("client");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout19);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setMargins({right=5});
    obj.rectangle18:setName("rectangle18");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle18);
    obj.label31:setField("totalCon");
    obj.label31:setAlign("client");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout19);
    obj.edit5:setField("inicialCon");
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(40);
    obj.edit5:setMargins({right=5});
    obj.edit5:setType("number");
    obj.edit5:setMin(1);
    obj.edit5:setMax(18);
    obj.edit5:setName("edit5");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout19);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setMargins({right=5});
    obj.rectangle19:setName("rectangle19");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle19);
    obj.label32:setField("nepCon");
    obj.label32:setAlign("client");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout19);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setMargins({right=5});
    obj.rectangle20:setName("rectangle20");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle20);
    obj.label33:setField("racaCon");
    obj.label33:setAlign("client");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout19);
    obj.edit6:setField("extraCon");
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(40);
    obj.edit6:setMargins({right=5});
    obj.edit6:setName("edit6");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout15);
    obj.dataLink5:setFields({'inicialCon','nepCon','racaCon'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout15);
    obj.dataLink6:setFields({'extraCon'});
    obj.dataLink6:setName("dataLink6");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout15);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout20);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setMargins({right=5});
    obj.rectangle21:setName("rectangle21");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle21);
    obj.label34:setText("Int");
    obj.label34:setAlign("client");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout20);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setMargins({right=5});
    obj.rectangle22:setName("rectangle22");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle22);
    obj.label35:setField("totalInt");
    obj.label35:setAlign("client");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout20);
    obj.edit7:setField("inicialInt");
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(40);
    obj.edit7:setMargins({right=5});
    obj.edit7:setType("number");
    obj.edit7:setMin(1);
    obj.edit7:setMax(18);
    obj.edit7:setName("edit7");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout20);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setMargins({right=5});
    obj.rectangle23:setName("rectangle23");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle23);
    obj.label36:setField("nepInt");
    obj.label36:setAlign("client");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout20);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(40);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setMargins({right=5});
    obj.rectangle24:setName("rectangle24");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle24);
    obj.label37:setField("racaInt");
    obj.label37:setAlign("client");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout20);
    obj.edit8:setField("extraInt");
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(40);
    obj.edit8:setMargins({right=5});
    obj.edit8:setName("edit8");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout15);
    obj.dataLink7:setFields({'inicialInt','nepInt','racaInt'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout15);
    obj.dataLink8:setFields({'extraInt'});
    obj.dataLink8:setName("dataLink8");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout15);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout21);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(40);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setMargins({right=5});
    obj.rectangle25:setName("rectangle25");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle25);
    obj.label38:setText("Sab");
    obj.label38:setAlign("client");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout21);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(40);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setMargins({right=5});
    obj.rectangle26:setName("rectangle26");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle26);
    obj.label39:setField("totalSab");
    obj.label39:setAlign("client");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout21);
    obj.edit9:setField("inicialSab");
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(40);
    obj.edit9:setMargins({right=5});
    obj.edit9:setType("number");
    obj.edit9:setMin(1);
    obj.edit9:setMax(18);
    obj.edit9:setName("edit9");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout21);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(40);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setMargins({right=5});
    obj.rectangle27:setName("rectangle27");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle27);
    obj.label40:setField("nepSab");
    obj.label40:setAlign("client");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout21);
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(40);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setMargins({right=5});
    obj.rectangle28:setName("rectangle28");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle28);
    obj.label41:setField("racaSab");
    obj.label41:setAlign("client");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout21);
    obj.edit10:setField("extraSab");
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(40);
    obj.edit10:setMargins({right=5});
    obj.edit10:setName("edit10");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout15);
    obj.dataLink9:setFields({'inicialSab','nepSab','racaSab'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout15);
    obj.dataLink10:setFields({'extraSab'});
    obj.dataLink10:setName("dataLink10");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout15);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout22);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(40);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setMargins({right=5});
    obj.rectangle29:setName("rectangle29");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle29);
    obj.label42:setText("Car");
    obj.label42:setAlign("client");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout22);
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(40);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setMargins({right=5});
    obj.rectangle30:setName("rectangle30");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle30);
    obj.label43:setField("totalCar");
    obj.label43:setAlign("client");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout22);
    obj.edit11:setField("inicialCar");
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(40);
    obj.edit11:setMargins({right=5});
    obj.edit11:setType("number");
    obj.edit11:setMin(1);
    obj.edit11:setMax(18);
    obj.edit11:setName("edit11");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout22);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(40);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setMargins({right=5});
    obj.rectangle31:setName("rectangle31");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle31);
    obj.label44:setField("nepCar");
    obj.label44:setAlign("client");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout22);
    obj.rectangle32:setAlign("left");
    obj.rectangle32:setWidth(40);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setMargins({right=5});
    obj.rectangle32:setName("rectangle32");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle32);
    obj.label45:setField("racaCar");
    obj.label45:setAlign("client");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout22);
    obj.edit12:setField("extraCar");
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(40);
    obj.edit12:setMargins({right=5});
    obj.edit12:setName("edit12");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout15);
    obj.dataLink11:setFields({'inicialCar','nepCar','racaCar'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout15);
    obj.dataLink12:setFields({'extraCar'});
    obj.dataLink12:setName("dataLink12");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout14);
    obj.textEditor1:setAlign("left");
    obj.textEditor1:setWidth(150);
    obj.textEditor1:setField("atributeExtra");
    obj.textEditor1:setMargins({top=25});
    obj.textEditor1:setName("textEditor1");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout14);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(100);
    obj.layout23:setName("layout23");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout23);
    obj.label46:setAlign("top");
    obj.label46:setText("");
    obj.label46:setHeight(25);
    obj.label46:setName("label46");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout24);
    obj.label47:setAlign("left");
    obj.label47:setWidth(50);
    obj.label47:setText("Nv. 4");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout24);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setField("nv4");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setName("comboBox1");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout23);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout25);
    obj.label48:setAlign("left");
    obj.label48:setWidth(50);
    obj.label48:setText("Nv. 8");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout25);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setField("nv8");
    obj.comboBox2:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox2:setName("comboBox2");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout23);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout26);
    obj.label49:setAlign("left");
    obj.label49:setWidth(50);
    obj.label49:setText("Nv. 12");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout26);
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setField("nv12");
    obj.comboBox3:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox3:setName("comboBox3");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout23);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout27);
    obj.label50:setAlign("left");
    obj.label50:setWidth(50);
    obj.label50:setText("Nv. 16");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout27);
    obj.comboBox4:setAlign("client");
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setField("nv16");
    obj.comboBox4:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox4:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox4:setName("comboBox4");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout23);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout28);
    obj.label51:setAlign("left");
    obj.label51:setWidth(50);
    obj.label51:setText("Nv. 20");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout28);
    obj.comboBox5:setAlign("client");
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setField("nv20");
    obj.comboBox5:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox5:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout23);
    obj.dataLink13:setFields({'nv4','nv8','nv12','nv16','nv20','lvl'});
    obj.dataLink13:setName("dataLink13");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout14);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(100);
    obj.layout29:setName("layout29");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout29);
    obj.label52:setAlign("top");
    obj.label52:setText("");
    obj.label52:setHeight(25);
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout29);
    obj.label53:setAlign("top");
    obj.label53:setField("atrPointBuy");
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout29);
    obj.label54:setAlign("top");
    obj.label54:setField("atrTotal");
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout14);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(150);
    obj.layout30:setName("layout30");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout30);
    obj.label55:setAlign("top");
    obj.label55:setText("");
    obj.label55:setHeight(25);
    obj.label55:setName("label55");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout31);
    obj.label56:setAlign("left");
    obj.label56:setWidth(75);
    obj.label56:setText("BBA");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout31);
    obj.label57:setAlign("left");
    obj.label57:setWidth(75);
    obj.label57:setField("bba");
    obj.label57:setName("label57");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout32);
    obj.label58:setAlign("left");
    obj.label58:setWidth(75);
    obj.label58:setText("Fort");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout32);
    obj.label59:setAlign("left");
    obj.label59:setWidth(75);
    obj.label59:setField("baseFort");
    obj.label59:setName("label59");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout33);
    obj.label60:setAlign("left");
    obj.label60:setWidth(75);
    obj.label60:setText("Ref");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout33);
    obj.label61:setAlign("left");
    obj.label61:setWidth(75);
    obj.label61:setField("baseRef");
    obj.label61:setName("label61");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout30);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout34);
    obj.label62:setAlign("left");
    obj.label62:setWidth(75);
    obj.label62:setText("Von");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout34);
    obj.label63:setAlign("left");
    obj.label63:setWidth(75);
    obj.label63:setField("baseVon");
    obj.label63:setName("label63");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout30);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout35);
    obj.label64:setAlign("left");
    obj.label64:setWidth(75);
    obj.label64:setText("DVs");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout35);
    obj.label65:setAlign("left");
    obj.label65:setWidth(75);
    obj.label65:setField("dvs");
    obj.label65:setName("label65");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout14);
    obj.dataLink14:setFields({'inicialFor','inicialDes','inicialCon','inicialInt','inicialSab','inicialCar'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout14);
    obj.dataLink15:setFields({'totalCon'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout14);
    obj.dataLink16:setFields({'totalInt'});
    obj.dataLink16:setName("dataLink16");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox2);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxColumns(3);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setMargins({top=5});
    obj.flowLayout2:setName("flowLayout2");

    obj.campoDasRacasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasRacasPart:setParent(obj.flowLayout2);
    obj.campoDasRacasPart:setMinWidth(300);
    obj.campoDasRacasPart:setMaxWidth(600);
    obj.campoDasRacasPart:setHeight(25);
    obj.campoDasRacasPart:setMinScaledWidth(280);
    obj.campoDasRacasPart:setName("campoDasRacasPart");
    obj.campoDasRacasPart:setAdjustHeightToLine(false);
    obj.campoDasRacasPart:setMargins({left=5});


					rawset(self.campoDasRacasPart, "_recalcHeight", 					
						function ()
							self.campoDasRacasPart.height = self.campoDasRacas.height + 25;
						end);
				


    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.campoDasRacasPart);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle33);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout36);
    obj.label66:setText("CARACTERISTICAS RACIAIS");
    obj.label66:setAlign("left");
    obj.label66:setWidth(225);
    obj.label66:setMargins({left=5});
    obj.label66:setName("label66");

    obj.campoDasRacas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasRacas:setParent(obj.rectangle33);
    obj.campoDasRacas:setName("campoDasRacas");
    obj.campoDasRacas:setField("campoDasRacas");
    obj.campoDasRacas:setTemplateForm("frmGeneratorAbility");
    obj.campoDasRacas:setAlign("top");
    obj.campoDasRacas:setLayout("vertical");
    obj.campoDasRacas:setAutoHeight(true);
    obj.campoDasRacas:setHitTest(false);
    obj.campoDasRacas:setMinQt(0);

    obj.campoDasCaracteristicasClassePart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasCaracteristicasClassePart:setParent(obj.flowLayout2);
    obj.campoDasCaracteristicasClassePart:setMinWidth(300);
    obj.campoDasCaracteristicasClassePart:setMaxWidth(600);
    obj.campoDasCaracteristicasClassePart:setHeight(25);
    obj.campoDasCaracteristicasClassePart:setMinScaledWidth(280);
    obj.campoDasCaracteristicasClassePart:setName("campoDasCaracteristicasClassePart");
    obj.campoDasCaracteristicasClassePart:setAdjustHeightToLine(false);
    obj.campoDasCaracteristicasClassePart:setMargins({left=5});


					rawset(self.campoDasCaracteristicasClassePart, "_recalcHeight", 					
						function ()
							self.campoDasCaracteristicasClassePart.height = self.campoDasCaracteristicasClasse.height + 25;
						end);
				


    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.campoDasCaracteristicasClassePart);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle34);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout37);
    obj.label67:setText("CARACTERISTICAS DE CLASSE");
    obj.label67:setAlign("left");
    obj.label67:setWidth(225);
    obj.label67:setMargins({left=5});
    obj.label67:setName("label67");

    obj.campoDasCaracteristicasClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasCaracteristicasClasse:setParent(obj.rectangle34);
    obj.campoDasCaracteristicasClasse:setName("campoDasCaracteristicasClasse");
    obj.campoDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.campoDasCaracteristicasClasse:setTemplateForm("frmGeneratorAbility");
    obj.campoDasCaracteristicasClasse:setAlign("top");
    obj.campoDasCaracteristicasClasse:setLayout("vertical");
    obj.campoDasCaracteristicasClasse:setAutoHeight(true);
    obj.campoDasCaracteristicasClasse:setHitTest(false);
    obj.campoDasCaracteristicasClasse:setMinQt(0);

    obj.campoDosTalentosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosTalentosPart:setParent(obj.flowLayout2);
    obj.campoDosTalentosPart:setMinWidth(300);
    obj.campoDosTalentosPart:setMaxWidth(600);
    obj.campoDosTalentosPart:setHeight(25);
    obj.campoDosTalentosPart:setMinScaledWidth(280);
    obj.campoDosTalentosPart:setName("campoDosTalentosPart");
    obj.campoDosTalentosPart:setAdjustHeightToLine(false);
    obj.campoDosTalentosPart:setMargins({left=5});


					rawset(self.campoDosTalentosPart, "_recalcHeight", 					
						function ()
							self.campoDosTalentosPart.height = self.campoDosTalentos.height + 25;
						end);
				


    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.campoDosTalentosPart);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle35);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout38);
    obj.label68:setText("TALENTOS");
    obj.label68:setAlign("left");
    obj.label68:setWidth(225);
    obj.label68:setMargins({left=5});
    obj.label68:setName("label68");

    obj.campoDosTalentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosTalentos:setParent(obj.rectangle35);
    obj.campoDosTalentos:setName("campoDosTalentos");
    obj.campoDosTalentos:setField("campoDosTalentos");
    obj.campoDosTalentos:setTemplateForm("frmGeneratorFeat");
    obj.campoDosTalentos:setAlign("top");
    obj.campoDosTalentos:setLayout("vertical");
    obj.campoDosTalentos:setAutoHeight(true);
    obj.campoDosTalentos:setHitTest(false);
    obj.campoDosTalentos:setMinQt(0);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.frmSkills = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSkills:setParent(obj.tab2);
    obj.frmSkills:setName("frmSkills");
    obj.frmSkills:setAlign("client");


		


    obj.popLanguageSelection = GUI.fromHandle(_obj_newObject("popup"));
    obj.popLanguageSelection:setParent(obj.frmSkills);
    obj.popLanguageSelection:setName("popLanguageSelection");
    obj.popLanguageSelection:setAlign("client");
    obj.popLanguageSelection:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popLanguageSelection, "autoScopeNode",  "false");
    obj.popLanguageSelection:setMargins({left=50,right=50,top=50,bottom=50});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.popLanguageSelection);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.scrollBox3);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxColumns(4);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setAvoidScale(true);
    obj.flowLayout3:setName("flowLayout3");

    obj.LanguageParaisoPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageParaisoPart:setParent(obj.flowLayout3);
    obj.LanguageParaisoPart:setMinWidth(300);
    obj.LanguageParaisoPart:setMaxWidth(600);
    obj.LanguageParaisoPart:setHeight(25);
    obj.LanguageParaisoPart:setMinScaledWidth(280);
    obj.LanguageParaisoPart:setName("LanguageParaisoPart");
    obj.LanguageParaisoPart:setAdjustHeightToLine(false);
    obj.LanguageParaisoPart:setMargins({left=5});


					rawset(self.LanguageParaisoPart, "_recalcHeight", 					
						function ()
							self.LanguageParaisoPart.height = self.LanguageParaiso.height + 25;
						end);
				


    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.LanguageParaisoPart);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle36);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout39);
    obj.label69:setText("Paraiso");
    obj.label69:setAlign("left");
    obj.label69:setWidth(225);
    obj.label69:setMargins({left=5});
    obj.label69:setName("label69");

    obj.LanguageParaiso = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageParaiso:setParent(obj.rectangle36);
    obj.LanguageParaiso:setName("LanguageParaiso");
    obj.LanguageParaiso:setField("LanguageParaiso");
    obj.LanguageParaiso:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageParaiso:setAlign("top");
    obj.LanguageParaiso:setLayout("vertical");
    obj.LanguageParaiso:setAutoHeight(true);
    obj.LanguageParaiso:setHitTest(false);
    obj.LanguageParaiso:setMinQt(0);

    obj.LanguageEfiriaPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageEfiriaPart:setParent(obj.flowLayout3);
    obj.LanguageEfiriaPart:setMinWidth(300);
    obj.LanguageEfiriaPart:setMaxWidth(600);
    obj.LanguageEfiriaPart:setHeight(25);
    obj.LanguageEfiriaPart:setMinScaledWidth(280);
    obj.LanguageEfiriaPart:setName("LanguageEfiriaPart");
    obj.LanguageEfiriaPart:setAdjustHeightToLine(false);
    obj.LanguageEfiriaPart:setMargins({left=5});


					rawset(self.LanguageEfiriaPart, "_recalcHeight", 					
						function ()
							self.LanguageEfiriaPart.height = self.LanguageEfiria.height + 25;
						end);
				


    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.LanguageEfiriaPart);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle37);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout40);
    obj.label70:setText("Efiria");
    obj.label70:setAlign("left");
    obj.label70:setWidth(225);
    obj.label70:setMargins({left=5});
    obj.label70:setName("label70");

    obj.LanguageEfiria = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageEfiria:setParent(obj.rectangle37);
    obj.LanguageEfiria:setName("LanguageEfiria");
    obj.LanguageEfiria:setField("LanguageEfiria");
    obj.LanguageEfiria:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageEfiria:setAlign("top");
    obj.LanguageEfiria:setLayout("vertical");
    obj.LanguageEfiria:setAutoHeight(true);
    obj.LanguageEfiria:setHitTest(false);
    obj.LanguageEfiria:setMinQt(0);

    obj.LanguageCentelhaPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageCentelhaPart:setParent(obj.flowLayout3);
    obj.LanguageCentelhaPart:setMinWidth(300);
    obj.LanguageCentelhaPart:setMaxWidth(600);
    obj.LanguageCentelhaPart:setHeight(25);
    obj.LanguageCentelhaPart:setMinScaledWidth(280);
    obj.LanguageCentelhaPart:setName("LanguageCentelhaPart");
    obj.LanguageCentelhaPart:setAdjustHeightToLine(false);
    obj.LanguageCentelhaPart:setMargins({left=5});


					rawset(self.LanguageCentelhaPart, "_recalcHeight", 					
						function ()
							self.LanguageCentelhaPart.height = self.LanguageCentelha.height + 25;
						end);
				


    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.LanguageCentelhaPart);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle38);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout41);
    obj.label71:setText("Centelha");
    obj.label71:setAlign("left");
    obj.label71:setWidth(225);
    obj.label71:setMargins({left=5});
    obj.label71:setName("label71");

    obj.LanguageCentelha = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageCentelha:setParent(obj.rectangle38);
    obj.LanguageCentelha:setName("LanguageCentelha");
    obj.LanguageCentelha:setField("LanguageCentelha");
    obj.LanguageCentelha:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageCentelha:setAlign("top");
    obj.LanguageCentelha:setLayout("vertical");
    obj.LanguageCentelha:setAutoHeight(true);
    obj.LanguageCentelha:setHitTest(false);
    obj.LanguageCentelha:setMinQt(0);

    obj.LanguageSobAlecPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageSobAlecPart:setParent(obj.flowLayout3);
    obj.LanguageSobAlecPart:setMinWidth(300);
    obj.LanguageSobAlecPart:setMaxWidth(600);
    obj.LanguageSobAlecPart:setHeight(25);
    obj.LanguageSobAlecPart:setMinScaledWidth(280);
    obj.LanguageSobAlecPart:setName("LanguageSobAlecPart");
    obj.LanguageSobAlecPart:setAdjustHeightToLine(false);
    obj.LanguageSobAlecPart:setMargins({left=5});


					rawset(self.LanguageSobAlecPart, "_recalcHeight", 					
						function ()
							self.LanguageSobAlecPart.height = self.LanguageSobAlec.height + 25;
						end);
				


    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.LanguageSobAlecPart);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle39);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout42);
    obj.label72:setText("SobAlec");
    obj.label72:setAlign("left");
    obj.label72:setWidth(225);
    obj.label72:setMargins({left=5});
    obj.label72:setName("label72");

    obj.LanguageSobAlec = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageSobAlec:setParent(obj.rectangle39);
    obj.LanguageSobAlec:setName("LanguageSobAlec");
    obj.LanguageSobAlec:setField("LanguageSobAlec");
    obj.LanguageSobAlec:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageSobAlec:setAlign("top");
    obj.LanguageSobAlec:setLayout("vertical");
    obj.LanguageSobAlec:setAutoHeight(true);
    obj.LanguageSobAlec:setHitTest(false);
    obj.LanguageSobAlec:setMinQt(0);

    obj.LanguageArdealPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageArdealPart:setParent(obj.flowLayout3);
    obj.LanguageArdealPart:setMinWidth(300);
    obj.LanguageArdealPart:setMaxWidth(600);
    obj.LanguageArdealPart:setHeight(25);
    obj.LanguageArdealPart:setMinScaledWidth(280);
    obj.LanguageArdealPart:setName("LanguageArdealPart");
    obj.LanguageArdealPart:setAdjustHeightToLine(false);
    obj.LanguageArdealPart:setMargins({left=5});


					rawset(self.LanguageArdealPart, "_recalcHeight", 					
						function ()
							self.LanguageArdealPart.height = self.LanguageArdeal.height + 25;
						end);
				


    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.LanguageArdealPart);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle40);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout43);
    obj.label73:setText("Ardeal");
    obj.label73:setAlign("left");
    obj.label73:setWidth(225);
    obj.label73:setMargins({left=5});
    obj.label73:setName("label73");

    obj.LanguageArdeal = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageArdeal:setParent(obj.rectangle40);
    obj.LanguageArdeal:setName("LanguageArdeal");
    obj.LanguageArdeal:setField("LanguageArdeal");
    obj.LanguageArdeal:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageArdeal:setAlign("top");
    obj.LanguageArdeal:setLayout("vertical");
    obj.LanguageArdeal:setAutoHeight(true);
    obj.LanguageArdeal:setHitTest(false);
    obj.LanguageArdeal:setMinQt(0);

    obj.LanguageAbismoPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageAbismoPart:setParent(obj.flowLayout3);
    obj.LanguageAbismoPart:setMinWidth(300);
    obj.LanguageAbismoPart:setMaxWidth(600);
    obj.LanguageAbismoPart:setHeight(25);
    obj.LanguageAbismoPart:setMinScaledWidth(280);
    obj.LanguageAbismoPart:setName("LanguageAbismoPart");
    obj.LanguageAbismoPart:setAdjustHeightToLine(false);
    obj.LanguageAbismoPart:setMargins({left=5});


					rawset(self.LanguageAbismoPart, "_recalcHeight", 					
						function ()
							self.LanguageAbismoPart.height = self.LanguageAbismo.height + 25;
						end);
				


    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.LanguageAbismoPart);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle41);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout44);
    obj.label74:setText("Abismo");
    obj.label74:setAlign("left");
    obj.label74:setWidth(225);
    obj.label74:setMargins({left=5});
    obj.label74:setName("label74");

    obj.LanguageAbismo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageAbismo:setParent(obj.rectangle41);
    obj.LanguageAbismo:setName("LanguageAbismo");
    obj.LanguageAbismo:setField("LanguageAbismo");
    obj.LanguageAbismo:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageAbismo:setAlign("top");
    obj.LanguageAbismo:setLayout("vertical");
    obj.LanguageAbismo:setAutoHeight(true);
    obj.LanguageAbismo:setHitTest(false);
    obj.LanguageAbismo:setMinQt(0);

    obj.LanguageDiafelePart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageDiafelePart:setParent(obj.flowLayout3);
    obj.LanguageDiafelePart:setMinWidth(300);
    obj.LanguageDiafelePart:setMaxWidth(600);
    obj.LanguageDiafelePart:setHeight(25);
    obj.LanguageDiafelePart:setMinScaledWidth(280);
    obj.LanguageDiafelePart:setName("LanguageDiafelePart");
    obj.LanguageDiafelePart:setAdjustHeightToLine(false);
    obj.LanguageDiafelePart:setMargins({left=5});


					rawset(self.LanguageDiafelePart, "_recalcHeight", 					
						function ()
							self.LanguageDiafelePart.height = self.LanguageDiafele.height + 25;
						end);
				


    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.LanguageDiafelePart);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle42);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout45);
    obj.label75:setText("Diafele");
    obj.label75:setAlign("left");
    obj.label75:setWidth(225);
    obj.label75:setMargins({left=5});
    obj.label75:setName("label75");

    obj.LanguageDiafele = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageDiafele:setParent(obj.rectangle42);
    obj.LanguageDiafele:setName("LanguageDiafele");
    obj.LanguageDiafele:setField("LanguageDiafele");
    obj.LanguageDiafele:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageDiafele:setAlign("top");
    obj.LanguageDiafele:setLayout("vertical");
    obj.LanguageDiafele:setAutoHeight(true);
    obj.LanguageDiafele:setHitTest(false);
    obj.LanguageDiafele:setMinQt(0);

    obj.LanguageInfernoPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageInfernoPart:setParent(obj.flowLayout3);
    obj.LanguageInfernoPart:setMinWidth(300);
    obj.LanguageInfernoPart:setMaxWidth(600);
    obj.LanguageInfernoPart:setHeight(25);
    obj.LanguageInfernoPart:setMinScaledWidth(280);
    obj.LanguageInfernoPart:setName("LanguageInfernoPart");
    obj.LanguageInfernoPart:setAdjustHeightToLine(false);
    obj.LanguageInfernoPart:setMargins({left=5});


					rawset(self.LanguageInfernoPart, "_recalcHeight", 					
						function ()
							self.LanguageInfernoPart.height = self.LanguageInferno.height + 25;
						end);
				


    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.LanguageInfernoPart);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle43);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout46);
    obj.label76:setText("Inferno");
    obj.label76:setAlign("left");
    obj.label76:setWidth(225);
    obj.label76:setMargins({left=5});
    obj.label76:setName("label76");

    obj.LanguageInferno = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageInferno:setParent(obj.rectangle43);
    obj.LanguageInferno:setName("LanguageInferno");
    obj.LanguageInferno:setField("LanguageInferno");
    obj.LanguageInferno:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageInferno:setAlign("top");
    obj.LanguageInferno:setLayout("vertical");
    obj.LanguageInferno:setAutoHeight(true);
    obj.LanguageInferno:setHitTest(false);
    obj.LanguageInferno:setMinQt(0);

    obj.LanguageOutrosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.LanguageOutrosPart:setParent(obj.flowLayout3);
    obj.LanguageOutrosPart:setMinWidth(300);
    obj.LanguageOutrosPart:setMaxWidth(600);
    obj.LanguageOutrosPart:setHeight(25);
    obj.LanguageOutrosPart:setMinScaledWidth(280);
    obj.LanguageOutrosPart:setName("LanguageOutrosPart");
    obj.LanguageOutrosPart:setAdjustHeightToLine(false);
    obj.LanguageOutrosPart:setMargins({left=5});


					rawset(self.LanguageOutrosPart, "_recalcHeight", 					
						function ()
							self.LanguageOutrosPart.height = self.LanguageOutros.height + 25;
						end);
				


    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.LanguageOutrosPart);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle44);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout47);
    obj.label77:setText("Outros");
    obj.label77:setAlign("left");
    obj.label77:setWidth(225);
    obj.label77:setMargins({left=5});
    obj.label77:setName("label77");

    obj.LanguageOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.LanguageOutros:setParent(obj.rectangle44);
    obj.LanguageOutros:setName("LanguageOutros");
    obj.LanguageOutros:setField("LanguageOutros");
    obj.LanguageOutros:setTemplateForm("frmGeneratorLanguageSelector");
    obj.LanguageOutros:setAlign("top");
    obj.LanguageOutros:setLayout("vertical");
    obj.LanguageOutros:setAutoHeight(true);
    obj.LanguageOutros:setHitTest(false);
    obj.LanguageOutros:setMinQt(0);

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.frmSkills);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(650);
    obj.layout48:setName("layout48");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.layout48);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox4);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout49);
    obj.button24:setAlign("left");
    obj.button24:setWidth(100);
    obj.button24:setText("Add Perícia");
    obj.button24:setName("button24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout49);
    obj.button25:setAlign("left");
    obj.button25:setWidth(100);
    obj.button25:setText("Max Class");
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout49);
    obj.button26:setAlign("left");
    obj.button26:setWidth(100);
    obj.button26:setText("Aleatorio");
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout49);
    obj.button27:setAlign("left");
    obj.button27:setWidth(100);
    obj.button27:setText("Limpar");
    obj.button27:setName("button27");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout49);
    obj.label78:setAlign("left");
    obj.label78:setWidth(100);
    obj.label78:setText("Pontos: ");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout49);
    obj.label79:setAlign("left");
    obj.label79:setWidth(30);
    obj.label79:setField("pontosPericia");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout49);
    obj.label80:setAlign("left");
    obj.label80:setWidth(10);
    obj.label80:setText("/");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout49);
    obj.label81:setAlign("left");
    obj.label81:setWidth(30);
    obj.label81:setField("skillsMax");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.scrollBox4);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxColumns(3);
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setOrientation("vertical");
    obj.flowLayout4:setAvoidScale(true);
    obj.flowLayout4:setMargins({top=5});
    obj.flowLayout4:setName("flowLayout4");

    obj.rclListaDasPericiasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclListaDasPericiasPart:setParent(obj.flowLayout4);
    obj.rclListaDasPericiasPart:setMinWidth(300);
    obj.rclListaDasPericiasPart:setMaxWidth(600);
    obj.rclListaDasPericiasPart:setHeight(25);
    obj.rclListaDasPericiasPart:setMinScaledWidth(280);
    obj.rclListaDasPericiasPart:setName("rclListaDasPericiasPart");
    obj.rclListaDasPericiasPart:setAdjustHeightToLine(false);
    obj.rclListaDasPericiasPart:setMargins({left=5});


					rawset(self.rclListaDasPericiasPart, "_recalcHeight", 					
						function ()
							self.rclListaDasPericiasPart.height = self.rclListaDasPericias.height + 25;
						end);
				


    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.rclListaDasPericiasPart);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle45);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout50);
    obj.label82:setText("PERÍCIAS");
    obj.label82:setAlign("left");
    obj.label82:setWidth(225);
    obj.label82:setMargins({left=5});
    obj.label82:setName("label82");

    obj.rclListaDasPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.rectangle45);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmGeneratorSkill");
    obj.rclListaDasPericias:setAlign("top");
    obj.rclListaDasPericias:setLayout("vertical");
    obj.rclListaDasPericias:setAutoHeight(true);
    obj.rclListaDasPericias:setHitTest(false);
    obj.rclListaDasPericias:setMinQt(0);

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.frmSkills);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(500);
    obj.layout51:setName("layout51");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.layout51);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox5);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout52);
    obj.button28:setAlign("left");
    obj.button28:setWidth(100);
    obj.button28:setText("Add Idioma");
    obj.button28:setName("button28");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout52);
    obj.label83:setAlign("left");
    obj.label83:setWidth(100);
    obj.label83:setField("languageInitial");
    obj.label83:setName("label83");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.scrollBox5);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxColumns(3);
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setOrientation("vertical");
    obj.flowLayout5:setAvoidScale(true);
    obj.flowLayout5:setMargins({top=5});
    obj.flowLayout5:setName("flowLayout5");

    obj.rclListaDosIdiomasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclListaDosIdiomasPart:setParent(obj.flowLayout5);
    obj.rclListaDosIdiomasPart:setMinWidth(300);
    obj.rclListaDosIdiomasPart:setMaxWidth(600);
    obj.rclListaDosIdiomasPart:setHeight(25);
    obj.rclListaDosIdiomasPart:setMinScaledWidth(280);
    obj.rclListaDosIdiomasPart:setName("rclListaDosIdiomasPart");
    obj.rclListaDosIdiomasPart:setAdjustHeightToLine(false);
    obj.rclListaDosIdiomasPart:setMargins({left=5});


					rawset(self.rclListaDosIdiomasPart, "_recalcHeight", 					
						function ()
							self.rclListaDosIdiomasPart.height = self.rclListaDosIdiomas.height + 25;
						end);
				


    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.rclListaDosIdiomasPart);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle46);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout53);
    obj.label84:setText("IDIOMAS");
    obj.label84:setAlign("left");
    obj.label84:setWidth(225);
    obj.label84:setMargins({left=5});
    obj.label84:setName("label84");

    obj.rclListaDosIdiomas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosIdiomas:setParent(obj.rectangle46);
    obj.rclListaDosIdiomas:setName("rclListaDosIdiomas");
    obj.rclListaDosIdiomas:setField("campoDosIdiomas");
    obj.rclListaDosIdiomas:setTemplateForm("frmGeneratorLanguage");
    obj.rclListaDosIdiomas:setAlign("top");
    obj.rclListaDosIdiomas:setLayout("vertical");
    obj.rclListaDosIdiomas:setAutoHeight(true);
    obj.rclListaDosIdiomas:setHitTest(false);
    obj.rclListaDosIdiomas:setMinQt(0);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Magias");
    obj.tab3:setName("tab3");

    obj.frmSpells = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSpells:setParent(obj.tab3);
    obj.frmSpells:setName("frmSpells");
    obj.frmSpells:setAlign("client");


		


    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.frmSpells);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(650);
    obj.layout54:setName("layout54");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.layout54);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.scrollBox6);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxColumns(3);
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setOrientation("vertical");
    obj.flowLayout6:setAvoidScale(true);
    obj.flowLayout6:setMargins({top=5});
    obj.flowLayout6:setName("flowLayout6");

    obj.rclListaDasClassesMagicasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclListaDasClassesMagicasPart:setParent(obj.flowLayout6);
    obj.rclListaDasClassesMagicasPart:setMinWidth(300);
    obj.rclListaDasClassesMagicasPart:setMaxWidth(600);
    obj.rclListaDasClassesMagicasPart:setHeight(25);
    obj.rclListaDasClassesMagicasPart:setMinScaledWidth(280);
    obj.rclListaDasClassesMagicasPart:setName("rclListaDasClassesMagicasPart");
    obj.rclListaDasClassesMagicasPart:setAdjustHeightToLine(false);
    obj.rclListaDasClassesMagicasPart:setMargins({left=5});


					rawset(self.rclListaDasClassesMagicasPart, "_recalcHeight", 					
						function ()
							self.rclListaDasClassesMagicasPart.height = self.rclListaDasClassesMagicas.height + 25;
						end);
				


    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.rclListaDasClassesMagicasPart);
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle47);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout55);
    obj.label85:setText("MAGIAS");
    obj.label85:setAlign("left");
    obj.label85:setWidth(225);
    obj.label85:setMargins({left=5});
    obj.label85:setName("label85");

    obj.rclListaDasClassesMagicas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasClassesMagicas:setParent(obj.rectangle47);
    obj.rclListaDasClassesMagicas:setName("rclListaDasClassesMagicas");
    obj.rclListaDasClassesMagicas:setField("campoDosItens");
    obj.rclListaDasClassesMagicas:setTemplateForm("frmGeneratorMagia");
    obj.rclListaDasClassesMagicas:setAlign("top");
    obj.rclListaDasClassesMagicas:setLayout("vertical");
    obj.rclListaDasClassesMagicas:setAutoHeight(true);
    obj.rclListaDasClassesMagicas:setHitTest(false);
    obj.rclListaDasClassesMagicas:setMinQt(0);

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Creditos");
    obj.tab4:setName("tab4");

    obj.frmGeneratorCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeneratorCreditos:setParent(obj.tab4);
    obj.frmGeneratorCreditos:setName("frmGeneratorCreditos");
    obj.frmGeneratorCreditos:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmGeneratorCreditos);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.scrollBox7);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.scrollBox7);
    obj.label86:setLeft(5);
    obj.label86:setTop(10);
    obj.label86:setWidth(200);
    obj.label86:setHeight(20);
    obj.label86:setText("Feito por: Vinny (Ambesek)");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.scrollBox7);
    obj.label87:setLeft(5);
    obj.label87:setTop(35);
    obj.label87:setWidth(200);
    obj.label87:setHeight(20);
    obj.label87:setText("Versão Atual: ");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setField("versionInstalled");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.scrollBox7);
    obj.label88:setLeft(5);
    obj.label88:setTop(60);
    obj.label88:setWidth(200);
    obj.label88:setHeight(20);
    obj.label88:setText("Sua Versão: ");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setField("versionDownloaded");
    obj.label88:setName("label88");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox7);
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(85);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.scrollBox7);
    obj.button29:setLeft(5);
    obj.button29:setTop(110);
    obj.button29:setWidth(100);
    obj.button29:setText("Change Log");
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.scrollBox7);
    obj.button30:setLeft(5);
    obj.button30:setTop(135);
    obj.button30:setWidth(100);
    obj.button30:setText("Atualizar");
    obj.button30:setName("button30");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.scrollBox7);
    obj.label89:setLeft(5);
    obj.label89:setTop(160);
    obj.label89:setWidth(200);
    obj.label89:setHeight(20);
    obj.label89:setText("Conheça a Mesa:");
    obj.label89:setName("label89");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.scrollBox7);
    obj.button31:setLeft(5);
    obj.button31:setTop(185);
    obj.button31:setWidth(100);
    obj.button31:setText("RPGmeister");
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.scrollBox7);
    obj.button32:setLeft(5);
    obj.button32:setTop(210);
    obj.button32:setWidth(100);
    obj.button32:setHeight(20);
    obj.button32:setText("Exportar Ficha");
    obj.button32:setName("button32");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.scope);
    obj.button33:setAlign("bottom");
    obj.button33:setHeight(25);
    obj.button33:setText("Reiniciar");
    obj.button33:setName("button33");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            -- Carrega o local sheet para ser usado. 
            		generatorSheet = NDB.load("generator.xml");
            
            		if generatorSheet.npc == nil then generatorSheet.npc = {} end;
            		self.scope:setNodeObject(generatorSheet.npc);
            
            		local json = VHD.openFile("Generator/data.json");
            		local file = {};
            		json:read(file, json.remainingBytes);
            		local str = Utils.binaryDecode(file, "utf8");
            
            		--local races = NDB.load("races.xml");
            		--races.db = decode(str);
            
            		generatorSheet.db = {};
            		generatorSheet.db = decode(str);
        end, obj);

    obj._e_event1 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/output/Ficha%20RPG%20meister.rpk?raw=true",
            			function(stream, contentType)
            				local info = Firecast.Plugins.getRPKDetails(stream);
            				generatorSheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
            				local installed = Firecast.Plugins.getInstalledPlugins();
            				local myself;
            				for i=1, #installed, 1 do
            					if installed[i].moduleId == info.moduleId then
            						myself = installed[i];
            						generatorSheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
            					end;
            				end;
            
            				rawset(generatorSheet, "stream", stream);
            
            				if generatorSheet.noUpdate==true then return end;
            				if myself~= nil and isNewVersion(myself.version, info.version) then
            					Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
            						function(selected, selectedIndex, selectedText)
            							if selected and selectedIndex == 1 then
            								local install = Firecast.Plugins.installPlugin(rawget(generatorSheet,"stream"), true);
            								if install==false then
            									GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true');
            								end;
            							elseif selected and selectedIndex == 3 then
            								generatorSheet.noUpdate = true;
            							end;
            						end);
            				end;
            			end,
            			function (errorMsg)
            				--showMessage(errorMsg);
            			end,
            			function (downloaded, total)
            				-- esta função será chamada constantemente.
            				-- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
            			end,
            			"checkForModification");
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            LevelUpdate()
        end, obj);

    obj._e_event3 = obj.popFeatSelection:addEventListener("onNodeReady",
        function (_)
            local nodes = NDB.getChildNodes(self.popFeatSelection.node.FeatCombat)
            			if #nodes > 0 then return end
            
            			local talentos = generatorSheet.db.talentos
            			local i = 1
            			while talentos ~= nil and talentos[i] ~= nil do
            				local talento = talentos[i]
            
            				local rclItem
            
            				if talento.type == "Classe" then
            					rclItem = self.FeatClass:append()
            				elseif talento.type == "Combate" then
            					rclItem = self.FeatCombat:append()
            				elseif talento.type == "Conjuração" then
            					rclItem = self.FeatCasting:append()
            				elseif talento.type == "Criação de Item" then
            					rclItem = self.FeatCreation:append()
            				elseif talento.type == "Geral" then
            					rclItem = self.FeatGeneral:append()
            				elseif talento.type == "Metamágico" then
            					rclItem = self.FeatMetamagic:append()
            				elseif talento.type == "Perícia" then
            					rclItem = self.FeatSkill:append()
            				elseif talento.type == "Raça" then
            					rclItem = self.FeatRace:append()
            				end
            
            				if rclItem ~= nil then 
            					rclItem.name = talento.name
            					rclItem.type = talento.type
            					rclItem.book = talento.book
            				end
            				i = i + 1
            			end
        end, obj);

    obj._e_event4 = obj.FeatClass:addEventListener("onResize",
        function (_)
            self.FeatClassPart._recalcHeight();
        end, obj);

    obj._e_event5 = obj.FeatClass:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event6 = obj.FeatCombat:addEventListener("onResize",
        function (_)
            self.FeatCombatPart._recalcHeight();
        end, obj);

    obj._e_event7 = obj.FeatCombat:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event8 = obj.FeatCasting:addEventListener("onResize",
        function (_)
            self.FeatCastingPart._recalcHeight();
        end, obj);

    obj._e_event9 = obj.FeatCasting:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event10 = obj.FeatCreation:addEventListener("onResize",
        function (_)
            self.FeatCreationPart._recalcHeight();
        end, obj);

    obj._e_event11 = obj.FeatCreation:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event12 = obj.FeatGeneral:addEventListener("onResize",
        function (_)
            self.FeatGeneralPart._recalcHeight();
        end, obj);

    obj._e_event13 = obj.FeatGeneral:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event14 = obj.FeatMetamagic:addEventListener("onResize",
        function (_)
            self.FeatMetamagicPart._recalcHeight();
        end, obj);

    obj._e_event15 = obj.FeatMetamagic:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event16 = obj.FeatSkill:addEventListener("onResize",
        function (_)
            self.FeatSkillPart._recalcHeight();
        end, obj);

    obj._e_event17 = obj.FeatSkill:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event18 = obj.FeatRace:addEventListener("onResize",
        function (_)
            self.FeatRacePart._recalcHeight();
        end, obj);

    obj._e_event19 = obj.FeatRace:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event20 = obj.button2:addEventListener("onClick",
        function (_)
            filterRaces("Geral")
        end, obj);

    obj._e_event21 = obj.button3:addEventListener("onClick",
        function (_)
            filterRaces("Oficial")
        end, obj);

    obj._e_event22 = obj.button4:addEventListener("onClick",
        function (_)
            filterRaces("Paraiso")
        end, obj);

    obj._e_event23 = obj.button5:addEventListener("onClick",
        function (_)
            filterRaces("Efíria")
        end, obj);

    obj._e_event24 = obj.button6:addEventListener("onClick",
        function (_)
            filterRaces("Centelha")
        end, obj);

    obj._e_event25 = obj.button7:addEventListener("onClick",
        function (_)
            filterRaces("SobAlec")
        end, obj);

    obj._e_event26 = obj.button8:addEventListener("onClick",
        function (_)
            filterRaces("Ardeal")
        end, obj);

    obj._e_event27 = obj.button9:addEventListener("onClick",
        function (_)
            filterRaces("Abismo")
        end, obj);

    obj._e_event28 = obj.button10:addEventListener("onClick",
        function (_)
            filterRaces("Diaféle")
        end, obj);

    obj._e_event29 = obj.button11:addEventListener("onClick",
        function (_)
            filterRaces("Inferno")
        end, obj);

    obj._e_event30 = obj.button12:addEventListener("onClick",
        function (_)
            RngRace()
        end, obj);

    obj._e_event31 = obj.raceSelector:addEventListener("onChange",
        function (_)
            if generatorSheet == nil then return end
            					local index = tonumber(generatorSheet.npc.raceSelector) or 0
            					local race = generatorSheet.db.races[index]
            					local atrs = {"For","Des","Con","Int","Sab","Car"}
            
            					if race == nil then return end;
            					if race.attributes ~= nil then
            						for i=1, 6, 1 do
            							generatorSheet.npc["raca" .. atrs[i]] = race.attributes[i] + (tonumber(generatorSheet.npc["extra" .. atrs[i]]) or 0)
            						end
            
            						local i = 6
            						local txt = ""
            						while race.attributes[i+1]~=nil do
            							i = i + 1
            							txt = txt .. race.attributes[i] .. " livre\n"
            						end
            						generatorSheet.npc.atributeExtra = txt
            					end
            
            					generatorSheet.npc.raca = race.name
            					generatorSheet.npc.tipo = race.type
            					generatorSheet.npc.subtipo = race.subtype
            					generatorSheet.npc.deslTerrestre = race.speed
            					generatorSheet.npc.deslVoo = race.fly
            					generatorSheet.npc.qualidadeVoo = race.flyType
            					generatorSheet.npc.deslNatacao = race.swin
            					generatorSheet.npc.deslEscalar = race.climb
            					generatorSheet.npc.deslEscavar = race.burrow
            					generatorSheet.npc.trCondicional = race.savesOther
            					generatorSheet.npc.ajuste = race.adjustment
            					generatorSheet.npc.tamanho = race.size
            
            					generatorSheet.npc.outrosFort = race.saves[1]
            					generatorSheet.npc.outrosRef = race.saves[2]
            					generatorSheet.npc.outrosVon = race.saves[3]
            
            					-- Limpar lista de habilidades de raça
            					generatorSheet.npc.campoDasRacas = {}
            
            					-- Vision
            					if race.visionLowLight == 2 then
            						local rclItem = self.campoDasRacas:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.nomeHabilidade = "Visão da Penumbra"
            							rclItem.obtencaoHabilidade = race.name
            						end
            					elseif race.visionLowLight == 4 then
            						local rclItem = self.campoDasRacas:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.nomeHabilidade = "Visão da Penumbra Maior"
            							rclItem.obtencaoHabilidade = race.name
            						end
            					end 
            
            					if race.visionDarkness ~= nil then
            						local rclItem = self.campoDasRacas:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.nomeHabilidade = "Visão no Escuro " .. race.visionDarkness .. "m"
            							rclItem.obtencaoHabilidade = race.name
            						end
            					end
            
            					-- Imunidades
            
            					local i = 1;
            					while race.immunities~=nil and race.immunities[i] ~= nil do
            						local rclItem = self.campoDasRacas:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.nomeHabilidade = "Imunidade a " .. race.immunities[i]
            							rclItem.obtencaoHabilidade = race.name
            						end
            
            						i = i + 1
            					end
            
            					while race.vulnerabilities~=nil and race.vulnerabilities[i] ~= nil do
            						local rclItem = self.campoDasRacas:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.nomeHabilidade = "Vulnerabilidade a " .. race.vulnerabilities[i]
            							rclItem.obtencaoHabilidade = race.name
            						end
            
            						i = i + 1
            					end
            
            					local i = 1;
            					while race.other~=nil and race.other[i] ~= nil do
            						local rclItem = self.campoDasRacas:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.nomeHabilidade = race.other[i]
            							rclItem.descricao = race.otherDetails[i]
            							rclItem.obtencaoHabilidade = race.name
            						end
            
            						i = i + 1
            					end
            
            					-- SKILLS
            
            					generatorSheet.skills = race.skills
            
            					UpdateClassSkills()
            
            					i = 1
            					while race.languages[i] ~= nil do
            						i = i + 1
            					end
            
            					generatorSheet.npc.languageInitial = "Inicial: " .. (i-1)
            
            					-- TALENTOS
            
            					local feats = tonumber(race.feats) or 0;
            
            					local i = 1
            					while race.featForce ~= nil and race.featForce[i] ~= nil do
            						local rclItem = self.campoDosTalentos:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.nomeHabilidade = race.featForce[i]
            							rclItem.obtencaoHabilidade = race.name
            							rclItem.lock = true
            						end
            
            						feats = feats - 1
            						i = i + 1
            					end
            
            					for i=1, feats, 1 do 
            						local rclItem = self.campoDosTalentos:append()
            						if rclItem ~= nil then
            							rclItem.nivelHabilidade = 1
            							rclItem.obtencaoHabilidade = race.name
            						end
            					end
        end, obj);

    obj._e_event32 = obj.button13:addEventListener("onClick",
        function (_)
            filterClasses("Geral")
        end, obj);

    obj._e_event33 = obj.button14:addEventListener("onClick",
        function (_)
            filterClasses("Oficial")
        end, obj);

    obj._e_event34 = obj.button15:addEventListener("onClick",
        function (_)
            filterClasses("Paraiso")
        end, obj);

    obj._e_event35 = obj.button16:addEventListener("onClick",
        function (_)
            filterClasses("Efíria")
        end, obj);

    obj._e_event36 = obj.button17:addEventListener("onClick",
        function (_)
            filterClasses("Centelha")
        end, obj);

    obj._e_event37 = obj.button18:addEventListener("onClick",
        function (_)
            filterClasses("SobAlec")
        end, obj);

    obj._e_event38 = obj.button19:addEventListener("onClick",
        function (_)
            filterClasses("Ardeal")
        end, obj);

    obj._e_event39 = obj.button20:addEventListener("onClick",
        function (_)
            filterClasses("Abismo")
        end, obj);

    obj._e_event40 = obj.button21:addEventListener("onClick",
        function (_)
            filterClasses("Diaféle")
        end, obj);

    obj._e_event41 = obj.button22:addEventListener("onClick",
        function (_)
            filterClasses("Inferno")
        end, obj);

    obj._e_event42 = obj.button23:addEventListener("onClick",
        function (_)
            RngClasse()
        end, obj);

    obj._e_event43 = obj.classeSelector:addEventListener("onChange",
        function (_)
            if generatorSheet == nil then return end;
            					local index = tonumber(generatorSheet.npc.classeSelector) or 0
            					local classe = generatorSheet.db.classes[index]
            
            					local index = tonumber(generatorSheet.npc.raceSelector) or 0
            					local race = generatorSheet.db.races[index]
            
            					if classe == nil then return end;
            
            					generatorSheet.npc.classe1 = classe.name .. " 1"
            					
            					generatorSheet.npc.lvl = 0
            
            					-- Limpar lista de habilidades de classe
            					generatorSheet.npc.campoDasCaracteristicasClasse = {}
            					generatorSheet.npc.campoDosTalentos = {}
            
            					-- TALENTOS [re add race feats]
            					if race~= nil then
            						local feats = tonumber(race.feats) or 0;
            
            						local i = 1
            						while race.featForce ~= nil and race.featForce[i] ~= nil do
            							local rclItem = self.campoDosTalentos:append()
            							if rclItem ~= nil then
            								rclItem.nivelHabilidade = 1
            								rclItem.nomeHabilidade = race.featForce[i]
            								rclItem.obtencaoHabilidade = race.name
            								rclItem.lock = true
            							end
            
            							feats = feats - 1
            							i = i + 1
            						end
            
            						for i=1, feats, 1 do 
            							local rclItem = self.campoDosTalentos:append()
            							if rclItem ~= nil then
            								rclItem.nivelHabilidade = 1
            								rclItem.obtencaoHabilidade = race.name
            							end
            						end
            					end
            
            					UpdateClassSkills()
            
            					-- MAGIAS
            					generatorSheet.npc.campoDosItens = {}
            					if classe.spellType ~= nil then
            						local spellItem = self.rclListaDasClassesMagicas:append()
            						if spellItem ~= nil then
            							spellItem.tipoMagia = classe.spellType
            							spellItem.classeMagia = classe.name
            
            							spellItem.atributoCD = classe.spellCD
            							spellItem.atributoBonus = classe.spellExtra
            						end
            					end
            
            
            					LevelUpdate();
        end, obj);

    obj._e_event44 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            
            				generatorSheet.npc.totalFor = 	(tonumber(generatorSheet.npc.inicialFor) or 0) + 
            													(tonumber(generatorSheet.npc.nepFor) or 0) + 
            													(tonumber(generatorSheet.npc.racaFor) or 0);
        end, obj);

    obj._e_event45 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            				local index = tonumber(generatorSheet.npc.raceSelector) or 0
            				local race = generatorSheet.db.races[index]
            
            				local atrs = {"For","Des","Con","Int","Sab","Car"}
            
            				generatorSheet.npc.racaFor = race.attributes[1] + (tonumber(generatorSheet.npc.extraFor) or 0)
            
            				InitSkills()
        end, obj);

    obj._e_event46 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            
            				generatorSheet.npc.totalDes = 	(tonumber(generatorSheet.npc.inicialDes) or 0) + 
            													(tonumber(generatorSheet.npc.nepDes) or 0) + 
            													(tonumber(generatorSheet.npc.racaDes) or 0);
        end, obj);

    obj._e_event47 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            				local index = tonumber(generatorSheet.npc.raceSelector) or 0
            				local race = generatorSheet.db.races[index]
            
            				local atrs = {"For","Des","Con","Int","Sab","Car"}
            
            				generatorSheet.npc.racaDes = race.attributes[2] + (tonumber(generatorSheet.npc.extraDes) or 0)
            
            				InitSkills()
        end, obj);

    obj._e_event48 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            
            				generatorSheet.npc.totalCon = 	(tonumber(generatorSheet.npc.inicialCon) or 0) + 
            													(tonumber(generatorSheet.npc.nepCon) or 0) + 
            													(tonumber(generatorSheet.npc.racaCon) or 0);
        end, obj);

    obj._e_event49 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            				local index = tonumber(generatorSheet.npc.raceSelector) or 0
            				local race = generatorSheet.db.races[index]
            
            				local atrs = {"For","Des","Con","Int","Sab","Car"}
            
            				generatorSheet.npc.racaCon = race.attributes[3] + (tonumber(generatorSheet.npc.extraCon) or 0)
            
            				InitSkills()
        end, obj);

    obj._e_event50 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            
            				generatorSheet.npc.totalInt = 	(tonumber(generatorSheet.npc.inicialInt) or 0) + 
            													(tonumber(generatorSheet.npc.nepInt) or 0) + 
            													(tonumber(generatorSheet.npc.racaInt) or 0);
        end, obj);

    obj._e_event51 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            				local index = tonumber(generatorSheet.npc.raceSelector) or 0
            				local race = generatorSheet.db.races[index]
            
            				local atrs = {"For","Des","Con","Int","Sab","Car"}
            
            				generatorSheet.npc.racaInt = race.attributes[4] + (tonumber(generatorSheet.npc.extraInt) or 0)
            
            				InitSkills()
        end, obj);

    obj._e_event52 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            
            				generatorSheet.npc.totalSab = 	(tonumber(generatorSheet.npc.inicialSab) or 0) + 
            													(tonumber(generatorSheet.npc.nepSab) or 0) + 
            													(tonumber(generatorSheet.npc.racaSab) or 0);
        end, obj);

    obj._e_event53 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            				local index = tonumber(generatorSheet.npc.raceSelector) or 0
            				local race = generatorSheet.db.races[index]
            
            				local atrs = {"For","Des","Con","Int","Sab","Car"}
            
            				generatorSheet.npc.racaSab = race.attributes[5] + (tonumber(generatorSheet.npc.extraSab) or 0)
            
            				InitSkills()
        end, obj);

    obj._e_event54 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            
            				generatorSheet.npc.totalCar = 	(tonumber(generatorSheet.npc.inicialCar) or 0) + 
            													(tonumber(generatorSheet.npc.nepCar) or 0) + 
            													(tonumber(generatorSheet.npc.racaCar) or 0);
        end, obj);

    obj._e_event55 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            				local index = tonumber(generatorSheet.npc.raceSelector) or 0
            				local race = generatorSheet.db.races[index]
            
            				local atrs = {"For","Des","Con","Int","Sab","Car"}
            
            				generatorSheet.npc.racaCar = race.attributes[6] + (tonumber(generatorSheet.npc.extraCar) or 0)
            
            				InitSkills()
        end, obj);

    obj._e_event56 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet==nil then return end
            
            						local lvl = tonumber(generatorSheet.npc.lvl) or 1
            						local atr = {0,0,0,0,0,0,0}
            
            						if lvl>=4 then
            							atr[(tonumber(generatorSheet.npc.nv4) or 7)] = atr[(tonumber(generatorSheet.npc.nv4) or 7)] + 1
            						end
            						if lvl>=8 then
            							atr[(tonumber(generatorSheet.npc.nv8) or 7)] = atr[(tonumber(generatorSheet.npc.nv8) or 7)] + 1
            						end
            						if lvl>=12 then
            							atr[(tonumber(generatorSheet.npc.nv12) or 7)] = atr[(tonumber(generatorSheet.npc.nv12) or 7)] + 1
            						end
            						if lvl>=16 then
            							atr[(tonumber(generatorSheet.npc.nv16) or 7)] = atr[(tonumber(generatorSheet.npc.nv16) or 7)] + 1
            						end
            						if lvl>=20 then
            							atr[(tonumber(generatorSheet.npc.nv20) or 7)] = atr[(tonumber(generatorSheet.npc.nv20) or 7)] + 1
            						end
            
            						generatorSheet.npc.nepFor = atr[1]
            						generatorSheet.npc.nepDes = atr[2]
            						generatorSheet.npc.nepCon = atr[3]
            						generatorSheet.npc.nepInt = atr[4]
            						generatorSheet.npc.nepSab = atr[5]
            						generatorSheet.npc.nepCar = atr[6]
        end, obj);

    obj._e_event57 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end;
            
            					local pb = {0,0,0,0,0,0,0,0,1,2,3,4,5,6,8,10,13,16}
            					pb[0] = 0
            					local str = (tonumber(generatorSheet.npc.inicialFor) or 0)
            					local des = (tonumber(generatorSheet.npc.inicialDes) or 0)
            					local con = (tonumber(generatorSheet.npc.inicialCon) or 0)
            					local int = (tonumber(generatorSheet.npc.inicialInt) or 0)
            					local sab = (tonumber(generatorSheet.npc.inicialSab) or 0)
            					local car = (tonumber(generatorSheet.npc.inicialCar) or 0)
            
            					local atrPointBuy = pb[str] + pb[des] + pb[con] + pb[int] + pb[sab] + pb[car]
            					generatorSheet.npc.atrPointBuy = "Point Buy: " .. atrPointBuy
            
            					local atrTotal = str + des + con + int + sab + car
            
            					generatorSheet.npc.atrTotal = "Total: " .. atrTotal
        end, obj);

    obj._e_event58 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end
            
            					local lvl = tonumber(generatorSheet.npc.lvl) or 1
            					local index = tonumber(generatorSheet.npc.classeSelector) or 0
            					local classe = generatorSheet.db.classes[index]
            
            					if classe==nil then return end
            
            					local con = tonumber(generatorSheet.npc.totalCon) or 0
            					con = math.floor(con/2) - 5
            					con = con * lvl
            
            					generatorSheet.npc.dvs = lvl .. "d" .. classe.hd .. "+" .. con
            					generatorSheet.npc.pvTotal = math.floor(classe.hd + (lvl-1)*((classe.hd/2) + 0.5) + con)
        end, obj);

    obj._e_event59 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if generatorSheet == nil then return end
            
            					local lvl = tonumber(generatorSheet.npc.lvl) or 1
            					local index = tonumber(generatorSheet.npc.classeSelector) or 0
            					local classe = generatorSheet.db.classes[index]
            
            					if classe==nil then return end
            
            					UpdateMaxSkills(classe, lvl)
        end, obj);

    obj._e_event60 = obj.campoDasRacas:addEventListener("onResize",
        function (_)
            self.campoDasRacasPart._recalcHeight();
        end, obj);

    obj._e_event61 = obj.campoDasRacas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event62 = obj.campoDasCaracteristicasClasse:addEventListener("onResize",
        function (_)
            self.campoDasCaracteristicasClassePart._recalcHeight();
        end, obj);

    obj._e_event63 = obj.campoDasCaracteristicasClasse:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event64 = obj.campoDosTalentos:addEventListener("onResize",
        function (_)
            self.campoDosTalentosPart._recalcHeight();
        end, obj);

    obj._e_event65 = obj.campoDosTalentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event66 = obj.popLanguageSelection:addEventListener("onNodeReady",
        function (_)
            local nodes = NDB.getChildNodes(self.popLanguageSelection.node.LanguageParaiso)
            			if #nodes > 0 then return end
            
            			local idiomas = generatorSheet.db.idiomas
            			local i = 1
            			while idiomas ~= nil and idiomas[i] ~= nil do
            				local idioma = idiomas[i]
            
            				local rclItem
            
            				if idioma.type == "Paraiso" then
            					rclItem = self.LanguageParaiso:append()
            				elseif idioma.type == "Efiria" then
            					rclItem = self.LanguageEfiria:append()
            				elseif idioma.type == "Centelha" then
            					rclItem = self.LanguageCentelha:append()
            				elseif idioma.type == "SobAlec" then
            					rclItem = self.LanguageSobAlec:append()
            				elseif idioma.type == "Ardeal" then
            					rclItem = self.LanguageArdeal:append()
            				elseif idioma.type == "Abismo" then
            					rclItem = self.LanguageAbismo:append()
            				elseif idioma.type == "Diafele" then
            					rclItem = self.LanguageDiafele:append()
            				elseif idioma.type == "Inferno" then
            					rclItem = self.LanguageInferno:append()
            				elseif idioma.type == "Outros" then
            					rclItem = self.LanguageOutros:append()
            				end
            
            				if rclItem ~= nil then 
            					rclItem.name = idioma.name
            					rclItem.alphabet = idioma.alphabet
            					rclItem.region = idioma.region
            				end
            				i = i + 1
            			end
        end, obj);

    obj._e_event67 = obj.LanguageParaiso:addEventListener("onResize",
        function (_)
            self.LanguageParaisoPart._recalcHeight();
        end, obj);

    obj._e_event68 = obj.LanguageParaiso:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event69 = obj.LanguageEfiria:addEventListener("onResize",
        function (_)
            self.LanguageEfiriaPart._recalcHeight();
        end, obj);

    obj._e_event70 = obj.LanguageEfiria:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event71 = obj.LanguageCentelha:addEventListener("onResize",
        function (_)
            self.LanguageCentelhaPart._recalcHeight();
        end, obj);

    obj._e_event72 = obj.LanguageCentelha:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event73 = obj.LanguageSobAlec:addEventListener("onResize",
        function (_)
            self.LanguageSobAlecPart._recalcHeight();
        end, obj);

    obj._e_event74 = obj.LanguageSobAlec:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event75 = obj.LanguageArdeal:addEventListener("onResize",
        function (_)
            self.LanguageArdealPart._recalcHeight();
        end, obj);

    obj._e_event76 = obj.LanguageArdeal:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event77 = obj.LanguageAbismo:addEventListener("onResize",
        function (_)
            self.LanguageAbismoPart._recalcHeight();
        end, obj);

    obj._e_event78 = obj.LanguageAbismo:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event79 = obj.LanguageDiafele:addEventListener("onResize",
        function (_)
            self.LanguageDiafelePart._recalcHeight();
        end, obj);

    obj._e_event80 = obj.LanguageDiafele:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event81 = obj.LanguageInferno:addEventListener("onResize",
        function (_)
            self.LanguageInfernoPart._recalcHeight();
        end, obj);

    obj._e_event82 = obj.LanguageInferno:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event83 = obj.LanguageOutros:addEventListener("onResize",
        function (_)
            self.LanguageOutrosPart._recalcHeight();
        end, obj);

    obj._e_event84 = obj.LanguageOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event85 = obj.button24:addEventListener("onClick",
        function (_)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event86 = obj.button25:addEventListener("onClick",
        function (_)
            local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasPericias);
            
            						local lvl = tonumber(generatorSheet.npc.lvl) or 1
            						local max = tonumber(generatorSheet.npc.skillsMax) or 0
            
            						local pts = tonumber(generatorSheet.npc.pontosPericia) or 0
            						local avail = max - pts
            						local ptsMax = math.min(avail, lvl+3)
            
            						local fail = 0
            
            						while avail > 0 and fail < (#nodes*2) do
            							local rng = math.random(#nodes)
            
            							local grad = tonumber(nodes[rng].graduacaoPericia) or 0
            
            							if nodes[rng].isClass and grad<ptsMax then
            								
            								nodes[rng].graduacaoPericia = ptsMax
            
            								avail = avail + grad - ptsMax
            
            								ptsMax = math.min(avail, lvl+3)
            							else
            								fail = fail +1
            							end
            						end
        end, obj);

    obj._e_event87 = obj.button26:addEventListener("onClick",
        function (_)
            local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasPericias);
            
            						local lvl = tonumber(generatorSheet.npc.lvl) or 1
            						local max = tonumber(generatorSheet.npc.skillsMax) or 0
            
            						local pts = tonumber(generatorSheet.npc.pontosPericia) or 0
            						local avail = max - pts
            						local ptsMax = math.min(avail, lvl+3)
            
            						local fail = 0
            
            						while avail > 0 and fail < (#nodes*2) do
            							local rng = math.random(#nodes)
            
            							local grad = tonumber(nodes[rng].graduacaoPericia) or 0
            
            							if nodes[rng].isClass and grad<ptsMax then
            								nodes[rng].graduacaoPericia = ptsMax
            
            								avail = avail + grad - ptsMax
            
            								ptsMax = math.min(avail, lvl+3)
            							elseif not nodes[rng].isClass and grad<math.floor(ptsMax/2) then
            								nodes[rng].graduacaoPericia = math.floor(ptsMax/2)
            
            								avail = avail + grad*2 - (math.floor(ptsMax/2)*2)
            
            								ptsMax = math.min(avail, lvl+3)
            							else
            								fail = fail +1
            							end
            						end
        end, obj);

    obj._e_event88 = obj.button27:addEventListener("onClick",
        function (_)
            local nodes = NDB.getChildNodes(generatorSheet.npc.campoDasPericias);
            						for i=1, #nodes, 1 do
            							nodes[i].graduacaoPericia = nil
            						end
        end, obj);

    obj._e_event89 = obj.rclListaDasPericias:addEventListener("onResize",
        function (_)
            self.rclListaDasPericiasPart._recalcHeight();
        end, obj);

    obj._e_event90 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event91 = obj.button28:addEventListener("onClick",
        function (_)
            self.rclListaDosIdiomas:append();
        end, obj);

    obj._e_event92 = obj.rclListaDosIdiomas:addEventListener("onResize",
        function (_)
            self.rclListaDosIdiomasPart._recalcHeight();
        end, obj);

    obj._e_event93 = obj.rclListaDosIdiomas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event94 = obj.rclListaDasClassesMagicas:addEventListener("onResize",
        function (_)
            self.rclListaDasClassesMagicasPart._recalcHeight();
        end, obj);

    obj._e_event95 = obj.rclListaDasClassesMagicas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nivelHabilidade~=nil then 
            				        	return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0)) 
            				        end;
            				        if nodeA.nomePericia~=nil then 
            				        	return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia) 
            				        end;
            
            				        return 0
        end, obj);

    obj._e_event96 = obj.button29:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/README.md')
        end, obj);

    obj._e_event97 = obj.button29:addEventListener("onClick",
        function (_)
            local install = Firecast.Plugins.installPlugin(rawget(toolSheet,"stream"), true);
                            if install==false then
                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/output/Ficha%20RPG%20meister.rpk?raw=true');
                            end;
        end, obj);

    obj._e_event98 = obj.button30:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/output/Ferramentas%20d20.rpk?raw=true')
        end, obj);

    obj._e_event99 = obj.button31:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event100 = obj.button32:addEventListener("onClick",
        function (_)
            generatorSheet.npc.listaDeEquipamentos = NDB.load("equips.xml");
            
            				local xml = NDB.exportXML(generatorSheet.npc);
            
            				local export = {};
            				local bytes = Utils.binaryEncode(export, "utf8", xml);
            
            				local stream = Utils.newMemoryStream();
            				local bytes = stream:write(export);
            
            				Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            					function()
            						stream:close();
            						showMessage("Ficha Exportada.");
            					end);
        end, obj);

    obj._e_event101 = obj.button33:addEventListener("onClick",
        function (_)
            generatorSheet.npc = {}
            					InitSkills()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.campoDasCaracteristicasClassePart ~= nil then self.campoDasCaracteristicasClassePart:destroy(); self.campoDasCaracteristicasClassePart = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.LanguageParaiso ~= nil then self.LanguageParaiso:destroy(); self.LanguageParaiso = nil; end;
        if self.campoDosTalentos ~= nil then self.campoDosTalentos:destroy(); self.campoDosTalentos = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.FeatCombat ~= nil then self.FeatCombat:destroy(); self.FeatCombat = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.popLanguageSelection ~= nil then self.popLanguageSelection:destroy(); self.popLanguageSelection = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.frmGeneratorRace ~= nil then self.frmGeneratorRace:destroy(); self.frmGeneratorRace = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.FeatCreationPart ~= nil then self.FeatCreationPart:destroy(); self.FeatCreationPart = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.LanguageParaisoPart ~= nil then self.LanguageParaisoPart:destroy(); self.LanguageParaisoPart = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.LanguageSobAlecPart ~= nil then self.LanguageSobAlecPart:destroy(); self.LanguageSobAlecPart = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.LanguageEfiriaPart ~= nil then self.LanguageEfiriaPart:destroy(); self.LanguageEfiriaPart = nil; end;
        if self.rclListaDasPericiasPart ~= nil then self.rclListaDasPericiasPart:destroy(); self.rclListaDasPericiasPart = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.FeatCreation ~= nil then self.FeatCreation:destroy(); self.FeatCreation = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.FeatMetamagicPart ~= nil then self.FeatMetamagicPart:destroy(); self.FeatMetamagicPart = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.campoDasCaracteristicasClasse ~= nil then self.campoDasCaracteristicasClasse:destroy(); self.campoDasCaracteristicasClasse = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.popFeatSelection ~= nil then self.popFeatSelection:destroy(); self.popFeatSelection = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.LanguageDiafele ~= nil then self.LanguageDiafele:destroy(); self.LanguageDiafele = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.LanguageEfiria ~= nil then self.LanguageEfiria:destroy(); self.LanguageEfiria = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.classeSelector ~= nil then self.classeSelector:destroy(); self.classeSelector = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.campoDosTalentosPart ~= nil then self.campoDosTalentosPart:destroy(); self.campoDosTalentosPart = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.LanguageAbismoPart ~= nil then self.LanguageAbismoPart:destroy(); self.LanguageAbismoPart = nil; end;
        if self.rclListaDasClassesMagicasPart ~= nil then self.rclListaDasClassesMagicasPart:destroy(); self.rclListaDasClassesMagicasPart = nil; end;
        if self.LanguageInfernoPart ~= nil then self.LanguageInfernoPart:destroy(); self.LanguageInfernoPart = nil; end;
        if self.rclListaDosIdiomasPart ~= nil then self.rclListaDosIdiomasPart:destroy(); self.rclListaDosIdiomasPart = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.LanguageArdealPart ~= nil then self.LanguageArdealPart:destroy(); self.LanguageArdealPart = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.frmGeneratorCreditos ~= nil then self.frmGeneratorCreditos:destroy(); self.frmGeneratorCreditos = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.FeatCombatPart ~= nil then self.FeatCombatPart:destroy(); self.FeatCombatPart = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.LanguageCentelha ~= nil then self.LanguageCentelha:destroy(); self.LanguageCentelha = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.FeatClassPart ~= nil then self.FeatClassPart:destroy(); self.FeatClassPart = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.FeatCasting ~= nil then self.FeatCasting:destroy(); self.FeatCasting = nil; end;
        if self.frmSpells ~= nil then self.frmSpells:destroy(); self.frmSpells = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.campoDasRacasPart ~= nil then self.campoDasRacasPart:destroy(); self.campoDasRacasPart = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.LanguageDiafelePart ~= nil then self.LanguageDiafelePart:destroy(); self.LanguageDiafelePart = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.FeatCastingPart ~= nil then self.FeatCastingPart:destroy(); self.FeatCastingPart = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.FeatGeneralPart ~= nil then self.FeatGeneralPart:destroy(); self.FeatGeneralPart = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.LanguageOutros ~= nil then self.LanguageOutros:destroy(); self.LanguageOutros = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.FeatGeneral ~= nil then self.FeatGeneral:destroy(); self.FeatGeneral = nil; end;
        if self.FeatSkill ~= nil then self.FeatSkill:destroy(); self.FeatSkill = nil; end;
        if self.scope ~= nil then self.scope:destroy(); self.scope = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.LanguageSobAlec ~= nil then self.LanguageSobAlec:destroy(); self.LanguageSobAlec = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.raceSelector ~= nil then self.raceSelector:destroy(); self.raceSelector = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rclListaDasClassesMagicas ~= nil then self.rclListaDasClassesMagicas:destroy(); self.rclListaDasClassesMagicas = nil; end;
        if self.LanguageCentelhaPart ~= nil then self.LanguageCentelhaPart:destroy(); self.LanguageCentelhaPart = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.FeatRacePart ~= nil then self.FeatRacePart:destroy(); self.FeatRacePart = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.frmSkills ~= nil then self.frmSkills:destroy(); self.frmSkills = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rclListaDosIdiomas ~= nil then self.rclListaDosIdiomas:destroy(); self.rclListaDosIdiomas = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.FeatSkillPart ~= nil then self.FeatSkillPart:destroy(); self.FeatSkillPart = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.LanguageOutrosPart ~= nil then self.LanguageOutrosPart:destroy(); self.LanguageOutrosPart = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.LanguageAbismo ~= nil then self.LanguageAbismo:destroy(); self.LanguageAbismo = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.campoDasRacas ~= nil then self.campoDasRacas:destroy(); self.campoDasRacas = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.FeatRace ~= nil then self.FeatRace:destroy(); self.FeatRace = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.LanguageInferno ~= nil then self.LanguageInferno:destroy(); self.LanguageInferno = nil; end;
        if self.LanguageArdeal ~= nil then self.LanguageArdeal:destroy(); self.LanguageArdeal = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.FeatMetamagic ~= nil then self.FeatMetamagic:destroy(); self.FeatMetamagic = nil; end;
        if self.FeatClass ~= nil then self.FeatClass:destroy(); self.FeatClass = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGeneratorRPGmeister()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGeneratorRPGmeister();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGeneratorRPGmeister = {
    newEditor = newfrmGeneratorRPGmeister, 
    new = newfrmGeneratorRPGmeister, 
    name = "frmGeneratorRPGmeister", 
    dataType = "Ambesek.Generator.RPGmeister", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Generator RPGmeister", 
    description=""};

frmGeneratorRPGmeister = _frmGeneratorRPGmeister;
Firecast.registrarForm(_frmGeneratorRPGmeister);
Firecast.registrarDataType(_frmGeneratorRPGmeister);
Firecast.registrarSpecialForm(_frmGeneratorRPGmeister);

return _frmGeneratorRPGmeister;
