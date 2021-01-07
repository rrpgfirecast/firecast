require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMainFerramentas()
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
    obj:setName("frmMainFerramentas");
    obj:setFormType("tablesDock");
    obj:setDataType("Ambesek.Ferramentas.d20");
    obj:setTitle("Ferramentas RPGmeister");
    obj:setAlign("client");
    obj:setTheme("dark");


		local magicListData = NDB.load("magicListData.xml");

		-- lists
		local schools = {"Abjuration","Conjuration","Calling","Creation","Healing","Summoning","Teleportation","Divination","Scrying","Enchantment","Charm","Compulsion","Evocation","Illusion","Figment","Glamer","Pattern","Phantasm","Shadow","Necromancy","Transmutation","Polymorph","Universal"};
		local tags = {"Acid","Air","Chaotic","Cold","Darkness","Death","Earth","Electricity","Evil","Fear","Fire","Force","Good","Language-Dependent","Lawful","Light","Mind-Affecting","Sonic","Water"};
		local components = {"V", "S", "M", "F", "DF", "XP"}
		local ranges = {"3m", "6m", "9m", "12m", "15m", "18m", "Close", "Medium", "Long", "Personal", "Touch", "Special","Adjacent"};
		local durations = {"Concentration", "Dismissible", "Instantaneous", "Rounds", "Minutes", "Hours", "Days", "Permanent", "Special"};
		local targets = {"Area","Effect","Target","Burst","Cone","Cylinder","Emanation","Line","Ray","Sphere","Spread","Shapeable", "Special"};
		local trs = {"Fortitude","Reflex","Will","None","Special"};
		local srs = {"Yes", "No"};
		local books = {"PHB","ELH","CAd","CAr","CD","CC","CM","CS","CW"};

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
			mesa.activeChat:escrever(str);
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
		


    obj.scope = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.scope:setParent(obj);
    obj.scope:setName("scope");
    obj.scope:setAlign("client");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.scope);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("XP");
    obj.tab1:setName("tab1");

    obj.frmXP = GUI.fromHandle(_obj_newObject("form"));
    obj.frmXP:setParent(obj.tab1);
    obj.frmXP:setName("frmXP");
    obj.frmXP:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmXP);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(110);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Desafios");
    obj.label1:setMargins({right=5});
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(260);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Personagens");
    obj.label2:setName("label2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setAlign("left");
    obj.button1:setWidth(110);
    obj.button1:setText("+");
    obj.button1:setMargins({right=5});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setAlign("left");
    obj.button2:setWidth(260);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(110);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setAlign("left");
    obj.label3:setWidth(30);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("#");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setAlign("left");
    obj.label4:setWidth(30);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("ND");
    obj.label4:setName("label4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(260);
    obj.layout5:setName("layout5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setAlign("left");
    obj.label5:setWidth(30);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("#");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout5);
    obj.label6:setAlign("left");
    obj.label6:setWidth(30);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("NEP");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setAlign("left");
    obj.label7:setWidth(75);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("XP Total");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout5);
    obj.label8:setAlign("left");
    obj.label8:setWidth(75);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("XP Individual");
    obj.label8:setFontSize(11);
    obj.label8:setName("label8");

    obj.enemiesList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.enemiesList:setParent(obj.scrollBox1);
    obj.enemiesList:setAlign("left");
    obj.enemiesList:setWidth(110);
    obj.enemiesList:setField("enemiesList");
    obj.enemiesList:setName("enemiesList");
    obj.enemiesList:setTemplateForm("frmEnemy");
    obj.enemiesList:setMinQt(1);
    obj.enemiesList:setMargins({right=5});

    obj.playersList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.playersList:setParent(obj.scrollBox1);
    obj.playersList:setAlign("left");
    obj.playersList:setWidth(260);
    obj.playersList:setField("playersList");
    obj.playersList:setName("playersList");
    obj.playersList:setTemplateForm("frmPlayer");
    obj.playersList:setMinQt(1);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'calculateXP'});
    obj.dataLink1:setName("dataLink1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Magias");
    obj.tab2:setName("tab2");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.tab2);
    obj.tabControl2:setAlign("client");
    obj.tabControl2:setName("tabControl2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Filtro");
    obj.tab3:setName("tab3");

    obj.frmSpells = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSpells:setParent(obj.tab3);
    obj.frmSpells:setName("frmSpells");
    obj.frmSpells:setAlign("client");


        	local function has_value (tab, val)
    			for k, v in pairs(tab) do
			        if v == val then
			            return true
			        end
			    end

			    return false
			end

			local function array_contain(array, str, size)
				for i=1, size, 1 do
					if array[i]==str then return true end;
				end;
				return false;
			end;

			local function filterComponentAnd(spell)
				local ret = true;

				if toolSheet.N and spell.components==nil then
					ret = ret and spell.components==nil;
				end;

				if toolSheet.V then
					ret = ret and array_contain(spell.components, components[1], #components);
				end;
				if toolSheet.S then
					ret = ret and array_contain(spell.components, components[2], #components);
				end;
				if toolSheet.M then
					ret = ret and array_contain(spell.components, components[3], #components);
				end;
				if toolSheet.F then
					ret = ret and array_contain(spell.components, components[4], #components);
				end;
				if toolSheet.DF then
					ret = ret and array_contain(spell.components, components[5], #components);
				end;
				if toolSheet.XP then
					ret = ret and array_contain(spell.components, components[6], #components);
				end;

				return ret;
			end

			local function filterComponentNot(spell)
				if toolSheet.N and spell.components==nil then
					return false;
				end;
				if toolSheet.V and array_contain(spell.components, components[1], #components) then
					return false;
				end;
				if toolSheet.S and array_contain(spell.components, components[2], #components) then
					return false;
				end;
				if toolSheet.M and array_contain(spell.components, components[3], #components) then
					return false;
				end;
				if toolSheet.F and array_contain(spell.components, components[4], #components) then
					return false;
				end;
				if toolSheet.DF and array_contain(spell.components, components[5], #components) then
					return false;
				end;
				if toolSheet.XP and array_contain(spell.components, components[6], #components) then
					return false;
				end;
				return true;
			end;

			local function filterComponentOr(spell)
				if toolSheet.N and spell.components==nil then
					return true;
				end;
				if toolSheet.V and array_contain(spell.components, components[1], #components) then
					return true;
				end;
				if toolSheet.S and array_contain(spell.components, components[2], #components) then
					return true;
				end;
				if toolSheet.M and array_contain(spell.components, components[3], #components) then
					return true;
				end;
				if toolSheet.F and array_contain(spell.components, components[4], #components) then
					return true;
				end;
				if toolSheet.DF and array_contain(spell.components, components[5], #components) then
					return true;
				end;
				if toolSheet.XP and array_contain(spell.components, components[6], #components) then
					return true;
				end;
				return false;
			end;

			local function filterComponent(spell)
				if toolSheet.componentRule == "and" then
					return filterComponentAnd(spell);
				elseif toolSheet.componentRule == "not" then
					return filterComponentNot(spell);
				else
					return filterComponentOr(spell);
				end;
			end

			local function filterTag(spell)
				if toolSheet.None and spell.descriptor==nil then
					return true;
				elseif not toolSheet.None and spell.descriptor==nil then
					return false;
				end;
				if toolSheet.Acid and array_contain(spell.descriptor, tags[1], #tags) then
					return true;
				end;
				if toolSheet.Air and array_contain(spell.descriptor, tags[2], #tags) then
					return true;
				end;
				if toolSheet.Chaotic and array_contain(spell.descriptor, tags[3], #tags) then
					return true;
				end;
				if toolSheet.Cold and array_contain(spell.descriptor, tags[4], #tags) then
					return true;
				end;
				if toolSheet.Darkness and array_contain(spell.descriptor, tags[5], #tags) then
					return true;
				end;
				if toolSheet.Death and array_contain(spell.descriptor, tags[6], #tags) then
					return true;
				end;
				if toolSheet.Earth and array_contain(spell.descriptor, tags[7], #tags) then
					return true;
				end;
				if toolSheet.Electricity and array_contain(spell.descriptor, tags[8], #tags) then
					return true;
				end;
				if toolSheet.Evil and array_contain(spell.descriptor, tags[9], #tags) then
					return true;
				end;
				if toolSheet.Fear and array_contain(spell.descriptor, tags[10], #tags) then
					return true;
				end;
				if toolSheet.Fire and array_contain(spell.descriptor, tags[11], #tags) then
					return true;
				end;
				if toolSheet.Force and array_contain(spell.descriptor, tags[12], #tags) then
					return true;
				end;
				if toolSheet.Good and array_contain(spell.descriptor, tags[13], #tags) then
					return true;
				end;
				if toolSheet.Language_Dependent and array_contain(spell.descriptor, tags[14], #tags) then
					return true;
				end;
				if toolSheet.Lawful and array_contain(spell.descriptor, tags[15], #tags) then
					return true;
				end;
				if toolSheet.Light and array_contain(spell.descriptor, tags[16], #tags) then
					return true;
				end;
				if toolSheet.Mind_Affecting and array_contain(spell.descriptor, tags[17], #tags) then
					return true;
				end;
				if toolSheet.Sonic and array_contain(spell.descriptor, tags[18], #tags) then
					return true;
				end;
				if toolSheet.Water and array_contain(spell.descriptor, tags[19], #tags) then
					return true;
				end;
				return false;
			end;

			local function filterLevel(spell)
				if toolSheet.lvl0 and has_value(spell.level, "0") then
					return true;
				end;
				if toolSheet.lvl1 and has_value(spell.level, "1") then
					return true;
				end;
				if toolSheet.lvl2 and has_value(spell.level, "2") then
					return true;
				end;
				if toolSheet.lvl3 and has_value(spell.level, "3") then
					return true;
				end;
				if toolSheet.lvl4 and has_value(spell.level, "4") then
					return true;
				end;
				if toolSheet.lvl5 and has_value(spell.level, "5") then
					return true;
				end;
				if toolSheet.lvl6 and has_value(spell.level, "6") then
					return true;
				end;
				if toolSheet.lvl7 and has_value(spell.level, "7") then
					return true;
				end;
				if toolSheet.lvl8 and has_value(spell.level, "8") then
					return true;
				end;
				if toolSheet.lvl9 and has_value(spell.level, "9") then
					return true;
				end;
				return false;
			end;

			local function filterSchool(spell)
				if self.scope.node.Abjuration and spell.school == schools[1] then
					return true;
				end;
				if self.scope.node.Conjuration and spell.school == schools[2] then
					return true;
				end;
				if self.scope.node.Calling and spell.subschool == schools[3] then
					return true;
				end;
				if self.scope.node.Creation and spell.subschool == schools[4] then
					return true;
				end;
				if self.scope.node.Healing and spell.subschool == schools[5] then
					return true;
				end;
				if self.scope.node.Summoning and spell.subschool == schools[6] then
					return true;
				end;
				if self.scope.node.Teleportation and spell.subschool == schools[7] then
					return true;
				end;
				if self.scope.node.Divination and spell.school == schools[8] then
					return true;
				end;
				if self.scope.node.Scrying and spell.subschool == schools[9] then
					return true;
				end;
				if self.scope.node.Enchantment and spell.school == schools[10] then
					return true;
				end;
				if self.scope.node.Charm and spell.subschool == schools[11] then
					return true;
				end;
				if self.scope.node.Compulsion and spell.subschool == schools[12] then
					return true;
				end;
				if self.scope.node.Evocation and spell.school == schools[13] then
					return true;
				end;
				if self.scope.node.Illusion and spell.school == schools[14] then
					return true;
				end;
				if self.scope.node.Figment and spell.subschool == schools[15] then
					return true;
				end;
				if self.scope.node.Glamer and spell.subschool == schools[16] then
					return true;
				end;
				if self.scope.node.Pattern and spell.subschool == schools[17] then
					return true;
				end;
				if self.scope.node.Phantasm and spell.subschool == schools[18] then
					return true;
				end;
				if self.scope.node.Shadow and spell.subschool == schools[19] then
					return true;
				end;
				if self.scope.node.Necromancy and spell.school == schools[20] then
					return true;
				end;
				if self.scope.node.Transmutation and spell.school == schools[21] then
					return true;
				end;
				if self.scope.node.Polymorph and spell.subschool == schools[22] then
					return true;
				end;
				if self.scope.node.Universal and spell.school == schools[23] then
					return true;
				end;

				return false;
			end;

			local function filterClassAnd(spell)
				local ret = true;
				if toolSheet.bard then
					ret = ret and spell.level.bard ~= nil;
				end;
				if toolSheet.cleric then
					ret = ret and spell.level.cleric ~= nil;
				end;
				if toolSheet.druid then
					ret = ret and spell.level.druid ~= nil;
				end;
				if toolSheet.paladin then
					ret = ret and spell.level.paladin ~= nil;
				end;
				if toolSheet.ranger then
					ret = ret and spell.level.ranger ~= nil;
				end;
				if toolSheet.sorcerer then
					ret = ret and spell.level.sorcerer ~= nil;
				end;
				if toolSheet.wizard then
					ret = ret and spell.level.wizard ~= nil;
				end;
				if toolSheet.adept then
					ret = ret and spell.level.adept ~= nil;
				end;
				if toolSheet.assassin then
					ret = ret and spell.level.assassin ~= nil;
				end;
				if toolSheet.blackguard then
					ret = ret and spell.level.blackguard ~= nil;
				end;
				if toolSheet.shugenja ~= nil then
					ret = ret  and spell.level.shugenja ~= nil;
				end;
				if toolSheet.wu_jen ~= nil then
					ret = ret  and spell.level["wu-jen"] ~= nil;
				end;
				if toolSheet.warmage ~= nil then
					ret = ret  and spell.level.warmage ~= nil;
				end;
				if toolSheet.hexblade ~= nil then
					ret = ret  and spell.level.hexblade ~= nil;
				end;
				if toolSheet.domain then
					ret = ret and (spell.level.air~=nil or spell.level.animal~=nil or spell.level.chaos~=nil or spell.level.death~=nil or spell.level.destruction~=nil or spell.level.earth~=nil or spell.level.evil~=nil or spell.level.fire~=nil or spell.level.good~=nil or spell.level.healing~=nil or spell.level.knowledge~=nil or spell.level.law~=nil or spell.level.luck~=nil or spell.level.magic~=nil or spell.level.plant~=nil or spell.level.protection~=nil or spell.level.strength~=nil or spell.level.sun~=nil or spell.level.travel~=nil or spell.level.trickery~=nil or spell.level.war~=nil or spell.level.water~=nil or spell.level.liberation ~= nil or spell.level.cold ~= nil or spell.level.creation ~= nil or spell.level.dream ~= nil or spell.level.mind ~= nil or spell.level.madness ~= nil or spell.level.domination ~= nil or spell.level.force ~= nil or spell.level.glory ~= nil or spell.level.purification ~= nil or spell.level.pact ~= nil or spell.level.pestilence ~= nil or spell.level.celerity ~= nil or spell.level.weather ~= nil or spell.level.courage ~= nil);
				end;
				return ret;
			end;

			local function filterClassOr(spell)
				if toolSheet.bard and spell.level.bard ~= nil then
					return true;
				end;
				if toolSheet.cleric and spell.level.cleric ~= nil then
					return true;
				end;
				if toolSheet.druid and spell.level.druid ~= nil then
					return true;
				end;
				if toolSheet.paladin and spell.level.paladin ~= nil then
					return true;
				end;
				if toolSheet.ranger and spell.level.ranger ~= nil then
					return true;
				end;
				if toolSheet.sorcerer and spell.level.sorcerer ~= nil then
					return true;
				end;
				if toolSheet.wizard and spell.level.wizard ~= nil then
					return true;
				end;
				if toolSheet.adept and spell.level.adept ~= nil then
					return true;
				end;
				if toolSheet.assassin and spell.level.assassin ~= nil then
					return true;
				end;
				if toolSheet.blackguard and spell.level.blackguard ~= nil then
					return true;
				end;
				if toolSheet.shugenja and spell.level.shugenja ~= nil then
					return true;
				end;
				if toolSheet.wu_jen and spell.level["wu-jen"] ~= nil then
					return true;
				end;
				if toolSheet.warmage and spell.level.warmage ~= nil then
					return true;
				end;
				if toolSheet.hexblade and spell.level.hexblade ~= nil then
					return true;
				end;
				if toolSheet.domain then
					return (spell.level.air~=nil or spell.level.animal~=nil or spell.level.chaos~=nil or spell.level.death~=nil or spell.level.destruction~=nil or spell.level.earth~=nil or spell.level.evil~=nil or spell.level.fire~=nil or spell.level.good~=nil or spell.level.healing~=nil or spell.level.knowledge~=nil or spell.level.law~=nil or spell.level.luck~=nil or spell.level.magic~=nil or spell.level.plant~=nil or spell.level.protection~=nil or spell.level.strength~=nil or spell.level.sun~=nil or spell.level.travel~=nil or spell.level.trickery~=nil or spell.level.war~=nil or spell.level.water~=nil or spell.level.liberation ~= nil or spell.level.cold ~= nil or spell.level.creation ~= nil or spell.level.dream ~= nil or spell.level.mind ~= nil or spell.level.madness ~= nil or spell.level.domination ~= nil or spell.level.force ~= nil or spell.level.glory ~= nil or spell.level.purification ~= nil or spell.level.pact ~= nil or spell.level.pestilence ~= nil or spell.level.celerity ~= nil or spell.level.weather ~= nil or spell.level.courage ~= nil);
				end;
				return false;
			end;

			local function filterClass(spell)
				if toolSheet.classRule == "and" then
					return filterClassAnd(spell);
				else
					return filterClassOr(spell);
				end;
			end;

			local function filterRange(spell)
				if toolSheet.fixo3m and spell.range == ranges[1] then
					return true;
				end;
				if toolSheet.fixo6m and spell.range == ranges[2] then
					return true;
				end;
				if toolSheet.fixo9m and spell.range == ranges[3] then
					return true;
				end;
				if toolSheet.fixo12m and spell.range == ranges[4] then
					return true;
				end;
				if toolSheet.fixo15m and spell.range == ranges[5] then
					return true;
				end;
				if toolSheet.fixo18m and spell.range == ranges[6] then
					return true;
				end;
				if toolSheet.Close and spell.range == ranges[7] then
					return true;
				end;
				if toolSheet.Medium and spell.range == ranges[8] then
					return true;
				end;
				if toolSheet.Long and spell.range == ranges[9] then
					return true;
				end;
				if toolSheet.Personal and spell.range == ranges[10] then
					return true;
				end;
				if toolSheet.Touch and spell.range == ranges[11] then
					return true;
				end;
				if toolSheet.Special and spell.range == ranges[12] then
					return true;
				end;
				if toolSheet.Adjacent and spell.range == ranges[13] then
					return true;
				end;
				return false;
			end;

			local function filterDuration(spell)
				if toolSheet.Concentration and array_contain(spell.duration, durations[1], #durations) then
					return true;
				end;
				if toolSheet.Dismissible and array_contain(spell.duration, durations[2], #durations) then
					return true;
				end;
				if toolSheet.Instantaneous and array_contain(spell.duration, durations[3], #durations) then
					return true;
				end;
				if toolSheet.Rounds and array_contain(spell.duration, durations[4], #durations) then
					return true;
				end;
				if toolSheet.Minutes and array_contain(spell.duration, durations[5], #durations) then
					return true;
				end;
				if toolSheet.Hours and array_contain(spell.duration, durations[6], #durations) then
					return true;
				end;
				if toolSheet.Days and array_contain(spell.duration, durations[7], #durations) then
					return true;
				end;
				if toolSheet.Permanent and array_contain(spell.duration, durations[8], #durations) then
					return true;
				end;
				if toolSheet.SpecialDuration and array_contain(spell.duration, durations[9], #durations) then
					return true;
				end;

				return false;
			end



			local function filterBook(spell)
				if toolSheet.PHB and array_contain(spell.book, books[1], #books) then
					return true;
				end;
				if toolSheet.ELH and array_contain(spell.book, books[2], #books) then
					return true;
				end;
				if toolSheet.CAd and array_contain(spell.book, books[3], #books) then
					return true;
				end;
				if toolSheet.CAr and array_contain(spell.book, books[4], #books) then
					return true;
				end;
				if toolSheet.CD and array_contain(spell.book, books[5], #books) then
					return true;
				end;
				if toolSheet.CC and array_contain(spell.book, books[6], #books) then
					return true;
				end;
				if toolSheet.CM and array_contain(spell.book, books[7], #books) then
					return true;
				end;
				if toolSheet.CS and array_contain(spell.book, books[8], #books) then
					return true;
				end;
				if toolSheet.CW and array_contain(spell.book, books[9], #books) then
					return true;
				end;

				return false;
			end

			local function filterTarget(spell)
				if toolSheet.Area and array_contain(spell.aiming, targets[1], #targets) then
					return true;
				end;
				if toolSheet.Effect and array_contain(spell.aiming, targets[2], #targets) then
					return true;
				end;
				if toolSheet.Target and array_contain(spell.aiming, targets[3], #targets) then
					return true;
				end;
				if toolSheet.Burst and array_contain(spell.aiming, targets[4], #targets) then
					return true;
				end;
				if toolSheet.Cone and array_contain(spell.aiming, targets[5], #targets) then
					return true;
				end;
				if toolSheet.Cylinder and array_contain(spell.aiming, targets[6], #targets) then
					return true;
				end;
				if toolSheet.Emanation and array_contain(spell.aiming, targets[7], #targets) then
					return true;
				end;
				if toolSheet.Line and array_contain(spell.aiming, targets[8], #targets) then
					return true;
				end;
				if toolSheet.Ray and array_contain(spell.aiming, targets[9], #targets) then
					return true;
				end;
				if toolSheet.Sphere and array_contain(spell.aiming, targets[10], #targets) then
					return true;
				end;
				if toolSheet.Spread and array_contain(spell.aiming, targets[11], #targets) then
					return true;
				end;
				if toolSheet.Shapeable and array_contain(spell.aiming, targets[12], #targets) then
					return true;
				end;
				if toolSheet.SpecialTarget and array_contain(spell.aiming, targets[13], #targets) then
					return true;
				end;
				return false;
			end;

			local function filterSave(spell)
				if toolSheet.fortitude and array_contain(spell.save, trs[1], #trs) then
					return true;
				end;
				if toolSheet.reflex and array_contain(spell.save, trs[2], #trs) then
					return true;
				end;
				if toolSheet.will and array_contain(spell.save, trs[3], #trs) then
					return true;
				end;
				if toolSheet.none and array_contain(spell.save, trs[4], #trs) then
					return true;
				end;
				if toolSheet.specialTR and array_contain(spell.save, trs[5], #trs) then
					return true;
				end;
				return false;
			end;

			local function filterSR(spell)
				if toolSheet.yes and array_contain(spell.sr, srs[1], #srs) then
					return true;
				end;
				if toolSheet.no and array_contain(spell.sr, srs[2], #srs) then
					return true;
				end;
				return false;
			end;

			local function trans(str)
				if str==nil then return "" end;
				return (tryLang(str) or str);
			end

			local function classToText(t)
				local ret = "";
				for k,v in pairs(t) do
					ret = ret .. trans(k) .. " " .. t[k] .. ", ";
				end;
				if ret:len()>=2 then 
					ret = ret:sub(1, -3);
				end;
				return ret;
			end;

			local function arrayToText(array, size)
				if array==nil then return "" end;
				local ret = "";
				for i=1, size, 1 do
					if array[i]~=nil then 
						ret = ret .. trans(array[i]) .. ", " 
					end;
				end;
				if ret:len()>=2 then 
					ret = ret:sub(1, -3);
				end;
				return ret;
			end;

			local function filterName(spell)
				if toolSheet.nameFilter==nil or toolSheet.nameFilter=="" then return true end;

				local filter = string.lower(Utils.removerAcentos(toolSheet.nameFilter));
				local nome1 = string.lower(Utils.removerAcentos(spell.name));
				local nome2 = string.lower(Utils.removerAcentos(trans(spell.name)));

				if string.find(nome1, filter) or string.find(nome2, filter) then
					return true;
				end;
				return false;
			end;
        


    obj.popDescription = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDescription:setParent(obj.frmSpells);
    obj.popDescription:setName("popDescription");
    obj.popDescription:setWidth(200);
    obj.popDescription:setHeight(200);
    obj.popDescription:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popDescription, "autoScopeNode",  "false");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popDescription);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("description");
    obj.textEditor1:setName("textEditor1");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.frmSpells);
    obj.layout6:setAlign("bottom");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout6);
    obj.button3:setAlign("left");
    obj.button3:setHorzTextAlign("center");
    obj.button3:setWidth(375);
    obj.button3:setText("Filtre!");
    obj.button3:setName("button3");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmSpells);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox2);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout7);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(75);
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setText("NOME");
    obj.checkBox1:setField("enableName");
    obj.checkBox1:setMargins({right=25,bottom=5,top=5});
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout7);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(275);
    obj.edit1:setField("nameFilter");
    obj.edit1:setName("edit1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox2);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(125);
    obj.layout8:setName("layout8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout9);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(75);
    obj.checkBox2:setHorzTextAlign("center");
    obj.checkBox2:setText("CLASSES");
    obj.checkBox2:setField("enableClasses");
    obj.checkBox2:setMargins({right=75});
    obj.checkBox2:setName("checkBox2");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout9);
    obj.radioButton1:setAlign("left");
    obj.radioButton1:setWidth(60);
    obj.radioButton1:setText("Todas");
    obj.radioButton1:setGroupName("grupoDeClasses");
    obj.radioButton1:setField("classRule");
    obj.radioButton1:setFieldValue("and");
    obj.radioButton1:setHint("Exibe magias apenas se elas pertencerem a todas classes selecionadas. ");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout9);
    obj.radioButton2:setAlign("left");
    obj.radioButton2:setWidth(110);
    obj.radioButton2:setText("Ao menos uma");
    obj.radioButton2:setGroupName("grupoDeClasses");
    obj.radioButton2:setField("classRule");
    obj.radioButton2:setFieldValue("or");
    obj.radioButton2:setHint("Exibe magias que pertençam ao menos a uma das classes selecionadas. ");
    obj.radioButton2:setName("radioButton2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout10);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setWidth(75);
    obj.checkBox3:setField("bard");
    obj.checkBox3:setText("Bardo");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout10);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setWidth(75);
    obj.checkBox4:setField("cleric");
    obj.checkBox4:setText("Clerigo");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout10);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setWidth(75);
    obj.checkBox5:setField("druid");
    obj.checkBox5:setText("Druida");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout10);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setHorzTextAlign("center");
    obj.checkBox6:setWidth(75);
    obj.checkBox6:setField("paladin");
    obj.checkBox6:setText("Paladino");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout10);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setHorzTextAlign("center");
    obj.checkBox7:setWidth(75);
    obj.checkBox7:setField("ranger");
    obj.checkBox7:setText("Ranger");
    obj.checkBox7:setName("checkBox7");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout11);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setHorzTextAlign("center");
    obj.checkBox8:setWidth(75);
    obj.checkBox8:setField("sorcerer");
    obj.checkBox8:setText("Feiticeiro");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout11);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setHorzTextAlign("center");
    obj.checkBox9:setWidth(75);
    obj.checkBox9:setField("wizard");
    obj.checkBox9:setText("Mago");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout11);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setHorzTextAlign("center");
    obj.checkBox10:setWidth(75);
    obj.checkBox10:setField("adept");
    obj.checkBox10:setText("Adepto");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout11);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setHorzTextAlign("center");
    obj.checkBox11:setWidth(75);
    obj.checkBox11:setField("assassin");
    obj.checkBox11:setText("Assassino");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout11);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setHorzTextAlign("center");
    obj.checkBox12:setWidth(75);
    obj.checkBox12:setField("blackguard");
    obj.checkBox12:setText("Algoz");
    obj.checkBox12:setName("checkBox12");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout12);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setHorzTextAlign("center");
    obj.checkBox13:setWidth(75);
    obj.checkBox13:setField("shugenja");
    obj.checkBox13:setText("Shugenja");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout12);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setHorzTextAlign("center");
    obj.checkBox14:setWidth(75);
    obj.checkBox14:setField("wu_jen");
    obj.checkBox14:setText("Wu-Jen");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout12);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setHorzTextAlign("center");
    obj.checkBox15:setWidth(75);
    obj.checkBox15:setField("warmage");
    obj.checkBox15:setText("Mago de Guerra");
    obj.checkBox15:setFontSize(8);
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout12);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setHorzTextAlign("center");
    obj.checkBox16:setWidth(75);
    obj.checkBox16:setField("hexblade");
    obj.checkBox16:setText("Lâmina Maldita");
    obj.checkBox16:setFontSize(8);
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout12);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setHorzTextAlign("center");
    obj.checkBox17:setWidth(75);
    obj.checkBox17:setField("domain");
    obj.checkBox17:setText("Dominio");
    obj.checkBox17:setName("checkBox17");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout13);
    obj.button4:setAlign("left");
    obj.button4:setHorzTextAlign("center");
    obj.button4:setWidth(187);
    obj.button4:setText("Marque Todas");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout13);
    obj.button5:setAlign("left");
    obj.button5:setHorzTextAlign("center");
    obj.button5:setWidth(187);
    obj.button5:setText("Desmarque Todas");
    obj.button5:setName("button5");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(100);
    obj.layout14:setName("layout14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout15);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(75);
    obj.checkBox18:setHorzTextAlign("center");
    obj.checkBox18:setText("NÍVEL");
    obj.checkBox18:setField("enableNivel");
    obj.checkBox18:setMargins({right=75});
    obj.checkBox18:setName("checkBox18");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout16);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setHorzTextAlign("center");
    obj.checkBox19:setWidth(75);
    obj.checkBox19:setField("lvl0");
    obj.checkBox19:setText("0");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout16);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setHorzTextAlign("center");
    obj.checkBox20:setWidth(75);
    obj.checkBox20:setField("lvl1");
    obj.checkBox20:setText("1");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout16);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setHorzTextAlign("center");
    obj.checkBox21:setWidth(75);
    obj.checkBox21:setField("lvl2");
    obj.checkBox21:setText("2");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout16);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setHorzTextAlign("center");
    obj.checkBox22:setWidth(75);
    obj.checkBox22:setField("lvl3");
    obj.checkBox22:setText("3");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout16);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setHorzTextAlign("center");
    obj.checkBox23:setWidth(75);
    obj.checkBox23:setField("lvl4");
    obj.checkBox23:setText("4");
    obj.checkBox23:setName("checkBox23");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout17);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setHorzTextAlign("center");
    obj.checkBox24:setWidth(75);
    obj.checkBox24:setField("lvl5");
    obj.checkBox24:setText("5");
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout17);
    obj.checkBox25:setAlign("left");
    obj.checkBox25:setHorzTextAlign("center");
    obj.checkBox25:setWidth(75);
    obj.checkBox25:setField("lvl6");
    obj.checkBox25:setText("6");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout17);
    obj.checkBox26:setAlign("left");
    obj.checkBox26:setHorzTextAlign("center");
    obj.checkBox26:setWidth(75);
    obj.checkBox26:setField("lvl7");
    obj.checkBox26:setText("7");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout17);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setHorzTextAlign("center");
    obj.checkBox27:setWidth(75);
    obj.checkBox27:setField("lvl8");
    obj.checkBox27:setText("8");
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout17);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setHorzTextAlign("center");
    obj.checkBox28:setWidth(75);
    obj.checkBox28:setField("lvl9");
    obj.checkBox28:setText("9");
    obj.checkBox28:setName("checkBox28");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout14);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout18);
    obj.button6:setAlign("left");
    obj.button6:setHorzTextAlign("center");
    obj.button6:setWidth(187);
    obj.button6:setText("Marque Todas");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout18);
    obj.button7:setAlign("left");
    obj.button7:setHorzTextAlign("center");
    obj.button7:setWidth(187);
    obj.button7:setText("Desmarque Todas");
    obj.button7:setName("button7");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox2);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(250);
    obj.layout19:setName("layout19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout20);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setWidth(150);
    obj.checkBox29:setHorzTextAlign("center");
    obj.checkBox29:setText("ESCOLA (SUBESCOLA)");
    obj.checkBox29:setField("enableSchool");
    obj.checkBox29:setMargins({right=0});
    obj.checkBox29:setName("checkBox29");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout19);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout21);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setHorzTextAlign("center");
    obj.checkBox30:setWidth(125);
    obj.checkBox30:setField("Abjuration");
    obj.checkBox30:setText("Abjuração");
    obj.checkBox30:setName("checkBox30");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout21);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setHorzTextAlign("center");
    obj.checkBox31:setWidth(125);
    obj.checkBox31:setField("Conjuration");
    obj.checkBox31:setText("Conjuração (Todas)");
    obj.checkBox31:setFontSize(10);
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout21);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setHorzTextAlign("center");
    obj.checkBox32:setWidth(125);
    obj.checkBox32:setField("Calling");
    obj.checkBox32:setText("Conjuração (Convocação)");
    obj.checkBox32:setFontSize(9);
    obj.checkBox32:setName("checkBox32");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout19);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout22);
    obj.checkBox33:setAlign("left");
    obj.checkBox33:setHorzTextAlign("center");
    obj.checkBox33:setWidth(125);
    obj.checkBox33:setField("Creation");
    obj.checkBox33:setText("Conjuração (Criação)");
    obj.checkBox33:setFontSize(10);
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout22);
    obj.checkBox34:setAlign("left");
    obj.checkBox34:setHorzTextAlign("center");
    obj.checkBox34:setWidth(125);
    obj.checkBox34:setField("Healing");
    obj.checkBox34:setText("Conjuração (Cura)");
    obj.checkBox34:setFontSize(10);
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout22);
    obj.checkBox35:setAlign("left");
    obj.checkBox35:setHorzTextAlign("center");
    obj.checkBox35:setWidth(125);
    obj.checkBox35:setField("Summoning");
    obj.checkBox35:setText("Conjuração (Invocação)");
    obj.checkBox35:setFontSize(10);
    obj.checkBox35:setName("checkBox35");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout19);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout23);
    obj.checkBox36:setAlign("left");
    obj.checkBox36:setHorzTextAlign("center");
    obj.checkBox36:setWidth(125);
    obj.checkBox36:setField("Teleportation");
    obj.checkBox36:setText("Conjuração (Teletransporte)");
    obj.checkBox36:setFontSize(8);
    obj.checkBox36:setName("checkBox36");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout23);
    obj.checkBox37:setAlign("left");
    obj.checkBox37:setHorzTextAlign("center");
    obj.checkBox37:setWidth(125);
    obj.checkBox37:setField("Divination");
    obj.checkBox37:setText("Adivinhação (Todas)");
    obj.checkBox37:setFontSize(10);
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout23);
    obj.checkBox38:setAlign("left");
    obj.checkBox38:setHorzTextAlign("center");
    obj.checkBox38:setWidth(125);
    obj.checkBox38:setField("Scrying");
    obj.checkBox38:setText("Adivinhação (Vidência)");
    obj.checkBox38:setFontSize(10);
    obj.checkBox38:setName("checkBox38");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout19);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout24);
    obj.checkBox39:setAlign("left");
    obj.checkBox39:setHorzTextAlign("center");
    obj.checkBox39:setWidth(125);
    obj.checkBox39:setField("Enchantment");
    obj.checkBox39:setText("Encantamento (Todas)");
    obj.checkBox39:setFontSize(10);
    obj.checkBox39:setName("checkBox39");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout24);
    obj.checkBox40:setAlign("left");
    obj.checkBox40:setHorzTextAlign("center");
    obj.checkBox40:setWidth(125);
    obj.checkBox40:setField("Charm");
    obj.checkBox40:setText("Encantamento (Feitiço)");
    obj.checkBox40:setFontSize(10);
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout24);
    obj.checkBox41:setAlign("left");
    obj.checkBox41:setHorzTextAlign("center");
    obj.checkBox41:setWidth(125);
    obj.checkBox41:setField("Compulsion");
    obj.checkBox41:setText("Encantamento (Compulsão)");
    obj.checkBox41:setFontSize(8);
    obj.checkBox41:setName("checkBox41");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout19);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout25);
    obj.checkBox42:setAlign("left");
    obj.checkBox42:setHorzTextAlign("center");
    obj.checkBox42:setWidth(125);
    obj.checkBox42:setField("Evocation");
    obj.checkBox42:setText("Evocação");
    obj.checkBox42:setName("checkBox42");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout25);
    obj.checkBox43:setAlign("left");
    obj.checkBox43:setHorzTextAlign("center");
    obj.checkBox43:setWidth(125);
    obj.checkBox43:setField("Illusion");
    obj.checkBox43:setText("Ilusão (Todas)");
    obj.checkBox43:setFontSize(12);
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout25);
    obj.checkBox44:setAlign("left");
    obj.checkBox44:setHorzTextAlign("center");
    obj.checkBox44:setWidth(125);
    obj.checkBox44:setField("Figment");
    obj.checkBox44:setText("Ilusão (Ídeia)");
    obj.checkBox44:setFontSize(12);
    obj.checkBox44:setName("checkBox44");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout19);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout26);
    obj.checkBox45:setAlign("left");
    obj.checkBox45:setHorzTextAlign("center");
    obj.checkBox45:setWidth(125);
    obj.checkBox45:setField("Glamer");
    obj.checkBox45:setText("Ilusão (Sensação)");
    obj.checkBox45:setFontSize(11);
    obj.checkBox45:setName("checkBox45");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout26);
    obj.checkBox46:setAlign("left");
    obj.checkBox46:setHorzTextAlign("center");
    obj.checkBox46:setWidth(125);
    obj.checkBox46:setField("Pattern");
    obj.checkBox46:setText("Ilusão (Padrão)");
    obj.checkBox46:setFontSize(12);
    obj.checkBox46:setName("checkBox46");

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout26);
    obj.checkBox47:setAlign("left");
    obj.checkBox47:setHorzTextAlign("center");
    obj.checkBox47:setWidth(125);
    obj.checkBox47:setField("Phantasm");
    obj.checkBox47:setText("Ilusão (Fantasma)");
    obj.checkBox47:setFontSize(11);
    obj.checkBox47:setName("checkBox47");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout19);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout27);
    obj.checkBox48:setAlign("left");
    obj.checkBox48:setHorzTextAlign("center");
    obj.checkBox48:setWidth(125);
    obj.checkBox48:setField("Shadow");
    obj.checkBox48:setText("Ilusão (Sombra)");
    obj.checkBox48:setName("checkBox48");

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout27);
    obj.checkBox49:setAlign("left");
    obj.checkBox49:setHorzTextAlign("center");
    obj.checkBox49:setWidth(125);
    obj.checkBox49:setField("Necromancy");
    obj.checkBox49:setText("Necromancia");
    obj.checkBox49:setName("checkBox49");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout19);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout28);
    obj.checkBox50:setAlign("left");
    obj.checkBox50:setHorzTextAlign("center");
    obj.checkBox50:setWidth(125);
    obj.checkBox50:setField("Transmutation");
    obj.checkBox50:setText("Transmutação");
    obj.checkBox50:setName("checkBox50");

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout28);
    obj.checkBox51:setAlign("left");
    obj.checkBox51:setHorzTextAlign("center");
    obj.checkBox51:setWidth(125);
    obj.checkBox51:setField("Polymorph");
    obj.checkBox51:setText("Transmutação (Polimorfismo)");
    obj.checkBox51:setFontSize(8);
    obj.checkBox51:setName("checkBox51");

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout28);
    obj.checkBox52:setAlign("left");
    obj.checkBox52:setHorzTextAlign("center");
    obj.checkBox52:setWidth(125);
    obj.checkBox52:setField("Universal");
    obj.checkBox52:setText("Universal");
    obj.checkBox52:setName("checkBox52");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout19);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout29);
    obj.button8:setAlign("left");
    obj.button8:setHorzTextAlign("center");
    obj.button8:setWidth(187);
    obj.button8:setText("Marque Todas");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout29);
    obj.button9:setAlign("left");
    obj.button9:setHorzTextAlign("center");
    obj.button9:setWidth(187);
    obj.button9:setText("Desmarque Todas");
    obj.button9:setName("button9");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(175);
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout31);
    obj.checkBox53:setAlign("left");
    obj.checkBox53:setWidth(100);
    obj.checkBox53:setHorzTextAlign("center");
    obj.checkBox53:setText("DESCRITOR");
    obj.checkBox53:setField("enableDescritor");
    obj.checkBox53:setMargins({right=50});
    obj.checkBox53:setName("checkBox53");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout32);
    obj.checkBox54:setAlign("left");
    obj.checkBox54:setHorzTextAlign("center");
    obj.checkBox54:setWidth(90);
    obj.checkBox54:setField("Acid");
    obj.checkBox54:setText("Ácido");
    obj.checkBox54:setName("checkBox54");

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout32);
    obj.checkBox55:setAlign("left");
    obj.checkBox55:setHorzTextAlign("center");
    obj.checkBox55:setWidth(90);
    obj.checkBox55:setField("Air");
    obj.checkBox55:setText("Ar");
    obj.checkBox55:setName("checkBox55");

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout32);
    obj.checkBox56:setAlign("left");
    obj.checkBox56:setHorzTextAlign("center");
    obj.checkBox56:setWidth(90);
    obj.checkBox56:setField("Chaotic");
    obj.checkBox56:setText("Caos");
    obj.checkBox56:setName("checkBox56");

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout32);
    obj.checkBox57:setAlign("left");
    obj.checkBox57:setHorzTextAlign("center");
    obj.checkBox57:setWidth(90);
    obj.checkBox57:setField("Cold");
    obj.checkBox57:setText("Frio");
    obj.checkBox57:setName("checkBox57");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout33);
    obj.checkBox58:setAlign("left");
    obj.checkBox58:setHorzTextAlign("center");
    obj.checkBox58:setWidth(90);
    obj.checkBox58:setField("Darkness");
    obj.checkBox58:setText("Escuridão");
    obj.checkBox58:setName("checkBox58");

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout33);
    obj.checkBox59:setAlign("left");
    obj.checkBox59:setHorzTextAlign("center");
    obj.checkBox59:setWidth(90);
    obj.checkBox59:setField("Death");
    obj.checkBox59:setText("Morte");
    obj.checkBox59:setName("checkBox59");

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout33);
    obj.checkBox60:setAlign("left");
    obj.checkBox60:setHorzTextAlign("center");
    obj.checkBox60:setWidth(90);
    obj.checkBox60:setField("Earth");
    obj.checkBox60:setText("Terra");
    obj.checkBox60:setName("checkBox60");

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout33);
    obj.checkBox61:setAlign("left");
    obj.checkBox61:setHorzTextAlign("center");
    obj.checkBox61:setWidth(90);
    obj.checkBox61:setField("Electricity");
    obj.checkBox61:setText("Eletricidade");
    obj.checkBox61:setName("checkBox61");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout30);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout34);
    obj.checkBox62:setAlign("left");
    obj.checkBox62:setHorzTextAlign("center");
    obj.checkBox62:setWidth(90);
    obj.checkBox62:setField("Evil");
    obj.checkBox62:setText("Mal");
    obj.checkBox62:setName("checkBox62");

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout34);
    obj.checkBox63:setAlign("left");
    obj.checkBox63:setHorzTextAlign("center");
    obj.checkBox63:setWidth(90);
    obj.checkBox63:setField("Fear");
    obj.checkBox63:setText("Medo");
    obj.checkBox63:setName("checkBox63");

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout34);
    obj.checkBox64:setAlign("left");
    obj.checkBox64:setHorzTextAlign("center");
    obj.checkBox64:setWidth(90);
    obj.checkBox64:setField("Fire");
    obj.checkBox64:setText("Fogo");
    obj.checkBox64:setName("checkBox64");

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout34);
    obj.checkBox65:setAlign("left");
    obj.checkBox65:setHorzTextAlign("center");
    obj.checkBox65:setWidth(90);
    obj.checkBox65:setField("Force");
    obj.checkBox65:setText("Energia");
    obj.checkBox65:setName("checkBox65");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout30);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout35);
    obj.checkBox66:setAlign("left");
    obj.checkBox66:setHorzTextAlign("center");
    obj.checkBox66:setWidth(90);
    obj.checkBox66:setField("Good");
    obj.checkBox66:setText("Bem");
    obj.checkBox66:setName("checkBox66");

    obj.checkBox67 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout35);
    obj.checkBox67:setAlign("left");
    obj.checkBox67:setHorzTextAlign("center");
    obj.checkBox67:setWidth(90);
    obj.checkBox67:setField("Language_Dependent");
    obj.checkBox67:setText("Dep. de Idioma");
    obj.checkBox67:setFontSize(10);
    obj.checkBox67:setName("checkBox67");

    obj.checkBox68 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout35);
    obj.checkBox68:setAlign("left");
    obj.checkBox68:setHorzTextAlign("center");
    obj.checkBox68:setWidth(90);
    obj.checkBox68:setField("Lawful");
    obj.checkBox68:setText("Ordem");
    obj.checkBox68:setName("checkBox68");

    obj.checkBox69 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout35);
    obj.checkBox69:setAlign("left");
    obj.checkBox69:setHorzTextAlign("center");
    obj.checkBox69:setWidth(90);
    obj.checkBox69:setField("Light");
    obj.checkBox69:setText("Luz");
    obj.checkBox69:setName("checkBox69");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout30);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.checkBox70 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout36);
    obj.checkBox70:setAlign("left");
    obj.checkBox70:setHorzTextAlign("center");
    obj.checkBox70:setWidth(90);
    obj.checkBox70:setField("Mind_Affecting");
    obj.checkBox70:setText("Ação Mental");
    obj.checkBox70:setFontSize(12);
    obj.checkBox70:setName("checkBox70");

    obj.checkBox71 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout36);
    obj.checkBox71:setAlign("left");
    obj.checkBox71:setHorzTextAlign("center");
    obj.checkBox71:setWidth(90);
    obj.checkBox71:setField("Sonic");
    obj.checkBox71:setText("Sônico");
    obj.checkBox71:setName("checkBox71");

    obj.checkBox72 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout36);
    obj.checkBox72:setAlign("left");
    obj.checkBox72:setHorzTextAlign("center");
    obj.checkBox72:setWidth(90);
    obj.checkBox72:setField("Water");
    obj.checkBox72:setText("Água");
    obj.checkBox72:setName("checkBox72");

    obj.checkBox73 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout36);
    obj.checkBox73:setAlign("left");
    obj.checkBox73:setHorzTextAlign("center");
    obj.checkBox73:setWidth(90);
    obj.checkBox73:setField("None");
    obj.checkBox73:setText("Nenhum");
    obj.checkBox73:setName("checkBox73");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout30);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout37);
    obj.button10:setAlign("left");
    obj.button10:setHorzTextAlign("center");
    obj.button10:setWidth(187);
    obj.button10:setText("Marque Todas");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout37);
    obj.button11:setAlign("left");
    obj.button11:setHorzTextAlign("center");
    obj.button11:setWidth(187);
    obj.button11:setText("Desmarque Todas");
    obj.button11:setName("button11");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(100);
    obj.layout38:setName("layout38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.checkBox74 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout39);
    obj.checkBox74:setAlign("left");
    obj.checkBox74:setWidth(125);
    obj.checkBox74:setHorzTextAlign("center");
    obj.checkBox74:setText("COMPONENTES");
    obj.checkBox74:setField("enableComponentes");
    obj.checkBox74:setMargins({right=0});
    obj.checkBox74:setName("checkBox74");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout39);
    obj.radioButton3:setAlign("left");
    obj.radioButton3:setWidth(60);
    obj.radioButton3:setText("Todas");
    obj.radioButton3:setGroupName("grupoDeComponentes");
    obj.radioButton3:setField("componentRule");
    obj.radioButton3:setFieldValue("and");
    obj.radioButton3:setHint("Exibe magias apenas se ela usa todos componentes selecionados. ");
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout39);
    obj.radioButton4:setAlign("left");
    obj.radioButton4:setWidth(110);
    obj.radioButton4:setText("Ao menos um");
    obj.radioButton4:setGroupName("grupoDeComponentes");
    obj.radioButton4:setField("componentRule");
    obj.radioButton4:setFieldValue("or");
    obj.radioButton4:setHint("Exibe magias que usem ao menos um dos componentes selecionados.  ");
    obj.radioButton4:setName("radioButton4");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout39);
    obj.radioButton5:setAlign("left");
    obj.radioButton5:setWidth(75);
    obj.radioButton5:setText("Nenhum");
    obj.radioButton5:setGroupName("grupoDeComponentes");
    obj.radioButton5:setField("componentRule");
    obj.radioButton5:setFieldValue("not");
    obj.radioButton5:setHint("Exibe magias apenas se ela usa não usa nenhum componentes selecionados. ");
    obj.radioButton5:setName("radioButton5");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout38);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.checkBox75 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout40);
    obj.checkBox75:setAlign("left");
    obj.checkBox75:setHorzTextAlign("center");
    obj.checkBox75:setWidth(90);
    obj.checkBox75:setField("V");
    obj.checkBox75:setText("Verbal");
    obj.checkBox75:setName("checkBox75");

    obj.checkBox76 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout40);
    obj.checkBox76:setAlign("left");
    obj.checkBox76:setHorzTextAlign("center");
    obj.checkBox76:setWidth(90);
    obj.checkBox76:setField("S");
    obj.checkBox76:setText("Gestos");
    obj.checkBox76:setName("checkBox76");

    obj.checkBox77 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout40);
    obj.checkBox77:setAlign("left");
    obj.checkBox77:setHorzTextAlign("center");
    obj.checkBox77:setWidth(90);
    obj.checkBox77:setField("M");
    obj.checkBox77:setText("Material");
    obj.checkBox77:setName("checkBox77");

    obj.checkBox78 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout40);
    obj.checkBox78:setAlign("left");
    obj.checkBox78:setHorzTextAlign("center");
    obj.checkBox78:setWidth(90);
    obj.checkBox78:setField("F");
    obj.checkBox78:setText("Foco");
    obj.checkBox78:setName("checkBox78");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout38);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.checkBox79 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout41);
    obj.checkBox79:setAlign("left");
    obj.checkBox79:setHorzTextAlign("center");
    obj.checkBox79:setWidth(90);
    obj.checkBox79:setField("DF");
    obj.checkBox79:setText("Foco Divino");
    obj.checkBox79:setName("checkBox79");

    obj.checkBox80 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout41);
    obj.checkBox80:setAlign("left");
    obj.checkBox80:setHorzTextAlign("center");
    obj.checkBox80:setWidth(90);
    obj.checkBox80:setField("XP");
    obj.checkBox80:setText("Experiencia");
    obj.checkBox80:setName("checkBox80");

    obj.checkBox81 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout41);
    obj.checkBox81:setAlign("left");
    obj.checkBox81:setHorzTextAlign("center");
    obj.checkBox81:setWidth(90);
    obj.checkBox81:setField("N");
    obj.checkBox81:setText("Nenhum");
    obj.checkBox81:setName("checkBox81");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout38);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout42);
    obj.button12:setAlign("left");
    obj.button12:setHorzTextAlign("center");
    obj.button12:setWidth(187);
    obj.button12:setText("Marque Todas");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout42);
    obj.button13:setAlign("left");
    obj.button13:setHorzTextAlign("center");
    obj.button13:setWidth(187);
    obj.button13:setText("Desmarque Todas");
    obj.button13:setName("button13");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox2);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(150);
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.checkBox82 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout44);
    obj.checkBox82:setAlign("left");
    obj.checkBox82:setWidth(75);
    obj.checkBox82:setHorzTextAlign("center");
    obj.checkBox82:setText("ALCANCE");
    obj.checkBox82:setField("enableAlcance");
    obj.checkBox82:setMargins({right=75});
    obj.checkBox82:setName("checkBox82");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout43);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.checkBox83 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout45);
    obj.checkBox83:setAlign("left");
    obj.checkBox83:setHorzTextAlign("center");
    obj.checkBox83:setWidth(90);
    obj.checkBox83:setField("fixo3m");
    obj.checkBox83:setText("3m");
    obj.checkBox83:setName("checkBox83");

    obj.checkBox84 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout45);
    obj.checkBox84:setAlign("left");
    obj.checkBox84:setHorzTextAlign("center");
    obj.checkBox84:setWidth(90);
    obj.checkBox84:setField("fixo6m");
    obj.checkBox84:setText("6m");
    obj.checkBox84:setName("checkBox84");

    obj.checkBox85 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout45);
    obj.checkBox85:setAlign("left");
    obj.checkBox85:setHorzTextAlign("center");
    obj.checkBox85:setWidth(90);
    obj.checkBox85:setField("fixo9m");
    obj.checkBox85:setText("9m");
    obj.checkBox85:setName("checkBox85");

    obj.checkBox86 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout45);
    obj.checkBox86:setAlign("left");
    obj.checkBox86:setHorzTextAlign("center");
    obj.checkBox86:setWidth(90);
    obj.checkBox86:setField("fixo12m");
    obj.checkBox86:setText("12m");
    obj.checkBox86:setName("checkBox86");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout43);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.checkBox87 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout46);
    obj.checkBox87:setAlign("left");
    obj.checkBox87:setHorzTextAlign("center");
    obj.checkBox87:setWidth(90);
    obj.checkBox87:setField("fixo15m");
    obj.checkBox87:setText("15m");
    obj.checkBox87:setName("checkBox87");

    obj.checkBox88 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout46);
    obj.checkBox88:setAlign("left");
    obj.checkBox88:setHorzTextAlign("center");
    obj.checkBox88:setWidth(90);
    obj.checkBox88:setField("fixo18m");
    obj.checkBox88:setText("18m");
    obj.checkBox88:setName("checkBox88");

    obj.checkBox89 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout46);
    obj.checkBox89:setAlign("left");
    obj.checkBox89:setHorzTextAlign("center");
    obj.checkBox89:setWidth(90);
    obj.checkBox89:setField("Close");
    obj.checkBox89:setText("Curto");
    obj.checkBox89:setName("checkBox89");

    obj.checkBox90 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout46);
    obj.checkBox90:setAlign("left");
    obj.checkBox90:setHorzTextAlign("center");
    obj.checkBox90:setWidth(90);
    obj.checkBox90:setField("Medium");
    obj.checkBox90:setText("Médio");
    obj.checkBox90:setName("checkBox90");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout43);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.checkBox91 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout47);
    obj.checkBox91:setAlign("left");
    obj.checkBox91:setHorzTextAlign("center");
    obj.checkBox91:setWidth(90);
    obj.checkBox91:setField("Long");
    obj.checkBox91:setText("Longo");
    obj.checkBox91:setName("checkBox91");

    obj.checkBox92 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.layout47);
    obj.checkBox92:setAlign("left");
    obj.checkBox92:setHorzTextAlign("center");
    obj.checkBox92:setWidth(90);
    obj.checkBox92:setField("Personal");
    obj.checkBox92:setText("Pessoal");
    obj.checkBox92:setName("checkBox92");

    obj.checkBox93 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.layout47);
    obj.checkBox93:setAlign("left");
    obj.checkBox93:setHorzTextAlign("center");
    obj.checkBox93:setWidth(90);
    obj.checkBox93:setField("Touch");
    obj.checkBox93:setText("Toque");
    obj.checkBox93:setName("checkBox93");

    obj.checkBox94 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.layout47);
    obj.checkBox94:setAlign("left");
    obj.checkBox94:setHorzTextAlign("center");
    obj.checkBox94:setWidth(90);
    obj.checkBox94:setField("Special");
    obj.checkBox94:setText("Especial");
    obj.checkBox94:setName("checkBox94");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout43);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.checkBox95 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.layout48);
    obj.checkBox95:setAlign("left");
    obj.checkBox95:setHorzTextAlign("center");
    obj.checkBox95:setWidth(90);
    obj.checkBox95:setField("Adjacent");
    obj.checkBox95:setText("Adjacente");
    obj.checkBox95:setName("checkBox95");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout43);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout49);
    obj.button14:setAlign("left");
    obj.button14:setHorzTextAlign("center");
    obj.button14:setWidth(187);
    obj.button14:setText("Marque Todas");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout49);
    obj.button15:setAlign("left");
    obj.button15:setHorzTextAlign("center");
    obj.button15:setWidth(187);
    obj.button15:setText("Desmarque Todas");
    obj.button15:setName("button15");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox2);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(125);
    obj.layout50:setName("layout50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.checkBox96 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.layout51);
    obj.checkBox96:setAlign("left");
    obj.checkBox96:setWidth(100);
    obj.checkBox96:setHorzTextAlign("center");
    obj.checkBox96:setText("DURAÇÃO");
    obj.checkBox96:setField("enableDuracao");
    obj.checkBox96:setMargins({right=50});
    obj.checkBox96:setName("checkBox96");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.checkBox97 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.layout52);
    obj.checkBox97:setAlign("left");
    obj.checkBox97:setHorzTextAlign("center");
    obj.checkBox97:setWidth(125);
    obj.checkBox97:setField("Concentration");
    obj.checkBox97:setText("Concentração");
    obj.checkBox97:setName("checkBox97");

    obj.checkBox98 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.layout52);
    obj.checkBox98:setAlign("left");
    obj.checkBox98:setHorzTextAlign("center");
    obj.checkBox98:setWidth(125);
    obj.checkBox98:setField("Dismissible");
    obj.checkBox98:setText("Dissipavel");
    obj.checkBox98:setName("checkBox98");

    obj.checkBox99 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.layout52);
    obj.checkBox99:setAlign("left");
    obj.checkBox99:setHorzTextAlign("center");
    obj.checkBox99:setWidth(125);
    obj.checkBox99:setField("SpecialDuration");
    obj.checkBox99:setText("Especial");
    obj.checkBox99:setName("checkBox99");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.checkBox100 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.layout53);
    obj.checkBox100:setAlign("left");
    obj.checkBox100:setHorzTextAlign("center");
    obj.checkBox100:setWidth(125);
    obj.checkBox100:setField("Instantaneous");
    obj.checkBox100:setText("Instantaneo");
    obj.checkBox100:setName("checkBox100");

    obj.checkBox101 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.layout53);
    obj.checkBox101:setAlign("left");
    obj.checkBox101:setHorzTextAlign("center");
    obj.checkBox101:setWidth(125);
    obj.checkBox101:setField("Rounds");
    obj.checkBox101:setText("Rodadas");
    obj.checkBox101:setName("checkBox101");

    obj.checkBox102 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.layout53);
    obj.checkBox102:setAlign("left");
    obj.checkBox102:setHorzTextAlign("center");
    obj.checkBox102:setWidth(125);
    obj.checkBox102:setField("Minutes");
    obj.checkBox102:setText("Minutos");
    obj.checkBox102:setName("checkBox102");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout50);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.checkBox103 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.layout54);
    obj.checkBox103:setAlign("left");
    obj.checkBox103:setHorzTextAlign("center");
    obj.checkBox103:setWidth(125);
    obj.checkBox103:setField("Hours");
    obj.checkBox103:setText("Horas");
    obj.checkBox103:setName("checkBox103");

    obj.checkBox104 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.layout54);
    obj.checkBox104:setAlign("left");
    obj.checkBox104:setHorzTextAlign("center");
    obj.checkBox104:setWidth(125);
    obj.checkBox104:setField("Days");
    obj.checkBox104:setText("Dias");
    obj.checkBox104:setName("checkBox104");

    obj.checkBox105 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.layout54);
    obj.checkBox105:setAlign("left");
    obj.checkBox105:setHorzTextAlign("center");
    obj.checkBox105:setWidth(125);
    obj.checkBox105:setField("Permanent");
    obj.checkBox105:setText("Permanente");
    obj.checkBox105:setName("checkBox105");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout50);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout55);
    obj.button16:setAlign("left");
    obj.button16:setHorzTextAlign("center");
    obj.button16:setWidth(187);
    obj.button16:setText("Marque Todas");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout55);
    obj.button17:setAlign("left");
    obj.button17:setHorzTextAlign("center");
    obj.button17:setWidth(187);
    obj.button17:setText("Desmarque Todas");
    obj.button17:setName("button17");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox2);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(150);
    obj.layout56:setName("layout56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.checkBox106 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.layout57);
    obj.checkBox106:setAlign("left");
    obj.checkBox106:setWidth(75);
    obj.checkBox106:setHorzTextAlign("center");
    obj.checkBox106:setText("ALVO");
    obj.checkBox106:setField("enableAlvo");
    obj.checkBox106:setMargins({right=75});
    obj.checkBox106:setName("checkBox106");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout56);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.checkBox107 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.layout58);
    obj.checkBox107:setAlign("left");
    obj.checkBox107:setHorzTextAlign("center");
    obj.checkBox107:setWidth(90);
    obj.checkBox107:setField("Area");
    obj.checkBox107:setText("Area");
    obj.checkBox107:setName("checkBox107");

    obj.checkBox108 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.layout58);
    obj.checkBox108:setAlign("left");
    obj.checkBox108:setHorzTextAlign("center");
    obj.checkBox108:setWidth(90);
    obj.checkBox108:setField("Effect");
    obj.checkBox108:setText("Efeito");
    obj.checkBox108:setName("checkBox108");

    obj.checkBox109 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.layout58);
    obj.checkBox109:setAlign("left");
    obj.checkBox109:setHorzTextAlign("center");
    obj.checkBox109:setWidth(90);
    obj.checkBox109:setField("Target");
    obj.checkBox109:setText("Alvo");
    obj.checkBox109:setName("checkBox109");

    obj.checkBox110 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.layout58);
    obj.checkBox110:setAlign("left");
    obj.checkBox110:setHorzTextAlign("center");
    obj.checkBox110:setWidth(90);
    obj.checkBox110:setField("Burst");
    obj.checkBox110:setText("Explosão");
    obj.checkBox110:setName("checkBox110");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout56);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.checkBox111 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.layout59);
    obj.checkBox111:setAlign("left");
    obj.checkBox111:setHorzTextAlign("center");
    obj.checkBox111:setWidth(90);
    obj.checkBox111:setField("Cone");
    obj.checkBox111:setText("Cone");
    obj.checkBox111:setName("checkBox111");

    obj.checkBox112 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox112:setParent(obj.layout59);
    obj.checkBox112:setAlign("left");
    obj.checkBox112:setHorzTextAlign("center");
    obj.checkBox112:setWidth(90);
    obj.checkBox112:setField("Cylinder");
    obj.checkBox112:setText("Cilindro");
    obj.checkBox112:setName("checkBox112");

    obj.checkBox113 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox113:setParent(obj.layout59);
    obj.checkBox113:setAlign("left");
    obj.checkBox113:setHorzTextAlign("center");
    obj.checkBox113:setWidth(90);
    obj.checkBox113:setField("Emanation");
    obj.checkBox113:setText("Emanação");
    obj.checkBox113:setName("checkBox113");

    obj.checkBox114 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox114:setParent(obj.layout59);
    obj.checkBox114:setAlign("left");
    obj.checkBox114:setHorzTextAlign("center");
    obj.checkBox114:setWidth(90);
    obj.checkBox114:setField("Line");
    obj.checkBox114:setText("Linha");
    obj.checkBox114:setName("checkBox114");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout56);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.checkBox115 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox115:setParent(obj.layout60);
    obj.checkBox115:setAlign("left");
    obj.checkBox115:setHorzTextAlign("center");
    obj.checkBox115:setWidth(90);
    obj.checkBox115:setField("Ray");
    obj.checkBox115:setText("Raio");
    obj.checkBox115:setName("checkBox115");

    obj.checkBox116 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox116:setParent(obj.layout60);
    obj.checkBox116:setAlign("left");
    obj.checkBox116:setHorzTextAlign("center");
    obj.checkBox116:setWidth(90);
    obj.checkBox116:setField("Sphere");
    obj.checkBox116:setText("Esfera");
    obj.checkBox116:setName("checkBox116");

    obj.checkBox117 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox117:setParent(obj.layout60);
    obj.checkBox117:setAlign("left");
    obj.checkBox117:setHorzTextAlign("center");
    obj.checkBox117:setWidth(90);
    obj.checkBox117:setField("Spread");
    obj.checkBox117:setText("Disperção");
    obj.checkBox117:setName("checkBox117");

    obj.checkBox118 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox118:setParent(obj.layout60);
    obj.checkBox118:setAlign("left");
    obj.checkBox118:setHorzTextAlign("center");
    obj.checkBox118:setWidth(90);
    obj.checkBox118:setField("Shapeable");
    obj.checkBox118:setText("Moldavel");
    obj.checkBox118:setName("checkBox118");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout56);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.checkBox119 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox119:setParent(obj.layout61);
    obj.checkBox119:setAlign("left");
    obj.checkBox119:setHorzTextAlign("center");
    obj.checkBox119:setWidth(90);
    obj.checkBox119:setField("SpecialTarget");
    obj.checkBox119:setText("Especial");
    obj.checkBox119:setName("checkBox119");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout56);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout62);
    obj.button18:setAlign("left");
    obj.button18:setHorzTextAlign("center");
    obj.button18:setWidth(187);
    obj.button18:setText("Marque Todas");
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout62);
    obj.button19:setAlign("left");
    obj.button19:setHorzTextAlign("center");
    obj.button19:setWidth(187);
    obj.button19:setText("Desmarque Todas");
    obj.button19:setName("button19");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.scrollBox2);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(75);
    obj.layout63:setName("layout63");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout63);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.checkBox120 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox120:setParent(obj.layout64);
    obj.checkBox120:setAlign("left");
    obj.checkBox120:setWidth(100);
    obj.checkBox120:setHorzTextAlign("center");
    obj.checkBox120:setText("RESISTENCIA");
    obj.checkBox120:setField("enableResistencia");
    obj.checkBox120:setMargins({right=50});
    obj.checkBox120:setName("checkBox120");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout63);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.checkBox121 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox121:setParent(obj.layout65);
    obj.checkBox121:setAlign("left");
    obj.checkBox121:setHorzTextAlign("center");
    obj.checkBox121:setWidth(75);
    obj.checkBox121:setField("fortitude");
    obj.checkBox121:setText("Fortitude");
    obj.checkBox121:setName("checkBox121");

    obj.checkBox122 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox122:setParent(obj.layout65);
    obj.checkBox122:setAlign("left");
    obj.checkBox122:setHorzTextAlign("center");
    obj.checkBox122:setWidth(75);
    obj.checkBox122:setField("reflex");
    obj.checkBox122:setText("Reflexos");
    obj.checkBox122:setName("checkBox122");

    obj.checkBox123 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox123:setParent(obj.layout65);
    obj.checkBox123:setAlign("left");
    obj.checkBox123:setHorzTextAlign("center");
    obj.checkBox123:setWidth(75);
    obj.checkBox123:setField("will");
    obj.checkBox123:setText("Vontade");
    obj.checkBox123:setName("checkBox123");

    obj.checkBox124 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox124:setParent(obj.layout65);
    obj.checkBox124:setAlign("left");
    obj.checkBox124:setHorzTextAlign("center");
    obj.checkBox124:setWidth(75);
    obj.checkBox124:setField("none");
    obj.checkBox124:setText("Nenhum");
    obj.checkBox124:setName("checkBox124");

    obj.checkBox125 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox125:setParent(obj.layout65);
    obj.checkBox125:setAlign("left");
    obj.checkBox125:setHorzTextAlign("center");
    obj.checkBox125:setWidth(75);
    obj.checkBox125:setField("specialTR");
    obj.checkBox125:setText("Especial");
    obj.checkBox125:setName("checkBox125");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout63);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout66);
    obj.button20:setAlign("left");
    obj.button20:setHorzTextAlign("center");
    obj.button20:setWidth(187);
    obj.button20:setText("Marque Todas");
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout66);
    obj.button21:setAlign("left");
    obj.button21:setHorzTextAlign("center");
    obj.button21:setWidth(187);
    obj.button21:setText("Desmarque Todas");
    obj.button21:setName("button21");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.scrollBox2);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(75);
    obj.layout67:setName("layout67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.checkBox126 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox126:setParent(obj.layout68);
    obj.checkBox126:setAlign("left");
    obj.checkBox126:setWidth(75);
    obj.checkBox126:setHorzTextAlign("center");
    obj.checkBox126:setText("RM");
    obj.checkBox126:setField("enableRm");
    obj.checkBox126:setMargins({right=75});
    obj.checkBox126:setName("checkBox126");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout67);
    obj.layout69:setAlign("top");
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.checkBox127 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox127:setParent(obj.layout69);
    obj.checkBox127:setAlign("left");
    obj.checkBox127:setHorzTextAlign("center");
    obj.checkBox127:setWidth(187);
    obj.checkBox127:setField("yes");
    obj.checkBox127:setText("Sim");
    obj.checkBox127:setName("checkBox127");

    obj.checkBox128 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox128:setParent(obj.layout69);
    obj.checkBox128:setAlign("left");
    obj.checkBox128:setHorzTextAlign("center");
    obj.checkBox128:setWidth(187);
    obj.checkBox128:setField("no");
    obj.checkBox128:setText("Não");
    obj.checkBox128:setName("checkBox128");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout67);
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout70);
    obj.button22:setAlign("left");
    obj.button22:setHorzTextAlign("center");
    obj.button22:setWidth(187);
    obj.button22:setText("Marque Todas");
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout70);
    obj.button23:setAlign("left");
    obj.button23:setHorzTextAlign("center");
    obj.button23:setWidth(187);
    obj.button23:setText("Desmarque Todas");
    obj.button23:setName("button23");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.scrollBox2);
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(125);
    obj.layout71:setName("layout71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.checkBox129 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox129:setParent(obj.layout72);
    obj.checkBox129:setAlign("left");
    obj.checkBox129:setWidth(75);
    obj.checkBox129:setHorzTextAlign("center");
    obj.checkBox129:setText("LIVRO");
    obj.checkBox129:setField("enableLivro");
    obj.checkBox129:setMargins({right=75});
    obj.checkBox129:setName("checkBox129");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout71);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.checkBox130 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox130:setParent(obj.layout73);
    obj.checkBox130:setAlign("left");
    obj.checkBox130:setHorzTextAlign("center");
    obj.checkBox130:setWidth(125);
    obj.checkBox130:setField("PHB");
    obj.checkBox130:setText("Jogador");
    obj.checkBox130:setName("checkBox130");

    obj.checkBox131 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox131:setParent(obj.layout73);
    obj.checkBox131:setAlign("left");
    obj.checkBox131:setHorzTextAlign("center");
    obj.checkBox131:setWidth(125);
    obj.checkBox131:setField("ELH");
    obj.checkBox131:setText("Níveis Épicos");
    obj.checkBox131:setName("checkBox131");

    obj.checkBox132 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox132:setParent(obj.layout73);
    obj.checkBox132:setAlign("left");
    obj.checkBox132:setHorzTextAlign("center");
    obj.checkBox132:setWidth(125);
    obj.checkBox132:setField("CAd");
    obj.checkBox132:setText("Comp. Aventureiro");
    obj.checkBox132:setFontSize(11);
    obj.checkBox132:setName("checkBox132");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout71);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.checkBox133 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox133:setParent(obj.layout74);
    obj.checkBox133:setAlign("left");
    obj.checkBox133:setHorzTextAlign("center");
    obj.checkBox133:setWidth(125);
    obj.checkBox133:setField("CAr");
    obj.checkBox133:setText("Comp. Arcano");
    obj.checkBox133:setName("checkBox133");

    obj.checkBox134 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox134:setParent(obj.layout74);
    obj.checkBox134:setAlign("left");
    obj.checkBox134:setHorzTextAlign("center");
    obj.checkBox134:setWidth(125);
    obj.checkBox134:setField("CD");
    obj.checkBox134:setText("Comp. Divino");
    obj.checkBox134:setName("checkBox134");

    obj.checkBox135 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox135:setParent(obj.layout74);
    obj.checkBox135:setAlign("left");
    obj.checkBox135:setHorzTextAlign("center");
    obj.checkBox135:setWidth(125);
    obj.checkBox135:setField("CC");
    obj.checkBox135:setText("Comp. Campeão");
    obj.checkBox135:setName("checkBox135");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout71);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.checkBox136 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox136:setParent(obj.layout75);
    obj.checkBox136:setAlign("left");
    obj.checkBox136:setHorzTextAlign("center");
    obj.checkBox136:setWidth(125);
    obj.checkBox136:setField("CM");
    obj.checkBox136:setText("Comp. Mago");
    obj.checkBox136:setName("checkBox136");

    obj.checkBox137 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox137:setParent(obj.layout75);
    obj.checkBox137:setAlign("left");
    obj.checkBox137:setHorzTextAlign("center");
    obj.checkBox137:setWidth(125);
    obj.checkBox137:setField("CS");
    obj.checkBox137:setText("Comp. Patife");
    obj.checkBox137:setName("checkBox137");

    obj.checkBox138 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox138:setParent(obj.layout75);
    obj.checkBox138:setAlign("left");
    obj.checkBox138:setHorzTextAlign("center");
    obj.checkBox138:setWidth(125);
    obj.checkBox138:setField("CW");
    obj.checkBox138:setText("Comp. Guerreiro");
    obj.checkBox138:setName("checkBox138");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout71);
    obj.layout76:setAlign("top");
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout76);
    obj.button24:setAlign("left");
    obj.button24:setHorzTextAlign("center");
    obj.button24:setWidth(187);
    obj.button24:setText("Marque Todas");
    obj.button24:setName("button24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout76);
    obj.button25:setAlign("left");
    obj.button25:setHorzTextAlign("center");
    obj.button25:setWidth(187);
    obj.button25:setText("Desmarque Todas");
    obj.button25:setName("button25");

    obj.spellListTab = GUI.fromHandle(_obj_newObject("tab"));
    obj.spellListTab:setParent(obj.tabControl2);
    obj.spellListTab:setTitle("Lista");
    obj.spellListTab:setName("spellListTab");

    obj.frmSpellsList = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSpellsList:setParent(obj.spellListTab);
    obj.frmSpellsList:setName("frmSpellsList");
    obj.frmSpellsList:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmSpellsList);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.spellList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.spellList:setParent(obj.scrollBox3);
    obj.spellList:setAlign("top");
    obj.spellList:setHeight(260);
    obj.spellList:setField("spellList");
    obj.spellList:setName("spellList");
    obj.spellList:setTemplateForm("frmSpellItem");
    obj.spellList:setAutoHeight(true);

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.frmSpellsList);
    obj.layout77:setAlign("bottom");
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout77);
    obj.button26:setAlign("left");
    obj.button26:setHorzTextAlign("center");
    obj.button26:setWidth(150);
    obj.button26:setText("Anterior");
    obj.button26:setName("button26");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout77);
    obj.label9:setAlign("left");
    obj.label9:setField("SpellsPage");
    obj.label9:setWidth(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout77);
    obj.label10:setAlign("left");
    obj.label10:setText("/");
    obj.label10:setWidth(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout77);
    obj.label11:setAlign("left");
    obj.label11:setField("maxSpellPages");
    obj.label11:setWidth(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout77);
    obj.button27:setAlign("left");
    obj.button27:setHorzTextAlign("center");
    obj.button27:setWidth(150);
    obj.button27:setText("Proximo");
    obj.button27:setName("button27");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Itens Mágicos");
    obj.tab4:setName("tab4");

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.tab4);
    obj.tabControl3:setAlign("client");
    obj.tabControl3:setName("tabControl3");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl3);
    obj.tab5:setTitle("Geral");
    obj.tab5:setName("tab5");

    obj.frmWondrousItems = GUI.fromHandle(_obj_newObject("form"));
    obj.frmWondrousItems:setParent(obj.tab5);
    obj.frmWondrousItems:setName("frmWondrousItems");
    obj.frmWondrousItems:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmWondrousItems);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.scrollBox4);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(50);
    obj.layout78:setName("layout78");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout78);
    obj.button28:setAlign("left");
    obj.button28:setWidth(50);
    obj.button28:setText("+");
    obj.button28:setName("button28");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout78);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(275);
    obj.layout79:setName("layout79");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout79);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout80);
    obj.label12:setAlign("left");
    obj.label12:setWidth(75);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Preço");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout80);
    obj.label13:setAlign("left");
    obj.label13:setWidth(200);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setField("precoWoundrous");
    lfm_setPropAsString(obj.label13, "formatFloat",  ",0.## PO");
    obj.label13:setName("label13");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout79);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout81);
    obj.label14:setAlign("left");
    obj.label14:setWidth(75);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("Custo");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout81);
    obj.label15:setAlign("left");
    obj.label15:setWidth(100);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setField("custoWoundrous");
    lfm_setPropAsString(obj.label15, "formatFloat",  ",0.## PO");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout81);
    obj.label16:setAlign("left");
    obj.label16:setWidth(100);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setField("xpWoundrous");
    lfm_setPropAsString(obj.label16, "formatFloat",  ",0.## XP");
    obj.label16:setName("label16");

    obj.effectList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.effectList:setParent(obj.scrollBox4);
    obj.effectList:setAlign("left");
    obj.effectList:setWidth(395);
    obj.effectList:setField("effectList");
    obj.effectList:setName("effectList");
    obj.effectList:setTemplateForm("frmItemEffect");
    obj.effectList:setMinQt(1);
    obj.effectList:setMargins({right=5});

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox4);
    obj.dataLink2:setFields({'precoWoundrous'});
    obj.dataLink2:setName("dataLink2");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl3);
    obj.tab6:setTitle("Armas");
    obj.tab6:setName("tab6");

    obj.frmWeaponCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmWeaponCalculator:setParent(obj.tab6);
    obj.frmWeaponCalculator:setName("frmWeaponCalculator");
    obj.frmWeaponCalculator:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmWeaponCalculator);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox5);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(100);
    obj.layout82:setName("layout82");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout82);
    obj.button29:setAlign("left");
    obj.button29:setWidth(50);
    obj.button29:setText("+");
    obj.button29:setName("button29");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout82);
    obj.layout83:setAlign("left");
    obj.layout83:setWidth(325);
    obj.layout83:setName("layout83");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout83);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout84);
    obj.label17:setAlign("left");
    obj.label17:setWidth(75);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("Preço");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout84);
    obj.label18:setAlign("left");
    obj.label18:setWidth(200);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setField("weaponPrice");
    lfm_setPropAsString(obj.label18, "formatFloat",  ",0.## PO");
    obj.label18:setName("label18");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout83);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout85);
    obj.label19:setAlign("left");
    obj.label19:setWidth(75);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Custo");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout85);
    obj.label20:setAlign("left");
    obj.label20:setWidth(100);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setField("weaponCost");
    lfm_setPropAsString(obj.label20, "formatFloat",  ",0.## PO");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout85);
    obj.label21:setAlign("left");
    obj.label21:setWidth(100);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setField("weaponXP");
    lfm_setPropAsString(obj.label21, "formatFloat",  ",0.## XP");
    obj.label21:setName("label21");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout83);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout86);
    obj.label22:setAlign("left");
    obj.label22:setWidth(60);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Valor");
    obj.label22:setName("label22");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout86);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(100);
    obj.edit2:setField("weaponValue");
    obj.edit2:setType("float");
    obj.edit2:setName("edit2");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout83);
    obj.layout87:setAlign("top");
    obj.layout87:setHeight(25);
    obj.layout87:setName("layout87");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout87);
    obj.label23:setAlign("left");
    obj.label23:setWidth(60);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setText("Material");
    obj.label23:setName("label23");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout87);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(100);
    obj.edit3:setField("weaponMaterial");
    obj.edit3:setType("float");
    obj.edit3:setName("edit3");

    obj.checkBox139 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox139:setParent(obj.layout87);
    obj.checkBox139:setAlign("left");
    obj.checkBox139:setWidth(100);
    obj.checkBox139:setHorzTextAlign("center");
    obj.checkBox139:setText("Obra-Prima");
    obj.checkBox139:setField("weaponOP");
    obj.checkBox139:setMargins({left=10});
    obj.checkBox139:setName("checkBox139");

    obj.weaponList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.weaponList:setParent(obj.scrollBox5);
    obj.weaponList:setAlign("left");
    obj.weaponList:setWidth(395);
    obj.weaponList:setField("weaponList");
    obj.weaponList:setName("weaponList");
    obj.weaponList:setTemplateForm("frmWeaponItem");
    obj.weaponList:setMinQt(1);
    obj.weaponList:setMargins({right=5});

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox5);
    obj.dataLink3:setFields({'weaponValue','weaponMaterial','weaponBonus','weaponExtraPrice','weaponOP'});
    obj.dataLink3:setName("dataLink3");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl3);
    obj.tab7:setTitle("Armaduras");
    obj.tab7:setName("tab7");

    obj.frmArmorCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmArmorCalculator:setParent(obj.tab7);
    obj.frmArmorCalculator:setName("frmArmorCalculator");
    obj.frmArmorCalculator:setAlign("client");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmArmorCalculator);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox6);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(100);
    obj.layout88:setName("layout88");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout88);
    obj.button30:setAlign("left");
    obj.button30:setWidth(50);
    obj.button30:setText("+");
    obj.button30:setName("button30");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout88);
    obj.layout89:setAlign("left");
    obj.layout89:setWidth(325);
    obj.layout89:setName("layout89");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout89);
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout90);
    obj.label24:setAlign("left");
    obj.label24:setWidth(75);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setText("Preço");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout90);
    obj.label25:setAlign("left");
    obj.label25:setWidth(200);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setField("armorPrice");
    lfm_setPropAsString(obj.label25, "formatFloat",  ",0.## PO");
    obj.label25:setName("label25");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout89);
    obj.layout91:setAlign("top");
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout91);
    obj.label26:setAlign("left");
    obj.label26:setWidth(75);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setText("Custo");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout91);
    obj.label27:setAlign("left");
    obj.label27:setWidth(100);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setField("armorCost");
    lfm_setPropAsString(obj.label27, "formatFloat",  ",0.## PO");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout91);
    obj.label28:setAlign("left");
    obj.label28:setWidth(100);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("armorXP");
    lfm_setPropAsString(obj.label28, "formatFloat",  ",0.## XP");
    obj.label28:setName("label28");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout89);
    obj.layout92:setAlign("top");
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout92);
    obj.label29:setAlign("left");
    obj.label29:setWidth(60);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("Valor");
    obj.label29:setName("label29");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout92);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(100);
    obj.edit4:setField("armorValue");
    obj.edit4:setType("float");
    obj.edit4:setName("edit4");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout89);
    obj.layout93:setAlign("top");
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout93);
    obj.label30:setAlign("left");
    obj.label30:setWidth(60);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setText("Material");
    obj.label30:setName("label30");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout93);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(100);
    obj.edit5:setField("armorMaterial");
    obj.edit5:setType("float");
    obj.edit5:setName("edit5");

    obj.checkBox140 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox140:setParent(obj.layout93);
    obj.checkBox140:setAlign("left");
    obj.checkBox140:setWidth(100);
    obj.checkBox140:setHorzTextAlign("center");
    obj.checkBox140:setText("Obra-Prima");
    obj.checkBox140:setField("armorOP");
    obj.checkBox140:setMargins({left=10});
    obj.checkBox140:setName("checkBox140");

    obj.armorList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.armorList:setParent(obj.scrollBox6);
    obj.armorList:setAlign("left");
    obj.armorList:setWidth(395);
    obj.armorList:setField("armorList");
    obj.armorList:setName("armorList");
    obj.armorList:setTemplateForm("frmArmorItem");
    obj.armorList:setMinQt(1);
    obj.armorList:setMargins({right=5});

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.scrollBox6);
    obj.dataLink4:setFields({'armorValue','armorMaterial','armorBonus','armorExtraPrice','armorOP'});
    obj.dataLink4:setName("dataLink4");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl3);
    obj.tab8:setTitle("Consumiveis");
    obj.tab8:setName("tab8");

    obj.frmConsumableCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmConsumableCalculator:setParent(obj.tab8);
    obj.frmConsumableCalculator:setName("frmConsumableCalculator");
    obj.frmConsumableCalculator:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmConsumableCalculator);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.scrollBox7);
    obj.layout94:setAlign("top");
    obj.layout94:setHeight(200);
    obj.layout94:setName("layout94");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout94);
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout95);
    obj.label31:setAlign("left");
    obj.label31:setWidth(75);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Pergaminho");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout95);
    obj.label32:setAlign("left");
    obj.label32:setWidth(200);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setField("scrollPrice");
    lfm_setPropAsString(obj.label32, "formatFloat",  ",0.## PO");
    obj.label32:setName("label32");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout94);
    obj.layout96:setAlign("top");
    obj.layout96:setHeight(25);
    obj.layout96:setName("layout96");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout96);
    obj.label33:setAlign("left");
    obj.label33:setWidth(75);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setText("Custo");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout96);
    obj.label34:setAlign("left");
    obj.label34:setWidth(100);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("scrollCost");
    lfm_setPropAsString(obj.label34, "formatFloat",  ",0.## PO");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout96);
    obj.label35:setAlign("left");
    obj.label35:setWidth(100);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setField("scrollXP");
    lfm_setPropAsString(obj.label35, "formatFloat",  ",0.## XP");
    obj.label35:setName("label35");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout94);
    obj.layout97:setAlign("top");
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout97);
    obj.label36:setAlign("left");
    obj.label36:setWidth(75);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setText("Poção");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout97);
    obj.label37:setAlign("left");
    obj.label37:setWidth(200);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setField("potionPrice");
    lfm_setPropAsString(obj.label37, "formatFloat",  ",0.## PO");
    obj.label37:setName("label37");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout94);
    obj.layout98:setAlign("top");
    obj.layout98:setHeight(25);
    obj.layout98:setName("layout98");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout98);
    obj.label38:setAlign("left");
    obj.label38:setWidth(75);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setText("Custo");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout98);
    obj.label39:setAlign("left");
    obj.label39:setWidth(100);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setField("potionCost");
    lfm_setPropAsString(obj.label39, "formatFloat",  ",0.## PO");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout98);
    obj.label40:setAlign("left");
    obj.label40:setWidth(100);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setField("potionXP");
    lfm_setPropAsString(obj.label40, "formatFloat",  ",0.## XP");
    obj.label40:setName("label40");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout94);
    obj.layout99:setAlign("top");
    obj.layout99:setHeight(25);
    obj.layout99:setName("layout99");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout99);
    obj.label41:setAlign("left");
    obj.label41:setWidth(75);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setText("Varinha");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout99);
    obj.label42:setAlign("left");
    obj.label42:setWidth(200);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setField("wandPrice");
    lfm_setPropAsString(obj.label42, "formatFloat",  ",0.## PO");
    obj.label42:setName("label42");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout94);
    obj.layout100:setAlign("top");
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout100);
    obj.label43:setAlign("left");
    obj.label43:setWidth(75);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setText("Custo");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout100);
    obj.label44:setAlign("left");
    obj.label44:setWidth(100);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setField("wandCost");
    lfm_setPropAsString(obj.label44, "formatFloat",  ",0.## PO");
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout100);
    obj.label45:setAlign("left");
    obj.label45:setWidth(100);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setField("wandXP");
    lfm_setPropAsString(obj.label45, "formatFloat",  ",0.## XP");
    obj.label45:setName("label45");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout94);
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(25);
    obj.layout101:setName("layout101");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout101);
    obj.label46:setAlign("left");
    obj.label46:setWidth(75);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setText("Nivel");
    obj.label46:setName("label46");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout101);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(50);
    obj.edit6:setField("consumableNivel");
    obj.edit6:setType("float");
    obj.edit6:setName("edit6");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout101);
    obj.label47:setAlign("left");
    obj.label47:setWidth(75);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setText("NC");
    obj.label47:setName("label47");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout101);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(50);
    obj.edit7:setField("consumableNC");
    obj.edit7:setType("float");
    obj.edit7:setName("edit7");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout94);
    obj.layout102:setAlign("top");
    obj.layout102:setHeight(25);
    obj.layout102:setName("layout102");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout102);
    obj.label48:setAlign("left");
    obj.label48:setWidth(75);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setText("Material");
    obj.label48:setName("label48");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout102);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(50);
    obj.edit8:setField("consumableMaterial");
    obj.edit8:setType("float");
    obj.edit8:setName("edit8");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout102);
    obj.label49:setAlign("left");
    obj.label49:setWidth(75);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setText("XP");
    obj.label49:setName("label49");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout102);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(50);
    obj.edit9:setField("consumableXP");
    obj.edit9:setType("float");
    obj.edit9:setName("edit9");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.scrollBox7);
    obj.dataLink5:setFields({'consumableNivel','consumableNC','consumableMaterial','consumableXP'});
    obj.dataLink5:setName("dataLink5");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl3);
    obj.tab9:setTitle("Cajado");
    obj.tab9:setName("tab9");

    obj.frmStaffCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmStaffCalculator:setParent(obj.tab9);
    obj.frmStaffCalculator:setName("frmStaffCalculator");
    obj.frmStaffCalculator:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmStaffCalculator);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.scrollBox8);
    obj.layout103:setAlign("top");
    obj.layout103:setHeight(50);
    obj.layout103:setName("layout103");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout103);
    obj.button31:setAlign("left");
    obj.button31:setWidth(50);
    obj.button31:setText("+");
    obj.button31:setName("button31");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout103);
    obj.layout104:setAlign("left");
    obj.layout104:setWidth(275);
    obj.layout104:setName("layout104");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout104);
    obj.layout105:setAlign("top");
    obj.layout105:setHeight(25);
    obj.layout105:setName("layout105");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout105);
    obj.label50:setAlign("left");
    obj.label50:setWidth(75);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("Preço");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout105);
    obj.label51:setAlign("left");
    obj.label51:setWidth(200);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setField("staffPrice");
    lfm_setPropAsString(obj.label51, "formatFloat",  ",0.## PO");
    obj.label51:setName("label51");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout104);
    obj.layout106:setAlign("top");
    obj.layout106:setHeight(25);
    obj.layout106:setName("layout106");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout106);
    obj.label52:setAlign("left");
    obj.label52:setWidth(75);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("Custo");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout106);
    obj.label53:setAlign("left");
    obj.label53:setWidth(100);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setField("staffCost");
    lfm_setPropAsString(obj.label53, "formatFloat",  ",0.## PO");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout106);
    obj.label54:setAlign("left");
    obj.label54:setWidth(100);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setField("staffXP");
    lfm_setPropAsString(obj.label54, "formatFloat",  ",0.## XP");
    obj.label54:setName("label54");

    obj.staffList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.staffList:setParent(obj.scrollBox8);
    obj.staffList:setAlign("left");
    obj.staffList:setWidth(395);
    obj.staffList:setField("staffList");
    obj.staffList:setName("staffList");
    obj.staffList:setTemplateForm("frmStaffItem");
    obj.staffList:setMinQt(1);
    obj.staffList:setMargins({right=5});

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.scrollBox8);
    obj.dataLink6:setFields({'sortStaff'});
    obj.dataLink6:setName("dataLink6");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl3);
    obj.tab10:setTitle("Cetro");
    obj.tab10:setName("tab10");

    obj.frmScepterCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmScepterCalculator:setParent(obj.tab10);
    obj.frmScepterCalculator:setName("frmScepterCalculator");
    obj.frmScepterCalculator:setAlign("client");

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmScepterCalculator);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.scrollBox9);
    obj.layout107:setAlign("top");
    obj.layout107:setHeight(50);
    obj.layout107:setName("layout107");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout107);
    obj.button32:setAlign("left");
    obj.button32:setWidth(50);
    obj.button32:setText("+");
    obj.button32:setName("button32");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout107);
    obj.layout108:setAlign("left");
    obj.layout108:setWidth(275);
    obj.layout108:setName("layout108");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout108);
    obj.layout109:setAlign("top");
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout109);
    obj.label55:setAlign("left");
    obj.label55:setWidth(75);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("Preço");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout109);
    obj.label56:setAlign("left");
    obj.label56:setWidth(200);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setField("scepterPrice");
    lfm_setPropAsString(obj.label56, "formatFloat",  ",0.## PO");
    obj.label56:setName("label56");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout108);
    obj.layout110:setAlign("top");
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout110);
    obj.label57:setAlign("left");
    obj.label57:setWidth(75);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Custo");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout110);
    obj.label58:setAlign("left");
    obj.label58:setWidth(100);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setField("scepterCost");
    lfm_setPropAsString(obj.label58, "formatFloat",  ",0.## PO");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout110);
    obj.label59:setAlign("left");
    obj.label59:setWidth(100);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("scepterXP");
    lfm_setPropAsString(obj.label59, "formatFloat",  ",0.## XP");
    obj.label59:setName("label59");

    obj.scepterList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.scepterList:setParent(obj.scrollBox9);
    obj.scepterList:setAlign("left");
    obj.scepterList:setWidth(395);
    obj.scepterList:setField("scepterList");
    obj.scepterList:setName("scepterList");
    obj.scepterList:setTemplateForm("frmScepterItem");
    obj.scepterList:setMinQt(1);
    obj.scepterList:setMargins({right=5});

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.scrollBox9);
    obj.dataLink7:setFields({'sortScepter'});
    obj.dataLink7:setName("dataLink7");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Creditos");
    obj.tab11:setName("tab11");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab11);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmTemplateCreditos);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox10);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.scrollBox10);
    obj.label60:setLeft(5);
    obj.label60:setTop(10);
    obj.label60:setWidth(200);
    obj.label60:setHeight(20);
    obj.label60:setText("Feito por: Vinny (Ambesek)");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.scrollBox10);
    obj.label61:setLeft(5);
    obj.label61:setTop(35);
    obj.label61:setWidth(200);
    obj.label61:setHeight(20);
    obj.label61:setText("Versão Atual: ");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setField("versionInstalled");
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.scrollBox10);
    obj.label62:setLeft(5);
    obj.label62:setTop(60);
    obj.label62:setWidth(200);
    obj.label62:setHeight(20);
    obj.label62:setText("Sua Versão: ");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setField("versionDownloaded");
    obj.label62:setName("label62");

    obj.checkBox141 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox141:setParent(obj.scrollBox10);
    obj.checkBox141:setLeft(5);
    obj.checkBox141:setTop(85);
    obj.checkBox141:setWidth(200);
    obj.checkBox141:setHeight(20);
    obj.checkBox141:setField("noUpdate");
    obj.checkBox141:setText("Não pedir para atualizar.");
    obj.checkBox141:setName("checkBox141");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.scrollBox10);
    obj.button33:setLeft(5);
    obj.button33:setTop(110);
    obj.button33:setWidth(100);
    obj.button33:setText("Change Log");
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.scrollBox10);
    obj.button34:setLeft(5);
    obj.button34:setTop(135);
    obj.button34:setWidth(100);
    obj.button34:setText("Atualizar");
    obj.button34:setName("button34");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.scrollBox10);
    obj.label63:setLeft(5);
    obj.label63:setTop(160);
    obj.label63:setWidth(200);
    obj.label63:setHeight(20);
    obj.label63:setText("Conheça a Mesa:");
    obj.label63:setName("label63");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.scrollBox10);
    obj.button35:setLeft(5);
    obj.button35:setTop(185);
    obj.button35:setWidth(100);
    obj.button35:setText("RPGmeister");
    obj.button35:setName("button35");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            -- Carrega o local sheet para ser usado. 
            		toolSheet = NDB.load("config.xml");
            
            		self.scope:setNodeObject(toolSheet);
            
            		--local json = VHD.openFile("spells.json");
            		--local file = {};
            		--json:read(file, json.remainingBytes);
            		--local str = Utils.binaryDecode(file, "utf8");
            
            		--local magicListData2 = NDB.load("magicListData2.xml");
            		--magicListData2.db = decode(str);
            
            		--local spells = NDB.getChildNodes(toolSheet.spellList);
        end, obj);

    obj._e_event1 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/output/Ferramentas%20d20.rpk?raw=true",
            			function(stream, contentType)
            				local info = Firecast.Plugins.getRPKDetails(stream);
            				toolSheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
            				local installed = Firecast.Plugins.getInstalledPlugins();
            				local myself;
            				for i=1, #installed, 1 do
            					if installed[i].moduleId == info.moduleId then
            						myself = installed[i];
            						toolSheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
            					end;
            				end;
            
            				rawset(toolSheet, "stream", stream);
            
            				if toolSheet.noUpdate==true then return end;
            				if myself~= nil and isNewVersion(myself.version, info.version) then
            					Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
            						function(selected, selectedIndex, selectedText)
            							if selected and selectedIndex == 1 then
            								local install = Firecast.Plugins.installPlugin(rawget(toolSheet,"stream"), true);
            								if install==false then
            									GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true');
            								end;
            							elseif selected and selectedIndex == 3 then
            								toolSheet.noUpdate = true;
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
            self.enemiesList:append();
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.playersList:append();
        end, obj);

    obj._e_event4 = obj.enemiesList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.nd) or 0) - (tonumber(nodeA.nd) or 0);
        end, obj);

    obj._e_event5 = obj.playersList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.nep) or 0) - (tonumber(nodeA.nep) or 0);
        end, obj);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if self.scope.node==nil then return end;
            				if not self.scope.node.calculateXP then return end;
            				self.scope.node.calculateXP = false;
            
            				local players = NDB.getChildNodes(self.scope.node.playersList); 
            				local enemies = NDB.getChildNodes(self.scope.node.enemiesList); 
            
            				-- Veja quantos personagens tem, se tiver 0
            				local numPlayers = 0;
            				for i=1, #players, 1 do 
            					local qtd = tonumber(players[i].qtd) or 0;
            					numPlayers = numPlayers + qtd;
            				end;
            				if numPlayers == 0 then return end;
            
            				-- Calcule a XP de cada grupo
            
            				for i=1, #players, 1 do 
            					local xpAll = 0;
            					local nep = tonumber(players[i].nep) or 3;
            					if nep < 3 then nep = 3 end;
            
            					local xpTable = {};
            					xpTable[8] = nep * 300;
            					xpTable[9] = math.ceil(xpTable[8] * 1.5);
            					for i=10, 15, 1 do
            						xpTable[i] = xpTable[i-2] * 2;
            					end;
            					for i=7, 1, -1 do
            						xpTable[i] = math.ceil(xpTable[i+2] / 2);
            					end;
            
            					for j=1, #enemies, 1 do 
            						local nd = tonumber(enemies[j].nd) or 0;
            						local qtd = tonumber(enemies[j].qtd) or 1;
            						local index = math.ceil(nd+8-nep);
            						local xp = 0;
            						if index > 0 and index < 16 then
            							xp = xpTable[index] * qtd;
            						end;
            
            						if nd<1 then
            							xp = xp * nd;
            						end;
            
            						xpAll = xpAll + xp;
            					end;
            					players[i].xpAll = math.floor(xpAll);
            					players[i].xpMine = math.floor(xpAll/numPlayers);
            				end;
        end, obj);

    obj._e_event7 = obj.button3:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            				toolSheet.filteredSpells = {};
            				local index = 0;
            
            				-- Filtre as magias
            				for k,v in pairs(magicListData.db) do
            					local spell = magicListData.db[k];
            
            					if toolSheet.enableName then
            						local isName = filterName(spell);
            						if not isName then 
            							--write(spell.name .. " falhou no filtro de isName");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableClasses then
            						local isClass = filterClass(spell);
            						if not isClass then 
            							--write(spell.name .. " falhou no filtro de isClass");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableNivel then
            						local isLevel = filterLevel(spell);
            						if not isLevel then 
            							--write(spell.name .. " falhou no filtro de isLevel");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableSchool then
            						local isSchool = filterSchool(spell);
            						if not isSchool then 
            							--write(spell.name .. " falhou no filtro de isSchool");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableDescritor then
            						local isTag = filterTag(spell);
            						if not isTag then 
            							--write(spell.name .. " falhou no filtro de isTag");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableComponentes then
            						local isComponent = filterComponent(spell);
            						if not isComponent then 
            							--write(spell.name .. " falhou no filtro de isComponent");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableAlcance then
            						local isRange = filterRange(spell);
            						if not isRange then 
            							--write(spell.name .. " falhou no filtro de isRange");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableDuracao then
            						local isDuration = filterDuration(spell);
            						if not isDuration then 
            							--write(spell.name .. " falhou no filtro de isDuration");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableAlvo then
            						local isTarget = filterTarget(spell);
            						if not isTarget then 
            							--write(spell.name .. " falhou no filtro de isTarget");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableResistencia then
            						local isSave = filterSave(spell);
            						if not isSave then 
            							--write(spell.name .. " falhou no filtro de isSave");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableRm then
            						local isSR = filterSR(spell);
            						if not isSR then 
            							--write(spell.name .. " falhou no filtro de isSR");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableLivro then
            						local isBook = filterBook(spell);
            						if not isBook then 
            							--write(spell.name .. " falhou no filtro de isBook");
            							goto nextspell 
            						end;
            					end;
            
            					index = index +1;
            					toolSheet.filteredSpells[index] = spell;
            					::nextspell::
            				end
            
            				--write(index);
            
            				-- Salve a quantidade de magias filtradas e de paginas
            				toolSheet.numSpells = index;
            				toolSheet.maxSpellPages = math.ceil(index/50);	
            
            				-- Delete o que ta no rcl atual
            		        local toDelete = NDB.getChildNodes(toolSheet.spellList); 
            		        for i=1, #toDelete, 1 do
            		            NDB.deleteNode(toDelete[i]);
            		        end;
            
            		        -- Preencha o rcl com até as primeiras 50 magias
            		        local limit = math.min(index, 50);
            				for i=1, limit, 1 do
            					local spell = self.spellList:append();
            
            					if toolSheet.filteredSpells[i].description then 
            						spell.description = toolSheet.filteredSpells[i].description;
            					end;
            
            					spell.name = toolSheet.filteredSpells[i].name;
            					local nome = tryLang(toolSheet.filteredSpells[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(toolSheet.filteredSpells[i].school);
            					spell.subschool = trans(toolSheet.filteredSpells[i].subschool);
            					spell.url = toolSheet.filteredSpells[i].url;
            					spell.level = classToText(toolSheet.filteredSpells[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(toolSheet.filteredSpells[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(toolSheet.filteredSpells[i].components, #components);
            					spell.range = "Alcance: " .. trans(toolSheet.filteredSpells[i].range);
            					spell.duration = "Duração: " .. arrayToText(toolSheet.filteredSpells[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(toolSheet.filteredSpells[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(toolSheet.filteredSpells[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(toolSheet.filteredSpells[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(toolSheet.filteredSpells[i].book, #books);
            				end;
            				self.spellList:sort();
            				toolSheet.SpellsPage = 1;
            
            				self.spellListTab:setFocus();
        end, obj);

    obj._e_event8 = obj.button4:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.bard = true;
            						self.scope.node.cleric = true;
            						self.scope.node.druid = true;
            						self.scope.node.paladin = true;
            						self.scope.node.ranger = true;
            						self.scope.node.sorcerer = true;
            						self.scope.node.wizard = true;
            						self.scope.node.adept = true;
            						self.scope.node.assassin = true;
            						self.scope.node.blackguard = true;
            						self.scope.node.shugenja = true;
            						self.scope.node.wu_jen = true;
            						self.scope.node.warmage = true;
            						self.scope.node.hexblade = true;
            						self.scope.node.domain = true;
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.bard = false;
            						self.scope.node.cleric = false;
            						self.scope.node.druid = false;
            						self.scope.node.paladin = false;
            						self.scope.node.ranger = false;
            						self.scope.node.sorcerer = false;
            						self.scope.node.wizard = false;
            						self.scope.node.adept = false;
            						self.scope.node.assassin = false;
            						self.scope.node.blackguard = false;
            						self.scope.node.shugenja = false;
            						self.scope.node.wu_jen = false;
            						self.scope.node.warmage = false;
            						self.scope.node.hexblade = false;
            						self.scope.node.domain = false;
        end, obj);

    obj._e_event10 = obj.button6:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.lvl0 = true;
            						self.scope.node.lvl1 = true;
            						self.scope.node.lvl2 = true;
            						self.scope.node.lvl3 = true;
            						self.scope.node.lvl4 = true;
            						self.scope.node.lvl5 = true;
            						self.scope.node.lvl6 = true;
            						self.scope.node.lvl7 = true;
            						self.scope.node.lvl8 = true;
            						self.scope.node.lvl9 = true;
        end, obj);

    obj._e_event11 = obj.button7:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.lvl0 = false;
            						self.scope.node.lvl1 = false;
            						self.scope.node.lvl2 = false;
            						self.scope.node.lvl3 = false;
            						self.scope.node.lvl4 = false;
            						self.scope.node.lvl5 = false;
            						self.scope.node.lvl6 = false;
            						self.scope.node.lvl7 = false;
            						self.scope.node.lvl8 = false;
            						self.scope.node.lvl9 = false;
        end, obj);

    obj._e_event12 = obj.button8:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Abjuration = true;
            						self.scope.node.Conjuration = true;
            						self.scope.node.Calling = true;
            						self.scope.node.Creation = true;
            						self.scope.node.Healing = true;
            						self.scope.node.Summoning = true;
            						self.scope.node.Teleportation = true;
            						self.scope.node.Divination = true;
            						self.scope.node.Scrying = true;
            						self.scope.node.Enchantment = true;
            						self.scope.node.Charm = true;
            						self.scope.node.Compulsion = true;
            						self.scope.node.Evocation = true;
            						self.scope.node.Illusion = true;
            						self.scope.node.Figment = true;
            						self.scope.node.Glamer = true;
            						self.scope.node.Pattern = true;
            						self.scope.node.Phantasm = true;
            						self.scope.node.Shadow = true;
            						self.scope.node.Necromancy = true;
            						self.scope.node.Transmutation = true;
            						self.scope.node.Polymorph = true;
            						self.scope.node.Universal = true;
        end, obj);

    obj._e_event13 = obj.button9:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Abjuration = false;
            						self.scope.node.Conjuration = false;
            						self.scope.node.Calling = false;
            						self.scope.node.Creation = false;
            						self.scope.node.Healing = false;
            						self.scope.node.Summoning = false;
            						self.scope.node.Teleportation = false;
            						self.scope.node.Divination = false;
            						self.scope.node.Scrying = false;
            						self.scope.node.Enchantment = false;
            						self.scope.node.Charm = false;
            						self.scope.node.Compulsion = false;
            						self.scope.node.Evocation = false;
            						self.scope.node.Illusion = false;
            						self.scope.node.Figment = false;
            						self.scope.node.Glamer = false;
            						self.scope.node.Pattern = false;
            						self.scope.node.Phantasm = false;
            						self.scope.node.Shadow = false;
            						self.scope.node.Necromancy = false;
            						self.scope.node.Transmutation = false;
            						self.scope.node.Polymorph = false;
            						self.scope.node.Universal = false;
        end, obj);

    obj._e_event14 = obj.button10:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Acid = true;
            						self.scope.node.Air = true;
            						self.scope.node.Chaotic = true;
            						self.scope.node.Cold = true;
            						self.scope.node.Darkness = true;
            						self.scope.node.Death = true;
            						self.scope.node.Earth = true;
            						self.scope.node.Electricity = true;
            						self.scope.node.Evil = true;
            						self.scope.node.Fear = true;
            						self.scope.node.Fire = true;
            						self.scope.node.Force = true;
            						self.scope.node.Good = true;
            						self.scope.node.Language_Dependent = true;
            						self.scope.node.Lawful = true;
            						self.scope.node.Light = true;
            						self.scope.node.Mind_Affecting = true;
            						self.scope.node.Sonic = true;
            						self.scope.node.Water = true;
            						self.scope.node.None = true;
        end, obj);

    obj._e_event15 = obj.button11:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Acid = false;
            						self.scope.node.Air = false;
            						self.scope.node.Chaotic = false;
            						self.scope.node.Cold = false;
            						self.scope.node.Darkness = false;
            						self.scope.node.Death = false;
            						self.scope.node.Earth = false;
            						self.scope.node.Electricity = false;
            						self.scope.node.Evil = false;
            						self.scope.node.Fear = false;
            						self.scope.node.Fire = false;
            						self.scope.node.Force = false;
            						self.scope.node.Good = false;
            						self.scope.node.Language_Dependent = false;
            						self.scope.node.Lawful = false;
            						self.scope.node.Light = false;
            						self.scope.node.Mind_Affecting = false;
            						self.scope.node.Sonic = false;
            						self.scope.node.Water = false;
            						self.scope.node.None = false;
        end, obj);

    obj._e_event16 = obj.button12:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.V = true;
            						self.scope.node.S = true;
            						self.scope.node.M = true;
            						self.scope.node.F = true;
            						self.scope.node.XP = true;
            						self.scope.node.DF = true;
            						self.scope.node.N = true;
        end, obj);

    obj._e_event17 = obj.button13:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.V = false;
            						self.scope.node.S = false;
            						self.scope.node.M = false;
            						self.scope.node.F = false;
            						self.scope.node.DF = false;
            						self.scope.node.XP = false;
            						self.scope.node.N = false;
        end, obj);

    obj._e_event18 = obj.button14:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.fixo3m = true;
            						self.scope.node.fixo6m = true;
            						self.scope.node.fixo9m = true;
            						self.scope.node.fixo12m = true;
            						self.scope.node.fixo15m = true;
            						self.scope.node.fixo18m = true;
            						self.scope.node.Close = true;
            						self.scope.node.Medium = true;
            						self.scope.node.Long = true;
            						self.scope.node.Personal = true;
            						self.scope.node.Touch = true;
            						self.scope.node.Adjacent = true;
            						self.scope.node.Special = true;
        end, obj);

    obj._e_event19 = obj.button15:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.fixo3m = false;
            						self.scope.node.fixo6m = false;
            						self.scope.node.fixo9m = false;
            						self.scope.node.fixo12m = false;
            						self.scope.node.fixo15m = false;
            						self.scope.node.fixo18m = false;
            						self.scope.node.Close = false;
            						self.scope.node.Medium = false;
            						self.scope.node.Long = false;
            						self.scope.node.Personal = false;
            						self.scope.node.Touch = false;
            						self.scope.node.Adjacent = false;
            						self.scope.node.Special = false;
        end, obj);

    obj._e_event20 = obj.button16:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Instantaneous = true;
            						self.scope.node.Concentration = true;
            						self.scope.node.Rounds = true;
            						self.scope.node.Minutes = true;
            						self.scope.node.Hours = true;
            						self.scope.node.Days = true;
            						self.scope.node.Permanent = true;
            						self.scope.node.Dismissible = true;
            						self.scope.node.SpecialDuration = true;
        end, obj);

    obj._e_event21 = obj.button17:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Instantaneous = false;
            						self.scope.node.Concentration = false;
            						self.scope.node.Rounds = false;
            						self.scope.node.Minutes = false;
            						self.scope.node.Hours = false;
            						self.scope.node.Days = false;
            						self.scope.node.Permanent = false;
            						self.scope.node.Dismissible = false;
            						self.scope.node.SpecialDuration = false;
        end, obj);

    obj._e_event22 = obj.button18:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Area = true;
            						self.scope.node.Effect = true;
            						self.scope.node.Target = true;
            						self.scope.node.Burst = true;
            						self.scope.node.Cone = true;
            						self.scope.node.Cylinder = true;
            						self.scope.node.Emanation = true;
            						self.scope.node.Line = true;
            						self.scope.node.Ray = true;
            						self.scope.node.Sphere = true;
            						self.scope.node.Spread = true;
            						self.scope.node.Shapeable = true;
            						self.scope.node.SpecialTarget = true;
        end, obj);

    obj._e_event23 = obj.button19:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.Area = false;
            						self.scope.node.Effect = false;
            						self.scope.node.Target = false;
            						self.scope.node.Burst = false;
            						self.scope.node.Cone = false;
            						self.scope.node.Cylinder = false;
            						self.scope.node.Emanation = false;
            						self.scope.node.Line = false;
            						self.scope.node.Ray = false;
            						self.scope.node.Sphere = false;
            						self.scope.node.Spread = false;
            						self.scope.node.Shapeable = false;
            						self.scope.node.SpecialTarget = false;
        end, obj);

    obj._e_event24 = obj.button20:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.fortitude = true;
            						self.scope.node.reflex = true;
            						self.scope.node.will = true;
            						self.scope.node.none = true;
            						self.scope.node.specialTR = true;
        end, obj);

    obj._e_event25 = obj.button21:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.fortitude = false;
            						self.scope.node.reflex = false;
            						self.scope.node.will = false;
            						self.scope.node.none = false;
            						self.scope.node.specialTR = false;
        end, obj);

    obj._e_event26 = obj.button22:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.yes = true;
            						self.scope.node.no = true;
        end, obj);

    obj._e_event27 = obj.button23:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.yes = false;
            						self.scope.node.no = false;
        end, obj);

    obj._e_event28 = obj.button24:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.PHB = true;
            						self.scope.node.ELH = true;
            						self.scope.node.CAd = true;
            						self.scope.node.CAr = true;
            						self.scope.node.CD = true;
            						self.scope.node.CC = true;
            						self.scope.node.CM = true;
            						self.scope.node.CS = true;
            						self.scope.node.CW = true;
        end, obj);

    obj._e_event29 = obj.button25:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.PHB = false;
            						self.scope.node.ELH = false;
            						self.scope.node.CAd = false;
            						self.scope.node.CAr = false;
            						self.scope.node.CD = false;
            						self.scope.node.CC = false;
            						self.scope.node.CM = false;
            						self.scope.node.CS = false;
            						self.scope.node.CW = false;
        end, obj);

    obj._e_event30 = obj.spellList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.name, nodeB.name);
        end, obj);

    obj._e_event31 = obj.button26:addEventListener("onClick",
        function (_)
            -- Verifica se ta na primeira pagina
            				if self.scope.node==nil then return end;
            				if toolSheet.SpellsPage==nil then return end;
            
            				if toolSheet.SpellsPage==1 then return end;
            
            				-- Apaga pagina atual
            				local toDelete = NDB.getChildNodes(toolSheet.spellList); 
            			    for i=1, #toDelete, 1 do
            			        NDB.deleteNode(toDelete[i]);
            			    end;
            
            				-- Passa para a pagina anterior
            				toolSheet.SpellsPage = toolSheet.SpellsPage - 1;
            
            				local first = ((toolSheet.SpellsPage-1)*50)+1;
            				local last = math.min(toolSheet.SpellsPage*50, toolSheet.numSpells);
            
            				for i=first, last, 1 do
            					local spell = self.spellList:append();
            
            					if toolSheet.filteredSpells[i].description then 
            						spell.description = toolSheet.filteredSpells[i].description;
            					end;
            
            					spell.name = toolSheet.filteredSpells[i].name;
            					local nome = tryLang(toolSheet.filteredSpells[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(toolSheet.filteredSpells[i].school);
            					spell.subschool = trans(toolSheet.filteredSpells[i].subschool);
            					spell.url = toolSheet.filteredSpells[i].url;
            					spell.level = classToText(toolSheet.filteredSpells[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(toolSheet.filteredSpells[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(toolSheet.filteredSpells[i].components, #components);
            					spell.range = "Alcance: " .. trans(toolSheet.filteredSpells[i].range);
            					spell.duration = "Duração: " .. arrayToText(toolSheet.filteredSpells[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(toolSheet.filteredSpells[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(toolSheet.filteredSpells[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(toolSheet.filteredSpells[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(toolSheet.filteredSpells[i].book, #books);
            				end;
            				self.spellList:sort();
        end, obj);

    obj._e_event32 = obj.button27:addEventListener("onClick",
        function (_)
            -- Verifica se ta na ultima pagina
            				if self.scope.node==nil then return end;
            				if toolSheet.SpellsPage==nil then return end;
            
            				if toolSheet.SpellsPage>=toolSheet.maxSpellPages then return end;
            
            				-- Apaga pagina atual
            				local toDelete = NDB.getChildNodes(toolSheet.spellList); 
            			    for i=1, #toDelete, 1 do
            			        NDB.deleteNode(toDelete[i]);
            			    end;
            
            				-- Passa para a proxima pagina
            				toolSheet.SpellsPage = toolSheet.SpellsPage + 1;
            
            				local first = ((toolSheet.SpellsPage-1)*50)+1;
            				local last = math.min(toolSheet.SpellsPage*50, toolSheet.numSpells);
            
            				for i=first, last, 1 do
            					local spell = self.spellList:append();
            
            					if toolSheet.filteredSpells[i].description then 
            						spell.description = toolSheet.filteredSpells[i].description;
            					end;
            					
            					spell.name = toolSheet.filteredSpells[i].name;
            					local nome = tryLang(toolSheet.filteredSpells[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(toolSheet.filteredSpells[i].school);
            					spell.subschool = trans(toolSheet.filteredSpells[i].subschool);
            					spell.url = toolSheet.filteredSpells[i].url;
            					spell.level = classToText(toolSheet.filteredSpells[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(toolSheet.filteredSpells[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(toolSheet.filteredSpells[i].components, #components);
            					spell.range = "Alcance: " .. trans(toolSheet.filteredSpells[i].range);
            					spell.duration = "Duração: " .. arrayToText(toolSheet.filteredSpells[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(toolSheet.filteredSpells[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(toolSheet.filteredSpells[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(toolSheet.filteredSpells[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(toolSheet.filteredSpells[i].book, #books);
            				end;
            				self.spellList:sort();
            
            				-- Atualiza o tamanho do rcl
            				local spells = NDB.getChildNodes(toolSheet.spellList); 
                    		self.spellList.height = #spells * 101;
        end, obj);

    obj._e_event33 = obj.button28:addEventListener("onClick",
        function (_)
            self.effectList:append();
        end, obj);

    obj._e_event34 = obj.effectList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.price) or 0) - (tonumber(nodeA.price) or 0);
        end, obj);

    obj._e_event35 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
        end, obj);

    obj._e_event36 = obj.button29:addEventListener("onClick",
        function (_)
            self.weaponList:append();
        end, obj);

    obj._e_event37 = obj.weaponList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.price) or 0) - (tonumber(nodeA.price) or 0);
        end, obj);

    obj._e_event38 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if toolSheet==nil then return end;
            
            				local mundano = (tonumber(toolSheet.weaponValue) or 0) + 
            								(tonumber(toolSheet.weaponMaterial) or 0);
            				if toolSheet.weaponOP then mundano = mundano + 300 end;
            
            				local bonus = (tonumber(toolSheet.weaponBonus) or 0);
            				-- BASE PRICE: 2000
            				local magico = 	(bonus*bonus*2000) + 
            								(tonumber(toolSheet.weaponExtraPrice) or 0);
            
            				toolSheet.weaponPrice = magico + mundano;
            				toolSheet.weaponCost = (magico/2) + mundano;
            				toolSheet.weaponXP = math.ceil(magico/25);
        end, obj);

    obj._e_event39 = obj.button30:addEventListener("onClick",
        function (_)
            self.armorList:append();
        end, obj);

    obj._e_event40 = obj.armorList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.price) or 0) - (tonumber(nodeA.price) or 0);
        end, obj);

    obj._e_event41 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if toolSheet==nil then return end;
            
            				local mundano = (tonumber(toolSheet.armorValue) or 0) + 
            								(tonumber(toolSheet.armorMaterial) or 0);
            				if toolSheet.armorOP then mundano = mundano + 300 end;
            
            				local bonus = (tonumber(toolSheet.armorBonus) or 0);
            				-- BASE PRICE: 1000
            				local magico = 	(bonus*bonus*1000) + 
            								(tonumber(toolSheet.armorExtraPrice) or 0);
            
            				toolSheet.armorPrice = magico + mundano;
            				toolSheet.armorCost = (magico/2) + mundano;
            				toolSheet.armorXP = math.ceil(magico/25);
        end, obj);

    obj._e_event42 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if toolSheet==nil then return end;
            
            				local nivel = (tonumber(toolSheet.consumableNivel) or 0.5);
            				if nivel <1 then nivel = 0.5 end;
            				local nc = (tonumber(toolSheet.consumableNC) or 1);
            				local material = (tonumber(toolSheet.consumableMaterial) or 0);
            				local xp = (tonumber(toolSheet.consumableXP) or 0);
            
            				-- BASE PRICE: 25
            				local pergaminho = nivel * nc * 25;
            				-- BASE PRICE: 50
            				local pocao = nivel * nc * 50;
            				-- BASE PRICE: 750
            				local varinha = nivel * nc * 750;
            
            				toolSheet.scrollPrice = pergaminho + material + xp * 5;
            				toolSheet.scrollCost = (pergaminho/2) + material;
            				toolSheet.scrollXP = math.ceil(pergaminho/25) + xp;
            
            				toolSheet.potionPrice = pocao + material + xp * 5;
            				toolSheet.potionCost = (pocao/2) + material;
            				toolSheet.potionXP = math.ceil(pocao/25) + xp;
            
            				toolSheet.wandPrice = varinha + (material * 50) + (xp * 50 * 5);
            				toolSheet.wandCost = (varinha/2) + (material * 50);
            				toolSheet.wandXP = math.ceil(varinha/25) + (xp * 50);
        end, obj);

    obj._e_event43 = obj.button31:addEventListener("onClick",
        function (_)
            self.staffList:append();
        end, obj);

    obj._e_event44 = obj.staffList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeA.order) or 0) - (tonumber(nodeB.order) or 0);
        end, obj);

    obj._e_event45 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if toolSheet==nil then return end;
            				if toolSheet.sortStaff ~= 1 then return end;
            				toolSheet.sortStaff = 0;
            				self.staffList:sort();
        end, obj);

    obj._e_event46 = obj.button32:addEventListener("onClick",
        function (_)
            self.scepterList:append();
        end, obj);

    obj._e_event47 = obj.scepterList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeA.order) or 0) - (tonumber(nodeB.order) or 0);
        end, obj);

    obj._e_event48 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if toolSheet==nil then return end;
            				if toolSheet.sortScepter ~= 1 then return end;
            				toolSheet.sortScepter = 0;
            				self.scepterList:sort();
        end, obj);

    obj._e_event49 = obj.button33:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/README.md')
        end, obj);

    obj._e_event50 = obj.button33:addEventListener("onClick",
        function (_)
            local install = Firecast.Plugins.installPlugin(rawget(toolSheet,"stream"), true);
                            if install==false then
                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/output/Ferramentas%20d20.rpk?raw=true');
                            end;
        end, obj);

    obj._e_event51 = obj.button34:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/output/Ferramentas%20d20.rpk?raw=true')
        end, obj);

    obj._e_event52 = obj.button35:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.spellListTab ~= nil then self.spellListTab:destroy(); self.spellListTab = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.checkBox135 ~= nil then self.checkBox135:destroy(); self.checkBox135 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.frmConsumableCalculator ~= nil then self.frmConsumableCalculator:destroy(); self.frmConsumableCalculator = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.frmXP ~= nil then self.frmXP:destroy(); self.frmXP = nil; end;
        if self.playersList ~= nil then self.playersList:destroy(); self.playersList = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.frmSpellsList ~= nil then self.frmSpellsList:destroy(); self.frmSpellsList = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.staffList ~= nil then self.staffList:destroy(); self.staffList = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.checkBox128 ~= nil then self.checkBox128:destroy(); self.checkBox128 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox132 ~= nil then self.checkBox132:destroy(); self.checkBox132 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.checkBox131 ~= nil then self.checkBox131:destroy(); self.checkBox131 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.checkBox127 ~= nil then self.checkBox127:destroy(); self.checkBox127 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.scepterList ~= nil then self.scepterList:destroy(); self.scepterList = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.spellList ~= nil then self.spellList:destroy(); self.spellList = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.frmSpells ~= nil then self.frmSpells:destroy(); self.frmSpells = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.scope ~= nil then self.scope:destroy(); self.scope = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.checkBox141 ~= nil then self.checkBox141:destroy(); self.checkBox141 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.checkBox139 ~= nil then self.checkBox139:destroy(); self.checkBox139 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.checkBox140 ~= nil then self.checkBox140:destroy(); self.checkBox140 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.effectList ~= nil then self.effectList:destroy(); self.effectList = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.checkBox130 ~= nil then self.checkBox130:destroy(); self.checkBox130 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox137 ~= nil then self.checkBox137:destroy(); self.checkBox137 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.frmWeaponCalculator ~= nil then self.frmWeaponCalculator:destroy(); self.frmWeaponCalculator = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.frmArmorCalculator ~= nil then self.frmArmorCalculator:destroy(); self.frmArmorCalculator = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.frmScepterCalculator ~= nil then self.frmScepterCalculator:destroy(); self.frmScepterCalculator = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.enemiesList ~= nil then self.enemiesList:destroy(); self.enemiesList = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.checkBox126 ~= nil then self.checkBox126:destroy(); self.checkBox126 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.popDescription ~= nil then self.popDescription:destroy(); self.popDescription = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.checkBox134 ~= nil then self.checkBox134:destroy(); self.checkBox134 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.frmStaffCalculator ~= nil then self.frmStaffCalculator:destroy(); self.frmStaffCalculator = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.frmWondrousItems ~= nil then self.frmWondrousItems:destroy(); self.frmWondrousItems = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox138 ~= nil then self.checkBox138:destroy(); self.checkBox138 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox129 ~= nil then self.checkBox129:destroy(); self.checkBox129 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox133 ~= nil then self.checkBox133:destroy(); self.checkBox133 = nil; end;
        if self.weaponList ~= nil then self.weaponList:destroy(); self.weaponList = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.armorList ~= nil then self.armorList:destroy(); self.armorList = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.checkBox136 ~= nil then self.checkBox136:destroy(); self.checkBox136 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMainFerramentas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMainFerramentas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMainFerramentas = {
    newEditor = newfrmMainFerramentas, 
    new = newfrmMainFerramentas, 
    name = "frmMainFerramentas", 
    dataType = "Ambesek.Ferramentas.d20", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Ferramentas RPGmeister", 
    description=""};

frmMainFerramentas = _frmMainFerramentas;
Firecast.registrarForm(_frmMainFerramentas);
Firecast.registrarDataType(_frmMainFerramentas);
Firecast.registrarSpecialForm(_frmMainFerramentas);

return _frmMainFerramentas;
