require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister3_svg()
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
    obj:setName("frmFichaRPGmeister3_svg");
    obj:setAlign("client");
    obj:setMargins({top=1});

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'buffPericia'});
    obj.dataLink1:setName("dataLink1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			local function updateAtributes(num)
				local atr = "" .. num;
				local mod = 0;
				
				if num == 1 then
					mod = tonumber(sheet.efetModFor) or 0;
				elseif num == 2 then
					mod = tonumber(sheet.efetModDes) or 0;
				elseif num == 3 then
					mod = tonumber(sheet.efetModCon) or 0;
				elseif num == 4 then
					mod = tonumber(sheet.efetModInt) or 0;
				elseif num == 5 then
					mod = tonumber(sheet.efetModSab) or 0;
				elseif num == 6 then
					mod = tonumber(sheet.efetModCar) or 0;
				end;

				local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					if nodes[i].chavePericia == atr then
						nodes[i].atributoPericia = mod;
					end;
				end
			end;

			local function updatePenalty()
				if sheet==nil then return end;

				local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					nodes[i].penalidade = sheet.penalidade;
				end;
			end;

			local function fillSkills(db)
				Dialogs.confirmOkCancel("Vai apagar todas perícias atuais.",
			        function (confirmado)
			                if confirmado then
			                    if sheet.campoDasPericias == nil then 
									sheet.campoDasPericias = {}
								end;
								NDB.copy(sheet.campoDasPericias, db); 

								self.rclListaDasPericias:sort();
			                else
			                        -- usuário escolheu CANCEL
			                        -- Do nothing
			                end;
			        end);
				
			end;

			local function dndSkills()
				local dnd = NDB.load("dndskills.xml");
				fillSkills(dnd);
			end;

			local function rpgmeisterSkills()
				local rpgmeister = NDB.load("rpgmeisterskills.xml");
				fillSkills(rpgmeister);
			end;

			local function faroesteSkills()
				local faroeste = NDB.load("faroesteskills.xml");
				fillSkills(faroeste);
			end;

			local function exportSkills()
				local xml = NDB.exportXML(sheet.campoDasPericias);

				local export = {};
				local bytes = Utils.binaryEncode(export, "utf8", xml);

				local stream = Utils.newMemoryStream();
				local bytes = stream:write(export);

				Dialogs.saveFile("Salvar Ficha como XML", stream, "skills.xml", "application/xml",
					function()
						stream:close();
						showMessage("Perícias Exportadas.");
					end);
			end;
		


    obj.popPericia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPericia:setParent(obj.scrollBox1);
    obj.popPericia:setName("popPericia");
    obj.popPericia:setWidth(300);
    obj.popPericia:setHeight(250);
    obj.popPericia:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popPericia, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popPericia);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(90);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Penalidades");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("penalidesPericia");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Racial");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("racialPericia");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("Sinergia");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("sinergiaPericia");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(90);
    obj.flowPart4:setMaxWidth(100);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Equipamentos");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("equipamentosPericia");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(90);
    obj.flowPart5:setMaxWidth(100);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Magico");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("client");
    obj.edit5:setField("magicoPericia");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(90);
    obj.flowPart6:setMaxWidth(100);
    obj.flowPart6:setHeight(35);
    obj.flowPart6:setName("flowPart6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Outros");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart6);
    obj.edit6:setAlign("client");
    obj.edit6:setField("outrosPericia");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(12);
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(90);
    obj.flowPart7:setMaxWidth(100);
    obj.flowPart7:setHeight(35);
    obj.flowPart7:setName("flowPart7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart7);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Talentos");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart7);
    obj.edit7:setAlign("client");
    obj.edit7:setField("talentosPericia");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(12);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(90);
    obj.flowPart8:setMaxWidth(100);
    obj.flowPart8:setHeight(35);
    obj.flowPart8:setName("flowPart8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart8);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Classe");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart8);
    obj.edit8:setAlign("client");
    obj.edit8:setField("classePericia");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setMinWidth(90);
    obj.flowPart9:setMaxWidth(100);
    obj.flowPart9:setHeight(35);
    obj.flowPart9:setName("flowPart9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart9);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Condicional");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart9);
    obj.edit9:setAlign("client");
    obj.edit9:setField("condicionalPericia");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(12);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(90);
    obj.flowPart10:setMaxWidth(100);
    obj.flowPart10:setHeight(35);
    obj.flowPart10:setName("flowPart10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart10);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Competencia");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart10);
    obj.edit10:setAlign("client");
    obj.edit10:setField("competenciaPericia");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setMinWidth(90);
    obj.flowPart11:setMaxWidth(100);
    obj.flowPart11:setHeight(35);
    obj.flowPart11:setName("flowPart11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart11);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Intuição");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart11);
    obj.edit11:setAlign("client");
    obj.edit11:setField("intuicaoPericia");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(12);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setMinWidth(90);
    obj.flowPart12:setMaxWidth(100);
    obj.flowPart12:setHeight(35);
    obj.flowPart12:setName("flowPart12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart12);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Sorte");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart12);
    obj.edit12:setAlign("client");
    obj.edit12:setField("sortePericia");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(12);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popPericia);
    obj.textEditor1:setAlign("bottom");
    obj.textEditor1:setHeight(80);
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.popPericia);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setText("Exige Treino");
    obj.checkBox1:setField("exigeTreino");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.popPericia);
    obj.checkBox2:setAlign("right");
    obj.checkBox2:setText("Penalidade Armadura");
    obj.checkBox2:setField("penalidadeArmadura");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.popPericia);
    obj.checkBox3:setAlign("right");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setText("");
    obj.checkBox3:setField("penalidadeArmadura2");
    obj.checkBox3:setName("checkBox3");

    obj.popIdioma = GUI.fromHandle(_obj_newObject("popup"));
    obj.popIdioma:setParent(obj.scrollBox1);
    obj.popIdioma:setName("popIdioma");
    obj.popIdioma:setWidth(200);
    obj.popIdioma:setHeight(100);
    obj.popIdioma:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popIdioma, "autoScopeNode",  "false");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.popIdioma);
    obj.checkBox4:setAlign("top");
    obj.checkBox4:setText("Falar/Entender");
    obj.checkBox4:setField("conversarIdioma");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.popIdioma);
    obj.checkBox5:setAlign("top");
    obj.checkBox5:setText("Escrever/Ler");
    obj.checkBox5:setField("escritaIdioma");
    obj.checkBox5:setName("checkBox5");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popIdioma);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(930);
    obj.layout1:setHeight(685);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout1);
    obj.label13:setText("NOME DA PERÍCIA");
    obj.label13:setLeft(20);
    obj.label13:setTop(1);
    obj.label13:setWidth(135);
    obj.label13:setHeight(20);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout1);
    obj.label14:setText("CHAVE");
    obj.label14:setLeft(165);
    obj.label14:setTop(1);
    obj.label14:setWidth(60);
    obj.label14:setHeight(20);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setText("TOTAL");
    obj.label15:setLeft(245);
    obj.label15:setTop(1);
    obj.label15:setWidth(40);
    obj.label15:setHeight(20);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout1);
    obj.label16:setText("ATR");
    obj.label16:setLeft(285);
    obj.label16:setTop(1);
    obj.label16:setWidth(33);
    obj.label16:setHeight(20);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout1);
    obj.label17:setText("GRAD");
    obj.label17:setLeft(320);
    obj.label17:setTop(1);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout1);
    obj.label18:setText("NOME DA PERÍCIA");
    obj.label18:setLeft(465);
    obj.label18:setTop(1);
    obj.label18:setWidth(135);
    obj.label18:setHeight(20);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout1);
    obj.label19:setText("CHAVE");
    obj.label19:setLeft(610);
    obj.label19:setTop(1);
    obj.label19:setWidth(60);
    obj.label19:setHeight(20);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout1);
    obj.label20:setText("TOTAL");
    obj.label20:setLeft(690);
    obj.label20:setTop(1);
    obj.label20:setWidth(40);
    obj.label20:setHeight(20);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout1);
    obj.label21:setText("ATR");
    obj.label21:setLeft(730);
    obj.label21:setTop(1);
    obj.label21:setWidth(33);
    obj.label21:setHeight(20);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout1);
    obj.label22:setText("GRAD");
    obj.label22:setLeft(765);
    obj.label22:setTop(1);
    obj.label22:setWidth(40);
    obj.label22:setHeight(20);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rclListaDasPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.layout1);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmFichaRPGmeister3p_svg");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(920);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(940);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(400);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout2);
    obj.checkBox6:setLeft(60);
    obj.checkBox6:setTop(5);
    obj.checkBox6:setWidth(19);
    obj.checkBox6:setHeight(15);
    obj.checkBox6:setField("idiomasIsClass");
    obj.checkBox6:setName("checkBox6");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout2);
    obj.label23:setText("FALAR IDIOMAS");
    obj.label23:setLeft(80);
    obj.label23:setTop(1);
    obj.label23:setWidth(135);
    obj.label23:setHeight(20);
    obj.label23:setName("label23");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setLeft(50);
    obj.edit13:setTop(25);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(20);
    obj.edit13:setField("idiomasGrad");
    obj.edit13:setType("float");
    obj.edit13:setName("edit13");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout2);
    obj.label24:setText("Graduações");
    obj.label24:setLeft(90);
    obj.label24:setTop(25);
    obj.label24:setWidth(135);
    obj.label24:setHeight(20);
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout2);
    obj.label25:setText("Idioma");
    obj.label25:setLeft(0);
    obj.label25:setTop(55);
    obj.label25:setWidth(110);
    obj.label25:setHeight(20);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout2);
    obj.label26:setText("Alfabeto");
    obj.label26:setLeft(110);
    obj.label26:setTop(55);
    obj.label26:setWidth(110);
    obj.label26:setHeight(20);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rclListaDosIdiomas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosIdiomas:setParent(obj.layout2);
    obj.rclListaDosIdiomas:setName("rclListaDosIdiomas");
    obj.rclListaDosIdiomas:setField("campoDosIdiomas");
    obj.rclListaDosIdiomas:setTemplateForm("frmFichaRPGmeister3i_svg");
    obj.rclListaDosIdiomas:setLeft(5);
    obj.rclListaDosIdiomas:setTop(75);
    obj.rclListaDosIdiomas:setWidth(290);
    obj.rclListaDosIdiomas:setHeight(320);
    obj.rclListaDosIdiomas:setLayout("vertical");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(940);
    obj.layout3:setTop(410);
    obj.layout3:setWidth(135);
    obj.layout3:setHeight(100);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setText("PONTOS GASTOS");
    obj.label27:setLeft(0);
    obj.label27:setTop(0);
    obj.label27:setWidth(135);
    obj.label27:setHeight(20);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setLeft(10);
    obj.label28:setTop(30);
    obj.label28:setWidth(70);
    obj.label28:setHeight(20);
    obj.label28:setText("DnD3.5");
    obj.label28:setName("label28");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setLeft(80);
    obj.rectangle4:setTop(30);
    obj.rectangle4:setWidth(37);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout3);
    obj.label29:setField("pontosPericia");
    obj.label29:setLeft(80);
    obj.label29:setTop(30);
    obj.label29:setWidth(37);
    obj.label29:setHeight(20);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(940);
    obj.layout4:setTop(520);
    obj.layout4:setWidth(135);
    obj.layout4:setHeight(200);
    obj.layout4:setName("layout4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout4);
    obj.button1:setText("Nova Perícia");
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(125);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout4);
    obj.button2:setText("Novo Idioma");
    obj.button2:setLeft(0);
    obj.button2:setTop(25);
    obj.button2:setWidth(125);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setText("Padrões de Perícia");
    obj.label30:setLeft(0);
    obj.label30:setTop(50);
    obj.label30:setWidth(125);
    obj.label30:setHeight(20);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setText("DnD3.5");
    obj.button3:setLeft(0);
    obj.button3:setTop(75);
    obj.button3:setWidth(125);
    obj.button3:setHeight(25);
    obj.button3:setHint("Vai apagar todas perícias atuais. ");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setText("RPGmeister");
    obj.button4:setLeft(0);
    obj.button4:setTop(100);
    obj.button4:setWidth(125);
    obj.button4:setHeight(25);
    obj.button4:setHint("Vai apagar todas perícias atuais. ");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout4);
    obj.button5:setText("Faroeste Arcano");
    obj.button5:setLeft(0);
    obj.button5:setTop(125);
    obj.button5:setWidth(125);
    obj.button5:setHeight(25);
    obj.button5:setHint("Vai apagar todas perícias atuais. ");
    obj.button5:setName("button5");

    obj._e_event0 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
                        local buffPericia = tonumber(sheet.buffPericia) or 0;
            
                        local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
                        for i=1, #nodes, 1 do
                            nodes[i].buffPericia = buffPericia;
                        end
        end, obj);

    obj._e_event1 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia);
        end, obj);

    obj._e_event2 = obj.rclListaDosIdiomas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomeIdioma, nodeB.nomeIdioma);
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (_)
            local idioma = self.rclListaDosIdiomas:append();
            					idioma.conversarIdioma = true;
            					idioma.escritaIdioma = true;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            dndSkills();
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            rpgmeisterSkills();
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (_)
            faroesteSkills();
        end, obj);

    function obj:_releaseEvents()
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

        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.popPericia ~= nil then self.popPericia:destroy(); self.popPericia = nil; end;
        if self.rclListaDosIdiomas ~= nil then self.rclListaDosIdiomas:destroy(); self.rclListaDosIdiomas = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.popIdioma ~= nil then self.popIdioma:destroy(); self.popIdioma = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister3_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister3_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister3_svg = {
    newEditor = newfrmFichaRPGmeister3_svg, 
    new = newfrmFichaRPGmeister3_svg, 
    name = "frmFichaRPGmeister3_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister3_svg = _frmFichaRPGmeister3_svg;
Firecast.registrarForm(_frmFichaRPGmeister3_svg);

return _frmFichaRPGmeister3_svg;
