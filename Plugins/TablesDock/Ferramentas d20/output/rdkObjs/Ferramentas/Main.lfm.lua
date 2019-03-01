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


        local mesa = Firecast.getMesaDe(sheet);
        local magicListData = NDB.load("magicListData.xml");

        local schools = {"Abjuration","Conjuration","Calling","Creation","Healing","Summoning","Teleportation","Divination","Scrying","Enchantment","Charm","Compulsion","Evocation","Illusion","Figment","Glamer","Pattern","Phantasm","Shadow","Necromancy","Transmutation","Universal"};
        local tags = {"Acid","Air","Chaotic","Cold","Darkness","Death","Earth","Electricity","Evil","Fear","Fire","Force","Good","Language-Dependent","Lawful","Light","Mind-Affecting","Sonic","Water"};
        local components = {"V", "S", "M", "F", "DF", "XP"}
        local ranges = {"3m", "6m", "9m", "12m", "15m", "18m", "Close", "Medium", "Long", "Personal", "Touch", "Special"};
        local durations = {"Concentration", "Dismissible", "Instantaneous", "Rounds", "Minutes", "Hours", "Days", "Permanent", "Special"};
        local targets = {"Area","Effect","Target","Burst","Cone","Cylinder","Emanation","Line","Ray","Sphere","Spread","Shapeable", "Special"};
        local trs = {"Fortitude","Reflex","Will","None","Special"};
        local srs = {"Yes", "No"};
        local books = {"PHB"};

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

        local function write(str)
            local mesa = Firecast.getMesaDe(sheet);
            mesa.activeChat:escrever(str);
        end;

        local parse

        local function create_set(...)
          local res = {}
          for i = 1, select("#", ...) do
            res[ select(i, ...) ] = true
          end
          return res
        end

        local space_chars   = create_set(" ", "\t", "\r", "\n")
        local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
        local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
        local literals      = create_set("true", "false", "null")

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

				if updaterSheet.N and spell.components==nil then
					ret = ret and spell.components==nil;
				end;

				if updaterSheet.V then
					ret = ret and array_contain(spell.components, components[1], #components);
				end;
				if updaterSheet.S then
					ret = ret and array_contain(spell.components, components[2], #components);
				end;
				if updaterSheet.M then
					ret = ret and array_contain(spell.components, components[3], #components);
				end;
				if updaterSheet.F then
					ret = ret and array_contain(spell.components, components[4], #components);
				end;
				if updaterSheet.DF then
					ret = ret and array_contain(spell.components, components[5], #components);
				end;
				if updaterSheet.XP then
					ret = ret and array_contain(spell.components, components[6], #components);
				end;

				return ret;
			end

			local function filterComponentNot(spell)
				if updaterSheet.N and spell.components==nil then
					return false;
				end;
				if updaterSheet.V and array_contain(spell.components, components[1], #components) then
					return false;
				end;
				if updaterSheet.S and array_contain(spell.components, components[2], #components) then
					return false;
				end;
				if updaterSheet.M and array_contain(spell.components, components[3], #components) then
					return false;
				end;
				if updaterSheet.F and array_contain(spell.components, components[4], #components) then
					return false;
				end;
				if updaterSheet.DF and array_contain(spell.components, components[5], #components) then
					return false;
				end;
				if updaterSheet.XP and array_contain(spell.components, components[6], #components) then
					return false;
				end;
				return true;
			end;

			local function filterComponentOr(spell)
				if updaterSheet.N and spell.components==nil then
					return true;
				end;
				if updaterSheet.V and array_contain(spell.components, components[1], #components) then
					return true;
				end;
				if updaterSheet.S and array_contain(spell.components, components[2], #components) then
					return true;
				end;
				if updaterSheet.M and array_contain(spell.components, components[3], #components) then
					return true;
				end;
				if updaterSheet.F and array_contain(spell.components, components[4], #components) then
					return true;
				end;
				if updaterSheet.DF and array_contain(spell.components, components[5], #components) then
					return true;
				end;
				if updaterSheet.XP and array_contain(spell.components, components[6], #components) then
					return true;
				end;
				return false;
			end;

			local function filterComponent(spell)
				if updaterSheet.componentRule == "and" then
					return filterComponentAnd(spell);
				elseif updaterSheet.componentRule == "not" then
					return filterComponentNot(spell);
				else
					return filterComponentOr(spell);
				end;
			end

			local function filterTag(spell)
				if updaterSheet.None and spell.descriptor==nil then
					return true;
				elseif not updaterSheet.None and spell.descriptor==nil then
					return false;
				end;
				if updaterSheet.Acid and array_contain(spell.descriptor, tags[1], #tags) then
					return true;
				end;
				if updaterSheet.Air and array_contain(spell.descriptor, tags[2], #tags) then
					return true;
				end;
				if updaterSheet.Chaotic and array_contain(spell.descriptor, tags[3], #tags) then
					return true;
				end;
				if updaterSheet.Cold and array_contain(spell.descriptor, tags[4], #tags) then
					return true;
				end;
				if updaterSheet.Darkness and array_contain(spell.descriptor, tags[5], #tags) then
					return true;
				end;
				if updaterSheet.Death and array_contain(spell.descriptor, tags[6], #tags) then
					return true;
				end;
				if updaterSheet.Earth and array_contain(spell.descriptor, tags[7], #tags) then
					return true;
				end;
				if updaterSheet.Electricity and array_contain(spell.descriptor, tags[8], #tags) then
					return true;
				end;
				if updaterSheet.Evil and array_contain(spell.descriptor, tags[9], #tags) then
					return true;
				end;
				if updaterSheet.Fear and array_contain(spell.descriptor, tags[10], #tags) then
					return true;
				end;
				if updaterSheet.Fire and array_contain(spell.descriptor, tags[11], #tags) then
					return true;
				end;
				if updaterSheet.Force and array_contain(spell.descriptor, tags[12], #tags) then
					return true;
				end;
				if updaterSheet.Good and array_contain(spell.descriptor, tags[13], #tags) then
					return true;
				end;
				if updaterSheet.Language_Dependent and array_contain(spell.descriptor, tags[14], #tags) then
					return true;
				end;
				if updaterSheet.Lawful and array_contain(spell.descriptor, tags[15], #tags) then
					return true;
				end;
				if updaterSheet.Light and array_contain(spell.descriptor, tags[16], #tags) then
					return true;
				end;
				if updaterSheet.Mind_Affecting and array_contain(spell.descriptor, tags[17], #tags) then
					return true;
				end;
				if updaterSheet.Sonic and array_contain(spell.descriptor, tags[18], #tags) then
					return true;
				end;
				if updaterSheet.Water and array_contain(spell.descriptor, tags[19], #tags) then
					return true;
				end;
				return false;
			end;

			local function filterLevel(spell)
				if updaterSheet.lvl0 and has_value(spell.level, "0") then
					return true;
				end;
				if updaterSheet.lvl1 and has_value(spell.level, "1") then
					return true;
				end;
				if updaterSheet.lvl2 and has_value(spell.level, "2") then
					return true;
				end;
				if updaterSheet.lvl3 and has_value(spell.level, "3") then
					return true;
				end;
				if updaterSheet.lvl4 and has_value(spell.level, "4") then
					return true;
				end;
				if updaterSheet.lvl5 and has_value(spell.level, "5") then
					return true;
				end;
				if updaterSheet.lvl6 and has_value(spell.level, "6") then
					return true;
				end;
				if updaterSheet.lvl7 and has_value(spell.level, "7") then
					return true;
				end;
				if updaterSheet.lvl8 and has_value(spell.level, "8") then
					return true;
				end;
				if updaterSheet.lvl9 and has_value(spell.level, "9") then
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
				if self.scope.node.Universal and spell.school == schools[22] then
					return true;
				end;

				return false;
			end;

			local function filterClassAnd(spell)
				local ret = true;
				if updaterSheet.bard then
					ret = ret and spell.level.bard ~= nil;
				end;
				if updaterSheet.cleric then
					ret = ret and spell.level.cleric ~= nil;
				end;
				if updaterSheet.druid then
					ret = ret and spell.level.druid ~= nil;
				end;
				if updaterSheet.paladin then
					ret = ret and spell.level.paladin ~= nil;
				end;
				if updaterSheet.ranger then
					ret = ret and spell.level.ranger ~= nil;
				end;
				if updaterSheet.sorcerer then
					ret = ret and spell.level.sorcerer ~= nil;
				end;
				if updaterSheet.wizard then
					ret = ret and spell.level.wizard ~= nil;
				end;
				if updaterSheet.adept then
					ret = ret and spell.level.adept ~= nil;
				end;
				if updaterSheet.assassin then
					ret = ret and spell.level.assassin ~= nil;
				end;
				if updaterSheet.blackguardif then
					ret = ret and spell.level.blackguard ~= nil;
				end;
				if updaterSheet.domain then
					ret = ret and (spell.level.air~=nil or spell.level.animal~=nil or spell.level.chaos~=nil or spell.level.death~=nil or spell.level.destruction~=nil or spell.level.earth~=nil or spell.level.evil~=nil or spell.level.fire~=nil or spell.level.good~=nil or spell.level.healing~=nil or spell.level.knowledge~=nil or spell.level.law~=nil or spell.level.luck~=nil or spell.level.magic~=nil or spell.level.plant~=nil or spell.level.protection~=nil or spell.level.strength~=nil or spell.level.sun~=nil or spell.level.travel~=nil or spell.level.trickery~=nil or spell.level.war~=nil or spell.level.water~=nil);
				end;
				return ret;
			end;

			local function filterClassOr(spell)
				if updaterSheet.bard and spell.level.bard ~= nil then
					return true;
				end;
				if updaterSheet.cleric and spell.level.cleric ~= nil then
					return true;
				end;
				if updaterSheet.druid and spell.level.druid ~= nil then
					return true;
				end;
				if updaterSheet.paladin and spell.level.paladin ~= nil then
					return true;
				end;
				if updaterSheet.ranger and spell.level.ranger ~= nil then
					return true;
				end;
				if updaterSheet.sorcerer and spell.level.sorcerer ~= nil then
					return true;
				end;
				if updaterSheet.wizard and spell.level.wizard ~= nil then
					return true;
				end;
				if updaterSheet.adept and spell.level.adept ~= nil then
					return true;
				end;
				if updaterSheet.assassin and spell.level.assassin ~= nil then
					return true;
				end;
				if updaterSheet.blackguardif and spell.level.blackguard ~= nil then
					return true;
				end;
				if updaterSheet.domain then
					return (spell.level.air~=nil or spell.level.animal~=nil or spell.level.chaos~=nil or spell.level.death~=nil or spell.level.destruction~=nil or spell.level.earth~=nil or spell.level.evil~=nil or spell.level.fire~=nil or spell.level.good~=nil or spell.level.healing~=nil or spell.level.knowledge~=nil or spell.level.law~=nil or spell.level.luck~=nil or spell.level.magic~=nil or spell.level.plant~=nil or spell.level.protection~=nil or spell.level.strength~=nil or spell.level.sun~=nil or spell.level.travel~=nil or spell.level.trickery~=nil or spell.level.war~=nil or spell.level.water~=nil);
				end;
				return false;
			end;

			local function filterClass(spell)
				if updaterSheet.classRule == "and" then
					return filterClassAnd(spell);
				else
					return filterClassOr(spell);
				end;
			end;

			local function filterRange(spell)
				if updaterSheet.fixo3m and spell.range == ranges[1] then
					return true;
				end;
				if updaterSheet.fixo6m and spell.range == ranges[2] then
					return true;
				end;
				if updaterSheet.fixo9m and spell.range == ranges[3] then
					return true;
				end;
				if updaterSheet.fixo12m and spell.range == ranges[4] then
					return true;
				end;
				if updaterSheet.fixo15m and spell.range == ranges[5] then
					return true;
				end;
				if updaterSheet.fixo18m and spell.range == ranges[6] then
					return true;
				end;
				if updaterSheet.Close and spell.range == ranges[7] then
					return true;
				end;
				if updaterSheet.Medium and spell.range == ranges[8] then
					return true;
				end;
				if updaterSheet.Long and spell.range == ranges[9] then
					return true;
				end;
				if updaterSheet.Personal and spell.range == ranges[10] then
					return true;
				end;
				if updaterSheet.Touch and spell.range == ranges[11] then
					return true;
				end;
				if updaterSheet.Special and spell.range == ranges[12] then
					return true;
				end;
				return false;
			end;

			local function filterDuration(spell)
				if updaterSheet.Concentration and array_contain(spell.duration, durations[1], #durations) then
					return true;
				end;
				if updaterSheet.Dismissible and array_contain(spell.duration, durations[2], #durations) then
					return true;
				end;
				if updaterSheet.Instantaneous and array_contain(spell.duration, durations[3], #durations) then
					return true;
				end;
				if updaterSheet.Rounds and array_contain(spell.duration, durations[4], #durations) then
					return true;
				end;
				if updaterSheet.Minutes and array_contain(spell.duration, durations[5], #durations) then
					return true;
				end;
				if updaterSheet.Hours and array_contain(spell.duration, durations[6], #durations) then
					return true;
				end;
				if updaterSheet.Days and array_contain(spell.duration, durations[7], #durations) then
					return true;
				end;
				if updaterSheet.Permanent and array_contain(spell.duration, durations[8], #durations) then
					return true;
				end;
				if updaterSheet.SpecialDuration and array_contain(spell.duration, durations[9], #durations) then
					return true;
				end;

				return false;
			end

			local function filterTarget(spell)
				if updaterSheet.Area and array_contain(spell.aiming, targets[1], #targets) then
					return true;
				end;
				if updaterSheet.Effect and array_contain(spell.aiming, targets[2], #targets) then
					return true;
				end;
				if updaterSheet.Target and array_contain(spell.aiming, targets[3], #targets) then
					return true;
				end;
				if updaterSheet.Burst and array_contain(spell.aiming, targets[4], #targets) then
					return true;
				end;
				if updaterSheet.Cone and array_contain(spell.aiming, targets[5], #targets) then
					return true;
				end;
				if updaterSheet.Cylinder and array_contain(spell.aiming, targets[6], #targets) then
					return true;
				end;
				if updaterSheet.Emanation and array_contain(spell.aiming, targets[7], #targets) then
					return true;
				end;
				if updaterSheet.Line and array_contain(spell.aiming, targets[8], #targets) then
					return true;
				end;
				if updaterSheet.Ray and array_contain(spell.aiming, targets[9], #targets) then
					return true;
				end;
				if updaterSheet.Sphere and array_contain(spell.aiming, targets[10], #targets) then
					return true;
				end;
				if updaterSheet.Spread and array_contain(spell.aiming, targets[11], #targets) then
					return true;
				end;
				if updaterSheet.Shapeable and array_contain(spell.aiming, targets[12], #targets) then
					return true;
				end;
				if updaterSheet.SpecialTarget and array_contain(spell.aiming, targets[13], #targets) then
					return true;
				end;
				return false;
			end;

			local function filterSave(spell)
				if updaterSheet.fortitude and array_contain(spell.save, trs[1], #trs) then
					return true;
				end;
				if updaterSheet.reflex and array_contain(spell.save, trs[2], #trs) then
					return true;
				end;
				if updaterSheet.will and array_contain(spell.save, trs[3], #trs) then
					return true;
				end;
				if updaterSheet.none and array_contain(spell.save, trs[4], #trs) then
					return true;
				end;
				if updaterSheet.specialTR and array_contain(spell.save, trs[5], #trs) then
					return true;
				end;
				return false;
			end;

			local function filterSR(spell)
				if updaterSheet.yes and array_contain(spell.sr, srs[1], #srs) then
					return true;
				end;
				if updaterSheet.no and array_contain(spell.sr, srs[2], #srs) then
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
				if updaterSheet.nameFilter==nil or updaterSheet.nameFilter=="" then return true end;

				local filter = string.lower(Utils.removerAcentos(updaterSheet.nameFilter));
				local nome1 = string.lower(Utils.removerAcentos(spell.name));
				local nome2 = string.lower(Utils.removerAcentos(trans(spell.name)));

				if string.find(nome1, filter) or string.find(nome1, filter) then
					return true;
				end;
				return false;
			end;
        


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

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setAlign("left");
    obj.label9:setWidth(75);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("NOME");
    obj.label9:setMargins({right=25,bottom=5,top=5});
    obj.label9:setName("label9");

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

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setAlign("left");
    obj.label10:setWidth(75);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("CLASSES");
    obj.label10:setMargins({right=75});
    obj.label10:setName("label10");

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

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout10);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setWidth(75);
    obj.checkBox1:setField("bard");
    obj.checkBox1:setText("Bardo");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout10);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setHorzTextAlign("center");
    obj.checkBox2:setWidth(75);
    obj.checkBox2:setField("cleric");
    obj.checkBox2:setText("Clerigo");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout10);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setWidth(75);
    obj.checkBox3:setField("druid");
    obj.checkBox3:setText("Druida");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout10);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setWidth(75);
    obj.checkBox4:setField("paladin");
    obj.checkBox4:setText("Paladino");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout10);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setWidth(75);
    obj.checkBox5:setField("ranger");
    obj.checkBox5:setText("Ranger");
    obj.checkBox5:setName("checkBox5");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout11);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setHorzTextAlign("center");
    obj.checkBox6:setWidth(75);
    obj.checkBox6:setField("sorcerer");
    obj.checkBox6:setText("Feiticeiro");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout11);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setHorzTextAlign("center");
    obj.checkBox7:setWidth(75);
    obj.checkBox7:setField("wizard");
    obj.checkBox7:setText("Mago");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout11);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setHorzTextAlign("center");
    obj.checkBox8:setWidth(75);
    obj.checkBox8:setField("adept");
    obj.checkBox8:setText("Adepto");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout11);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setHorzTextAlign("center");
    obj.checkBox9:setWidth(75);
    obj.checkBox9:setField("assassin");
    obj.checkBox9:setText("Assassino");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout11);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setHorzTextAlign("center");
    obj.checkBox10:setWidth(75);
    obj.checkBox10:setField("blackguard");
    obj.checkBox10:setText("Algoz");
    obj.checkBox10:setName("checkBox10");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout12);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setHorzTextAlign("center");
    obj.checkBox11:setWidth(75);
    obj.checkBox11:setField("domain");
    obj.checkBox11:setText("Dominio");
    obj.checkBox11:setName("checkBox11");

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

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout15);
    obj.label11:setAlign("left");
    obj.label11:setWidth(75);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("NÍVEL");
    obj.label11:setMargins({right=75});
    obj.label11:setName("label11");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout16);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setHorzTextAlign("center");
    obj.checkBox12:setWidth(75);
    obj.checkBox12:setField("lvl0");
    obj.checkBox12:setText("0");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout16);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setHorzTextAlign("center");
    obj.checkBox13:setWidth(75);
    obj.checkBox13:setField("lvl1");
    obj.checkBox13:setText("1");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout16);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setHorzTextAlign("center");
    obj.checkBox14:setWidth(75);
    obj.checkBox14:setField("lvl2");
    obj.checkBox14:setText("2");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout16);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setHorzTextAlign("center");
    obj.checkBox15:setWidth(75);
    obj.checkBox15:setField("lvl3");
    obj.checkBox15:setText("3");
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout16);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setHorzTextAlign("center");
    obj.checkBox16:setWidth(75);
    obj.checkBox16:setField("lvl4");
    obj.checkBox16:setText("4");
    obj.checkBox16:setName("checkBox16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout17);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setHorzTextAlign("center");
    obj.checkBox17:setWidth(75);
    obj.checkBox17:setField("lvl5");
    obj.checkBox17:setText("5");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout17);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setHorzTextAlign("center");
    obj.checkBox18:setWidth(75);
    obj.checkBox18:setField("lvl6");
    obj.checkBox18:setText("6");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout17);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setHorzTextAlign("center");
    obj.checkBox19:setWidth(75);
    obj.checkBox19:setField("lvl7");
    obj.checkBox19:setText("7");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout17);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setHorzTextAlign("center");
    obj.checkBox20:setWidth(75);
    obj.checkBox20:setField("lvl8");
    obj.checkBox20:setText("8");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout17);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setHorzTextAlign("center");
    obj.checkBox21:setWidth(75);
    obj.checkBox21:setField("lvl9");
    obj.checkBox21:setText("9");
    obj.checkBox21:setName("checkBox21");

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

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout20);
    obj.label12:setAlign("left");
    obj.label12:setWidth(150);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("ESCOLA (SUBESCOLA)");
    obj.label12:setMargins({right=0});
    obj.label12:setName("label12");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout19);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout21);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setHorzTextAlign("center");
    obj.checkBox22:setWidth(125);
    obj.checkBox22:setField("Abjuration");
    obj.checkBox22:setText("Abjuração");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout21);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setHorzTextAlign("center");
    obj.checkBox23:setWidth(125);
    obj.checkBox23:setField("Conjuration");
    obj.checkBox23:setText("Conjuração (Todas)");
    obj.checkBox23:setFontSize(10);
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout21);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setHorzTextAlign("center");
    obj.checkBox24:setWidth(125);
    obj.checkBox24:setField("Calling");
    obj.checkBox24:setText("Conjuração (Convocação)");
    obj.checkBox24:setFontSize(9);
    obj.checkBox24:setName("checkBox24");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout19);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout22);
    obj.checkBox25:setAlign("left");
    obj.checkBox25:setHorzTextAlign("center");
    obj.checkBox25:setWidth(125);
    obj.checkBox25:setField("Creation");
    obj.checkBox25:setText("Conjuração (Criação)");
    obj.checkBox25:setFontSize(10);
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout22);
    obj.checkBox26:setAlign("left");
    obj.checkBox26:setHorzTextAlign("center");
    obj.checkBox26:setWidth(125);
    obj.checkBox26:setField("Healing");
    obj.checkBox26:setText("Conjuração (Cura)");
    obj.checkBox26:setFontSize(10);
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout22);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setHorzTextAlign("center");
    obj.checkBox27:setWidth(125);
    obj.checkBox27:setField("Summoning");
    obj.checkBox27:setText("Conjuração (Invocação)");
    obj.checkBox27:setFontSize(10);
    obj.checkBox27:setName("checkBox27");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout19);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout23);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setHorzTextAlign("center");
    obj.checkBox28:setWidth(125);
    obj.checkBox28:setField("Teleportation");
    obj.checkBox28:setText("Conjuração (Teletransporte)");
    obj.checkBox28:setFontSize(8);
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout23);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setHorzTextAlign("center");
    obj.checkBox29:setWidth(125);
    obj.checkBox29:setField("Divination");
    obj.checkBox29:setText("Adivinhação (Todas)");
    obj.checkBox29:setFontSize(10);
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout23);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setHorzTextAlign("center");
    obj.checkBox30:setWidth(125);
    obj.checkBox30:setField("Scrying");
    obj.checkBox30:setText("Adivinhação (Vidência)");
    obj.checkBox30:setFontSize(10);
    obj.checkBox30:setName("checkBox30");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout19);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout24);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setHorzTextAlign("center");
    obj.checkBox31:setWidth(125);
    obj.checkBox31:setField("Enchantment");
    obj.checkBox31:setText("Encantamento (Todas)");
    obj.checkBox31:setFontSize(10);
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout24);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setHorzTextAlign("center");
    obj.checkBox32:setWidth(125);
    obj.checkBox32:setField("Charm");
    obj.checkBox32:setText("Encantamento (Feitiço)");
    obj.checkBox32:setFontSize(10);
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout24);
    obj.checkBox33:setAlign("left");
    obj.checkBox33:setHorzTextAlign("center");
    obj.checkBox33:setWidth(125);
    obj.checkBox33:setField("Compulsion");
    obj.checkBox33:setText("Encantamento (Compulsão)");
    obj.checkBox33:setFontSize(8);
    obj.checkBox33:setName("checkBox33");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout19);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout25);
    obj.checkBox34:setAlign("left");
    obj.checkBox34:setHorzTextAlign("center");
    obj.checkBox34:setWidth(125);
    obj.checkBox34:setField("Evocation");
    obj.checkBox34:setText("Evocação");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout25);
    obj.checkBox35:setAlign("left");
    obj.checkBox35:setHorzTextAlign("center");
    obj.checkBox35:setWidth(125);
    obj.checkBox35:setField("Illusion");
    obj.checkBox35:setText("Ilusão (Todas)");
    obj.checkBox35:setFontSize(12);
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout25);
    obj.checkBox36:setAlign("left");
    obj.checkBox36:setHorzTextAlign("center");
    obj.checkBox36:setWidth(125);
    obj.checkBox36:setField("Figment");
    obj.checkBox36:setText("Ilusão (Ídeia)");
    obj.checkBox36:setFontSize(12);
    obj.checkBox36:setName("checkBox36");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout19);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout26);
    obj.checkBox37:setAlign("left");
    obj.checkBox37:setHorzTextAlign("center");
    obj.checkBox37:setWidth(125);
    obj.checkBox37:setField("Glamer");
    obj.checkBox37:setText("Ilusão (Sensação)");
    obj.checkBox37:setFontSize(11);
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout26);
    obj.checkBox38:setAlign("left");
    obj.checkBox38:setHorzTextAlign("center");
    obj.checkBox38:setWidth(125);
    obj.checkBox38:setField("Pattern");
    obj.checkBox38:setText("Ilusão (Padrão)");
    obj.checkBox38:setFontSize(12);
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout26);
    obj.checkBox39:setAlign("left");
    obj.checkBox39:setHorzTextAlign("center");
    obj.checkBox39:setWidth(125);
    obj.checkBox39:setField("Phantasm");
    obj.checkBox39:setText("Ilusão (Fantasma)");
    obj.checkBox39:setFontSize(11);
    obj.checkBox39:setName("checkBox39");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout19);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout27);
    obj.checkBox40:setAlign("left");
    obj.checkBox40:setHorzTextAlign("center");
    obj.checkBox40:setWidth(125);
    obj.checkBox40:setField("Shadow");
    obj.checkBox40:setText("Ilusão (Sombra)");
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout27);
    obj.checkBox41:setAlign("left");
    obj.checkBox41:setHorzTextAlign("center");
    obj.checkBox41:setWidth(125);
    obj.checkBox41:setField("Necromancy");
    obj.checkBox41:setText("Necromancia");
    obj.checkBox41:setName("checkBox41");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout19);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout28);
    obj.checkBox42:setAlign("left");
    obj.checkBox42:setHorzTextAlign("center");
    obj.checkBox42:setWidth(125);
    obj.checkBox42:setField("Transmutation");
    obj.checkBox42:setText("Transmutação");
    obj.checkBox42:setName("checkBox42");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout28);
    obj.checkBox43:setAlign("left");
    obj.checkBox43:setHorzTextAlign("center");
    obj.checkBox43:setWidth(125);
    obj.checkBox43:setField("Universal");
    obj.checkBox43:setText("Universal");
    obj.checkBox43:setName("checkBox43");

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

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout31);
    obj.label13:setAlign("left");
    obj.label13:setWidth(75);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("DESCRITOR");
    obj.label13:setMargins({right=75});
    obj.label13:setName("label13");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout32);
    obj.checkBox44:setAlign("left");
    obj.checkBox44:setHorzTextAlign("center");
    obj.checkBox44:setWidth(90);
    obj.checkBox44:setField("Acid");
    obj.checkBox44:setText("Ácido");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout32);
    obj.checkBox45:setAlign("left");
    obj.checkBox45:setHorzTextAlign("center");
    obj.checkBox45:setWidth(90);
    obj.checkBox45:setField("Air");
    obj.checkBox45:setText("Ar");
    obj.checkBox45:setName("checkBox45");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout32);
    obj.checkBox46:setAlign("left");
    obj.checkBox46:setHorzTextAlign("center");
    obj.checkBox46:setWidth(90);
    obj.checkBox46:setField("Chaotic");
    obj.checkBox46:setText("Caos");
    obj.checkBox46:setName("checkBox46");

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout32);
    obj.checkBox47:setAlign("left");
    obj.checkBox47:setHorzTextAlign("center");
    obj.checkBox47:setWidth(90);
    obj.checkBox47:setField("Cold");
    obj.checkBox47:setText("Frio");
    obj.checkBox47:setName("checkBox47");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout33);
    obj.checkBox48:setAlign("left");
    obj.checkBox48:setHorzTextAlign("center");
    obj.checkBox48:setWidth(90);
    obj.checkBox48:setField("Darkness");
    obj.checkBox48:setText("Escuridão");
    obj.checkBox48:setName("checkBox48");

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout33);
    obj.checkBox49:setAlign("left");
    obj.checkBox49:setHorzTextAlign("center");
    obj.checkBox49:setWidth(90);
    obj.checkBox49:setField("Death");
    obj.checkBox49:setText("Morte");
    obj.checkBox49:setName("checkBox49");

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout33);
    obj.checkBox50:setAlign("left");
    obj.checkBox50:setHorzTextAlign("center");
    obj.checkBox50:setWidth(90);
    obj.checkBox50:setField("Earth");
    obj.checkBox50:setText("Terra");
    obj.checkBox50:setName("checkBox50");

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout33);
    obj.checkBox51:setAlign("left");
    obj.checkBox51:setHorzTextAlign("center");
    obj.checkBox51:setWidth(90);
    obj.checkBox51:setField("Electricity");
    obj.checkBox51:setText("Eletricidade");
    obj.checkBox51:setName("checkBox51");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout30);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout34);
    obj.checkBox52:setAlign("left");
    obj.checkBox52:setHorzTextAlign("center");
    obj.checkBox52:setWidth(90);
    obj.checkBox52:setField("Evil");
    obj.checkBox52:setText("Mal");
    obj.checkBox52:setName("checkBox52");

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout34);
    obj.checkBox53:setAlign("left");
    obj.checkBox53:setHorzTextAlign("center");
    obj.checkBox53:setWidth(90);
    obj.checkBox53:setField("Fear");
    obj.checkBox53:setText("Medo");
    obj.checkBox53:setName("checkBox53");

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout34);
    obj.checkBox54:setAlign("left");
    obj.checkBox54:setHorzTextAlign("center");
    obj.checkBox54:setWidth(90);
    obj.checkBox54:setField("Fire");
    obj.checkBox54:setText("Fogo");
    obj.checkBox54:setName("checkBox54");

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout34);
    obj.checkBox55:setAlign("left");
    obj.checkBox55:setHorzTextAlign("center");
    obj.checkBox55:setWidth(90);
    obj.checkBox55:setField("Force");
    obj.checkBox55:setText("Energia");
    obj.checkBox55:setName("checkBox55");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout30);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout35);
    obj.checkBox56:setAlign("left");
    obj.checkBox56:setHorzTextAlign("center");
    obj.checkBox56:setWidth(90);
    obj.checkBox56:setField("Good");
    obj.checkBox56:setText("Bem");
    obj.checkBox56:setName("checkBox56");

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout35);
    obj.checkBox57:setAlign("left");
    obj.checkBox57:setHorzTextAlign("center");
    obj.checkBox57:setWidth(90);
    obj.checkBox57:setField("Language_Dependent");
    obj.checkBox57:setText("Dep. de Idioma");
    obj.checkBox57:setFontSize(10);
    obj.checkBox57:setName("checkBox57");

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout35);
    obj.checkBox58:setAlign("left");
    obj.checkBox58:setHorzTextAlign("center");
    obj.checkBox58:setWidth(90);
    obj.checkBox58:setField("Lawful");
    obj.checkBox58:setText("Ordem");
    obj.checkBox58:setName("checkBox58");

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout35);
    obj.checkBox59:setAlign("left");
    obj.checkBox59:setHorzTextAlign("center");
    obj.checkBox59:setWidth(90);
    obj.checkBox59:setField("Light");
    obj.checkBox59:setText("Luz");
    obj.checkBox59:setName("checkBox59");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout30);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout36);
    obj.checkBox60:setAlign("left");
    obj.checkBox60:setHorzTextAlign("center");
    obj.checkBox60:setWidth(90);
    obj.checkBox60:setField("Mind_Affecting");
    obj.checkBox60:setText("Ação Mental");
    obj.checkBox60:setFontSize(12);
    obj.checkBox60:setName("checkBox60");

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout36);
    obj.checkBox61:setAlign("left");
    obj.checkBox61:setHorzTextAlign("center");
    obj.checkBox61:setWidth(90);
    obj.checkBox61:setField("Sonic");
    obj.checkBox61:setText("Sônico");
    obj.checkBox61:setName("checkBox61");

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout36);
    obj.checkBox62:setAlign("left");
    obj.checkBox62:setHorzTextAlign("center");
    obj.checkBox62:setWidth(90);
    obj.checkBox62:setField("Water");
    obj.checkBox62:setText("Água");
    obj.checkBox62:setName("checkBox62");

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout36);
    obj.checkBox63:setAlign("left");
    obj.checkBox63:setHorzTextAlign("center");
    obj.checkBox63:setWidth(90);
    obj.checkBox63:setField("None");
    obj.checkBox63:setText("Nenhum");
    obj.checkBox63:setName("checkBox63");

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

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout39);
    obj.label14:setAlign("left");
    obj.label14:setWidth(100);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("COMPONENTES");
    obj.label14:setMargins({right=25});
    obj.label14:setName("label14");

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

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout40);
    obj.checkBox64:setAlign("left");
    obj.checkBox64:setHorzTextAlign("center");
    obj.checkBox64:setWidth(90);
    obj.checkBox64:setField("V");
    obj.checkBox64:setText("Verbal");
    obj.checkBox64:setName("checkBox64");

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout40);
    obj.checkBox65:setAlign("left");
    obj.checkBox65:setHorzTextAlign("center");
    obj.checkBox65:setWidth(90);
    obj.checkBox65:setField("S");
    obj.checkBox65:setText("Gestos");
    obj.checkBox65:setName("checkBox65");

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout40);
    obj.checkBox66:setAlign("left");
    obj.checkBox66:setHorzTextAlign("center");
    obj.checkBox66:setWidth(90);
    obj.checkBox66:setField("M");
    obj.checkBox66:setText("Material");
    obj.checkBox66:setName("checkBox66");

    obj.checkBox67 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout40);
    obj.checkBox67:setAlign("left");
    obj.checkBox67:setHorzTextAlign("center");
    obj.checkBox67:setWidth(90);
    obj.checkBox67:setField("F");
    obj.checkBox67:setText("Foco");
    obj.checkBox67:setName("checkBox67");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout38);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.checkBox68 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout41);
    obj.checkBox68:setAlign("left");
    obj.checkBox68:setHorzTextAlign("center");
    obj.checkBox68:setWidth(90);
    obj.checkBox68:setField("DF");
    obj.checkBox68:setText("Foco Divino");
    obj.checkBox68:setName("checkBox68");

    obj.checkBox69 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout41);
    obj.checkBox69:setAlign("left");
    obj.checkBox69:setHorzTextAlign("center");
    obj.checkBox69:setWidth(90);
    obj.checkBox69:setField("XP");
    obj.checkBox69:setText("Experiencia");
    obj.checkBox69:setName("checkBox69");

    obj.checkBox70 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout41);
    obj.checkBox70:setAlign("left");
    obj.checkBox70:setHorzTextAlign("center");
    obj.checkBox70:setWidth(90);
    obj.checkBox70:setField("N");
    obj.checkBox70:setText("Nenhum");
    obj.checkBox70:setName("checkBox70");

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
    obj.layout43:setHeight(125);
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout44);
    obj.label15:setAlign("left");
    obj.label15:setWidth(75);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("ALCANCE");
    obj.label15:setMargins({right=75});
    obj.label15:setName("label15");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout43);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.checkBox71 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout45);
    obj.checkBox71:setAlign("left");
    obj.checkBox71:setHorzTextAlign("center");
    obj.checkBox71:setWidth(90);
    obj.checkBox71:setField("fixo3m");
    obj.checkBox71:setText("3m");
    obj.checkBox71:setName("checkBox71");

    obj.checkBox72 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout45);
    obj.checkBox72:setAlign("left");
    obj.checkBox72:setHorzTextAlign("center");
    obj.checkBox72:setWidth(90);
    obj.checkBox72:setField("fixo6m");
    obj.checkBox72:setText("6m");
    obj.checkBox72:setName("checkBox72");

    obj.checkBox73 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout45);
    obj.checkBox73:setAlign("left");
    obj.checkBox73:setHorzTextAlign("center");
    obj.checkBox73:setWidth(90);
    obj.checkBox73:setField("fixo9m");
    obj.checkBox73:setText("9m");
    obj.checkBox73:setName("checkBox73");

    obj.checkBox74 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout45);
    obj.checkBox74:setAlign("left");
    obj.checkBox74:setHorzTextAlign("center");
    obj.checkBox74:setWidth(90);
    obj.checkBox74:setField("fixo12m");
    obj.checkBox74:setText("12m");
    obj.checkBox74:setName("checkBox74");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout43);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.checkBox75 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout46);
    obj.checkBox75:setAlign("left");
    obj.checkBox75:setHorzTextAlign("center");
    obj.checkBox75:setWidth(90);
    obj.checkBox75:setField("fixo15m");
    obj.checkBox75:setText("15m");
    obj.checkBox75:setName("checkBox75");

    obj.checkBox76 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout46);
    obj.checkBox76:setAlign("left");
    obj.checkBox76:setHorzTextAlign("center");
    obj.checkBox76:setWidth(90);
    obj.checkBox76:setField("fixo18m");
    obj.checkBox76:setText("18m");
    obj.checkBox76:setName("checkBox76");

    obj.checkBox77 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout46);
    obj.checkBox77:setAlign("left");
    obj.checkBox77:setHorzTextAlign("center");
    obj.checkBox77:setWidth(90);
    obj.checkBox77:setField("Close");
    obj.checkBox77:setText("Curto");
    obj.checkBox77:setName("checkBox77");

    obj.checkBox78 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout46);
    obj.checkBox78:setAlign("left");
    obj.checkBox78:setHorzTextAlign("center");
    obj.checkBox78:setWidth(90);
    obj.checkBox78:setField("Medium");
    obj.checkBox78:setText("Médio");
    obj.checkBox78:setName("checkBox78");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout43);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.checkBox79 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout47);
    obj.checkBox79:setAlign("left");
    obj.checkBox79:setHorzTextAlign("center");
    obj.checkBox79:setWidth(90);
    obj.checkBox79:setField("Long");
    obj.checkBox79:setText("Longo");
    obj.checkBox79:setName("checkBox79");

    obj.checkBox80 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout47);
    obj.checkBox80:setAlign("left");
    obj.checkBox80:setHorzTextAlign("center");
    obj.checkBox80:setWidth(90);
    obj.checkBox80:setField("Personal");
    obj.checkBox80:setText("Pessoal");
    obj.checkBox80:setName("checkBox80");

    obj.checkBox81 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout47);
    obj.checkBox81:setAlign("left");
    obj.checkBox81:setHorzTextAlign("center");
    obj.checkBox81:setWidth(90);
    obj.checkBox81:setField("Touch");
    obj.checkBox81:setText("Toque");
    obj.checkBox81:setName("checkBox81");

    obj.checkBox82 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout47);
    obj.checkBox82:setAlign("left");
    obj.checkBox82:setHorzTextAlign("center");
    obj.checkBox82:setWidth(90);
    obj.checkBox82:setField("Special");
    obj.checkBox82:setText("Especial");
    obj.checkBox82:setName("checkBox82");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout43);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout48);
    obj.button14:setAlign("left");
    obj.button14:setHorzTextAlign("center");
    obj.button14:setWidth(187);
    obj.button14:setText("Marque Todas");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout48);
    obj.button15:setAlign("left");
    obj.button15:setHorzTextAlign("center");
    obj.button15:setWidth(187);
    obj.button15:setText("Desmarque Todas");
    obj.button15:setName("button15");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox2);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(125);
    obj.layout49:setName("layout49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout50);
    obj.label16:setAlign("left");
    obj.label16:setWidth(75);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("DURAÇÃO");
    obj.label16:setMargins({right=75});
    obj.label16:setName("label16");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.checkBox83 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout51);
    obj.checkBox83:setAlign("left");
    obj.checkBox83:setHorzTextAlign("center");
    obj.checkBox83:setWidth(125);
    obj.checkBox83:setField("Concentration");
    obj.checkBox83:setText("Concentração");
    obj.checkBox83:setName("checkBox83");

    obj.checkBox84 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout51);
    obj.checkBox84:setAlign("left");
    obj.checkBox84:setHorzTextAlign("center");
    obj.checkBox84:setWidth(125);
    obj.checkBox84:setField("Dismissible");
    obj.checkBox84:setText("Dissipavel");
    obj.checkBox84:setName("checkBox84");

    obj.checkBox85 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout51);
    obj.checkBox85:setAlign("left");
    obj.checkBox85:setHorzTextAlign("center");
    obj.checkBox85:setWidth(125);
    obj.checkBox85:setField("SpecialDuration");
    obj.checkBox85:setText("Especial");
    obj.checkBox85:setName("checkBox85");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.checkBox86 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout52);
    obj.checkBox86:setAlign("left");
    obj.checkBox86:setHorzTextAlign("center");
    obj.checkBox86:setWidth(125);
    obj.checkBox86:setField("Instantaneous");
    obj.checkBox86:setText("Instantaneo");
    obj.checkBox86:setName("checkBox86");

    obj.checkBox87 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout52);
    obj.checkBox87:setAlign("left");
    obj.checkBox87:setHorzTextAlign("center");
    obj.checkBox87:setWidth(125);
    obj.checkBox87:setField("Rounds");
    obj.checkBox87:setText("Rodadas");
    obj.checkBox87:setName("checkBox87");

    obj.checkBox88 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout52);
    obj.checkBox88:setAlign("left");
    obj.checkBox88:setHorzTextAlign("center");
    obj.checkBox88:setWidth(125);
    obj.checkBox88:setField("Minutes");
    obj.checkBox88:setText("Minutos");
    obj.checkBox88:setName("checkBox88");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout49);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.checkBox89 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout53);
    obj.checkBox89:setAlign("left");
    obj.checkBox89:setHorzTextAlign("center");
    obj.checkBox89:setWidth(125);
    obj.checkBox89:setField("Hours");
    obj.checkBox89:setText("Horas");
    obj.checkBox89:setName("checkBox89");

    obj.checkBox90 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout53);
    obj.checkBox90:setAlign("left");
    obj.checkBox90:setHorzTextAlign("center");
    obj.checkBox90:setWidth(125);
    obj.checkBox90:setField("Days");
    obj.checkBox90:setText("Dias");
    obj.checkBox90:setName("checkBox90");

    obj.checkBox91 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout53);
    obj.checkBox91:setAlign("left");
    obj.checkBox91:setHorzTextAlign("center");
    obj.checkBox91:setWidth(125);
    obj.checkBox91:setField("Permanent");
    obj.checkBox91:setText("Permanente");
    obj.checkBox91:setName("checkBox91");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout49);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout54);
    obj.button16:setAlign("left");
    obj.button16:setHorzTextAlign("center");
    obj.button16:setWidth(187);
    obj.button16:setText("Marque Todas");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout54);
    obj.button17:setAlign("left");
    obj.button17:setHorzTextAlign("center");
    obj.button17:setWidth(187);
    obj.button17:setText("Desmarque Todas");
    obj.button17:setName("button17");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox2);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(150);
    obj.layout55:setName("layout55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout56);
    obj.label17:setAlign("left");
    obj.label17:setWidth(75);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("ALVO");
    obj.label17:setMargins({right=75});
    obj.label17:setName("label17");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout55);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.checkBox92 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.layout57);
    obj.checkBox92:setAlign("left");
    obj.checkBox92:setHorzTextAlign("center");
    obj.checkBox92:setWidth(90);
    obj.checkBox92:setField("Area");
    obj.checkBox92:setText("Area");
    obj.checkBox92:setName("checkBox92");

    obj.checkBox93 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.layout57);
    obj.checkBox93:setAlign("left");
    obj.checkBox93:setHorzTextAlign("center");
    obj.checkBox93:setWidth(90);
    obj.checkBox93:setField("Effect");
    obj.checkBox93:setText("Efeito");
    obj.checkBox93:setName("checkBox93");

    obj.checkBox94 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.layout57);
    obj.checkBox94:setAlign("left");
    obj.checkBox94:setHorzTextAlign("center");
    obj.checkBox94:setWidth(90);
    obj.checkBox94:setField("Target");
    obj.checkBox94:setText("Alvo");
    obj.checkBox94:setName("checkBox94");

    obj.checkBox95 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.layout57);
    obj.checkBox95:setAlign("left");
    obj.checkBox95:setHorzTextAlign("center");
    obj.checkBox95:setWidth(90);
    obj.checkBox95:setField("Burst");
    obj.checkBox95:setText("Explosão");
    obj.checkBox95:setName("checkBox95");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout55);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.checkBox96 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.layout58);
    obj.checkBox96:setAlign("left");
    obj.checkBox96:setHorzTextAlign("center");
    obj.checkBox96:setWidth(90);
    obj.checkBox96:setField("Cone");
    obj.checkBox96:setText("Cone");
    obj.checkBox96:setName("checkBox96");

    obj.checkBox97 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.layout58);
    obj.checkBox97:setAlign("left");
    obj.checkBox97:setHorzTextAlign("center");
    obj.checkBox97:setWidth(90);
    obj.checkBox97:setField("Cylinder");
    obj.checkBox97:setText("Cilindro");
    obj.checkBox97:setName("checkBox97");

    obj.checkBox98 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.layout58);
    obj.checkBox98:setAlign("left");
    obj.checkBox98:setHorzTextAlign("center");
    obj.checkBox98:setWidth(90);
    obj.checkBox98:setField("Emanation");
    obj.checkBox98:setText("Emanação");
    obj.checkBox98:setName("checkBox98");

    obj.checkBox99 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.layout58);
    obj.checkBox99:setAlign("left");
    obj.checkBox99:setHorzTextAlign("center");
    obj.checkBox99:setWidth(90);
    obj.checkBox99:setField("Line");
    obj.checkBox99:setText("Linha");
    obj.checkBox99:setName("checkBox99");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout55);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.checkBox100 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.layout59);
    obj.checkBox100:setAlign("left");
    obj.checkBox100:setHorzTextAlign("center");
    obj.checkBox100:setWidth(90);
    obj.checkBox100:setField("Ray");
    obj.checkBox100:setText("Raio");
    obj.checkBox100:setName("checkBox100");

    obj.checkBox101 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.layout59);
    obj.checkBox101:setAlign("left");
    obj.checkBox101:setHorzTextAlign("center");
    obj.checkBox101:setWidth(90);
    obj.checkBox101:setField("Sphere");
    obj.checkBox101:setText("Esfera");
    obj.checkBox101:setName("checkBox101");

    obj.checkBox102 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.layout59);
    obj.checkBox102:setAlign("left");
    obj.checkBox102:setHorzTextAlign("center");
    obj.checkBox102:setWidth(90);
    obj.checkBox102:setField("Spread");
    obj.checkBox102:setText("Disperção");
    obj.checkBox102:setName("checkBox102");

    obj.checkBox103 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.layout59);
    obj.checkBox103:setAlign("left");
    obj.checkBox103:setHorzTextAlign("center");
    obj.checkBox103:setWidth(90);
    obj.checkBox103:setField("Shapeable");
    obj.checkBox103:setText("Moldavel");
    obj.checkBox103:setName("checkBox103");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout55);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.checkBox104 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.layout60);
    obj.checkBox104:setAlign("left");
    obj.checkBox104:setHorzTextAlign("center");
    obj.checkBox104:setWidth(90);
    obj.checkBox104:setField("SpecialTarget");
    obj.checkBox104:setText("Especial");
    obj.checkBox104:setName("checkBox104");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout55);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout61);
    obj.button18:setAlign("left");
    obj.button18:setHorzTextAlign("center");
    obj.button18:setWidth(187);
    obj.button18:setText("Marque Todas");
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout61);
    obj.button19:setAlign("left");
    obj.button19:setHorzTextAlign("center");
    obj.button19:setWidth(187);
    obj.button19:setText("Desmarque Todas");
    obj.button19:setName("button19");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox2);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(75);
    obj.layout62:setName("layout62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout63);
    obj.label18:setAlign("left");
    obj.label18:setWidth(75);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("RESISTENCIA");
    obj.label18:setMargins({right=75});
    obj.label18:setName("label18");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout62);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.checkBox105 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.layout64);
    obj.checkBox105:setAlign("left");
    obj.checkBox105:setHorzTextAlign("center");
    obj.checkBox105:setWidth(75);
    obj.checkBox105:setField("fortitude");
    obj.checkBox105:setText("Fortitude");
    obj.checkBox105:setName("checkBox105");

    obj.checkBox106 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.layout64);
    obj.checkBox106:setAlign("left");
    obj.checkBox106:setHorzTextAlign("center");
    obj.checkBox106:setWidth(75);
    obj.checkBox106:setField("reflex");
    obj.checkBox106:setText("Reflexos");
    obj.checkBox106:setName("checkBox106");

    obj.checkBox107 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.layout64);
    obj.checkBox107:setAlign("left");
    obj.checkBox107:setHorzTextAlign("center");
    obj.checkBox107:setWidth(75);
    obj.checkBox107:setField("will");
    obj.checkBox107:setText("Vontade");
    obj.checkBox107:setName("checkBox107");

    obj.checkBox108 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.layout64);
    obj.checkBox108:setAlign("left");
    obj.checkBox108:setHorzTextAlign("center");
    obj.checkBox108:setWidth(75);
    obj.checkBox108:setField("none");
    obj.checkBox108:setText("Nenhum");
    obj.checkBox108:setName("checkBox108");

    obj.checkBox109 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.layout64);
    obj.checkBox109:setAlign("left");
    obj.checkBox109:setHorzTextAlign("center");
    obj.checkBox109:setWidth(75);
    obj.checkBox109:setField("specialTR");
    obj.checkBox109:setText("Especial");
    obj.checkBox109:setName("checkBox109");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout62);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout65);
    obj.button20:setAlign("left");
    obj.button20:setHorzTextAlign("center");
    obj.button20:setWidth(187);
    obj.button20:setText("Marque Todas");
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout65);
    obj.button21:setAlign("left");
    obj.button21:setHorzTextAlign("center");
    obj.button21:setWidth(187);
    obj.button21:setText("Desmarque Todas");
    obj.button21:setName("button21");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.scrollBox2);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(75);
    obj.layout66:setName("layout66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout66);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout67);
    obj.label19:setAlign("left");
    obj.label19:setWidth(75);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("RM");
    obj.label19:setMargins({right=75});
    obj.label19:setName("label19");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout66);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.checkBox110 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.layout68);
    obj.checkBox110:setAlign("left");
    obj.checkBox110:setHorzTextAlign("center");
    obj.checkBox110:setWidth(125);
    obj.checkBox110:setField("yes");
    obj.checkBox110:setText("Sim");
    obj.checkBox110:setName("checkBox110");

    obj.checkBox111 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.layout68);
    obj.checkBox111:setAlign("left");
    obj.checkBox111:setHorzTextAlign("center");
    obj.checkBox111:setWidth(125);
    obj.checkBox111:setField("no");
    obj.checkBox111:setText("Não");
    obj.checkBox111:setName("checkBox111");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout66);
    obj.layout69:setAlign("top");
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout69);
    obj.button22:setAlign("left");
    obj.button22:setHorzTextAlign("center");
    obj.button22:setWidth(187);
    obj.button22:setText("Marque Todas");
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout69);
    obj.button23:setAlign("left");
    obj.button23:setHorzTextAlign("center");
    obj.button23:setWidth(187);
    obj.button23:setText("Desmarque Todas");
    obj.button23:setName("button23");

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

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.frmSpellsList);
    obj.layout70:setAlign("bottom");
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout70);
    obj.button24:setAlign("left");
    obj.button24:setHorzTextAlign("center");
    obj.button24:setWidth(150);
    obj.button24:setText("Anterior");
    obj.button24:setName("button24");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout70);
    obj.label20:setAlign("left");
    obj.label20:setField("SpellsPage");
    obj.label20:setWidth(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout70);
    obj.label21:setAlign("left");
    obj.label21:setText("/");
    obj.label21:setWidth(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout70);
    obj.label22:setAlign("left");
    obj.label22:setField("maxSpellPages");
    obj.label22:setWidth(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout70);
    obj.button25:setAlign("left");
    obj.button25:setHorzTextAlign("center");
    obj.button25:setWidth(150);
    obj.button25:setText("Proximo");
    obj.button25:setName("button25");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            -- Carrega o local sheet para ser usado. 
                    updaterSheet = NDB.load("config.xml");
            
                    self.scope:setNodeObject(updaterSheet);
            
                    local spells = NDB.getChildNodes(updaterSheet.spellList); 
            
                    --local str = "[{\"name\":\"Control Winds\",\"level\":{\"druid\":\"5\"},\"school\":\"Transmutation\",\"descriptor\":[\"Air\"],\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Cylinder\"],\"save\":[\"Fortitude\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/controlWinds.htm\"},{\"name\":\"Cloudkill\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"Fortitude\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cloudkill.htm\"},{\"name\":\"Stinking Cloud\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"Fortitude\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/stinkingCloud.htm\"},{\"name\":\"Control Weather\",\"level\":{\"cleric\":\"7\",\"druid\":\"7\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Hours\"],\"aiming\":[\"Area\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/controlWeather.htm\"},{\"name\":\"Forcecage\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/forcecage.htm\"},{\"name\":\"Soften Earth and Stone\",\"level\":{\"druid\":\"2\"},\"school\":\"Transmutation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/softenEarthAndStone.htm\"},{\"name\":\"Locate Object\",\"level\":{\"bard\":\"2\",\"cleric\":\"3\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/locateObject.htm\"},{\"name\":\"Locate Creature\",\"level\":{\"assassin\":\"4\",\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Long\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/locateCreature.htm\"},{\"name\":\"Detect Magic\",\"level\":{\"adept\":\"0\",\"bard\":\"0\",\"cleric\":\"0\",\"druid\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectMagic.htm\"},{\"name\":\"Detect Secret Doors\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectSecretDoors.htm\"},{\"name\":\"Detect Snares and Pits\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectSnaresAndPits.htm\"},{\"name\":\"Detect Chaos\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectChaos.htm\"},{\"name\":\"Detect Evil\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectEvil.htm\"},{\"name\":\"Detect Good\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectGood.htm\"},{\"name\":\"Detect Law\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectLaw.htm\"},{\"name\":\"Detect Undead\",\"level\":{\"cleric\":\"1\",\"paladin\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectUndead.htm\"},{\"name\":\"Detect Animals or Plants\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectAnimalsOrPlants.htm\"},{\"name\":\"Deathwatch\",\"level\":{\"cleric\":\"1\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\"],\"range\":\"9m\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/deathwatch.htm\"},{\"name\":\"Sleet Storm\",\"level\":{\"druid\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Cylinder\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sleetStorm.htm\"},{\"name\":\"Permanency\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Universal\",\"components\":[\"V\",\"S\",\"XP\"],\"range\":\"Special\",\"duration\":[\"Permanent\"],\"aiming\":[\"Area\",\"Effect\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/permanency.htm\"},{\"name\":\"Detect Scrying\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"12m\",\"duration\":[\"Hours\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectScrying.htm\"},{\"name\":\"Consecrate\",\"level\":{\"cleric\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/consecrate.htm\"},{\"name\":\"Alarm\",\"level\":{\"bard\":\"1\",\"ranger\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/alarm.htm\"},{\"name\":\"Zone of Silence\",\"level\":{\"bard\":\"4\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/zoneOfSilence.htm\"},{\"name\":\"False Vision\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/falseVision.htm\"},{\"name\":\"Globe of Invulnerability\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"3m\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\",\"Sphere\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/globeOfInvulnerability.htm\"},{\"name\":\"Globe of Invulnerability, Lesser\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"3m\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\",\"Sphere\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/globeOfInvulnerabilityLesser.htm\"},{\"name\":\"Repel Metal or Stone\",\"level\":{\"druid\":\"8\"},\"school\":\"Abjuration\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Line\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/repelMetalOrStone.htm\"},{\"name\":\"Repel Wood\",\"level\":{\"druid\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Line\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/repelWood.htm\"},{\"name\":\"Mage's Private Sanctum\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magesPrivateSanctum.htm\"},{\"name\":\"Move Earth\",\"level\":{\"druid\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/moveEarth.htm\"},{\"name\":\"Control Water\",\"level\":{\"cleric\":\"4\",\"druid\":\"4\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"descriptor\":[\"Water\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/controlWater.htm\"},{\"name\":\"Reverse Gravity\",\"level\":{\"druid\":\"8\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/reverseGravity.htm\"},{\"name\":\"Whispering Wind\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"descriptor\":[\"Air\"],\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Hours\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/whisperingWind.htm\"},{\"name\":\"Black Tentacles\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blackTentacles.htm\"},{\"name\":\"Detect Poison\",\"level\":{\"assassin\":\"1\",\"cleric\":\"0\",\"druid\":\"0\",\"paladin\":\"1\",\"ranger\":\"1\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectPoison.htm\"},{\"name\":\"Diminish Plants\",\"level\":{\"druid\":\"3\",\"ranger\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/diminishPlants.htm\"},{\"name\":\"Plant Growth\",\"level\":{\"druid\":\"3\",\"ranger\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/plantGrowth.htm\"},{\"name\":\"Dispel Magic\",\"level\":{\"bard\":\"3\",\"cleric\":\"3\",\"druid\":\"4\",\"paladin\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Target\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dispelMagic.htm\"},{\"name\":\"Dispel Magic, Greater\",\"level\":{\"bard\":\"5\",\"cleric\":\"6\",\"druid\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Target\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dispelMagicGreater.htm\"},{\"name\":\"Summon Swarm\",\"level\":{\"bard\":\"2\",\"druid\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonSwarm.htm\"},{\"name\":\"Shambler\",\"level\":{\"druid\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shambler.htm\"},{\"name\":\"Ironwood\",\"level\":{\"druid\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/ironwood.htm\"},{\"name\":\"Create Food and Water\",\"level\":{\"cleric\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/createFoodAndWater.htm\"},{\"name\":\"Heroes' Feast\",\"level\":{\"bard\":\"6\",\"cleric\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Creation\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/heroesFeast.htm\"},{\"name\":\"Floating Disk\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/floatingDisk.htm\"},{\"name\":\"Unseen Servant\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/unseenServant.htm\"},{\"name\":\"Helping Hand\",\"level\":{\"cleric\":\"3\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/helpingHand.htm\"},{\"name\":\"Mount\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mount.htm\"},{\"name\":\"Secure Shelter\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/secureShelter.htm\"},{\"name\":\"Phantom Steed\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/phantomSteed.htm\"},{\"name\":\"Minor Creation\",\"level\":{\"adept\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/minorCreation.htm\"},{\"name\":\"Prying Eyes\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/pryingEyes.htm\"},{\"name\":\"Prying Eyes, Greater\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/pryingEyesGreater.htm\"},{\"name\":\"Passwall\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/passwall.htm\"},{\"name\":\"Acid Splash\",\"level\":{\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Acid\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/acidSplash.htm\"},{\"name\":\"Create Water\",\"level\":{\"adept\":\"0\",\"cleric\":\"0\",\"druid\":\"0\",\"paladin\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Water\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/createWater.htm\"},{\"name\":\"Planar Ally\",\"level\":{\"cleric\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Calling\",\"components\":[\"V\",\"S\",\"DF\",\"XP\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/planarAlly.htm\"},{\"name\":\"Planar Ally, Greater\",\"level\":{\"cleric\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Calling\",\"components\":[\"V\",\"S\",\"DF\",\"XP\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/planarAllyGreater.htm\"},{\"name\":\"Planar Ally, Lesser\",\"level\":{\"cleric\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Calling\",\"components\":[\"V\",\"S\",\"DF\",\"XP\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/planarAllyLesser.htm\"},{\"name\":\"Clone\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/clone.htm\"},{\"name\":\"Simulacrum\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\",\"M\",\"XP\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/simulacrum.htm\"},{\"name\":\"Gate\",\"level\":{\"cleric\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Conjuration\",\"subschool\":[\"Calling\",\"Creation\"],\"components\":[\"V\",\"S\",\"XP\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\",\"Rounds\",\"Concentration\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/gate.htm\"},{\"name\":\"Creeping Doom\",\"level\":{\"druid\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/creepingDoom.htm\"},{\"name\":\"Insect Plague\",\"level\":{\"cleric\":\"5\",\"druid\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/insectPlague.htm\"},{\"name\":\"Clairaudience/Clairvoyance\",\"level\":{\"assassin\":\"4\",\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Divination\",\"subschool\":\"Scrying\",\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/clairaudienceClairvoyance.htm\"},{\"name\":\"Dancing Lights\",\"level\":{\"bard\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dancingLights.htm\"},{\"name\":\"Spectral Hand\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spectralHand.htm\"},{\"name\":\"Elemental Swarm\",\"level\":{\"druid\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/elementalSwarm.htm\"},{\"name\":\"Summon Instrument\",\"level\":{\"bard\":\"0\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonInstrument.htm\"},{\"name\":\"Arcane Eye\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Divination\",\"subschool\":\"Scrying\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/arcaneEye.htm\"},{\"name\":\"Phase Door\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\"],\"range\":\"Special\",\"duration\":[\"Permanent\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/phaseDoor.htm\"},{\"name\":\"Arcane Mark\",\"level\":{\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Universal\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Permanent\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/arcaneMark.htm\"},{\"name\":\"Acid Arrow\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Acid\"],\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Long\",\"duration\":[\"Rounds\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/acidArrow.htm\"},{\"name\":\"Summon Nature's Ally I\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyI.htm\"},{\"name\":\"Summon Nature's Ally II\",\"level\":{\"druid\":\"2\",\"ranger\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyII.htm\"},{\"name\":\"Summon Nature's Ally III\",\"level\":{\"druid\":\"3\",\"ranger\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyIII.htm\"},{\"name\":\"Summon Nature's Ally IV\",\"level\":{\"druid\":\"4\",\"ranger\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyIV.htm\"},{\"name\":\"Summon Nature's Ally IX\",\"level\":{\"druid\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyIX.htm\"},{\"name\":\"Summon Nature's Ally V\",\"level\":{\"druid\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyV.htm\"},{\"name\":\"Summon Nature's Ally VI\",\"level\":{\"druid\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyVI.htm\"},{\"name\":\"Summon Nature's Ally VII\",\"level\":{\"druid\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyVII.htm\"},{\"name\":\"Summon Nature's Ally VIII\",\"level\":{\"druid\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonNaturesAllyVIII.htm\"},{\"name\":\"Summon Monster I\",\"level\":{\"bard\":\"1\",\"blackguard\":\"1\",\"cleric\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterI.htm\"},{\"name\":\"Summon Monster II\",\"level\":{\"bard\":\"2\",\"blackguard\":\"2\",\"cleric\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterII.htm\"},{\"name\":\"Summon Monster III\",\"level\":{\"bard\":\"3\",\"blackguard\":\"3\",\"cleric\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterIII.htm\"},{\"name\":\"Summon Monster IV\",\"level\":{\"bard\":\"4\",\"blackguard\":\"4\",\"cleric\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterIV.htm\"},{\"name\":\"Summon Monster IX\",\"level\":{\"cleric\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterIX.htm\"},{\"name\":\"Summon Monster V\",\"level\":{\"bard\":\"5\",\"cleric\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterV.htm\"},{\"name\":\"Summon Monster VI\",\"level\":{\"bard\":\"6\",\"cleric\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterVI.htm\"},{\"name\":\"Summon Monster VII\",\"level\":{\"cleric\":\"7\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterVII.htm\"},{\"name\":\"Summon Monster VIII\",\"level\":{\"cleric\":\"8\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"descriptor\":[\"Air\",\"Chaotic\",\"Earth\",\"Evil\",\"Fire\",\"Good\",\"Lawful\",\"Water\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/summonMonsterVIII.htm\"},{\"name\":\"Wall of Force\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wallOfForce.htm\"},{\"name\":\"Mage's Faithful Hound\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magesFaithfulHound.htm\"},{\"name\":\"Major Creation\",\"level\":{\"adept\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Minutes\",\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/majorCreation.htm\"},{\"name\":\"Mage's Magnificent Mansion\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magesMagnificentMansion.htm\"},{\"name\":\"Wall of Thorns\",\"level\":{\"druid\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wallOfThorns.htm\"},{\"name\":\"Tiny Hut\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"6m\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Sphere\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/tinyHut.htm\"},{\"name\":\"Obscuring Mist\",\"level\":{\"adept\":\"1\",\"assassin\":\"1\",\"cleric\":\"1\",\"druid\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\"],\"range\":\"6m\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/obscuringMist.htm\"},{\"name\":\"Fog Cloud\",\"level\":{\"druid\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fogCloud.htm\"},{\"name\":\"Solid Fog\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/solidFog.htm\"},{\"name\":\"Acid Fog\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Acid\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/acidFog.htm\"},{\"name\":\"Mage Hand\",\"level\":{\"bard\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Concentration\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mageHand.htm\"},{\"name\":\"Contact Other Plane\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Divination\",\"components\":[\"V\"],\"range\":\"Personal\",\"duration\":[\"Concentration\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/contactOtherPlane.htm\"},{\"name\":\"Secret Chest\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Special\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/secretChest.htm\"},{\"name\":\"Contingency\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Personal\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/contingency.htm\"},{\"name\":\"Deeper Darkness\",\"level\":{\"adept\":\"3\",\"assassin\":\"3\",\"blackguard\":\"3\",\"cleric\":\"3\"},\"school\":\"Evocation\",\"descriptor\":[\"Darkness\"],\"components\":[\"V\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/deeperDarkness.htm\"},{\"name\":\"Liveoak\",\"level\":{\"druid\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/liveoak.htm\"},{\"name\":\"Magic Aura\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicAura.htm\"},{\"name\":\"Moment of Prescience\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/momentOfPrescience.htm\"},{\"name\":\"Tree Stride\",\"level\":{\"druid\":\"5\",\"ranger\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/treeStride.htm\"},{\"name\":\"False Life\",\"level\":{\"assassin\":\"3\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Personal\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/falseLife.htm\"},{\"name\":\"Tree Shape\",\"level\":{\"druid\":\"2\",\"ranger\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/treeShape.htm\"},{\"name\":\"Longstrider\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Personal\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/longstrider.htm\"},{\"name\":\"Reduce Animal\",\"level\":{\"druid\":\"2\",\"ranger\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/reduceAnimal.htm\"},{\"name\":\"Changestaff\",\"level\":{\"druid\":\"7\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/changestaff.htm\"},{\"name\":\"Rope Trick\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/ropeTrick.htm\"},{\"name\":\"Create Greater Undead\",\"level\":{\"cleric\":\"8\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/createGreaterUndead.htm\"},{\"name\":\"Create Undead\",\"level\":{\"cleric\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/createUndead.htm\"},{\"name\":\"Fabricate\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fabricate.htm\"},{\"name\":\"Knock\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/knock.htm\"},{\"name\":\"Commune with Nature\",\"level\":{\"druid\":\"5\",\"ranger\":\"4\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/communeWithNature.htm\"},{\"name\":\"Know Direction\",\"level\":{\"bard\":\"0\",\"druid\":\"0\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/knowDirection.htm\"},{\"name\":\"Mage's Lucubration\",\"level\":{\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magesLucubration.htm\"},{\"name\":\"Divination\",\"level\":{\"cleric\":\"4\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/divination.htm\"},{\"name\":\"Augury\",\"level\":{\"cleric\":\"2\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/augury.htm\"},{\"name\":\"Legend Lore\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/legendLore.htm\"},{\"name\":\"Mnemonic Enhancer\",\"level\":{\"wizard\":\"4\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mnemonicEnhancer.htm\"},{\"name\":\"Vision\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"XP\"],\"range\":\"Personal\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/vision.htm\"},{\"name\":\"Discern Location\",\"level\":{\"cleric\":\"8\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/discernLocation.htm\"},{\"name\":\"Rusting Grasp\",\"level\":{\"druid\":\"4\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/rustingGrasp.htm\"},{\"name\":\"Animate Dead\",\"level\":{\"adept\":\"3\",\"cleric\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animateDead.htm\"},{\"name\":\"Stone Shape\",\"level\":{\"cleric\":\"3\",\"druid\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Transmutation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/stoneShape.htm\"},{\"name\":\"Identify\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/identify.htm\"},{\"name\":\"Flame Arrow\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/flameArrow.htm\"},{\"name\":\"Message\",\"level\":{\"bard\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Transmutation\",\"descriptor\":[\"Language-Dependent\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/message.htm\"},{\"name\":\"Find Traps\",\"level\":{\"cleric\":\"2\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/findTraps.htm\"},{\"name\":\"Speak with Animals\",\"level\":{\"bard\":\"3\",\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/speakWithAnimals.htm\"},{\"name\":\"Speak with Plants\",\"level\":{\"druid\":\"3\",\"ranger\":\"2\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/speakWithPlants.htm\"},{\"name\":\"Meld into Stone\",\"level\":{\"cleric\":\"3\",\"druid\":\"3\"},\"school\":\"Transmutation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/meldIntoStone.htm\"},{\"name\":\"Stone Tell\",\"level\":{\"druid\":\"6\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/stoneTell.htm\"},{\"name\":\"Divine Favor\",\"level\":{\"cleric\":\"1\",\"paladin\":\"1\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/divineFavor.htm\"},{\"name\":\"Read Magic\",\"level\":{\"adept\":\"0\",\"bard\":\"0\",\"cleric\":\"0\",\"druid\":\"0\",\"paladin\":\"1\",\"ranger\":\"1\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/readMagic.htm\"},{\"name\":\"Spell Turning\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spellTurning.htm\"},{\"name\":\"Comprehend Languages\",\"level\":{\"adept\":\"1\",\"bard\":\"1\",\"cleric\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/comprehendLanguages.htm\"},{\"name\":\"Bless Weapon\",\"level\":{\"paladin\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blessWeapon.htm\"},{\"name\":\"Levitate\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/levitate.htm\"},{\"name\":\"Telepathic Bond\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/telepathicBond.htm\"},{\"name\":\"Hold Portal\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\"],\"range\":\"Medium\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holdPortal.htm\"},{\"name\":\"Glibness\",\"level\":{\"assassin\":\"4\",\"bard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/glibness.htm\"},{\"name\":\"Shield\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shield.htm\"},{\"name\":\"Mirror Image\",\"level\":{\"adept\":\"2\",\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mirrorImage.htm\"},{\"name\":\"Disguise Self\",\"level\":{\"assassin\":\"1\",\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/disguiseSelf.htm\"},{\"name\":\"Entropic Shield\",\"level\":{\"cleric\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/entropicShield.htm\"},{\"name\":\"Arcane Sight\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/arcaneSight.htm\"},{\"name\":\"Arcane Sight, Greater\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/arcaneSightGreater.htm\"},{\"name\":\"Invisibility Purge\",\"level\":{\"cleric\":\"3\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/invisibilityPurge.htm\"},{\"name\":\"Alter Self\",\"level\":{\"assassin\":\"2\",\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/alterSelf.htm\"},{\"name\":\"Expeditious Retreat\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/expeditiousRetreat.htm\"},{\"name\":\"Shapechange\",\"level\":{\"druid\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shapechange.htm\"},{\"name\":\"See Invisibility\",\"level\":{\"adept\":\"2\",\"bard\":\"3\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/seeInvisibility.htm\"},{\"name\":\"Iron Body\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/ironBody.htm\"},{\"name\":\"Gaseous Form\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/gaseousForm.htm\"},{\"name\":\"Darkness\",\"level\":{\"adept\":\"2\",\"assassin\":\"2\",\"bard\":\"2\",\"blackguard\":\"2\",\"cleric\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Darkness\"],\"components\":[\"V\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/darkness.htm\"},{\"name\":\"Light\",\"level\":{\"adept\":\"0\",\"bard\":\"0\",\"cleric\":\"0\",\"druid\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/light.htm\"},{\"name\":\"Daylight\",\"level\":{\"adept\":\"3\",\"bard\":\"3\",\"cleric\":\"3\",\"druid\":\"3\",\"paladin\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/daylight.htm\"},{\"name\":\"Polymorph\",\"level\":{\"adept\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/polymorph.htm\"},{\"name\":\"Instant Summons\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/instantSummons.htm\"},{\"name\":\"Snare\",\"level\":{\"druid\":\"3\",\"ranger\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/snare.htm\"},{\"name\":\"Continual Flame\",\"level\":{\"adept\":\"3\",\"cleric\":\"3\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/continualFlame.htm\"},{\"name\":\"Arcane Lock\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/arcaneLock.htm\"},{\"name\":\"Secret Page\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/secretPage.htm\"},{\"name\":\"Refuge\",\"level\":{\"cleric\":\"7\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/refuge.htm\"},{\"name\":\"Phantom Trap\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/phantomTrap.htm\"},{\"name\":\"Animate Objects\",\"level\":{\"bard\":\"6\",\"cleric\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animateObjects.htm\"},{\"name\":\"Animate Rope\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animateRope.htm\"},{\"name\":\"Time Stop\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Transmutation\",\"components\":[\"V\"],\"range\":\"Personal\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/timeStop.htm\"},{\"name\":\"True Strike\",\"level\":{\"assassin\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Divination\",\"components\":[\"V\",\"F\"],\"range\":\"Personal\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/trueStrike.htm\"},{\"name\":\"Divine Power\",\"level\":{\"cleric\":\"4\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/divinePower.htm\"},{\"name\":\"Transformation\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Personal\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/transformation.htm\"},{\"name\":\"Commune\",\"level\":{\"adept\":\"5\",\"cleric\":\"5\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"DF\",\"XP\"],\"range\":\"Personal\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/commune.htm\"},{\"name\":\"Transport via Plants\",\"level\":{\"druid\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/transportViaPlants.htm\"},{\"name\":\"Sending\",\"level\":{\"cleric\":\"4\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sending.htm\"},{\"name\":\"Holy Sword\",\"level\":{\"paladin\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holySword.htm\"},{\"name\":\"Blink\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blink.htm\"},{\"name\":\"Ethereal Jaunt\",\"level\":{\"cleric\":\"7\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/etherealJaunt.htm\"},{\"name\":\"Righteous Might\",\"level\":{\"cleric\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/righteousMight.htm\"},{\"name\":\"Fire Shield\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Personal\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fireShield.htm\"},{\"name\":\"Animate Plants\",\"level\":{\"druid\":\"7\"},\"school\":\"Transmutation\",\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animatePlants.htm\"},{\"name\":\"Fire Seeds\",\"level\":{\"druid\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Reflex\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fireSeeds.htm\"},{\"name\":\"Screen\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/screen.htm\"},{\"name\":\"Mislead\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Illusion\",\"subschool\":[\"Figment\",\"Glamer\"],\"components\":[\"S\"],\"range\":\"Close\",\"duration\":[\"Concentration\",\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mislead.htm\"},{\"name\":\"Misdirection\",\"level\":{\"assassin\":\"3\",\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/misdirection.htm\"},{\"name\":\"Analyze Dweomer\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/analyzeDweomer.htm\"},{\"name\":\"Prestidigitation\",\"level\":{\"bard\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Universal\",\"components\":[\"V\",\"S\"],\"range\":\"3m\",\"duration\":[\"Hours\"],\"aiming\":[\"Area\",\"Effect\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/prestidigitation.htm\"},{\"name\":\"Transmute Mud to Rock\",\"level\":{\"druid\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Permanent\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/transmuteMudToRock.htm\"},{\"name\":\"Transmute Rock to Mud\",\"level\":{\"druid\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Permanent\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/transmuteRockToMud.htm\"},{\"name\":\"Earthquake\",\"level\":{\"cleric\":\"8\",\"druid\":\"8\"},\"school\":\"Evocation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Shapeable\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/earthquake.htm\"},{\"name\":\"Grease\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/grease.htm\"},{\"name\":\"Wall of Iron\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wallOfIron.htm\"},{\"name\":\"Wall of Stone\",\"level\":{\"adept\":\"5\",\"cleric\":\"5\",\"druid\":\"6\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wallOfStone.htm\"},{\"name\":\"Break Enchantment\",\"level\":{\"adept\":\"5\",\"bard\":\"4\",\"cleric\":\"5\",\"paladin\":\"4\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/breakEnchantment.htm\"},{\"name\":\"Erase\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/erase.htm\"},{\"name\":\"Entangle\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Reflex\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/entangle.htm\"},{\"name\":\"Web\",\"level\":{\"adept\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"Reflex\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/web.htm\"},{\"name\":\"Incendiary Cloud\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"Reflex\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/incendiaryCloud.htm\"},{\"name\":\"Sepia Snake Sigil\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Reflex\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sepiaSnakeSigil.htm\"},{\"name\":\"Mage's Disjunction\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Abjuration\",\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magesDisjunction.htm\"},{\"name\":\"Detect Thoughts\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Divination\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Concentration\",\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Cone\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/detectThoughts.htm\"},{\"name\":\"Magic Circle against Law\",\"level\":{\"cleric\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"descriptor\":[\"Chaotic\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicCircleAgainstLaw.htm\"},{\"name\":\"Magic Circle against Good\",\"level\":{\"assassin\":\"3\",\"cleric\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicCircleAgainstGood.htm\"},{\"name\":\"Magic Circle against Evil\",\"level\":{\"cleric\":\"3\",\"paladin\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicCircleAgainstEvil.htm\"},{\"name\":\"Magic Circle against Chaos\",\"level\":{\"cleric\":\"3\",\"paladin\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"descriptor\":[\"Lawful\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicCircleAgainstChaos.htm\"},{\"name\":\"Mirage Arcana\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Concentration\",\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mirageArcana.htm\"},{\"name\":\"Hallucinatory Terrain\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Long\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/hallucinatoryTerrain.htm\"},{\"name\":\"Glitterdust\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/glitterdust.htm\"},{\"name\":\"Ventriloquism\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"F\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/ventriloquism.htm\"},{\"name\":\"Illusory Wall\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Permanent\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/illusoryWall.htm\"},{\"name\":\"Ghost Sound\",\"level\":{\"adept\":\"0\",\"assassin\":\"1\",\"bard\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/ghostSound.htm\"},{\"name\":\"Project Image\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/projectImage.htm\"},{\"name\":\"Silent Image\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Concentration\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/silentImage.htm\"},{\"name\":\"Major Image\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/majorImage.htm\"},{\"name\":\"Minor Image\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/minorImage.htm\"},{\"name\":\"Persistent Image\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/persistentImage.htm\"},{\"name\":\"Permanent Image\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/permanentImage.htm\"},{\"name\":\"Programmed Image\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Illusion\",\"subschool\":\"Figment\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Rounds\",\"Permanent\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/programmedImage.htm\"},{\"name\":\"Discern Lies\",\"level\":{\"cleric\":\"4\",\"paladin\":\"3\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/discernLies.htm\"},{\"name\":\"Mage Armor\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Creation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mageArmor.htm\"},{\"name\":\"Speak with Dead\",\"level\":{\"cleric\":\"3\"},\"school\":\"Necromancy\",\"descriptor\":[\"Language-Dependent\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"3m\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/speakWithDead.htm\"},{\"name\":\"Control Plants\",\"level\":{\"druid\":\"8\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/controlPlants.htm\"},{\"name\":\"Tongues\",\"level\":{\"adept\":\"3\",\"bard\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Divination\",\"components\":[\"V\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/tongues.htm\"},{\"name\":\"Protection from Law\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"descriptor\":[\"Chaotic\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/protectionFromLaw.htm\"},{\"name\":\"Protection from Good\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/protectionFromGood.htm\"},{\"name\":\"Protection from Evil\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\",\"paladin\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/protectionFromEvil.htm\"},{\"name\":\"Protection from Chaos\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\",\"paladin\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"descriptor\":[\"Lawful\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/protectionFromChaos.htm\"},{\"name\":\"Soul Bind\",\"level\":{\"cleric\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/soulBind.htm\"},{\"name\":\"Sanctuary\",\"level\":{\"cleric\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sanctuary.htm\"},{\"name\":\"Pyrotechnics\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Long\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/pyrotechnics.htm\"},{\"name\":\"Silence\",\"level\":{\"bard\":\"2\",\"cleric\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/silence.htm\"},{\"name\":\"Quench\",\"level\":{\"druid\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Target\",\"Shapeable\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/quench.htm\"},{\"name\":\"Sequester\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sequester.htm\"},{\"name\":\"Wind Walk\",\"level\":{\"cleric\":\"6\",\"druid\":\"7\"},\"school\":\"Transmutation\",\"descriptor\":[\"Air\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/windWalk.htm\"},{\"name\":\"Dimension Door\",\"level\":{\"assassin\":\"4\",\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dimensionDoor.htm\"},{\"name\":\"Teleport\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/teleport.htm\"},{\"name\":\"Teleport, Greater\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/teleportGreater.htm\"},{\"name\":\"Word of Recall\",\"level\":{\"cleric\":\"6\",\"druid\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wordOfRecall.htm\"},{\"name\":\"Find the Path\",\"level\":{\"bard\":\"6\",\"cleric\":\"6\",\"druid\":\"6\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/findThePath.htm\"},{\"name\":\"Foresight\",\"level\":{\"druid\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/foresight.htm\"},{\"name\":\"Glyph of Warding\",\"level\":{\"cleric\":\"3\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Area\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/glyphOfWarding.htm\"},{\"name\":\"Glyph of Warding, Greater\",\"level\":{\"cleric\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Area\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/glyphOfWardingGreater.htm\"},{\"name\":\"Seeming\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/seeming.htm\"},{\"name\":\"Planar Binding\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Calling\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/planarBinding.htm\"},{\"name\":\"Planar Binding, Greater\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Calling\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/planarBindingGreater.htm\"},{\"name\":\"Planar Binding, Lesser\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Calling\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"No\",\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/planarBindingLesser.htm\"},{\"name\":\"Antimagic Field\",\"level\":{\"cleric\":\"8\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"3m\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/antimagicField.htm\"},{\"name\":\"Unhallow\",\"level\":{\"cleric\":\"5\",\"druid\":\"5\"},\"school\":\"Evocation\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/unhallow.htm\"},{\"name\":\"Hallow\",\"level\":{\"cleric\":\"5\",\"druid\":\"5\"},\"school\":\"Evocation\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/hallow.htm\"},{\"name\":\"Guards and Wards\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Special\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/guardsAndWards.htm\"},{\"name\":\"Prismatic Wall\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/prismaticWall.htm\"},{\"name\":\"Prismatic Sphere\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Abjuration\",\"components\":[\"V\"],\"range\":\"3m\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Sphere\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/prismaticSphere.htm\"},{\"name\":\"Dispel Law\",\"level\":{\"cleric\":\"5\"},\"school\":\"Abjuration\",\"descriptor\":[\"Chaotic\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dispelLaw.htm\"},{\"name\":\"Dispel Good\",\"level\":{\"cleric\":\"5\"},\"school\":\"Abjuration\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dispelGood.htm\"},{\"name\":\"Dispel Evil\",\"level\":{\"cleric\":\"5\",\"paladin\":\"4\"},\"school\":\"Abjuration\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dispelEvil.htm\"},{\"name\":\"Dispel Chaos\",\"level\":{\"cleric\":\"5\",\"paladin\":\"4\"},\"school\":\"Abjuration\",\"descriptor\":[\"Lawful\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"No\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dispelChaos.htm\"},{\"name\":\"Circle of Death\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/circleOfDeath.htm\"},{\"name\":\"Wail of the Banshee\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\",\"Sonic\"],\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wailOfTheBanshee.htm\"},{\"name\":\"Sound Burst\",\"level\":{\"bard\":\"2\",\"cleric\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Sonic\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/soundBurst.htm\"},{\"name\":\"Symbol of Death\",\"level\":{\"cleric\":\"8\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\"],\"aiming\":[\"Effect\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfDeath.htm\"},{\"name\":\"Symbol of Weakness\",\"level\":{\"cleric\":\"7\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\",\"Minutes\"],\"aiming\":[\"Effect\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfWeakness.htm\"},{\"name\":\"Symbol of Pain\",\"level\":{\"cleric\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\",\"Rounds\"],\"aiming\":[\"Effect\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfPain.htm\"},{\"name\":\"Flare\",\"level\":{\"bard\":\"0\",\"druid\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Burst\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/flare.htm\"},{\"name\":\"Gust of Wind\",\"level\":{\"druid\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Air\"],\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Rounds\"],\"aiming\":[\"Effect\",\"Line\",\"Emanation\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/gustOfWind.htm\"},{\"name\":\"Energy Drain\",\"level\":{\"cleric\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/energyDrain.htm\"},{\"name\":\"Disintegrate\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/disintegrate.htm\"},{\"name\":\"Ray of Exhaustion\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/rayOfExhaustion.htm\"},{\"name\":\"Implosion\",\"level\":{\"cleric\":\"9\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/implosion.htm\"},{\"name\":\"Delay Poison\",\"level\":{\"adept\":\"2\",\"bard\":\"2\",\"cleric\":\"2\",\"druid\":\"2\",\"paladin\":\"2\",\"ranger\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/delayPoison.htm\"},{\"name\":\"Finger of Death\",\"level\":{\"druid\":\"8\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fingerOfDeath.htm\"},{\"name\":\"Destruction\",\"level\":{\"cleric\":\"7\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/destruction.htm\"},{\"name\":\"Horrid Wilting\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/horridWilting.htm\"},{\"name\":\"Flesh to Stone\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fleshToStone.htm\"},{\"name\":\"Slay Living\",\"level\":{\"cleric\":\"5\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/slayLiving.htm\"},{\"name\":\"Contagion\",\"level\":{\"adept\":\"3\",\"blackguard\":\"3\",\"cleric\":\"3\",\"druid\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/contagion.htm\"},{\"name\":\"Remove Blindness/Deafness\",\"level\":{\"cleric\":\"3\",\"paladin\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/removeBlindnessDeafness.htm\"},{\"name\":\"Remove Disease\",\"level\":{\"adept\":\"3\",\"cleric\":\"3\",\"druid\":\"3\",\"ranger\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/removeDisease.htm\"},{\"name\":\"Regenerate\",\"level\":{\"cleric\":\"7\",\"druid\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/regenerate.htm\"},{\"name\":\"Blight\",\"level\":{\"druid\":\"4\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blight.htm\"},{\"name\":\"Poison\",\"level\":{\"assassin\":\"4\",\"blackguard\":\"4\",\"cleric\":\"4\",\"druid\":\"3\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/poison.htm\"},{\"name\":\"Animal Growth\",\"level\":{\"druid\":\"5\",\"ranger\":\"4\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animalGrowth.htm\"},{\"name\":\"Protection from Energy\",\"level\":{\"blackguard\":\"3\",\"cleric\":\"3\",\"druid\":\"3\",\"ranger\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/protectionFromEnergy.htm\"},{\"name\":\"Resist Energy\",\"level\":{\"adept\":\"2\",\"cleric\":\"2\",\"druid\":\"2\",\"paladin\":\"2\",\"ranger\":\"1\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/resistEnergy.htm\"},{\"name\":\"Virtue\",\"level\":{\"cleric\":\"0\",\"druid\":\"0\",\"paladin\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/virtue.htm\"},{\"name\":\"Enlarge Person\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/enlargePerson.htm\"},{\"name\":\"Enlarge Person, Mass\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/enlargePersonMass.htm\"},{\"name\":\"Reduce Person\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/reducePerson.htm\"},{\"name\":\"Reduce Person, Mass\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/reducePersonMass.htm\"},{\"name\":\"Polymorph Any Object\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Hours\",\"Days\",\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/polymorphAnyObject.htm\"},{\"name\":\"Temporal Stasis\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/temporalStasis.htm\"},{\"name\":\"Blindness/Deafness\",\"level\":{\"bard\":\"2\",\"cleric\":\"3\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Necromancy\",\"components\":[\"V\"],\"range\":\"Medium\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blindnessDeafness.htm\"},{\"name\":\"Eyebite\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/eyebite.htm\"},{\"name\":\"Haste\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/haste.htm\"},{\"name\":\"Ghoul Touch\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/ghoulTouch.htm\"},{\"name\":\"Touch of Fatigue\",\"level\":{\"adept\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/touchOfFatigue.htm\"},{\"name\":\"Stone to Flesh\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\",\"Cylinder\"],\"save\":[\"Fortitude\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/stoneToFlesh.htm\"},{\"name\":\"Shout\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Sonic\"],\"components\":[\"V\"],\"range\":\"9m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"Fortitude\",\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shout.htm\"},{\"name\":\"Shout, Greater\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"18m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"Fortitude\",\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shoutGreater.htm\"},{\"name\":\"Shatter\",\"level\":{\"bard\":\"2\",\"blackguard\":\"2\",\"cleric\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Sonic\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Target\",\"Spread\"],\"save\":[\"Fortitude\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shatter.htm\"},{\"name\":\"Phantasmal Killer\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Illusion\",\"subschool\":\"Phantasm\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/phantasmalKiller.htm\"},{\"name\":\"Weird\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Illusion\",\"subschool\":\"Phantasm\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/weird.htm\"},{\"name\":\"Chill Touch\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/chillTouch.htm\"},{\"name\":\"Baleful Polymorph\",\"level\":{\"adept\":\"5\",\"druid\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"Fortitude\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/balefulPolymorph.htm\"},{\"name\":\"Transmute Metal to Wood\",\"level\":{\"druid\":\"7\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/transmuteMetalToWood.htm\"},{\"name\":\"Bless\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\",\"paladin\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"15m\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bless.htm\"},{\"name\":\"Faerie Fire\",\"level\":{\"druid\":\"1\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/faerieFire.htm\"},{\"name\":\"Prayer\",\"level\":{\"cleric\":\"3\",\"paladin\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"12m\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/prayer.htm\"},{\"name\":\"Waves of Fatigue\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"9m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wavesOfFatigue.htm\"},{\"name\":\"Waves of Exhaustion\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wavesOfExhaustion.htm\"},{\"name\":\"Ice Storm\",\"level\":{\"druid\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Cylinder\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/iceStorm.htm\"},{\"name\":\"Limited Wish\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Universal\",\"components\":[\"V\",\"S\",\"XP\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Area\",\"Effect\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/limitedWish.htm\"},{\"name\":\"Dimensional Lock\",\"level\":{\"cleric\":\"8\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Days\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dimensionalLock.htm\"},{\"name\":\"Desecrate\",\"level\":{\"cleric\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/desecrate.htm\"},{\"name\":\"Antilife Shell\",\"level\":{\"cleric\":\"6\",\"druid\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"3m\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/antilifeShell.htm\"},{\"name\":\"Antiplant Shell\",\"level\":{\"druid\":\"4\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"3m\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/antiplantShell.htm\"},{\"name\":\"Wall of Fire\",\"level\":{\"adept\":\"4\",\"druid\":\"5\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wallOfFire.htm\"},{\"name\":\"Teleportation Circle\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\",\"M\"],\"range\":\"Special\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/teleportationCircle.htm\"},{\"name\":\"Produce Flame\",\"level\":{\"druid\":\"1\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/produceFlame.htm\"},{\"name\":\"Flame Blade\",\"level\":{\"druid\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/flameBlade.htm\"},{\"name\":\"Mage's Sword\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magesSword.htm\"},{\"name\":\"Spiritual Weapon\",\"level\":{\"cleric\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spiritualWeapon.htm\"},{\"name\":\"Forceful Hand\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/forcefulHand.htm\"},{\"name\":\"Interposing Hand\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/interposingHand.htm\"},{\"name\":\"Clenched Fist\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/clenchedFist.htm\"},{\"name\":\"Grasping Hand\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/graspingHand.htm\"},{\"name\":\"Crushing Hand\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\",\"F\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/crushingHand.htm\"},{\"name\":\"Ray of Frost\",\"level\":{\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Evocation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/rayOfFrost.htm\"},{\"name\":\"Scorching Ray\",\"level\":{\"adept\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/scorchingRay.htm\"},{\"name\":\"Disrupt Undead\",\"level\":{\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/disruptUndead.htm\"},{\"name\":\"Enervation\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/enervation.htm\"},{\"name\":\"Polar Ray\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Evocation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/polarRay.htm\"},{\"name\":\"Searing Light\",\"level\":{\"cleric\":\"3\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/searingLight.htm\"},{\"name\":\"Ray of Enfeeblement\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/rayOfEnfeeblement.htm\"},{\"name\":\"Dimensional Anchor\",\"level\":{\"cleric\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Ray\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dimensionalAnchor.htm\"},{\"name\":\"Wind Wall\",\"level\":{\"cleric\":\"3\",\"druid\":\"3\",\"ranger\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Evocation\",\"descriptor\":[\"Air\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Effect\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/windWall.htm\"},{\"name\":\"Scintillating Pattern\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Illusion\",\"subschool\":\"Pattern\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/scintillatingPattern.htm\"},{\"name\":\"Rage\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Concentration\",\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/rage.htm\"},{\"name\":\"Animal Messenger\",\"level\":{\"bard\":\"2\",\"druid\":\"2\",\"ranger\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animalMessenger.htm\"},{\"name\":\"Goodberry\",\"level\":{\"druid\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/goodberry.htm\"},{\"name\":\"Geas/Quest\",\"level\":{\"bard\":\"6\",\"cleric\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Language-Dependent\",\"Mind-Affecting\"],\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/geasQuest.htm\"},{\"name\":\"Animal Shapes\",\"level\":{\"druid\":\"8\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animalShapes.htm\"},{\"name\":\"Power Word Kill\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Death\",\"Mind-Affecting\"],\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/powerWordKill.htm\"},{\"name\":\"Magic Missile\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicMissile.htm\"},{\"name\":\"Shocking Grasp\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Evocation\",\"descriptor\":[\"Electricity\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shockingGrasp.htm\"},{\"name\":\"Raise Dead\",\"level\":{\"adept\":\"5\",\"cleric\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/raiseDead.htm\"},{\"name\":\"Resurrection\",\"level\":{\"cleric\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/resurrection.htm\"},{\"name\":\"True Resurrection\",\"level\":{\"cleric\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/trueResurrection.htm\"},{\"name\":\"Reincarnate\",\"level\":{\"druid\":\"4\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/reincarnate.htm\"},{\"name\":\"Atonement\",\"level\":{\"cleric\":\"5\",\"druid\":\"5\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"F\",\"DF\",\"XP\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/atonement.htm\"},{\"name\":\"Vampiric Touch\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\",\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/vampiricTouch.htm\"},{\"name\":\"Giant Vermin\",\"level\":{\"cleric\":\"4\",\"druid\":\"4\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/giantVermin.htm\"},{\"name\":\"Dream\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Illusion\",\"subschool\":\"Phantasm\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dream.htm\"},{\"name\":\"Touch of Idiocy\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/touchOfIdiocy.htm\"},{\"name\":\"Air Walk\",\"level\":{\"cleric\":\"4\",\"druid\":\"4\"},\"school\":\"Transmutation\",\"descriptor\":[\"Air\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/airWalk.htm\"},{\"name\":\"Aid\",\"level\":{\"adept\":\"2\",\"cleric\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/aid.htm\"},{\"name\":\"Barkskin\",\"level\":{\"druid\":\"2\",\"ranger\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/barkskin.htm\"},{\"name\":\"Etherealness\",\"level\":{\"cleric\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/etherealness.htm\"},{\"name\":\"Mark of Justice\",\"level\":{\"cleric\":\"5\",\"paladin\":\"4\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/markOfJustice.htm\"},{\"name\":\"Power Word Stun\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/powerWordStun.htm\"},{\"name\":\"Irresistible Dance\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/irresistibleDance.htm\"},{\"name\":\"Sympathetic Vibration\",\"level\":{\"bard\":\"6\"},\"school\":\"Evocation\",\"descriptor\":[\"Sonic\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sympatheticVibration.htm\"},{\"name\":\"Maze\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/maze.htm\"},{\"name\":\"Power Word Blind\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Minutes\",\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/powerWordBlind.htm\"},{\"name\":\"Astral Projection\",\"level\":{\"cleric\":\"9\",\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Special\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/astralProjection.htm\"},{\"name\":\"Meteor Swarm\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"None\",\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/meteorSwarm.htm\"},{\"name\":\"Repel Vermin\",\"level\":{\"bard\":\"4\",\"cleric\":\"4\",\"druid\":\"4\",\"ranger\":\"3\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"3m\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/repelVermin.htm\"},{\"name\":\"Word of Chaos\",\"level\":{\"cleric\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Chaotic\",\"Sonic\"],\"components\":[\"V\"],\"range\":\"12m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wordOfChaos.htm\"},{\"name\":\"Blasphemy\",\"level\":{\"cleric\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Evil\",\"Sonic\"],\"components\":[\"V\"],\"range\":\"12m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blasphemy.htm\"},{\"name\":\"Holy Word\",\"level\":{\"cleric\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Good\",\"Sonic\"],\"components\":[\"V\"],\"range\":\"12m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holyWord.htm\"},{\"name\":\"Dictum\",\"level\":{\"cleric\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Lawful\",\"Sonic\"],\"components\":[\"V\"],\"range\":\"12m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dictum.htm\"},{\"name\":\"Telekinesis\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\",\"Concentration\"],\"aiming\":[\"Target\"],\"save\":[\"None\",\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/telekinesis.htm\"},{\"name\":\"Prismatic Spray\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\"],\"range\":\"18m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/prismaticSpray.htm\"},{\"name\":\"Wish\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Universal\",\"components\":[\"V\",\"XP\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Area\",\"Effect\",\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wish.htm\"},{\"name\":\"Forbiddance\",\"level\":{\"cleric\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Permanent\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/forbiddance.htm\"},{\"name\":\"Storm of Vengeance\",\"level\":{\"cleric\":\"9\",\"druid\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Concentration\",\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/stormOfVengeance.htm\"},{\"name\":\"Trap the Soul\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Summoning\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Close\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/trapTheSoul.htm\"},{\"name\":\"Explosive Runes\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/explosiveRunes.htm\"},{\"name\":\"Cloak of Chaos\",\"level\":{\"cleric\":\"8\"},\"school\":\"Abjuration\",\"descriptor\":[\"Chaotic\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"6m\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cloakOfChaos.htm\"},{\"name\":\"Unholy Aura\",\"level\":{\"cleric\":\"8\"},\"school\":\"Abjuration\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"6m\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/unholyAura.htm\"},{\"name\":\"Holy Aura\",\"level\":{\"cleric\":\"8\"},\"school\":\"Abjuration\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"6m\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holyAura.htm\"},{\"name\":\"Shield of Law\",\"level\":{\"cleric\":\"8\"},\"school\":\"Abjuration\",\"descriptor\":[\"Lawful\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"6m\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\",\"Burst\"],\"save\":[\"None\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shieldOfLaw.htm\"},{\"name\":\"Spike Stones\",\"level\":{\"druid\":\"4\"},\"school\":\"Transmutation\",\"descriptor\":[\"Earth\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spikeStones.htm\"},{\"name\":\"Spike Growth\",\"level\":{\"druid\":\"3\",\"ranger\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Area\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spikeGrowth.htm\"},{\"name\":\"Sunburst\",\"level\":{\"druid\":\"8\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sunburst.htm\"},{\"name\":\"Cone of Cold\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Evocation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/coneOfCold.htm\"},{\"name\":\"Burning Hands\",\"level\":{\"adept\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/burningHands.htm\"},{\"name\":\"Flame Strike\",\"level\":{\"cleric\":\"5\",\"druid\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cylinder\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/flameStrike.htm\"},{\"name\":\"Freezing Sphere\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Evocation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\",\"Rounds\"],\"aiming\":[\"Area\",\"Effect\",\"Target\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/freezingSphere.htm\"},{\"name\":\"Lightning Bolt\",\"level\":{\"adept\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Evocation\",\"descriptor\":[\"Electricity\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Line\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/lightningBolt.htm\"},{\"name\":\"Sunbeam\",\"level\":{\"druid\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Light\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"18m\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Line\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sunbeam.htm\"},{\"name\":\"Fire Storm\",\"level\":{\"cleric\":\"8\",\"druid\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Shapeable\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fireStorm.htm\"},{\"name\":\"Fireball\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fireball.htm\"},{\"name\":\"Delayed Blast Fireball\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Long\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/delayedBlastFireball.htm\"},{\"name\":\"Blade Barrier\",\"level\":{\"cleric\":\"6\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bladeBarrier.htm\"},{\"name\":\"Whirlwind\",\"level\":{\"druid\":\"8\"},\"school\":\"Evocation\",\"descriptor\":[\"Air\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Long\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/whirlwind.htm\"},{\"name\":\"Call Lightning Storm\",\"level\":{\"druid\":\"5\"},\"school\":\"Evocation\",\"descriptor\":[\"Electricity\"],\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Line\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/callLightningStorm.htm\"},{\"name\":\"Call Lightning\",\"level\":{\"druid\":\"3\"},\"school\":\"Evocation\",\"descriptor\":[\"Electricity\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Line\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/callLightning.htm\"},{\"name\":\"Wall of Ice\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\",\"Sphere\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/wallOfIce.htm\"},{\"name\":\"Resilient Sphere\",\"level\":{\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Sphere\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/resilientSphere.htm\"},{\"name\":\"Telekinetic Sphere\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Evocation\",\"descriptor\":[\"Force\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Sphere\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/telekineticSphere.htm\"},{\"name\":\"Flaming Sphere\",\"level\":{\"druid\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Evocation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Effect\",\"Sphere\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/flamingSphere.htm\"},{\"name\":\"Chain Lightning\",\"level\":{\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Evocation\",\"descriptor\":[\"Electricity\"],\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Long\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/chainLightning.htm\"},{\"name\":\"Fire Trap\",\"level\":{\"druid\":\"2\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Abjuration\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Reflex\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fireTrap.htm\"},{\"name\":\"Miracle\",\"level\":{\"cleric\":\"9\"},\"school\":\"Evocation\",\"descriptor\":[\"Special\"],\"components\":[\"V\",\"S\",\"XP\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Special\"],\"save\":[\"Special\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/miracle.htm\"},{\"name\":\"Bane\",\"level\":{\"cleric\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"15m\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bane.htm\"},{\"name\":\"Hypnotism\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/hypnotism.htm\"},{\"name\":\"Lullaby\",\"level\":{\"bard\":\"0\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Concentration\",\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/lullaby.htm\"},{\"name\":\"Undeath to Death\",\"level\":{\"cleric\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/undeathToDeath.htm\"},{\"name\":\"Chaos Hammer\",\"level\":{\"chaos\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Chaotic\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\",\"Rounds\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/chaosHammer.htm\"},{\"name\":\"Holy Smite\",\"level\":{\"good\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\",\"Rounds\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holySmite.htm\"},{\"name\":\"Order's Wrath\",\"level\":{\"law\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Lawful\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\",\"Rounds\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/ordersWrath.htm\"},{\"name\":\"Deep Slumber\",\"level\":{\"assassin\":\"3\",\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/deepSlumber.htm\"},{\"name\":\"Sleep\",\"level\":{\"adept\":\"1\",\"assassin\":\"1\",\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sleep.htm\"},{\"name\":\"Color Spray\",\"level\":{\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Illusion\",\"subschool\":\"Pattern\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/colorSpray.htm\"},{\"name\":\"Crushing Despair\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"9m\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/crushingDespair.htm\"},{\"name\":\"Fear\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Necromancy\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"9m\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Cone\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fear.htm\"},{\"name\":\"Zone of Truth\",\"level\":{\"cleric\":\"2\",\"paladin\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/zoneOfTruth.htm\"},{\"name\":\"Invisibility Sphere\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/invisibilitySphere.htm\"},{\"name\":\"Repulsion\",\"level\":{\"cleric\":\"7\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Emanation\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/repulsion.htm\"},{\"name\":\"Calm Emotions\",\"level\":{\"bard\":\"2\",\"cleric\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Concentration\",\"Rounds\",\"Dismissible\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/calmEmotions.htm\"},{\"name\":\"Unholy Blight\",\"level\":{\"evil\":\"4\"},\"school\":\"Evocation\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\",\"Rounds\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/unholyBlight.htm\"},{\"name\":\"Song of Discord\",\"level\":{\"bard\":\"5\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\",\"Sonic\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Area\",\"Spread\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/songOfDiscord.htm\"},{\"name\":\"Shades\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shades.htm\"},{\"name\":\"Shadow Conjuration\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shadowConjuration.htm\"},{\"name\":\"Shadow Conjuration, Greater\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shadowConjurationGreater.htm\"},{\"name\":\"Shadow Evocation\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shadowEvocation.htm\"},{\"name\":\"Shadow Evocation, Greater\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Special\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shadowEvocationGreater.htm\"},{\"name\":\"Scrying, Greater\",\"level\":{\"bard\":\"6\",\"cleric\":\"7\",\"druid\":\"7\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Divination\",\"subschool\":\"Scrying\",\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Hours\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/scryingGreater.htm\"},{\"name\":\"Scrying\",\"level\":{\"bard\":\"3\",\"cleric\":\"5\",\"druid\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Divination\",\"subschool\":\"Scrying\",\"components\":[\"V\",\"S\",\"M\",\"DF\",\"F\"],\"range\":\"Special\",\"duration\":[\"Minutes\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/scrying.htm\"},{\"name\":\"Symbol of Persuasion\",\"level\":{\"cleric\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Enchantment\",\"subschool\":\"Charm\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\",\"Minutes\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfPersuasion.htm\"},{\"name\":\"Symbol of Insanity\",\"level\":{\"cleric\":\"8\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\",\"Minutes\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfInsanity.htm\"},{\"name\":\"Symbol of Sleep\",\"level\":{\"cleric\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\",\"Minutes\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfSleep.htm\"},{\"name\":\"Symbol of Fear\",\"level\":{\"cleric\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Necromancy\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\",\"Minutes\",\"Rounds\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfFear.htm\"},{\"name\":\"Symbol of Stunning\",\"level\":{\"cleric\":\"7\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Special\",\"duration\":[\"Permanent\",\"Rounds\"],\"aiming\":[\"Effect\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/symbolOfStunning.htm\"},{\"name\":\"Hypnotic Pattern\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Pattern\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Concentration\",\"Rounds\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/hypnoticPattern.htm\"},{\"name\":\"Rainbow Pattern\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Illusion\",\"subschool\":\"Pattern\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Medium\",\"duration\":[\"Concentration\",\"Rounds\",\"Dismissible\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/rainbowPattern.htm\"},{\"name\":\"Mind Fog\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Minutes\"],\"aiming\":[\"Effect\",\"Spread\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mindFog.htm\"},{\"name\":\"Animal Trance\",\"level\":{\"adept\":\"2\",\"bard\":\"2\",\"druid\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\",\"Sonic\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Concentration\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/animalTrance.htm\"},{\"name\":\"Veil\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Long\",\"duration\":[\"Concentration\",\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/veil.htm\"},{\"name\":\"Charm Monster, Mass\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Charm\",\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/charmMonsterMass.htm\"},{\"name\":\"Command Plants\",\"level\":{\"druid\":\"4\",\"ranger\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/commandPlants.htm\"},{\"name\":\"Charm Monster\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Enchantment\",\"subschool\":\"Charm\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/charmMonster.htm\"},{\"name\":\"Dominate Monster\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dominateMonster.htm\"},{\"name\":\"Dominate Person\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dominatePerson.htm\"},{\"name\":\"Command Undead\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/commandUndead.htm\"},{\"name\":\"Shrink Item\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shrinkItem.htm\"},{\"name\":\"Gentle Repose\",\"level\":{\"cleric\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Days\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/gentleRepose.htm\"},{\"name\":\"Geas, Lesser\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/geasLesser.htm\"},{\"name\":\"Illusory Script\",\"level\":{\"assassin\":\"2\",\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Illusion\",\"subschool\":\"Phantasm\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Days\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/illusoryScript.htm\"},{\"name\":\"Binding\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Days\",\"Permanent\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/binding.htm\"},{\"name\":\"Suggestion\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Language-Dependent\",\"Mind-Affecting\"],\"components\":[\"V\",\"M\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/suggestion.htm\"},{\"name\":\"Charm Animal\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Charm\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/charmAnimal.htm\"},{\"name\":\"Charm Person\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Charm\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/charmPerson.htm\"},{\"name\":\"Mind Blank\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mindBlank.htm\"},{\"name\":\"Undetectable Alignment\",\"level\":{\"assassin\":\"2\",\"bard\":\"1\",\"cleric\":\"2\",\"paladin\":\"2\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/undetectableAlignment.htm\"},{\"name\":\"Magic Fang, Greater\",\"level\":{\"druid\":\"3\",\"ranger\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicFangGreater.htm\"},{\"name\":\"Magic Weapon, Greater\",\"level\":{\"cleric\":\"4\",\"paladin\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicWeaponGreater.htm\"},{\"name\":\"Suggestion, Mass\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"components\":[\"V\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/suggestionMass.htm\"},{\"name\":\"Enthrall\",\"level\":{\"bard\":\"2\",\"cleric\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Charm\",\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/enthrall.htm\"},{\"name\":\"Magic Jar\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Medium\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicJar.htm\"},{\"name\":\"Overland Flight\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Personal\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/overlandFlight.htm\"},{\"name\":\"Endure Elements\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\",\"druid\":\"1\",\"paladin\":\"1\",\"ranger\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/endureElements.htm\"},{\"name\":\"Status\",\"level\":{\"cleric\":\"2\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/status.htm\"},{\"name\":\"Magic Vestment\",\"level\":{\"cleric\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicVestment.htm\"},{\"name\":\"Protection from Arrows\",\"level\":{\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/protectionFromArrows.htm\"},{\"name\":\"Nondetection\",\"level\":{\"assassin\":\"3\",\"ranger\":\"4\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/nondetection.htm\"},{\"name\":\"Darkvision\",\"level\":{\"ranger\":\"3\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/darkvision.htm\"},{\"name\":\"Water Breathing\",\"level\":{\"cleric\":\"3\",\"druid\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Hours\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/waterBreathing.htm\"},{\"name\":\"Sculpt Sound\",\"level\":{\"bard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sculptSound.htm\"},{\"name\":\"Shield Other\",\"level\":{\"cleric\":\"2\",\"paladin\":\"2\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shieldOther.htm\"},{\"name\":\"Sympathy\",\"level\":{\"druid\":\"9\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/sympathy.htm\"},{\"name\":\"Antipathy\",\"level\":{\"druid\":\"9\",\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/antipathy.htm\"},{\"name\":\"Shadow Walk\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Illusion\",\"subschool\":\"Shadow\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shadowWalk.htm\"},{\"name\":\"Pass without Trace\",\"level\":{\"assassin\":\"2\",\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/passWithoutTrace.htm\"},{\"name\":\"Statue\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/statue.htm\"},{\"name\":\"Obscure Object\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Hours\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/obscureObject.htm\"},{\"name\":\"Mending\",\"level\":{\"adept\":\"0\",\"bard\":\"0\",\"cleric\":\"0\",\"druid\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"3m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/mending.htm\"},{\"name\":\"Purify Food and Drink\",\"level\":{\"adept\":\"0\",\"cleric\":\"0\",\"druid\":\"0\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"3m\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/purifyFoodAndDrink.htm\"},{\"name\":\"Cure Critical Wounds, Mass\",\"level\":{\"cleric\":\"8\",\"druid\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureCriticalWoundsMass.htm\"},{\"name\":\"Cure Light Wounds, Mass\",\"level\":{\"bard\":\"5\",\"cleric\":\"5\",\"druid\":\"6\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureLightWoundsMass.htm\"},{\"name\":\"Cure Moderate Wounds, Mass\",\"level\":{\"bard\":\"6\",\"cleric\":\"6\",\"druid\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureModerateWoundsMass.htm\"},{\"name\":\"Cure Serious Wounds, Mass\",\"level\":{\"cleric\":\"7\",\"druid\":\"8\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureSeriousWoundsMass.htm\"},{\"name\":\"Heal, Mass\",\"level\":{\"cleric\":\"9\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/healMass.htm\"},{\"name\":\"Remove Paralysis\",\"level\":{\"cleric\":\"2\",\"paladin\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/removeParalysis.htm\"},{\"name\":\"Freedom\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/freedom.htm\"},{\"name\":\"Inflict Critical Wounds, Mass\",\"level\":{\"cleric\":\"8\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictCriticalWoundsMass.htm\"},{\"name\":\"Inflict Light Wounds, Mass\",\"level\":{\"cleric\":\"5\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictLightWoundsMass.htm\"},{\"name\":\"Inflict Moderate Wounds, Mass\",\"level\":{\"cleric\":\"6\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictModerateWoundsMass.htm\"},{\"name\":\"Inflict Serious Wounds, Mass\",\"level\":{\"cleric\":\"7\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictSeriousWoundsMass.htm\"},{\"name\":\"Make Whole\",\"level\":{\"cleric\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/makeWhole.htm\"},{\"name\":\"Warp Wood\",\"level\":{\"druid\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/warpWood.htm\"},{\"name\":\"Dismissal\",\"level\":{\"cleric\":\"4\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dismissal.htm\"},{\"name\":\"Banishment\",\"level\":{\"cleric\":\"6\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/banishment.htm\"},{\"name\":\"Open/Close\",\"level\":{\"bard\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Close\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/openClose.htm\"},{\"name\":\"Insanity\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/insanity.htm\"},{\"name\":\"Feeblemind\",\"level\":{\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/feeblemind.htm\"},{\"name\":\"Nightmare\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Illusion\",\"subschool\":\"Phantasm\",\"descriptor\":[\"Evil\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Special\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/nightmare.htm\"},{\"name\":\"Teleport Object\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/teleportObject.htm\"},{\"name\":\"Cure Critical Wounds\",\"level\":{\"adept\":\"4\",\"bard\":\"4\",\"blackguard\":\"4\",\"cleric\":\"4\",\"druid\":\"5\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureCriticalWounds.htm\"},{\"name\":\"Cure Light Wounds\",\"level\":{\"adept\":\"1\",\"bard\":\"1\",\"blackguard\":\"1\",\"cleric\":\"1\",\"druid\":\"1\",\"paladin\":\"1\",\"ranger\":\"2\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureLightWounds.htm\"},{\"name\":\"Cure Minor Wounds\",\"level\":{\"adept\":\"0\",\"cleric\":\"0\",\"druid\":\"0\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureMinorWounds.htm\"},{\"name\":\"Cure Moderate Wounds\",\"level\":{\"adept\":\"2\",\"bard\":\"2\",\"blackguard\":\"2\",\"cleric\":\"2\",\"druid\":\"3\",\"paladin\":\"3\",\"ranger\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureModerateWounds.htm\"},{\"name\":\"Cure Serious Wounds\",\"level\":{\"adept\":\"3\",\"bard\":\"3\",\"blackguard\":\"3\",\"cleric\":\"3\",\"druid\":\"4\",\"paladin\":\"4\",\"ranger\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/cureSeriousWounds.htm\"},{\"name\":\"Heal\",\"level\":{\"adept\":\"5\",\"cleric\":\"6\",\"druid\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/heal.htm\"},{\"name\":\"Heal Mount\",\"level\":{\"paladin\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/healMount.htm\"},{\"name\":\"Restoration, Lesser\",\"level\":{\"cleric\":\"2\",\"druid\":\"2\",\"paladin\":\"1\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/restorationLesser.htm\"},{\"name\":\"Imprisonment\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/imprisonment.htm\"},{\"name\":\"Remove Curse\",\"level\":{\"adept\":\"3\",\"bard\":\"3\",\"cleric\":\"3\",\"paladin\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/removeCurse.htm\"},{\"name\":\"Harm\",\"level\":{\"cleric\":\"6\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/harm.htm\"},{\"name\":\"Inflict Critical Wounds\",\"level\":{\"blackguard\":\"4\",\"cleric\":\"4\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictCriticalWounds.htm\"},{\"name\":\"Inflict Light Wounds\",\"level\":{\"blackguard\":\"1\",\"cleric\":\"1\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictLightWounds.htm\"},{\"name\":\"Inflict Minor Wounds\",\"level\":{\"cleric\":\"0\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictMinorWounds.htm\"},{\"name\":\"Inflict Moderate Wounds\",\"level\":{\"blackguard\":\"2\",\"cleric\":\"2\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictModerateWounds.htm\"},{\"name\":\"Inflict Serious Wounds\",\"level\":{\"blackguard\":\"3\",\"cleric\":\"3\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/inflictSeriousWounds.htm\"},{\"name\":\"Wood Shape\",\"level\":{\"druid\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/woodShape.htm\"},{\"name\":\"Awaken\",\"level\":{\"druid\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\",\"XP\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/awaken.htm\"},{\"name\":\"Plane Shift\",\"level\":{\"cleric\":\"5\",\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Teleportation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/planeShift.htm\"},{\"name\":\"Curse Water\",\"level\":{\"cleric\":\"1\"},\"school\":\"Necromancy\",\"descriptor\":[\"Evil\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/curseWater.htm\"},{\"name\":\"Bless Water\",\"level\":{\"cleric\":\"1\",\"paladin\":\"1\"},\"school\":\"Transmutation\",\"descriptor\":[\"Good\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blessWater.htm\"},{\"name\":\"Restoration\",\"level\":{\"adept\":\"4\",\"cleric\":\"4\",\"paladin\":\"4\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/restoration.htm\"},{\"name\":\"Restoration, Greater\",\"level\":{\"cleric\":\"7\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"XP\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/restorationGreater.htm\"},{\"name\":\"Death Knell\",\"level\":{\"blackguard\":\"2\",\"cleric\":\"2\"},\"school\":\"Necromancy\",\"descriptor\":[\"Death\",\"Evil\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Instantaneous\",\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/deathKnell.htm\"},{\"name\":\"Calm Animals\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/calmAnimals.htm\"},{\"name\":\"Remove Fear\",\"level\":{\"bard\":\"1\",\"cleric\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/removeFear.htm\"},{\"name\":\"Keen Edge\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/keenEdge.htm\"},{\"name\":\"Bear's Endurance, Mass\",\"level\":{\"cleric\":\"6\",\"druid\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bearsEnduranceMass.htm\"},{\"name\":\"Control Undead\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/controlUndead.htm\"},{\"name\":\"Cat's Grace, Mass\",\"level\":{\"bard\":\"6\",\"druid\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/catsGraceMass.htm\"},{\"name\":\"Bull's Strength, Mass\",\"level\":{\"cleric\":\"6\",\"druid\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bullsStrengthMass.htm\"},{\"name\":\"Eagle's Splendor, Mass\",\"level\":{\"bard\":\"6\",\"cleric\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/eaglesSplendorMass.htm\"},{\"name\":\"Fox's Cunning, Mass\",\"level\":{\"bard\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/foxsCunningMass.htm\"},{\"name\":\"Owl's Wisdom, Mass\",\"level\":{\"cleric\":\"6\",\"druid\":\"6\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/owlsWisdomMass.htm\"},{\"name\":\"Good Hope\",\"level\":{\"bard\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/goodHope.htm\"},{\"name\":\"Doom\",\"level\":{\"blackguard\":\"1\",\"cleric\":\"1\"},\"school\":\"Necromancy\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/doom.htm\"},{\"name\":\"Heroism\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/heroism.htm\"},{\"name\":\"Heroism, Greater\",\"level\":{\"bard\":\"5\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/heroismGreater.htm\"},{\"name\":\"Guidance\",\"level\":{\"adept\":\"0\",\"cleric\":\"0\",\"druid\":\"0\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/guidance.htm\"},{\"name\":\"Spell Immunity\",\"level\":{\"cleric\":\"4\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spellImmunity.htm\"},{\"name\":\"Spell Immunity, Greater\",\"level\":{\"cleric\":\"8\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spellImmunityGreater.htm\"},{\"name\":\"Spell Resistance\",\"level\":{\"cleric\":\"5\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spellResistance.htm\"},{\"name\":\"Death Ward\",\"level\":{\"cleric\":\"4\",\"druid\":\"5\",\"paladin\":\"4\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/deathWard.htm\"},{\"name\":\"Align Weapon\",\"level\":{\"cleric\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/alignWeapon.htm\"},{\"name\":\"Bear's Endurance\",\"level\":{\"adept\":\"2\",\"blackguard\":\"2\",\"cleric\":\"2\",\"druid\":\"2\",\"paladin\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bearsEndurance.htm\"},{\"name\":\"Magic Fang\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicFang.htm\"},{\"name\":\"Magic Stone\",\"level\":{\"cleric\":\"1\",\"druid\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicStone.htm\"},{\"name\":\"Magic Weapon\",\"level\":{\"blackguard\":\"1\",\"cleric\":\"1\",\"paladin\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicWeapon.htm\"},{\"name\":\"Shillelagh\",\"level\":{\"druid\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shillelagh.htm\"},{\"name\":\"Fly\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/fly.htm\"},{\"name\":\"Shield of Faith\",\"level\":{\"cleric\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/shieldOfFaith.htm\"},{\"name\":\"Stoneskin\",\"level\":{\"adept\":\"4\",\"druid\":\"5\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/stoneskin.htm\"},{\"name\":\"True Seeing\",\"level\":{\"adept\":\"5\",\"cleric\":\"5\",\"sorcerer\":\"6\",\"wizard\":\"6\"},\"school\":\"Divination\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/trueSeeing.htm\"},{\"name\":\"Cat's Grace\",\"level\":{\"adept\":\"2\",\"assassin\":\"2\",\"bard\":\"2\",\"druid\":\"2\",\"ranger\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/catsGrace.htm\"},{\"name\":\"Spider Climb\",\"level\":{\"assassin\":\"2\",\"druid\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spiderClimb.htm\"},{\"name\":\"Neutralize Poison\",\"level\":{\"adept\":\"3\",\"bard\":\"4\",\"cleric\":\"4\",\"druid\":\"3\",\"paladin\":\"4\",\"ranger\":\"3\"},\"school\":\"Conjuration\",\"subschool\":\"Healing\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/neutralizePoison.htm\"},{\"name\":\"Freedom of Movement\",\"level\":{\"assassin\":\"4\",\"bard\":\"4\",\"blackguard\":\"4\",\"cleric\":\"4\",\"druid\":\"4\",\"ranger\":\"4\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/freedomOfMovement.htm\"},{\"name\":\"Resistance\",\"level\":{\"bard\":\"0\",\"cleric\":\"0\",\"druid\":\"0\",\"paladin\":\"1\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/resistance.htm\"},{\"name\":\"Bull's Strength\",\"level\":{\"adept\":\"2\",\"blackguard\":\"2\",\"cleric\":\"2\",\"druid\":\"2\",\"paladin\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bullsStrength.htm\"},{\"name\":\"Eagle's Splendor\",\"level\":{\"bard\":\"2\",\"blackguard\":\"2\",\"cleric\":\"2\",\"paladin\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/eaglesSplendor.htm\"},{\"name\":\"Fox's Cunning\",\"level\":{\"assassin\":\"2\",\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/foxsCunning.htm\"},{\"name\":\"Owl's Wisdom\",\"level\":{\"cleric\":\"2\",\"druid\":\"2\",\"paladin\":\"2\",\"ranger\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/owlsWisdom.htm\"},{\"name\":\"Protection from Spells\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"M\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Minutes\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/protectionFromSpells.htm\"},{\"name\":\"Invisibility, Mass\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Long\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/invisibilityMass.htm\"},{\"name\":\"Hide from Animals\",\"level\":{\"druid\":\"1\",\"ranger\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/hideFromAnimals.htm\"},{\"name\":\"Blur\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/blur.htm\"},{\"name\":\"Hide from Undead\",\"level\":{\"cleric\":\"1\"},\"school\":\"Abjuration\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/hideFromUndead.htm\"},{\"name\":\"Water Walk\",\"level\":{\"cleric\":\"3\",\"ranger\":\"3\"},\"school\":\"Transmutation\",\"descriptor\":[\"Water\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/waterWalk.htm\"},{\"name\":\"Jump\",\"level\":{\"assassin\":\"1\",\"druid\":\"1\",\"ranger\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/jump.htm\"},{\"name\":\"Invisibility\",\"level\":{\"adept\":\"2\",\"assassin\":\"2\",\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Minutes\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/invisibility.htm\"},{\"name\":\"Modify Memory\",\"level\":{\"assassin\":\"4\",\"bard\":\"4\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/modifyMemory.htm\"},{\"name\":\"Magic Mouth\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/magicMouth.htm\"},{\"name\":\"Bestow Curse\",\"level\":{\"adept\":\"3\",\"cleric\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Permanent\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/bestowCurse.htm\"},{\"name\":\"Imbue with Spell Ability\",\"level\":{\"cleric\":\"4\"},\"school\":\"Evocation\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/imbueWithSpellAbility.htm\"},{\"name\":\"Spellstaff\",\"level\":{\"druid\":\"6\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"F\"],\"range\":\"Touch\",\"duration\":[\"Permanent\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/spellstaff.htm\"},{\"name\":\"Command\",\"level\":{\"adept\":\"1\",\"cleric\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Language-Dependent\",\"Mind-Affecting\"],\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/command.htm\"},{\"name\":\"Command, Greater\",\"level\":{\"cleric\":\"5\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/commandGreater.htm\"},{\"name\":\"Feather Fall\",\"level\":{\"assassin\":\"1\",\"bard\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Transmutation\",\"components\":[\"V\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/featherFall.htm\"},{\"name\":\"Cause Fear\",\"level\":{\"adept\":\"1\",\"bard\":\"1\",\"blackguard\":\"1\",\"cleric\":\"1\",\"sorcerer\":\"1\",\"wizard\":\"1\"},\"school\":\"Necromancy\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/causeFear.htm\"},{\"name\":\"Dominate Animal\",\"level\":{\"druid\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dominateAnimal.htm\"},{\"name\":\"Chill Metal\",\"level\":{\"druid\":\"2\"},\"school\":\"Transmutation\",\"descriptor\":[\"Cold\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/chillMetal.htm\"},{\"name\":\"Heat Metal\",\"level\":{\"druid\":\"2\"},\"school\":\"Transmutation\",\"descriptor\":[\"Fire\"],\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/heatMetal.htm\"},{\"name\":\"Confusion, Lesser\",\"level\":{\"bard\":\"1\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"components\":[\"V\",\"S\",\"DF\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/confusionLesser.htm\"},{\"name\":\"Daze\",\"level\":{\"bard\":\"0\",\"sorcerer\":\"0\",\"wizard\":\"0\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/daze.htm\"},{\"name\":\"Hideous Laughter\",\"level\":{\"bard\":\"1\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/hideousLaughter.htm\"},{\"name\":\"Slow\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Close\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/slow.htm\"},{\"name\":\"Scare\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Necromancy\",\"descriptor\":[\"Fear\",\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/scare.htm\"},{\"name\":\"Daze Monster\",\"level\":{\"bard\":\"2\",\"sorcerer\":\"2\",\"wizard\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/dazeMonster.htm\"},{\"name\":\"Halt Undead\",\"level\":{\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Necromancy\",\"components\":[\"V\",\"S\",\"M\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/haltUndead.htm\"},{\"name\":\"Demand\",\"level\":{\"sorcerer\":\"8\",\"wizard\":\"8\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Special\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/demand.htm\"},{\"name\":\"Disrupting Weapon\",\"level\":{\"cleric\":\"5\"},\"school\":\"Transmutation\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/disruptingWeapon.htm\"},{\"name\":\"Hold Animal\",\"level\":{\"druid\":\"2\",\"ranger\":\"2\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holdAnimal.htm\"},{\"name\":\"Hold Person\",\"level\":{\"bard\":\"2\",\"cleric\":\"2\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holdPerson.htm\"},{\"name\":\"Hold Person, Mass\",\"level\":{\"sorcerer\":\"7\",\"wizard\":\"7\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"components\":[\"V\",\"S\",\"F\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holdPersonMass.htm\"},{\"name\":\"Hold Monster\",\"level\":{\"bard\":\"4\",\"sorcerer\":\"5\",\"wizard\":\"5\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holdMonster.htm\"},{\"name\":\"Hold Monster, Mass\",\"level\":{\"sorcerer\":\"9\",\"wizard\":\"9\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/holdMonsterMass.htm\"},{\"name\":\"Displacement\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"3\",\"wizard\":\"3\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"M\"],\"range\":\"Touch\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/displacement.htm\"},{\"name\":\"Invisibility, Greater\",\"level\":{\"assassin\":\"4\",\"bard\":\"4\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Illusion\",\"subschool\":\"Glamer\",\"components\":[\"V\",\"S\"],\"range\":\"Touch\",\"duration\":[\"Rounds\",\"Dismissible\"],\"aiming\":[\"Target\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/invisibilityGreater.htm\"},{\"name\":\"Confusion\",\"level\":{\"bard\":\"3\",\"sorcerer\":\"4\",\"wizard\":\"4\"},\"school\":\"Enchantment\",\"subschool\":\"Compulsion\",\"descriptor\":[\"Mind-Affecting\"],\"components\":[\"V\",\"S\",\"M\",\"DF\"],\"range\":\"Medium\",\"duration\":[\"Rounds\"],\"aiming\":[\"Target\",\"Burst\"],\"save\":[\"Will\"],\"sr\":[\"Yes\"],\"book\":[\"PHB\"],\"url\":\"http://www.d20srd.org/srd/spells/confusion.htm\"}]";
            
                    --local magicListData2 = NDB.load("magicListData2.xml");
                    --magicListData2.db = decode(str);
            
                    --for k,v in pairs(magicListData.db) do
                        --mesa.activeChat:escrever(k);
                        --mesa.activeChat:escrever(v);
                        --mesa.activeChat:escrever(magicListData.db[k].book);
                    --end
        end, obj);

    obj._e_event1 = obj:addEventListener("onNodeReady",
        function (_)
            return;
                    --[[
                    Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            updaterSheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    updaterSheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            rawset(updaterSheet, "stream", stream);
            
                            if updaterSheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            local install = Firecast.Plugins.installPlugin(rawget(updaterSheet,"stream"), true);
                                            if install==false then
                                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true');
                                            end;
                                        elseif selected and selectedIndex == 3 then
                                            updaterSheet.noUpdate = true;
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
                    --]]
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            local idioma = self.enemiesList:append();
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            local idioma = self.playersList:append();
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
            				updaterSheet.filteredSpells = {};
            				local index = 0;
            
            				-- Filtre as magias
            				for k,v in pairs(magicListData.db) do
            					local spell = magicListData.db[k];
            
            					local isName = filterName(spell);
            					if not isName then goto nextspell end;
            
            					local isClass = filterClass(spell);
            					if not isClass then goto nextspell end;
            
            					local isLevel = filterLevel(spell);
            					if not isLevel then goto nextspell end;
            
            					local isSchool = filterSchool(spell);
            					if not isSchool then goto nextspell end;
            
            					local isTag = filterTag(spell);
            					if not isTag then goto nextspell end;
            
            					local isComponent = filterComponent(spell);
            					if not isComponent then goto nextspell end;
            
            					local isRange = filterRange(spell);
            					if not isRange then goto nextspell end;
            
            					local isDuration = filterDuration(spell);
            					if not isDuration then goto nextspell end;
            
            					local isTarget = filterTarget(spell);
            					if not isTarget then goto nextspell end;
            
            					local isSave = filterSave(spell);
            					if not isSave then goto nextspell end;
            
            					local isSR = filterSR(spell);
            					if not isSR then goto nextspell end;
            
            					index = index +1;
            					updaterSheet.filteredSpells[index] = spell;
            					::nextspell::
            				end
            
            				--write(index);
            
            				-- Salve a quantidade de magias filtradas e de paginas
            				updaterSheet.numSpells = index;
            				updaterSheet.maxSpellPages = math.ceil(index/50);	
            
            				-- Delete o que ta no rcl atual
            		        local toDelete = NDB.getChildNodes(updaterSheet.spellList); 
            		        for i=1, #toDelete, 1 do
            		            NDB.deleteNode(toDelete[i]);
            		        end;
            
            		        -- Preencha o rcl com até as primeiras 50 magias
            		        local limit = math.min(index, 50);
            				for i=1, limit, 1 do
            					local spell = self.spellList:append();
            
            					spell.name = updaterSheet.filteredSpells[i].name;
            					local nome = tryLang(updaterSheet.filteredSpells[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(updaterSheet.filteredSpells[i].school);
            					spell.subschool = trans(updaterSheet.filteredSpells[i].subschool);
            					spell.url = updaterSheet.filteredSpells[i].url;
            					spell.level = classToText(updaterSheet.filteredSpells[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(updaterSheet.filteredSpells[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(updaterSheet.filteredSpells[i].components, #components);
            					spell.range = "Alcance: " .. trans(updaterSheet.filteredSpells[i].range);
            					spell.duration = "Duração: " .. arrayToText(updaterSheet.filteredSpells[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(updaterSheet.filteredSpells[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(updaterSheet.filteredSpells[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(updaterSheet.filteredSpells[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(updaterSheet.filteredSpells[i].book, #books);
            				end;
            				self.spellList:sort();
            				updaterSheet.SpellsPage = 1;
            
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

    obj._e_event28 = obj.spellList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.name, nodeB.name);
        end, obj);

    obj._e_event29 = obj.button24:addEventListener("onClick",
        function (_)
            -- Verifica se ta na primeira pagina
            				if self.scope.node==nil then return end;
            				if updaterSheet.SpellsPage==nil then return end;
            
            				if updaterSheet.SpellsPage==1 then return end;
            
            				-- Apaga pagina atual
            				local toDelete = NDB.getChildNodes(updaterSheet.spellList); 
            			    for i=1, #toDelete, 1 do
            			        NDB.deleteNode(toDelete[i]);
            			    end;
            
            				-- Passa para a pagina anterior
            				updaterSheet.SpellsPage = updaterSheet.SpellsPage - 1;
            
            				local mesa = Firecast.getMesaDe(sheet);
            
            				local filteredSpells = updaterSheet.filteredSpells;
            
            				local first = ((updaterSheet.SpellsPage-1)*50)+1;
            				local last = math.min(updaterSheet.SpellsPage*50, updaterSheet.numSpells);
            
            				for i=first, last, 1 do
            					local spell = self.spellList:append();
            
            					spell.name = updaterSheet.filteredSpells[i].name;
            					local nome = tryLang(updaterSheet.filteredSpells[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(updaterSheet.filteredSpells[i].school);
            					spell.subschool = trans(updaterSheet.filteredSpells[i].subschool);
            					spell.url = updaterSheet.filteredSpells[i].url;
            					spell.level = classToText(updaterSheet.filteredSpells[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(updaterSheet.filteredSpells[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(updaterSheet.filteredSpells[i].components, #components);
            					spell.range = "Alcance: " .. trans(updaterSheet.filteredSpells[i].range);
            					spell.duration = "Duração: " .. arrayToText(updaterSheet.filteredSpells[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(updaterSheet.filteredSpells[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(updaterSheet.filteredSpells[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(updaterSheet.filteredSpells[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(updaterSheet.filteredSpells[i].book, #books);
            				end;
            				self.spellList:sort();
            
            				-- Atualiza o tamanho do rcl
            				local spells = NDB.getChildNodes(updaterSheet.spellList);
        end, obj);

    obj._e_event30 = obj.button25:addEventListener("onClick",
        function (_)
            -- Verifica se ta na ultima pagina
            				if self.scope.node==nil then return end;
            				if updaterSheet.SpellsPage==nil then return end;
            
            				local filteredSpells = updaterSheet.filteredSpells;
            				if updaterSheet.SpellsPage>=updaterSheet.maxSpellPages then return end;
            
            				-- Apaga pagina atual
            				local toDelete = NDB.getChildNodes(updaterSheet.spellList); 
            			    for i=1, #toDelete, 1 do
            			        NDB.deleteNode(toDelete[i]);
            			    end;
            
            				-- Passa para a proxima pagina
            				updaterSheet.SpellsPage = updaterSheet.SpellsPage + 1;
            
            				local first = ((updaterSheet.SpellsPage-1)*50)+1;
            				local last = math.min(updaterSheet.SpellsPage*50, updaterSheet.numSpells);
            
            				for i=first, last, 1 do
            					local spell = self.spellList:append();
            					
            					spell.name = updaterSheet.filteredSpells[i].name;
            					local nome = tryLang(updaterSheet.filteredSpells[i].name);
            					if nome ~= nil then spell.name = spell.name .. " - " .. nome end;
            
            					spell.school = trans(updaterSheet.filteredSpells[i].school);
            					spell.subschool = trans(updaterSheet.filteredSpells[i].subschool);
            					spell.url = updaterSheet.filteredSpells[i].url;
            					spell.level = classToText(updaterSheet.filteredSpells[i].level);
            					spell.descriptor = "Descritores: " .. arrayToText(updaterSheet.filteredSpells[i].descriptor, #tags);
            					spell.components = "Componentes: " .. arrayToText(updaterSheet.filteredSpells[i].components, #components);
            					spell.range = "Alcance: " .. trans(updaterSheet.filteredSpells[i].range);
            					spell.duration = "Duração: " .. arrayToText(updaterSheet.filteredSpells[i].duration, #durations);
            					spell.aiming = "Alvo: " .. arrayToText(updaterSheet.filteredSpells[i].aiming, #targets);
            					spell.save = "Resistência: " .. arrayToText(updaterSheet.filteredSpells[i].save, #trs);
            					spell.sr = "RM: " .. arrayToText(updaterSheet.filteredSpells[i].sr, #srs);
            					spell.book = "Livro: " .. arrayToText(updaterSheet.filteredSpells[i].book, #books);
            				end;
            				self.spellList:sort();
            
            				-- Atualiza o tamanho do rcl
            				local spells = NDB.getChildNodes(updaterSheet.spellList); 
                    		self.spellList.height = #spells * 101;
        end, obj);

    function obj:_releaseEvents()
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

        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.spellListTab ~= nil then self.spellListTab:destroy(); self.spellListTab = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.frmXP ~= nil then self.frmXP:destroy(); self.frmXP = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.playersList ~= nil then self.playersList:destroy(); self.playersList = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.frmSpellsList ~= nil then self.frmSpellsList:destroy(); self.frmSpellsList = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.enemiesList ~= nil then self.enemiesList:destroy(); self.enemiesList = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.spellList ~= nil then self.spellList:destroy(); self.spellList = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.frmSpells ~= nil then self.frmSpells:destroy(); self.frmSpells = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.scope ~= nil then self.scope:destroy(); self.scope = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
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
