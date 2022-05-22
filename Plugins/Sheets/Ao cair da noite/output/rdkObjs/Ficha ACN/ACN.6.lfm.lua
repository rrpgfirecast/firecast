require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmACN6()
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
    obj:setName("frmACN6");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				if node:getClassName() == "recordList" then
					children = rclKids(node);
					--write(children[1]:getClassName());

					children = rclKids(children[1]);
				end;
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			function rclKids(rcl)
				local ret = {};
				local i;
				local childCount = _obj_getProp(rcl.handle, "ChildrenCount");
				local child;
				local childHandle;
				local idxDest = 1;
					
				for i = 0, childCount - 1, 1 do
					childHandle = _gui_getChild(rcl.handle, i);
					
					if (childHandle ~= nil) then							
						child = gui.fromHandle(childHandle);
						
						if (type(child) == "table") then							
							ret[idxDest] = child;
							idxDest = idxDest + 1;
						end
					end;	
				end
				
				return ret;
			end;

			local function findAllControls()
				local controlsList = {self};
				recursiveFindControls(self, controlsList);
				
				return controlsList;
			end;

			local function filterByClass(className, controls)
				local controlsFromClass = {};

				for i=1, #controls, 1 do
					if controls[i]:getClassName() == className then
						controlsFromClass[#controlsFromClass + 1] = controls[i];
					end;
				end;

				return controlsFromClass;
			end;

			local function findClass(className)
				local controls = findAllControls();
				return filterByClass(className, controls);
			end;

		


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(500);
    obj.image1:setHeight(500);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/Ficha ACN/images/RPGmeister.jpg");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(550);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(250);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Ficha ACN/images/SALEM.png");
    obj.image2:setName("image2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(550);
    obj.layout1:setTop(260);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(150);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setHeight(150);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(10);
    obj.label1:setWidth(200);
    obj.label1:setHeight(20);
    obj.label1:setText("Programador: Vinny (Ambesek)");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(0);
    obj.label2:setTop(35);
    obj.label2:setWidth(200);
    obj.label2:setHeight(20);
    obj.label2:setText("Arte: Nefer (Nefertyne)");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(0);
    obj.label3:setTop(60);
    obj.label3:setWidth(200);
    obj.label3:setHeight(20);
    obj.label3:setText("Consultor: Π (Pi)");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(0);
    obj.label4:setTop(95);
    obj.label4:setWidth(200);
    obj.label4:setHeight(20);
    obj.label4:setText("Ficha feita para a mesa SALEM");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(0);
    obj.label5:setTop(120);
    obj.label5:setWidth(200);
    obj.label5:setHeight(20);
    obj.label5:setText("Sistema: Ao Cair da Noite");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(550);
    obj.layout2:setTop(420);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(150);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(150);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(0);
    obj.label6:setTop(10);
    obj.label6:setWidth(80);
    obj.label6:setHeight(20);
    obj.label6:setText("Tema:");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("theme");
    obj.dataLink1:setDefaultValue("Escuro");
    obj.dataLink1:setName("dataLink1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(0);
    obj.label7:setTop(35);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("Cores: ");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(0);
    obj.label8:setTop(60);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("Fundo ");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout2);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setField("colorBackground");
    obj.dataLink2:setDefaultValue("#000000");
    obj.dataLink2:setName("dataLink2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(0);
    obj.label9:setTop(85);
    obj.label9:setWidth(90);
    obj.label9:setHeight(20);
    obj.label9:setText("Linhas ");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout2);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout2);
    obj.dataLink3:setField("colorStroke");
    obj.dataLink3:setDefaultValue("#FFFFFF");
    obj.dataLink3:setName("dataLink3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(0);
    obj.label10:setTop(110);
    obj.label10:setWidth(90);
    obj.label10:setHeight(20);
    obj.label10:setText("Fonte ");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout2);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout2);
    obj.dataLink4:setField("colorFont");
    obj.dataLink4:setDefaultValue("#FFFFFF");
    obj.dataLink4:setName("dataLink4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.scrollBox1);
    obj.label11:setLeft(0);
    obj.label11:setTop(505);
    obj.label11:setWidth(200);
    obj.label11:setHeight(20);
    obj.label11:setText("Versão Atual: ");
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setField("versionInstalled");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.scrollBox1);
    obj.label12:setLeft(0);
    obj.label12:setTop(530);
    obj.label12:setWidth(200);
    obj.label12:setHeight(20);
    obj.label12:setText("Sua Versão: ");
    obj.label12:setHorzTextAlign("leading");
    obj.label12:setField("versionDownloaded");
    obj.label12:setName("label12");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox1);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(555);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(180);
    obj.button1:setTop(505);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(180);
    obj.button2:setTop(530);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setName("button2");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.scrollBox1);
    obj.label13:setLeft(305);
    obj.label13:setTop(505);
    obj.label13:setWidth(200);
    obj.label13:setHeight(20);
    obj.label13:setText("Conheça as Mesas:");
    obj.label13:setName("label13");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(305);
    obj.button3:setTop(530);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(410);
    obj.button4:setTop(530);
    obj.button4:setWidth(100);
    obj.button4:setText("SALEM");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(180);
    obj.button5:setTop(555);
    obj.button5:setWidth(100);
    obj.button5:setHeight(20);
    obj.button5:setText("Exportar Ficha");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(180);
    obj.button6:setTop(580);
    obj.button6:setWidth(100);
    obj.button6:setHeight(20);
    obj.button6:setText("Importar Ficha");
    obj.button6:setName("button6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(760);
    obj.layout3:setTop(260);
    obj.layout3:setWidth(340);
    obj.layout3:setHeight(295);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(15);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle3:setName("rectangle3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
    obj.label14:setAlign("left");
    obj.label14:setWidth(75);
    obj.label14:setText("");
    obj.label14:setMargins({right=5});
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout4);
    obj.label15:setAlign("left");
    obj.label15:setWidth(40);
    obj.label15:setText("Inic");
    obj.label15:setMargins({right=5});
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout4);
    obj.label16:setAlign("left");
    obj.label16:setWidth(85);
    obj.label16:setText("Aprimoramento");
    obj.label16:setMargins({right=5});
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(11);
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout4);
    obj.label17:setAlign("left");
    obj.label17:setWidth(40);
    obj.label17:setText("Custo");
    obj.label17:setMargins({left=25,right=5});
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout4);
    obj.label18:setAlign("left");
    obj.label18:setWidth(40);
    obj.label18:setText("XP");
    obj.label18:setMargins({left=0,right=5});
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle3);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout5);
    obj.label19:setAlign("left");
    obj.label19:setWidth(75);
    obj.label19:setText("Atr. Físico");
    obj.label19:setMargins({right=5});
    obj.label19:setName("label19");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout5);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(40);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setMargins({right=5});
    obj.rectangle4:setName("rectangle4");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle4);
    obj.label20:setAlign("client");
    obj.label20:setField("auditini_atrFis");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout5);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(40);
    obj.edit1:setField("auditbonuscost_atrFis");
    obj.edit1:setMargins({right=5});
    obj.edit1:setType("float");
    obj.edit1:setDecimalPlaces(1);
    obj.edit1:setName("edit1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setMargins({right=5});
    obj.rectangle5:setName("rectangle5");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle5);
    obj.label21:setAlign("client");
    obj.label21:setField("auditbonus_atrFis");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(40);
    obj.edit2:setField("auditxpcost_atrFis");
    obj.edit2:setMargins({left=25,right=5});
    obj.edit2:setType("float");
    obj.edit2:setDecimalPlaces(1);
    obj.edit2:setName("edit2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout5);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setMargins({right=5});
    obj.rectangle6:setName("rectangle6");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle6);
    obj.label22:setAlign("client");
    obj.label22:setField("auditxp_atrFis");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle3);
    obj.dataLink5:setField("auditbonuscost_atrFis");
    obj.dataLink5:setDefaultValue("3");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle3);
    obj.dataLink6:setField("auditxpcost_atrFis");
    obj.dataLink6:setDefaultValue("3");
    obj.dataLink6:setName("dataLink6");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle3);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout6);
    obj.label23:setAlign("left");
    obj.label23:setWidth(75);
    obj.label23:setText("Atr. Mental");
    obj.label23:setMargins({right=5});
    obj.label23:setName("label23");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout6);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setMargins({right=5});
    obj.rectangle7:setName("rectangle7");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle7);
    obj.label24:setAlign("client");
    obj.label24:setField("auditini_atrMen");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(40);
    obj.edit3:setField("auditbonuscost_atrMen");
    obj.edit3:setMargins({right=5});
    obj.edit3:setType("float");
    obj.edit3:setDecimalPlaces(1);
    obj.edit3:setName("edit3");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout6);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(40);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setMargins({right=5});
    obj.rectangle8:setName("rectangle8");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle8);
    obj.label25:setAlign("client");
    obj.label25:setField("auditbonus_atrMen");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(40);
    obj.edit4:setField("auditxpcost_atrMen");
    obj.edit4:setMargins({left=25,right=5});
    obj.edit4:setType("float");
    obj.edit4:setDecimalPlaces(1);
    obj.edit4:setName("edit4");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout6);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setMargins({right=5});
    obj.rectangle9:setName("rectangle9");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle9);
    obj.label26:setAlign("client");
    obj.label26:setField("auditxp_atrMen");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle3);
    obj.dataLink7:setField("auditbonuscost_atrMen");
    obj.dataLink7:setDefaultValue("3");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle3);
    obj.dataLink8:setField("auditxpcost_atrMen");
    obj.dataLink8:setDefaultValue("3");
    obj.dataLink8:setName("dataLink8");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle3);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout7);
    obj.label27:setAlign("left");
    obj.label27:setWidth(75);
    obj.label27:setText("Apt. Físico");
    obj.label27:setMargins({right=5});
    obj.label27:setName("label27");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout7);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setMargins({right=5});
    obj.rectangle10:setName("rectangle10");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle10);
    obj.label28:setAlign("client");
    obj.label28:setField("auditini_aptFis");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(40);
    obj.edit5:setField("auditbonuscost_aptFis");
    obj.edit5:setMargins({right=5});
    obj.edit5:setType("float");
    obj.edit5:setDecimalPlaces(1);
    obj.edit5:setName("edit5");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout7);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setMargins({right=5});
    obj.rectangle11:setName("rectangle11");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle11);
    obj.label29:setAlign("client");
    obj.label29:setField("auditbonus_aptFis");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(40);
    obj.edit6:setField("auditxpcost_aptFis");
    obj.edit6:setMargins({left=25,right=5});
    obj.edit6:setType("float");
    obj.edit6:setDecimalPlaces(1);
    obj.edit6:setName("edit6");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout7);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setMargins({right=5});
    obj.rectangle12:setName("rectangle12");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle12);
    obj.label30:setAlign("client");
    obj.label30:setField("auditxp_aptFis");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle3);
    obj.dataLink9:setField("auditbonuscost_aptFis");
    obj.dataLink9:setDefaultValue("1");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle3);
    obj.dataLink10:setField("auditxpcost_aptFis");
    obj.dataLink10:setDefaultValue("1.5");
    obj.dataLink10:setName("dataLink10");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle3);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout8);
    obj.label31:setAlign("left");
    obj.label31:setWidth(75);
    obj.label31:setText("Apt. Mental");
    obj.label31:setMargins({right=5});
    obj.label31:setName("label31");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout8);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setMargins({right=5});
    obj.rectangle13:setName("rectangle13");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle13);
    obj.label32:setAlign("client");
    obj.label32:setField("auditini_aptMen");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(40);
    obj.edit7:setField("auditbonuscost_aptMen");
    obj.edit7:setMargins({right=5});
    obj.edit7:setType("float");
    obj.edit7:setDecimalPlaces(1);
    obj.edit7:setName("edit7");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout8);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(40);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setMargins({right=5});
    obj.rectangle14:setName("rectangle14");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle14);
    obj.label33:setAlign("client");
    obj.label33:setField("auditbonus_aptMen");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(40);
    obj.edit8:setField("auditxpcost_aptMen");
    obj.edit8:setMargins({left=25,right=5});
    obj.edit8:setType("float");
    obj.edit8:setDecimalPlaces(1);
    obj.edit8:setName("edit8");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout8);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setMargins({right=5});
    obj.rectangle15:setName("rectangle15");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle15);
    obj.label34:setAlign("client");
    obj.label34:setField("auditxp_aptMen");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle3);
    obj.dataLink11:setField("auditbonuscost_aptMen");
    obj.dataLink11:setDefaultValue("1");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle3);
    obj.dataLink12:setField("auditxpcost_aptMen");
    obj.dataLink12:setDefaultValue("1.5");
    obj.dataLink12:setName("dataLink12");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle3);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout9);
    obj.label35:setAlign("left");
    obj.label35:setWidth(75);
    obj.label35:setText("Especialização");
    obj.label35:setMargins({right=5});
    obj.label35:setFontSize(11);
    obj.label35:setName("label35");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(40);
    obj.edit9:setField("auditini_espec");
    obj.edit9:setMargins({right=5});
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout9);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(40);
    obj.edit10:setField("auditbonuscost_espec");
    obj.edit10:setMargins({right=5});
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout9);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(40);
    obj.edit11:setField("auditbonus_espec");
    obj.edit11:setMargins({right=5});
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout9);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(40);
    obj.edit12:setField("auditxpcost_espec");
    obj.edit12:setMargins({left=25,right=5});
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout9);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(40);
    obj.edit13:setField("auditxp_espec");
    obj.edit13:setName("edit13");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle3);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout10);
    obj.label36:setAlign("left");
    obj.label36:setWidth(75);
    obj.label36:setText("Historico");
    obj.label36:setMargins({right=5});
    obj.label36:setName("label36");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout10);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setMargins({right=5});
    obj.rectangle16:setName("rectangle16");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle16);
    obj.label37:setAlign("client");
    obj.label37:setField("auditini_hist");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout10);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(40);
    obj.edit14:setField("auditbonuscost_hist");
    obj.edit14:setMargins({right=5});
    obj.edit14:setType("float");
    obj.edit14:setDecimalPlaces(1);
    obj.edit14:setName("edit14");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout10);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(40);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setMargins({right=5});
    obj.rectangle17:setName("rectangle17");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle17);
    obj.label38:setAlign("client");
    obj.label38:setField("auditbonus_hist");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout10);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(40);
    obj.edit15:setField("auditxpcost_hist");
    obj.edit15:setMargins({left=25,right=5});
    obj.edit15:setType("float");
    obj.edit15:setDecimalPlaces(1);
    obj.edit15:setName("edit15");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout10);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setMargins({right=5});
    obj.rectangle18:setName("rectangle18");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle18);
    obj.label39:setAlign("client");
    obj.label39:setField("auditxp_hist");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle3);
    obj.dataLink13:setField("auditbonuscost_hist");
    obj.dataLink13:setDefaultValue("1");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle3);
    obj.dataLink14:setField("auditxpcost_hist");
    obj.dataLink14:setDefaultValue("2");
    obj.dataLink14:setName("dataLink14");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle3);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout11);
    obj.label40:setAlign("left");
    obj.label40:setWidth(75);
    obj.label40:setText("Eidolon");
    obj.label40:setMargins({right=5});
    obj.label40:setName("label40");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout11);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setMargins({right=5});
    obj.rectangle19:setName("rectangle19");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle19);
    obj.label41:setAlign("client");
    obj.label41:setField("auditini_eido");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout11);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(40);
    obj.edit16:setField("auditbonuscost_eido");
    obj.edit16:setMargins({right=5});
    obj.edit16:setType("float");
    obj.edit16:setDecimalPlaces(1);
    obj.edit16:setName("edit16");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout11);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setMargins({right=5});
    obj.rectangle20:setName("rectangle20");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle20);
    obj.label42:setAlign("client");
    obj.label42:setField("auditbonus_eido");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout11);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(40);
    obj.edit17:setField("auditxpcost_eido");
    obj.edit17:setMargins({left=25,right=5});
    obj.edit17:setType("float");
    obj.edit17:setDecimalPlaces(1);
    obj.edit17:setName("edit17");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout11);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setMargins({right=5});
    obj.rectangle21:setName("rectangle21");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle21);
    obj.label43:setAlign("client");
    obj.label43:setField("auditxp_eido");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle3);
    obj.dataLink15:setField("auditbonuscost_eido");
    obj.dataLink15:setDefaultValue("2");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle3);
    obj.dataLink16:setField("auditxpcost_eido");
    obj.dataLink16:setDefaultValue("1");
    obj.dataLink16:setName("dataLink16");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle3);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout12);
    obj.label44:setAlign("left");
    obj.label44:setWidth(75);
    obj.label44:setText("Outros");
    obj.label44:setMargins({right=5});
    obj.label44:setName("label44");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout12);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setMargins({right=5});
    obj.rectangle22:setName("rectangle22");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle22);
    obj.label45:setAlign("client");
    obj.label45:setField("auditini_out");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout12);
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(40);
    obj.edit18:setField("auditbonuscost_out");
    obj.edit18:setMargins({right=5});
    obj.edit18:setType("float");
    obj.edit18:setDecimalPlaces(1);
    obj.edit18:setName("edit18");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout12);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setMargins({right=5});
    obj.rectangle23:setName("rectangle23");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle23);
    obj.label46:setAlign("client");
    obj.label46:setField("auditbonus_out");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout12);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(40);
    obj.edit19:setField("auditxpcost_out");
    obj.edit19:setMargins({left=25,right=5});
    obj.edit19:setType("float");
    obj.edit19:setDecimalPlaces(1);
    obj.edit19:setName("edit19");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout12);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(40);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setMargins({right=5});
    obj.rectangle24:setName("rectangle24");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle24);
    obj.label47:setAlign("client");
    obj.label47:setField("auditxp_out");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle3);
    obj.dataLink17:setField("auditbonuscost_out");
    obj.dataLink17:setDefaultValue("5");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle3);
    obj.dataLink18:setField("auditxpcost_out");
    obj.dataLink18:setDefaultValue("5");
    obj.dataLink18:setName("dataLink18");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle3);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout13);
    obj.label48:setAlign("left");
    obj.label48:setWidth(75);
    obj.label48:setText("Extra");
    obj.label48:setMargins({right=5});
    obj.label48:setName("label48");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout13);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(40);
    obj.edit20:setField("auditini_extra");
    obj.edit20:setMargins({right=5});
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout13);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(40);
    obj.edit21:setField("auditbonuscost_extra");
    obj.edit21:setMargins({right=5});
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout13);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(40);
    obj.edit22:setField("auditbonus_extra");
    obj.edit22:setMargins({right=5});
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout13);
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(40);
    obj.edit23:setField("auditxpcost_extra");
    obj.edit23:setMargins({left=25,right=5});
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout13);
    obj.edit24:setAlign("left");
    obj.edit24:setWidth(40);
    obj.edit24:setField("auditxp_extra");
    obj.edit24:setName("edit24");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle3);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout14);
    obj.label49:setAlign("left");
    obj.label49:setWidth(75);
    obj.label49:setText("Total");
    obj.label49:setMargins({right=5});
    obj.label49:setName("label49");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(40);
    obj.layout15:setMargins({right=5});
    obj.layout15:setName("layout15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(40);
    obj.layout16:setMargins({right=5});
    obj.layout16:setName("layout16");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout14);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(40);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setMargins({right=5});
    obj.rectangle25:setName("rectangle25");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle25);
    obj.label50:setAlign("client");
    obj.label50:setField("auditbonus_total");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout14);
    obj.edit25:setAlign("left");
    obj.edit25:setWidth(40);
    obj.edit25:setField("XP");
    obj.edit25:setMargins({left=25});
    obj.edit25:setName("edit25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout14);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(40);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setMargins({right=5});
    obj.rectangle26:setName("rectangle26");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle26);
    obj.label51:setAlign("client");
    obj.label51:setField("auditxp_total");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout3);
    obj.dataLink19:setFields({'inicialforca', 'inicialagilidade', 'inicialresiliencia'});
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout3);
    obj.dataLink20:setFields({'bonusforca', 'bonusagilidade', 'bonusresiliencia','auditbonuscost_atrFis'});
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout3);
    obj.dataLink21:setFields({'xpforca', 'xpagilidade', 'xpresiliencia', 'testeforca', 'testeagilidade', 'testeresiliencia','auditxpcost_atrFis', 'outroforca', 'outroagilidade', 'outroresiliencia'});
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout3);
    obj.dataLink22:setFields({'inicialcarisma', 'inicialpercepcao', 'inicialperspicacia'});
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout3);
    obj.dataLink23:setFields({'bonuscarisma', 'bonuspercepcao', 'bonusperspicacia','auditbonuscost_atrMen'});
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout3);
    obj.dataLink24:setFields({'xpcarisma', 'xppercepcao', 'xpperspicacia', 'testecarisma', 'testepercepcao', 'testeperspicacia','auditxpcost_atrMen', 'outrocarisma', 'outropercepcao', 'outroperspicacia'});
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout3);
    obj.dataLink25:setFields({'base0_1', 'base0_2', 'base0_3', 'base0_4', 'base0_5', 'base0_6', 'base0_7', 'base0_8', 'base0_9', 'base0_10', 'base0_11', 'base0_12', 'base2_1', 'base2_2', 'base2_3', 'base2_4', 'base2_5', 'base2_6', 'base2_7', 'base2_8', 'base2_9', 'base2_10', 'base2_11', 'base2_12'});
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout3);
    obj.dataLink26:setFields({'bonus0_1', 'bonus0_2', 'bonus0_3', 'bonus0_4', 'bonus0_5', 'bonus0_6', 'bonus0_7', 'bonus0_8', 'bonus0_9', 'bonus0_10', 'bonus0_11', 'bonus0_12', 'bonus2_1', 'bonus2_2', 'bonus2_3', 'bonus2_4', 'bonus2_5', 'bonus2_6', 'bonus2_7', 'bonus2_8', 'bonus2_9', 'bonus2_10', 'bonus2_11', 'bonus2_12','auditbonuscost_aptFis'});
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout3);
    obj.dataLink27:setFields({'xp0_1', 'xp0_2', 'xp0_3', 'xp0_4', 'xp0_5', 'xp0_6', 'xp0_7', 'xp0_8', 'xp0_9', 'xp0_10', 'xp0_11', 'xp0_12', 'xp2_1', 'xp2_2', 'xp2_3', 'xp2_4', 'xp2_5', 'xp2_6', 'xp2_7', 'xp2_8', 'xp2_9', 'xp2_10', 'xp2_11', 'xp2_12', 'total0_1', 'total0_2', 'total0_3', 'total0_4', 'total0_5', 'total0_6', 'total0_7', 'total0_8', 'total0_9', 'total0_10', 'total0_11', 'total0_12', 'total2_1', 'total2_2', 'total2_3', 'total2_4', 'total2_5', 'total2_6', 'total2_7', 'total2_8', 'total2_9', 'total2_10', 'total2_11', 'total2_12','auditxpcost_aptFis'});
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout3);
    obj.dataLink28:setFields({'base1_1', 'base1_2', 'base1_3', 'base1_4', 'base1_5', 'base1_6', 'base1_7', 'base1_8', 'base1_9', 'base1_10', 'base1_11', 'base1_12', 'base3_1', 'base3_2', 'base3_3', 'base3_4', 'base3_5', 'base3_6', 'base3_7', 'base3_8', 'base3_9', 'base3_10', 'base3_11', 'base3_12'});
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout3);
    obj.dataLink29:setFields({'bonus1_1', 'bonus1_2', 'bonus1_3', 'bonus1_4', 'bonus1_5', 'bonus1_6', 'bonus1_7', 'bonus1_8', 'bonus1_9', 'bonus1_10', 'bonus1_11', 'bonus1_12', 'bonus3_1', 'bonus3_2', 'bonus3_3', 'bonus3_4', 'bonus3_5', 'bonus3_6', 'bonus3_7', 'bonus3_8', 'bonus3_9', 'bonus3_10', 'bonus3_11', 'bonus3_12','auditbonuscost_aptMen'});
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout3);
    obj.dataLink30:setFields({'xp1_1', 'xp1_2', 'xp1_3', 'xp1_4', 'xp1_5', 'xp1_6', 'xp1_7', 'xp1_8', 'xp1_9', 'xp1_10', 'xp1_11', 'xp1_12', 'xp3_1', 'xp3_2', 'xp3_3', 'xp3_4', 'xp3_5', 'xp3_6', 'xp3_7', 'xp3_8', 'xp3_9', 'xp3_10', 'xp3_11', 'xp3_12', 'total1_1', 'total1_2', 'total1_3', 'total1_4', 'total1_5', 'total1_6', 'total1_7', 'total1_8', 'total1_9', 'total1_10', 'total1_11', 'total1_12', 'total3_1', 'total3_2', 'total3_3', 'total3_4', 'total3_5', 'total3_6', 'total3_7', 'total3_8', 'total3_9', 'total3_10', 'total3_11', 'total3_12','auditxpcost_aptMen'});
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout3);
    obj.dataLink31:setFields({'historicoValor1_1', 'historicoValor1_2', 'historicoValor1_3', 'historicoValor1_4', 'historicoValor1_5', 'historicoValor1_6', 'historicoValor2_1', 'historicoValor2_2', 'historicoValor2_3', 'historicoValor2_4', 'historicoValor2_5', 'historicoValor2_6', 'historicoValor3_1', 'historicoValor3_2', 'historicoValor3_3', 'historicoValor3_4', 'historicoValor3_5', 'historicoValor3_6'});
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout3);
    obj.dataLink32:setFields({'historicoBonus1_1', 'historicoBonus1_2', 'historicoBonus1_3', 'historicoBonus1_4', 'historicoBonus1_5', 'historicoBonus1_6', 'historicoBonus2_1', 'historicoBonus2_2', 'historicoBonus2_3', 'historicoBonus2_4', 'historicoBonus2_5', 'historicoBonus2_6', 'historicoBonus3_1', 'historicoBonus3_2', 'historicoBonus3_3', 'historicoBonus3_4', 'historicoBonus3_5', 'historicoBonus3_6','auditbonuscost_hist'});
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout3);
    obj.dataLink33:setFields({'historicoXp1_1', 'historicoXp1_2', 'historicoXp1_3', 'historicoXp1_4', 'historicoXp1_5', 'historicoXp1_6', 'historicoXp2_1', 'historicoXp2_2', 'historicoXp2_3', 'historicoXp2_4', 'historicoXp2_5', 'historicoXp2_6', 'historicoXp3_1', 'historicoXp3_2', 'historicoXp3_3', 'historicoXp3_4', 'historicoXp3_5', 'historicoXp3_6', 'historicoTotal1_1', 'historicoTotal1_2', 'historicoTotal1_3', 'historicoTotal1_4', 'historicoTotal1_5', 'historicoTotal1_6', 'historicoTotal2_1', 'historicoTotal2_2', 'historicoTotal2_3', 'historicoTotal2_4', 'historicoTotal2_5', 'historicoTotal2_6', 'historicoTotal3_1', 'historicoTotal3_2', 'historicoTotal3_3', 'historicoTotal3_4', 'historicoTotal3_5', 'historicoTotal3_6','auditxpcost_hist'});
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout3);
    obj.dataLink34:setFields({'inicialconsciencia', 'inicialespirito', 'inicialperseveranca'});
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout3);
    obj.dataLink35:setFields({'bonusconsciencia', 'bonusespirito', 'bonusperseveranca','auditbonuscost_eido'});
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout3);
    obj.dataLink36:setFields({'xpconsciencia', 'xpespirito', 'xpperseveranca', 'testeconsciencia', 'testeespirito', 'testeperseveranca','auditxpcost_eido', 'outroconsciencia', 'outroespirito', 'outroperseveranca'});
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout3);
    obj.dataLink37:setFields({'auditbonus_atrFis', 'auditbonus_atrMen', 'auditbonus_aptFis', 'auditbonus_aptMen', 'auditbonus_hist', 'auditbonus_eido', 'auditbonus_out', 'auditbonus_espec', 'auditbonus_extra'});
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout3);
    obj.dataLink38:setFields({'auditxp_atrFis', 'auditxp_atrMen', 'auditxp_aptFis', 'auditxp_aptMen', 'auditxp_hist', 'auditxp_eido', 'auditxp_out', 'auditxp_espec', 'auditxp_extra'});
    obj.dataLink38:setName("dataLink38");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Claro" then
            						theme = "light";
            					else
            						theme = "dark";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fontColor = sheet.colorFont or "#FFFFFF";
            
            					local controls = findAllControls();
            					
            					local edits = filterByClass("edit", controls);
            					for i=1, #edits, 1 do 
            						edits[i].fontColor = fontColor;
            					end;
            
            					local labels = filterByClass("label", controls);
            					for i=1, #labels, 1 do 
            						labels[i].fontColor = fontColor;
            					end;
            
            					local comboBoxs = filterByClass("comboBox", controls);
            					for i=1, #comboBoxs, 1 do 
            						comboBoxs[i].fontColor = fontColor;
            					end;
            
            					local textEditors = filterByClass("textEditor", controls);
            					for i=1, #textEditors, 1 do 
            						textEditors[i].fontColor = fontColor;
            					end;
            
            					local checkBoxs = filterByClass("checkBox", controls);
            					for i=1, #checkBoxs, 1 do 
            						checkBoxs[i].fontColor = fontColor;
            					end;
            
            					local buttons = filterByClass("button", controls);
            					for i=1, #buttons, 1 do 
            						buttons[i].fontColor = fontColor;
            					end;
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/README.md')
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/output/Ao%20cair%20da%20noite.rpk?raw=true')
        end, obj);

    obj._e_event6 = obj.button3:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=97151');
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(sheet);
            
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

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            
            						local import = {};
            						local bytes = arq.stream:read(import, arq.stream.size);
            
            						local xml = Utils.binaryDecode(import, "utf8");
            
            						NDB.importXML(sheet, xml);
            					end);
        end, obj);

    obj._e_event10 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = (tonumber(sheet.inicialforca) or 0) + 
            									(tonumber(sheet.inicialagilidade) or 0) + 
            									(tonumber(sheet.inicialresiliencia) or 0);
            					sheet.auditini_atrFis = fisicos;
        end, obj);

    obj._e_event11 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = (tonumber(sheet.bonusforca) or 0) + 
            									(tonumber(sheet.bonusagilidade) or 0) + 
            									(tonumber(sheet.bonusresiliencia) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_atrFis) or 1);
            					sheet.auditbonus_atrFis = fisicos * mult;
        end, obj);

    obj._e_event12 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = 0;
            					local mult = (tonumber(sheet.auditxpcost_atrFis) or 1);
            
            					local valores = {
            									((tonumber(sheet.testeforca) or 0)*2 - (tonumber(sheet.xpforca) or 0) - (tonumber(sheet.outroforca) or 0)), 
            									((tonumber(sheet.testeagilidade) or 0)*2 - (tonumber(sheet.xpagilidade) or 0) - (tonumber(sheet.outroagilidade) or 0)), 
            									((tonumber(sheet.testeresiliencia) or 0)*2 - (tonumber(sheet.xpresiliencia) or 0) - (tonumber(sheet.outroresiliencia) or 0)) };
            					
            					local limites = {	(tonumber(sheet.xpforca) or 0),
            										(tonumber(sheet.xpagilidade) or 0),
            										(tonumber(sheet.xpresiliencia) or 0)}
            					
            					for i=1, 3, 1 do
            						for j=1, limites[i], 1 do
            							fisicos = fisicos + (valores[i]+j)*mult;
            						end;
            					end;
            
            
            					sheet.auditxp_atrFis = fisicos;
        end, obj);

    obj._e_event13 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.inicialcarisma) or 0) + 
            									(tonumber(sheet.inicialpercepcao) or 0) + 
            									(tonumber(sheet.inicialperspicacia) or 0);
            					sheet.auditini_atrMen = mentais;
        end, obj);

    obj._e_event14 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.bonuscarisma) or 0) + 
            									(tonumber(sheet.bonuspercepcao) or 0) + 
            									(tonumber(sheet.bonusperspicacia) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_atrMen) or 1);
            					sheet.auditbonus_atrMen = mentais * mult;
        end, obj);

    obj._e_event15 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = 0;
            					local mult = (tonumber(sheet.auditxpcost_atrMen) or 1);
            
            					local valores = {   ((tonumber(sheet.testecarisma) or 0)*2 - (tonumber(sheet.xpcarisma) or 0) - (tonumber(sheet.outrocarisma) or 0)), 
            										((tonumber(sheet.testepercepcao) or 0)*2 - (tonumber(sheet.xppercepcao) or 0) - (tonumber(sheet.outropercepcao) or 0)),
            										((tonumber(sheet.testeperspicacia) or 0)*2 - (tonumber(sheet.xpperspicacia) or 0) - (tonumber(sheet.outroperspicacia) or 0)) };
            					
            					local limites = {	(tonumber(sheet.xpcarisma) or 0),
            										(tonumber(sheet.xppercepcao) or 0),
            										(tonumber(sheet.xpperspicacia) or 0)}
            					
            					for i=1, 3, 1 do
            						for j=1, limites[i], 1 do
            							mentais = mentais + (valores[i]+j)*mult;
            						end;
            					end;
            					sheet.auditxp_atrMen = mentais;
        end, obj);

    obj._e_event16 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = (tonumber(sheet.base0_1) or 0) + (tonumber(sheet.base0_2) or 0) + (tonumber(sheet.base0_3) or 0) + (tonumber(sheet.base0_4) or 0) + (tonumber(sheet.base0_5) or 0) + (tonumber(sheet.base0_6) or 0) + (tonumber(sheet.base0_7) or 0) + (tonumber(sheet.base0_8) or 0) + (tonumber(sheet.base0_9) or 0) + (tonumber(sheet.base0_10) or 0) + (tonumber(sheet.base0_11) or 0) + (tonumber(sheet.base0_12) or 0) + (tonumber(sheet.base2_1) or 0) + (tonumber(sheet.base2_2) or 0) + (tonumber(sheet.base2_3) or 0) + (tonumber(sheet.base2_4) or 0) + (tonumber(sheet.base2_5) or 0) + (tonumber(sheet.base2_6) or 0) + (tonumber(sheet.base2_7) or 0) + (tonumber(sheet.base2_8) or 0) + (tonumber(sheet.base2_9) or 0) + (tonumber(sheet.base2_10) or 0) + (tonumber(sheet.base2_11) or 0) + (tonumber(sheet.base2_12) or 0);
            					sheet.auditini_aptFis = fisicos;
        end, obj);

    obj._e_event17 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = (tonumber(sheet.bonus0_1) or 0) + (tonumber(sheet.bonus0_2) or 0) + (tonumber(sheet.bonus0_3) or 0) + (tonumber(sheet.bonus0_4) or 0) + (tonumber(sheet.bonus0_5) or 0) + (tonumber(sheet.bonus0_6) or 0) + (tonumber(sheet.bonus0_7) or 0) + (tonumber(sheet.bonus0_8) or 0) + (tonumber(sheet.bonus0_9) or 0) + (tonumber(sheet.bonus0_10) or 0) + (tonumber(sheet.bonus0_11) or 0) + (tonumber(sheet.bonus0_12) or 0) + (tonumber(sheet.bonus2_1) or 0) + (tonumber(sheet.bonus2_2) or 0) + (tonumber(sheet.bonus2_3) or 0) + (tonumber(sheet.bonus2_4) or 0) + (tonumber(sheet.bonus2_5) or 0) + (tonumber(sheet.bonus2_6) or 0) + (tonumber(sheet.bonus2_7) or 0) + (tonumber(sheet.bonus2_8) or 0) + (tonumber(sheet.bonus2_9) or 0) + (tonumber(sheet.bonus2_10) or 0) + (tonumber(sheet.bonus2_11) or 0) + (tonumber(sheet.bonus2_12) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_aptFis) or 1);
            					sheet.auditbonus_aptFis = fisicos * mult;
        end, obj);

    obj._e_event18 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = 0;
            					local mult = (tonumber(sheet.auditxpcost_aptFis) or 1);
            
            					local valores = {   ((tonumber(sheet.total0_1 ) or 0)*2 - (tonumber(sheet.xp0_1 ) or 0)), 
            										((tonumber(sheet.total0_2 ) or 0)*2 - (tonumber(sheet.xp0_2 ) or 0)), 
            										((tonumber(sheet.total0_3 ) or 0)*2 - (tonumber(sheet.xp0_3 ) or 0)),
            										((tonumber(sheet.total0_4 ) or 0)*2 - (tonumber(sheet.xp0_4 ) or 0)),
            										((tonumber(sheet.total0_5 ) or 0)*2 - (tonumber(sheet.xp0_5 ) or 0)),
            										((tonumber(sheet.total0_6 ) or 0)*2 - (tonumber(sheet.xp0_6 ) or 0)),
            										((tonumber(sheet.total0_7 ) or 0)*2 - (tonumber(sheet.xp0_7 ) or 0)),
            										((tonumber(sheet.total0_8 ) or 0)*2 - (tonumber(sheet.xp0_8 ) or 0)),
            										((tonumber(sheet.total0_9 ) or 0)*2 - (tonumber(sheet.xp0_9 ) or 0)),
            										((tonumber(sheet.total0_10) or 0)*2 - (tonumber(sheet.xp0_10) or 0)),
            										((tonumber(sheet.total0_11) or 0)*2 - (tonumber(sheet.xp0_11) or 0)),
            										((tonumber(sheet.total0_12) or 0)*2 - (tonumber(sheet.xp0_12) or 0)),
            										((tonumber(sheet.total2_1 ) or 0)*2 - (tonumber(sheet.xp2_1 ) or 0)),
            										((tonumber(sheet.total2_2 ) or 0)*2 - (tonumber(sheet.xp2_2 ) or 0)),
            										((tonumber(sheet.total2_3 ) or 0)*2 - (tonumber(sheet.xp2_3 ) or 0)),
            										((tonumber(sheet.total2_4 ) or 0)*2 - (tonumber(sheet.xp2_4 ) or 0)),
            										((tonumber(sheet.total2_5 ) or 0)*2 - (tonumber(sheet.xp2_5 ) or 0)),
            										((tonumber(sheet.total2_6 ) or 0)*2 - (tonumber(sheet.xp2_6 ) or 0)),
            										((tonumber(sheet.total2_7 ) or 0)*2 - (tonumber(sheet.xp2_7 ) or 0)),
            										((tonumber(sheet.total2_8 ) or 0)*2 - (tonumber(sheet.xp2_8 ) or 0)),
            										((tonumber(sheet.total2_9 ) or 0)*2 - (tonumber(sheet.xp2_9 ) or 0)),
            										((tonumber(sheet.total2_10) or 0)*2 - (tonumber(sheet.xp2_10) or 0)),
            										((tonumber(sheet.total2_11) or 0)*2 - (tonumber(sheet.xp2_11) or 0)),
            										((tonumber(sheet.total2_12) or 0)*2 - (tonumber(sheet.xp2_12) or 0))
            										};
            			
            					local limites = {	(tonumber(sheet.xp0_1 ) or 0),
            										(tonumber(sheet.xp0_2 ) or 0),
            										(tonumber(sheet.xp0_3 ) or 0),
            										(tonumber(sheet.xp0_4 ) or 0),
            										(tonumber(sheet.xp0_5 ) or 0),
            										(tonumber(sheet.xp0_6 ) or 0),
            										(tonumber(sheet.xp0_7 ) or 0),
            										(tonumber(sheet.xp0_8 ) or 0),
            										(tonumber(sheet.xp0_9 ) or 0),
            										(tonumber(sheet.xp0_10) or 0),
            										(tonumber(sheet.xp0_11) or 0),
            										(tonumber(sheet.xp0_12) or 0),
            										(tonumber(sheet.xp2_1 ) or 0),
            										(tonumber(sheet.xp2_2 ) or 0),
            										(tonumber(sheet.xp2_3 ) or 0),
            										(tonumber(sheet.xp2_4 ) or 0),
            										(tonumber(sheet.xp2_5 ) or 0),
            										(tonumber(sheet.xp2_6 ) or 0),
            										(tonumber(sheet.xp2_7 ) or 0),
            										(tonumber(sheet.xp2_8 ) or 0),
            										(tonumber(sheet.xp2_9 ) or 0),
            										(tonumber(sheet.xp2_10) or 0),
            										(tonumber(sheet.xp2_11) or 0),
            										(tonumber(sheet.xp2_12) or 0)
            										};
            			
            					for i=1, 24, 1 do
            						for j=1, limites[i], 1 do
            							fisicos = fisicos + math.max(math.floor((valores[i]+j)*mult), 2*mult);
            						end;
            					end;
            					sheet.auditxp_aptFis = fisicos;
        end, obj);

    obj._e_event19 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.base1_1) or 0) + (tonumber(sheet.base1_2) or 0) + (tonumber(sheet.base1_3) or 0) + (tonumber(sheet.base1_4) or 0) + (tonumber(sheet.base1_5) or 0) + (tonumber(sheet.base1_6) or 0) + (tonumber(sheet.base1_7) or 0) + (tonumber(sheet.base1_8) or 0) + (tonumber(sheet.base1_9) or 0) + (tonumber(sheet.base1_10) or 0) + (tonumber(sheet.base1_11) or 0) + (tonumber(sheet.base1_12) or 0) + (tonumber(sheet.base3_1) or 0) + (tonumber(sheet.base3_2) or 0) + (tonumber(sheet.base3_3) or 0) + (tonumber(sheet.base3_4) or 0) + (tonumber(sheet.base3_5) or 0) + (tonumber(sheet.base3_6) or 0) + (tonumber(sheet.base3_7) or 0) + (tonumber(sheet.base3_8) or 0) + (tonumber(sheet.base3_9) or 0) + (tonumber(sheet.base3_10) or 0) + (tonumber(sheet.base3_11) or 0) + (tonumber(sheet.base3_12) or 0);
            					sheet.auditini_aptMen = mentais;
        end, obj);

    obj._e_event20 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.bonus1_1) or 0) + (tonumber(sheet.bonus1_2) or 0) + (tonumber(sheet.bonus1_3) or 0) + (tonumber(sheet.bonus1_4) or 0) + (tonumber(sheet.bonus1_5) or 0) + (tonumber(sheet.bonus1_6) or 0) + (tonumber(sheet.bonus1_7) or 0) + (tonumber(sheet.bonus1_8) or 0) + (tonumber(sheet.bonus1_9) or 0) + (tonumber(sheet.bonus1_10) or 0) + (tonumber(sheet.bonus1_11) or 0) + (tonumber(sheet.bonus1_12) or 0) + (tonumber(sheet.bonus3_1) or 0) + (tonumber(sheet.bonus3_2) or 0) + (tonumber(sheet.bonus3_3) or 0) + (tonumber(sheet.bonus3_4) or 0) + (tonumber(sheet.bonus3_5) or 0) + (tonumber(sheet.bonus3_6) or 0) + (tonumber(sheet.bonus3_7) or 0) + (tonumber(sheet.bonus3_8) or 0) + (tonumber(sheet.bonus3_9) or 0) + (tonumber(sheet.bonus3_10) or 0) + (tonumber(sheet.bonus3_11) or 0) + (tonumber(sheet.bonus3_12) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_aptMen) or 1);
            					sheet.auditbonus_aptMen = mentais * mult;
        end, obj);

    obj._e_event21 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = 0;
            					local mult = (tonumber(sheet.auditxpcost_aptMen) or 1);
            
            					local valores = {   ((tonumber(sheet.total1_1 ) or 0)*2 - (tonumber(sheet.xp1_1 ) or 0)),
            										((tonumber(sheet.total1_2 ) or 0)*2 - (tonumber(sheet.xp1_2 ) or 0)),
            										((tonumber(sheet.total1_3 ) or 0)*2 - (tonumber(sheet.xp1_3 ) or 0)),
            										((tonumber(sheet.total1_4 ) or 0)*2 - (tonumber(sheet.xp1_4 ) or 0)),
            										((tonumber(sheet.total1_5 ) or 0)*2 - (tonumber(sheet.xp1_5 ) or 0)),
            										((tonumber(sheet.total1_6 ) or 0)*2 - (tonumber(sheet.xp1_6 ) or 0)),
            										((tonumber(sheet.total1_7 ) or 0)*2 - (tonumber(sheet.xp1_7 ) or 0)),
            										((tonumber(sheet.total1_8 ) or 0)*2 - (tonumber(sheet.xp1_8 ) or 0)),
            										((tonumber(sheet.total1_9 ) or 0)*2 - (tonumber(sheet.xp1_9 ) or 0)),
            										((tonumber(sheet.total1_10) or 0)*2 - (tonumber(sheet.xp1_10) or 0)),
            										((tonumber(sheet.total1_11) or 0)*2 - (tonumber(sheet.xp1_11) or 0)),
            										((tonumber(sheet.total1_12) or 0)*2 - (tonumber(sheet.xp1_12) or 0)),
            										((tonumber(sheet.total3_1 ) or 0)*2 - (tonumber(sheet.xp3_1 ) or 0)),
            										((tonumber(sheet.total3_2 ) or 0)*2 - (tonumber(sheet.xp3_2 ) or 0)),
            										((tonumber(sheet.total3_3 ) or 0)*2 - (tonumber(sheet.xp3_3 ) or 0)),
            										((tonumber(sheet.total3_4 ) or 0)*2 - (tonumber(sheet.xp3_4 ) or 0)),
            										((tonumber(sheet.total3_5 ) or 0)*2 - (tonumber(sheet.xp3_5 ) or 0)),
            										((tonumber(sheet.total3_6 ) or 0)*2 - (tonumber(sheet.xp3_6 ) or 0)),
            										((tonumber(sheet.total3_7 ) or 0)*2 - (tonumber(sheet.xp3_7 ) or 0)),
            										((tonumber(sheet.total3_8 ) or 0)*2 - (tonumber(sheet.xp3_8 ) or 0)),
            										((tonumber(sheet.total3_9 ) or 0)*2 - (tonumber(sheet.xp3_9 ) or 0)),
            										((tonumber(sheet.total3_10) or 0)*2 - (tonumber(sheet.xp3_10) or 0)),
            										((tonumber(sheet.total3_11) or 0)*2 - (tonumber(sheet.xp3_11) or 0)),
            										((tonumber(sheet.total3_12) or 0)*2 - (tonumber(sheet.xp3_12) or 0))
            										};
            			
            					local limites = {	(tonumber(sheet.xp1_1 ) or 0),
            										(tonumber(sheet.xp1_2 ) or 0),
            										(tonumber(sheet.xp1_3 ) or 0),
            										(tonumber(sheet.xp1_4 ) or 0),
            										(tonumber(sheet.xp1_5 ) or 0),
            										(tonumber(sheet.xp1_6 ) or 0),
            										(tonumber(sheet.xp1_7 ) or 0),
            										(tonumber(sheet.xp1_8 ) or 0),
            										(tonumber(sheet.xp1_9 ) or 0),
            										(tonumber(sheet.xp1_10) or 0),
            										(tonumber(sheet.xp1_11) or 0),
            										(tonumber(sheet.xp1_12) or 0),
            										(tonumber(sheet.xp3_1 ) or 0),
            										(tonumber(sheet.xp3_2 ) or 0),
            										(tonumber(sheet.xp3_3 ) or 0),
            										(tonumber(sheet.xp3_4 ) or 0),
            										(tonumber(sheet.xp3_5 ) or 0),
            										(tonumber(sheet.xp3_6 ) or 0),
            										(tonumber(sheet.xp3_7 ) or 0),
            										(tonumber(sheet.xp3_8 ) or 0),
            										(tonumber(sheet.xp3_9 ) or 0),
            										(tonumber(sheet.xp3_10) or 0),
            										(tonumber(sheet.xp3_11) or 0),
            										(tonumber(sheet.xp3_12) or 0)
            										};
            			
            					for i=1, 24, 1 do
            						for j=1, limites[i], 1 do
            							mentais = mentais + math.max(math.floor((valores[i]+j)*mult), 2*mult);
            						end;
            					end;
            					sheet.auditxp_aptMen = mentais;
        end, obj);

    obj._e_event22 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historico = (tonumber(sheet.historicoValor1_1) or 0) + (tonumber(sheet.historicoValor1_2) or 0) + (tonumber(sheet.historicoValor1_3) or 0) + (tonumber(sheet.historicoValor1_4) or 0) + (tonumber(sheet.historicoValor1_5) or 0) + (tonumber(sheet.historicoValor1_6) or 0) + (tonumber(sheet.historicoValor2_1) or 0) + (tonumber(sheet.historicoValor2_2) or 0) + (tonumber(sheet.historicoValor2_3) or 0) + (tonumber(sheet.historicoValor2_4) or 0) + (tonumber(sheet.historicoValor2_5) or 0) + (tonumber(sheet.historicoValor2_6) or 0) + (tonumber(sheet.historicoValor3_1) or 0) + (tonumber(sheet.historicoValor3_2) or 0) + (tonumber(sheet.historicoValor3_3) or 0) + (tonumber(sheet.historicoValor3_4) or 0) + (tonumber(sheet.historicoValor3_5) or 0) + (tonumber(sheet.historicoValor3_6) or 0);
            					sheet.auditini_hist = historico;
        end, obj);

    obj._e_event23 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historico = (tonumber(sheet.historicoBonus1_1) or 0) + (tonumber(sheet.historicoBonus1_2) or 0) + (tonumber(sheet.historicoBonus1_3) or 0) + (tonumber(sheet.historicoBonus1_4) or 0) + (tonumber(sheet.historicoBonus1_5) or 0) + (tonumber(sheet.historicoBonus1_6) or 0) + (tonumber(sheet.historicoBonus2_1) or 0) + (tonumber(sheet.historicoBonus2_2) or 0) + (tonumber(sheet.historicoBonus2_3) or 0) + (tonumber(sheet.historicoBonus2_4) or 0) + (tonumber(sheet.historicoBonus2_5) or 0) + (tonumber(sheet.historicoBonus2_6) or 0) + (tonumber(sheet.historicoBonus3_1) or 0) + (tonumber(sheet.historicoBonus3_2) or 0) + (tonumber(sheet.historicoBonus3_3) or 0) + (tonumber(sheet.historicoBonus3_4) or 0) + (tonumber(sheet.historicoBonus3_5) or 0) + (tonumber(sheet.historicoBonus3_6) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_hist) or 1);
            					sheet.auditbonus_hist = historico * mult;
        end, obj);

    obj._e_event24 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historicos = 0;
            					local mult = (tonumber(sheet.auditxpcost_hist) or 1);
            
            					local valores = {   ((tonumber(sheet.historicoTotal1_1) or 0) - (tonumber(sheet.historicoXp1_1) or 0)), 
            										((tonumber(sheet.historicoTotal1_2) or 0) - (tonumber(sheet.historicoXp1_2) or 0)), 
            										((tonumber(sheet.historicoTotal1_3) or 0) - (tonumber(sheet.historicoXp1_3) or 0)),
            										((tonumber(sheet.historicoTotal1_4) or 0) - (tonumber(sheet.historicoXp1_4) or 0)),
            										((tonumber(sheet.historicoTotal1_5) or 0) - (tonumber(sheet.historicoXp1_5) or 0)),
            										((tonumber(sheet.historicoTotal1_6) or 0) - (tonumber(sheet.historicoXp1_6) or 0)),
            										((tonumber(sheet.historicoTotal2_1) or 0) - (tonumber(sheet.historicoXp2_1) or 0)),
            										((tonumber(sheet.historicoTotal2_2) or 0) - (tonumber(sheet.historicoXp2_2) or 0)),
            										((tonumber(sheet.historicoTotal2_3) or 0) - (tonumber(sheet.historicoXp2_3) or 0)),
            										((tonumber(sheet.historicoTotal2_4) or 0) - (tonumber(sheet.historicoXp2_4) or 0)),
            										((tonumber(sheet.historicoTotal2_5) or 0) - (tonumber(sheet.historicoXp2_5) or 0)),
            										((tonumber(sheet.historicoTotal2_6) or 0) - (tonumber(sheet.historicoXp2_6) or 0)),
            										((tonumber(sheet.historicoTotal3_1) or 0) - (tonumber(sheet.historicoXp3_1) or 0)),
            										((tonumber(sheet.historicoTotal3_2) or 0) - (tonumber(sheet.historicoXp3_2) or 0)),
            										((tonumber(sheet.historicoTotal3_3) or 0) - (tonumber(sheet.historicoXp3_3) or 0)),
            										((tonumber(sheet.historicoTotal3_4) or 0) - (tonumber(sheet.historicoXp3_4) or 0)),
            										((tonumber(sheet.historicoTotal3_5) or 0) - (tonumber(sheet.historicoXp3_5) or 0)),
            										((tonumber(sheet.historicoTotal3_6) or 0) - (tonumber(sheet.historicoXp3_6) or 0)),
            										};
            							
            					local limites = {	(tonumber(sheet.historicoXp1_1) or 0),
            										(tonumber(sheet.historicoXp1_2) or 0),
            										(tonumber(sheet.historicoXp1_3) or 0),
            										(tonumber(sheet.historicoXp1_4) or 0),
            										(tonumber(sheet.historicoXp1_5) or 0),
            										(tonumber(sheet.historicoXp1_6) or 0),
            										(tonumber(sheet.historicoXp2_1) or 0),
            										(tonumber(sheet.historicoXp2_2) or 0),
            										(tonumber(sheet.historicoXp2_3) or 0),
            										(tonumber(sheet.historicoXp2_4) or 0),
            										(tonumber(sheet.historicoXp2_5) or 0),
            										(tonumber(sheet.historicoXp2_6) or 0),
            										(tonumber(sheet.historicoXp3_1) or 0),
            										(tonumber(sheet.historicoXp3_2) or 0),
            										(tonumber(sheet.historicoXp3_3) or 0),
            										(tonumber(sheet.historicoXp3_4) or 0),
            										(tonumber(sheet.historicoXp3_5) or 0),
            										(tonumber(sheet.historicoXp3_6) or 0)
            										};
            							
            					for i=1, 18, 1 do
            						for j=1, limites[i], 1 do
            							historicos = historicos + (valores[i]+j)*mult;
            						end;
            					end;
            					sheet.auditxp_hist = historicos;
        end, obj);

    obj._e_event25 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local eidolon = (tonumber(sheet.inicialconsciencia) or 0) + (tonumber(sheet.inicialespirito) or 0) + (tonumber(sheet.inicialperseveranca) or 0);
            					sheet.auditini_eido = eidolon;
        end, obj);

    obj._e_event26 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local eidolon = (tonumber(sheet.bonusconsciencia) or 0) + (tonumber(sheet.bonusespirito) or 0) + (tonumber(sheet.bonusperseveranca) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_eido) or 1);
            					sheet.auditbonus_eido = eidolon * mult;
        end, obj);

    obj._e_event27 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local aegis = 0;
            					local mult = (tonumber(sheet.auditxpcost_eido) or 1);
            
            					local valores = {   ((tonumber(sheet.testeconsciencia) or 0) - (tonumber(sheet.xpconsciencia) or 0) - (tonumber(sheet.outroconsciencia) or 0)), 
            										((tonumber(sheet.testeespirito) or 0) - (tonumber(sheet.xpespirito) or 0) - (tonumber(sheet.outroespirito) or 0)), 
            										((tonumber(sheet.testeperseveranca) or 0) - (tonumber(sheet.xpperseveranca) or 0) - (tonumber(sheet.outroperseveranca) or 0))};
            					
            					local limites = {	(tonumber(sheet.xpconsciencia) or 0),
            										(tonumber(sheet.xpespirito) or 0),
            										(tonumber(sheet.xpperseveranca) or 0)}
            					
            					for i=1, 3, 1 do
            						for j=1, limites[i], 1 do
            							aegis = aegis + (valores[i]+j) * mult;
            						end;
            					end;
            
            					sheet.auditxp_eido = aegis * mult;
        end, obj);

    obj._e_event28 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local bonus = 	(tonumber(sheet.auditbonus_atrFis) or 0) + 
            									(tonumber(sheet.auditbonus_atrMen) or 0) + 
            									(tonumber(sheet.auditbonus_aptFis) or 0) + 
            									(tonumber(sheet.auditbonus_aptMen) or 0) + 
            									(tonumber(sheet.auditbonus_hist) or 0) + 
            									(tonumber(sheet.auditbonus_eido) or 0) + 
            									(tonumber(sheet.auditbonus_out) or 0) + 
            									(tonumber(sheet.auditbonus_espec) or 0) + 
            									(tonumber(sheet.auditbonus_extra) or 0);
            					sheet.auditbonus_total = bonus;
        end, obj);

    obj._e_event29 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local xp = 	(tonumber(sheet.auditxp_atrFis) or 0) + 
            									(tonumber(sheet.auditxp_atrMen) or 0) + 
            									(tonumber(sheet.auditxp_aptFis) or 0) + 
            									(tonumber(sheet.auditxp_aptMen) or 0) + 
            									(tonumber(sheet.auditxp_hist) or 0) + 
            									(tonumber(sheet.auditxp_eido) or 0) + 
            									(tonumber(sheet.auditxp_out) or 0) + 
            									(tonumber(sheet.auditxp_espec) or 0) + 
            									(tonumber(sheet.auditxp_extra) or 0);
            					sheet.auditxp_total = xp;
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmACN6()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmACN6();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmACN6 = {
    newEditor = newfrmACN6, 
    new = newfrmACN6, 
    name = "frmACN6", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmACN6 = _frmACN6;
Firecast.registrarForm(_frmACN6);

return _frmACN6;
