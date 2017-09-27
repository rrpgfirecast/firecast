require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmTemplate()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Exemplos");
    obj.tab1:setName("tab1");

    obj.frmExamples = gui.fromHandle(_obj_newObject("form"));
    obj.frmExamples:setParent(obj.tab1);
    obj.frmExamples:setName("frmExamples");
    obj.frmExamples:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmExamples);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(45);
    obj.layout1:setHeight(45);
    obj.layout1:setName("layout1");

    obj.colorSelector = gui.fromHandle(_obj_newObject("comboBox"));
    obj.colorSelector:setParent(obj.layout1);
    obj.colorSelector:setLeft(0);
    obj.colorSelector:setTop(0);
    obj.colorSelector:setWidth(200);
    obj.colorSelector:setHeight(45);
    obj.colorSelector:setField("colorSelector");
    obj.colorSelector:setName("colorSelector");
    obj.colorSelector:setVisible(false);
    obj.colorSelector:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.colorSelector:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});

    obj.showColor = gui.fromHandle(_obj_newObject("rectangle"));
    obj.showColor:setParent(obj.layout1);
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
    obj.showColor:setHint("Muda a cor padrão da fonte do editor de texto. Você só vai notar diferença ao começar um novo paragrafo. ");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(50);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(200);
    obj.layout2:setName("layout2");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(200);
    obj.label1:setHeight(20);
    obj.label1:setText("Titulo do Layout");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(255);
    obj.rectangle2:setWidth(25);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(0);
    obj.label2:setTop(255);
    obj.label2:setWidth(25);
    obj.label2:setHeight(25);
    obj.label2:setField("countSum");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(25);
    obj.label3:setTop(255);
    obj.label3:setWidth(115);
    obj.label3:setHeight(25);
    obj.label3:setText("<- Soma contador");
    obj.label3:setName("label3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(165);
    obj.button1:setTop(255);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(190);
    obj.button2:setTop(255);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Adiciona objetos a lista com contador em relação ao tamanho da lista");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(215);
    obj.button3:setTop(255);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("O");
    obj.button3:setHint("Organizar");
    obj.button3:setName("button3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(280);
    obj.rectangle3:setWidth(240);
    obj.rectangle3:setHeight(260);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.rclName = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclName:setParent(obj.scrollBox1);
    obj.rclName:setLeft(0);
    obj.rclName:setTop(280);
    obj.rclName:setWidth(240);
    obj.rclName:setHeight(260);
    obj.rclName:setName("rclName");
    obj.rclName:setField("listaDe");
    obj.rclName:setTemplateForm("frmRecordListForm");
    obj.rclName:setLayout("vertical");

    obj.popupButton = gui.fromHandle(_obj_newObject("button"));
    obj.popupButton:setParent(obj.scrollBox1);
    obj.popupButton:setLeft(50);
    obj.popupButton:setTop(0);
    obj.popupButton:setWidth(25);
    obj.popupButton:setHeight(25);
    obj.popupButton:setText("i");
    obj.popupButton:setName("popupButton");
    obj.popupButton:setHint("Botao que abre popup");

    obj.popExemplo = gui.fromHandle(_obj_newObject("popup"));
    obj.popExemplo:setParent(obj.scrollBox1);
    obj.popExemplo:setName("popExemplo");
    obj.popExemplo:setWidth(300);
    obj.popExemplo:setHeight(400);
    obj.popExemplo:setBackOpacity(0.4);

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.popExemplo);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(300);
    obj.label4:setHeight(20);
    obj.label4:setText("Exemplo de PopUp");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");


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
				local mesa = rrpg.getMesaDe(sheet);
				mesa.activeChat:escrever(msg);
			end;
			


    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(100);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("R");
    obj.button4:setHint("Botao que faz rolagem de teste");
    obj.button4:setName("button4");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(125);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(75);
    obj.edit1:setHeight(25);
    obj.edit1:setField("roll");
    obj.edit1:setName("edit1");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(250);
    obj.button5:setTop(0);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setHint("Adicionar");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(275);
    obj.button6:setTop(0);
    obj.button6:setWidth(25);
    obj.button6:setHeight(25);
    obj.button6:setText("O");
    obj.button6:setHint("Organizar");
    obj.button6:setName("button6");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(250);
    obj.rectangle4:setTop(25);
    obj.rectangle4:setWidth(240);
    obj.rectangle4:setHeight(260);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.rclSelector = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.scrollBox1);
    obj.rclSelector:setLeft(250);
    obj.rclSelector:setTop(25);
    obj.rclSelector:setWidth(240);
    obj.rclSelector:setHeight(260);
    obj.rclSelector:setName("rclSelector");
    obj.rclSelector:setField("listaDeOpcoes");
    obj.rclSelector:setTemplateForm("frmDataScopeSelectionForm");
    obj.rclSelector:setLayout("vertical");
    obj.rclSelector:setSelectable(true);

    obj.boxDetalhesDoItem = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox1);
    obj.boxDetalhesDoItem:setLeft(500);
    obj.boxDetalhesDoItem:setTop(25);
    obj.boxDetalhesDoItem:setWidth(240);
    obj.boxDetalhesDoItem:setHeight(260);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.boxDetalhesDoItem);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.boxDetalhesDoItem);
    obj.edit2:setLeft(5);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(230);
    obj.edit2:setHeight(25);
    obj.edit2:setField("nome");
    obj.edit2:setName("edit2");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setLeft(250);
    obj.button7:setTop(290);
    obj.button7:setWidth(100);
    obj.button7:setHeight(100);
    obj.button7:setHint("click to change image");
    obj.button7:setName("button7");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.button7);
    obj.dataLink1:setField("clickableImage");
    obj.dataLink1:setDefaultValue("http://firecast.blob.core.windows.net/blobs/KEMDMPRM_386214.png");
    obj.dataLink1:setName("dataLink1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button7);
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
				


    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox1);
    obj.rectangle6:setLeft(375);
    obj.rectangle6:setTop(290);
    obj.rectangle6:setWidth(100);
    obj.rectangle6:setHeight(100);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle6);
    obj.label5:setLeft(0);
    obj.label5:setTop(40);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setText("Avatar");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle6);
    obj.image2:setAlign("client");
    obj.image2:setField("avatar");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image2:setName("image2");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Descrição");
    obj.tab2:setName("tab2");

    obj.frmTemplateDescription = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab2);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmTemplateDescription);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox2);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(1205);
    obj.rectangle7:setHeight(105);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle7);
    obj.label6:setLeft(3);
    obj.label6:setTop(1);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("DESCRIÇÃO");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle7);
    obj.label7:setLeft(10);
    obj.label7:setTop(25);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("TAMANHO");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle7);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(25);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("tamanho");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle7);
    obj.label8:setLeft(10);
    obj.label8:setTop(50);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("ALTURA");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle7);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(50);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("altura");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle7);
    obj.label9:setLeft(10);
    obj.label9:setTop(75);
    obj.label9:setWidth(90);
    obj.label9:setHeight(20);
    obj.label9:setText("PESO");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle7);
    obj.edit5:setLeft(100);
    obj.edit5:setTop(75);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("peso");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle7);
    obj.label10:setLeft(310);
    obj.label10:setTop(25);
    obj.label10:setWidth(90);
    obj.label10:setHeight(20);
    obj.label10:setText("IDADE");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle7);
    obj.edit6:setLeft(400);
    obj.edit6:setTop(25);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("idade");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle7);
    obj.label11:setLeft(310);
    obj.label11:setTop(50);
    obj.label11:setWidth(90);
    obj.label11:setHeight(20);
    obj.label11:setText("SEXO");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle7);
    obj.edit7:setLeft(400);
    obj.edit7:setTop(50);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("sexo");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle7);
    obj.label12:setLeft(310);
    obj.label12:setTop(75);
    obj.label12:setWidth(90);
    obj.label12:setHeight(20);
    obj.label12:setText("OUTROS");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle7);
    obj.edit8:setLeft(400);
    obj.edit8:setTop(75);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("aparenciaOutros");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle7);
    obj.label13:setLeft(610);
    obj.label13:setTop(25);
    obj.label13:setWidth(90);
    obj.label13:setHeight(20);
    obj.label13:setText("OLHOS");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle7);
    obj.edit9:setLeft(700);
    obj.edit9:setTop(25);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("aparenciaOlhos");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle7);
    obj.label14:setLeft(610);
    obj.label14:setTop(50);
    obj.label14:setWidth(90);
    obj.label14:setHeight(20);
    obj.label14:setText("PELE");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle7);
    obj.edit10:setLeft(700);
    obj.edit10:setTop(50);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(25);
    obj.edit10:setField("pele");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle7);
    obj.label15:setLeft(610);
    obj.label15:setTop(75);
    obj.label15:setWidth(90);
    obj.label15:setHeight(20);
    obj.label15:setText("CABELO");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle7);
    obj.edit11:setLeft(700);
    obj.edit11:setTop(75);
    obj.edit11:setWidth(200);
    obj.edit11:setHeight(25);
    obj.edit11:setField("cabelo");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle7);
    obj.label16:setLeft(910);
    obj.label16:setTop(25);
    obj.label16:setWidth(90);
    obj.label16:setHeight(20);
    obj.label16:setText("PLANO");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle7);
    obj.edit12:setLeft(1000);
    obj.edit12:setTop(25);
    obj.edit12:setWidth(200);
    obj.edit12:setHeight(25);
    obj.edit12:setField("plano");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle7);
    obj.label17:setLeft(910);
    obj.label17:setTop(50);
    obj.label17:setWidth(90);
    obj.label17:setHeight(20);
    obj.label17:setText("REGIÃO");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle7);
    obj.edit13:setLeft(1000);
    obj.edit13:setTop(50);
    obj.edit13:setWidth(200);
    obj.edit13:setHeight(25);
    obj.edit13:setField("regiao");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle7);
    obj.label18:setLeft(910);
    obj.label18:setTop(75);
    obj.label18:setWidth(90);
    obj.label18:setHeight(20);
    obj.label18:setText("REINO");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle7);
    obj.edit14:setLeft(1000);
    obj.edit14:setTop(75);
    obj.edit14:setWidth(200);
    obj.edit14:setHeight(25);
    obj.edit14:setField("reino");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setName("edit14");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox2);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(375);
    obj.layout3:setHeight(240);
    obj.layout3:setName("layout3");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(5);
    obj.label19:setTop(1);
    obj.label19:setWidth(100);
    obj.label19:setHeight(20);
    obj.label19:setText("APARÊNCIA");
    obj.label19:setName("label19");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout3);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(210);
    obj.textEditor1:setField("aparencia");
    obj.textEditor1:setName("textEditor1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox2);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(355);
    obj.layout4:setWidth(375);
    obj.layout4:setHeight(250);
    obj.layout4:setName("layout4");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout4);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout4);
    obj.label20:setLeft(5);
    obj.label20:setTop(1);
    obj.label20:setWidth(100);
    obj.label20:setHeight(20);
    obj.label20:setText("PERSONALIDADE");
    obj.label20:setName("label20");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout4);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(220);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox2);
    obj.layout5:setLeft(380);
    obj.layout5:setTop(110);
    obj.layout5:setWidth(825);
    obj.layout5:setHeight(495);
    obj.layout5:setName("layout5");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout5);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout5);
    obj.label21:setLeft(5);
    obj.label21:setTop(1);
    obj.label21:setWidth(100);
    obj.label21:setHeight(20);
    obj.label21:setText("HISTORIA");
    obj.label21:setName("label21");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout5);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Anotações");
    obj.tab3:setName("tab3");

    obj.frmTemplateNotes = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab3);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmTemplateNotes);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox3);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(0);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(580);
    obj.layout6:setName("layout6");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout6);
    obj.rectangle11:setLeft(0);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(400);
    obj.rectangle11:setHeight(580);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(5);
    obj.rectangle11:setYradius(15);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout6);
    obj.label22:setLeft(0);
    obj.label22:setTop(0);
    obj.label22:setWidth(400);
    obj.label22:setHeight(20);
    obj.label22:setText("Anotações");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout6);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(540);
    obj.textEditor3:setField("anotacoes1");
    obj.textEditor3:setName("textEditor3");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox3);
    obj.layout7:setLeft(410);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(400);
    obj.layout7:setHeight(580);
    obj.layout7:setName("layout7");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout7);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(400);
    obj.rectangle12:setHeight(580);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(15);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout7);
    obj.label23:setLeft(0);
    obj.label23:setTop(0);
    obj.label23:setWidth(400);
    obj.label23:setHeight(20);
    obj.label23:setText("Anotações");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout7);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(540);
    obj.textEditor4:setField("anotacoes2");
    obj.textEditor4:setName("textEditor4");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox3);
    obj.layout8:setLeft(820);
    obj.layout8:setTop(0);
    obj.layout8:setWidth(400);
    obj.layout8:setHeight(580);
    obj.layout8:setName("layout8");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout8);
    obj.rectangle13:setLeft(0);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(400);
    obj.rectangle13:setHeight(580);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setXradius(5);
    obj.rectangle13:setYradius(15);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout8);
    obj.label24:setLeft(0);
    obj.label24:setTop(0);
    obj.label24:setWidth(400);
    obj.label24:setHeight(20);
    obj.label24:setText("Anotações");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout8);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(540);
    obj.textEditor5:setField("anotacoes3");
    obj.textEditor5:setName("textEditor5");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Creditos");
    obj.tab4:setName("tab4");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab4);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateCreditos);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox4);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(500);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("log mesa");
    obj.image3:setName("image3");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox4);
    obj.image4:setLeft(550);
    obj.image4:setTop(0);
    obj.image4:setWidth(250);
    obj.image4:setHeight(250);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/ProjectName/images/RPGmeister.jpg");
    obj.image4:setName("image4");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox4);
    obj.layout9:setLeft(850);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(200);
    obj.layout9:setHeight(160);
    obj.layout9:setName("layout9");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout9);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(5);
    obj.rectangle14:setYradius(15);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout9);
    obj.label25:setLeft(0);
    obj.label25:setTop(10);
    obj.label25:setWidth(200);
    obj.label25:setHeight(20);
    obj.label25:setText("Template feito por: ");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout9);
    obj.label26:setLeft(0);
    obj.label26:setTop(35);
    obj.label26:setWidth(200);
    obj.label26:setHeight(20);
    obj.label26:setText("Vinny (Ambesek)");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.scrollBox4);
    obj.label27:setLeft(555);
    obj.label27:setTop(300);
    obj.label27:setWidth(100);
    obj.label27:setHeight(20);
    obj.label27:setText("Versão Atual: ");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox4);
    obj.image5:setLeft(667);
    obj.image5:setTop(300);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("link versao atual");
    obj.image5:setName("image5");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.scrollBox4);
    obj.label28:setLeft(555);
    obj.label28:setTop(325);
    obj.label28:setWidth(100);
    obj.label28:setHeight(20);
    obj.label28:setText("Ultima Versão: ");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox4);
    obj.image6:setLeft(667);
    obj.image6:setTop(325);
    obj.image6:setWidth(100);
    obj.image6:setHeight(20);
    obj.image6:setStyle("autoFit");
    obj.image6:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao01.png");
    obj.image6:setName("image6");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox4);
    obj.button8:setLeft(555);
    obj.button8:setTop(350);
    obj.button8:setWidth(100);
    obj.button8:setText("Change Log");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox4);
    obj.button9:setLeft(667);
    obj.button9:setTop(350);
    obj.button9:setWidth(100);
    obj.button9:setText("Atualizar");
    obj.button9:setName("button9");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.scrollBox4);
    obj.label29:setLeft(555);
    obj.label29:setTop(400);
    obj.label29:setWidth(200);
    obj.label29:setHeight(20);
    obj.label29:setText("Conheça as Mesas:");
    obj.label29:setName("label29");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox4);
    obj.button10:setLeft(555);
    obj.button10:setTop(425);
    obj.button10:setWidth(100);
    obj.button10:setText("RPGmeister");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox4);
    obj.button11:setLeft(667);
    obj.button11:setTop(425);
    obj.button11:setWidth(125);
    obj.button11:setText("Nome Mesa");
    obj.button11:setName("button11");

    obj._e_event0 = obj.colorSelector:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            		                self.showColor.color = sheet.colorSelector or "#000000";
            		                self.colorSelector.visible = false;
            		            end;
        end, obj);

    obj._e_event1 = obj.showColor:addEventListener("onMouseDown",
        function (self, event)
            self.colorSelector:dropDown();
            		            self.colorSelector.visible = true;
        end, obj);

    obj._e_event2 = obj.showColor:addEventListener("onExit",
        function (self)
            self.colorSelector.visible = false;
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (self)
            -- Aumenta um contador enquanto adiciona um objeto
            				if sheet~=nil then
            					local objetos = ndb.getChildNodes(sheet.listaDe);
            
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

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (self)
            -- Aumenta um contador enquanto adiciona um objeto
            				if sheet~=nil then
            					local objetos = ndb.getChildNodes(sheet.listaDe);
            					local num = #objetos + 1;
            
            					local node = self.rclName:append();
            					if node~=nil then
            						node.contador = num;
            					end;
            
            					self.rclName:sort();
            				end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclName:sort();
        end, obj);

    obj._e_event6 = obj.rclName:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            		        if (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            		            return -1;
            		        elseif (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            		            return 1;
            		        else   
            		            return 0;
            		        end;
        end, obj);

    obj._e_event7 = obj.popupButton:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("popExemplo");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("bottomCenter", self.popupButton);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event8 = obj.button4:addEventListener("onClick",
        function (self)
            local roll = sheet.roll or "1d1-1";
            	    		local rolagem = rrpg.interpretarRolagem(roll);
            				local mesa = rrpg.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Exemplo", rolagemCallback);
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclSelector:append();
        end, obj);

    obj._e_event10 = obj.button6:addEventListener("onClick",
        function (self)
            self.rclSelector:sort();
        end, obj);

    obj._e_event11 = obj.rclSelector:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            		        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event12 = obj.rclSelector:addEventListener("onSelect",
        function (self)
            local node = self.rclSelector.selectedNode;
            					self.boxDetalhesDoItem.node = node; 
            					self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (self)
            if sheet.imageCounter == nil then
            					sheet.imageCounter = 0;
            				end;
            				-- Contador que vai de 0 a 9 e reseta ao passar de 9
            				sheet.imageCounter = (sheet.imageCounter + 1) % 10;
            				-- pegando imagem do array. O +1 é por que arrays em lua começam em 1 e não em 0
            				sheet.clickableImage = pics[sheet.imageCounter +1];
        end, obj);

    obj._e_event14 = obj.image2:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('link change log')
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('link atualizar')
        end, obj);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event18 = obj.button11:addEventListener("onClick",
        function (self)
            gui.openInBrowser('link mesa');
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.frmExamples ~= nil then self.frmExamples:destroy(); self.frmExamples = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.popExemplo ~= nil then self.popExemplo:destroy(); self.popExemplo = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.popupButton ~= nil then self.popupButton:destroy(); self.popupButton = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rclName ~= nil then self.rclName:destroy(); self.rclName = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.colorSelector ~= nil then self.colorSelector:destroy(); self.colorSelector = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.showColor ~= nil then self.showColor:destroy(); self.showColor = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmTemplate);
rrpg.registrarDataType(_frmTemplate);

return _frmTemplate;
