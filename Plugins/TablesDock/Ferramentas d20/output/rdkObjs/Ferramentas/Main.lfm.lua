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
		local magicListDataPath = NDB.load("magicListDataPath.xml");

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
    obj.tab2:setTitle("Magias D&D3.5");
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


			-- lists
			local schools = {"Abjuration","Conjuration","Calling","Creation","Healing","Summoning","Teleportation","Divination","Scrying","Enchantment","Charm","Compulsion","Evocation","Illusion","Figment","Glamer","Pattern","Phantasm","Shadow","Necromancy","Transmutation","Polymorph","Universal"};
			
			local components = {"V", "S", "M", "F", "DF", "XP"}
			
			local ranges = {"3m", "6m", "9m", "12m", "15m", "18m", "Close", "Medium", "Long", "Personal", "Touch", "Special","Adjacent"};
			local rangesAux = {"fixo3m", "fixo6m", "fixo9m", "fixo12m", "fixo15m", "fixo18m", "Close", "Medium", "Long", "Personal", "Touch", "Special","Adjacent"};
			
			local durations = {"Concentration", "Dismissible", "Instantaneous", "Rounds", "Minutes", "Hours", "Days", "Permanent", "Special"};
			local durationsAux = {"Concentration", "Dismissible", "Instantaneous", "Rounds", "Minutes", "Hours", "Days", "Permanent", "SpecialDuration"};

			local targets = {"Area","Effect","Target","Burst","Cone","Cylinder","Emanation","Line","Ray","Sphere","Spread","Shapeable", "Special"};
			local targetsAux = {"Area","Effect","Target","Burst","Cone","Cylinder","Emanation","Line","Ray","Sphere","Spread","Shapeable", "SpecialTarget"};

			local tags = {"Acid","Air","Chaotic","Cold","Darkness","Death","Earth","Electricity","Evil","Fear","Fire","Force","Good","Language-Dependent","Lawful","Light","Mind-Affecting","Sonic","Water"};

			local trs = {"Fortitude","Reflex","Will","None","Special"};
			local trsAux = {"fortitude","reflex","will","none","specialTR"};

			local srs = {"Yes", "No"};
			local books = {"PHB","ELH","CAd","CAr","CD","CC","CM","CS","CW"};
			local levels = {"0","1","2","3","4","5","6","7","8","9"};
			local jobs = {"bard","cleric","druid","paladin","ranger","sorcerer","wizard","adept","assassin","blackguard","shugenja","wu-jen","warmage","hexblade"};
			local jobsAux = {"bard","cleric","druid","paladin","ranger","sorcerer","wizard","adept","assassin","blackguard","shugenja","wu_jen","warmage","hexblade"};

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

				for i = 1, #components, 1 do
					if toolSheet[components[i]] then
						ret = ret and array_contain(spell.components, components[i], #components);
					end;
				end;

				return ret;
			end

			local function filterComponentNot(spell)
				if toolSheet.N and spell.components==nil then
					return false;
				end;

				for i = 1, #components, 1 do
					if toolSheet[components[i]] and array_contain(spell.components, components[i], #components) then
						return false;
					end;
				end;
				return true;
			end;

			local function filterComponentOr(spell)
				if toolSheet.N and spell.components==nil then
					return true;
				end;

				for i = 1, #components, 1 do
					if toolSheet[components[i]] and array_contain(spell.components, components[i], #components) then
						return true;
					end;
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

				for i = 1, #tags, 1 do
					if toolSheet[tags[i]] and array_contain(spell.descriptor, tags[i], #tags) then
						return true;
					end;
				end;
				return false;
			end;

			local function filterLevel(spell)
				for i = 1, #levels, 1 do
					if toolSheet["lvl" .. levels[i]] and has_value(spell.level, levels[i]) then
						return true;
					end;
				end;
				return false;
			end;

			local function filterSchool(spell)
				for i = 1, #schools, 1 do
					if toolSheet[schools[i]] and (spell.school == schools[i] or spell.subschool == schools[i]) then
						return true;
					end;
				end;

				return false;
			end;

			local function filterClassAnd(spell)
				local ret = true;

				for i = 1, #jobs, 1 do
					if toolSheet[jobsAux[i]] then
						ret = ret and spell.level[jobs[i]] ~= nil;
					end;
				end;
				if toolSheet.domain then
					ret = ret and (spell.level.air~=nil or spell.level.animal~=nil or spell.level.chaos~=nil or spell.level.death~=nil or spell.level.destruction~=nil or spell.level.earth~=nil or spell.level.evil~=nil or spell.level.fire~=nil or spell.level.good~=nil or spell.level.healing~=nil or spell.level.knowledge~=nil or spell.level.law~=nil or spell.level.luck~=nil or spell.level.magic~=nil or spell.level.plant~=nil or spell.level.protection~=nil or spell.level.strength~=nil or spell.level.sun~=nil or spell.level.travel~=nil or spell.level.trickery~=nil or spell.level.war~=nil or spell.level.water~=nil or spell.level.liberation ~= nil or spell.level.cold ~= nil or spell.level.creation ~= nil or spell.level.dream ~= nil or spell.level.mind ~= nil or spell.level.madness ~= nil or spell.level.domination ~= nil or spell.level.force ~= nil or spell.level.glory ~= nil or spell.level.purification ~= nil or spell.level.pact ~= nil or spell.level.pestilence ~= nil or spell.level.celerity ~= nil or spell.level.weather ~= nil or spell.level.courage ~= nil);
				end;
				return ret;
			end;

			local function filterClassOr(spell)
				for i = 1, #jobs, 1 do
					if toolSheet[jobsAux[i]] and spell.level[jobs[i]]~=nil then
						return true;
					end;
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
				for i = 1, #ranges, 1 do
					if toolSheet[rangesAux[i]] and spell.range == ranges[i] then
						return true;
					end;
				end;
				return false;
			end;

			local function filterDuration(spell)
				for i = 1, #durations, 1 do
					if toolSheet[durationsAux[i]] and array_contain(spell.duration, durations[i], #durations) then
						return true;
					end;
				end;

				return false;
			end

			local function filterBook(spell)
				for i = 1, #books, 1 do
					if toolSheet[books[i]] and array_contain(spell.book, books[i], #books) then
						return true;
					end;
				end;

				return false;
			end

			local function filterTarget(spell)
				for i = 1, #targets, 1 do
					if toolSheet[targetsAux[i]] and array_contain(spell.aiming, targets[i], #targets) then
						return true;
					end;
				end;
				return false;
			end;

			local function filterSave(spell)
				for i = 1, #trs, 1 do
					if toolSheet[trsAux[i]] and array_contain(spell.save, trs[i], #trs) then
						return true;
					end;
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
    obj.checkBox17:setText("Domínio");
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
    obj.tab4:setTitle("Magias Pathfinder");
    obj.tab4:setName("tab4");

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.tab4);
    obj.tabControl3:setAlign("client");
    obj.tabControl3:setName("tabControl3");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl3);
    obj.tab5:setTitle("Filtro");
    obj.tab5:setName("tab5");

    obj.frmSpellsPath = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSpellsPath:setParent(obj.tab5);
    obj.frmSpellsPath:setName("frmSpellsPath");
    obj.frmSpellsPath:setAlign("client");


        	local booksPath = {"Core","UltMagic","Cheliax","Dwarves","Treasures","Gnomes","Faction","Sargava","Orcs","APG","ISWorld","FaithPurity","Rival","Blog","Humans","Dungeons","PFSocietyFG","Goblins","ISMagic","UltCombat","FaithCorruption","Apocalypse","DEP","Pirates","Kingdoms","ARG","Runelords","Knights","BloodNight","North","Animal","Dungeoneers","Cards","ChampionsPurity","Chronicle","Kobolds","Quests","Dragonslayer","PFSocietyP","Demand","FaithPhil","DemonHunter","Demons","MythicAdv","MythicOrg","BloodMoon","Marketplace","Osirion","Sands","ChampionsBalance","Quarterly","UndeadSlayer","ISGods","Mysteries","Harrow","BloodElements","River","Technology","Stars","ACG","ChampionsCorruption","ACO","MonsterCodex","Ranged","Giant","Familiar","Melee","HeroesWild","Cohorts","Summoner","ISMonster","OccultAdventures","Dirty","Streets","ISRaces","OccultOrigins","BlackMarket","OccultRealms","Agents","Arcane","BloodShadows","UltIntrigue","Armor","MagicTactics","ISIntrigue","Spymaster","LegacyDragons","Horror","Haunted","Planes","Divine","ISTemples","Crimson","BloodBeast","Villain","Righteous","TheFey","Secrets","Qadira","Healer","HighCourt","Psychic","MonsterHunter","Darklands","FirstWorld","AdvG","AdvA2","Aquatic","UltWilderness","Damned","Air","AP","Rappan","DistantRealms","Hopper","Planar"};
			
			local tagsPath = {"Acid","Air","Chaotic","Cold","Darkness","Death","Earth","Electricity","Evil","Fear","Fire","Force","Good","Language-Dependent","Lawful","Light","Mind-Affecting","Sonic","Water","Curse","Draconic","Emotion","Meditative","Pain","Poison","Ruse"};

			local jobsPath = {"bard","cleric","druid","paladin","ranger","sorcerer","wizard","adept","alchemist","antipaladin","summoner","witch","inquisitor","oracle","magus","oracle","bloodrager","shaman","psychic","medium","mesmerist","occultist","spiritualist","skald","investigator","hunter","summoner_unchained"};

			local function filterClassPathAnd(spell)
				local ret = true;

				for i = 1, #jobsPath, 1 do
					if toolSheet[jobsPath[i]] then
						ret = ret and spell.level[jobsPath[i]] ~= nil;
					end;
				end;
				if toolSheet.domain then
					ret = ret and spell.domain~=nil;
				end;
				return ret;
			end;

			local function filterClassPathOr(spell)
				for i = 1, #jobsPath, 1 do
					if toolSheet[jobsPath[i]] and spell.level[jobsPath[i]]~=nil then
						return true;
					end;
				end;

				if toolSheet.domain then
					return spell.domain~=nil;
				end;
				return false;
			end;

			local function filterClassPath(spell)
				if toolSheet.classRule == "and" then
					return filterClassPathAnd(spell);
				else
					return filterClassPathOr(spell);
				end;
			end;

			local function filterTagPath(spell)
				if toolSheet.None and spell.descriptor==nil then
					return true;
				elseif not toolSheet.None and spell.descriptor==nil then
					return false;
				end;

				for i = 1, #tagsPath, 1 do
					if toolSheet[tagsPath[i]] and array_contain(spell.descriptor, tagsPath[i], #tagsPath) then
						return true;
					end;
				end;
				return false;
			end;

			local function filterBookPath(spell)
				-- Magias de path só estão com um source, então vamos conferir apenas o primeiro valor do array book da magia
				for i = 1, #booksPath, 1 do
					if toolSheet[booksPath[i]] and spell.book[1] == booksPath[i] then
						return true;
					end;
				end;

				return false;
			end

			local function filterPublisherPath(spell)
				if toolSheet.yesPublisher and spell.paizo=="1" then
					return true;
				end;
				if toolSheet.noPublisher and spell.paizo=="0" then
					return true;
				end;
				return false;
			end;

			local function filterMythicPath(spell)
				if toolSheet.yesMythic and spell.mythic=="1" then
					return true;
				end;
				if toolSheet.noMythic and spell.mythic=="0" then
					return true;
				end;
				return false;
			end;

			local function boolToText(bool)
				if bool then
					return trans("yes");
				end;
				return trans("no");
			end;
        


    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.frmSpellsPath);
    obj.layout78:setAlign("bottom");
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout78);
    obj.button28:setAlign("left");
    obj.button28:setHorzTextAlign("center");
    obj.button28:setWidth(375);
    obj.button28:setText("Filtre!");
    obj.button28:setName("button28");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmSpellsPath);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.scrollBox4);
    obj.layout79:setAlign("top");
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.checkBox139 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox139:setParent(obj.layout79);
    obj.checkBox139:setAlign("left");
    obj.checkBox139:setWidth(75);
    obj.checkBox139:setHorzTextAlign("center");
    obj.checkBox139:setText("NOME");
    obj.checkBox139:setField("enableName");
    obj.checkBox139:setMargins({right=25,bottom=5,top=5});
    obj.checkBox139:setName("checkBox139");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout79);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(275);
    obj.edit2:setField("nameFilter");
    obj.edit2:setName("edit2");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox4);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(200);
    obj.layout80:setName("layout80");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout80);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.checkBox140 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox140:setParent(obj.layout81);
    obj.checkBox140:setAlign("left");
    obj.checkBox140:setWidth(75);
    obj.checkBox140:setHorzTextAlign("center");
    obj.checkBox140:setText("CLASSES");
    obj.checkBox140:setField("enableClasses");
    obj.checkBox140:setMargins({right=75});
    obj.checkBox140:setName("checkBox140");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout81);
    obj.radioButton6:setAlign("left");
    obj.radioButton6:setWidth(60);
    obj.radioButton6:setText("Todas");
    obj.radioButton6:setGroupName("grupoDeClasses");
    obj.radioButton6:setField("classRule");
    obj.radioButton6:setFieldValue("and");
    obj.radioButton6:setHint("Exibe magias apenas se elas pertencerem a todas classes selecionadas. ");
    obj.radioButton6:setName("radioButton6");

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout81);
    obj.radioButton7:setAlign("left");
    obj.radioButton7:setWidth(110);
    obj.radioButton7:setText("Ao menos uma");
    obj.radioButton7:setGroupName("grupoDeClasses");
    obj.radioButton7:setField("classRule");
    obj.radioButton7:setFieldValue("or");
    obj.radioButton7:setHint("Exibe magias que pertençam ao menos a uma das classes selecionadas. ");
    obj.radioButton7:setName("radioButton7");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout80);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.checkBox141 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox141:setParent(obj.layout82);
    obj.checkBox141:setAlign("left");
    obj.checkBox141:setHorzTextAlign("center");
    obj.checkBox141:setWidth(75);
    obj.checkBox141:setField("bard");
    obj.checkBox141:setText("Bardo");
    obj.checkBox141:setName("checkBox141");

    obj.checkBox142 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox142:setParent(obj.layout82);
    obj.checkBox142:setAlign("left");
    obj.checkBox142:setHorzTextAlign("center");
    obj.checkBox142:setWidth(75);
    obj.checkBox142:setField("cleric");
    obj.checkBox142:setText("Clerigo");
    obj.checkBox142:setName("checkBox142");

    obj.checkBox143 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox143:setParent(obj.layout82);
    obj.checkBox143:setAlign("left");
    obj.checkBox143:setHorzTextAlign("center");
    obj.checkBox143:setWidth(75);
    obj.checkBox143:setField("druid");
    obj.checkBox143:setText("Druida");
    obj.checkBox143:setName("checkBox143");

    obj.checkBox144 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox144:setParent(obj.layout82);
    obj.checkBox144:setAlign("left");
    obj.checkBox144:setHorzTextAlign("center");
    obj.checkBox144:setWidth(75);
    obj.checkBox144:setField("paladin");
    obj.checkBox144:setText("Paladino");
    obj.checkBox144:setName("checkBox144");

    obj.checkBox145 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox145:setParent(obj.layout82);
    obj.checkBox145:setAlign("left");
    obj.checkBox145:setHorzTextAlign("center");
    obj.checkBox145:setWidth(75);
    obj.checkBox145:setField("ranger");
    obj.checkBox145:setText("Ranger");
    obj.checkBox145:setName("checkBox145");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout80);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(25);
    obj.layout83:setName("layout83");

    obj.checkBox146 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox146:setParent(obj.layout83);
    obj.checkBox146:setAlign("left");
    obj.checkBox146:setHorzTextAlign("center");
    obj.checkBox146:setWidth(75);
    obj.checkBox146:setField("sorcerer");
    obj.checkBox146:setText("Feiticeiro");
    obj.checkBox146:setName("checkBox146");

    obj.checkBox147 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox147:setParent(obj.layout83);
    obj.checkBox147:setAlign("left");
    obj.checkBox147:setHorzTextAlign("center");
    obj.checkBox147:setWidth(75);
    obj.checkBox147:setField("wizard");
    obj.checkBox147:setText("Mago");
    obj.checkBox147:setName("checkBox147");

    obj.checkBox148 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox148:setParent(obj.layout83);
    obj.checkBox148:setAlign("left");
    obj.checkBox148:setHorzTextAlign("center");
    obj.checkBox148:setWidth(75);
    obj.checkBox148:setField("adept");
    obj.checkBox148:setText("Adepto");
    obj.checkBox148:setName("checkBox148");

    obj.checkBox149 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox149:setParent(obj.layout83);
    obj.checkBox149:setAlign("left");
    obj.checkBox149:setHorzTextAlign("center");
    obj.checkBox149:setWidth(75);
    obj.checkBox149:setField("alchemist");
    obj.checkBox149:setText("Alquimista");
    obj.checkBox149:setFontSize(12);
    obj.checkBox149:setName("checkBox149");

    obj.checkBox150 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox150:setParent(obj.layout83);
    obj.checkBox150:setAlign("left");
    obj.checkBox150:setHorzTextAlign("center");
    obj.checkBox150:setWidth(75);
    obj.checkBox150:setField("antipaladin");
    obj.checkBox150:setText("Antipaladino");
    obj.checkBox150:setFontSize(11);
    obj.checkBox150:setName("checkBox150");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout80);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.checkBox151 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox151:setParent(obj.layout84);
    obj.checkBox151:setAlign("left");
    obj.checkBox151:setHorzTextAlign("center");
    obj.checkBox151:setWidth(75);
    obj.checkBox151:setField("summoner");
    obj.checkBox151:setText("Invocador");
    obj.checkBox151:setName("checkBox151");

    obj.checkBox152 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox152:setParent(obj.layout84);
    obj.checkBox152:setAlign("left");
    obj.checkBox152:setHorzTextAlign("center");
    obj.checkBox152:setWidth(75);
    obj.checkBox152:setField("witch");
    obj.checkBox152:setText("Bruxo");
    obj.checkBox152:setName("checkBox152");

    obj.checkBox153 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox153:setParent(obj.layout84);
    obj.checkBox153:setAlign("left");
    obj.checkBox153:setHorzTextAlign("center");
    obj.checkBox153:setWidth(75);
    obj.checkBox153:setField("inquisitor");
    obj.checkBox153:setText("Inquisidor");
    obj.checkBox153:setFontSize(11);
    obj.checkBox153:setName("checkBox153");

    obj.checkBox154 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox154:setParent(obj.layout84);
    obj.checkBox154:setAlign("left");
    obj.checkBox154:setHorzTextAlign("center");
    obj.checkBox154:setWidth(75);
    obj.checkBox154:setField("oracle");
    obj.checkBox154:setText("Oraculo");
    obj.checkBox154:setFontSize(11);
    obj.checkBox154:setName("checkBox154");

    obj.checkBox155 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox155:setParent(obj.layout84);
    obj.checkBox155:setAlign("left");
    obj.checkBox155:setHorzTextAlign("center");
    obj.checkBox155:setWidth(75);
    obj.checkBox155:setField("domain");
    obj.checkBox155:setText("Domínio");
    obj.checkBox155:setName("checkBox155");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout80);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.checkBox156 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox156:setParent(obj.layout85);
    obj.checkBox156:setAlign("left");
    obj.checkBox156:setHorzTextAlign("center");
    obj.checkBox156:setWidth(75);
    obj.checkBox156:setField("magus");
    obj.checkBox156:setText("Magus");
    obj.checkBox156:setName("checkBox156");

    obj.checkBox157 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox157:setParent(obj.layout85);
    obj.checkBox157:setAlign("left");
    obj.checkBox157:setHorzTextAlign("center");
    obj.checkBox157:setWidth(75);
    obj.checkBox157:setField("oracle");
    obj.checkBox157:setText("Oraculo");
    obj.checkBox157:setName("checkBox157");

    obj.checkBox158 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox158:setParent(obj.layout85);
    obj.checkBox158:setAlign("left");
    obj.checkBox158:setHorzTextAlign("center");
    obj.checkBox158:setWidth(75);
    obj.checkBox158:setField("bloodrager");
    obj.checkBox158:setText("Bloodrager");
    obj.checkBox158:setFontSize(10);
    obj.checkBox158:setName("checkBox158");

    obj.checkBox159 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox159:setParent(obj.layout85);
    obj.checkBox159:setAlign("left");
    obj.checkBox159:setHorzTextAlign("center");
    obj.checkBox159:setWidth(75);
    obj.checkBox159:setField("shaman");
    obj.checkBox159:setText("Xamã");
    obj.checkBox159:setFontSize(13);
    obj.checkBox159:setName("checkBox159");

    obj.checkBox160 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox160:setParent(obj.layout85);
    obj.checkBox160:setAlign("left");
    obj.checkBox160:setHorzTextAlign("center");
    obj.checkBox160:setWidth(75);
    obj.checkBox160:setField("psychic");
    obj.checkBox160:setText("Psiquico");
    obj.checkBox160:setName("checkBox160");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout80);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.checkBox161 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox161:setParent(obj.layout86);
    obj.checkBox161:setAlign("left");
    obj.checkBox161:setHorzTextAlign("center");
    obj.checkBox161:setWidth(75);
    obj.checkBox161:setField("medium");
    obj.checkBox161:setText("Medium");
    obj.checkBox161:setName("checkBox161");

    obj.checkBox162 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox162:setParent(obj.layout86);
    obj.checkBox162:setAlign("left");
    obj.checkBox162:setHorzTextAlign("center");
    obj.checkBox162:setWidth(75);
    obj.checkBox162:setField("mesmerist");
    obj.checkBox162:setText("Mesmerista");
    obj.checkBox162:setFontSize(11);
    obj.checkBox162:setName("checkBox162");

    obj.checkBox163 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox163:setParent(obj.layout86);
    obj.checkBox163:setAlign("left");
    obj.checkBox163:setHorzTextAlign("center");
    obj.checkBox163:setWidth(75);
    obj.checkBox163:setField("occultist");
    obj.checkBox163:setText("Ocultista");
    obj.checkBox163:setFontSize(11);
    obj.checkBox163:setName("checkBox163");

    obj.checkBox164 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox164:setParent(obj.layout86);
    obj.checkBox164:setAlign("left");
    obj.checkBox164:setHorzTextAlign("center");
    obj.checkBox164:setWidth(75);
    obj.checkBox164:setField("spiritualist");
    obj.checkBox164:setText("Espiritualista");
    obj.checkBox164:setFontSize(10);
    obj.checkBox164:setName("checkBox164");

    obj.checkBox165 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox165:setParent(obj.layout86);
    obj.checkBox165:setAlign("left");
    obj.checkBox165:setHorzTextAlign("center");
    obj.checkBox165:setWidth(75);
    obj.checkBox165:setField("skald");
    obj.checkBox165:setText("Skald");
    obj.checkBox165:setName("checkBox165");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout80);
    obj.layout87:setAlign("top");
    obj.layout87:setHeight(25);
    obj.layout87:setName("layout87");

    obj.checkBox166 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox166:setParent(obj.layout87);
    obj.checkBox166:setAlign("left");
    obj.checkBox166:setHorzTextAlign("center");
    obj.checkBox166:setWidth(75);
    obj.checkBox166:setField("investigator");
    obj.checkBox166:setText("Investigador");
    obj.checkBox166:setFontSize(11);
    obj.checkBox166:setName("checkBox166");

    obj.checkBox167 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox167:setParent(obj.layout87);
    obj.checkBox167:setAlign("left");
    obj.checkBox167:setHorzTextAlign("center");
    obj.checkBox167:setWidth(75);
    obj.checkBox167:setField("hunter");
    obj.checkBox167:setText("Caçador");
    obj.checkBox167:setName("checkBox167");

    obj.checkBox168 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox168:setParent(obj.layout87);
    obj.checkBox168:setAlign("left");
    obj.checkBox168:setHorzTextAlign("center");
    obj.checkBox168:setWidth(75);
    obj.checkBox168:setField("summoner_unchained");
    obj.checkBox168:setText("Invocador (Des)");
    obj.checkBox168:setFontSize(9);
    obj.checkBox168:setName("checkBox168");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout80);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout88);
    obj.button29:setAlign("left");
    obj.button29:setHorzTextAlign("center");
    obj.button29:setWidth(187);
    obj.button29:setText("Marque Todas");
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout88);
    obj.button30:setAlign("left");
    obj.button30:setHorzTextAlign("center");
    obj.button30:setWidth(187);
    obj.button30:setText("Desmarque Todas");
    obj.button30:setName("button30");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.scrollBox4);
    obj.layout89:setAlign("top");
    obj.layout89:setHeight(100);
    obj.layout89:setName("layout89");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout89);
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.checkBox169 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox169:setParent(obj.layout90);
    obj.checkBox169:setAlign("left");
    obj.checkBox169:setWidth(75);
    obj.checkBox169:setHorzTextAlign("center");
    obj.checkBox169:setText("NÍVEL");
    obj.checkBox169:setField("enableNivel");
    obj.checkBox169:setMargins({right=75});
    obj.checkBox169:setName("checkBox169");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout89);
    obj.layout91:setAlign("top");
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.checkBox170 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox170:setParent(obj.layout91);
    obj.checkBox170:setAlign("left");
    obj.checkBox170:setHorzTextAlign("center");
    obj.checkBox170:setWidth(75);
    obj.checkBox170:setField("lvl0");
    obj.checkBox170:setText("0");
    obj.checkBox170:setName("checkBox170");

    obj.checkBox171 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox171:setParent(obj.layout91);
    obj.checkBox171:setAlign("left");
    obj.checkBox171:setHorzTextAlign("center");
    obj.checkBox171:setWidth(75);
    obj.checkBox171:setField("lvl1");
    obj.checkBox171:setText("1");
    obj.checkBox171:setName("checkBox171");

    obj.checkBox172 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox172:setParent(obj.layout91);
    obj.checkBox172:setAlign("left");
    obj.checkBox172:setHorzTextAlign("center");
    obj.checkBox172:setWidth(75);
    obj.checkBox172:setField("lvl2");
    obj.checkBox172:setText("2");
    obj.checkBox172:setName("checkBox172");

    obj.checkBox173 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox173:setParent(obj.layout91);
    obj.checkBox173:setAlign("left");
    obj.checkBox173:setHorzTextAlign("center");
    obj.checkBox173:setWidth(75);
    obj.checkBox173:setField("lvl3");
    obj.checkBox173:setText("3");
    obj.checkBox173:setName("checkBox173");

    obj.checkBox174 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox174:setParent(obj.layout91);
    obj.checkBox174:setAlign("left");
    obj.checkBox174:setHorzTextAlign("center");
    obj.checkBox174:setWidth(75);
    obj.checkBox174:setField("lvl4");
    obj.checkBox174:setText("4");
    obj.checkBox174:setName("checkBox174");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout89);
    obj.layout92:setAlign("top");
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.checkBox175 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox175:setParent(obj.layout92);
    obj.checkBox175:setAlign("left");
    obj.checkBox175:setHorzTextAlign("center");
    obj.checkBox175:setWidth(75);
    obj.checkBox175:setField("lvl5");
    obj.checkBox175:setText("5");
    obj.checkBox175:setName("checkBox175");

    obj.checkBox176 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox176:setParent(obj.layout92);
    obj.checkBox176:setAlign("left");
    obj.checkBox176:setHorzTextAlign("center");
    obj.checkBox176:setWidth(75);
    obj.checkBox176:setField("lvl6");
    obj.checkBox176:setText("6");
    obj.checkBox176:setName("checkBox176");

    obj.checkBox177 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox177:setParent(obj.layout92);
    obj.checkBox177:setAlign("left");
    obj.checkBox177:setHorzTextAlign("center");
    obj.checkBox177:setWidth(75);
    obj.checkBox177:setField("lvl7");
    obj.checkBox177:setText("7");
    obj.checkBox177:setName("checkBox177");

    obj.checkBox178 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox178:setParent(obj.layout92);
    obj.checkBox178:setAlign("left");
    obj.checkBox178:setHorzTextAlign("center");
    obj.checkBox178:setWidth(75);
    obj.checkBox178:setField("lvl8");
    obj.checkBox178:setText("8");
    obj.checkBox178:setName("checkBox178");

    obj.checkBox179 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox179:setParent(obj.layout92);
    obj.checkBox179:setAlign("left");
    obj.checkBox179:setHorzTextAlign("center");
    obj.checkBox179:setWidth(75);
    obj.checkBox179:setField("lvl9");
    obj.checkBox179:setText("9");
    obj.checkBox179:setName("checkBox179");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout89);
    obj.layout93:setAlign("top");
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout93);
    obj.button31:setAlign("left");
    obj.button31:setHorzTextAlign("center");
    obj.button31:setWidth(187);
    obj.button31:setText("Marque Todas");
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout93);
    obj.button32:setAlign("left");
    obj.button32:setHorzTextAlign("center");
    obj.button32:setWidth(187);
    obj.button32:setText("Desmarque Todas");
    obj.button32:setName("button32");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.scrollBox4);
    obj.layout94:setAlign("top");
    obj.layout94:setHeight(250);
    obj.layout94:setName("layout94");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout94);
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.checkBox180 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox180:setParent(obj.layout95);
    obj.checkBox180:setAlign("left");
    obj.checkBox180:setWidth(150);
    obj.checkBox180:setHorzTextAlign("center");
    obj.checkBox180:setText("ESCOLA (SUBESCOLA)");
    obj.checkBox180:setField("enableSchool");
    obj.checkBox180:setMargins({right=0});
    obj.checkBox180:setName("checkBox180");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout94);
    obj.layout96:setAlign("top");
    obj.layout96:setHeight(25);
    obj.layout96:setName("layout96");

    obj.checkBox181 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox181:setParent(obj.layout96);
    obj.checkBox181:setAlign("left");
    obj.checkBox181:setHorzTextAlign("center");
    obj.checkBox181:setWidth(125);
    obj.checkBox181:setField("Abjuration");
    obj.checkBox181:setText("Abjuração");
    obj.checkBox181:setName("checkBox181");

    obj.checkBox182 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox182:setParent(obj.layout96);
    obj.checkBox182:setAlign("left");
    obj.checkBox182:setHorzTextAlign("center");
    obj.checkBox182:setWidth(125);
    obj.checkBox182:setField("Conjuration");
    obj.checkBox182:setText("Conjuração (Todas)");
    obj.checkBox182:setFontSize(10);
    obj.checkBox182:setName("checkBox182");

    obj.checkBox183 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox183:setParent(obj.layout96);
    obj.checkBox183:setAlign("left");
    obj.checkBox183:setHorzTextAlign("center");
    obj.checkBox183:setWidth(125);
    obj.checkBox183:setField("Calling");
    obj.checkBox183:setText("Conjuração (Convocação)");
    obj.checkBox183:setFontSize(9);
    obj.checkBox183:setName("checkBox183");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout94);
    obj.layout97:setAlign("top");
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.checkBox184 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox184:setParent(obj.layout97);
    obj.checkBox184:setAlign("left");
    obj.checkBox184:setHorzTextAlign("center");
    obj.checkBox184:setWidth(125);
    obj.checkBox184:setField("Creation");
    obj.checkBox184:setText("Conjuração (Criação)");
    obj.checkBox184:setFontSize(10);
    obj.checkBox184:setName("checkBox184");

    obj.checkBox185 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox185:setParent(obj.layout97);
    obj.checkBox185:setAlign("left");
    obj.checkBox185:setHorzTextAlign("center");
    obj.checkBox185:setWidth(125);
    obj.checkBox185:setField("Healing");
    obj.checkBox185:setText("Conjuração (Cura)");
    obj.checkBox185:setFontSize(10);
    obj.checkBox185:setName("checkBox185");

    obj.checkBox186 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox186:setParent(obj.layout97);
    obj.checkBox186:setAlign("left");
    obj.checkBox186:setHorzTextAlign("center");
    obj.checkBox186:setWidth(125);
    obj.checkBox186:setField("Summoning");
    obj.checkBox186:setText("Conjuração (Invocação)");
    obj.checkBox186:setFontSize(10);
    obj.checkBox186:setName("checkBox186");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout94);
    obj.layout98:setAlign("top");
    obj.layout98:setHeight(25);
    obj.layout98:setName("layout98");

    obj.checkBox187 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox187:setParent(obj.layout98);
    obj.checkBox187:setAlign("left");
    obj.checkBox187:setHorzTextAlign("center");
    obj.checkBox187:setWidth(125);
    obj.checkBox187:setField("Teleportation");
    obj.checkBox187:setText("Conjuração (Teletransporte)");
    obj.checkBox187:setFontSize(8);
    obj.checkBox187:setName("checkBox187");

    obj.checkBox188 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox188:setParent(obj.layout98);
    obj.checkBox188:setAlign("left");
    obj.checkBox188:setHorzTextAlign("center");
    obj.checkBox188:setWidth(125);
    obj.checkBox188:setField("Divination");
    obj.checkBox188:setText("Adivinhação (Todas)");
    obj.checkBox188:setFontSize(10);
    obj.checkBox188:setName("checkBox188");

    obj.checkBox189 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox189:setParent(obj.layout98);
    obj.checkBox189:setAlign("left");
    obj.checkBox189:setHorzTextAlign("center");
    obj.checkBox189:setWidth(125);
    obj.checkBox189:setField("Scrying");
    obj.checkBox189:setText("Adivinhação (Vidência)");
    obj.checkBox189:setFontSize(10);
    obj.checkBox189:setName("checkBox189");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout94);
    obj.layout99:setAlign("top");
    obj.layout99:setHeight(25);
    obj.layout99:setName("layout99");

    obj.checkBox190 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox190:setParent(obj.layout99);
    obj.checkBox190:setAlign("left");
    obj.checkBox190:setHorzTextAlign("center");
    obj.checkBox190:setWidth(125);
    obj.checkBox190:setField("Enchantment");
    obj.checkBox190:setText("Encantamento (Todas)");
    obj.checkBox190:setFontSize(10);
    obj.checkBox190:setName("checkBox190");

    obj.checkBox191 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox191:setParent(obj.layout99);
    obj.checkBox191:setAlign("left");
    obj.checkBox191:setHorzTextAlign("center");
    obj.checkBox191:setWidth(125);
    obj.checkBox191:setField("Charm");
    obj.checkBox191:setText("Encantamento (Feitiço)");
    obj.checkBox191:setFontSize(10);
    obj.checkBox191:setName("checkBox191");

    obj.checkBox192 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox192:setParent(obj.layout99);
    obj.checkBox192:setAlign("left");
    obj.checkBox192:setHorzTextAlign("center");
    obj.checkBox192:setWidth(125);
    obj.checkBox192:setField("Compulsion");
    obj.checkBox192:setText("Encantamento (Compulsão)");
    obj.checkBox192:setFontSize(8);
    obj.checkBox192:setName("checkBox192");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout94);
    obj.layout100:setAlign("top");
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.checkBox193 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox193:setParent(obj.layout100);
    obj.checkBox193:setAlign("left");
    obj.checkBox193:setHorzTextAlign("center");
    obj.checkBox193:setWidth(125);
    obj.checkBox193:setField("Evocation");
    obj.checkBox193:setText("Evocação");
    obj.checkBox193:setName("checkBox193");

    obj.checkBox194 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox194:setParent(obj.layout100);
    obj.checkBox194:setAlign("left");
    obj.checkBox194:setHorzTextAlign("center");
    obj.checkBox194:setWidth(125);
    obj.checkBox194:setField("Illusion");
    obj.checkBox194:setText("Ilusão (Todas)");
    obj.checkBox194:setFontSize(12);
    obj.checkBox194:setName("checkBox194");

    obj.checkBox195 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox195:setParent(obj.layout100);
    obj.checkBox195:setAlign("left");
    obj.checkBox195:setHorzTextAlign("center");
    obj.checkBox195:setWidth(125);
    obj.checkBox195:setField("Figment");
    obj.checkBox195:setText("Ilusão (Ídeia)");
    obj.checkBox195:setFontSize(12);
    obj.checkBox195:setName("checkBox195");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout94);
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(25);
    obj.layout101:setName("layout101");

    obj.checkBox196 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox196:setParent(obj.layout101);
    obj.checkBox196:setAlign("left");
    obj.checkBox196:setHorzTextAlign("center");
    obj.checkBox196:setWidth(125);
    obj.checkBox196:setField("Glamer");
    obj.checkBox196:setText("Ilusão (Sensação)");
    obj.checkBox196:setFontSize(11);
    obj.checkBox196:setName("checkBox196");

    obj.checkBox197 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox197:setParent(obj.layout101);
    obj.checkBox197:setAlign("left");
    obj.checkBox197:setHorzTextAlign("center");
    obj.checkBox197:setWidth(125);
    obj.checkBox197:setField("Pattern");
    obj.checkBox197:setText("Ilusão (Padrão)");
    obj.checkBox197:setFontSize(12);
    obj.checkBox197:setName("checkBox197");

    obj.checkBox198 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox198:setParent(obj.layout101);
    obj.checkBox198:setAlign("left");
    obj.checkBox198:setHorzTextAlign("center");
    obj.checkBox198:setWidth(125);
    obj.checkBox198:setField("Phantasm");
    obj.checkBox198:setText("Ilusão (Fantasma)");
    obj.checkBox198:setFontSize(11);
    obj.checkBox198:setName("checkBox198");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout94);
    obj.layout102:setAlign("top");
    obj.layout102:setHeight(25);
    obj.layout102:setName("layout102");

    obj.checkBox199 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox199:setParent(obj.layout102);
    obj.checkBox199:setAlign("left");
    obj.checkBox199:setHorzTextAlign("center");
    obj.checkBox199:setWidth(125);
    obj.checkBox199:setField("Shadow");
    obj.checkBox199:setText("Ilusão (Sombra)");
    obj.checkBox199:setName("checkBox199");

    obj.checkBox200 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox200:setParent(obj.layout102);
    obj.checkBox200:setAlign("left");
    obj.checkBox200:setHorzTextAlign("center");
    obj.checkBox200:setWidth(125);
    obj.checkBox200:setField("Necromancy");
    obj.checkBox200:setText("Necromancia");
    obj.checkBox200:setName("checkBox200");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout94);
    obj.layout103:setAlign("top");
    obj.layout103:setHeight(25);
    obj.layout103:setName("layout103");

    obj.checkBox201 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox201:setParent(obj.layout103);
    obj.checkBox201:setAlign("left");
    obj.checkBox201:setHorzTextAlign("center");
    obj.checkBox201:setWidth(125);
    obj.checkBox201:setField("Transmutation");
    obj.checkBox201:setText("Transmutação");
    obj.checkBox201:setName("checkBox201");

    obj.checkBox202 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox202:setParent(obj.layout103);
    obj.checkBox202:setAlign("left");
    obj.checkBox202:setHorzTextAlign("center");
    obj.checkBox202:setWidth(125);
    obj.checkBox202:setField("Polymorph");
    obj.checkBox202:setText("Transmutação (Polimorfismo)");
    obj.checkBox202:setFontSize(8);
    obj.checkBox202:setName("checkBox202");

    obj.checkBox203 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox203:setParent(obj.layout103);
    obj.checkBox203:setAlign("left");
    obj.checkBox203:setHorzTextAlign("center");
    obj.checkBox203:setWidth(125);
    obj.checkBox203:setField("Universal");
    obj.checkBox203:setText("Universal");
    obj.checkBox203:setName("checkBox203");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout94);
    obj.layout104:setAlign("top");
    obj.layout104:setHeight(25);
    obj.layout104:setName("layout104");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout104);
    obj.button33:setAlign("left");
    obj.button33:setHorzTextAlign("center");
    obj.button33:setWidth(187);
    obj.button33:setText("Marque Todas");
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout104);
    obj.button34:setAlign("left");
    obj.button34:setHorzTextAlign("center");
    obj.button34:setWidth(187);
    obj.button34:setText("Desmarque Todas");
    obj.button34:setName("button34");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.scrollBox4);
    obj.layout105:setAlign("top");
    obj.layout105:setHeight(225);
    obj.layout105:setName("layout105");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setAlign("top");
    obj.layout106:setHeight(25);
    obj.layout106:setName("layout106");

    obj.checkBox204 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox204:setParent(obj.layout106);
    obj.checkBox204:setAlign("left");
    obj.checkBox204:setWidth(100);
    obj.checkBox204:setHorzTextAlign("center");
    obj.checkBox204:setText("DESCRITOR");
    obj.checkBox204:setField("enableDescritor");
    obj.checkBox204:setMargins({right=50});
    obj.checkBox204:setName("checkBox204");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout105);
    obj.layout107:setAlign("top");
    obj.layout107:setHeight(25);
    obj.layout107:setName("layout107");

    obj.checkBox205 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox205:setParent(obj.layout107);
    obj.checkBox205:setAlign("left");
    obj.checkBox205:setHorzTextAlign("center");
    obj.checkBox205:setWidth(90);
    obj.checkBox205:setField("Acid");
    obj.checkBox205:setText("Ácido");
    obj.checkBox205:setName("checkBox205");

    obj.checkBox206 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox206:setParent(obj.layout107);
    obj.checkBox206:setAlign("left");
    obj.checkBox206:setHorzTextAlign("center");
    obj.checkBox206:setWidth(90);
    obj.checkBox206:setField("Air");
    obj.checkBox206:setText("Ar");
    obj.checkBox206:setName("checkBox206");

    obj.checkBox207 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox207:setParent(obj.layout107);
    obj.checkBox207:setAlign("left");
    obj.checkBox207:setHorzTextAlign("center");
    obj.checkBox207:setWidth(90);
    obj.checkBox207:setField("Chaotic");
    obj.checkBox207:setText("Caos");
    obj.checkBox207:setName("checkBox207");

    obj.checkBox208 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox208:setParent(obj.layout107);
    obj.checkBox208:setAlign("left");
    obj.checkBox208:setHorzTextAlign("center");
    obj.checkBox208:setWidth(90);
    obj.checkBox208:setField("Cold");
    obj.checkBox208:setText("Frio");
    obj.checkBox208:setName("checkBox208");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout105);
    obj.layout108:setAlign("top");
    obj.layout108:setHeight(25);
    obj.layout108:setName("layout108");

    obj.checkBox209 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox209:setParent(obj.layout108);
    obj.checkBox209:setAlign("left");
    obj.checkBox209:setHorzTextAlign("center");
    obj.checkBox209:setWidth(90);
    obj.checkBox209:setField("Darkness");
    obj.checkBox209:setText("Escuridão");
    obj.checkBox209:setName("checkBox209");

    obj.checkBox210 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox210:setParent(obj.layout108);
    obj.checkBox210:setAlign("left");
    obj.checkBox210:setHorzTextAlign("center");
    obj.checkBox210:setWidth(90);
    obj.checkBox210:setField("Death");
    obj.checkBox210:setText("Morte");
    obj.checkBox210:setName("checkBox210");

    obj.checkBox211 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox211:setParent(obj.layout108);
    obj.checkBox211:setAlign("left");
    obj.checkBox211:setHorzTextAlign("center");
    obj.checkBox211:setWidth(90);
    obj.checkBox211:setField("Earth");
    obj.checkBox211:setText("Terra");
    obj.checkBox211:setName("checkBox211");

    obj.checkBox212 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox212:setParent(obj.layout108);
    obj.checkBox212:setAlign("left");
    obj.checkBox212:setHorzTextAlign("center");
    obj.checkBox212:setWidth(90);
    obj.checkBox212:setField("Electricity");
    obj.checkBox212:setText("Eletricidade");
    obj.checkBox212:setName("checkBox212");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout105);
    obj.layout109:setAlign("top");
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.checkBox213 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox213:setParent(obj.layout109);
    obj.checkBox213:setAlign("left");
    obj.checkBox213:setHorzTextAlign("center");
    obj.checkBox213:setWidth(90);
    obj.checkBox213:setField("Evil");
    obj.checkBox213:setText("Mal");
    obj.checkBox213:setName("checkBox213");

    obj.checkBox214 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox214:setParent(obj.layout109);
    obj.checkBox214:setAlign("left");
    obj.checkBox214:setHorzTextAlign("center");
    obj.checkBox214:setWidth(90);
    obj.checkBox214:setField("Fear");
    obj.checkBox214:setText("Medo");
    obj.checkBox214:setName("checkBox214");

    obj.checkBox215 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox215:setParent(obj.layout109);
    obj.checkBox215:setAlign("left");
    obj.checkBox215:setHorzTextAlign("center");
    obj.checkBox215:setWidth(90);
    obj.checkBox215:setField("Fire");
    obj.checkBox215:setText("Fogo");
    obj.checkBox215:setName("checkBox215");

    obj.checkBox216 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox216:setParent(obj.layout109);
    obj.checkBox216:setAlign("left");
    obj.checkBox216:setHorzTextAlign("center");
    obj.checkBox216:setWidth(90);
    obj.checkBox216:setField("Force");
    obj.checkBox216:setText("Energia");
    obj.checkBox216:setName("checkBox216");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout105);
    obj.layout110:setAlign("top");
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.checkBox217 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox217:setParent(obj.layout110);
    obj.checkBox217:setAlign("left");
    obj.checkBox217:setHorzTextAlign("center");
    obj.checkBox217:setWidth(90);
    obj.checkBox217:setField("Good");
    obj.checkBox217:setText("Bem");
    obj.checkBox217:setName("checkBox217");

    obj.checkBox218 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox218:setParent(obj.layout110);
    obj.checkBox218:setAlign("left");
    obj.checkBox218:setHorzTextAlign("center");
    obj.checkBox218:setWidth(90);
    obj.checkBox218:setField("Language_Dependent");
    obj.checkBox218:setText("Dep. de Idioma");
    obj.checkBox218:setFontSize(10);
    obj.checkBox218:setName("checkBox218");

    obj.checkBox219 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox219:setParent(obj.layout110);
    obj.checkBox219:setAlign("left");
    obj.checkBox219:setHorzTextAlign("center");
    obj.checkBox219:setWidth(90);
    obj.checkBox219:setField("Lawful");
    obj.checkBox219:setText("Ordem");
    obj.checkBox219:setName("checkBox219");

    obj.checkBox220 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox220:setParent(obj.layout110);
    obj.checkBox220:setAlign("left");
    obj.checkBox220:setHorzTextAlign("center");
    obj.checkBox220:setWidth(90);
    obj.checkBox220:setField("Light");
    obj.checkBox220:setText("Luz");
    obj.checkBox220:setName("checkBox220");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout105);
    obj.layout111:setAlign("top");
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.checkBox221 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox221:setParent(obj.layout111);
    obj.checkBox221:setAlign("left");
    obj.checkBox221:setHorzTextAlign("center");
    obj.checkBox221:setWidth(90);
    obj.checkBox221:setField("Mind_Affecting");
    obj.checkBox221:setText("Ação Mental");
    obj.checkBox221:setFontSize(12);
    obj.checkBox221:setName("checkBox221");

    obj.checkBox222 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox222:setParent(obj.layout111);
    obj.checkBox222:setAlign("left");
    obj.checkBox222:setHorzTextAlign("center");
    obj.checkBox222:setWidth(90);
    obj.checkBox222:setField("Sonic");
    obj.checkBox222:setText("Sônico");
    obj.checkBox222:setName("checkBox222");

    obj.checkBox223 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox223:setParent(obj.layout111);
    obj.checkBox223:setAlign("left");
    obj.checkBox223:setHorzTextAlign("center");
    obj.checkBox223:setWidth(90);
    obj.checkBox223:setField("Water");
    obj.checkBox223:setText("Água");
    obj.checkBox223:setName("checkBox223");

    obj.checkBox224 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox224:setParent(obj.layout111);
    obj.checkBox224:setAlign("left");
    obj.checkBox224:setHorzTextAlign("center");
    obj.checkBox224:setWidth(90);
    obj.checkBox224:setField("None");
    obj.checkBox224:setText("Nenhum");
    obj.checkBox224:setName("checkBox224");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout105);
    obj.layout112:setAlign("top");
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.checkBox225 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox225:setParent(obj.layout112);
    obj.checkBox225:setAlign("left");
    obj.checkBox225:setHorzTextAlign("center");
    obj.checkBox225:setWidth(90);
    obj.checkBox225:setField("curse");
    obj.checkBox225:setText("Maldição");
    obj.checkBox225:setFontSize(11);
    obj.checkBox225:setName("checkBox225");

    obj.checkBox226 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox226:setParent(obj.layout112);
    obj.checkBox226:setAlign("left");
    obj.checkBox226:setHorzTextAlign("center");
    obj.checkBox226:setWidth(90);
    obj.checkBox226:setField("draconic");
    obj.checkBox226:setText("Draconico");
    obj.checkBox226:setName("checkBox226");

    obj.checkBox227 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox227:setParent(obj.layout112);
    obj.checkBox227:setAlign("left");
    obj.checkBox227:setHorzTextAlign("center");
    obj.checkBox227:setWidth(90);
    obj.checkBox227:setField("emotion");
    obj.checkBox227:setText("Emoção");
    obj.checkBox227:setName("checkBox227");

    obj.checkBox228 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox228:setParent(obj.layout112);
    obj.checkBox228:setAlign("left");
    obj.checkBox228:setHorzTextAlign("center");
    obj.checkBox228:setWidth(90);
    obj.checkBox228:setField("meditative");
    obj.checkBox228:setText("Meditativa");
    obj.checkBox228:setName("checkBox228");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout105);
    obj.layout113:setAlign("top");
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.checkBox229 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox229:setParent(obj.layout113);
    obj.checkBox229:setAlign("left");
    obj.checkBox229:setHorzTextAlign("center");
    obj.checkBox229:setWidth(90);
    obj.checkBox229:setField("pain");
    obj.checkBox229:setText("Dor");
    obj.checkBox229:setFontSize(11);
    obj.checkBox229:setName("checkBox229");

    obj.checkBox230 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox230:setParent(obj.layout113);
    obj.checkBox230:setAlign("left");
    obj.checkBox230:setHorzTextAlign("center");
    obj.checkBox230:setWidth(90);
    obj.checkBox230:setField("poison");
    obj.checkBox230:setText("Veneno");
    obj.checkBox230:setName("checkBox230");

    obj.checkBox231 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox231:setParent(obj.layout113);
    obj.checkBox231:setAlign("left");
    obj.checkBox231:setHorzTextAlign("center");
    obj.checkBox231:setWidth(90);
    obj.checkBox231:setField("ruse");
    obj.checkBox231:setText("Fraude");
    obj.checkBox231:setName("checkBox231");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout105);
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(25);
    obj.layout114:setName("layout114");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout114);
    obj.button35:setAlign("left");
    obj.button35:setHorzTextAlign("center");
    obj.button35:setWidth(187);
    obj.button35:setText("Marque Todas");
    obj.button35:setName("button35");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout114);
    obj.button36:setAlign("left");
    obj.button36:setHorzTextAlign("center");
    obj.button36:setWidth(187);
    obj.button36:setText("Desmarque Todas");
    obj.button36:setName("button36");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox4);
    obj.layout115:setAlign("top");
    obj.layout115:setHeight(100);
    obj.layout115:setName("layout115");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout115);
    obj.layout116:setAlign("top");
    obj.layout116:setHeight(25);
    obj.layout116:setName("layout116");

    obj.checkBox232 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox232:setParent(obj.layout116);
    obj.checkBox232:setAlign("left");
    obj.checkBox232:setWidth(125);
    obj.checkBox232:setHorzTextAlign("center");
    obj.checkBox232:setText("COMPONENTES");
    obj.checkBox232:setField("enableComponentes");
    obj.checkBox232:setMargins({right=0});
    obj.checkBox232:setName("checkBox232");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout116);
    obj.radioButton8:setAlign("left");
    obj.radioButton8:setWidth(60);
    obj.radioButton8:setText("Todas");
    obj.radioButton8:setGroupName("grupoDeComponentes");
    obj.radioButton8:setField("componentRule");
    obj.radioButton8:setFieldValue("and");
    obj.radioButton8:setHint("Exibe magias apenas se ela usa todos componentes selecionados. ");
    obj.radioButton8:setName("radioButton8");

    obj.radioButton9 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout116);
    obj.radioButton9:setAlign("left");
    obj.radioButton9:setWidth(110);
    obj.radioButton9:setText("Ao menos um");
    obj.radioButton9:setGroupName("grupoDeComponentes");
    obj.radioButton9:setField("componentRule");
    obj.radioButton9:setFieldValue("or");
    obj.radioButton9:setHint("Exibe magias que usem ao menos um dos componentes selecionados.  ");
    obj.radioButton9:setName("radioButton9");

    obj.radioButton10 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout116);
    obj.radioButton10:setAlign("left");
    obj.radioButton10:setWidth(75);
    obj.radioButton10:setText("Nenhum");
    obj.radioButton10:setGroupName("grupoDeComponentes");
    obj.radioButton10:setField("componentRule");
    obj.radioButton10:setFieldValue("not");
    obj.radioButton10:setHint("Exibe magias apenas se ela usa não usa nenhum componentes selecionados. ");
    obj.radioButton10:setName("radioButton10");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout115);
    obj.layout117:setAlign("top");
    obj.layout117:setHeight(25);
    obj.layout117:setName("layout117");

    obj.checkBox233 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox233:setParent(obj.layout117);
    obj.checkBox233:setAlign("left");
    obj.checkBox233:setHorzTextAlign("center");
    obj.checkBox233:setWidth(90);
    obj.checkBox233:setField("V");
    obj.checkBox233:setText("Verbal");
    obj.checkBox233:setName("checkBox233");

    obj.checkBox234 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox234:setParent(obj.layout117);
    obj.checkBox234:setAlign("left");
    obj.checkBox234:setHorzTextAlign("center");
    obj.checkBox234:setWidth(90);
    obj.checkBox234:setField("S");
    obj.checkBox234:setText("Gestos");
    obj.checkBox234:setName("checkBox234");

    obj.checkBox235 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox235:setParent(obj.layout117);
    obj.checkBox235:setAlign("left");
    obj.checkBox235:setHorzTextAlign("center");
    obj.checkBox235:setWidth(90);
    obj.checkBox235:setField("M");
    obj.checkBox235:setText("Material");
    obj.checkBox235:setName("checkBox235");

    obj.checkBox236 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox236:setParent(obj.layout117);
    obj.checkBox236:setAlign("left");
    obj.checkBox236:setHorzTextAlign("center");
    obj.checkBox236:setWidth(90);
    obj.checkBox236:setField("F");
    obj.checkBox236:setText("Foco");
    obj.checkBox236:setName("checkBox236");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout115);
    obj.layout118:setAlign("top");
    obj.layout118:setHeight(25);
    obj.layout118:setName("layout118");

    obj.checkBox237 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox237:setParent(obj.layout118);
    obj.checkBox237:setAlign("left");
    obj.checkBox237:setHorzTextAlign("center");
    obj.checkBox237:setWidth(90);
    obj.checkBox237:setField("DF");
    obj.checkBox237:setText("Foco Divino");
    obj.checkBox237:setName("checkBox237");

    obj.checkBox238 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox238:setParent(obj.layout118);
    obj.checkBox238:setAlign("left");
    obj.checkBox238:setHorzTextAlign("center");
    obj.checkBox238:setWidth(90);
    obj.checkBox238:setField("XP");
    obj.checkBox238:setText("Experiencia");
    obj.checkBox238:setName("checkBox238");

    obj.checkBox239 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox239:setParent(obj.layout118);
    obj.checkBox239:setAlign("left");
    obj.checkBox239:setHorzTextAlign("center");
    obj.checkBox239:setWidth(90);
    obj.checkBox239:setField("N");
    obj.checkBox239:setText("Nenhum");
    obj.checkBox239:setName("checkBox239");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout115);
    obj.layout119:setAlign("top");
    obj.layout119:setHeight(25);
    obj.layout119:setName("layout119");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout119);
    obj.button37:setAlign("left");
    obj.button37:setHorzTextAlign("center");
    obj.button37:setWidth(187);
    obj.button37:setText("Marque Todas");
    obj.button37:setName("button37");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout119);
    obj.button38:setAlign("left");
    obj.button38:setHorzTextAlign("center");
    obj.button38:setWidth(187);
    obj.button38:setText("Desmarque Todas");
    obj.button38:setName("button38");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.scrollBox4);
    obj.layout120:setAlign("top");
    obj.layout120:setHeight(150);
    obj.layout120:setName("layout120");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout120);
    obj.layout121:setAlign("top");
    obj.layout121:setHeight(25);
    obj.layout121:setName("layout121");

    obj.checkBox240 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox240:setParent(obj.layout121);
    obj.checkBox240:setAlign("left");
    obj.checkBox240:setWidth(75);
    obj.checkBox240:setHorzTextAlign("center");
    obj.checkBox240:setText("ALCANCE");
    obj.checkBox240:setField("enableAlcance");
    obj.checkBox240:setMargins({right=75});
    obj.checkBox240:setName("checkBox240");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout120);
    obj.layout122:setAlign("top");
    obj.layout122:setHeight(25);
    obj.layout122:setName("layout122");

    obj.checkBox241 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox241:setParent(obj.layout122);
    obj.checkBox241:setAlign("left");
    obj.checkBox241:setHorzTextAlign("center");
    obj.checkBox241:setWidth(90);
    obj.checkBox241:setField("fixo3m");
    obj.checkBox241:setText("3m");
    obj.checkBox241:setName("checkBox241");

    obj.checkBox242 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox242:setParent(obj.layout122);
    obj.checkBox242:setAlign("left");
    obj.checkBox242:setHorzTextAlign("center");
    obj.checkBox242:setWidth(90);
    obj.checkBox242:setField("fixo6m");
    obj.checkBox242:setText("6m");
    obj.checkBox242:setName("checkBox242");

    obj.checkBox243 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox243:setParent(obj.layout122);
    obj.checkBox243:setAlign("left");
    obj.checkBox243:setHorzTextAlign("center");
    obj.checkBox243:setWidth(90);
    obj.checkBox243:setField("fixo9m");
    obj.checkBox243:setText("9m");
    obj.checkBox243:setName("checkBox243");

    obj.checkBox244 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox244:setParent(obj.layout122);
    obj.checkBox244:setAlign("left");
    obj.checkBox244:setHorzTextAlign("center");
    obj.checkBox244:setWidth(90);
    obj.checkBox244:setField("fixo12m");
    obj.checkBox244:setText("12m");
    obj.checkBox244:setName("checkBox244");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout120);
    obj.layout123:setAlign("top");
    obj.layout123:setHeight(25);
    obj.layout123:setName("layout123");

    obj.checkBox245 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox245:setParent(obj.layout123);
    obj.checkBox245:setAlign("left");
    obj.checkBox245:setHorzTextAlign("center");
    obj.checkBox245:setWidth(90);
    obj.checkBox245:setField("fixo15m");
    obj.checkBox245:setText("15m");
    obj.checkBox245:setName("checkBox245");

    obj.checkBox246 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox246:setParent(obj.layout123);
    obj.checkBox246:setAlign("left");
    obj.checkBox246:setHorzTextAlign("center");
    obj.checkBox246:setWidth(90);
    obj.checkBox246:setField("fixo18m");
    obj.checkBox246:setText("18m");
    obj.checkBox246:setName("checkBox246");

    obj.checkBox247 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox247:setParent(obj.layout123);
    obj.checkBox247:setAlign("left");
    obj.checkBox247:setHorzTextAlign("center");
    obj.checkBox247:setWidth(90);
    obj.checkBox247:setField("Close");
    obj.checkBox247:setText("Curto");
    obj.checkBox247:setName("checkBox247");

    obj.checkBox248 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox248:setParent(obj.layout123);
    obj.checkBox248:setAlign("left");
    obj.checkBox248:setHorzTextAlign("center");
    obj.checkBox248:setWidth(90);
    obj.checkBox248:setField("Medium");
    obj.checkBox248:setText("Médio");
    obj.checkBox248:setName("checkBox248");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout120);
    obj.layout124:setAlign("top");
    obj.layout124:setHeight(25);
    obj.layout124:setName("layout124");

    obj.checkBox249 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox249:setParent(obj.layout124);
    obj.checkBox249:setAlign("left");
    obj.checkBox249:setHorzTextAlign("center");
    obj.checkBox249:setWidth(90);
    obj.checkBox249:setField("Long");
    obj.checkBox249:setText("Longo");
    obj.checkBox249:setName("checkBox249");

    obj.checkBox250 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox250:setParent(obj.layout124);
    obj.checkBox250:setAlign("left");
    obj.checkBox250:setHorzTextAlign("center");
    obj.checkBox250:setWidth(90);
    obj.checkBox250:setField("Personal");
    obj.checkBox250:setText("Pessoal");
    obj.checkBox250:setName("checkBox250");

    obj.checkBox251 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox251:setParent(obj.layout124);
    obj.checkBox251:setAlign("left");
    obj.checkBox251:setHorzTextAlign("center");
    obj.checkBox251:setWidth(90);
    obj.checkBox251:setField("Touch");
    obj.checkBox251:setText("Toque");
    obj.checkBox251:setName("checkBox251");

    obj.checkBox252 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox252:setParent(obj.layout124);
    obj.checkBox252:setAlign("left");
    obj.checkBox252:setHorzTextAlign("center");
    obj.checkBox252:setWidth(90);
    obj.checkBox252:setField("Special");
    obj.checkBox252:setText("Especial");
    obj.checkBox252:setName("checkBox252");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout120);
    obj.layout125:setAlign("top");
    obj.layout125:setHeight(25);
    obj.layout125:setName("layout125");

    obj.checkBox253 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox253:setParent(obj.layout125);
    obj.checkBox253:setAlign("left");
    obj.checkBox253:setHorzTextAlign("center");
    obj.checkBox253:setWidth(90);
    obj.checkBox253:setField("Adjacent");
    obj.checkBox253:setText("Adjacente");
    obj.checkBox253:setName("checkBox253");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout120);
    obj.layout126:setAlign("top");
    obj.layout126:setHeight(25);
    obj.layout126:setName("layout126");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout126);
    obj.button39:setAlign("left");
    obj.button39:setHorzTextAlign("center");
    obj.button39:setWidth(187);
    obj.button39:setText("Marque Todas");
    obj.button39:setName("button39");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout126);
    obj.button40:setAlign("left");
    obj.button40:setHorzTextAlign("center");
    obj.button40:setWidth(187);
    obj.button40:setText("Desmarque Todas");
    obj.button40:setName("button40");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox4);
    obj.layout127:setAlign("top");
    obj.layout127:setHeight(125);
    obj.layout127:setName("layout127");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout127);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(25);
    obj.layout128:setName("layout128");

    obj.checkBox254 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox254:setParent(obj.layout128);
    obj.checkBox254:setAlign("left");
    obj.checkBox254:setWidth(100);
    obj.checkBox254:setHorzTextAlign("center");
    obj.checkBox254:setText("DURAÇÃO");
    obj.checkBox254:setField("enableDuracao");
    obj.checkBox254:setMargins({right=50});
    obj.checkBox254:setName("checkBox254");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout127);
    obj.layout129:setAlign("top");
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.checkBox255 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox255:setParent(obj.layout129);
    obj.checkBox255:setAlign("left");
    obj.checkBox255:setHorzTextAlign("center");
    obj.checkBox255:setWidth(125);
    obj.checkBox255:setField("Concentration");
    obj.checkBox255:setText("Concentração");
    obj.checkBox255:setName("checkBox255");

    obj.checkBox256 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox256:setParent(obj.layout129);
    obj.checkBox256:setAlign("left");
    obj.checkBox256:setHorzTextAlign("center");
    obj.checkBox256:setWidth(125);
    obj.checkBox256:setField("Dismissible");
    obj.checkBox256:setText("Dissipavel");
    obj.checkBox256:setName("checkBox256");

    obj.checkBox257 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox257:setParent(obj.layout129);
    obj.checkBox257:setAlign("left");
    obj.checkBox257:setHorzTextAlign("center");
    obj.checkBox257:setWidth(125);
    obj.checkBox257:setField("SpecialDuration");
    obj.checkBox257:setText("Especial");
    obj.checkBox257:setName("checkBox257");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout127);
    obj.layout130:setAlign("top");
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.checkBox258 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox258:setParent(obj.layout130);
    obj.checkBox258:setAlign("left");
    obj.checkBox258:setHorzTextAlign("center");
    obj.checkBox258:setWidth(125);
    obj.checkBox258:setField("Instantaneous");
    obj.checkBox258:setText("Instantaneo");
    obj.checkBox258:setName("checkBox258");

    obj.checkBox259 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox259:setParent(obj.layout130);
    obj.checkBox259:setAlign("left");
    obj.checkBox259:setHorzTextAlign("center");
    obj.checkBox259:setWidth(125);
    obj.checkBox259:setField("Rounds");
    obj.checkBox259:setText("Rodadas");
    obj.checkBox259:setName("checkBox259");

    obj.checkBox260 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox260:setParent(obj.layout130);
    obj.checkBox260:setAlign("left");
    obj.checkBox260:setHorzTextAlign("center");
    obj.checkBox260:setWidth(125);
    obj.checkBox260:setField("Minutes");
    obj.checkBox260:setText("Minutos");
    obj.checkBox260:setName("checkBox260");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout127);
    obj.layout131:setAlign("top");
    obj.layout131:setHeight(25);
    obj.layout131:setName("layout131");

    obj.checkBox261 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox261:setParent(obj.layout131);
    obj.checkBox261:setAlign("left");
    obj.checkBox261:setHorzTextAlign("center");
    obj.checkBox261:setWidth(125);
    obj.checkBox261:setField("Hours");
    obj.checkBox261:setText("Horas");
    obj.checkBox261:setName("checkBox261");

    obj.checkBox262 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox262:setParent(obj.layout131);
    obj.checkBox262:setAlign("left");
    obj.checkBox262:setHorzTextAlign("center");
    obj.checkBox262:setWidth(125);
    obj.checkBox262:setField("Days");
    obj.checkBox262:setText("Dias");
    obj.checkBox262:setName("checkBox262");

    obj.checkBox263 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox263:setParent(obj.layout131);
    obj.checkBox263:setAlign("left");
    obj.checkBox263:setHorzTextAlign("center");
    obj.checkBox263:setWidth(125);
    obj.checkBox263:setField("Permanent");
    obj.checkBox263:setText("Permanente");
    obj.checkBox263:setName("checkBox263");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout127);
    obj.layout132:setAlign("top");
    obj.layout132:setHeight(25);
    obj.layout132:setName("layout132");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout132);
    obj.button41:setAlign("left");
    obj.button41:setHorzTextAlign("center");
    obj.button41:setWidth(187);
    obj.button41:setText("Marque Todas");
    obj.button41:setName("button41");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout132);
    obj.button42:setAlign("left");
    obj.button42:setHorzTextAlign("center");
    obj.button42:setWidth(187);
    obj.button42:setText("Desmarque Todas");
    obj.button42:setName("button42");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.scrollBox4);
    obj.layout133:setAlign("top");
    obj.layout133:setHeight(75);
    obj.layout133:setName("layout133");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout133);
    obj.layout134:setAlign("top");
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.checkBox264 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox264:setParent(obj.layout134);
    obj.checkBox264:setAlign("left");
    obj.checkBox264:setWidth(100);
    obj.checkBox264:setHorzTextAlign("center");
    obj.checkBox264:setText("RESISTENCIA");
    obj.checkBox264:setField("enableResistencia");
    obj.checkBox264:setMargins({right=50});
    obj.checkBox264:setName("checkBox264");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout133);
    obj.layout135:setAlign("top");
    obj.layout135:setHeight(25);
    obj.layout135:setName("layout135");

    obj.checkBox265 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox265:setParent(obj.layout135);
    obj.checkBox265:setAlign("left");
    obj.checkBox265:setHorzTextAlign("center");
    obj.checkBox265:setWidth(75);
    obj.checkBox265:setField("fortitude");
    obj.checkBox265:setText("Fortitude");
    obj.checkBox265:setName("checkBox265");

    obj.checkBox266 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox266:setParent(obj.layout135);
    obj.checkBox266:setAlign("left");
    obj.checkBox266:setHorzTextAlign("center");
    obj.checkBox266:setWidth(75);
    obj.checkBox266:setField("reflex");
    obj.checkBox266:setText("Reflexos");
    obj.checkBox266:setName("checkBox266");

    obj.checkBox267 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox267:setParent(obj.layout135);
    obj.checkBox267:setAlign("left");
    obj.checkBox267:setHorzTextAlign("center");
    obj.checkBox267:setWidth(75);
    obj.checkBox267:setField("will");
    obj.checkBox267:setText("Vontade");
    obj.checkBox267:setName("checkBox267");

    obj.checkBox268 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox268:setParent(obj.layout135);
    obj.checkBox268:setAlign("left");
    obj.checkBox268:setHorzTextAlign("center");
    obj.checkBox268:setWidth(75);
    obj.checkBox268:setField("none");
    obj.checkBox268:setText("Nenhum");
    obj.checkBox268:setName("checkBox268");

    obj.checkBox269 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox269:setParent(obj.layout135);
    obj.checkBox269:setAlign("left");
    obj.checkBox269:setHorzTextAlign("center");
    obj.checkBox269:setWidth(75);
    obj.checkBox269:setField("specialTR");
    obj.checkBox269:setText("Especial");
    obj.checkBox269:setName("checkBox269");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout133);
    obj.layout136:setAlign("top");
    obj.layout136:setHeight(25);
    obj.layout136:setName("layout136");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout136);
    obj.button43:setAlign("left");
    obj.button43:setHorzTextAlign("center");
    obj.button43:setWidth(187);
    obj.button43:setText("Marque Todas");
    obj.button43:setName("button43");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout136);
    obj.button44:setAlign("left");
    obj.button44:setHorzTextAlign("center");
    obj.button44:setWidth(187);
    obj.button44:setText("Desmarque Todas");
    obj.button44:setName("button44");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.scrollBox4);
    obj.layout137:setAlign("top");
    obj.layout137:setHeight(75);
    obj.layout137:setName("layout137");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout137);
    obj.layout138:setAlign("top");
    obj.layout138:setHeight(25);
    obj.layout138:setName("layout138");

    obj.checkBox270 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox270:setParent(obj.layout138);
    obj.checkBox270:setAlign("left");
    obj.checkBox270:setWidth(75);
    obj.checkBox270:setHorzTextAlign("center");
    obj.checkBox270:setText("RM");
    obj.checkBox270:setField("enableRm");
    obj.checkBox270:setMargins({right=75});
    obj.checkBox270:setName("checkBox270");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout137);
    obj.layout139:setAlign("top");
    obj.layout139:setHeight(25);
    obj.layout139:setName("layout139");

    obj.checkBox271 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox271:setParent(obj.layout139);
    obj.checkBox271:setAlign("left");
    obj.checkBox271:setHorzTextAlign("center");
    obj.checkBox271:setWidth(187);
    obj.checkBox271:setField("yes");
    obj.checkBox271:setText("Sim");
    obj.checkBox271:setName("checkBox271");

    obj.checkBox272 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox272:setParent(obj.layout139);
    obj.checkBox272:setAlign("left");
    obj.checkBox272:setHorzTextAlign("center");
    obj.checkBox272:setWidth(187);
    obj.checkBox272:setField("no");
    obj.checkBox272:setText("Não");
    obj.checkBox272:setName("checkBox272");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout137);
    obj.layout140:setAlign("top");
    obj.layout140:setHeight(25);
    obj.layout140:setName("layout140");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout140);
    obj.button45:setAlign("left");
    obj.button45:setHorzTextAlign("center");
    obj.button45:setWidth(187);
    obj.button45:setText("Marque Todas");
    obj.button45:setName("button45");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout140);
    obj.button46:setAlign("left");
    obj.button46:setHorzTextAlign("center");
    obj.button46:setWidth(187);
    obj.button46:setText("Desmarque Todas");
    obj.button46:setName("button46");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.scrollBox4);
    obj.layout141:setAlign("top");
    obj.layout141:setHeight(1025);
    obj.layout141:setName("layout141");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout141);
    obj.layout142:setAlign("top");
    obj.layout142:setHeight(25);
    obj.layout142:setName("layout142");

    obj.checkBox273 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox273:setParent(obj.layout142);
    obj.checkBox273:setAlign("left");
    obj.checkBox273:setWidth(75);
    obj.checkBox273:setHorzTextAlign("center");
    obj.checkBox273:setText("LIVRO");
    obj.checkBox273:setField("enableLivro");
    obj.checkBox273:setMargins({right=75});
    obj.checkBox273:setName("checkBox273");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout141);
    obj.layout143:setAlign("top");
    obj.layout143:setHeight(25);
    obj.layout143:setName("layout143");

    obj.checkBox274 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox274:setParent(obj.layout143);
    obj.checkBox274:setAlign("left");
    obj.checkBox274:setHorzTextAlign("center");
    obj.checkBox274:setWidth(125);
    obj.checkBox274:setField("Core");
    obj.checkBox274:setText("PFRPG Core");
    obj.checkBox274:setName("checkBox274");

    obj.checkBox275 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox275:setParent(obj.layout143);
    obj.checkBox275:setAlign("left");
    obj.checkBox275:setHorzTextAlign("center");
    obj.checkBox275:setWidth(125);
    obj.checkBox275:setField("UltMagic");
    obj.checkBox275:setText("Ultimate Magic");
    obj.checkBox275:setName("checkBox275");

    obj.checkBox276 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox276:setParent(obj.layout143);
    obj.checkBox276:setAlign("left");
    obj.checkBox276:setHorzTextAlign("center");
    obj.checkBox276:setWidth(125);
    obj.checkBox276:setField("Cheliax");
    obj.checkBox276:setText("Cheliax Empire Of Devils");
    obj.checkBox276:setFontSize(9);
    obj.checkBox276:setName("checkBox276");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout141);
    obj.layout144:setAlign("top");
    obj.layout144:setHeight(25);
    obj.layout144:setName("layout144");

    obj.checkBox277 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox277:setParent(obj.layout144);
    obj.checkBox277:setAlign("left");
    obj.checkBox277:setHorzTextAlign("center");
    obj.checkBox277:setWidth(125);
    obj.checkBox277:setField("Dwarves");
    obj.checkBox277:setText("Dwarves of Golarion");
    obj.checkBox277:setFontSize(11);
    obj.checkBox277:setName("checkBox277");

    obj.checkBox278 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox278:setParent(obj.layout144);
    obj.checkBox278:setAlign("left");
    obj.checkBox278:setHorzTextAlign("center");
    obj.checkBox278:setWidth(125);
    obj.checkBox278:setField("Treasures");
    obj.checkBox278:setText("Classic Treasures");
    obj.checkBox278:setName("checkBox278");

    obj.checkBox279 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox279:setParent(obj.layout144);
    obj.checkBox279:setAlign("left");
    obj.checkBox279:setHorzTextAlign("center");
    obj.checkBox279:setWidth(125);
    obj.checkBox279:setField("Gnomes");
    obj.checkBox279:setText("Gnomes Of Golarion");
    obj.checkBox279:setFontSize(11);
    obj.checkBox279:setName("checkBox279");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout141);
    obj.layout145:setAlign("top");
    obj.layout145:setHeight(25);
    obj.layout145:setName("layout145");

    obj.checkBox280 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox280:setParent(obj.layout145);
    obj.checkBox280:setAlign("left");
    obj.checkBox280:setHorzTextAlign("center");
    obj.checkBox280:setWidth(125);
    obj.checkBox280:setField("Faction");
    obj.checkBox280:setText("Faction Guide");
    obj.checkBox280:setName("checkBox280");

    obj.checkBox281 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox281:setParent(obj.layout145);
    obj.checkBox281:setAlign("left");
    obj.checkBox281:setHorzTextAlign("center");
    obj.checkBox281:setWidth(125);
    obj.checkBox281:setField("Sargava");
    obj.checkBox281:setText("Sargava");
    obj.checkBox281:setName("checkBox281");

    obj.checkBox282 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox282:setParent(obj.layout145);
    obj.checkBox282:setAlign("left");
    obj.checkBox282:setHorzTextAlign("center");
    obj.checkBox282:setWidth(125);
    obj.checkBox282:setField("Orcs");
    obj.checkBox282:setText("Orcs of Golarion");
    obj.checkBox282:setName("checkBox282");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout141);
    obj.layout146:setAlign("top");
    obj.layout146:setHeight(25);
    obj.layout146:setName("layout146");

    obj.checkBox283 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox283:setParent(obj.layout146);
    obj.checkBox283:setAlign("left");
    obj.checkBox283:setHorzTextAlign("center");
    obj.checkBox283:setWidth(125);
    obj.checkBox283:setField("APG");
    obj.checkBox283:setText("Advanced Player's Guide");
    obj.checkBox283:setFontSize(9);
    obj.checkBox283:setName("checkBox283");

    obj.checkBox284 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox284:setParent(obj.layout146);
    obj.checkBox284:setAlign("left");
    obj.checkBox284:setHorzTextAlign("center");
    obj.checkBox284:setWidth(125);
    obj.checkBox284:setField("ISWorld");
    obj.checkBox284:setText("Inner Sea World Guide");
    obj.checkBox284:setFontSize(9);
    obj.checkBox284:setName("checkBox284");

    obj.checkBox285 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox285:setParent(obj.layout146);
    obj.checkBox285:setAlign("left");
    obj.checkBox285:setHorzTextAlign("center");
    obj.checkBox285:setWidth(125);
    obj.checkBox285:setField("FaithPurity");
    obj.checkBox285:setText("Faiths Of Purity");
    obj.checkBox285:setName("checkBox285");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout141);
    obj.layout147:setAlign("top");
    obj.layout147:setHeight(25);
    obj.layout147:setName("layout147");

    obj.checkBox286 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox286:setParent(obj.layout147);
    obj.checkBox286:setAlign("left");
    obj.checkBox286:setHorzTextAlign("center");
    obj.checkBox286:setWidth(125);
    obj.checkBox286:setField("Rival");
    obj.checkBox286:setText("Rival Guide");
    obj.checkBox286:setName("checkBox286");

    obj.checkBox287 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox287:setParent(obj.layout147);
    obj.checkBox287:setAlign("left");
    obj.checkBox287:setHorzTextAlign("center");
    obj.checkBox287:setWidth(125);
    obj.checkBox287:setField("Blog");
    obj.checkBox287:setText("Paizo Blog");
    obj.checkBox287:setName("checkBox287");

    obj.checkBox288 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox288:setParent(obj.layout147);
    obj.checkBox288:setAlign("left");
    obj.checkBox288:setHorzTextAlign("center");
    obj.checkBox288:setWidth(125);
    obj.checkBox288:setField("Humans");
    obj.checkBox288:setText("Humans Of Golarion");
    obj.checkBox288:setFontSize(11);
    obj.checkBox288:setName("checkBox288");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout141);
    obj.layout148:setAlign("top");
    obj.layout148:setHeight(25);
    obj.layout148:setName("layout148");

    obj.checkBox289 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox289:setParent(obj.layout148);
    obj.checkBox289:setAlign("left");
    obj.checkBox289:setHorzTextAlign("center");
    obj.checkBox289:setWidth(125);
    obj.checkBox289:setField("Dungeons");
    obj.checkBox289:setText("Dungeons Of Golarion");
    obj.checkBox289:setFontSize(11);
    obj.checkBox289:setName("checkBox289");

    obj.checkBox290 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox290:setParent(obj.layout148);
    obj.checkBox290:setAlign("left");
    obj.checkBox290:setHorzTextAlign("center");
    obj.checkBox290:setWidth(125);
    obj.checkBox290:setField("PFSocietyFG");
    obj.checkBox290:setText("PF Society Field Guide");
    obj.checkBox290:setFontSize(11);
    obj.checkBox290:setName("checkBox290");

    obj.checkBox291 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox291:setParent(obj.layout148);
    obj.checkBox291:setAlign("left");
    obj.checkBox291:setHorzTextAlign("center");
    obj.checkBox291:setWidth(125);
    obj.checkBox291:setField("Goblins");
    obj.checkBox291:setText("Goblins Of Golarion");
    obj.checkBox291:setFontSize(11);
    obj.checkBox291:setName("checkBox291");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.layout141);
    obj.layout149:setAlign("top");
    obj.layout149:setHeight(25);
    obj.layout149:setName("layout149");

    obj.checkBox292 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox292:setParent(obj.layout149);
    obj.checkBox292:setAlign("left");
    obj.checkBox292:setHorzTextAlign("center");
    obj.checkBox292:setWidth(125);
    obj.checkBox292:setField("ISMagic");
    obj.checkBox292:setText("Inner Sea Magic");
    obj.checkBox292:setName("checkBox292");

    obj.checkBox293 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox293:setParent(obj.layout149);
    obj.checkBox293:setAlign("left");
    obj.checkBox293:setHorzTextAlign("center");
    obj.checkBox293:setWidth(125);
    obj.checkBox293:setField("UltCombat");
    obj.checkBox293:setText("Ultimate Combat");
    obj.checkBox293:setName("checkBox293");

    obj.checkBox294 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox294:setParent(obj.layout149);
    obj.checkBox294:setAlign("left");
    obj.checkBox294:setHorzTextAlign("center");
    obj.checkBox294:setWidth(125);
    obj.checkBox294:setField("FaithCorruption");
    obj.checkBox294:setText("Faiths Of Corruption");
    obj.checkBox294:setFontSize(11);
    obj.checkBox294:setName("checkBox294");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.layout141);
    obj.layout150:setAlign("top");
    obj.layout150:setHeight(25);
    obj.layout150:setName("layout150");

    obj.checkBox295 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox295:setParent(obj.layout150);
    obj.checkBox295:setAlign("left");
    obj.checkBox295:setHorzTextAlign("center");
    obj.checkBox295:setWidth(125);
    obj.checkBox295:setField("Apocalypse");
    obj.checkBox295:setText("Horsemen Of The Apocalypse");
    obj.checkBox295:setFontSize(8);
    obj.checkBox295:setName("checkBox295");

    obj.checkBox296 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox296:setParent(obj.layout150);
    obj.checkBox296:setAlign("left");
    obj.checkBox296:setHorzTextAlign("center");
    obj.checkBox296:setWidth(125);
    obj.checkBox296:setField("DEP");
    obj.checkBox296:setText("Dragon Empires Primer");
    obj.checkBox296:setFontSize(9);
    obj.checkBox296:setName("checkBox296");

    obj.checkBox297 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox297:setParent(obj.layout150);
    obj.checkBox297:setAlign("left");
    obj.checkBox297:setHorzTextAlign("center");
    obj.checkBox297:setWidth(125);
    obj.checkBox297:setField("Pirates");
    obj.checkBox297:setText("Pirates Of The Inner Sea");
    obj.checkBox297:setFontSize(9);
    obj.checkBox297:setName("checkBox297");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout141);
    obj.layout151:setAlign("top");
    obj.layout151:setHeight(25);
    obj.layout151:setName("layout151");

    obj.checkBox298 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox298:setParent(obj.layout151);
    obj.checkBox298:setAlign("left");
    obj.checkBox298:setHorzTextAlign("center");
    obj.checkBox298:setWidth(125);
    obj.checkBox298:setField("Kingdoms");
    obj.checkBox298:setText("Lost Kingdoms");
    obj.checkBox298:setName("checkBox298");

    obj.checkBox299 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox299:setParent(obj.layout151);
    obj.checkBox299:setAlign("left");
    obj.checkBox299:setHorzTextAlign("center");
    obj.checkBox299:setWidth(125);
    obj.checkBox299:setField("ARG");
    obj.checkBox299:setText("Advanced Race Guide");
    obj.checkBox299:setFontSize(11);
    obj.checkBox299:setName("checkBox299");

    obj.checkBox300 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox300:setParent(obj.layout151);
    obj.checkBox300:setAlign("left");
    obj.checkBox300:setHorzTextAlign("center");
    obj.checkBox300:setWidth(125);
    obj.checkBox300:setField("Runelords");
    obj.checkBox300:setText("Rise of Runelords");
    obj.checkBox300:setName("checkBox300");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout141);
    obj.layout152:setAlign("top");
    obj.layout152:setHeight(25);
    obj.layout152:setName("layout152");

    obj.checkBox301 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox301:setParent(obj.layout152);
    obj.checkBox301:setAlign("left");
    obj.checkBox301:setHorzTextAlign("center");
    obj.checkBox301:setWidth(125);
    obj.checkBox301:setField("Knights");
    obj.checkBox301:setText("Knights Of The Inner Sea");
    obj.checkBox301:setFontSize(9);
    obj.checkBox301:setName("checkBox301");

    obj.checkBox302 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox302:setParent(obj.layout152);
    obj.checkBox302:setAlign("left");
    obj.checkBox302:setHorzTextAlign("center");
    obj.checkBox302:setWidth(125);
    obj.checkBox302:setField("BloodNight");
    obj.checkBox302:setText("Blood Of The Night");
    obj.checkBox302:setFontSize(11);
    obj.checkBox302:setName("checkBox302");

    obj.checkBox303 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox303:setParent(obj.layout152);
    obj.checkBox303:setAlign("left");
    obj.checkBox303:setHorzTextAlign("center");
    obj.checkBox303:setWidth(125);
    obj.checkBox303:setField("North");
    obj.checkBox303:setText("People Of The North");
    obj.checkBox303:setFontSize(11);
    obj.checkBox303:setName("checkBox303");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout141);
    obj.layout153:setAlign("top");
    obj.layout153:setHeight(25);
    obj.layout153:setName("layout153");

    obj.checkBox304 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox304:setParent(obj.layout153);
    obj.checkBox304:setAlign("left");
    obj.checkBox304:setHorzTextAlign("center");
    obj.checkBox304:setWidth(125);
    obj.checkBox304:setField("Animal");
    obj.checkBox304:setText("Animal Archive");
    obj.checkBox304:setName("checkBox304");

    obj.checkBox305 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox305:setParent(obj.layout153);
    obj.checkBox305:setAlign("left");
    obj.checkBox305:setHorzTextAlign("center");
    obj.checkBox305:setWidth(125);
    obj.checkBox305:setField("Dungeoneers");
    obj.checkBox305:setText("Dungeoneers Handbook");
    obj.checkBox305:setFontSize(9);
    obj.checkBox305:setName("checkBox305");

    obj.checkBox306 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox306:setParent(obj.layout153);
    obj.checkBox306:setAlign("left");
    obj.checkBox306:setHorzTextAlign("center");
    obj.checkBox306:setWidth(125);
    obj.checkBox306:setField("Cards");
    obj.checkBox306:setText("Condition Cards");
    obj.checkBox306:setName("checkBox306");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout141);
    obj.layout154:setAlign("top");
    obj.layout154:setHeight(25);
    obj.layout154:setName("layout154");

    obj.checkBox307 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox307:setParent(obj.layout154);
    obj.checkBox307:setAlign("left");
    obj.checkBox307:setHorzTextAlign("center");
    obj.checkBox307:setWidth(125);
    obj.checkBox307:setField("ChampionsPurity");
    obj.checkBox307:setText("Champions Of Purity");
    obj.checkBox307:setFontSize(11);
    obj.checkBox307:setName("checkBox307");

    obj.checkBox308 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox308:setParent(obj.layout154);
    obj.checkBox308:setAlign("left");
    obj.checkBox308:setHorzTextAlign("center");
    obj.checkBox308:setWidth(125);
    obj.checkBox308:setField("Chronicle");
    obj.checkBox308:setText("Chronicle Of The Righteous");
    obj.checkBox308:setFontSize(9);
    obj.checkBox308:setName("checkBox308");

    obj.checkBox309 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox309:setParent(obj.layout154);
    obj.checkBox309:setAlign("left");
    obj.checkBox309:setHorzTextAlign("center");
    obj.checkBox309:setWidth(125);
    obj.checkBox309:setField("Kobolds");
    obj.checkBox309:setText("Kobolds Of Golarion");
    obj.checkBox309:setFontSize(11);
    obj.checkBox309:setName("checkBox309");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout141);
    obj.layout155:setAlign("top");
    obj.layout155:setHeight(25);
    obj.layout155:setName("layout155");

    obj.checkBox310 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox310:setParent(obj.layout155);
    obj.checkBox310:setAlign("left");
    obj.checkBox310:setHorzTextAlign("center");
    obj.checkBox310:setWidth(125);
    obj.checkBox310:setField("Quests");
    obj.checkBox310:setText("Quests and Campaigns");
    obj.checkBox310:setFontSize(9);
    obj.checkBox310:setName("checkBox310");

    obj.checkBox311 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox311:setParent(obj.layout155);
    obj.checkBox311:setAlign("left");
    obj.checkBox311:setHorzTextAlign("center");
    obj.checkBox311:setWidth(125);
    obj.checkBox311:setField("Dragonslayer");
    obj.checkBox311:setText("Dragonslayer's Handbook");
    obj.checkBox311:setFontSize(9);
    obj.checkBox311:setName("checkBox311");

    obj.checkBox312 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox312:setParent(obj.layout155);
    obj.checkBox312:setAlign("left");
    obj.checkBox312:setHorzTextAlign("center");
    obj.checkBox312:setWidth(125);
    obj.checkBox312:setField("PFSocietyP");
    obj.checkBox312:setText("Pathfinder Society Primer");
    obj.checkBox312:setFontSize(9);
    obj.checkBox312:setName("checkBox312");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout141);
    obj.layout156:setAlign("top");
    obj.layout156:setHeight(25);
    obj.layout156:setName("layout156");

    obj.checkBox313 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox313:setParent(obj.layout156);
    obj.checkBox313:setAlign("left");
    obj.checkBox313:setHorzTextAlign("center");
    obj.checkBox313:setWidth(125);
    obj.checkBox313:setField("Demand");
    obj.checkBox313:setText("The Dragon's Demand");
    obj.checkBox313:setFontSize(11);
    obj.checkBox313:setName("checkBox313");

    obj.checkBox314 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox314:setParent(obj.layout156);
    obj.checkBox314:setAlign("left");
    obj.checkBox314:setHorzTextAlign("center");
    obj.checkBox314:setWidth(125);
    obj.checkBox314:setField("FaithPhil");
    obj.checkBox314:setText("Faiths & Philosophies");
    obj.checkBox314:setFontSize(11);
    obj.checkBox314:setName("checkBox314");

    obj.checkBox315 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox315:setParent(obj.layout156);
    obj.checkBox315:setAlign("left");
    obj.checkBox315:setHorzTextAlign("center");
    obj.checkBox315:setWidth(125);
    obj.checkBox315:setField("DemonHunter");
    obj.checkBox315:setText("Demon Hunter's Handbook");
    obj.checkBox315:setFontSize(9);
    obj.checkBox315:setName("checkBox315");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout141);
    obj.layout157:setAlign("top");
    obj.layout157:setHeight(25);
    obj.layout157:setName("layout157");

    obj.checkBox316 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox316:setParent(obj.layout157);
    obj.checkBox316:setAlign("left");
    obj.checkBox316:setHorzTextAlign("center");
    obj.checkBox316:setWidth(125);
    obj.checkBox316:setField("Demons");
    obj.checkBox316:setText("Demons Revisited");
    obj.checkBox316:setName("checkBox316");

    obj.checkBox317 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox317:setParent(obj.layout157);
    obj.checkBox317:setAlign("left");
    obj.checkBox317:setHorzTextAlign("center");
    obj.checkBox317:setWidth(125);
    obj.checkBox317:setField("MythicAdv");
    obj.checkBox317:setText("Mythic Adventures");
    obj.checkBox317:setName("checkBox317");

    obj.checkBox318 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox318:setParent(obj.layout157);
    obj.checkBox318:setAlign("left");
    obj.checkBox318:setHorzTextAlign("center");
    obj.checkBox318:setWidth(125);
    obj.checkBox318:setField("MythicOrg");
    obj.checkBox318:setText("Mythic Origins");
    obj.checkBox318:setName("checkBox318");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout141);
    obj.layout158:setAlign("top");
    obj.layout158:setHeight(25);
    obj.layout158:setName("layout158");

    obj.checkBox319 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox319:setParent(obj.layout158);
    obj.checkBox319:setAlign("left");
    obj.checkBox319:setHorzTextAlign("center");
    obj.checkBox319:setWidth(125);
    obj.checkBox319:setField("BloodMoon");
    obj.checkBox319:setText("Blood Of The Moon");
    obj.checkBox319:setFontSize(11);
    obj.checkBox319:setName("checkBox319");

    obj.checkBox320 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox320:setParent(obj.layout158);
    obj.checkBox320:setAlign("left");
    obj.checkBox320:setHorzTextAlign("center");
    obj.checkBox320:setWidth(125);
    obj.checkBox320:setField("Marketplace");
    obj.checkBox320:setText("Magical Marketplace");
    obj.checkBox320:setFontSize(11);
    obj.checkBox320:setName("checkBox320");

    obj.checkBox321 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox321:setParent(obj.layout158);
    obj.checkBox321:setAlign("left");
    obj.checkBox321:setHorzTextAlign("center");
    obj.checkBox321:setWidth(125);
    obj.checkBox321:setField("Osirion");
    obj.checkBox321:setText("Osirion, Legacy Of Pharaohs");
    obj.checkBox321:setFontSize(9);
    obj.checkBox321:setName("checkBox321");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout141);
    obj.layout159:setAlign("top");
    obj.layout159:setHeight(25);
    obj.layout159:setName("layout159");

    obj.checkBox322 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox322:setParent(obj.layout159);
    obj.checkBox322:setAlign("left");
    obj.checkBox322:setHorzTextAlign("center");
    obj.checkBox322:setWidth(125);
    obj.checkBox322:setField("Sands");
    obj.checkBox322:setText("People Of The Sands");
    obj.checkBox322:setFontSize(11);
    obj.checkBox322:setName("checkBox322");

    obj.checkBox323 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox323:setParent(obj.layout159);
    obj.checkBox323:setAlign("left");
    obj.checkBox323:setHorzTextAlign("center");
    obj.checkBox323:setWidth(125);
    obj.checkBox323:setField("ChampionsBalance");
    obj.checkBox323:setText("Champions Of Balance");
    obj.checkBox323:setFontSize(11);
    obj.checkBox323:setName("checkBox323");

    obj.checkBox324 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox324:setParent(obj.layout159);
    obj.checkBox324:setAlign("left");
    obj.checkBox324:setHorzTextAlign("center");
    obj.checkBox324:setWidth(125);
    obj.checkBox324:setField("Quarterly");
    obj.checkBox324:setText("Kobold Quarterly");
    obj.checkBox324:setName("checkBox324");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.layout141);
    obj.layout160:setAlign("top");
    obj.layout160:setHeight(25);
    obj.layout160:setName("layout160");

    obj.checkBox325 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox325:setParent(obj.layout160);
    obj.checkBox325:setAlign("left");
    obj.checkBox325:setHorzTextAlign("center");
    obj.checkBox325:setWidth(125);
    obj.checkBox325:setField("UndeadSlayer");
    obj.checkBox325:setText("Undead Slayer's Handbook");
    obj.checkBox325:setFontSize(9);
    obj.checkBox325:setName("checkBox325");

    obj.checkBox326 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox326:setParent(obj.layout160);
    obj.checkBox326:setAlign("left");
    obj.checkBox326:setHorzTextAlign("center");
    obj.checkBox326:setWidth(125);
    obj.checkBox326:setField("ISGods");
    obj.checkBox326:setText("Inner Sea Gods");
    obj.checkBox326:setName("checkBox326");

    obj.checkBox327 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox327:setParent(obj.layout160);
    obj.checkBox327:setAlign("left");
    obj.checkBox327:setHorzTextAlign("center");
    obj.checkBox327:setWidth(125);
    obj.checkBox327:setField("Mysteries");
    obj.checkBox327:setText("Occult Mysteries");
    obj.checkBox327:setName("checkBox327");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout141);
    obj.layout161:setAlign("top");
    obj.layout161:setHeight(25);
    obj.layout161:setName("layout161");

    obj.checkBox328 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox328:setParent(obj.layout161);
    obj.checkBox328:setAlign("left");
    obj.checkBox328:setHorzTextAlign("center");
    obj.checkBox328:setWidth(125);
    obj.checkBox328:setField("Harrow");
    obj.checkBox328:setText("The HarrowHandbook");
    obj.checkBox328:setFontSize(11);
    obj.checkBox328:setName("checkBox328");

    obj.checkBox329 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox329:setParent(obj.layout161);
    obj.checkBox329:setAlign("left");
    obj.checkBox329:setHorzTextAlign("center");
    obj.checkBox329:setWidth(125);
    obj.checkBox329:setField("BloodElements");
    obj.checkBox329:setText("Blood Of The Elements");
    obj.checkBox329:setFontSize(11);
    obj.checkBox329:setName("checkBox329");

    obj.checkBox330 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox330:setParent(obj.layout161);
    obj.checkBox330:setAlign("left");
    obj.checkBox330:setHorzTextAlign("center");
    obj.checkBox330:setWidth(125);
    obj.checkBox330:setField("River");
    obj.checkBox330:setText("People Of The River");
    obj.checkBox330:setFontSize(11);
    obj.checkBox330:setName("checkBox330");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout141);
    obj.layout162:setAlign("top");
    obj.layout162:setHeight(25);
    obj.layout162:setName("layout162");

    obj.checkBox331 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox331:setParent(obj.layout162);
    obj.checkBox331:setAlign("left");
    obj.checkBox331:setHorzTextAlign("center");
    obj.checkBox331:setWidth(125);
    obj.checkBox331:setField("Technology");
    obj.checkBox331:setText("Technology Guide");
    obj.checkBox331:setName("checkBox331");

    obj.checkBox332 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox332:setParent(obj.layout162);
    obj.checkBox332:setAlign("left");
    obj.checkBox332:setHorzTextAlign("center");
    obj.checkBox332:setWidth(125);
    obj.checkBox332:setField("Stars");
    obj.checkBox332:setText("People Of The Stars");
    obj.checkBox332:setFontSize(11);
    obj.checkBox332:setName("checkBox332");

    obj.checkBox333 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox333:setParent(obj.layout162);
    obj.checkBox333:setAlign("left");
    obj.checkBox333:setHorzTextAlign("center");
    obj.checkBox333:setWidth(125);
    obj.checkBox333:setField("ACG");
    obj.checkBox333:setText("Advanced Class Guide");
    obj.checkBox333:setFontSize(11);
    obj.checkBox333:setName("checkBox333");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout141);
    obj.layout163:setAlign("top");
    obj.layout163:setHeight(25);
    obj.layout163:setName("layout163");

    obj.checkBox334 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox334:setParent(obj.layout163);
    obj.checkBox334:setAlign("left");
    obj.checkBox334:setHorzTextAlign("center");
    obj.checkBox334:setWidth(125);
    obj.checkBox334:setField("ChampionsCorruption");
    obj.checkBox334:setText("Champions Of Corruption");
    obj.checkBox334:setFontSize(9);
    obj.checkBox334:setName("checkBox334");

    obj.checkBox335 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox335:setParent(obj.layout163);
    obj.checkBox335:setAlign("left");
    obj.checkBox335:setHorzTextAlign("center");
    obj.checkBox335:setWidth(125);
    obj.checkBox335:setField("ACO");
    obj.checkBox335:setText("Advanced Class Origins");
    obj.checkBox335:setFontSize(9);
    obj.checkBox335:setName("checkBox335");

    obj.checkBox336 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox336:setParent(obj.layout163);
    obj.checkBox336:setAlign("left");
    obj.checkBox336:setHorzTextAlign("center");
    obj.checkBox336:setWidth(125);
    obj.checkBox336:setField("MonsterCodex");
    obj.checkBox336:setText("Monster Codex");
    obj.checkBox336:setName("checkBox336");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout141);
    obj.layout164:setAlign("top");
    obj.layout164:setHeight(25);
    obj.layout164:setName("layout164");

    obj.checkBox337 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox337:setParent(obj.layout164);
    obj.checkBox337:setAlign("left");
    obj.checkBox337:setHorzTextAlign("center");
    obj.checkBox337:setWidth(125);
    obj.checkBox337:setField("Ranged");
    obj.checkBox337:setText("Ranged Tactics Toolbox");
    obj.checkBox337:setFontSize(9);
    obj.checkBox337:setName("checkBox337");

    obj.checkBox338 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox338:setParent(obj.layout164);
    obj.checkBox338:setAlign("left");
    obj.checkBox338:setHorzTextAlign("center");
    obj.checkBox338:setWidth(125);
    obj.checkBox338:setField("Giant");
    obj.checkBox338:setText("Giant Hunters Handbook");
    obj.checkBox338:setFontSize(9);
    obj.checkBox338:setName("checkBox338");

    obj.checkBox339 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox339:setParent(obj.layout164);
    obj.checkBox339:setAlign("left");
    obj.checkBox339:setHorzTextAlign("center");
    obj.checkBox339:setWidth(125);
    obj.checkBox339:setField("Familiar");
    obj.checkBox339:setText("Familiar Folio");
    obj.checkBox339:setName("checkBox339");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout141);
    obj.layout165:setAlign("top");
    obj.layout165:setHeight(25);
    obj.layout165:setName("layout165");

    obj.checkBox340 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox340:setParent(obj.layout165);
    obj.checkBox340:setAlign("left");
    obj.checkBox340:setHorzTextAlign("center");
    obj.checkBox340:setWidth(125);
    obj.checkBox340:setField("Melee");
    obj.checkBox340:setText("Melee Tactics Toolbox");
    obj.checkBox340:setFontSize(11);
    obj.checkBox340:setName("checkBox340");

    obj.checkBox341 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox341:setParent(obj.layout165);
    obj.checkBox341:setAlign("left");
    obj.checkBox341:setHorzTextAlign("center");
    obj.checkBox341:setWidth(125);
    obj.checkBox341:setField("HeroesWild");
    obj.checkBox341:setText("Heroes Of The Wild");
    obj.checkBox341:setFontSize(11);
    obj.checkBox341:setName("checkBox341");

    obj.checkBox342 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox342:setParent(obj.layout165);
    obj.checkBox342:setAlign("left");
    obj.checkBox342:setHorzTextAlign("center");
    obj.checkBox342:setWidth(125);
    obj.checkBox342:setField("Cohorts");
    obj.checkBox342:setText("Cohorts & Companions");
    obj.checkBox342:setFontSize(9);
    obj.checkBox342:setName("checkBox342");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout141);
    obj.layout166:setAlign("top");
    obj.layout166:setHeight(25);
    obj.layout166:setName("layout166");

    obj.checkBox343 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox343:setParent(obj.layout166);
    obj.checkBox343:setAlign("left");
    obj.checkBox343:setHorzTextAlign("center");
    obj.checkBox343:setWidth(125);
    obj.checkBox343:setField("Summoner");
    obj.checkBox343:setText("Monster Summoner's HB");
    obj.checkBox343:setFontSize(9);
    obj.checkBox343:setName("checkBox343");

    obj.checkBox344 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox344:setParent(obj.layout166);
    obj.checkBox344:setAlign("left");
    obj.checkBox344:setHorzTextAlign("center");
    obj.checkBox344:setWidth(125);
    obj.checkBox344:setField("ISMonster");
    obj.checkBox344:setText("Inner Sea Monster Codex");
    obj.checkBox344:setFontSize(9);
    obj.checkBox344:setName("checkBox344");

    obj.checkBox345 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox345:setParent(obj.layout166);
    obj.checkBox345:setAlign("left");
    obj.checkBox345:setHorzTextAlign("center");
    obj.checkBox345:setWidth(125);
    obj.checkBox345:setField("OccultAdventures");
    obj.checkBox345:setText("Occult Adventures");
    obj.checkBox345:setName("checkBox345");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout141);
    obj.layout167:setAlign("top");
    obj.layout167:setHeight(25);
    obj.layout167:setName("layout167");

    obj.checkBox346 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox346:setParent(obj.layout167);
    obj.checkBox346:setAlign("left");
    obj.checkBox346:setHorzTextAlign("center");
    obj.checkBox346:setWidth(125);
    obj.checkBox346:setField("Dirty");
    obj.checkBox346:setText("Dirty Tactics Toolbox");
    obj.checkBox346:setFontSize(11);
    obj.checkBox346:setName("checkBox346");

    obj.checkBox347 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox347:setParent(obj.layout167);
    obj.checkBox347:setAlign("left");
    obj.checkBox347:setHorzTextAlign("center");
    obj.checkBox347:setWidth(125);
    obj.checkBox347:setField("Streets");
    obj.checkBox347:setText("Heroes Of The Streets");
    obj.checkBox347:setFontSize(11);
    obj.checkBox347:setName("checkBox347");

    obj.checkBox348 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox348:setParent(obj.layout167);
    obj.checkBox348:setAlign("left");
    obj.checkBox348:setHorzTextAlign("center");
    obj.checkBox348:setWidth(125);
    obj.checkBox348:setField("ISRaces");
    obj.checkBox348:setText("Inner Sea Races");
    obj.checkBox348:setName("checkBox348");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout141);
    obj.layout168:setAlign("top");
    obj.layout168:setHeight(25);
    obj.layout168:setName("layout168");

    obj.checkBox349 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox349:setParent(obj.layout168);
    obj.checkBox349:setAlign("left");
    obj.checkBox349:setHorzTextAlign("center");
    obj.checkBox349:setWidth(125);
    obj.checkBox349:setField("OccultOrigins");
    obj.checkBox349:setText("Occult Origins");
    obj.checkBox349:setName("checkBox349");

    obj.checkBox350 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox350:setParent(obj.layout168);
    obj.checkBox350:setAlign("left");
    obj.checkBox350:setHorzTextAlign("center");
    obj.checkBox350:setWidth(125);
    obj.checkBox350:setField("BlackMarket");
    obj.checkBox350:setText("Black Markets");
    obj.checkBox350:setName("checkBox350");

    obj.checkBox351 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox351:setParent(obj.layout168);
    obj.checkBox351:setAlign("left");
    obj.checkBox351:setHorzTextAlign("center");
    obj.checkBox351:setWidth(125);
    obj.checkBox351:setField("OccultRealms");
    obj.checkBox351:setText("Occult Realms");
    obj.checkBox351:setName("checkBox351");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout141);
    obj.layout169:setAlign("top");
    obj.layout169:setHeight(25);
    obj.layout169:setName("layout169");

    obj.checkBox352 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox352:setParent(obj.layout169);
    obj.checkBox352:setAlign("left");
    obj.checkBox352:setHorzTextAlign("center");
    obj.checkBox352:setWidth(125);
    obj.checkBox352:setField("Agents");
    obj.checkBox352:setText("Agents Of Evil");
    obj.checkBox352:setName("checkBox352");

    obj.checkBox353 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox353:setParent(obj.layout169);
    obj.checkBox353:setAlign("left");
    obj.checkBox353:setHorzTextAlign("center");
    obj.checkBox353:setWidth(125);
    obj.checkBox353:setField("Arcane");
    obj.checkBox353:setText("Arcane Anthology");
    obj.checkBox353:setName("checkBox353");

    obj.checkBox354 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox354:setParent(obj.layout169);
    obj.checkBox354:setAlign("left");
    obj.checkBox354:setHorzTextAlign("center");
    obj.checkBox354:setWidth(125);
    obj.checkBox354:setField("BloodShadows");
    obj.checkBox354:setText("Blood Of Shadows");
    obj.checkBox354:setName("checkBox354");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout141);
    obj.layout170:setAlign("top");
    obj.layout170:setHeight(25);
    obj.layout170:setName("layout170");

    obj.checkBox355 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox355:setParent(obj.layout170);
    obj.checkBox355:setAlign("left");
    obj.checkBox355:setHorzTextAlign("center");
    obj.checkBox355:setWidth(125);
    obj.checkBox355:setField("UltIntrigue");
    obj.checkBox355:setText("Ultimate Intrigue");
    obj.checkBox355:setName("checkBox355");

    obj.checkBox356 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox356:setParent(obj.layout170);
    obj.checkBox356:setAlign("left");
    obj.checkBox356:setHorzTextAlign("center");
    obj.checkBox356:setWidth(125);
    obj.checkBox356:setField("Armor");
    obj.checkBox356:setText("Armor Masters Handbook");
    obj.checkBox356:setFontSize(9);
    obj.checkBox356:setName("checkBox356");

    obj.checkBox357 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox357:setParent(obj.layout170);
    obj.checkBox357:setAlign("left");
    obj.checkBox357:setHorzTextAlign("center");
    obj.checkBox357:setWidth(125);
    obj.checkBox357:setField("MagicTactics");
    obj.checkBox357:setText("Magic Tactics Toolbox");
    obj.checkBox357:setFontSize(11);
    obj.checkBox357:setName("checkBox357");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout141);
    obj.layout171:setAlign("top");
    obj.layout171:setHeight(25);
    obj.layout171:setName("layout171");

    obj.checkBox358 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox358:setParent(obj.layout171);
    obj.checkBox358:setAlign("left");
    obj.checkBox358:setHorzTextAlign("center");
    obj.checkBox358:setWidth(125);
    obj.checkBox358:setField("ISIntrigue");
    obj.checkBox358:setText("Inner Sea Intrigue");
    obj.checkBox358:setName("checkBox358");

    obj.checkBox359 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox359:setParent(obj.layout171);
    obj.checkBox359:setAlign("left");
    obj.checkBox359:setHorzTextAlign("center");
    obj.checkBox359:setWidth(125);
    obj.checkBox359:setField("Spymaster");
    obj.checkBox359:setText("Spymaster's Handbook");
    obj.checkBox359:setFontSize(11);
    obj.checkBox359:setName("checkBox359");

    obj.checkBox360 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox360:setParent(obj.layout171);
    obj.checkBox360:setAlign("left");
    obj.checkBox360:setHorzTextAlign("center");
    obj.checkBox360:setWidth(125);
    obj.checkBox360:setField("LegacyDragons");
    obj.checkBox360:setText("Legacy Of Dragons");
    obj.checkBox360:setName("checkBox360");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.layout141);
    obj.layout172:setAlign("top");
    obj.layout172:setHeight(25);
    obj.layout172:setName("layout172");

    obj.checkBox361 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox361:setParent(obj.layout172);
    obj.checkBox361:setAlign("left");
    obj.checkBox361:setHorzTextAlign("center");
    obj.checkBox361:setWidth(125);
    obj.checkBox361:setField("Horror");
    obj.checkBox361:setText("Horror Adventures");
    obj.checkBox361:setName("checkBox361");

    obj.checkBox362 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox362:setParent(obj.layout172);
    obj.checkBox362:setAlign("left");
    obj.checkBox362:setHorzTextAlign("center");
    obj.checkBox362:setWidth(125);
    obj.checkBox362:setField("Haunted");
    obj.checkBox362:setText("Haunted Heroes Handbook");
    obj.checkBox362:setFontSize(9);
    obj.checkBox362:setName("checkBox362");

    obj.checkBox363 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox363:setParent(obj.layout172);
    obj.checkBox363:setAlign("left");
    obj.checkBox363:setHorzTextAlign("center");
    obj.checkBox363:setWidth(125);
    obj.checkBox363:setField("Planes");
    obj.checkBox363:setText("Planes Of Power");
    obj.checkBox363:setName("checkBox363");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.layout141);
    obj.layout173:setAlign("top");
    obj.layout173:setHeight(25);
    obj.layout173:setName("layout173");

    obj.checkBox364 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox364:setParent(obj.layout173);
    obj.checkBox364:setAlign("left");
    obj.checkBox364:setHorzTextAlign("center");
    obj.checkBox364:setWidth(125);
    obj.checkBox364:setField("Divine");
    obj.checkBox364:setText("Divine Anthology");
    obj.checkBox364:setName("checkBox364");

    obj.checkBox365 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox365:setParent(obj.layout173);
    obj.checkBox365:setAlign("left");
    obj.checkBox365:setHorzTextAlign("center");
    obj.checkBox365:setWidth(125);
    obj.checkBox365:setField("ISTemples");
    obj.checkBox365:setText("Inner Sea Temples");
    obj.checkBox365:setName("checkBox365");

    obj.checkBox366 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox366:setParent(obj.layout173);
    obj.checkBox366:setAlign("left");
    obj.checkBox366:setHorzTextAlign("center");
    obj.checkBox366:setWidth(125);
    obj.checkBox366:setField("Crimson");
    obj.checkBox366:setText("Curse Of The Crimson Throne");
    obj.checkBox366:setFontSize(8);
    obj.checkBox366:setName("checkBox366");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout141);
    obj.layout174:setAlign("top");
    obj.layout174:setHeight(25);
    obj.layout174:setName("layout174");

    obj.checkBox367 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox367:setParent(obj.layout174);
    obj.checkBox367:setAlign("left");
    obj.checkBox367:setHorzTextAlign("center");
    obj.checkBox367:setWidth(125);
    obj.checkBox367:setField("BloodBeast");
    obj.checkBox367:setText("Blood Of The Beast");
    obj.checkBox367:setFontSize(11);
    obj.checkBox367:setName("checkBox367");

    obj.checkBox368 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox368:setParent(obj.layout174);
    obj.checkBox368:setAlign("left");
    obj.checkBox368:setHorzTextAlign("center");
    obj.checkBox368:setWidth(125);
    obj.checkBox368:setField("Villain");
    obj.checkBox368:setText("Villain Codex");
    obj.checkBox368:setName("checkBox368");

    obj.checkBox369 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox369:setParent(obj.layout174);
    obj.checkBox369:setAlign("left");
    obj.checkBox369:setHorzTextAlign("center");
    obj.checkBox369:setWidth(125);
    obj.checkBox369:setField("Righteous");
    obj.checkBox369:setText("Paths Of The Righteous");
    obj.checkBox369:setFontSize(9);
    obj.checkBox369:setName("checkBox369");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout141);
    obj.layout175:setAlign("top");
    obj.layout175:setHeight(25);
    obj.layout175:setName("layout175");

    obj.checkBox370 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox370:setParent(obj.layout175);
    obj.checkBox370:setAlign("left");
    obj.checkBox370:setHorzTextAlign("center");
    obj.checkBox370:setWidth(125);
    obj.checkBox370:setField("TheFey");
    obj.checkBox370:setText("First World Realm Of The Fey");
    obj.checkBox370:setFontSize(8);
    obj.checkBox370:setName("checkBox370");

    obj.checkBox371 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox371:setParent(obj.layout175);
    obj.checkBox371:setAlign("left");
    obj.checkBox371:setHorzTextAlign("center");
    obj.checkBox371:setWidth(125);
    obj.checkBox371:setField("Secrets");
    obj.checkBox371:setText("Seekers of Secrets");
    obj.checkBox371:setName("checkBox371");

    obj.checkBox372 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox372:setParent(obj.layout175);
    obj.checkBox372:setAlign("left");
    obj.checkBox372:setHorzTextAlign("center");
    obj.checkBox372:setWidth(125);
    obj.checkBox372:setField("Qadira");
    obj.checkBox372:setText("Qadira Jewel Of The East");
    obj.checkBox372:setFontSize(9);
    obj.checkBox372:setName("checkBox372");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.layout141);
    obj.layout176:setAlign("top");
    obj.layout176:setHeight(25);
    obj.layout176:setName("layout176");

    obj.checkBox373 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox373:setParent(obj.layout176);
    obj.checkBox373:setAlign("left");
    obj.checkBox373:setHorzTextAlign("center");
    obj.checkBox373:setWidth(125);
    obj.checkBox373:setField("Healer");
    obj.checkBox373:setText("Healer's Handbook");
    obj.checkBox373:setName("checkBox373");

    obj.checkBox374 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox374:setParent(obj.layout176);
    obj.checkBox374:setAlign("left");
    obj.checkBox374:setHorzTextAlign("center");
    obj.checkBox374:setWidth(125);
    obj.checkBox374:setField("HighCourt");
    obj.checkBox374:setText("Heroes Of The High Court");
    obj.checkBox374:setFontSize(9);
    obj.checkBox374:setName("checkBox374");

    obj.checkBox375 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox375:setParent(obj.layout176);
    obj.checkBox375:setAlign("left");
    obj.checkBox375:setHorzTextAlign("center");
    obj.checkBox375:setWidth(125);
    obj.checkBox375:setField("Psychic");
    obj.checkBox375:setText("Psychic Anthology");
    obj.checkBox375:setName("checkBox375");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.layout141);
    obj.layout177:setAlign("top");
    obj.layout177:setHeight(25);
    obj.layout177:setName("layout177");

    obj.checkBox376 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox376:setParent(obj.layout177);
    obj.checkBox376:setAlign("left");
    obj.checkBox376:setHorzTextAlign("center");
    obj.checkBox376:setWidth(125);
    obj.checkBox376:setField("MonsterHunter");
    obj.checkBox376:setText("Monster Hunter's HB");
    obj.checkBox376:setFontSize(9);
    obj.checkBox376:setName("checkBox376");

    obj.checkBox377 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox377:setParent(obj.layout177);
    obj.checkBox377:setAlign("left");
    obj.checkBox377:setHorzTextAlign("center");
    obj.checkBox377:setWidth(125);
    obj.checkBox377:setField("Darklands");
    obj.checkBox377:setText("Heroes Of The Darklands");
    obj.checkBox377:setFontSize(9);
    obj.checkBox377:setName("checkBox377");

    obj.checkBox378 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox378:setParent(obj.layout177);
    obj.checkBox378:setAlign("left");
    obj.checkBox378:setHorzTextAlign("center");
    obj.checkBox378:setWidth(125);
    obj.checkBox378:setField("FirstWorld");
    obj.checkBox378:setText("Legacy Of The First World");
    obj.checkBox378:setFontSize(9);
    obj.checkBox378:setName("checkBox378");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.layout141);
    obj.layout178:setAlign("top");
    obj.layout178:setHeight(25);
    obj.layout178:setName("layout178");

    obj.checkBox379 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox379:setParent(obj.layout178);
    obj.checkBox379:setAlign("left");
    obj.checkBox379:setHorzTextAlign("center");
    obj.checkBox379:setWidth(125);
    obj.checkBox379:setField("AdvG");
    obj.checkBox379:setText("Adventurer's Guide");
    obj.checkBox379:setFontSize(11);
    obj.checkBox379:setName("checkBox379");

    obj.checkBox380 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox380:setParent(obj.layout178);
    obj.checkBox380:setAlign("left");
    obj.checkBox380:setHorzTextAlign("center");
    obj.checkBox380:setWidth(125);
    obj.checkBox380:setField("AdvA2");
    obj.checkBox380:setText("Adventurer's Armory 2");
    obj.checkBox380:setFontSize(9);
    obj.checkBox380:setName("checkBox380");

    obj.checkBox381 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox381:setParent(obj.layout178);
    obj.checkBox381:setAlign("left");
    obj.checkBox381:setHorzTextAlign("center");
    obj.checkBox381:setWidth(125);
    obj.checkBox381:setField("Aquatic");
    obj.checkBox381:setText("Aquatic Adventures");
    obj.checkBox381:setName("checkBox381");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.layout141);
    obj.layout179:setAlign("top");
    obj.layout179:setHeight(25);
    obj.layout179:setName("layout179");

    obj.checkBox382 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox382:setParent(obj.layout179);
    obj.checkBox382:setAlign("left");
    obj.checkBox382:setHorzTextAlign("center");
    obj.checkBox382:setWidth(125);
    obj.checkBox382:setField("UltWilderness");
    obj.checkBox382:setText("Ultimate Wilderness");
    obj.checkBox382:setFontSize(11);
    obj.checkBox382:setName("checkBox382");

    obj.checkBox383 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox383:setParent(obj.layout179);
    obj.checkBox383:setAlign("left");
    obj.checkBox383:setHorzTextAlign("center");
    obj.checkBox383:setWidth(125);
    obj.checkBox383:setField("Damned");
    obj.checkBox383:setText("Book of the Damned");
    obj.checkBox383:setFontSize(11);
    obj.checkBox383:setName("checkBox383");

    obj.checkBox384 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox384:setParent(obj.layout179);
    obj.checkBox384:setAlign("left");
    obj.checkBox384:setHorzTextAlign("center");
    obj.checkBox384:setWidth(125);
    obj.checkBox384:setField("Air");
    obj.checkBox384:setText("Sword of Air");
    obj.checkBox384:setName("checkBox384");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.layout141);
    obj.layout180:setAlign("top");
    obj.layout180:setHeight(25);
    obj.layout180:setName("layout180");

    obj.checkBox385 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox385:setParent(obj.layout180);
    obj.checkBox385:setAlign("left");
    obj.checkBox385:setHorzTextAlign("center");
    obj.checkBox385:setWidth(125);
    obj.checkBox385:setField("AP");
    obj.checkBox385:setText("Adventure Path");
    obj.checkBox385:setName("checkBox385");

    obj.checkBox386 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox386:setParent(obj.layout180);
    obj.checkBox386:setAlign("left");
    obj.checkBox386:setHorzTextAlign("center");
    obj.checkBox386:setWidth(125);
    obj.checkBox386:setField("Rappan");
    obj.checkBox386:setText("Rappan Athuk");
    obj.checkBox386:setName("checkBox386");

    obj.checkBox387 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox387:setParent(obj.layout180);
    obj.checkBox387:setAlign("left");
    obj.checkBox387:setHorzTextAlign("center");
    obj.checkBox387:setWidth(125);
    obj.checkBox387:setField("DistantRealms");
    obj.checkBox387:setText("Distant Realms");
    obj.checkBox387:setName("checkBox387");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.layout141);
    obj.layout181:setAlign("top");
    obj.layout181:setHeight(25);
    obj.layout181:setName("layout181");

    obj.checkBox388 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox388:setParent(obj.layout181);
    obj.checkBox388:setAlign("left");
    obj.checkBox388:setHorzTextAlign("center");
    obj.checkBox388:setWidth(125);
    obj.checkBox388:setField("Hopper");
    obj.checkBox388:setText("Plane-Hopper's Handbook");
    obj.checkBox388:setFontSize(9);
    obj.checkBox388:setName("checkBox388");

    obj.checkBox389 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox389:setParent(obj.layout181);
    obj.checkBox389:setAlign("left");
    obj.checkBox389:setHorzTextAlign("center");
    obj.checkBox389:setWidth(125);
    obj.checkBox389:setField("Planar");
    obj.checkBox389:setText("Planar Adventures");
    obj.checkBox389:setName("checkBox389");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.layout141);
    obj.layout182:setAlign("top");
    obj.layout182:setHeight(25);
    obj.layout182:setName("layout182");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout182);
    obj.button47:setAlign("left");
    obj.button47:setHorzTextAlign("center");
    obj.button47:setWidth(187);
    obj.button47:setText("Marque Todas");
    obj.button47:setName("button47");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout182);
    obj.button48:setAlign("left");
    obj.button48:setHorzTextAlign("center");
    obj.button48:setWidth(187);
    obj.button48:setText("Desmarque Todas");
    obj.button48:setName("button48");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.scrollBox4);
    obj.layout183:setAlign("top");
    obj.layout183:setHeight(50);
    obj.layout183:setName("layout183");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.layout183);
    obj.layout184:setAlign("top");
    obj.layout184:setHeight(25);
    obj.layout184:setName("layout184");

    obj.checkBox390 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox390:setParent(obj.layout184);
    obj.checkBox390:setAlign("left");
    obj.checkBox390:setWidth(75);
    obj.checkBox390:setHorzTextAlign("center");
    obj.checkBox390:setText("Editora");
    obj.checkBox390:setField("enablePublisher");
    obj.checkBox390:setMargins({right=75});
    obj.checkBox390:setName("checkBox390");

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.layout183);
    obj.layout185:setAlign("top");
    obj.layout185:setHeight(25);
    obj.layout185:setName("layout185");

    obj.checkBox391 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox391:setParent(obj.layout185);
    obj.checkBox391:setAlign("left");
    obj.checkBox391:setHorzTextAlign("center");
    obj.checkBox391:setWidth(187);
    obj.checkBox391:setField("yesPublisher");
    obj.checkBox391:setText("Paizo");
    obj.checkBox391:setName("checkBox391");

    obj.checkBox392 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox392:setParent(obj.layout185);
    obj.checkBox392:setAlign("left");
    obj.checkBox392:setHorzTextAlign("center");
    obj.checkBox392:setWidth(187);
    obj.checkBox392:setField("noPublisher");
    obj.checkBox392:setText("Outros");
    obj.checkBox392:setName("checkBox392");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.scrollBox4);
    obj.layout186:setAlign("top");
    obj.layout186:setHeight(50);
    obj.layout186:setName("layout186");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.layout186);
    obj.layout187:setAlign("top");
    obj.layout187:setHeight(25);
    obj.layout187:setName("layout187");

    obj.checkBox393 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox393:setParent(obj.layout187);
    obj.checkBox393:setAlign("left");
    obj.checkBox393:setWidth(75);
    obj.checkBox393:setHorzTextAlign("center");
    obj.checkBox393:setText("Mítico");
    obj.checkBox393:setField("enableMythic");
    obj.checkBox393:setMargins({right=75});
    obj.checkBox393:setName("checkBox393");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.layout186);
    obj.layout188:setAlign("top");
    obj.layout188:setHeight(25);
    obj.layout188:setName("layout188");

    obj.checkBox394 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox394:setParent(obj.layout188);
    obj.checkBox394:setAlign("left");
    obj.checkBox394:setHorzTextAlign("center");
    obj.checkBox394:setWidth(187);
    obj.checkBox394:setField("yesMythic");
    obj.checkBox394:setText("Sim");
    obj.checkBox394:setName("checkBox394");

    obj.checkBox395 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox395:setParent(obj.layout188);
    obj.checkBox395:setAlign("left");
    obj.checkBox395:setHorzTextAlign("center");
    obj.checkBox395:setWidth(187);
    obj.checkBox395:setField("noMythic");
    obj.checkBox395:setText("Não");
    obj.checkBox395:setName("checkBox395");

    obj.spellListTabPath = GUI.fromHandle(_obj_newObject("tab"));
    obj.spellListTabPath:setParent(obj.tabControl3);
    obj.spellListTabPath:setTitle("Lista");
    obj.spellListTabPath:setName("spellListTabPath");

    obj.frmSpellsListPath = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSpellsListPath:setParent(obj.spellListTabPath);
    obj.frmSpellsListPath:setName("frmSpellsListPath");
    obj.frmSpellsListPath:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmSpellsListPath);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.spellListPath = GUI.fromHandle(_obj_newObject("recordList"));
    obj.spellListPath:setParent(obj.scrollBox5);
    obj.spellListPath:setAlign("top");
    obj.spellListPath:setHeight(260);
    obj.spellListPath:setField("spellListPath");
    obj.spellListPath:setName("spellListPath");
    obj.spellListPath:setTemplateForm("frmSpellItem");
    obj.spellListPath:setAutoHeight(true);

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.frmSpellsListPath);
    obj.layout189:setAlign("bottom");
    obj.layout189:setHeight(25);
    obj.layout189:setName("layout189");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout189);
    obj.button49:setAlign("left");
    obj.button49:setHorzTextAlign("center");
    obj.button49:setWidth(150);
    obj.button49:setText("Anterior");
    obj.button49:setName("button49");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout189);
    obj.label12:setAlign("left");
    obj.label12:setField("SpellsPagePath");
    obj.label12:setWidth(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout189);
    obj.label13:setAlign("left");
    obj.label13:setText("/");
    obj.label13:setWidth(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout189);
    obj.label14:setAlign("left");
    obj.label14:setField("maxSpellPagesPath");
    obj.label14:setWidth(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout189);
    obj.button50:setAlign("left");
    obj.button50:setHorzTextAlign("center");
    obj.button50:setWidth(150);
    obj.button50:setText("Proximo");
    obj.button50:setName("button50");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Itens Mágicos");
    obj.tab6:setName("tab6");

    obj.tabControl4 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl4:setParent(obj.tab6);
    obj.tabControl4:setAlign("client");
    obj.tabControl4:setName("tabControl4");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl4);
    obj.tab7:setTitle("Geral");
    obj.tab7:setName("tab7");

    obj.frmWondrousItems = GUI.fromHandle(_obj_newObject("form"));
    obj.frmWondrousItems:setParent(obj.tab7);
    obj.frmWondrousItems:setName("frmWondrousItems");
    obj.frmWondrousItems:setAlign("client");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmWondrousItems);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.scrollBox6);
    obj.layout190:setAlign("top");
    obj.layout190:setHeight(50);
    obj.layout190:setName("layout190");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout190);
    obj.button51:setAlign("left");
    obj.button51:setWidth(50);
    obj.button51:setText("+");
    obj.button51:setName("button51");

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.layout190);
    obj.layout191:setAlign("left");
    obj.layout191:setWidth(275);
    obj.layout191:setName("layout191");

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.layout191);
    obj.layout192:setAlign("top");
    obj.layout192:setHeight(25);
    obj.layout192:setName("layout192");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout192);
    obj.label15:setAlign("left");
    obj.label15:setWidth(75);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Preço");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout192);
    obj.label16:setAlign("left");
    obj.label16:setWidth(200);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setField("precoWoundrous");
    lfm_setPropAsString(obj.label16, "formatFloat",  ",0.## PO");
    obj.label16:setName("label16");

    obj.layout193 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.layout191);
    obj.layout193:setAlign("top");
    obj.layout193:setHeight(25);
    obj.layout193:setName("layout193");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout193);
    obj.label17:setAlign("left");
    obj.label17:setWidth(75);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("Custo");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout193);
    obj.label18:setAlign("left");
    obj.label18:setWidth(100);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setField("custoWoundrous");
    lfm_setPropAsString(obj.label18, "formatFloat",  ",0.## PO");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout193);
    obj.label19:setAlign("left");
    obj.label19:setWidth(100);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setField("xpWoundrous");
    lfm_setPropAsString(obj.label19, "formatFloat",  ",0.## XP");
    obj.label19:setName("label19");

    obj.effectList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.effectList:setParent(obj.scrollBox6);
    obj.effectList:setAlign("left");
    obj.effectList:setWidth(395);
    obj.effectList:setField("effectList");
    obj.effectList:setName("effectList");
    obj.effectList:setTemplateForm("frmItemEffect");
    obj.effectList:setMinQt(1);
    obj.effectList:setMargins({right=5});

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox6);
    obj.dataLink2:setFields({'precoWoundrous'});
    obj.dataLink2:setName("dataLink2");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl4);
    obj.tab8:setTitle("Armas");
    obj.tab8:setName("tab8");

    obj.frmWeaponCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmWeaponCalculator:setParent(obj.tab8);
    obj.frmWeaponCalculator:setName("frmWeaponCalculator");
    obj.frmWeaponCalculator:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmWeaponCalculator);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout194 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.scrollBox7);
    obj.layout194:setAlign("top");
    obj.layout194:setHeight(100);
    obj.layout194:setName("layout194");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout194);
    obj.button52:setAlign("left");
    obj.button52:setWidth(50);
    obj.button52:setText("+");
    obj.button52:setName("button52");

    obj.layout195 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.layout194);
    obj.layout195:setAlign("left");
    obj.layout195:setWidth(325);
    obj.layout195:setName("layout195");

    obj.layout196 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.layout195);
    obj.layout196:setAlign("top");
    obj.layout196:setHeight(25);
    obj.layout196:setName("layout196");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout196);
    obj.label20:setAlign("left");
    obj.label20:setWidth(75);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setText("Preço");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout196);
    obj.label21:setAlign("left");
    obj.label21:setWidth(200);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setField("weaponPrice");
    lfm_setPropAsString(obj.label21, "formatFloat",  ",0.## PO");
    obj.label21:setName("label21");

    obj.layout197 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.layout195);
    obj.layout197:setAlign("top");
    obj.layout197:setHeight(25);
    obj.layout197:setName("layout197");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout197);
    obj.label22:setAlign("left");
    obj.label22:setWidth(75);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Custo");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout197);
    obj.label23:setAlign("left");
    obj.label23:setWidth(100);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setField("weaponCost");
    lfm_setPropAsString(obj.label23, "formatFloat",  ",0.## PO");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout197);
    obj.label24:setAlign("left");
    obj.label24:setWidth(100);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setField("weaponXP");
    lfm_setPropAsString(obj.label24, "formatFloat",  ",0.## XP");
    obj.label24:setName("label24");

    obj.layout198 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.layout195);
    obj.layout198:setAlign("top");
    obj.layout198:setHeight(25);
    obj.layout198:setName("layout198");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout198);
    obj.label25:setAlign("left");
    obj.label25:setWidth(60);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Valor");
    obj.label25:setName("label25");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout198);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(100);
    obj.edit3:setField("weaponValue");
    obj.edit3:setType("float");
    obj.edit3:setName("edit3");

    obj.layout199 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.layout195);
    obj.layout199:setAlign("top");
    obj.layout199:setHeight(25);
    obj.layout199:setName("layout199");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout199);
    obj.label26:setAlign("left");
    obj.label26:setWidth(60);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setText("Material");
    obj.label26:setName("label26");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout199);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(100);
    obj.edit4:setField("weaponMaterial");
    obj.edit4:setType("float");
    obj.edit4:setName("edit4");

    obj.checkBox396 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox396:setParent(obj.layout199);
    obj.checkBox396:setAlign("left");
    obj.checkBox396:setWidth(100);
    obj.checkBox396:setHorzTextAlign("center");
    obj.checkBox396:setText("Obra-Prima");
    obj.checkBox396:setField("weaponOP");
    obj.checkBox396:setMargins({left=10});
    obj.checkBox396:setName("checkBox396");

    obj.weaponList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.weaponList:setParent(obj.scrollBox7);
    obj.weaponList:setAlign("left");
    obj.weaponList:setWidth(395);
    obj.weaponList:setField("weaponList");
    obj.weaponList:setName("weaponList");
    obj.weaponList:setTemplateForm("frmWeaponItem");
    obj.weaponList:setMinQt(1);
    obj.weaponList:setMargins({right=5});

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox7);
    obj.dataLink3:setFields({'weaponValue','weaponMaterial','weaponBonus','weaponExtraPrice','weaponOP'});
    obj.dataLink3:setName("dataLink3");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl4);
    obj.tab9:setTitle("Armaduras");
    obj.tab9:setName("tab9");

    obj.frmArmorCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmArmorCalculator:setParent(obj.tab9);
    obj.frmArmorCalculator:setName("frmArmorCalculator");
    obj.frmArmorCalculator:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmArmorCalculator);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout200 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.scrollBox8);
    obj.layout200:setAlign("top");
    obj.layout200:setHeight(100);
    obj.layout200:setName("layout200");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout200);
    obj.button53:setAlign("left");
    obj.button53:setWidth(50);
    obj.button53:setText("+");
    obj.button53:setName("button53");

    obj.layout201 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.layout200);
    obj.layout201:setAlign("left");
    obj.layout201:setWidth(325);
    obj.layout201:setName("layout201");

    obj.layout202 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.layout201);
    obj.layout202:setAlign("top");
    obj.layout202:setHeight(25);
    obj.layout202:setName("layout202");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout202);
    obj.label27:setAlign("left");
    obj.label27:setWidth(75);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setText("Preço");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout202);
    obj.label28:setAlign("left");
    obj.label28:setWidth(200);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("armorPrice");
    lfm_setPropAsString(obj.label28, "formatFloat",  ",0.## PO");
    obj.label28:setName("label28");

    obj.layout203 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.layout201);
    obj.layout203:setAlign("top");
    obj.layout203:setHeight(25);
    obj.layout203:setName("layout203");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout203);
    obj.label29:setAlign("left");
    obj.label29:setWidth(75);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("Custo");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout203);
    obj.label30:setAlign("left");
    obj.label30:setWidth(100);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("armorCost");
    lfm_setPropAsString(obj.label30, "formatFloat",  ",0.## PO");
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout203);
    obj.label31:setAlign("left");
    obj.label31:setWidth(100);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setField("armorXP");
    lfm_setPropAsString(obj.label31, "formatFloat",  ",0.## XP");
    obj.label31:setName("label31");

    obj.layout204 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.layout201);
    obj.layout204:setAlign("top");
    obj.layout204:setHeight(25);
    obj.layout204:setName("layout204");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout204);
    obj.label32:setAlign("left");
    obj.label32:setWidth(60);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setText("Valor");
    obj.label32:setName("label32");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout204);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(100);
    obj.edit5:setField("armorValue");
    obj.edit5:setType("float");
    obj.edit5:setName("edit5");

    obj.layout205 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.layout201);
    obj.layout205:setAlign("top");
    obj.layout205:setHeight(25);
    obj.layout205:setName("layout205");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout205);
    obj.label33:setAlign("left");
    obj.label33:setWidth(60);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setText("Material");
    obj.label33:setName("label33");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout205);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(100);
    obj.edit6:setField("armorMaterial");
    obj.edit6:setType("float");
    obj.edit6:setName("edit6");

    obj.checkBox397 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox397:setParent(obj.layout205);
    obj.checkBox397:setAlign("left");
    obj.checkBox397:setWidth(100);
    obj.checkBox397:setHorzTextAlign("center");
    obj.checkBox397:setText("Obra-Prima");
    obj.checkBox397:setField("armorOP");
    obj.checkBox397:setMargins({left=10});
    obj.checkBox397:setName("checkBox397");

    obj.armorList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.armorList:setParent(obj.scrollBox8);
    obj.armorList:setAlign("left");
    obj.armorList:setWidth(395);
    obj.armorList:setField("armorList");
    obj.armorList:setName("armorList");
    obj.armorList:setTemplateForm("frmArmorItem");
    obj.armorList:setMinQt(1);
    obj.armorList:setMargins({right=5});

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.scrollBox8);
    obj.dataLink4:setFields({'armorValue','armorMaterial','armorBonus','armorExtraPrice','armorOP'});
    obj.dataLink4:setName("dataLink4");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl4);
    obj.tab10:setTitle("Consumiveis");
    obj.tab10:setName("tab10");

    obj.frmConsumableCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmConsumableCalculator:setParent(obj.tab10);
    obj.frmConsumableCalculator:setName("frmConsumableCalculator");
    obj.frmConsumableCalculator:setAlign("client");

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmConsumableCalculator);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.layout206 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.scrollBox9);
    obj.layout206:setAlign("top");
    obj.layout206:setHeight(200);
    obj.layout206:setName("layout206");

    obj.layout207 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.layout206);
    obj.layout207:setAlign("top");
    obj.layout207:setHeight(25);
    obj.layout207:setName("layout207");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout207);
    obj.label34:setAlign("left");
    obj.label34:setWidth(75);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setText("Pergaminho");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout207);
    obj.label35:setAlign("left");
    obj.label35:setWidth(200);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setField("scrollPrice");
    lfm_setPropAsString(obj.label35, "formatFloat",  ",0.## PO");
    obj.label35:setName("label35");

    obj.layout208 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.layout206);
    obj.layout208:setAlign("top");
    obj.layout208:setHeight(25);
    obj.layout208:setName("layout208");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout208);
    obj.label36:setAlign("left");
    obj.label36:setWidth(75);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setText("Custo");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout208);
    obj.label37:setAlign("left");
    obj.label37:setWidth(100);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setField("scrollCost");
    lfm_setPropAsString(obj.label37, "formatFloat",  ",0.## PO");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout208);
    obj.label38:setAlign("left");
    obj.label38:setWidth(100);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setField("scrollXP");
    lfm_setPropAsString(obj.label38, "formatFloat",  ",0.## XP");
    obj.label38:setName("label38");

    obj.layout209 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.layout206);
    obj.layout209:setAlign("top");
    obj.layout209:setHeight(25);
    obj.layout209:setName("layout209");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout209);
    obj.label39:setAlign("left");
    obj.label39:setWidth(75);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setText("Poção");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout209);
    obj.label40:setAlign("left");
    obj.label40:setWidth(200);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setField("potionPrice");
    lfm_setPropAsString(obj.label40, "formatFloat",  ",0.## PO");
    obj.label40:setName("label40");

    obj.layout210 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.layout206);
    obj.layout210:setAlign("top");
    obj.layout210:setHeight(25);
    obj.layout210:setName("layout210");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout210);
    obj.label41:setAlign("left");
    obj.label41:setWidth(75);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setText("Custo");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout210);
    obj.label42:setAlign("left");
    obj.label42:setWidth(100);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setField("potionCost");
    lfm_setPropAsString(obj.label42, "formatFloat",  ",0.## PO");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout210);
    obj.label43:setAlign("left");
    obj.label43:setWidth(100);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setField("potionXP");
    lfm_setPropAsString(obj.label43, "formatFloat",  ",0.## XP");
    obj.label43:setName("label43");

    obj.layout211 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.layout206);
    obj.layout211:setAlign("top");
    obj.layout211:setHeight(25);
    obj.layout211:setName("layout211");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout211);
    obj.label44:setAlign("left");
    obj.label44:setWidth(75);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setText("Varinha");
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout211);
    obj.label45:setAlign("left");
    obj.label45:setWidth(200);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setField("wandPrice");
    lfm_setPropAsString(obj.label45, "formatFloat",  ",0.## PO");
    obj.label45:setName("label45");

    obj.layout212 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.layout206);
    obj.layout212:setAlign("top");
    obj.layout212:setHeight(25);
    obj.layout212:setName("layout212");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout212);
    obj.label46:setAlign("left");
    obj.label46:setWidth(75);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setText("Custo");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout212);
    obj.label47:setAlign("left");
    obj.label47:setWidth(100);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setField("wandCost");
    lfm_setPropAsString(obj.label47, "formatFloat",  ",0.## PO");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout212);
    obj.label48:setAlign("left");
    obj.label48:setWidth(100);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setField("wandXP");
    lfm_setPropAsString(obj.label48, "formatFloat",  ",0.## XP");
    obj.label48:setName("label48");

    obj.layout213 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.layout206);
    obj.layout213:setAlign("top");
    obj.layout213:setHeight(25);
    obj.layout213:setName("layout213");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout213);
    obj.label49:setAlign("left");
    obj.label49:setWidth(75);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setText("Nivel");
    obj.label49:setName("label49");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout213);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(50);
    obj.edit7:setField("consumableNivel");
    obj.edit7:setType("float");
    obj.edit7:setName("edit7");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout213);
    obj.label50:setAlign("left");
    obj.label50:setWidth(75);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("NC");
    obj.label50:setName("label50");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout213);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(50);
    obj.edit8:setField("consumableNC");
    obj.edit8:setType("float");
    obj.edit8:setName("edit8");

    obj.layout214 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.layout206);
    obj.layout214:setAlign("top");
    obj.layout214:setHeight(25);
    obj.layout214:setName("layout214");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout214);
    obj.label51:setAlign("left");
    obj.label51:setWidth(75);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setText("Material");
    obj.label51:setName("label51");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout214);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(50);
    obj.edit9:setField("consumableMaterial");
    obj.edit9:setType("float");
    obj.edit9:setName("edit9");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout214);
    obj.label52:setAlign("left");
    obj.label52:setWidth(75);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("XP");
    obj.label52:setName("label52");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout214);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(50);
    obj.edit10:setField("consumableXP");
    obj.edit10:setType("float");
    obj.edit10:setName("edit10");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.scrollBox9);
    obj.dataLink5:setFields({'consumableNivel','consumableNC','consumableMaterial','consumableXP'});
    obj.dataLink5:setName("dataLink5");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl4);
    obj.tab11:setTitle("Cajado");
    obj.tab11:setName("tab11");

    obj.frmStaffCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmStaffCalculator:setParent(obj.tab11);
    obj.frmStaffCalculator:setName("frmStaffCalculator");
    obj.frmStaffCalculator:setAlign("client");

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmStaffCalculator);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.layout215 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.scrollBox10);
    obj.layout215:setAlign("top");
    obj.layout215:setHeight(50);
    obj.layout215:setName("layout215");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout215);
    obj.button54:setAlign("left");
    obj.button54:setWidth(50);
    obj.button54:setText("+");
    obj.button54:setName("button54");

    obj.layout216 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.layout215);
    obj.layout216:setAlign("left");
    obj.layout216:setWidth(275);
    obj.layout216:setName("layout216");

    obj.layout217 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.layout216);
    obj.layout217:setAlign("top");
    obj.layout217:setHeight(25);
    obj.layout217:setName("layout217");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout217);
    obj.label53:setAlign("left");
    obj.label53:setWidth(75);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("Preço");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout217);
    obj.label54:setAlign("left");
    obj.label54:setWidth(200);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setField("staffPrice");
    lfm_setPropAsString(obj.label54, "formatFloat",  ",0.## PO");
    obj.label54:setName("label54");

    obj.layout218 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.layout216);
    obj.layout218:setAlign("top");
    obj.layout218:setHeight(25);
    obj.layout218:setName("layout218");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout218);
    obj.label55:setAlign("left");
    obj.label55:setWidth(75);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("Custo");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout218);
    obj.label56:setAlign("left");
    obj.label56:setWidth(100);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setField("staffCost");
    lfm_setPropAsString(obj.label56, "formatFloat",  ",0.## PO");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout218);
    obj.label57:setAlign("left");
    obj.label57:setWidth(100);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setField("staffXP");
    lfm_setPropAsString(obj.label57, "formatFloat",  ",0.## XP");
    obj.label57:setName("label57");

    obj.staffList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.staffList:setParent(obj.scrollBox10);
    obj.staffList:setAlign("left");
    obj.staffList:setWidth(395);
    obj.staffList:setField("staffList");
    obj.staffList:setName("staffList");
    obj.staffList:setTemplateForm("frmStaffItem");
    obj.staffList:setMinQt(1);
    obj.staffList:setMargins({right=5});

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.scrollBox10);
    obj.dataLink6:setFields({'sortStaff'});
    obj.dataLink6:setName("dataLink6");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl4);
    obj.tab12:setTitle("Cetro");
    obj.tab12:setName("tab12");

    obj.frmScepterCalculator = GUI.fromHandle(_obj_newObject("form"));
    obj.frmScepterCalculator:setParent(obj.tab12);
    obj.frmScepterCalculator:setName("frmScepterCalculator");
    obj.frmScepterCalculator:setAlign("client");

    obj.scrollBox11 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.frmScepterCalculator);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.layout219 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.scrollBox11);
    obj.layout219:setAlign("top");
    obj.layout219:setHeight(50);
    obj.layout219:setName("layout219");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout219);
    obj.button55:setAlign("left");
    obj.button55:setWidth(50);
    obj.button55:setText("+");
    obj.button55:setName("button55");

    obj.layout220 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.layout219);
    obj.layout220:setAlign("left");
    obj.layout220:setWidth(275);
    obj.layout220:setName("layout220");

    obj.layout221 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.layout220);
    obj.layout221:setAlign("top");
    obj.layout221:setHeight(25);
    obj.layout221:setName("layout221");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout221);
    obj.label58:setAlign("left");
    obj.label58:setWidth(75);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("Preço");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout221);
    obj.label59:setAlign("left");
    obj.label59:setWidth(200);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("scepterPrice");
    lfm_setPropAsString(obj.label59, "formatFloat",  ",0.## PO");
    obj.label59:setName("label59");

    obj.layout222 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.layout220);
    obj.layout222:setAlign("top");
    obj.layout222:setHeight(25);
    obj.layout222:setName("layout222");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout222);
    obj.label60:setAlign("left");
    obj.label60:setWidth(75);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setText("Custo");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout222);
    obj.label61:setAlign("left");
    obj.label61:setWidth(100);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setField("scepterCost");
    lfm_setPropAsString(obj.label61, "formatFloat",  ",0.## PO");
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout222);
    obj.label62:setAlign("left");
    obj.label62:setWidth(100);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setField("scepterXP");
    lfm_setPropAsString(obj.label62, "formatFloat",  ",0.## XP");
    obj.label62:setName("label62");

    obj.scepterList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.scepterList:setParent(obj.scrollBox11);
    obj.scepterList:setAlign("left");
    obj.scepterList:setWidth(395);
    obj.scepterList:setField("scepterList");
    obj.scepterList:setName("scepterList");
    obj.scepterList:setTemplateForm("frmScepterItem");
    obj.scepterList:setMinQt(1);
    obj.scepterList:setMargins({right=5});

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.scrollBox11);
    obj.dataLink7:setFields({'sortScepter'});
    obj.dataLink7:setName("dataLink7");

    obj.tab13 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl1);
    obj.tab13:setTitle("Creditos");
    obj.tab13:setName("tab13");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab13);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox12 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox12:setParent(obj.frmTemplateCreditos);
    obj.scrollBox12:setAlign("client");
    obj.scrollBox12:setName("scrollBox12");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox12);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.scrollBox12);
    obj.label63:setLeft(5);
    obj.label63:setTop(10);
    obj.label63:setWidth(200);
    obj.label63:setHeight(20);
    obj.label63:setText("Feito por: Vinny (Ambesek)");
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.scrollBox12);
    obj.label64:setLeft(5);
    obj.label64:setTop(35);
    obj.label64:setWidth(200);
    obj.label64:setHeight(20);
    obj.label64:setText("Versão Atual: ");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setField("versionInstalled");
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.scrollBox12);
    obj.label65:setLeft(5);
    obj.label65:setTop(60);
    obj.label65:setWidth(200);
    obj.label65:setHeight(20);
    obj.label65:setText("Sua Versão: ");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setField("versionDownloaded");
    obj.label65:setName("label65");

    obj.checkBox398 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox398:setParent(obj.scrollBox12);
    obj.checkBox398:setLeft(5);
    obj.checkBox398:setTop(85);
    obj.checkBox398:setWidth(200);
    obj.checkBox398:setHeight(20);
    obj.checkBox398:setField("noUpdate");
    obj.checkBox398:setText("Não pedir para atualizar.");
    obj.checkBox398:setName("checkBox398");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.scrollBox12);
    obj.button56:setLeft(5);
    obj.button56:setTop(110);
    obj.button56:setWidth(100);
    obj.button56:setText("Change Log");
    obj.button56:setName("button56");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.scrollBox12);
    obj.button57:setLeft(5);
    obj.button57:setTop(135);
    obj.button57:setWidth(100);
    obj.button57:setText("Atualizar");
    obj.button57:setName("button57");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.scrollBox12);
    obj.label66:setLeft(5);
    obj.label66:setTop(160);
    obj.label66:setWidth(200);
    obj.label66:setHeight(20);
    obj.label66:setText("Conheça a Mesa:");
    obj.label66:setName("label66");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.scrollBox12);
    obj.button58:setLeft(5);
    obj.button58:setTop(185);
    obj.button58:setWidth(100);
    obj.button58:setText("RPGmeister");
    obj.button58:setName("button58");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            -- Carrega o local sheet para ser usado. 
            		toolSheet = NDB.load("config.xml");
            
            		self.scope:setNodeObject(toolSheet);
            
            		--local json = VHD.openFile("spellsPathfinder.json");
            		--local file = {};
            		--json:read(file, json.remainingBytes);
            		--local str = Utils.binaryDecode(file, "utf8");
            
            		--local magicListDataPath = NDB.load("magicListDataPath.xml");
            		--magicListDataPath.db = decode(str);
            
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
            if self.scope.node==nil then return end;
            				toolSheet.filteredSpellsPath = {};
            				local index = 0;
            
            				-- Filtre as magias
            				for k,v in pairs(magicListDataPath.db) do
            					local spell = magicListDataPath.db[k];
            
            					if toolSheet.enableName then
            						local isName = filterName(spell);
            						if not isName then 
            							--write(spell.name .. " falhou no filtro de isName");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableClasses then
            						local isClass = filterClassPath(spell);
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
            						local isTag = filterTagPath(spell);
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
            						local isBook = filterBookPath(spell);
            						if not isBook then 
            							--write(spell.name .. " falhou no filtro de isBook");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enablePublisher then
            						local isPublisher = filterPublisherPath(spell);
            						if not isPublisher then 
            							--write(spell.name .. " falhou no filtro de isPublisher");
            							goto nextspell 
            						end;
            					end;
            
            					if toolSheet.enableMythic then
            						local isMythic = filterMythicPath(spell);
            						if not isMythic then 
            							--write(spell.name .. " falhou no filtro de isMythic");
            							goto nextspell 
            						end;
            					end;
            
            
            					index = index +1;
            					toolSheet.filteredSpellsPath[index] = spell;
            					::nextspell::
            				end
            
            				--write(index);
            
            				-- Salve a quantidade de magias filtradas e de paginas
            				toolSheet.numSpellsPath = index;
            				toolSheet.maxSpellPagesPath = math.ceil(index/50);	
            
            				-- Delete o que ta no rcl atual
            		        local toDelete = NDB.getChildNodes(toolSheet.spellListPath); 
            		        for i=1, #toDelete, 1 do
            		            NDB.deleteNode(toDelete[i]);
            		        end;
            
            		        -- Preencha o rcl com até as primeiras 50 magias
            		        local limit = math.min(index, 50);
            				for i=1, limit, 1 do
            					local spell = self.spellListPath:append();
            
            					if toolSheet.filteredSpellsPath[i].description then 
            						spell.description = toolSheet.filteredSpellsPath[i].description;
            					end;
            
            					spell.name = toolSheet.filteredSpellsPath[i].name;
            					local nome = tryLang(toolSheet.filteredSpellsPath[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(toolSheet.filteredSpellsPath[i].school);
            					spell.subschool = trans(toolSheet.filteredSpellsPath[i].subschool);
            					spell.url = toolSheet.filteredSpellsPath[i].url;
            					spell.level = classToText(toolSheet.filteredSpellsPath[i].level);
            					if toolSheet.filteredSpellsPath[i].domain then
            						spell.level = spell.level .. ", ".. toolSheet.filteredSpellsPath[i].domain;
            					end;
            					spell.descriptor = "Descritores: " .. arrayToText(toolSheet.filteredSpellsPath[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(toolSheet.filteredSpellsPath[i].components, #components);
            					spell.range = "Alcance: " .. trans(toolSheet.filteredSpellsPath[i].range);
            					spell.duration = "Duração: " .. arrayToText(toolSheet.filteredSpellsPath[i].duration, #durations);
            					--spell.aiming = "Alvo: " .. arrayToText(toolSheet.filteredSpellsPath[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(toolSheet.filteredSpellsPath[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(toolSheet.filteredSpellsPath[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(toolSheet.filteredSpellsPath[i].book, #books);
            					spell.paizo = "Paizo: " .. boolToText(toolSheet.filteredSpellsPath[i].paizo=="1");
            					spell.mythic = "Mythic: " .. boolToText(toolSheet.filteredSpellsPath[i].mythic=="1");
            				end;
            				self.spellListPath:sort();
            				toolSheet.SpellsPagePath = 1;
            
            				self.spellListTabPath:setFocus();
        end, obj);

    obj._e_event34 = obj.button29:addEventListener("onClick",
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
            						self.scope.node.alchemist = true;
            						self.scope.node.antipaladin = true;
            						self.scope.node.summoner = true;
            						self.scope.node.witch = true;
            						self.scope.node.inquisitor = true;
            						self.scope.node.oracle = true;
            						self.scope.node.domain = true;
            						self.scope.node.magus = true;
            						self.scope.node.oracle = true;
            						self.scope.node.bloodrager = true;
            						self.scope.node.shaman = true;
            						self.scope.node.psychic = true;
            						self.scope.node.medium = true;
            						self.scope.node.mesmerist = true;
            						self.scope.node.occultist = true;
            						self.scope.node.spiritualist = true;
            						self.scope.node.skald = true;
            						self.scope.node.investigator = true;
            						self.scope.node.hunter = true;
            						self.scope.node.summoner_unchained = true;
        end, obj);

    obj._e_event35 = obj.button30:addEventListener("onClick",
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
            						self.scope.node.domain = false;
            						self.scope.node.alchemist = false;
            						self.scope.node.antipaladin = false;
            						self.scope.node.summoner = false;
            						self.scope.node.witch = false;
            						self.scope.node.inquisitor = false;
            						self.scope.node.oracle = false;
            						self.scope.node.magus = false;
            						self.scope.node.oracle = false;
            						self.scope.node.bloodrager = false;
            						self.scope.node.shaman = false;
            						self.scope.node.psychic = false;
            						self.scope.node.medium = false;
            						self.scope.node.mesmerist = false;
            						self.scope.node.occultist = false;
            						self.scope.node.spiritualist = false;
            						self.scope.node.skald = false;
            						self.scope.node.investigator = false;
            						self.scope.node.hunter = false;
            						self.scope.node.summoner_unchained = false;
        end, obj);

    obj._e_event36 = obj.button31:addEventListener("onClick",
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

    obj._e_event37 = obj.button32:addEventListener("onClick",
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

    obj._e_event38 = obj.button33:addEventListener("onClick",
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

    obj._e_event39 = obj.button34:addEventListener("onClick",
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

    obj._e_event40 = obj.button35:addEventListener("onClick",
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
            						self.scope.node.curse = true;
            						self.scope.node.draconic = true;
            						self.scope.node.emotion = true;
            						self.scope.node.meditative = true;
            						self.scope.node.pain = true;
            						self.scope.node.poison = true;
            						self.scope.node.ruse = true;
        end, obj);

    obj._e_event41 = obj.button36:addEventListener("onClick",
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
            						self.scope.node.curse = false;
            						self.scope.node.draconic = false;
            						self.scope.node.emotion = false;
            						self.scope.node.meditative = false;
            						self.scope.node.pain = false;
            						self.scope.node.poison = false;
            						self.scope.node.ruse = false;
        end, obj);

    obj._e_event42 = obj.button37:addEventListener("onClick",
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

    obj._e_event43 = obj.button38:addEventListener("onClick",
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

    obj._e_event44 = obj.button39:addEventListener("onClick",
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

    obj._e_event45 = obj.button40:addEventListener("onClick",
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

    obj._e_event46 = obj.button41:addEventListener("onClick",
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

    obj._e_event47 = obj.button42:addEventListener("onClick",
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

    obj._e_event48 = obj.button43:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.fortitude = true;
            						self.scope.node.reflex = true;
            						self.scope.node.will = true;
            						self.scope.node.none = true;
            						self.scope.node.specialTR = true;
        end, obj);

    obj._e_event49 = obj.button44:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.fortitude = false;
            						self.scope.node.reflex = false;
            						self.scope.node.will = false;
            						self.scope.node.none = false;
            						self.scope.node.specialTR = false;
        end, obj);

    obj._e_event50 = obj.button45:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.yes = true;
            						self.scope.node.no = true;
        end, obj);

    obj._e_event51 = obj.button46:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						self.scope.node.yes = false;
            						self.scope.node.no = false;
        end, obj);

    obj._e_event52 = obj.button47:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						for i = 1, #booksPath, 1 do
            							self.scope.node[booksPath[i]] = true;
            						end;
        end, obj);

    obj._e_event53 = obj.button48:addEventListener("onClick",
        function (_)
            if self.scope.node==nil then return end;
            						for i = 1, #booksPath, 1 do
            							self.scope.node[booksPath[i]] = false;
            						end;
        end, obj);

    obj._e_event54 = obj.spellListPath:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.name, nodeB.name);
        end, obj);

    obj._e_event55 = obj.button49:addEventListener("onClick",
        function (_)
            -- Verifica se ta na primeira pagina
            				if self.scope.node==nil then return end;
            				if toolSheet.SpellsPagePath==nil then return end;
            
            				if toolSheet.SpellsPagePath==1 then return end;
            
            				-- Apaga pagina atual
            				local toDelete = NDB.getChildNodes(toolSheet.spellListPath); 
            			    for i=1, #toDelete, 1 do
            			        NDB.deleteNode(toDelete[i]);
            			    end;
            
            				-- Passa para a pagina anterior
            				toolSheet.SpellsPagePath = toolSheet.SpellsPagePath - 1;
            
            				local first = ((toolSheet.SpellsPagePath-1)*50)+1;
            				local last = math.min(toolSheet.SpellsPagePath*50, toolSheet.numSpellsPath);
            
            				for i=first, last, 1 do
            					local spell = self.spellListPath:append();
            
            					if toolSheet.filteredSpellsPath[i].description then 
            						spell.description = toolSheet.filteredSpellsPath[i].description;
            					end;
            
            					spell.name = toolSheet.filteredSpellsPath[i].name;
            					local nome = tryLang(toolSheet.filteredSpellsPath[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(toolSheet.filteredSpellsPath[i].school);
            					spell.subschool = trans(toolSheet.filteredSpellsPath[i].subschool);
            					spell.url = toolSheet.filteredSpellsPath[i].url;
            					spell.level = classToText(toolSheet.filteredSpellsPath[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(toolSheet.filteredSpellsPath[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(toolSheet.filteredSpellsPath[i].components, #components);
            					spell.range = "Alcance: " .. trans(toolSheet.filteredSpellsPath[i].range);
            					spell.duration = "Duração: " .. arrayToText(toolSheet.filteredSpellsPath[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(toolSheet.filteredSpellsPath[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(toolSheet.filteredSpellsPath[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(toolSheet.filteredSpellsPath[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(toolSheet.filteredSpellsPath[i].book, #books);
            				end;
            				self.spellListPath:sort();
        end, obj);

    obj._e_event56 = obj.button50:addEventListener("onClick",
        function (_)
            -- Verifica se ta na ultima pagina
            				if self.scope.node==nil then return end;
            				if toolSheet.SpellsPagePath==nil then return end;
            
            				if toolSheet.SpellsPagePath>=toolSheet.maxSpellPagesPath then return end;
            
            				-- Apaga pagina atual
            				local toDelete = NDB.getChildNodes(toolSheet.spellListPath); 
            			    for i=1, #toDelete, 1 do
            			        NDB.deleteNode(toDelete[i]);
            			    end;
            
            				-- Passa para a proxima pagina
            				toolSheet.SpellsPagePath = toolSheet.SpellsPagePath + 1;
            
            				local first = ((toolSheet.SpellsPagePath-1)*50)+1;
            				local last = math.min(toolSheet.SpellsPagePath*50, toolSheet.numSpellsPath);
            
            				for i=first, last, 1 do
            					local spell = self.spellListPath:append();
            
            					if toolSheet.filteredSpellsPath[i].description then 
            						spell.description = toolSheet.filteredSpellsPath[i].description;
            					end;
            					
            					spell.name = toolSheet.filteredSpellsPath[i].name;
            					local nome = tryLang(toolSheet.filteredSpellsPath[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(toolSheet.filteredSpellsPath[i].school);
            					spell.subschool = trans(toolSheet.filteredSpellsPath[i].subschool);
            					spell.url = toolSheet.filteredSpellsPath[i].url;
            					spell.level = classToText(toolSheet.filteredSpellsPath[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(toolSheet.filteredSpellsPath[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(toolSheet.filteredSpellsPath[i].components, #components);
            					spell.range = "Alcance: " .. trans(toolSheet.filteredSpellsPath[i].range);
            					spell.duration = "Duração: " .. arrayToText(toolSheet.filteredSpellsPath[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(toolSheet.filteredSpellsPath[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(toolSheet.filteredSpellsPath[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(toolSheet.filteredSpellsPath[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(toolSheet.filteredSpellsPath[i].book, #books);
            				end;
            				self.spellListPath:sort();
            
            				-- Atualiza o tamanho do rcl
            				local spells = NDB.getChildNodes(toolSheet.spellListPath); 
                    		self.spellListPath.height = #spells * 101;
        end, obj);

    obj._e_event57 = obj.button51:addEventListener("onClick",
        function (_)
            self.effectList:append();
        end, obj);

    obj._e_event58 = obj.effectList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.price) or 0) - (tonumber(nodeA.price) or 0);
        end, obj);

    obj._e_event59 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
        end, obj);

    obj._e_event60 = obj.button52:addEventListener("onClick",
        function (_)
            self.weaponList:append();
        end, obj);

    obj._e_event61 = obj.weaponList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.price) or 0) - (tonumber(nodeA.price) or 0);
        end, obj);

    obj._e_event62 = obj.dataLink3:addEventListener("onChange",
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

    obj._e_event63 = obj.button53:addEventListener("onClick",
        function (_)
            self.armorList:append();
        end, obj);

    obj._e_event64 = obj.armorList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeB.price) or 0) - (tonumber(nodeA.price) or 0);
        end, obj);

    obj._e_event65 = obj.dataLink4:addEventListener("onChange",
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

    obj._e_event66 = obj.dataLink5:addEventListener("onChange",
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

    obj._e_event67 = obj.button54:addEventListener("onClick",
        function (_)
            self.staffList:append();
        end, obj);

    obj._e_event68 = obj.staffList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeA.order) or 0) - (tonumber(nodeB.order) or 0);
        end, obj);

    obj._e_event69 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if toolSheet==nil then return end;
            				if toolSheet.sortStaff ~= 1 then return end;
            				toolSheet.sortStaff = 0;
            				self.staffList:sort();
        end, obj);

    obj._e_event70 = obj.button55:addEventListener("onClick",
        function (_)
            self.scepterList:append();
        end, obj);

    obj._e_event71 = obj.scepterList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return (tonumber(nodeA.order) or 0) - (tonumber(nodeB.order) or 0);
        end, obj);

    obj._e_event72 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if toolSheet==nil then return end;
            				if toolSheet.sortScepter ~= 1 then return end;
            				toolSheet.sortScepter = 0;
            				self.scepterList:sort();
        end, obj);

    obj._e_event73 = obj.button56:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/README.md')
        end, obj);

    obj._e_event74 = obj.button56:addEventListener("onClick",
        function (_)
            local install = Firecast.Plugins.installPlugin(rawget(toolSheet,"stream"), true);
                            if install==false then
                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/output/Ferramentas%20d20.rpk?raw=true');
                            end;
        end, obj);

    obj._e_event75 = obj.button57:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/Ferramentas%20d20/output/Ferramentas%20d20.rpk?raw=true')
        end, obj);

    obj._e_event76 = obj.button58:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.checkBox285 ~= nil then self.checkBox285:destroy(); self.checkBox285 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox304 ~= nil then self.checkBox304:destroy(); self.checkBox304 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.checkBox317 ~= nil then self.checkBox317:destroy(); self.checkBox317 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.checkBox180 ~= nil then self.checkBox180:destroy(); self.checkBox180 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.checkBox135 ~= nil then self.checkBox135:destroy(); self.checkBox135 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.checkBox306 ~= nil then self.checkBox306:destroy(); self.checkBox306 = nil; end;
        if self.checkBox378 ~= nil then self.checkBox378:destroy(); self.checkBox378 = nil; end;
        if self.frmConsumableCalculator ~= nil then self.frmConsumableCalculator:destroy(); self.frmConsumableCalculator = nil; end;
        if self.checkBox251 ~= nil then self.checkBox251:destroy(); self.checkBox251 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.checkBox360 ~= nil then self.checkBox360:destroy(); self.checkBox360 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.checkBox177 ~= nil then self.checkBox177:destroy(); self.checkBox177 = nil; end;
        if self.checkBox347 ~= nil then self.checkBox347:destroy(); self.checkBox347 = nil; end;
        if self.playersList ~= nil then self.playersList:destroy(); self.playersList = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.frmSpellsList ~= nil then self.frmSpellsList:destroy(); self.frmSpellsList = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.checkBox329 ~= nil then self.checkBox329:destroy(); self.checkBox329 = nil; end;
        if self.checkBox391 ~= nil then self.checkBox391:destroy(); self.checkBox391 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.checkBox167 ~= nil then self.checkBox167:destroy(); self.checkBox167 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.checkBox350 ~= nil then self.checkBox350:destroy(); self.checkBox350 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.checkBox359 ~= nil then self.checkBox359:destroy(); self.checkBox359 = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.checkBox204 ~= nil then self.checkBox204:destroy(); self.checkBox204 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.checkBox197 ~= nil then self.checkBox197:destroy(); self.checkBox197 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.checkBox333 ~= nil then self.checkBox333:destroy(); self.checkBox333 = nil; end;
        if self.staffList ~= nil then self.staffList:destroy(); self.staffList = nil; end;
        if self.checkBox244 ~= nil then self.checkBox244:destroy(); self.checkBox244 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.checkBox175 ~= nil then self.checkBox175:destroy(); self.checkBox175 = nil; end;
        if self.checkBox293 ~= nil then self.checkBox293:destroy(); self.checkBox293 = nil; end;
        if self.checkBox202 ~= nil then self.checkBox202:destroy(); self.checkBox202 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.checkBox128 ~= nil then self.checkBox128:destroy(); self.checkBox128 = nil; end;
        if self.checkBox222 ~= nil then self.checkBox222:destroy(); self.checkBox222 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.checkBox288 ~= nil then self.checkBox288:destroy(); self.checkBox288 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox311 ~= nil then self.checkBox311:destroy(); self.checkBox311 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.checkBox162 ~= nil then self.checkBox162:destroy(); self.checkBox162 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.checkBox144 ~= nil then self.checkBox144:destroy(); self.checkBox144 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.checkBox131 ~= nil then self.checkBox131:destroy(); self.checkBox131 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.checkBox370 ~= nil then self.checkBox370:destroy(); self.checkBox370 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.spellListPath ~= nil then self.spellListPath:destroy(); self.spellListPath = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.checkBox195 ~= nil then self.checkBox195:destroy(); self.checkBox195 = nil; end;
        if self.checkBox127 ~= nil then self.checkBox127:destroy(); self.checkBox127 = nil; end;
        if self.checkBox266 ~= nil then self.checkBox266:destroy(); self.checkBox266 = nil; end;
        if self.checkBox362 ~= nil then self.checkBox362:destroy(); self.checkBox362 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.checkBox254 ~= nil then self.checkBox254:destroy(); self.checkBox254 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.checkBox211 ~= nil then self.checkBox211:destroy(); self.checkBox211 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.checkBox176 ~= nil then self.checkBox176:destroy(); self.checkBox176 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox361 ~= nil then self.checkBox361:destroy(); self.checkBox361 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.checkBox189 ~= nil then self.checkBox189:destroy(); self.checkBox189 = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.checkBox201 ~= nil then self.checkBox201:destroy(); self.checkBox201 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.checkBox365 ~= nil then self.checkBox365:destroy(); self.checkBox365 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.checkBox307 ~= nil then self.checkBox307:destroy(); self.checkBox307 = nil; end;
        if self.checkBox271 ~= nil then self.checkBox271:destroy(); self.checkBox271 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.frmSpells ~= nil then self.frmSpells:destroy(); self.frmSpells = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.checkBox371 ~= nil then self.checkBox371:destroy(); self.checkBox371 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.checkBox338 ~= nil then self.checkBox338:destroy(); self.checkBox338 = nil; end;
        if self.checkBox217 ~= nil then self.checkBox217:destroy(); self.checkBox217 = nil; end;
        if self.checkBox178 ~= nil then self.checkBox178:destroy(); self.checkBox178 = nil; end;
        if self.checkBox272 ~= nil then self.checkBox272:destroy(); self.checkBox272 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.checkBox145 ~= nil then self.checkBox145:destroy(); self.checkBox145 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.checkBox233 ~= nil then self.checkBox233:destroy(); self.checkBox233 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.checkBox327 ~= nil then self.checkBox327:destroy(); self.checkBox327 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.checkBox223 ~= nil then self.checkBox223:destroy(); self.checkBox223 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.checkBox247 ~= nil then self.checkBox247:destroy(); self.checkBox247 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.checkBox226 ~= nil then self.checkBox226:destroy(); self.checkBox226 = nil; end;
        if self.checkBox364 ~= nil then self.checkBox364:destroy(); self.checkBox364 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.checkBox268 ~= nil then self.checkBox268:destroy(); self.checkBox268 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.checkBox228 ~= nil then self.checkBox228:destroy(); self.checkBox228 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox355 ~= nil then self.checkBox355:destroy(); self.checkBox355 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.checkBox199 ~= nil then self.checkBox199:destroy(); self.checkBox199 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.checkBox237 ~= nil then self.checkBox237:destroy(); self.checkBox237 = nil; end;
        if self.checkBox300 ~= nil then self.checkBox300:destroy(); self.checkBox300 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.checkBox218 ~= nil then self.checkBox218:destroy(); self.checkBox218 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.checkBox264 ~= nil then self.checkBox264:destroy(); self.checkBox264 = nil; end;
        if self.checkBox384 ~= nil then self.checkBox384:destroy(); self.checkBox384 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.checkBox312 ~= nil then self.checkBox312:destroy(); self.checkBox312 = nil; end;
        if self.checkBox325 ~= nil then self.checkBox325:destroy(); self.checkBox325 = nil; end;
        if self.checkBox139 ~= nil then self.checkBox139:destroy(); self.checkBox139 = nil; end;
        if self.checkBox153 ~= nil then self.checkBox153:destroy(); self.checkBox153 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox159 ~= nil then self.checkBox159:destroy(); self.checkBox159 = nil; end;
        if self.checkBox319 ~= nil then self.checkBox319:destroy(); self.checkBox319 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.checkBox280 ~= nil then self.checkBox280:destroy(); self.checkBox280 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.checkBox208 ~= nil then self.checkBox208:destroy(); self.checkBox208 = nil; end;
        if self.checkBox157 ~= nil then self.checkBox157:destroy(); self.checkBox157 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.checkBox239 ~= nil then self.checkBox239:destroy(); self.checkBox239 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.effectList ~= nil then self.effectList:destroy(); self.effectList = nil; end;
        if self.checkBox392 ~= nil then self.checkBox392:destroy(); self.checkBox392 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.checkBox382 ~= nil then self.checkBox382:destroy(); self.checkBox382 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.checkBox174 ~= nil then self.checkBox174:destroy(); self.checkBox174 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.checkBox245 ~= nil then self.checkBox245:destroy(); self.checkBox245 = nil; end;
        if self.checkBox191 ~= nil then self.checkBox191:destroy(); self.checkBox191 = nil; end;
        if self.checkBox137 ~= nil then self.checkBox137:destroy(); self.checkBox137 = nil; end;
        if self.checkBox183 ~= nil then self.checkBox183:destroy(); self.checkBox183 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.frmWeaponCalculator ~= nil then self.frmWeaponCalculator:destroy(); self.frmWeaponCalculator = nil; end;
        if self.checkBox372 ~= nil then self.checkBox372:destroy(); self.checkBox372 = nil; end;
        if self.checkBox188 ~= nil then self.checkBox188:destroy(); self.checkBox188 = nil; end;
        if self.checkBox240 ~= nil then self.checkBox240:destroy(); self.checkBox240 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox376 ~= nil then self.checkBox376:destroy(); self.checkBox376 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.checkBox192 ~= nil then self.checkBox192:destroy(); self.checkBox192 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.checkBox243 ~= nil then self.checkBox243:destroy(); self.checkBox243 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.frmArmorCalculator ~= nil then self.frmArmorCalculator:destroy(); self.frmArmorCalculator = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.checkBox358 ~= nil then self.checkBox358:destroy(); self.checkBox358 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.checkBox259 ~= nil then self.checkBox259:destroy(); self.checkBox259 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.checkBox225 ~= nil then self.checkBox225:destroy(); self.checkBox225 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.checkBox286 ~= nil then self.checkBox286:destroy(); self.checkBox286 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.checkBox173 ~= nil then self.checkBox173:destroy(); self.checkBox173 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.checkBox166 ~= nil then self.checkBox166:destroy(); self.checkBox166 = nil; end;
        if self.checkBox227 ~= nil then self.checkBox227:destroy(); self.checkBox227 = nil; end;
        if self.checkBox373 ~= nil then self.checkBox373:destroy(); self.checkBox373 = nil; end;
        if self.frmScepterCalculator ~= nil then self.frmScepterCalculator:destroy(); self.frmScepterCalculator = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.checkBox344 ~= nil then self.checkBox344:destroy(); self.checkBox344 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.checkBox336 ~= nil then self.checkBox336:destroy(); self.checkBox336 = nil; end;
        if self.checkBox386 ~= nil then self.checkBox386:destroy(); self.checkBox386 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.checkBox151 ~= nil then self.checkBox151:destroy(); self.checkBox151 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.checkBox126 ~= nil then self.checkBox126:destroy(); self.checkBox126 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.checkBox316 ~= nil then self.checkBox316:destroy(); self.checkBox316 = nil; end;
        if self.tabControl4 ~= nil then self.tabControl4:destroy(); self.tabControl4 = nil; end;
        if self.popDescription ~= nil then self.popDescription:destroy(); self.popDescription = nil; end;
        if self.checkBox294 ~= nil then self.checkBox294:destroy(); self.checkBox294 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox273 ~= nil then self.checkBox273:destroy(); self.checkBox273 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.checkBox363 ~= nil then self.checkBox363:destroy(); self.checkBox363 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox187 ~= nil then self.checkBox187:destroy(); self.checkBox187 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.checkBox258 ~= nil then self.checkBox258:destroy(); self.checkBox258 = nil; end;
        if self.checkBox322 ~= nil then self.checkBox322:destroy(); self.checkBox322 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.checkBox297 ~= nil then self.checkBox297:destroy(); self.checkBox297 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.frmSpellsPath ~= nil then self.frmSpellsPath:destroy(); self.frmSpellsPath = nil; end;
        if self.checkBox155 ~= nil then self.checkBox155:destroy(); self.checkBox155 = nil; end;
        if self.checkBox190 ~= nil then self.checkBox190:destroy(); self.checkBox190 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.checkBox200 ~= nil then self.checkBox200:destroy(); self.checkBox200 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.checkBox154 ~= nil then self.checkBox154:destroy(); self.checkBox154 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.checkBox334 ~= nil then self.checkBox334:destroy(); self.checkBox334 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.checkBox326 ~= nil then self.checkBox326:destroy(); self.checkBox326 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.checkBox357 ~= nil then self.checkBox357:destroy(); self.checkBox357 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.checkBox241 ~= nil then self.checkBox241:destroy(); self.checkBox241 = nil; end;
        if self.checkBox314 ~= nil then self.checkBox314:destroy(); self.checkBox314 = nil; end;
        if self.checkBox390 ~= nil then self.checkBox390:destroy(); self.checkBox390 = nil; end;
        if self.checkBox236 ~= nil then self.checkBox236:destroy(); self.checkBox236 = nil; end;
        if self.checkBox165 ~= nil then self.checkBox165:destroy(); self.checkBox165 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.checkBox302 ~= nil then self.checkBox302:destroy(); self.checkBox302 = nil; end;
        if self.checkBox158 ~= nil then self.checkBox158:destroy(); self.checkBox158 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.checkBox298 ~= nil then self.checkBox298:destroy(); self.checkBox298 = nil; end;
        if self.checkBox385 ~= nil then self.checkBox385:destroy(); self.checkBox385 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.checkBox398 ~= nil then self.checkBox398:destroy(); self.checkBox398 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.checkBox169 ~= nil then self.checkBox169:destroy(); self.checkBox169 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.checkBox232 ~= nil then self.checkBox232:destroy(); self.checkBox232 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.checkBox263 ~= nil then self.checkBox263:destroy(); self.checkBox263 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.checkBox224 ~= nil then self.checkBox224:destroy(); self.checkBox224 = nil; end;
        if self.checkBox255 ~= nil then self.checkBox255:destroy(); self.checkBox255 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.checkBox395 ~= nil then self.checkBox395:destroy(); self.checkBox395 = nil; end;
        if self.checkBox353 ~= nil then self.checkBox353:destroy(); self.checkBox353 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.checkBox219 ~= nil then self.checkBox219:destroy(); self.checkBox219 = nil; end;
        if self.checkBox305 ~= nil then self.checkBox305:destroy(); self.checkBox305 = nil; end;
        if self.checkBox341 ~= nil then self.checkBox341:destroy(); self.checkBox341 = nil; end;
        if self.frmWondrousItems ~= nil then self.frmWondrousItems:destroy(); self.frmWondrousItems = nil; end;
        if self.checkBox281 ~= nil then self.checkBox281:destroy(); self.checkBox281 = nil; end;
        if self.checkBox267 ~= nil then self.checkBox267:destroy(); self.checkBox267 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.checkBox212 ~= nil then self.checkBox212:destroy(); self.checkBox212 = nil; end;
        if self.checkBox366 ~= nil then self.checkBox366:destroy(); self.checkBox366 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.checkBox369 ~= nil then self.checkBox369:destroy(); self.checkBox369 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.checkBox136 ~= nil then self.checkBox136:destroy(); self.checkBox136 = nil; end;
        if self.checkBox246 ~= nil then self.checkBox246:destroy(); self.checkBox246 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.checkBox315 ~= nil then self.checkBox315:destroy(); self.checkBox315 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.checkBox383 ~= nil then self.checkBox383:destroy(); self.checkBox383 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.spellListTab ~= nil then self.spellListTab:destroy(); self.spellListTab = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.checkBox215 ~= nil then self.checkBox215:destroy(); self.checkBox215 = nil; end;
        if self.checkBox380 ~= nil then self.checkBox380:destroy(); self.checkBox380 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.frmXP ~= nil then self.frmXP:destroy(); self.frmXP = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.checkBox343 ~= nil then self.checkBox343:destroy(); self.checkBox343 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.checkBox238 ~= nil then self.checkBox238:destroy(); self.checkBox238 = nil; end;
        if self.checkBox330 ~= nil then self.checkBox330:destroy(); self.checkBox330 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.checkBox324 ~= nil then self.checkBox324:destroy(); self.checkBox324 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox275 ~= nil then self.checkBox275:destroy(); self.checkBox275 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.checkBox170 ~= nil then self.checkBox170:destroy(); self.checkBox170 = nil; end;
        if self.checkBox198 ~= nil then self.checkBox198:destroy(); self.checkBox198 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.checkBox214 ~= nil then self.checkBox214:destroy(); self.checkBox214 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.checkBox394 ~= nil then self.checkBox394:destroy(); self.checkBox394 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.checkBox234 ~= nil then self.checkBox234:destroy(); self.checkBox234 = nil; end;
        if self.checkBox132 ~= nil then self.checkBox132:destroy(); self.checkBox132 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.checkBox388 ~= nil then self.checkBox388:destroy(); self.checkBox388 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.checkBox203 ~= nil then self.checkBox203:destroy(); self.checkBox203 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.checkBox216 ~= nil then self.checkBox216:destroy(); self.checkBox216 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.checkBox146 ~= nil then self.checkBox146:destroy(); self.checkBox146 = nil; end;
        if self.checkBox279 ~= nil then self.checkBox279:destroy(); self.checkBox279 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox210 ~= nil then self.checkBox210:destroy(); self.checkBox210 = nil; end;
        if self.checkBox152 ~= nil then self.checkBox152:destroy(); self.checkBox152 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.scepterList ~= nil then self.scepterList:destroy(); self.scepterList = nil; end;
        if self.checkBox290 ~= nil then self.checkBox290:destroy(); self.checkBox290 = nil; end;
        if self.checkBox308 ~= nil then self.checkBox308:destroy(); self.checkBox308 = nil; end;
        if self.checkBox260 ~= nil then self.checkBox260:destroy(); self.checkBox260 = nil; end;
        if self.spellList ~= nil then self.spellList:destroy(); self.spellList = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.checkBox296 ~= nil then self.checkBox296:destroy(); self.checkBox296 = nil; end;
        if self.checkBox342 ~= nil then self.checkBox342:destroy(); self.checkBox342 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.checkBox332 ~= nil then self.checkBox332:destroy(); self.checkBox332 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.checkBox349 ~= nil then self.checkBox349:destroy(); self.checkBox349 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.checkBox377 ~= nil then self.checkBox377:destroy(); self.checkBox377 = nil; end;
        if self.scrollBox12 ~= nil then self.scrollBox12:destroy(); self.scrollBox12 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.checkBox313 ~= nil then self.checkBox313:destroy(); self.checkBox313 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.checkBox256 ~= nil then self.checkBox256:destroy(); self.checkBox256 = nil; end;
        if self.checkBox149 ~= nil then self.checkBox149:destroy(); self.checkBox149 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.checkBox345 ~= nil then self.checkBox345:destroy(); self.checkBox345 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.checkBox346 ~= nil then self.checkBox346:destroy(); self.checkBox346 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.checkBox193 ~= nil then self.checkBox193:destroy(); self.checkBox193 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.checkBox147 ~= nil then self.checkBox147:destroy(); self.checkBox147 = nil; end;
        if self.checkBox339 ~= nil then self.checkBox339:destroy(); self.checkBox339 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.checkBox231 ~= nil then self.checkBox231:destroy(); self.checkBox231 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.scope ~= nil then self.scope:destroy(); self.scope = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox337 ~= nil then self.checkBox337:destroy(); self.checkBox337 = nil; end;
        if self.checkBox141 ~= nil then self.checkBox141:destroy(); self.checkBox141 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.checkBox230 ~= nil then self.checkBox230:destroy(); self.checkBox230 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.checkBox196 ~= nil then self.checkBox196:destroy(); self.checkBox196 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.checkBox381 ~= nil then self.checkBox381:destroy(); self.checkBox381 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox249 ~= nil then self.checkBox249:destroy(); self.checkBox249 = nil; end;
        if self.checkBox277 ~= nil then self.checkBox277:destroy(); self.checkBox277 = nil; end;
        if self.checkBox182 ~= nil then self.checkBox182:destroy(); self.checkBox182 = nil; end;
        if self.checkBox303 ~= nil then self.checkBox303:destroy(); self.checkBox303 = nil; end;
        if self.checkBox185 ~= nil then self.checkBox185:destroy(); self.checkBox185 = nil; end;
        if self.checkBox321 ~= nil then self.checkBox321:destroy(); self.checkBox321 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.checkBox229 ~= nil then self.checkBox229:destroy(); self.checkBox229 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.checkBox140 ~= nil then self.checkBox140:destroy(); self.checkBox140 = nil; end;
        if self.checkBox156 ~= nil then self.checkBox156:destroy(); self.checkBox156 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox287 ~= nil then self.checkBox287:destroy(); self.checkBox287 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.checkBox323 ~= nil then self.checkBox323:destroy(); self.checkBox323 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox163 ~= nil then self.checkBox163:destroy(); self.checkBox163 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.checkBox299 ~= nil then self.checkBox299:destroy(); self.checkBox299 = nil; end;
        if self.checkBox164 ~= nil then self.checkBox164:destroy(); self.checkBox164 = nil; end;
        if self.checkBox194 ~= nil then self.checkBox194:destroy(); self.checkBox194 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox393 ~= nil then self.checkBox393:destroy(); self.checkBox393 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.checkBox397 ~= nil then self.checkBox397:destroy(); self.checkBox397 = nil; end;
        if self.checkBox220 ~= nil then self.checkBox220:destroy(); self.checkBox220 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.checkBox320 ~= nil then self.checkBox320:destroy(); self.checkBox320 = nil; end;
        if self.checkBox130 ~= nil then self.checkBox130:destroy(); self.checkBox130 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.checkBox150 ~= nil then self.checkBox150:destroy(); self.checkBox150 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.checkBox142 ~= nil then self.checkBox142:destroy(); self.checkBox142 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.checkBox179 ~= nil then self.checkBox179:destroy(); self.checkBox179 = nil; end;
        if self.checkBox261 ~= nil then self.checkBox261:destroy(); self.checkBox261 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.checkBox367 ~= nil then self.checkBox367:destroy(); self.checkBox367 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.checkBox301 ~= nil then self.checkBox301:destroy(); self.checkBox301 = nil; end;
        if self.checkBox235 ~= nil then self.checkBox235:destroy(); self.checkBox235 = nil; end;
        if self.checkBox276 ~= nil then self.checkBox276:destroy(); self.checkBox276 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.checkBox309 ~= nil then self.checkBox309:destroy(); self.checkBox309 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox387 ~= nil then self.checkBox387:destroy(); self.checkBox387 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.checkBox252 ~= nil then self.checkBox252:destroy(); self.checkBox252 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.checkBox205 ~= nil then self.checkBox205:destroy(); self.checkBox205 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.checkBox389 ~= nil then self.checkBox389:destroy(); self.checkBox389 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.checkBox379 ~= nil then self.checkBox379:destroy(); self.checkBox379 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.checkBox186 ~= nil then self.checkBox186:destroy(); self.checkBox186 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.checkBox265 ~= nil then self.checkBox265:destroy(); self.checkBox265 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.checkBox250 ~= nil then self.checkBox250:destroy(); self.checkBox250 = nil; end;
        if self.enemiesList ~= nil then self.enemiesList:destroy(); self.enemiesList = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.checkBox295 ~= nil then self.checkBox295:destroy(); self.checkBox295 = nil; end;
        if self.checkBox318 ~= nil then self.checkBox318:destroy(); self.checkBox318 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.checkBox248 ~= nil then self.checkBox248:destroy(); self.checkBox248 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.checkBox374 ~= nil then self.checkBox374:destroy(); self.checkBox374 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox282 ~= nil then self.checkBox282:destroy(); self.checkBox282 = nil; end;
        if self.checkBox171 ~= nil then self.checkBox171:destroy(); self.checkBox171 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.checkBox134 ~= nil then self.checkBox134:destroy(); self.checkBox134 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.checkBox328 ~= nil then self.checkBox328:destroy(); self.checkBox328 = nil; end;
        if self.checkBox356 ~= nil then self.checkBox356:destroy(); self.checkBox356 = nil; end;
        if self.checkBox242 ~= nil then self.checkBox242:destroy(); self.checkBox242 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.checkBox291 ~= nil then self.checkBox291:destroy(); self.checkBox291 = nil; end;
        if self.checkBox148 ~= nil then self.checkBox148:destroy(); self.checkBox148 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.checkBox274 ~= nil then self.checkBox274:destroy(); self.checkBox274 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.checkBox270 ~= nil then self.checkBox270:destroy(); self.checkBox270 = nil; end;
        if self.checkBox352 ~= nil then self.checkBox352:destroy(); self.checkBox352 = nil; end;
        if self.spellListTabPath ~= nil then self.spellListTabPath:destroy(); self.spellListTabPath = nil; end;
        if self.checkBox168 ~= nil then self.checkBox168:destroy(); self.checkBox168 = nil; end;
        if self.checkBox340 ~= nil then self.checkBox340:destroy(); self.checkBox340 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.checkBox348 ~= nil then self.checkBox348:destroy(); self.checkBox348 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.checkBox172 ~= nil then self.checkBox172:destroy(); self.checkBox172 = nil; end;
        if self.checkBox354 ~= nil then self.checkBox354:destroy(); self.checkBox354 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.checkBox213 ~= nil then self.checkBox213:destroy(); self.checkBox213 = nil; end;
        if self.checkBox331 ~= nil then self.checkBox331:destroy(); self.checkBox331 = nil; end;
        if self.frmStaffCalculator ~= nil then self.frmStaffCalculator:destroy(); self.frmStaffCalculator = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.checkBox289 ~= nil then self.checkBox289:destroy(); self.checkBox289 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.checkBox160 ~= nil then self.checkBox160:destroy(); self.checkBox160 = nil; end;
        if self.checkBox181 ~= nil then self.checkBox181:destroy(); self.checkBox181 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.checkBox209 ~= nil then self.checkBox209:destroy(); self.checkBox209 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.checkBox221 ~= nil then self.checkBox221:destroy(); self.checkBox221 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.checkBox143 ~= nil then self.checkBox143:destroy(); self.checkBox143 = nil; end;
        if self.checkBox284 ~= nil then self.checkBox284:destroy(); self.checkBox284 = nil; end;
        if self.checkBox262 ~= nil then self.checkBox262:destroy(); self.checkBox262 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.checkBox269 ~= nil then self.checkBox269:destroy(); self.checkBox269 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.checkBox253 ~= nil then self.checkBox253:destroy(); self.checkBox253 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.checkBox351 ~= nil then self.checkBox351:destroy(); self.checkBox351 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.checkBox396 ~= nil then self.checkBox396:destroy(); self.checkBox396 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.checkBox335 ~= nil then self.checkBox335:destroy(); self.checkBox335 = nil; end;
        if self.checkBox310 ~= nil then self.checkBox310:destroy(); self.checkBox310 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.checkBox161 ~= nil then self.checkBox161:destroy(); self.checkBox161 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox138 ~= nil then self.checkBox138:destroy(); self.checkBox138 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox129 ~= nil then self.checkBox129:destroy(); self.checkBox129 = nil; end;
        if self.checkBox278 ~= nil then self.checkBox278:destroy(); self.checkBox278 = nil; end;
        if self.checkBox368 ~= nil then self.checkBox368:destroy(); self.checkBox368 = nil; end;
        if self.checkBox375 ~= nil then self.checkBox375:destroy(); self.checkBox375 = nil; end;
        if self.checkBox184 ~= nil then self.checkBox184:destroy(); self.checkBox184 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.checkBox292 ~= nil then self.checkBox292:destroy(); self.checkBox292 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox133 ~= nil then self.checkBox133:destroy(); self.checkBox133 = nil; end;
        if self.checkBox257 ~= nil then self.checkBox257:destroy(); self.checkBox257 = nil; end;
        if self.frmSpellsListPath ~= nil then self.frmSpellsListPath:destroy(); self.frmSpellsListPath = nil; end;
        if self.weaponList ~= nil then self.weaponList:destroy(); self.weaponList = nil; end;
        if self.checkBox283 ~= nil then self.checkBox283:destroy(); self.checkBox283 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.checkBox207 ~= nil then self.checkBox207:destroy(); self.checkBox207 = nil; end;
        if self.armorList ~= nil then self.armorList:destroy(); self.armorList = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.checkBox206 ~= nil then self.checkBox206:destroy(); self.checkBox206 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
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
