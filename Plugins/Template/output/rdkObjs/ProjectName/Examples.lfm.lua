require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmExamples()
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
    obj:setName("frmExamples");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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

    function obj:_releaseEvents()
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rclName ~= nil then self.rclName:destroy(); self.rclName = nil; end;
        if self.popExemplo ~= nil then self.popExemplo:destroy(); self.popExemplo = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.showColor ~= nil then self.showColor:destroy(); self.showColor = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.popupButton ~= nil then self.popupButton:destroy(); self.popupButton = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.colorSelector ~= nil then self.colorSelector:destroy(); self.colorSelector = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmExamples = {
    newEditor = newfrmExamples, 
    new = newfrmExamples, 
    name = "frmExamples", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmExamples = _frmExamples;
rrpg.registrarForm(_frmExamples);

return _frmExamples;
