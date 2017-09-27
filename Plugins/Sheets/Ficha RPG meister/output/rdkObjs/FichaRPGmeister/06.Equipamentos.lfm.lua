require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister6_svg()
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
    obj:setName("frmFichaRPGmeister6_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1211);
    obj.image1:setHeight(668);
    obj.image1:setSRC("images/06.Equipamentos.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(506);
    obj.image2:setTop(70);
    obj.image2:setWidth(200);
    obj.image2:setHeight(600);
    obj.image2:setSRC("/FichaRPGmeister/images/slots.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");


			local function getNumber(text)
				local mod = "0";
				if text~= nil then
					mod = string.gsub(text, "%.", "");
					mod = string.gsub(mod, "k", "000");
					mod = string.gsub(mod, "K", "");
					mod = string.gsub(mod, "g", "");
					mod = string.gsub(mod, "P", "");
					mod = string.gsub(mod, "p", "");
					mod = string.gsub(mod, "O", "");
					mod = string.gsub(mod, "o", "");
					mod = string.gsub(mod, "X", "");
					mod = string.gsub(mod, "x", "");
					mod = string.gsub(mod, " ", "");
					mod = string.gsub(mod, ",", ".");
				end
				return tonumber(mod);
			end;

			function EnviarMudanca(valor, valormax)
				if sheet ~= nil then
					local nome = sheet.AtributoBarrinha or "Equipamento";
					local personagem = sheet.nome or "nome";
					local text = "[§K2]" .. nome .. "[§K3] de [§K2]" .. personagem.. "[§K3]: ";
					
					if tonumber(valor) >= 0 then
						valor = "+" .. tostring(valor);
					end;
					if tonumber(valormax) >= 0 then
						valormax = "+" .. tostring(valormax);
					end;
					
					if tonumber(valormax) == 0 then
						text = text .. valor;
					else
						text = text .. valor .. "/" .. valormax;
					end;
					
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					if mesaDoPersonagem ~= nil then
						   mesaDoPersonagem.activeChat:enviarMensagem(text);
					end;
				end;
			end;
			
			function RequestReload(mode)
				if sheet ~= nil then
					if mode == "begin" then
						self.rclListaDeNPC:beginUpdate();
						self.rclListaDeNPC.visible = false;
					elseif mode == "end" then
						self.rclListaDeNPC.visible = true;
						self.rclListaDeNPC:endUpdate();
					end;
				end;
			end;
		


    obj.BarrinhaPopup = gui.fromHandle(_obj_newObject("popup"));
    obj.BarrinhaPopup:setParent(obj.scrollBox1);
    obj.BarrinhaPopup:setName("BarrinhaPopup");
    obj.BarrinhaPopup:setWidth(140);
    obj.BarrinhaPopup:setHeight(66);
    obj.BarrinhaPopup:setBackOpacity(0);
    obj.BarrinhaPopup:setMargins({left=4, right=4, top=4, bottom=4});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.BarrinhaPopup);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("white");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setName("rectangle1");

    obj.CorPopupBarrinhas = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorPopupBarrinhas:setParent(obj.rectangle1);
    obj.CorPopupBarrinhas:setAlign("client");
    obj.CorPopupBarrinhas:setName("CorPopupBarrinhas");
    obj.CorPopupBarrinhas:setColor("#808080");
    obj.CorPopupBarrinhas:setXradius(5);
    obj.CorPopupBarrinhas:setYradius(5);
    obj.CorPopupBarrinhas:setOpacity(0.9);

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.CorPopupBarrinhas);
    obj.label1:setFontColor("black");
    obj.label1:setMargins({left=6, top=2});
    obj.label1:setAlign("top");
    obj.label1:setText("Valor");
    obj.label1:setField("AtributoBarrinha");
    obj.label1:setFontSize(12);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setTextTrimming("character");
    obj.label1:setName("label1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.CorPopupBarrinhas);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({top=2, left=4});
    obj.layout1:setName("layout1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(18);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setFontColor("black");
    obj.label2:setAlign("left");
    obj.label2:setText("Atual:  ");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setWidth(34);
    obj.label2:setMargins({right=2});
    obj.label2:setFontSize(12);
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setMargins({left=2});
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setTransparent(false);
    obj.comboBox1:setWidth(40);
    obj.comboBox1:setField("ModificadorBarrinha");
    obj.comboBox1:setItems({'=', '+', '-'});
    obj.comboBox1:setValues({'igual', 'mais', 'menos'});
    obj.comboBox1:setValue("igual");
    obj.comboBox1:setName("comboBox1");

    obj.ValorAtualBarrinha = gui.fromHandle(_obj_newObject("edit"));
    obj.ValorAtualBarrinha:setParent(obj.layout2);
    obj.ValorAtualBarrinha:setFontColor("white");
    obj.ValorAtualBarrinha:setMargins({left=2, right=4});
    obj.ValorAtualBarrinha:setType("number");
    obj.ValorAtualBarrinha:setAlign("client");
    obj.ValorAtualBarrinha:setField("ValorMudadoAtualBarrinha");
    obj.ValorAtualBarrinha:setName("ValorAtualBarrinha");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(18);
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setFontColor("black");
    obj.label3:setAlign("left");
    obj.label3:setText("Max:  ");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setWidth(34);
    obj.label3:setMargins({right=2});
    obj.label3:setFontSize(12);
    obj.label3:setName("label3");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout3);
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setMargins({left=2});
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setTransparent(false);
    obj.comboBox2:setWidth(40);
    obj.comboBox2:setField("ModificadorBarrinhaMax");
    obj.comboBox2:setItems({'=', '+', '-'});
    obj.comboBox2:setValues({'igual', 'mais', 'menos'});
    obj.comboBox2:setValue("igual");
    obj.comboBox2:setName("comboBox2");

    obj.ValorMaxBarrinha = gui.fromHandle(_obj_newObject("edit"));
    obj.ValorMaxBarrinha:setParent(obj.layout3);
    obj.ValorMaxBarrinha:setFontColor("white");
    obj.ValorMaxBarrinha:setMargins({left=2, right=4});
    obj.ValorMaxBarrinha:setType("number");
    obj.ValorMaxBarrinha:setAlign("client");
    obj.ValorMaxBarrinha:setField("ValorMudadoMaxBarrinha");
    obj.ValorMaxBarrinha:setName("ValorMaxBarrinha");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(1);
    obj.layout4:setTop(1);
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(222);
    obj.layout4:setName("layout4");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout4);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(5);
    obj.label4:setTop(1);
    obj.label4:setWidth(200);
    obj.label4:setHeight(20);
    obj.label4:setText("CABEÇA");
    obj.label4:setName("label4");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(5);
    obj.edit1:setTop(20);
    obj.edit1:setWidth(240);
    obj.edit1:setHeight(25);
    obj.edit1:setField("equipamentoCabeca");
    obj.edit1:setName("edit1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout4);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(47);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(140);
    obj.textEditor1:setField("descricaoCabeca");
    obj.textEditor1:setName("textEditor1");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setLeft(70);
    obj.label5:setTop(193);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setText("Kg");
    obj.label5:setName("label5");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(90);
    obj.edit2:setTop(190);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("pesoCabeca");
    obj.edit2:setName("edit2");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setLeft(147);
    obj.label6:setTop(193);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setText("$");
    obj.label6:setName("label6");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(160);
    obj.edit3:setTop(190);
    obj.edit3:setWidth(84);
    obj.edit3:setHeight(25);
    obj.edit3:setField("precoCabeca");
    obj.edit3:setName("edit3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(195);
    obj.layout5:setHeight(15);
    obj.layout5:setWidth(64);
    obj.layout5:setName("layout5");

    obj.imageCheckBox1 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout5);
    obj.imageCheckBox1:setAlign("client");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.Barrinha0 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha0:setParent(obj.imageCheckBox1);
    obj.Barrinha0:setColorMode("hl");
    obj.Barrinha0:setWidth(50);
    obj.Barrinha0:setHeight(15);
    obj.Barrinha0:setHitTest(true);
    obj.Barrinha0:setMouseGlow(true);
    obj.Barrinha0:setColor("Green");
    obj.Barrinha0:setName("Barrinha0");
    obj.Barrinha0:setField("Barrinha0Valor");
    obj.Barrinha0:setFieldMax("Barrinha0ValorMax");

    obj.ValoresBarrinha0 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha0:setParent(obj.layout4);
    obj.ValoresBarrinha0:setLeft(55);
    obj.ValoresBarrinha0:setTop(195);
    obj.ValoresBarrinha0:setWidth(90);
    obj.ValoresBarrinha0:setHeight(14);
    obj.ValoresBarrinha0:setVisible(false);
    obj.ValoresBarrinha0:setName("ValoresBarrinha0");

    obj.CorBarrinha0 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha0:setParent(obj.ValoresBarrinha0);
    obj.CorBarrinha0:setAlign("client");
    obj.CorBarrinha0:setXradius(2);
    obj.CorBarrinha0:setYradius(2);
    obj.CorBarrinha0:setName("CorBarrinha0");
    obj.CorBarrinha0:setColor("Green");

    obj.InfoBarrinha0 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha0:setParent(obj.CorBarrinha0);
    obj.InfoBarrinha0:setAlign("left");
    obj.InfoBarrinha0:setFontColor("white");
    obj.InfoBarrinha0:setFontSize(12);
    obj.InfoBarrinha0:setAutoSize(true);
    obj.InfoBarrinha0:setTextTrimming("none");
    obj.InfoBarrinha0:setWordWrap(false);
    obj.InfoBarrinha0:setName("InfoBarrinha0");
    obj.InfoBarrinha0:setField("InfoBarrinha0");
    obj.InfoBarrinha0:setHorzTextAlign("center");
    obj.InfoBarrinha0:setText("0/0");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout4);
    obj.dataLink1:setField("CorBarrinha0");
    obj.dataLink1:setDefaultValue("Green");
    obj.dataLink1:setName("dataLink1");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setLeft(252);
    obj.layout6:setTop(1);
    obj.layout6:setWidth(250);
    obj.layout6:setHeight(222);
    obj.layout6:setName("layout6");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout6);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout6);
    obj.label7:setLeft(5);
    obj.label7:setTop(1);
    obj.label7:setWidth(200);
    obj.label7:setHeight(20);
    obj.label7:setText("OLHOS");
    obj.label7:setName("label7");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(5);
    obj.edit4:setTop(20);
    obj.edit4:setWidth(240);
    obj.edit4:setHeight(25);
    obj.edit4:setField("equipamentoOlhos");
    obj.edit4:setName("edit4");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout6);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(47);
    obj.textEditor2:setWidth(240);
    obj.textEditor2:setHeight(140);
    obj.textEditor2:setField("descricaoOlhos");
    obj.textEditor2:setName("textEditor2");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout6);
    obj.label8:setLeft(70);
    obj.label8:setTop(193);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setText("Kg");
    obj.label8:setName("label8");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(90);
    obj.edit5:setTop(190);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("pesoOlhos");
    obj.edit5:setName("edit5");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setLeft(147);
    obj.label9:setTop(193);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("$");
    obj.label9:setName("label9");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(160);
    obj.edit6:setTop(190);
    obj.edit6:setWidth(84);
    obj.edit6:setHeight(25);
    obj.edit6:setField("precoOlhos");
    obj.edit6:setName("edit6");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(195);
    obj.layout7:setHeight(15);
    obj.layout7:setWidth(64);
    obj.layout7:setName("layout7");

    obj.imageCheckBox2 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout7);
    obj.imageCheckBox2:setAlign("client");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.Barrinha1 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha1:setParent(obj.imageCheckBox2);
    obj.Barrinha1:setColorMode("hl");
    obj.Barrinha1:setWidth(50);
    obj.Barrinha1:setHeight(15);
    obj.Barrinha1:setHitTest(true);
    obj.Barrinha1:setMouseGlow(true);
    obj.Barrinha1:setColor("Green");
    obj.Barrinha1:setName("Barrinha1");
    obj.Barrinha1:setField("Barrinha1Valor");
    obj.Barrinha1:setFieldMax("Barrinha1ValorMax");

    obj.ValoresBarrinha1 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha1:setParent(obj.layout6);
    obj.ValoresBarrinha1:setLeft(55);
    obj.ValoresBarrinha1:setTop(195);
    obj.ValoresBarrinha1:setWidth(90);
    obj.ValoresBarrinha1:setHeight(14);
    obj.ValoresBarrinha1:setVisible(false);
    obj.ValoresBarrinha1:setName("ValoresBarrinha1");

    obj.CorBarrinha1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.ValoresBarrinha1);
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setXradius(2);
    obj.CorBarrinha1:setYradius(2);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("Green");

    obj.InfoBarrinha1 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha1:setParent(obj.CorBarrinha1);
    obj.InfoBarrinha1:setAlign("left");
    obj.InfoBarrinha1:setFontColor("white");
    obj.InfoBarrinha1:setFontSize(12);
    obj.InfoBarrinha1:setAutoSize(true);
    obj.InfoBarrinha1:setTextTrimming("none");
    obj.InfoBarrinha1:setWordWrap(false);
    obj.InfoBarrinha1:setName("InfoBarrinha1");
    obj.InfoBarrinha1:setField("InfoBarrinha1");
    obj.InfoBarrinha1:setHorzTextAlign("center");
    obj.InfoBarrinha1:setText("0/0");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout6);
    obj.dataLink2:setField("CorBarrinha1");
    obj.dataLink2:setDefaultValue("Green");
    obj.dataLink2:setName("dataLink2");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(710);
    obj.layout8:setTop(1);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(222);
    obj.layout8:setName("layout8");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout8);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setLeft(5);
    obj.label10:setTop(1);
    obj.label10:setWidth(200);
    obj.label10:setHeight(20);
    obj.label10:setText("PESCOÇO");
    obj.label10:setName("label10");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(5);
    obj.edit7:setTop(20);
    obj.edit7:setWidth(240);
    obj.edit7:setHeight(25);
    obj.edit7:setField("equipamentoPescoco");
    obj.edit7:setName("edit7");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout8);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(47);
    obj.textEditor3:setWidth(240);
    obj.textEditor3:setHeight(140);
    obj.textEditor3:setField("descricaoPescoco");
    obj.textEditor3:setName("textEditor3");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setLeft(70);
    obj.label11:setTop(193);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("Kg");
    obj.label11:setName("label11");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(90);
    obj.edit8:setTop(190);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("pesoPescoco");
    obj.edit8:setName("edit8");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setLeft(147);
    obj.label12:setTop(193);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setText("$");
    obj.label12:setName("label12");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout8);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(160);
    obj.edit9:setTop(190);
    obj.edit9:setWidth(84);
    obj.edit9:setHeight(25);
    obj.edit9:setField("precoPescoco");
    obj.edit9:setName("edit9");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(195);
    obj.layout9:setHeight(15);
    obj.layout9:setWidth(64);
    obj.layout9:setName("layout9");

    obj.imageCheckBox3 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout9);
    obj.imageCheckBox3:setAlign("client");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.Barrinha2 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha2:setParent(obj.imageCheckBox3);
    obj.Barrinha2:setColorMode("hl");
    obj.Barrinha2:setWidth(50);
    obj.Barrinha2:setHeight(15);
    obj.Barrinha2:setHitTest(true);
    obj.Barrinha2:setMouseGlow(true);
    obj.Barrinha2:setColor("Green");
    obj.Barrinha2:setName("Barrinha2");
    obj.Barrinha2:setField("Barrinha2Valor");
    obj.Barrinha2:setFieldMax("Barrinha2ValorMax");

    obj.ValoresBarrinha2 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha2:setParent(obj.layout8);
    obj.ValoresBarrinha2:setLeft(55);
    obj.ValoresBarrinha2:setTop(195);
    obj.ValoresBarrinha2:setWidth(90);
    obj.ValoresBarrinha2:setHeight(14);
    obj.ValoresBarrinha2:setVisible(false);
    obj.ValoresBarrinha2:setName("ValoresBarrinha2");

    obj.CorBarrinha2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.ValoresBarrinha2);
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setXradius(2);
    obj.CorBarrinha2:setYradius(2);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("Green");

    obj.InfoBarrinha2 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha2:setParent(obj.CorBarrinha2);
    obj.InfoBarrinha2:setAlign("left");
    obj.InfoBarrinha2:setFontColor("white");
    obj.InfoBarrinha2:setFontSize(12);
    obj.InfoBarrinha2:setAutoSize(true);
    obj.InfoBarrinha2:setTextTrimming("none");
    obj.InfoBarrinha2:setWordWrap(false);
    obj.InfoBarrinha2:setName("InfoBarrinha2");
    obj.InfoBarrinha2:setField("InfoBarrinha2");
    obj.InfoBarrinha2:setHorzTextAlign("center");
    obj.InfoBarrinha2:setText("0/0");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout8);
    obj.dataLink3:setField("CorBarrinha2");
    obj.dataLink3:setDefaultValue("Green");
    obj.dataLink3:setName("dataLink3");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setLeft(961);
    obj.layout10:setTop(1);
    obj.layout10:setWidth(250);
    obj.layout10:setHeight(222);
    obj.layout10:setName("layout10");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout10);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout10);
    obj.label13:setLeft(5);
    obj.label13:setTop(1);
    obj.label13:setWidth(200);
    obj.label13:setHeight(20);
    obj.label13:setText("OMBROS");
    obj.label13:setName("label13");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(5);
    obj.edit10:setTop(20);
    obj.edit10:setWidth(240);
    obj.edit10:setHeight(25);
    obj.edit10:setField("equipamentoOmbros");
    obj.edit10:setName("edit10");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout10);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(47);
    obj.textEditor4:setWidth(240);
    obj.textEditor4:setHeight(140);
    obj.textEditor4:setField("descricaoOmbros");
    obj.textEditor4:setName("textEditor4");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout10);
    obj.label14:setLeft(70);
    obj.label14:setTop(193);
    obj.label14:setWidth(50);
    obj.label14:setHeight(20);
    obj.label14:setText("Kg");
    obj.label14:setName("label14");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout10);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(90);
    obj.edit11:setTop(190);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("pesoOmbros");
    obj.edit11:setName("edit11");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout10);
    obj.label15:setLeft(147);
    obj.label15:setTop(193);
    obj.label15:setWidth(50);
    obj.label15:setHeight(20);
    obj.label15:setText("$");
    obj.label15:setName("label15");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout10);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(160);
    obj.edit12:setTop(190);
    obj.edit12:setWidth(84);
    obj.edit12:setHeight(25);
    obj.edit12:setField("precoOmbros");
    obj.edit12:setName("edit12");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(195);
    obj.layout11:setHeight(15);
    obj.layout11:setWidth(64);
    obj.layout11:setName("layout11");

    obj.imageCheckBox4 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout11);
    obj.imageCheckBox4:setAlign("client");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.Barrinha3 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha3:setParent(obj.imageCheckBox4);
    obj.Barrinha3:setColorMode("hl");
    obj.Barrinha3:setWidth(50);
    obj.Barrinha3:setHeight(15);
    obj.Barrinha3:setHitTest(true);
    obj.Barrinha3:setMouseGlow(true);
    obj.Barrinha3:setColor("Green");
    obj.Barrinha3:setName("Barrinha3");
    obj.Barrinha3:setField("Barrinha3Valor");
    obj.Barrinha3:setFieldMax("Barrinha3ValorMax");

    obj.ValoresBarrinha3 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha3:setParent(obj.layout10);
    obj.ValoresBarrinha3:setLeft(55);
    obj.ValoresBarrinha3:setTop(195);
    obj.ValoresBarrinha3:setWidth(90);
    obj.ValoresBarrinha3:setHeight(14);
    obj.ValoresBarrinha3:setVisible(false);
    obj.ValoresBarrinha3:setName("ValoresBarrinha3");

    obj.CorBarrinha3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.ValoresBarrinha3);
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setXradius(2);
    obj.CorBarrinha3:setYradius(2);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("Green");

    obj.InfoBarrinha3 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha3:setParent(obj.CorBarrinha3);
    obj.InfoBarrinha3:setAlign("left");
    obj.InfoBarrinha3:setFontColor("white");
    obj.InfoBarrinha3:setFontSize(12);
    obj.InfoBarrinha3:setAutoSize(true);
    obj.InfoBarrinha3:setTextTrimming("none");
    obj.InfoBarrinha3:setWordWrap(false);
    obj.InfoBarrinha3:setName("InfoBarrinha3");
    obj.InfoBarrinha3:setField("InfoBarrinha3");
    obj.InfoBarrinha3:setHorzTextAlign("center");
    obj.InfoBarrinha3:setText("0/0");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout10);
    obj.dataLink4:setField("CorBarrinha3");
    obj.dataLink4:setDefaultValue("Green");
    obj.dataLink4:setName("dataLink4");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox1);
    obj.layout12:setLeft(1);
    obj.layout12:setTop(224);
    obj.layout12:setWidth(250);
    obj.layout12:setHeight(222);
    obj.layout12:setName("layout12");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout12);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16:setLeft(5);
    obj.label16:setTop(1);
    obj.label16:setWidth(200);
    obj.label16:setHeight(20);
    obj.label16:setText("TORSO");
    obj.label16:setName("label16");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout12);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(5);
    obj.edit13:setTop(20);
    obj.edit13:setWidth(240);
    obj.edit13:setHeight(25);
    obj.edit13:setField("equipamentoTorso");
    obj.edit13:setName("edit13");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout12);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(47);
    obj.textEditor5:setWidth(240);
    obj.textEditor5:setHeight(140);
    obj.textEditor5:setField("descricaoTorso");
    obj.textEditor5:setName("textEditor5");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout12);
    obj.label17:setLeft(70);
    obj.label17:setTop(193);
    obj.label17:setWidth(50);
    obj.label17:setHeight(20);
    obj.label17:setText("Kg");
    obj.label17:setName("label17");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout12);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(90);
    obj.edit14:setTop(190);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("pesoTorso");
    obj.edit14:setName("edit14");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout12);
    obj.label18:setLeft(147);
    obj.label18:setTop(193);
    obj.label18:setWidth(50);
    obj.label18:setHeight(20);
    obj.label18:setText("$");
    obj.label18:setName("label18");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout12);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(160);
    obj.edit15:setTop(190);
    obj.edit15:setWidth(84);
    obj.edit15:setHeight(25);
    obj.edit15:setField("precoTorso");
    obj.edit15:setName("edit15");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(195);
    obj.layout13:setHeight(15);
    obj.layout13:setWidth(64);
    obj.layout13:setName("layout13");

    obj.imageCheckBox5 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout13);
    obj.imageCheckBox5:setAlign("client");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.Barrinha4 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha4:setParent(obj.imageCheckBox5);
    obj.Barrinha4:setColorMode("hl");
    obj.Barrinha4:setWidth(50);
    obj.Barrinha4:setHeight(15);
    obj.Barrinha4:setHitTest(true);
    obj.Barrinha4:setMouseGlow(true);
    obj.Barrinha4:setColor("Green");
    obj.Barrinha4:setName("Barrinha4");
    obj.Barrinha4:setField("Barrinha4Valor");
    obj.Barrinha4:setFieldMax("Barrinha4ValorMax");

    obj.ValoresBarrinha4 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha4:setParent(obj.layout12);
    obj.ValoresBarrinha4:setLeft(55);
    obj.ValoresBarrinha4:setTop(195);
    obj.ValoresBarrinha4:setWidth(90);
    obj.ValoresBarrinha4:setHeight(14);
    obj.ValoresBarrinha4:setVisible(false);
    obj.ValoresBarrinha4:setName("ValoresBarrinha4");

    obj.CorBarrinha4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.ValoresBarrinha4);
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setXradius(2);
    obj.CorBarrinha4:setYradius(2);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("Green");

    obj.InfoBarrinha4 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha4:setParent(obj.CorBarrinha4);
    obj.InfoBarrinha4:setAlign("left");
    obj.InfoBarrinha4:setFontColor("white");
    obj.InfoBarrinha4:setFontSize(12);
    obj.InfoBarrinha4:setAutoSize(true);
    obj.InfoBarrinha4:setTextTrimming("none");
    obj.InfoBarrinha4:setWordWrap(false);
    obj.InfoBarrinha4:setName("InfoBarrinha4");
    obj.InfoBarrinha4:setField("InfoBarrinha4");
    obj.InfoBarrinha4:setHorzTextAlign("center");
    obj.InfoBarrinha4:setText("0/0");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout12);
    obj.dataLink5:setField("CorBarrinha4");
    obj.dataLink5:setDefaultValue("Green");
    obj.dataLink5:setName("dataLink5");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setLeft(252);
    obj.layout14:setTop(224);
    obj.layout14:setWidth(250);
    obj.layout14:setHeight(222);
    obj.layout14:setName("layout14");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout14);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setLeft(5);
    obj.label19:setTop(1);
    obj.label19:setWidth(200);
    obj.label19:setHeight(20);
    obj.label19:setText("CORPO (ARMADURA)");
    obj.label19:setName("label19");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(5);
    obj.edit16:setTop(20);
    obj.edit16:setWidth(240);
    obj.edit16:setHeight(25);
    obj.edit16:setField("equipamentoCorpo");
    obj.edit16:setName("edit16");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setLeft(5);
    obj.label20:setTop(50);
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setText("CA");
    obj.label20:setName("label20");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout14);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(25);
    obj.edit17:setTop(50);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(20);
    obj.edit17:setField("equipamentoCorpoCA");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout14);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(65);
    obj.edit18:setTop(50);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(20);
    obj.edit18:setField("equipamentoCorpoCAmelhoria");
    obj.edit18:setName("edit18");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout14);
    obj.label21:setLeft(110);
    obj.label21:setTop(50);
    obj.label21:setWidth(50);
    obj.label21:setHeight(20);
    obj.label21:setText("CAT");
    obj.label21:setName("label21");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout14);
    obj.comboBox3:setLeft(140);
    obj.comboBox3:setTop(50);
    obj.comboBox3:setWidth(105);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setField("equipamentoCorpoCategoria");
    obj.comboBox3:setItems({'Leve', 'Média', 'Pesada', 'Massiva'});
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setName("comboBox3");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout14);
    obj.label22:setLeft(10);
    obj.label22:setTop(75);
    obj.label22:setWidth(50);
    obj.label22:setHeight(20);
    obj.label22:setText("DES");
    obj.label22:setName("label22");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout14);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(45);
    obj.edit19:setTop(75);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(20);
    obj.edit19:setField("equipamentoCorpoDesMax");
    obj.edit19:setName("edit19");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout14);
    obj.label23:setLeft(90);
    obj.label23:setTop(75);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setText("PEN");
    obj.label23:setName("label23");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout14);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(125);
    obj.edit20:setTop(75);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(20);
    obj.edit20:setField("equipamentoCorpoPen");
    obj.edit20:setName("edit20");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout14);
    obj.label24:setLeft(170);
    obj.label24:setTop(75);
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setText("Falha");
    obj.label24:setFontSize(13);
    obj.label24:setName("label24");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout14);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(205);
    obj.edit21:setTop(75);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(20);
    obj.edit21:setField("equipamentoCorpoFalha");
    obj.edit21:setName("edit21");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout14);
    obj.label25:setLeft(10);
    obj.label25:setTop(100);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("Desl");
    obj.label25:setName("label25");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout14);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(45);
    obj.edit22:setTop(100);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(20);
    obj.edit22:setField("equipamentoCorpoDesl");
    obj.edit22:setName("edit22");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout14);
    obj.label26:setLeft(170);
    obj.label26:setTop(100);
    obj.label26:setWidth(50);
    obj.label26:setHeight(20);
    obj.label26:setText("Correr");
    obj.label26:setFontSize(12);
    obj.label26:setName("label26");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout14);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(205);
    obj.edit23:setTop(100);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(20);
    obj.edit23:setField("equipamentoCorpoCorrer");
    obj.edit23:setName("edit23");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout14);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(122);
    obj.textEditor6:setWidth(240);
    obj.textEditor6:setHeight(65);
    obj.textEditor6:setField("descricaoCorpo");
    obj.textEditor6:setName("textEditor6");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout14);
    obj.label27:setLeft(70);
    obj.label27:setTop(193);
    obj.label27:setWidth(50);
    obj.label27:setHeight(20);
    obj.label27:setText("Kg");
    obj.label27:setName("label27");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout14);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(90);
    obj.edit24:setTop(190);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("pesoCorpo");
    obj.edit24:setName("edit24");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout14);
    obj.label28:setLeft(147);
    obj.label28:setTop(193);
    obj.label28:setWidth(50);
    obj.label28:setHeight(20);
    obj.label28:setText("$");
    obj.label28:setName("label28");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout14);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(160);
    obj.edit25:setTop(190);
    obj.edit25:setWidth(84);
    obj.edit25:setHeight(25);
    obj.edit25:setField("precoCorpo");
    obj.edit25:setName("edit25");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(195);
    obj.layout15:setHeight(15);
    obj.layout15:setWidth(64);
    obj.layout15:setName("layout15");

    obj.imageCheckBox6 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout15);
    obj.imageCheckBox6:setAlign("client");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.Barrinha5 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha5:setParent(obj.imageCheckBox6);
    obj.Barrinha5:setColorMode("hl");
    obj.Barrinha5:setWidth(50);
    obj.Barrinha5:setHeight(15);
    obj.Barrinha5:setHitTest(true);
    obj.Barrinha5:setMouseGlow(true);
    obj.Barrinha5:setColor("Green");
    obj.Barrinha5:setName("Barrinha5");
    obj.Barrinha5:setField("Barrinha5Valor");
    obj.Barrinha5:setFieldMax("Barrinha5ValorMax");

    obj.ValoresBarrinha5 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha5:setParent(obj.layout14);
    obj.ValoresBarrinha5:setLeft(55);
    obj.ValoresBarrinha5:setTop(195);
    obj.ValoresBarrinha5:setWidth(90);
    obj.ValoresBarrinha5:setHeight(14);
    obj.ValoresBarrinha5:setVisible(false);
    obj.ValoresBarrinha5:setName("ValoresBarrinha5");

    obj.CorBarrinha5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha5:setParent(obj.ValoresBarrinha5);
    obj.CorBarrinha5:setAlign("client");
    obj.CorBarrinha5:setXradius(2);
    obj.CorBarrinha5:setYradius(2);
    obj.CorBarrinha5:setName("CorBarrinha5");
    obj.CorBarrinha5:setColor("Green");

    obj.InfoBarrinha5 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha5:setParent(obj.CorBarrinha5);
    obj.InfoBarrinha5:setAlign("left");
    obj.InfoBarrinha5:setFontColor("white");
    obj.InfoBarrinha5:setFontSize(12);
    obj.InfoBarrinha5:setAutoSize(true);
    obj.InfoBarrinha5:setTextTrimming("none");
    obj.InfoBarrinha5:setWordWrap(false);
    obj.InfoBarrinha5:setName("InfoBarrinha5");
    obj.InfoBarrinha5:setField("InfoBarrinha5");
    obj.InfoBarrinha5:setHorzTextAlign("center");
    obj.InfoBarrinha5:setText("0/0");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout14);
    obj.dataLink6:setField("CorBarrinha5");
    obj.dataLink6:setDefaultValue("Green");
    obj.dataLink6:setName("dataLink6");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16:setLeft(710);
    obj.layout16:setTop(224);
    obj.layout16:setWidth(250);
    obj.layout16:setHeight(222);
    obj.layout16:setName("layout16");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout16);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout16);
    obj.label29:setLeft(5);
    obj.label29:setTop(1);
    obj.label29:setWidth(200);
    obj.label29:setHeight(20);
    obj.label29:setText("PUNHOS");
    obj.label29:setName("label29");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout16);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(5);
    obj.edit26:setTop(20);
    obj.edit26:setWidth(240);
    obj.edit26:setHeight(25);
    obj.edit26:setField("equipamentoPunhos");
    obj.edit26:setName("edit26");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout16);
    obj.textEditor7:setLeft(5);
    obj.textEditor7:setTop(47);
    obj.textEditor7:setWidth(240);
    obj.textEditor7:setHeight(140);
    obj.textEditor7:setField("descricaoPunhos");
    obj.textEditor7:setName("textEditor7");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout16);
    obj.label30:setLeft(70);
    obj.label30:setTop(193);
    obj.label30:setWidth(50);
    obj.label30:setHeight(20);
    obj.label30:setText("Kg");
    obj.label30:setName("label30");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout16);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(90);
    obj.edit27:setTop(190);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("pesoPunhos");
    obj.edit27:setName("edit27");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout16);
    obj.label31:setLeft(147);
    obj.label31:setTop(193);
    obj.label31:setWidth(50);
    obj.label31:setHeight(20);
    obj.label31:setText("$");
    obj.label31:setName("label31");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout16);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(160);
    obj.edit28:setTop(190);
    obj.edit28:setWidth(84);
    obj.edit28:setHeight(25);
    obj.edit28:setField("precoPunhos");
    obj.edit28:setName("edit28");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(195);
    obj.layout17:setHeight(15);
    obj.layout17:setWidth(64);
    obj.layout17:setName("layout17");

    obj.imageCheckBox7 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout17);
    obj.imageCheckBox7:setAlign("client");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.Barrinha6 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha6:setParent(obj.imageCheckBox7);
    obj.Barrinha6:setColorMode("hl");
    obj.Barrinha6:setWidth(50);
    obj.Barrinha6:setHeight(15);
    obj.Barrinha6:setHitTest(true);
    obj.Barrinha6:setMouseGlow(true);
    obj.Barrinha6:setColor("Green");
    obj.Barrinha6:setName("Barrinha6");
    obj.Barrinha6:setField("Barrinha6Valor");
    obj.Barrinha6:setFieldMax("Barrinha6ValorMax");

    obj.ValoresBarrinha6 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha6:setParent(obj.layout16);
    obj.ValoresBarrinha6:setLeft(55);
    obj.ValoresBarrinha6:setTop(195);
    obj.ValoresBarrinha6:setWidth(90);
    obj.ValoresBarrinha6:setHeight(14);
    obj.ValoresBarrinha6:setVisible(false);
    obj.ValoresBarrinha6:setName("ValoresBarrinha6");

    obj.CorBarrinha6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha6:setParent(obj.ValoresBarrinha6);
    obj.CorBarrinha6:setAlign("client");
    obj.CorBarrinha6:setXradius(2);
    obj.CorBarrinha6:setYradius(2);
    obj.CorBarrinha6:setName("CorBarrinha6");
    obj.CorBarrinha6:setColor("Green");

    obj.InfoBarrinha6 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha6:setParent(obj.CorBarrinha6);
    obj.InfoBarrinha6:setAlign("left");
    obj.InfoBarrinha6:setFontColor("white");
    obj.InfoBarrinha6:setFontSize(12);
    obj.InfoBarrinha6:setAutoSize(true);
    obj.InfoBarrinha6:setTextTrimming("none");
    obj.InfoBarrinha6:setWordWrap(false);
    obj.InfoBarrinha6:setName("InfoBarrinha6");
    obj.InfoBarrinha6:setField("InfoBarrinha6");
    obj.InfoBarrinha6:setHorzTextAlign("center");
    obj.InfoBarrinha6:setText("0/0");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout16);
    obj.dataLink7:setField("CorBarrinha6");
    obj.dataLink7:setDefaultValue("Green");
    obj.dataLink7:setName("dataLink7");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox1);
    obj.layout18:setLeft(961);
    obj.layout18:setTop(224);
    obj.layout18:setWidth(250);
    obj.layout18:setHeight(222);
    obj.layout18:setName("layout18");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout18);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout18);
    obj.label32:setLeft(5);
    obj.label32:setTop(1);
    obj.label32:setWidth(200);
    obj.label32:setHeight(20);
    obj.label32:setText("CINTURA");
    obj.label32:setName("label32");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout18);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(5);
    obj.edit29:setTop(20);
    obj.edit29:setWidth(240);
    obj.edit29:setHeight(25);
    obj.edit29:setField("equipamentoCintura");
    obj.edit29:setName("edit29");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout18);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(47);
    obj.textEditor8:setWidth(240);
    obj.textEditor8:setHeight(140);
    obj.textEditor8:setField("descricaoCintura");
    obj.textEditor8:setName("textEditor8");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout18);
    obj.label33:setLeft(70);
    obj.label33:setTop(193);
    obj.label33:setWidth(50);
    obj.label33:setHeight(20);
    obj.label33:setText("Kg");
    obj.label33:setName("label33");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout18);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(90);
    obj.edit30:setTop(190);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("pesoCintura");
    obj.edit30:setName("edit30");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout18);
    obj.label34:setLeft(147);
    obj.label34:setTop(193);
    obj.label34:setWidth(50);
    obj.label34:setHeight(20);
    obj.label34:setText("$");
    obj.label34:setName("label34");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout18);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(160);
    obj.edit31:setTop(190);
    obj.edit31:setWidth(84);
    obj.edit31:setHeight(25);
    obj.edit31:setField("precoCintura");
    obj.edit31:setName("edit31");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(195);
    obj.layout19:setHeight(15);
    obj.layout19:setWidth(64);
    obj.layout19:setName("layout19");

    obj.imageCheckBox8 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout19);
    obj.imageCheckBox8:setAlign("client");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.Barrinha7 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha7:setParent(obj.imageCheckBox8);
    obj.Barrinha7:setColorMode("hl");
    obj.Barrinha7:setWidth(50);
    obj.Barrinha7:setHeight(15);
    obj.Barrinha7:setHitTest(true);
    obj.Barrinha7:setMouseGlow(true);
    obj.Barrinha7:setColor("Green");
    obj.Barrinha7:setName("Barrinha7");
    obj.Barrinha7:setField("Barrinha7Valor");
    obj.Barrinha7:setFieldMax("Barrinha7ValorMax");

    obj.ValoresBarrinha7 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha7:setParent(obj.layout18);
    obj.ValoresBarrinha7:setLeft(55);
    obj.ValoresBarrinha7:setTop(195);
    obj.ValoresBarrinha7:setWidth(90);
    obj.ValoresBarrinha7:setHeight(14);
    obj.ValoresBarrinha7:setVisible(false);
    obj.ValoresBarrinha7:setName("ValoresBarrinha7");

    obj.CorBarrinha7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha7:setParent(obj.ValoresBarrinha7);
    obj.CorBarrinha7:setAlign("client");
    obj.CorBarrinha7:setXradius(2);
    obj.CorBarrinha7:setYradius(2);
    obj.CorBarrinha7:setName("CorBarrinha7");
    obj.CorBarrinha7:setColor("Green");

    obj.InfoBarrinha7 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha7:setParent(obj.CorBarrinha7);
    obj.InfoBarrinha7:setAlign("left");
    obj.InfoBarrinha7:setFontColor("white");
    obj.InfoBarrinha7:setFontSize(12);
    obj.InfoBarrinha7:setAutoSize(true);
    obj.InfoBarrinha7:setTextTrimming("none");
    obj.InfoBarrinha7:setWordWrap(false);
    obj.InfoBarrinha7:setName("InfoBarrinha7");
    obj.InfoBarrinha7:setField("InfoBarrinha7");
    obj.InfoBarrinha7:setHorzTextAlign("center");
    obj.InfoBarrinha7:setText("0/0");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout18);
    obj.dataLink8:setField("CorBarrinha7");
    obj.dataLink8:setDefaultValue("Green");
    obj.dataLink8:setName("dataLink8");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(1);
    obj.layout20:setTop(447);
    obj.layout20:setWidth(250);
    obj.layout20:setHeight(222);
    obj.layout20:setName("layout20");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout20);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout20);
    obj.label35:setLeft(5);
    obj.label35:setTop(1);
    obj.label35:setWidth(200);
    obj.label35:setHeight(20);
    obj.label35:setText("MÃOS");
    obj.label35:setName("label35");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout20);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(5);
    obj.edit32:setTop(20);
    obj.edit32:setWidth(240);
    obj.edit32:setHeight(25);
    obj.edit32:setField("equipamentoMaos");
    obj.edit32:setName("edit32");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout20);
    obj.textEditor9:setLeft(5);
    obj.textEditor9:setTop(47);
    obj.textEditor9:setWidth(240);
    obj.textEditor9:setHeight(140);
    obj.textEditor9:setField("descricaoMaos");
    obj.textEditor9:setName("textEditor9");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout20);
    obj.label36:setLeft(70);
    obj.label36:setTop(193);
    obj.label36:setWidth(50);
    obj.label36:setHeight(20);
    obj.label36:setText("Kg");
    obj.label36:setName("label36");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout20);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(90);
    obj.edit33:setTop(190);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("pesoMaos");
    obj.edit33:setName("edit33");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout20);
    obj.label37:setLeft(147);
    obj.label37:setTop(193);
    obj.label37:setWidth(50);
    obj.label37:setHeight(20);
    obj.label37:setText("$");
    obj.label37:setName("label37");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout20);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(160);
    obj.edit34:setTop(190);
    obj.edit34:setWidth(84);
    obj.edit34:setHeight(25);
    obj.edit34:setField("precoMaos");
    obj.edit34:setName("edit34");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(195);
    obj.layout21:setHeight(15);
    obj.layout21:setWidth(64);
    obj.layout21:setName("layout21");

    obj.imageCheckBox9 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout21);
    obj.imageCheckBox9:setAlign("client");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.Barrinha8 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha8:setParent(obj.imageCheckBox9);
    obj.Barrinha8:setColorMode("hl");
    obj.Barrinha8:setWidth(50);
    obj.Barrinha8:setHeight(15);
    obj.Barrinha8:setHitTest(true);
    obj.Barrinha8:setMouseGlow(true);
    obj.Barrinha8:setColor("Green");
    obj.Barrinha8:setName("Barrinha8");
    obj.Barrinha8:setField("Barrinha8Valor");
    obj.Barrinha8:setFieldMax("Barrinha8ValorMax");

    obj.ValoresBarrinha8 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha8:setParent(obj.layout20);
    obj.ValoresBarrinha8:setLeft(55);
    obj.ValoresBarrinha8:setTop(195);
    obj.ValoresBarrinha8:setWidth(90);
    obj.ValoresBarrinha8:setHeight(14);
    obj.ValoresBarrinha8:setVisible(false);
    obj.ValoresBarrinha8:setName("ValoresBarrinha8");

    obj.CorBarrinha8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha8:setParent(obj.ValoresBarrinha8);
    obj.CorBarrinha8:setAlign("client");
    obj.CorBarrinha8:setXradius(2);
    obj.CorBarrinha8:setYradius(2);
    obj.CorBarrinha8:setName("CorBarrinha8");
    obj.CorBarrinha8:setColor("Green");

    obj.InfoBarrinha8 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha8:setParent(obj.CorBarrinha8);
    obj.InfoBarrinha8:setAlign("left");
    obj.InfoBarrinha8:setFontColor("white");
    obj.InfoBarrinha8:setFontSize(12);
    obj.InfoBarrinha8:setAutoSize(true);
    obj.InfoBarrinha8:setTextTrimming("none");
    obj.InfoBarrinha8:setWordWrap(false);
    obj.InfoBarrinha8:setName("InfoBarrinha8");
    obj.InfoBarrinha8:setField("InfoBarrinha8");
    obj.InfoBarrinha8:setHorzTextAlign("center");
    obj.InfoBarrinha8:setText("0/0");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout20);
    obj.dataLink9:setField("CorBarrinha8");
    obj.dataLink9:setDefaultValue("Green");
    obj.dataLink9:setName("dataLink9");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox1);
    obj.layout22:setLeft(252);
    obj.layout22:setTop(447);
    obj.layout22:setWidth(250);
    obj.layout22:setHeight(222);
    obj.layout22:setName("layout22");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout22);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout22);
    obj.label38:setLeft(5);
    obj.label38:setTop(1);
    obj.label38:setWidth(200);
    obj.label38:setHeight(20);
    obj.label38:setText("DEDO I");
    obj.label38:setName("label38");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout22);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(5);
    obj.edit35:setTop(20);
    obj.edit35:setWidth(240);
    obj.edit35:setHeight(25);
    obj.edit35:setField("equipamentoDedosI");
    obj.edit35:setName("edit35");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout22);
    obj.textEditor10:setLeft(5);
    obj.textEditor10:setTop(47);
    obj.textEditor10:setWidth(240);
    obj.textEditor10:setHeight(140);
    obj.textEditor10:setField("descricaoDedosI");
    obj.textEditor10:setName("textEditor10");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout22);
    obj.label39:setLeft(70);
    obj.label39:setTop(193);
    obj.label39:setWidth(50);
    obj.label39:setHeight(20);
    obj.label39:setText("Kg");
    obj.label39:setName("label39");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout22);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(90);
    obj.edit36:setTop(190);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("pesoDedosI");
    obj.edit36:setName("edit36");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout22);
    obj.label40:setLeft(147);
    obj.label40:setTop(193);
    obj.label40:setWidth(50);
    obj.label40:setHeight(20);
    obj.label40:setText("$");
    obj.label40:setName("label40");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout22);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(160);
    obj.edit37:setTop(190);
    obj.edit37:setWidth(84);
    obj.edit37:setHeight(25);
    obj.edit37:setField("precoDedosI");
    obj.edit37:setName("edit37");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(195);
    obj.layout23:setHeight(15);
    obj.layout23:setWidth(64);
    obj.layout23:setName("layout23");

    obj.imageCheckBox10 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout23);
    obj.imageCheckBox10:setAlign("client");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.Barrinha9 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha9:setParent(obj.imageCheckBox10);
    obj.Barrinha9:setColorMode("hl");
    obj.Barrinha9:setWidth(50);
    obj.Barrinha9:setHeight(15);
    obj.Barrinha9:setHitTest(true);
    obj.Barrinha9:setMouseGlow(true);
    obj.Barrinha9:setColor("Green");
    obj.Barrinha9:setName("Barrinha9");
    obj.Barrinha9:setField("Barrinha9Valor");
    obj.Barrinha9:setFieldMax("Barrinha9ValorMax");

    obj.ValoresBarrinha9 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha9:setParent(obj.layout22);
    obj.ValoresBarrinha9:setLeft(55);
    obj.ValoresBarrinha9:setTop(195);
    obj.ValoresBarrinha9:setWidth(90);
    obj.ValoresBarrinha9:setHeight(14);
    obj.ValoresBarrinha9:setVisible(false);
    obj.ValoresBarrinha9:setName("ValoresBarrinha9");

    obj.CorBarrinha9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha9:setParent(obj.ValoresBarrinha9);
    obj.CorBarrinha9:setAlign("client");
    obj.CorBarrinha9:setXradius(2);
    obj.CorBarrinha9:setYradius(2);
    obj.CorBarrinha9:setName("CorBarrinha9");
    obj.CorBarrinha9:setColor("Green");

    obj.InfoBarrinha9 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha9:setParent(obj.CorBarrinha9);
    obj.InfoBarrinha9:setAlign("left");
    obj.InfoBarrinha9:setFontColor("white");
    obj.InfoBarrinha9:setFontSize(12);
    obj.InfoBarrinha9:setAutoSize(true);
    obj.InfoBarrinha9:setTextTrimming("none");
    obj.InfoBarrinha9:setWordWrap(false);
    obj.InfoBarrinha9:setName("InfoBarrinha9");
    obj.InfoBarrinha9:setField("InfoBarrinha9");
    obj.InfoBarrinha9:setHorzTextAlign("center");
    obj.InfoBarrinha9:setText("0/0");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout22);
    obj.dataLink10:setField("CorBarrinha9");
    obj.dataLink10:setDefaultValue("Green");
    obj.dataLink10:setName("dataLink10");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox1);
    obj.layout24:setLeft(710);
    obj.layout24:setTop(447);
    obj.layout24:setWidth(250);
    obj.layout24:setHeight(222);
    obj.layout24:setName("layout24");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout24);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout24);
    obj.label41:setLeft(5);
    obj.label41:setTop(1);
    obj.label41:setWidth(200);
    obj.label41:setHeight(20);
    obj.label41:setText("DEDO II");
    obj.label41:setName("label41");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout24);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(5);
    obj.edit38:setTop(20);
    obj.edit38:setWidth(240);
    obj.edit38:setHeight(25);
    obj.edit38:setField("equipamentoDesdosII");
    obj.edit38:setName("edit38");

    obj.textEditor11 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout24);
    obj.textEditor11:setLeft(5);
    obj.textEditor11:setTop(47);
    obj.textEditor11:setWidth(240);
    obj.textEditor11:setHeight(140);
    obj.textEditor11:setField("descricaoDesdosII");
    obj.textEditor11:setName("textEditor11");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout24);
    obj.label42:setLeft(70);
    obj.label42:setTop(193);
    obj.label42:setWidth(50);
    obj.label42:setHeight(20);
    obj.label42:setText("Kg");
    obj.label42:setName("label42");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout24);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(90);
    obj.edit39:setTop(190);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("pesoDesdosII");
    obj.edit39:setName("edit39");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout24);
    obj.label43:setLeft(147);
    obj.label43:setTop(193);
    obj.label43:setWidth(50);
    obj.label43:setHeight(20);
    obj.label43:setText("$");
    obj.label43:setName("label43");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout24);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(160);
    obj.edit40:setTop(190);
    obj.edit40:setWidth(84);
    obj.edit40:setHeight(25);
    obj.edit40:setField("precoDesdosII");
    obj.edit40:setName("edit40");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(195);
    obj.layout25:setHeight(15);
    obj.layout25:setWidth(64);
    obj.layout25:setName("layout25");

    obj.imageCheckBox11 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout25);
    obj.imageCheckBox11:setAlign("client");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.Barrinha10 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha10:setParent(obj.imageCheckBox11);
    obj.Barrinha10:setColorMode("hl");
    obj.Barrinha10:setWidth(50);
    obj.Barrinha10:setHeight(15);
    obj.Barrinha10:setHitTest(true);
    obj.Barrinha10:setMouseGlow(true);
    obj.Barrinha10:setColor("Green");
    obj.Barrinha10:setName("Barrinha10");
    obj.Barrinha10:setField("Barrinha10Valor");
    obj.Barrinha10:setFieldMax("Barrinha10ValorMax");

    obj.ValoresBarrinha10 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha10:setParent(obj.layout24);
    obj.ValoresBarrinha10:setLeft(55);
    obj.ValoresBarrinha10:setTop(195);
    obj.ValoresBarrinha10:setWidth(90);
    obj.ValoresBarrinha10:setHeight(14);
    obj.ValoresBarrinha10:setVisible(false);
    obj.ValoresBarrinha10:setName("ValoresBarrinha10");

    obj.CorBarrinha10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha10:setParent(obj.ValoresBarrinha10);
    obj.CorBarrinha10:setAlign("client");
    obj.CorBarrinha10:setXradius(2);
    obj.CorBarrinha10:setYradius(2);
    obj.CorBarrinha10:setName("CorBarrinha10");
    obj.CorBarrinha10:setColor("Green");

    obj.InfoBarrinha10 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha10:setParent(obj.CorBarrinha10);
    obj.InfoBarrinha10:setAlign("left");
    obj.InfoBarrinha10:setFontColor("white");
    obj.InfoBarrinha10:setFontSize(12);
    obj.InfoBarrinha10:setAutoSize(true);
    obj.InfoBarrinha10:setTextTrimming("none");
    obj.InfoBarrinha10:setWordWrap(false);
    obj.InfoBarrinha10:setName("InfoBarrinha10");
    obj.InfoBarrinha10:setField("InfoBarrinha10");
    obj.InfoBarrinha10:setHorzTextAlign("center");
    obj.InfoBarrinha10:setText("0/0");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout24);
    obj.dataLink11:setField("CorBarrinha10");
    obj.dataLink11:setDefaultValue("Green");
    obj.dataLink11:setName("dataLink11");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox1);
    obj.layout26:setLeft(961);
    obj.layout26:setTop(447);
    obj.layout26:setWidth(250);
    obj.layout26:setHeight(222);
    obj.layout26:setName("layout26");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout26);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout26);
    obj.label44:setLeft(5);
    obj.label44:setTop(1);
    obj.label44:setWidth(200);
    obj.label44:setHeight(20);
    obj.label44:setText("PÉS");
    obj.label44:setName("label44");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout26);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(5);
    obj.edit41:setTop(20);
    obj.edit41:setWidth(240);
    obj.edit41:setHeight(25);
    obj.edit41:setField("equipamentoPes");
    obj.edit41:setName("edit41");

    obj.textEditor12 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout26);
    obj.textEditor12:setLeft(5);
    obj.textEditor12:setTop(47);
    obj.textEditor12:setWidth(240);
    obj.textEditor12:setHeight(140);
    obj.textEditor12:setField("descricaoPes");
    obj.textEditor12:setName("textEditor12");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout26);
    obj.label45:setLeft(70);
    obj.label45:setTop(193);
    obj.label45:setWidth(50);
    obj.label45:setHeight(20);
    obj.label45:setText("Kg");
    obj.label45:setName("label45");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout26);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(90);
    obj.edit42:setTop(190);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("pesoPes");
    obj.edit42:setName("edit42");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout26);
    obj.label46:setLeft(147);
    obj.label46:setTop(193);
    obj.label46:setWidth(50);
    obj.label46:setHeight(20);
    obj.label46:setText("$");
    obj.label46:setName("label46");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout26);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(160);
    obj.edit43:setTop(190);
    obj.edit43:setWidth(84);
    obj.edit43:setHeight(25);
    obj.edit43:setField("precoPes");
    obj.edit43:setName("edit43");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(195);
    obj.layout27:setHeight(15);
    obj.layout27:setWidth(64);
    obj.layout27:setName("layout27");

    obj.imageCheckBox12 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout27);
    obj.imageCheckBox12:setAlign("client");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.Barrinha11 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha11:setParent(obj.imageCheckBox12);
    obj.Barrinha11:setColorMode("hl");
    obj.Barrinha11:setWidth(50);
    obj.Barrinha11:setHeight(15);
    obj.Barrinha11:setHitTest(true);
    obj.Barrinha11:setMouseGlow(true);
    obj.Barrinha11:setColor("Green");
    obj.Barrinha11:setName("Barrinha11");
    obj.Barrinha11:setField("Barrinha11Valor");
    obj.Barrinha11:setFieldMax("Barrinha11ValorMax");

    obj.ValoresBarrinha11 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha11:setParent(obj.layout26);
    obj.ValoresBarrinha11:setLeft(55);
    obj.ValoresBarrinha11:setTop(195);
    obj.ValoresBarrinha11:setWidth(90);
    obj.ValoresBarrinha11:setHeight(14);
    obj.ValoresBarrinha11:setVisible(false);
    obj.ValoresBarrinha11:setName("ValoresBarrinha11");

    obj.CorBarrinha11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha11:setParent(obj.ValoresBarrinha11);
    obj.CorBarrinha11:setAlign("client");
    obj.CorBarrinha11:setXradius(2);
    obj.CorBarrinha11:setYradius(2);
    obj.CorBarrinha11:setName("CorBarrinha11");
    obj.CorBarrinha11:setColor("Green");

    obj.InfoBarrinha11 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha11:setParent(obj.CorBarrinha11);
    obj.InfoBarrinha11:setAlign("left");
    obj.InfoBarrinha11:setFontColor("white");
    obj.InfoBarrinha11:setFontSize(12);
    obj.InfoBarrinha11:setAutoSize(true);
    obj.InfoBarrinha11:setTextTrimming("none");
    obj.InfoBarrinha11:setWordWrap(false);
    obj.InfoBarrinha11:setName("InfoBarrinha11");
    obj.InfoBarrinha11:setField("InfoBarrinha11");
    obj.InfoBarrinha11:setHorzTextAlign("center");
    obj.InfoBarrinha11:setText("0/0");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout26);
    obj.dataLink12:setField("CorBarrinha11");
    obj.dataLink12:setDefaultValue("Green");
    obj.dataLink12:setName("dataLink12");

    obj._e_event0 = obj.BarrinhaPopup:addEventListener("onClose",
        function (self, canceled)
            setTimeout( function()
            					if (sheet.ModificadorBarrinha == "igual") then
            						sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            					elseif (sheet.ModificadorBarrinha == "mais") then
            						sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorTempAtualBarrinha or 0) + tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            					elseif (sheet.ModificadorBarrinha == "menos") then
            						sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorTempAtualBarrinha or 0) - tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            					end;
            					
            					if (sheet.ModificadorBarrinhaMax == "igual") then
            						sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            					elseif (sheet.ModificadorBarrinhaMax == "mais") then
            						sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorTempMaxBarrinha or 0) + tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            					elseif (sheet.ModificadorBarrinhaMax == "menos") then
            						sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorTempMaxBarrinha or 0) - tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            					end;
            					
            					local barrinhapc = 0
            					local barrinhapcmax = 0
            					local porcentagem = 0
            					local porcentagemmax = 0
            
            					barrinhapc = (sheet.ValorTempAtualBarrinha - (sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "Valor"] or 0));
            					barrinhapcmax = (sheet.ValorTempMaxBarrinha - (sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "ValorMax"] or 0));
            					sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "Valor"] = sheet.ValorTempAtualBarrinha;
            					sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "ValorMax"] = sheet.ValorTempMaxBarrinha;
            					
            					if ((barrinhapc ~= 0) or (barrinhapcmax ~= 0)) then
            						local nome = sheet.AtributoBarrinha or "Equipamento";
            						local personagem = sheet.nome or "nome";
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
            						
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						if mesaDoPersonagem ~= nil then
            							   mesaDoPersonagem.activeChat:enviarMensagem(text);
            						end;
            					end;
            				end, 100);
        end, obj);

    obj._e_event1 = obj.ValorAtualBarrinha:addEventListener("onKeyDown",
        function (self, event)
            local oenter = (event.keyCode == 13)
            									if oenter then
            										self.BarrinhaPopup:close();
            									end;
        end, obj);

    obj._e_event2 = obj.ValorMaxBarrinha:addEventListener("onKeyDown",
        function (self, event)
            local oenter = (event.keyCode == 13);
            									if oenter then
            										self.BarrinhaPopup:close();
            									end;
        end, obj);

    obj._e_event3 = obj.Barrinha0:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha0.color = "Green";
            							self.ValoresBarrinha0.visible = true;
            							sheet.InfoBarrinha0 = (sheet.Barrinha0Valor or 0) .. "/"	.. (sheet.Barrinha0ValorMax or 0);
        end, obj);

    obj._e_event4 = obj.Barrinha0:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha0.visible = false;
        end, obj);

    obj._e_event5 = obj.Barrinha0:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 0;
            							sheet.AtributoBarrinha = sheet.equipamentoCabeca;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha0Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha0ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha0Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha0ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha0);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event6 = obj.InfoBarrinha0:addEventListener("onResize",
        function (self)
            self.InfoBarrinha0.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event7 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha0.color = "Green";
        end, obj);

    obj._e_event8 = obj.Barrinha1:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha1.color = "Green";
            							self.ValoresBarrinha1.visible = true;
            							sheet.InfoBarrinha1 = (sheet.Barrinha1Valor or 0) .. "/"	.. (sheet.Barrinha1ValorMax or 0);
        end, obj);

    obj._e_event9 = obj.Barrinha1:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha1.visible = false;
        end, obj);

    obj._e_event10 = obj.Barrinha1:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 1;
            							sheet.AtributoBarrinha = sheet.equipamentoOlhos;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha1Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha1ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha1Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha1ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha1);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event11 = obj.InfoBarrinha1:addEventListener("onResize",
        function (self)
            self.InfoBarrinha1.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event12 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha1.color = "Green";
        end, obj);

    obj._e_event13 = obj.Barrinha2:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha2.color = "Green";
            							self.ValoresBarrinha2.visible = true;
            							sheet.InfoBarrinha2 = (sheet.Barrinha2Valor or 0) .. "/"	.. (sheet.Barrinha2ValorMax or 0);
        end, obj);

    obj._e_event14 = obj.Barrinha2:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha2.visible = false;
        end, obj);

    obj._e_event15 = obj.Barrinha2:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 2;
            							sheet.AtributoBarrinha = sheet.equipamentoPescoco;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha2Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha2ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha2Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha2ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha2);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event16 = obj.InfoBarrinha2:addEventListener("onResize",
        function (self)
            self.InfoBarrinha2.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event17 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha2.color = "Green";
        end, obj);

    obj._e_event18 = obj.Barrinha3:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha3.color = "Green";
            							self.ValoresBarrinha3.visible = true;
            							sheet.InfoBarrinha3 = (sheet.Barrinha3Valor or 0) .. "/"	.. (sheet.Barrinha3ValorMax or 0);
        end, obj);

    obj._e_event19 = obj.Barrinha3:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha3.visible = false;
        end, obj);

    obj._e_event20 = obj.Barrinha3:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 3;
            							sheet.AtributoBarrinha = sheet.equipamentoOmbros;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha3Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha3ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha3Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha3ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha3);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event21 = obj.InfoBarrinha3:addEventListener("onResize",
        function (self)
            self.InfoBarrinha3.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event22 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha3.color = "Green";
        end, obj);

    obj._e_event23 = obj.Barrinha4:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha4.color = "Green";
            							self.ValoresBarrinha4.visible = true;
            							sheet.InfoBarrinha4 = (sheet.Barrinha4Valor or 0) .. "/"	.. (sheet.Barrinha4ValorMax or 0);
        end, obj);

    obj._e_event24 = obj.Barrinha4:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha4.visible = false;
        end, obj);

    obj._e_event25 = obj.Barrinha4:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 4;
            							sheet.AtributoBarrinha = sheet.equipamentoTorso;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha4Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha4ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha4Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha4ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha4);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event26 = obj.InfoBarrinha4:addEventListener("onResize",
        function (self)
            self.InfoBarrinha4.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event27 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha4.color = "Green";
        end, obj);

    obj._e_event28 = obj.Barrinha5:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha5.color = "Green";
            							self.ValoresBarrinha5.visible = true;
            							sheet.InfoBarrinha5 = (sheet.Barrinha5Valor or 0) .. "/"	.. (sheet.Barrinha5ValorMax or 0);
        end, obj);

    obj._e_event29 = obj.Barrinha5:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha5.visible = false;
        end, obj);

    obj._e_event30 = obj.Barrinha5:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 5;
            							sheet.AtributoBarrinha = sheet.equipamentoCorpo;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha5Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha5ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha5Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha5ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha5);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event31 = obj.InfoBarrinha5:addEventListener("onResize",
        function (self)
            self.InfoBarrinha5.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event32 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha5.color = "Green";
        end, obj);

    obj._e_event33 = obj.Barrinha6:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha6.color = "Green";
            							self.ValoresBarrinha6.visible = true;
            							sheet.InfoBarrinha6 = (sheet.Barrinha6Valor or 0) .. "/"	.. (sheet.Barrinha6ValorMax or 0);
        end, obj);

    obj._e_event34 = obj.Barrinha6:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha6.visible = false;
        end, obj);

    obj._e_event35 = obj.Barrinha6:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 6;
            							sheet.AtributoBarrinha = sheet.equipamentoPunhos;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha6Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha6ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha6Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha6ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha6);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event36 = obj.InfoBarrinha6:addEventListener("onResize",
        function (self)
            self.InfoBarrinha6.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event37 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha6.color = "Green";
        end, obj);

    obj._e_event38 = obj.Barrinha7:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha7.color = "Green";
            							self.ValoresBarrinha7.visible = true;
            							sheet.InfoBarrinha7 = (sheet.Barrinha7Valor or 0) .. "/"	.. (sheet.Barrinha7ValorMax or 0);
        end, obj);

    obj._e_event39 = obj.Barrinha7:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha7.visible = false;
        end, obj);

    obj._e_event40 = obj.Barrinha7:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 7;
            							sheet.AtributoBarrinha = sheet.equipamentoCintura;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha7Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha7ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha7Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha7ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha7);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event41 = obj.InfoBarrinha7:addEventListener("onResize",
        function (self)
            self.InfoBarrinha7.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event42 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha7.color = "Green";
        end, obj);

    obj._e_event43 = obj.Barrinha8:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha8.color = "Green";
            							self.ValoresBarrinha8.visible = true;
            							sheet.InfoBarrinha8 = (sheet.Barrinha8Valor or 0) .. "/"	.. (sheet.Barrinha8ValorMax or 0);
        end, obj);

    obj._e_event44 = obj.Barrinha8:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha8.visible = false;
        end, obj);

    obj._e_event45 = obj.Barrinha8:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 8;
            							sheet.AtributoBarrinha = sheet.equipamentoMaos;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha8Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha8ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha8Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha8ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha8);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event46 = obj.InfoBarrinha8:addEventListener("onResize",
        function (self)
            self.InfoBarrinha8.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event47 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha8.color = "Green";
        end, obj);

    obj._e_event48 = obj.Barrinha9:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha9.color = "Green";
            							self.ValoresBarrinha9.visible = true;
            							sheet.InfoBarrinha9 = (sheet.Barrinha9Valor or 0) .. "/"	.. (sheet.Barrinha9ValorMax or 0);
        end, obj);

    obj._e_event49 = obj.Barrinha9:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha9.visible = false;
        end, obj);

    obj._e_event50 = obj.Barrinha9:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 9;
            							sheet.AtributoBarrinha = sheet.equipamentoDedosI;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha9Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha9ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha9Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha9ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha9);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event51 = obj.InfoBarrinha9:addEventListener("onResize",
        function (self)
            self.InfoBarrinha9.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event52 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha9.color = "Green";
        end, obj);

    obj._e_event53 = obj.Barrinha10:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha10.color = "Green";
            							self.ValoresBarrinha10.visible = true;
            							sheet.InfoBarrinha10 = (sheet.Barrinha10Valor or 0) .. "/"	.. (sheet.Barrinha10ValorMax or 0);
        end, obj);

    obj._e_event54 = obj.Barrinha10:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha10.visible = false;
        end, obj);

    obj._e_event55 = obj.Barrinha10:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 10;
            							sheet.AtributoBarrinha = sheet.equipamentoDesdosII;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha10Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha10ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha10Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha10ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha10);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event56 = obj.InfoBarrinha10:addEventListener("onResize",
        function (self)
            self.InfoBarrinha10.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event57 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha10.color = "Green";
        end, obj);

    obj._e_event58 = obj.Barrinha11:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha11.color = "Green";
            							self.ValoresBarrinha11.visible = true;
            							sheet.InfoBarrinha11 = (sheet.Barrinha11Valor or 0) .. "/"	.. (sheet.Barrinha11ValorMax or 0);
        end, obj);

    obj._e_event59 = obj.Barrinha11:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha11.visible = false;
        end, obj);

    obj._e_event60 = obj.Barrinha11:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 11;
            							sheet.AtributoBarrinha = sheet.equipamentoPes;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha11Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha11ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha11Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha11ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha11);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event61 = obj.InfoBarrinha11:addEventListener("onResize",
        function (self)
            self.InfoBarrinha11.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event62 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha11.color = "Green";
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.InfoBarrinha3 ~= nil then self.InfoBarrinha3:destroy(); self.InfoBarrinha3 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.CorBarrinha6 ~= nil then self.CorBarrinha6:destroy(); self.CorBarrinha6 = nil; end;
        if self.ValoresBarrinha4 ~= nil then self.ValoresBarrinha4:destroy(); self.ValoresBarrinha4 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.InfoBarrinha5 ~= nil then self.InfoBarrinha5:destroy(); self.InfoBarrinha5 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.Barrinha1 ~= nil then self.Barrinha1:destroy(); self.Barrinha1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.Barrinha9 ~= nil then self.Barrinha9:destroy(); self.Barrinha9 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.InfoBarrinha6 ~= nil then self.InfoBarrinha6:destroy(); self.InfoBarrinha6 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.ValoresBarrinha7 ~= nil then self.ValoresBarrinha7:destroy(); self.ValoresBarrinha7 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Barrinha4 ~= nil then self.Barrinha4:destroy(); self.Barrinha4 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.CorBarrinha10 ~= nil then self.CorBarrinha10:destroy(); self.CorBarrinha10 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.CorBarrinha9 ~= nil then self.CorBarrinha9:destroy(); self.CorBarrinha9 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.ValorMaxBarrinha ~= nil then self.ValorMaxBarrinha:destroy(); self.ValorMaxBarrinha = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.CorBarrinha0 ~= nil then self.CorBarrinha0:destroy(); self.CorBarrinha0 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.CorPopupBarrinhas ~= nil then self.CorPopupBarrinhas:destroy(); self.CorPopupBarrinhas = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.InfoBarrinha2 ~= nil then self.InfoBarrinha2:destroy(); self.InfoBarrinha2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.ValoresBarrinha11 ~= nil then self.ValoresBarrinha11:destroy(); self.ValoresBarrinha11 = nil; end;
        if self.ValorAtualBarrinha ~= nil then self.ValorAtualBarrinha:destroy(); self.ValorAtualBarrinha = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.ValoresBarrinha1 ~= nil then self.ValoresBarrinha1:destroy(); self.ValoresBarrinha1 = nil; end;
        if self.ValoresBarrinha2 ~= nil then self.ValoresBarrinha2:destroy(); self.ValoresBarrinha2 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.CorBarrinha5 ~= nil then self.CorBarrinha5:destroy(); self.CorBarrinha5 = nil; end;
        if self.ValoresBarrinha10 ~= nil then self.ValoresBarrinha10:destroy(); self.ValoresBarrinha10 = nil; end;
        if self.BarrinhaPopup ~= nil then self.BarrinhaPopup:destroy(); self.BarrinhaPopup = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.Barrinha5 ~= nil then self.Barrinha5:destroy(); self.Barrinha5 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.Barrinha11 ~= nil then self.Barrinha11:destroy(); self.Barrinha11 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.Barrinha8 ~= nil then self.Barrinha8:destroy(); self.Barrinha8 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.Barrinha0 ~= nil then self.Barrinha0:destroy(); self.Barrinha0 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.InfoBarrinha9 ~= nil then self.InfoBarrinha9:destroy(); self.InfoBarrinha9 = nil; end;
        if self.InfoBarrinha0 ~= nil then self.InfoBarrinha0:destroy(); self.InfoBarrinha0 = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.InfoBarrinha7 ~= nil then self.InfoBarrinha7:destroy(); self.InfoBarrinha7 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.ValoresBarrinha3 ~= nil then self.ValoresBarrinha3:destroy(); self.ValoresBarrinha3 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.InfoBarrinha4 ~= nil then self.InfoBarrinha4:destroy(); self.InfoBarrinha4 = nil; end;
        if self.ValoresBarrinha5 ~= nil then self.ValoresBarrinha5:destroy(); self.ValoresBarrinha5 = nil; end;
        if self.ValoresBarrinha8 ~= nil then self.ValoresBarrinha8:destroy(); self.ValoresBarrinha8 = nil; end;
        if self.ValoresBarrinha0 ~= nil then self.ValoresBarrinha0:destroy(); self.ValoresBarrinha0 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.InfoBarrinha8 ~= nil then self.InfoBarrinha8:destroy(); self.InfoBarrinha8 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.CorBarrinha8 ~= nil then self.CorBarrinha8:destroy(); self.CorBarrinha8 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.Barrinha10 ~= nil then self.Barrinha10:destroy(); self.Barrinha10 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.InfoBarrinha1 ~= nil then self.InfoBarrinha1:destroy(); self.InfoBarrinha1 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.Barrinha6 ~= nil then self.Barrinha6:destroy(); self.Barrinha6 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.InfoBarrinha10 ~= nil then self.InfoBarrinha10:destroy(); self.InfoBarrinha10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.ValoresBarrinha6 ~= nil then self.ValoresBarrinha6:destroy(); self.ValoresBarrinha6 = nil; end;
        if self.CorBarrinha7 ~= nil then self.CorBarrinha7:destroy(); self.CorBarrinha7 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.Barrinha2 ~= nil then self.Barrinha2:destroy(); self.Barrinha2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.ValoresBarrinha9 ~= nil then self.ValoresBarrinha9:destroy(); self.ValoresBarrinha9 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.InfoBarrinha11 ~= nil then self.InfoBarrinha11:destroy(); self.InfoBarrinha11 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.Barrinha7 ~= nil then self.Barrinha7:destroy(); self.Barrinha7 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.CorBarrinha11 ~= nil then self.CorBarrinha11:destroy(); self.CorBarrinha11 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.Barrinha3 ~= nil then self.Barrinha3:destroy(); self.Barrinha3 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister6_svg = {
    newEditor = newfrmFichaRPGmeister6_svg, 
    new = newfrmFichaRPGmeister6_svg, 
    name = "frmFichaRPGmeister6_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister6_svg = _frmFichaRPGmeister6_svg;
rrpg.registrarForm(_frmFichaRPGmeister6_svg);

return _frmFichaRPGmeister6_svg;
