require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTemplate()
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
    obj:setName("frmTemplate");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.Template");
    obj:setTitle("Template");
    obj:setAlign("client");
    obj:setTheme("dark");


        



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
            if str then
                mesa.activeChat:escrever(str);
            else
                mesa.activeChat:escrever("String nula");
            end;
        end;
        


 
    


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Exemplos");
    obj.tab1:setName("tab1");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.tab1);
    obj.tabControl2:setAlign("client");
    obj.tabControl2:setName("tabControl2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl2);
    obj.tab2:setTitle("DetailList");
    obj.tab2:setName("tab2");

    obj.frmDetailList = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDetailList:setParent(obj.tab2);
    obj.frmDetailList:setName("frmDetailList");
    obj.frmDetailList:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmDetailList);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adicionar");
    obj.button1:setName("button1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(250);
    obj.layout2:setMargins({right=10});
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.rclSelector = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.rectangle1);
    obj.rclSelector:setAlign("top");
    obj.rclSelector:setAutoHeight(true);
    obj.rclSelector:setName("rclSelector");
    obj.rclSelector:setField("listaDeOpcoes");
    obj.rclSelector:setTemplateForm("frmDataScopeSelectionForm");
    obj.rclSelector:setLayout("vertical");
    obj.rclSelector:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox1);
    obj.boxDetalhesDoItem:setAlign("client");
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoItem);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(230);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("MultImageCheckbox");
    obj.tab3:setName("tab3");

    obj.frmMultImageCheckbox = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMultImageCheckbox:setParent(obj.tab3);
    obj.frmMultImageCheckbox:setName("frmMultImageCheckbox");
    obj.frmMultImageCheckbox:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmMultImageCheckbox);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox2);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(100);
    obj.button2:setHeight(100);
    obj.button2:setHint("click to change image");
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.button2);
    obj.dataLink1:setField("clickableImage");
    obj.dataLink1:setDefaultValue("http://firecast.blob.core.windows.net/blobs/KEMDMPRM_386214.png");
    obj.dataLink1:setName("dataLink1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button2);
    obj.image1:setAlign("client");
    obj.image1:setField("clickableImage");
    obj.image1:setMargins({left=5, right=5, top=5, bottom=5});
    obj.image1:setStyle("proportional");
    obj.image1:setName("image1");


				



				-- criando array das imagens que vão ser utilizadas. 
				-- melhor usar imagens hospedadas no firedrive nesse caso
				local pics = {	"http://firecast.blob.core.windows.net/blobs/KEMDMPRM_386214.png", 
								"http://firecast.blob.core.windows.net/blobs/IAUQMVUR_386260.png", 
								"http://firecast.blob.core.windows.net/blobs/QNIIBIMV_386244.png", 
								"http://firecast.blob.core.windows.net/blobs/APKABCKF_386218.png", 
								"http://firecast.blob.core.windows.net/blobs/DFBFKPTH_386212.png", 
								"http://firecast.blob.core.windows.net/blobs/PPIRFSBI_386208.png", 
								"http://firecast.blob.core.windows.net/blobs/FGLDGNRW_386257.png", 
								"http://firecast.blob.core.windows.net/blobs/LFRIRPIW_386226.png", 
								"http://firecast.blob.core.windows.net/blobs/CEJAMDNT_386246.png", 
								"http://firecast.blob.core.windows.net/blobs/MKLJSRET_386230.png"};
				



			


    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("ColorSelector");
    obj.tab4:setName("tab4");

    obj.frmColorSelector = GUI.fromHandle(_obj_newObject("form"));
    obj.frmColorSelector:setParent(obj.tab4);
    obj.frmColorSelector:setName("frmColorSelector");
    obj.frmColorSelector:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmColorSelector);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox3);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(45);
    obj.layout3:setHeight(45);
    obj.layout3:setName("layout3");

    obj.colorSelector = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.colorSelector:setParent(obj.layout3);
    obj.colorSelector:setLeft(0);
    obj.colorSelector:setTop(0);
    obj.colorSelector:setWidth(200);
    obj.colorSelector:setHeight(45);
    obj.colorSelector:setField("colorSelector");
    obj.colorSelector:setName("colorSelector");
    obj.colorSelector:setVisible(false);
    obj.colorSelector:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.colorSelector:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});

    obj.showColor = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.showColor:setParent(obj.layout3);
    obj.showColor:setLeft(0);
    obj.showColor:setTop(0);
    obj.showColor:setWidth(45);
    obj.showColor:setHeight(45);
    obj.showColor:setName("showColor");
    obj.showColor:setHitTest(true);
    obj.showColor:setCornerType("round");
    obj.showColor:setXradius(2);
    obj.showColor:setYradius(2);
    obj.showColor:setStrokeColor("black");
    obj.showColor:setStrokeSize(2);
    obj.showColor:setHint("Muda a cor do retangulo. ");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("RclCounter");
    obj.tab5:setName("tab5");

    obj.frmRclCounter = GUI.fromHandle(_obj_newObject("form"));
    obj.frmRclCounter:setParent(obj.tab5);
    obj.frmRclCounter:setName("frmRclCounter");
    obj.frmRclCounter:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmRclCounter);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox4);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle3);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(25);
    obj.label1:setHeight(25);
    obj.label1:setField("countSum");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setAlign("left");
    obj.label2:setWidth(125);
    obj.label2:setText("<- Soma contador");
    obj.label2:setName("label2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setAlign("left");
    obj.button3:setWidth(125);
    obj.button3:setHeight(25);
    obj.button3:setText("+ Ultimo");
    obj.button3:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setAlign("left");
    obj.button4:setWidth(125);
    obj.button4:setHeight(25);
    obj.button4:setText("+ Tamanho");
    obj.button4:setHint("Adiciona objetos a lista com contador em relação ao tamanho da lista");
    obj.button4:setName("button4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox4);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(250);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle4);
    obj.label3:setAlign("top");
    obj.label3:setHeight(20);
    obj.label3:setText("Titulo da Lista");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rclName = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclName:setParent(obj.rectangle4);
    obj.rclName:setAlign("client");
    obj.rclName:setMargins({left=5,right=5,bottom=5,top=5});
    obj.rclName:setName("rclName");
    obj.rclName:setField("listaDe");
    obj.rclName:setTemplateForm("frmRecordListForm");
    obj.rclName:setLayout("vertical");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl2);
    obj.tab6:setTitle("Popup");
    obj.tab6:setName("tab6");

    obj.frmPopup = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPopup:setParent(obj.tab6);
    obj.frmPopup:setName("frmPopup");
    obj.frmPopup:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmPopup);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.popupButton = GUI.fromHandle(_obj_newObject("button"));
    obj.popupButton:setParent(obj.scrollBox5);
    obj.popupButton:setLeft(0);
    obj.popupButton:setTop(0);
    obj.popupButton:setWidth(25);
    obj.popupButton:setHeight(25);
    obj.popupButton:setText("i");
    obj.popupButton:setName("popupButton");
    obj.popupButton:setHint("Botao que abre popup");

    obj.popExemplo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExemplo:setParent(obj.scrollBox5);
    obj.popExemplo:setName("popExemplo");
    obj.popExemplo:setWidth(300);
    obj.popExemplo:setHeight(400);
    obj.popExemplo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popExemplo, "autoScopeNode",  "false");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.popExemplo);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(300);
    obj.label4:setHeight(20);
    obj.label4:setText("Exemplo de PopUp");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl2);
    obj.tab7:setTitle("DiceRoll");
    obj.tab7:setName("tab7");

    obj.frmDiceRoll = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDiceRoll:setParent(obj.tab7);
    obj.frmDiceRoll:setName("frmDiceRoll");
    obj.frmDiceRoll:setAlign("client");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmDiceRoll);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");


			



			local function rolagemCallback(rolagem)
				local msg = "";
				for i = 1, #rolagem.ops, 1 do  
					local operacao = rolagem.ops[i];      

					-- Vamos verificar que tipo de operação é esta.      
					if operacao.tipo == "dado" then        
					        -- Adicionar à mensagem informações sobre este conjunto de dados.
					        msg = msg .. operacao.quantidade .. "d" .. operacao.face .. ": \n  ";               

					       -- Loop percorrendo cada um dos resultados individuais deste conjunto de dados.
					        for j = 1, #operacao.resultados, 1 do
					                msg = msg .. "  " .. math.floor(operacao.resultados[j]);
					        end;               

					        msg = msg .. "\n";
					elseif operacao.tipo == "imediato" then
					        msg = msg .. "Valor imediato: " .. operacao.valor .. "\n";
					end;
				end; 
				-- Concatenar à mensagem o resultado final da rolagem
				msg = msg .. "------------------- \nResultado Final: " .. rolagem.resultado; 

				-- Escrever resultado na mesa só para o usuario
				local mesa = Firecast.getMesaDe(sheet);
				mesa.activeChat:escrever(msg);
			end;
			



		


    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox6);
    obj.button5:setLeft(0);
    obj.button5:setTop(0);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("R");
    obj.button5:setHint("Botao que faz rolagem de teste");
    obj.button5:setName("button5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox6);
    obj.edit2:setLeft(25);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(75);
    obj.edit2:setHeight(25);
    obj.edit2:setField("roll");
    obj.edit2:setName("edit2");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl2);
    obj.tab8:setTitle("Avatar");
    obj.tab8:setName("tab8");

    obj.frmAvatar = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAvatar:setParent(obj.tab8);
    obj.frmAvatar:setName("frmAvatar");
    obj.frmAvatar:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmAvatar);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox7);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setHeight(100);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle5);
    obj.label5:setLeft(0);
    obj.label5:setTop(40);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setText("Avatar");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle5);
    obj.image2:setAlign("client");
    obj.image2:setField("avatar");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image2:setName("image2");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl2);
    obj.tab9:setTitle("ImportExport");
    obj.tab9:setName("tab9");

    obj.frmImportExport = GUI.fromHandle(_obj_newObject("form"));
    obj.frmImportExport:setParent(obj.tab9);
    obj.frmImportExport:setName("frmImportExport");
    obj.frmImportExport:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmImportExport);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox8);
    obj.button6:setLeft(0);
    obj.button6:setTop(0);
    obj.button6:setWidth(100);
    obj.button6:setHeight(20);
    obj.button6:setText("Exportar Ficha");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox8);
    obj.button7:setLeft(0);
    obj.button7:setTop(25);
    obj.button7:setWidth(100);
    obj.button7:setHeight(20);
    obj.button7:setText("Importar Ficha");
    obj.button7:setName("button7");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl2);
    obj.tab10:setTitle("ThemeControl");
    obj.tab10:setName("tab10");

    obj.frmThemeControl = GUI.fromHandle(_obj_newObject("form"));
    obj.frmThemeControl:setParent(obj.tab10);
    obj.frmThemeControl:setName("frmThemeControl");
    obj.frmThemeControl:setAlign("client");


		



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

		


	
	


    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmThemeControl);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox9);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(200);
    obj.rectangle6:setHeight(150);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle6);
    obj.label6:setLeft(0);
    obj.label6:setTop(10);
    obj.label6:setWidth(80);
    obj.label6:setHeight(20);
    obj.label6:setText("Tema:");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle6);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle6);
    obj.dataLink2:setField("theme");
    obj.dataLink2:setDefaultValue("Escuro");
    obj.dataLink2:setName("dataLink2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle6);
    obj.label7:setLeft(0);
    obj.label7:setTop(35);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("Cores: ");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle6);
    obj.label8:setLeft(0);
    obj.label8:setTop(60);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("Fundo ");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle6);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle6);
    obj.dataLink3:setField("colorBackground");
    obj.dataLink3:setDefaultValue("#000000");
    obj.dataLink3:setName("dataLink3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle6);
    obj.label9:setLeft(0);
    obj.label9:setTop(85);
    obj.label9:setWidth(90);
    obj.label9:setHeight(20);
    obj.label9:setText("Linhas ");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle6);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle6);
    obj.dataLink4:setField("colorStroke");
    obj.dataLink4:setDefaultValue("#FFFFFF");
    obj.dataLink4:setName("dataLink4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle6);
    obj.label10:setLeft(0);
    obj.label10:setTop(110);
    obj.label10:setWidth(90);
    obj.label10:setHeight(20);
    obj.label10:setText("Fonte ");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle6);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle6);
    obj.dataLink5:setField("colorFont");
    obj.dataLink5:setDefaultValue("#FFFFFF");
    obj.dataLink5:setName("dataLink5");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl2);
    obj.tab11:setTitle("BarControl");
    obj.tab11:setName("tab11");

    obj.frmBarControl = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBarControl:setParent(obj.tab11);
    obj.frmBarControl:setName("frmBarControl");
    obj.frmBarControl:setAlign("client");


		



			local function addCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = mesa.meuJogador:getBarValue(1);
				current = current + (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(1, current);
			end;

			local function subtractCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = mesa.meuJogador:getBarValue(1);
				current = current - (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(1, current);
			end;

			local function setCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(1, current);
			end;

			local function addMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local current, max = mesa.meuJogador:getBarValue(1);
				max = max + (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;

			local function subtractMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local current, max = mesa.meuJogador:getBarValue(1);
				max = max - (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;

			local function setMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local max = (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;
		


	
	


    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmBarControl);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox10);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(300);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout5);
    obj.label11:setLeft(0);
    obj.label11:setTop(0);
    obj.label11:setWidth(100);
    obj.label11:setHeight(25);
    obj.label11:setText("Atual");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("current");
    obj.edit3:setName("edit3");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout5);
    obj.button8:setLeft(150);
    obj.button8:setTop(0);
    obj.button8:setWidth(50);
    obj.button8:setHeight(25);
    obj.button8:setText("+");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout5);
    obj.button9:setLeft(200);
    obj.button9:setTop(0);
    obj.button9:setWidth(50);
    obj.button9:setHeight(25);
    obj.button9:setText("-");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout5);
    obj.button10:setLeft(250);
    obj.button10:setTop(0);
    obj.button10:setWidth(50);
    obj.button10:setHeight(25);
    obj.button10:setText("=");
    obj.button10:setName("button10");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox10);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(25);
    obj.layout6:setWidth(300);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout6);
    obj.label12:setLeft(0);
    obj.label12:setTop(0);
    obj.label12:setWidth(100);
    obj.label12:setHeight(25);
    obj.label12:setText("Maximo");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("max");
    obj.edit4:setName("edit4");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout6);
    obj.button11:setLeft(150);
    obj.button11:setTop(0);
    obj.button11:setWidth(50);
    obj.button11:setHeight(25);
    obj.button11:setText("+");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout6);
    obj.button12:setLeft(200);
    obj.button12:setTop(0);
    obj.button12:setWidth(50);
    obj.button12:setHeight(25);
    obj.button12:setText("-");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout6);
    obj.button13:setLeft(250);
    obj.button13:setTop(0);
    obj.button13:setWidth(50);
    obj.button13:setHeight(25);
    obj.button13:setText("=");
    obj.button13:setName("button13");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl2);
    obj.tab12:setTitle("EditBar");
    obj.tab12:setName("tab12");

    obj.frmEditBar = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEditBar:setParent(obj.tab12);
    obj.frmEditBar:setName("frmEditBar");
    obj.frmEditBar:setAlign("client");

    obj.BarPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.BarPopup:setParent(obj.frmEditBar);
    obj.BarPopup:setName("BarPopup");
    obj.BarPopup:setWidth(140);
    obj.BarPopup:setHeight(66);
    obj.BarPopup:setBackOpacity(0);
    obj.BarPopup:setMargins({left=4, right=4, top=4, bottom=4});
    lfm_setPropAsString(obj.BarPopup, "autoScopeNode",  "false");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.BarPopup);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("white");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setName("rectangle7");

    obj.PopupBarColor = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.PopupBarColor:setParent(obj.rectangle7);
    obj.PopupBarColor:setAlign("client");
    obj.PopupBarColor:setName("PopupBarColor");
    obj.PopupBarColor:setColor("#808080");
    obj.PopupBarColor:setXradius(5);
    obj.PopupBarColor:setYradius(5);
    obj.PopupBarColor:setOpacity(0.9);

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.PopupBarColor);
    obj.label13:setFontColor("black");
    obj.label13:setMargins({left=6, top=2});
    obj.label13:setAlign("top");
    obj.label13:setText("Valor");
    obj.label13:setField("AtributoBarrinha");
    obj.label13:setFontSize(12);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setTextTrimming("character");
    obj.label13:setName("label13");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.PopupBarColor);
    obj.layout7:setAlign("client");
    obj.layout7:setMargins({top=2, left=4});
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(18);
    obj.layout8:setName("layout8");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setFontColor("black");
    obj.label14:setAlign("left");
    obj.label14:setText("Atual:  ");
    obj.label14:setHorzTextAlign("trailing");
    obj.label14:setWidth(34);
    obj.label14:setMargins({right=2});
    obj.label14:setFontSize(12);
    obj.label14:setName("label14");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout8);
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setMargins({left=2});
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setTransparent(false);
    obj.comboBox5:setWidth(40);
    obj.comboBox5:setField("ModificadorBarrinha");
    obj.comboBox5:setItems({'=', '+', '-'});
    obj.comboBox5:setValues({'igual', 'mais', 'menos'});
    obj.comboBox5:setValue("igual");
    obj.comboBox5:setName("comboBox5");

    obj.currentBarValue = GUI.fromHandle(_obj_newObject("edit"));
    obj.currentBarValue:setParent(obj.layout8);
    obj.currentBarValue:setFontColor("white");
    obj.currentBarValue:setMargins({left=2, right=4});
    obj.currentBarValue:setType("number");
    obj.currentBarValue:setAlign("client");
    obj.currentBarValue:setField("ValorMudadoAtualBarrinha");
    obj.currentBarValue:setName("currentBarValue");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(18);
    obj.layout9:setName("layout9");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setFontColor("black");
    obj.label15:setAlign("left");
    obj.label15:setText("Max:  ");
    obj.label15:setHorzTextAlign("trailing");
    obj.label15:setWidth(34);
    obj.label15:setMargins({right=2});
    obj.label15:setFontSize(12);
    obj.label15:setName("label15");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout9);
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setMargins({left=2});
    obj.comboBox6:setAlign("left");
    obj.comboBox6:setTransparent(false);
    obj.comboBox6:setWidth(40);
    obj.comboBox6:setField("ModificadorBarrinhaMax");
    obj.comboBox6:setItems({'=', '+', '-'});
    obj.comboBox6:setValues({'igual', 'mais', 'menos'});
    obj.comboBox6:setValue("igual");
    obj.comboBox6:setName("comboBox6");

    obj.maxBarValue = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxBarValue:setParent(obj.layout9);
    obj.maxBarValue:setFontColor("white");
    obj.maxBarValue:setMargins({left=2, right=4});
    obj.maxBarValue:setType("number");
    obj.maxBarValue:setAlign("client");
    obj.maxBarValue:setField("ValorMudadoMaxBarrinha");
    obj.maxBarValue:setName("maxBarValue");

    obj.scrollBox11 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.frmEditBar);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox11);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(125);
    obj.layout11:setName("layout11");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout11);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(50);
    obj.edit5:setField("AtributoBarrinha1");
    obj.edit5:setName("edit5");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(45);
    obj.layout12:setMargins({top=5,bottom=5});
    obj.layout12:setName("layout12");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout12);
    obj.imageCheckBox1:setAlign("client");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.Barrinha1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha1:setParent(obj.imageCheckBox1);
    obj.Barrinha1:setColorMode("hl");
    obj.Barrinha1:setWidth(45);
    obj.Barrinha1:setHeight(15);
    obj.Barrinha1:setMargins({top=5,bottom=5});
    obj.Barrinha1:setHitTest(true);
    obj.Barrinha1:setMouseGlow(true);
    obj.Barrinha1:setColor("Red");
    obj.Barrinha1:setName("Barrinha1");
    obj.Barrinha1:setField("Barrinha1Valor");
    obj.Barrinha1:setFieldMax("Barrinha1ValorMax");

    obj.ValoresBarrinha1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha1:setParent(obj.layout11);
    obj.ValoresBarrinha1:setAlign("left");
    obj.ValoresBarrinha1:setWidth(30);
    obj.ValoresBarrinha1:setMargins({top=5,bottom=5});
    obj.ValoresBarrinha1:setVisible(false);
    obj.ValoresBarrinha1:setName("ValoresBarrinha1");

    obj.CorBarrinha1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.ValoresBarrinha1);
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setXradius(2);
    obj.CorBarrinha1:setYradius(2);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("Green");

    obj.InfoBarrinha1 = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha1:setParent(obj.CorBarrinha1);
    obj.InfoBarrinha1:setAlign("left");
    obj.InfoBarrinha1:setFontColor("white");
    obj.InfoBarrinha1:setFontSize(10);
    obj.InfoBarrinha1:setAutoSize(true);
    obj.InfoBarrinha1:setTextTrimming("none");
    obj.InfoBarrinha1:setWordWrap(false);
    obj.InfoBarrinha1:setName("InfoBarrinha1");
    obj.InfoBarrinha1:setField("InfoBarrinha1");
    obj.InfoBarrinha1:setHorzTextAlign("center");
    obj.InfoBarrinha1:setText("0/0");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout11);
    obj.dataLink6:setField("CorBarrinha1");
    obj.dataLink6:setDefaultValue("Green");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout11);
    obj.dataLink7:setField("Barrinha1Valor");
    obj.dataLink7:setName("dataLink7");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(125);
    obj.layout13:setName("layout13");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout13);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(50);
    obj.edit6:setField("AtributoBarrinha2");
    obj.edit6:setName("edit6");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(45);
    obj.layout14:setMargins({top=5,bottom=5});
    obj.layout14:setName("layout14");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout14);
    obj.imageCheckBox2:setAlign("client");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.Barrinha2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha2:setParent(obj.imageCheckBox2);
    obj.Barrinha2:setColorMode("hl");
    obj.Barrinha2:setWidth(45);
    obj.Barrinha2:setHeight(15);
    obj.Barrinha2:setMargins({top=5,bottom=5});
    obj.Barrinha2:setHitTest(true);
    obj.Barrinha2:setMouseGlow(true);
    obj.Barrinha2:setColor("Red");
    obj.Barrinha2:setName("Barrinha2");
    obj.Barrinha2:setField("Barrinha2Valor");
    obj.Barrinha2:setFieldMax("Barrinha2ValorMax");

    obj.ValoresBarrinha2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha2:setParent(obj.layout13);
    obj.ValoresBarrinha2:setAlign("left");
    obj.ValoresBarrinha2:setWidth(30);
    obj.ValoresBarrinha2:setMargins({top=5,bottom=5});
    obj.ValoresBarrinha2:setVisible(false);
    obj.ValoresBarrinha2:setName("ValoresBarrinha2");

    obj.CorBarrinha2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.ValoresBarrinha2);
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setXradius(2);
    obj.CorBarrinha2:setYradius(2);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("Green");

    obj.InfoBarrinha2 = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha2:setParent(obj.CorBarrinha2);
    obj.InfoBarrinha2:setAlign("left");
    obj.InfoBarrinha2:setFontColor("white");
    obj.InfoBarrinha2:setFontSize(10);
    obj.InfoBarrinha2:setAutoSize(true);
    obj.InfoBarrinha2:setTextTrimming("none");
    obj.InfoBarrinha2:setWordWrap(false);
    obj.InfoBarrinha2:setName("InfoBarrinha2");
    obj.InfoBarrinha2:setField("InfoBarrinha2");
    obj.InfoBarrinha2:setHorzTextAlign("center");
    obj.InfoBarrinha2:setText("0/0");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout13);
    obj.dataLink8:setField("CorBarrinha2");
    obj.dataLink8:setDefaultValue("Green");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout13);
    obj.dataLink9:setField("Barrinha2Valor");
    obj.dataLink9:setName("dataLink9");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout10);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(125);
    obj.layout15:setName("layout15");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout15);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(50);
    obj.edit7:setField("AtributoBarrinha3");
    obj.edit7:setName("edit7");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(45);
    obj.layout16:setMargins({top=5,bottom=5});
    obj.layout16:setName("layout16");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout16);
    obj.imageCheckBox3:setAlign("client");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.Barrinha3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha3:setParent(obj.imageCheckBox3);
    obj.Barrinha3:setColorMode("hl");
    obj.Barrinha3:setWidth(45);
    obj.Barrinha3:setHeight(15);
    obj.Barrinha3:setMargins({top=5,bottom=5});
    obj.Barrinha3:setHitTest(true);
    obj.Barrinha3:setMouseGlow(true);
    obj.Barrinha3:setColor("Red");
    obj.Barrinha3:setName("Barrinha3");
    obj.Barrinha3:setField("Barrinha3Valor");
    obj.Barrinha3:setFieldMax("Barrinha3ValorMax");

    obj.ValoresBarrinha3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha3:setParent(obj.layout15);
    obj.ValoresBarrinha3:setAlign("left");
    obj.ValoresBarrinha3:setWidth(30);
    obj.ValoresBarrinha3:setMargins({top=5,bottom=5});
    obj.ValoresBarrinha3:setVisible(false);
    obj.ValoresBarrinha3:setName("ValoresBarrinha3");

    obj.CorBarrinha3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.ValoresBarrinha3);
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setXradius(2);
    obj.CorBarrinha3:setYradius(2);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("Green");

    obj.InfoBarrinha3 = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha3:setParent(obj.CorBarrinha3);
    obj.InfoBarrinha3:setAlign("left");
    obj.InfoBarrinha3:setFontColor("white");
    obj.InfoBarrinha3:setFontSize(10);
    obj.InfoBarrinha3:setAutoSize(true);
    obj.InfoBarrinha3:setTextTrimming("none");
    obj.InfoBarrinha3:setWordWrap(false);
    obj.InfoBarrinha3:setName("InfoBarrinha3");
    obj.InfoBarrinha3:setField("InfoBarrinha3");
    obj.InfoBarrinha3:setHorzTextAlign("center");
    obj.InfoBarrinha3:setText("0/0");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout15);
    obj.dataLink10:setField("CorBarrinha3");
    obj.dataLink10:setDefaultValue("Green");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout15);
    obj.dataLink11:setField("Barrinha3Valor");
    obj.dataLink11:setName("dataLink11");

    obj.tab13 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl1);
    obj.tab13:setTitle("Descrição");
    obj.tab13:setName("tab13");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab13);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox12 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox12:setParent(obj.frmTemplateDescription);
    obj.scrollBox12:setAlign("client");
    obj.scrollBox12:setName("scrollBox12");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.scrollBox12);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(1205);
    obj.rectangle8:setHeight(105);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle8);
    obj.label16:setAlign("top");
    obj.label16:setHeight(20);
    obj.label16:setText("DESCRIÇÃO");
    obj.label16:setName("label16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle8);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(380);
    obj.layout18:setMargins({right=10});
    obj.layout18:setName("layout18");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout18);
    obj.label17:setAlign("left");
    obj.label17:setWidth(90);
    obj.label17:setText("PASSADO");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout18);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(290);
    obj.edit8:setField("passado");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout17);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(380);
    obj.layout19:setMargins({right=10});
    obj.layout19:setName("layout19");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout19);
    obj.label18:setAlign("left");
    obj.label18:setWidth(90);
    obj.label18:setText("IDADE");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout19);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(290);
    obj.edit9:setField("idade");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout17);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(380);
    obj.layout20:setMargins({right=10});
    obj.layout20:setName("layout20");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout20);
    obj.label19:setAlign("left");
    obj.label19:setWidth(90);
    obj.label19:setText("OLHOS");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout20);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(290);
    obj.edit10:setField("aparenciaOlhos");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setName("edit10");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle8);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(380);
    obj.layout22:setMargins({right=10});
    obj.layout22:setName("layout22");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout22);
    obj.label20:setAlign("left");
    obj.label20:setWidth(90);
    obj.label20:setText("ALTURA");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout22);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(290);
    obj.edit11:setField("altura");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(380);
    obj.layout23:setMargins({right=10});
    obj.layout23:setName("layout23");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout23);
    obj.label21:setAlign("left");
    obj.label21:setWidth(90);
    obj.label21:setText("GÊNERO");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout23);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(290);
    obj.edit12:setField("genero");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setName("edit12");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(380);
    obj.layout24:setMargins({right=10});
    obj.layout24:setName("layout24");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout24);
    obj.label22:setAlign("left");
    obj.label22:setWidth(90);
    obj.label22:setText("PELE");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout24);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(290);
    obj.edit13:setField("pele");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setName("edit13");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle8);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(380);
    obj.layout26:setMargins({right=10});
    obj.layout26:setName("layout26");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout26);
    obj.label23:setAlign("left");
    obj.label23:setWidth(90);
    obj.label23:setText("PESO");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout26);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(290);
    obj.edit14:setField("peso");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setName("edit14");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout25);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(380);
    obj.layout27:setMargins({right=10});
    obj.layout27:setName("layout27");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout27);
    obj.label24:setAlign("left");
    obj.label24:setWidth(90);
    obj.label24:setText("OUTROS");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout27);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(290);
    obj.edit15:setField("aparenciaOutros");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setName("edit15");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout25);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(380);
    obj.layout28:setMargins({right=10});
    obj.layout28:setName("layout28");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout28);
    obj.label25:setAlign("left");
    obj.label25:setWidth(90);
    obj.label25:setText("CABELO");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout28);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(290);
    obj.edit16:setField("cabelo");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setName("edit16");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox12);
    obj.layout29:setLeft(0);
    obj.layout29:setTop(110);
    obj.layout29:setWidth(375);
    obj.layout29:setHeight(240);
    obj.layout29:setName("layout29");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout29);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout29);
    obj.label26:setLeft(5);
    obj.label26:setTop(1);
    obj.label26:setWidth(100);
    obj.label26:setHeight(20);
    obj.label26:setText("APARÊNCIA");
    obj.label26:setName("label26");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout29);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(210);
    obj.textEditor1:setField("aparencia");
    obj.textEditor1:setName("textEditor1");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox12);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(355);
    obj.layout30:setWidth(375);
    obj.layout30:setHeight(250);
    obj.layout30:setName("layout30");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout30);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout30);
    obj.label27:setLeft(5);
    obj.label27:setTop(1);
    obj.label27:setWidth(100);
    obj.label27:setHeight(20);
    obj.label27:setText("PERSONALIDADE");
    obj.label27:setName("label27");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout30);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(220);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox12);
    obj.layout31:setLeft(380);
    obj.layout31:setTop(110);
    obj.layout31:setWidth(825);
    obj.layout31:setHeight(495);
    obj.layout31:setName("layout31");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout31);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout31);
    obj.label28:setLeft(5);
    obj.label28:setTop(1);
    obj.label28:setWidth(100);
    obj.label28:setHeight(20);
    obj.label28:setText("HISTORIA");
    obj.label28:setName("label28");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout31);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab14 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab14:setParent(obj.tabControl1);
    obj.tab14:setTitle("Anotações");
    obj.tab14:setName("tab14");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab14);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox13 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox13:setParent(obj.frmTemplateNotes);
    obj.scrollBox13:setAlign("client");
    obj.scrollBox13:setName("scrollBox13");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox13);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(400);
    obj.layout32:setMargins({right=10});
    obj.layout32:setName("layout32");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout32);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(15);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle12);
    obj.label29:setAlign("top");
    obj.label29:setHeight(20);
    obj.label29:setText("Anotações");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle12);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("anotacoes1");
    obj.textEditor3:setMargins({left=10,right=10,bottom=10});
    obj.textEditor3:setName("textEditor3");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox13);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(400);
    obj.layout33:setMargins({right=10});
    obj.layout33:setName("layout33");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout33);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setXradius(5);
    obj.rectangle13:setYradius(15);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle13);
    obj.label30:setAlign("top");
    obj.label30:setHeight(20);
    obj.label30:setText("Anotações");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle13);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("anotacoes2");
    obj.textEditor4:setMargins({left=10,right=10,bottom=10});
    obj.textEditor4:setName("textEditor4");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox13);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(400);
    obj.layout34:setMargins({right=10});
    obj.layout34:setName("layout34");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout34);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(5);
    obj.rectangle14:setYradius(15);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle14);
    obj.label31:setAlign("top");
    obj.label31:setHeight(20);
    obj.label31:setText("Anotações");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle14);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("anotacoes3");
    obj.textEditor5:setMargins({left=10,right=10,bottom=10});
    obj.textEditor5:setName("textEditor5");

    obj.tab15 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab15:setParent(obj.tabControl1);
    obj.tab15:setTitle("Creditos");
    obj.tab15:setName("tab15");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab15);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox14 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox14:setParent(obj.frmTemplateCreditos);
    obj.scrollBox14:setAlign("client");
    obj.scrollBox14:setName("scrollBox14");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox14);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(250);
    obj.layout35:setName("layout35");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout35);
    obj.image3:setAlign("left");
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("logo_mesa");
    obj.image3:setMargins({right=50});
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout35);
    obj.image4:setAlign("left");
    obj.image4:setWidth(250);
    obj.image4:setHeight(250);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/ProjectName/images/RPGmeister.jpg");
    obj.image4:setName("image4");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox14);
    obj.layout36:setLeft(850);
    obj.layout36:setTop(0);
    obj.layout36:setWidth(200);
    obj.layout36:setHeight(160);
    obj.layout36:setName("layout36");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout36);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(15);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout36);
    obj.label32:setLeft(0);
    obj.label32:setTop(10);
    obj.label32:setWidth(200);
    obj.label32:setHeight(20);
    obj.label32:setText("Template feito por: ");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout36);
    obj.label33:setLeft(0);
    obj.label33:setTop(35);
    obj.label33:setWidth(200);
    obj.label33:setHeight(20);
    obj.label33:setText("Vinny (Ambesek)");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.scrollBox14);
    obj.label34:setLeft(555);
    obj.label34:setTop(275);
    obj.label34:setWidth(200);
    obj.label34:setHeight(20);
    obj.label34:setText("Versão Atual: ");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("versionInstalled");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.scrollBox14);
    obj.label35:setLeft(555);
    obj.label35:setTop(300);
    obj.label35:setWidth(200);
    obj.label35:setHeight(20);
    obj.label35:setText("Sua Versão: ");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setField("versionDownloaded");
    obj.label35:setName("label35");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox14);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox14);
    obj.button14:setLeft(555);
    obj.button14:setTop(350);
    obj.button14:setWidth(100);
    obj.button14:setText("Change Log");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox14);
    obj.button15:setLeft(667);
    obj.button15:setTop(350);
    obj.button15:setWidth(100);
    obj.button15:setText("Atualizar");
    obj.button15:setName("button15");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.scrollBox14);
    obj.label36:setLeft(555);
    obj.label36:setTop(400);
    obj.label36:setWidth(200);
    obj.label36:setHeight(20);
    obj.label36:setText("Conheça as Mesas:");
    obj.label36:setName("label36");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox14);
    obj.button16:setLeft(555);
    obj.button16:setTop(425);
    obj.button16:setWidth(100);
    obj.button16:setText("RPGmeister");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox14);
    obj.button17:setLeft(667);
    obj.button17:setTop(425);
    obj.button17:setWidth(125);
    obj.button17:setText("Nome Mesa");
    obj.button17:setName("button17");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("raw_download_link",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('raw_download_link');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
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

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclSelector:append();
        end, obj);

    obj._e_event2 = obj.rclSelector:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event3 = obj.rclSelector:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector.selectedNode;
            							self.boxDetalhesDoItem.node = node; 
            							self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet.imageCounter == nil then
            					sheet.imageCounter = 0;
            				end;
            				-- Contador que vai de 0 a 9 e reseta ao passar de 9
            				sheet.imageCounter = (sheet.imageCounter + 1) % #pics;
            				-- pegando imagem do array. O +1 é por que arrays em lua começam em 1 e não em 0
            				sheet.clickableImage = pics[sheet.imageCounter +1];
        end, obj);

    obj._e_event5 = obj.colorSelector:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            		                self.showColor.color = sheet.colorSelector or "#000000";
            		                self.colorSelector.visible = false;
            		            end;
        end, obj);

    obj._e_event6 = obj.showColor:addEventListener("onMouseDown",
        function (_, event)
            self.colorSelector:dropDown();
            		            self.colorSelector.visible = true;
        end, obj);

    obj._e_event7 = obj.showColor:addEventListener("onExit",
        function (_)
            self.colorSelector.visible = false;
        end, obj);

    obj._e_event8 = obj.button3:addEventListener("onClick",
        function (_)
            -- Aumenta um contador enquanto adiciona um objeto
            					if sheet~=nil then
            						local objetos = NDB.getChildNodes(sheet.listaDe);
            
            						local node = self.rclName:append();
            						if node~=nil then
            							local contador = #objetos;
            							for i=1, #objetos, 1 do
            								local aux = tonumber(objetos[i].contador) or 0;
            								if aux > contador then
            									contador = aux;
            								end;
            							end;
            							node.contador = contador + 1;
            						end;
            
            						self.rclName:sort();
            					end;
        end, obj);

    obj._e_event9 = obj.button4:addEventListener("onClick",
        function (_)
            -- Aumenta um contador enquanto adiciona um objeto
            					if sheet~=nil then
            						local objetos = NDB.getChildNodes(sheet.listaDe);
            						local num = #objetos + 1;
            
            						local node = self.rclName:append();
            						if node~=nil then
            							node.contador = num;
            						end;
            
            						self.rclName:sort();
            					end;
        end, obj);

    obj._e_event10 = obj.rclName:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            			        if (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            			            return -1;
            			        elseif (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            			            return 1;
            			        else   
            			            return 0;
            			        end;
        end, obj);

    obj._e_event11 = obj.popupButton:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popExemplo");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("bottomCenter", self.popupButton);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event12 = obj.button5:addEventListener("onClick",
        function (_)
            local roll = sheet.roll or "1d1-1";
            	    		local rolagem = Firecast.interpretarRolagem(roll);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event13 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            if drag then
            				    	drag:addData("imageURL", sheet.avatar)
            				    end
        end, obj);

    obj._e_event14 = obj.button6:addEventListener("onClick",
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

    obj._e_event15 = obj.button7:addEventListener("onClick",
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

    obj._e_event16 = obj.dataLink2:addEventListener("onChange",
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

    obj._e_event17 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event18 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event19 = obj.dataLink5:addEventListener("onChange",
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

    obj._e_event20 = obj.button8:addEventListener("onClick",
        function (_)
            addCurrent()
        end, obj);

    obj._e_event21 = obj.button9:addEventListener("onClick",
        function (_)
            subtractCurrent()
        end, obj);

    obj._e_event22 = obj.button10:addEventListener("onClick",
        function (_)
            setCurrent()
        end, obj);

    obj._e_event23 = obj.button11:addEventListener("onClick",
        function (_)
            addMax()
        end, obj);

    obj._e_event24 = obj.button12:addEventListener("onClick",
        function (_)
            subtractMax()
        end, obj);

    obj._e_event25 = obj.button13:addEventListener("onClick",
        function (_)
            setMax()
        end, obj);

    obj._e_event26 = obj.BarPopup:addEventListener("onNodeReady",
        function (_)
            local node = self.BarPopup.scopeNode
            			if node == nil then return end
            			
            			local selectedBar = node.selectedBar
            
            			node.AtributoBarrinha = node["Atributo"..selectedBar]
            			node.ValorMudadoAtualBarrinha = node["ValorMudadoAtual"..selectedBar]
            			node.ValorMudadoMaxBarrinha = node["ValorMudadoMax"..selectedBar]
        end, obj);

    obj._e_event27 = obj.BarPopup:addEventListener("onClose",
        function (_, canceled)
            setTimeout( function()
            				local node = self.BarPopup.scopeNode
            				if node == nil then return end
            
            				local selectedBar = node.selectedBar
            
            				if (node.ModificadorBarrinha == "igual") then
            					node["ValorTempAtual"..selectedBar] = tonumber(node.ValorMudadoAtualBarrinha or 0);
            				elseif (node.ModificadorBarrinha == "mais") then
            					node["ValorTempAtual"..selectedBar] = tonumber(node["ValorTempAtual"..selectedBar] or 0) + tonumber(node.ValorMudadoAtualBarrinha or 0);
            				elseif (node.ModificadorBarrinha == "menos") then
            					node["ValorTempAtual"..selectedBar] = tonumber(node["ValorTempAtual"..selectedBar] or 0) - tonumber(node.ValorMudadoAtualBarrinha or 0);
            				end;
            				
            				if (node.ModificadorBarrinhaMax == "igual") then
            					node["ValorTempMax"..selectedBar] = tonumber(node.ValorMudadoMaxBarrinha or 0);
            				elseif (node.ModificadorBarrinhaMax == "mais") then
            					node["ValorTempMax"..selectedBar] = tonumber(node["ValorTempMax"..selectedBar] or 0) + tonumber(node.ValorMudadoMaxBarrinha or 0);
            				elseif (node.ModificadorBarrinhaMax == "menos") then
            					node["ValorTempMax"..selectedBar] = tonumber(node["ValorTempMax"..selectedBar] or 0) - tonumber(node.ValorMudadoMaxBarrinha or 0);
            				end;
            				
            				local barrinhapc = 0
            				local barrinhapcmax = 0
            				local porcentagem = 0
            				local porcentagemmax = 0
            
            				barrinhapc = (node["ValorTempAtual"..selectedBar] - (node[selectedBar.."Valor"] or 0));
            				barrinhapcmax = (node["ValorTempMax"..selectedBar] - (node[selectedBar.."ValorMax"] or 0));
            				node[selectedBar.."Valor"] = node["ValorTempAtual"..selectedBar];
            				node[selectedBar.."ValorMax"] = node["ValorTempMax"..selectedBar];
            				
            				if ((barrinhapc ~= 0) or (barrinhapcmax ~= 0)) then
            					local nome = node.AtributoBarrinha or "Barrinha";
            					local personagem = sheet.nome or "personagem";
            					local text = "[§K2]" .. nome .. "[§K3] de [§K2]" .. personagem.. "[§K3]: ";
            					local valor = barrinhapc;
            					local valormax = barrinhapcmax;
            					
            					if tonumber(barrinhapc) >= 0 then
            						valor = "+" .. tostring(barrinhapc);
            					end;
            					if tonumber(barrinhapcmax) >= 0 then
            						valormax = "+" .. tostring(barrinhapcmax);
            					end;
            					
            					if tonumber(valormax) == 0 then
            						text = text .. valor;
            					else
            						text = text .. valor .. "/" .. valormax;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then
            						   mesaDoPersonagem.activeChat:enviarMensagem(text);
            					end;
            				end;
            			end, 100);
        end, obj);

    obj._e_event28 = obj.currentBarValue:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13)
            								if oenter then
            									self.BarPopup:close();
            								end;
        end, obj);

    obj._e_event29 = obj.maxBarValue:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13);
            								if oenter then
            									self.BarPopup:close();
            								end;
        end, obj);

    obj._e_event30 = obj.Barrinha1:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha1.color = "Green";
            							self.ValoresBarrinha1.visible = true;
            							sheet.InfoBarrinha1 = (sheet.Barrinha1Valor or 0) .. "/"	.. (sheet.Barrinha1ValorMax or 0);
        end, obj);

    obj._e_event31 = obj.Barrinha1:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha1.visible = false;
        end, obj);

    obj._e_event32 = obj.Barrinha1:addEventListener("onDblClick",
        function (_)
            sheet.Barrinha1ID = sheet.index;
            							
            							sheet.ModificadorBarrinha1 = "igual";
            							sheet.ModificadorBarrinha1Max = "igual";
            							sheet.ValorTempAtualBarrinha1 = sheet.Barrinha1Valor;
            							sheet.ValorTempMaxBarrinha1 = sheet.Barrinha1ValorMax;
            							sheet.ValorMudadoAtualBarrinha1 = sheet.Barrinha1Valor;
            							sheet.ValorMudadoMaxBarrinha1 = sheet.Barrinha1ValorMax;
            
            							local rec = self:findControlByName("PopupBarColor");
            							if rec~=nil then rec.color = "Green" end;
            							
            							local pop = self:findControlByName("BarPopup");
            							if pop~= nil then
            								pop.scopeNode = sheet
            								pop.scopeNode.selectedBar = "Barrinha1"
            								pop:show("top", self.Barrinha1)
            								pop.top = (pop.top + 29 + 10)
            							end;
        end, obj);

    obj._e_event33 = obj.InfoBarrinha1:addEventListener("onResize",
        function (_)
            self.InfoBarrinha1.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event34 = obj.dataLink6:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            self.Barrinha1.color = "Green";
        end, obj);

    obj._e_event35 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Barrinha1Valor==nil then return end;
            					if sheet.Barrinha1Valor==0 then 
            						self.Barrinha1.color = "Yellow";
            					else
            						self.Barrinha1.color = "Green";
            					end;
        end, obj);

    obj._e_event36 = obj.Barrinha2:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha2.color = "Green";
            							self.ValoresBarrinha2.visible = true;
            							sheet.InfoBarrinha2 = (sheet.Barrinha2Valor or 0) .. "/"	.. (sheet.Barrinha2ValorMax or 0);
        end, obj);

    obj._e_event37 = obj.Barrinha2:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha2.visible = false;
        end, obj);

    obj._e_event38 = obj.Barrinha2:addEventListener("onDblClick",
        function (_)
            sheet.Barrinha2ID = sheet.index;
            							
            							sheet.ModificadorBarrinha2 = "igual";
            							sheet.ModificadorBarrinha2Max = "igual";
            							sheet.ValorTempAtualBarrinha2 = sheet.Barrinha2Valor;
            							sheet.ValorTempMaxBarrinha2 = sheet.Barrinha2ValorMax;
            							sheet.ValorMudadoAtualBarrinha2 = sheet.Barrinha2Valor;
            							sheet.ValorMudadoMaxBarrinha2 = sheet.Barrinha2ValorMax;
            
            							local rec = self:findControlByName("PopupBarColor");
            							if rec~=nil then rec.color = "Green" end;
            							
            							local pop = self:findControlByName("BarPopup");
            							if pop~= nil then
            								pop.scopeNode = sheet
            								pop.scopeNode.selectedBar = "Barrinha2"
            								pop:show("top", self.Barrinha2)
            								pop.top = (pop.top + 29 + 10)
            							end;
        end, obj);

    obj._e_event39 = obj.InfoBarrinha2:addEventListener("onResize",
        function (_)
            self.InfoBarrinha2.width = (self.ValoresBarrinha2.width - 4);
        end, obj);

    obj._e_event40 = obj.dataLink8:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            self.Barrinha2.color = "Green";
        end, obj);

    obj._e_event41 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Barrinha2Valor==nil then return end;
            					if sheet.Barrinha2Valor==0 then 
            						self.Barrinha2.color = "Yellow";
            					else
            						self.Barrinha2.color = "Green";
            					end;
        end, obj);

    obj._e_event42 = obj.Barrinha3:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha3.color = "Green";
            							self.ValoresBarrinha3.visible = true;
            							sheet.InfoBarrinha3 = (sheet.Barrinha3Valor or 0) .. "/"	.. (sheet.Barrinha3ValorMax or 0);
        end, obj);

    obj._e_event43 = obj.Barrinha3:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha3.visible = false;
        end, obj);

    obj._e_event44 = obj.Barrinha3:addEventListener("onDblClick",
        function (_)
            sheet.Barrinha3ID = sheet.index;
            							
            							sheet.ModificadorBarrinha3 = "igual";
            							sheet.ModificadorBarrinha3Max = "igual";
            							sheet.ValorTempAtualBarrinha3 = sheet.Barrinha3Valor;
            							sheet.ValorTempMaxBarrinha3 = sheet.Barrinha3ValorMax;
            							sheet.ValorMudadoAtualBarrinha3 = sheet.Barrinha3Valor;
            							sheet.ValorMudadoMaxBarrinha3 = sheet.Barrinha3ValorMax;
            
            							local rec = self:findControlByName("PopupBarColor");
            							if rec~=nil then rec.color = "Green" end;
            							
            							local pop = self:findControlByName("BarPopup");
            							if pop~= nil then
            								pop.scopeNode = sheet
            								pop.scopeNode.selectedBar = "Barrinha3"
            								pop:show("top", self.Barrinha3)
            								pop.top = (pop.top + 29 + 10)
            							end;
        end, obj);

    obj._e_event45 = obj.InfoBarrinha3:addEventListener("onResize",
        function (_)
            self.InfoBarrinha3.width = (self.ValoresBarrinha3.width - 4);
        end, obj);

    obj._e_event46 = obj.dataLink10:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            self.Barrinha3.color = "Green";
        end, obj);

    obj._e_event47 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Barrinha3Valor==nil then return end;
            					if sheet.Barrinha3Valor==0 then 
            						self.Barrinha3.color = "Yellow";
            					else
            						self.Barrinha3.color = "Green";
            					end;
        end, obj);

    obj._e_event48 = obj.button14:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('link_change_log')
        end, obj);

    obj._e_event49 = obj.button15:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('raw_download_link')
        end, obj);

    obj._e_event50 = obj.button16:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event51 = obj.button17:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('link_mesa');
        end, obj);

    function obj:_releaseEvents()
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

        if self.InfoBarrinha3 ~= nil then self.InfoBarrinha3:destroy(); self.InfoBarrinha3 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.popExemplo ~= nil then self.popExemplo:destroy(); self.popExemplo = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.scrollBox13 ~= nil then self.scrollBox13:destroy(); self.scrollBox13 = nil; end;
        if self.BarPopup ~= nil then self.BarPopup:destroy(); self.BarPopup = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.Barrinha1 ~= nil then self.Barrinha1:destroy(); self.Barrinha1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.frmImportExport ~= nil then self.frmImportExport:destroy(); self.frmImportExport = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.tab15 ~= nil then self.tab15:destroy(); self.tab15 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.currentBarValue ~= nil then self.currentBarValue:destroy(); self.currentBarValue = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.InfoBarrinha2 ~= nil then self.InfoBarrinha2:destroy(); self.InfoBarrinha2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.colorSelector ~= nil then self.colorSelector:destroy(); self.colorSelector = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.frmRclCounter ~= nil then self.frmRclCounter:destroy(); self.frmRclCounter = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.ValoresBarrinha1 ~= nil then self.ValoresBarrinha1:destroy(); self.ValoresBarrinha1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.ValoresBarrinha2 ~= nil then self.ValoresBarrinha2:destroy(); self.ValoresBarrinha2 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.PopupBarColor ~= nil then self.PopupBarColor:destroy(); self.PopupBarColor = nil; end;
        if self.maxBarValue ~= nil then self.maxBarValue:destroy(); self.maxBarValue = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.ValoresBarrinha3 ~= nil then self.ValoresBarrinha3:destroy(); self.ValoresBarrinha3 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.scrollBox12 ~= nil then self.scrollBox12:destroy(); self.scrollBox12 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.popupButton ~= nil then self.popupButton:destroy(); self.popupButton = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.frmColorSelector ~= nil then self.frmColorSelector:destroy(); self.frmColorSelector = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.frmThemeControl ~= nil then self.frmThemeControl:destroy(); self.frmThemeControl = nil; end;
        if self.frmEditBar ~= nil then self.frmEditBar:destroy(); self.frmEditBar = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rclName ~= nil then self.rclName:destroy(); self.rclName = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.InfoBarrinha1 ~= nil then self.InfoBarrinha1:destroy(); self.InfoBarrinha1 = nil; end;
        if self.frmDiceRoll ~= nil then self.frmDiceRoll:destroy(); self.frmDiceRoll = nil; end;
        if self.scrollBox14 ~= nil then self.scrollBox14:destroy(); self.scrollBox14 = nil; end;
        if self.frmBarControl ~= nil then self.frmBarControl:destroy(); self.frmBarControl = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.frmPopup ~= nil then self.frmPopup:destroy(); self.frmPopup = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.frmMultImageCheckbox ~= nil then self.frmMultImageCheckbox:destroy(); self.frmMultImageCheckbox = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.Barrinha2 ~= nil then self.Barrinha2:destroy(); self.Barrinha2 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.frmAvatar ~= nil then self.frmAvatar:destroy(); self.frmAvatar = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.frmDetailList ~= nil then self.frmDetailList:destroy(); self.frmDetailList = nil; end;
        if self.showColor ~= nil then self.showColor:destroy(); self.showColor = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.Barrinha3 ~= nil then self.Barrinha3:destroy(); self.Barrinha3 = nil; end;
        if self.tab14 ~= nil then self.tab14:destroy(); self.tab14 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTemplate()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTemplate();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTemplate = {
    newEditor = newfrmTemplate, 
    new = newfrmTemplate, 
    name = "frmTemplate", 
    dataType = "Ambesek.Nefertyne.Template", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Template", 
    description=""};

frmTemplate = _frmTemplate;
Firecast.registrarForm(_frmTemplate);
Firecast.registrarDataType(_frmTemplate);

return _frmTemplate;
