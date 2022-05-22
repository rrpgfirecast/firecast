require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmACN1()
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
    obj:setName("frmACN1");
    obj:setAlign("client");
    obj:setTheme("dark");


		local function ShowPopup(popup, bt)
			local pop = self:findControlByName(popup);
			
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("rightCenter", self[bt]);
			else
				showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
			end;
		end
	


    obj.popOther = GUI.fromHandle(_obj_newObject("popup"));
    obj.popOther:setParent(obj);
    obj.popOther:setName("popOther");
    obj.popOther:setWidth(400);
    obj.popOther:setHeight(550);
    obj.popOther:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popOther, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popOther);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(5);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Inicial");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("inicial");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(30);
    obj.flowPart2:setMaxWidth(50);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Apr.");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("aprimoramento");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(30);
    obj.flowPart3:setMaxWidth(50);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("xp");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(30);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Custo Apr.");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("multApr");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(30);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Custo XP");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("client");
    obj.edit5:setField("multXp");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popOther);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.popHistorico = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHistorico:setParent(obj);
    obj.popHistorico:setName("popHistorico");
    obj.popHistorico:setWidth(400);
    obj.popHistorico:setHeight(550);
    obj.popHistorico:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHistorico, "autoScopeNode",  "false");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popHistorico);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(5);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout2);
    obj.flowPart6:setMinWidth(30);
    obj.flowPart6:setMaxWidth(50);
    obj.flowPart6:setHeight(35);
    obj.flowPart6:setName("flowPart6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Inicial");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart6);
    obj.edit6:setAlign("client");
    obj.edit6:setField("historicoValor");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(12);
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setMinWidth(30);
    obj.flowPart7:setMaxWidth(50);
    obj.flowPart7:setHeight(35);
    obj.flowPart7:setName("flowPart7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart7);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Apr.");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart7);
    obj.edit7:setAlign("client");
    obj.edit7:setField("historicoBonus");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(12);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout2);
    obj.flowPart8:setMinWidth(30);
    obj.flowPart8:setMaxWidth(50);
    obj.flowPart8:setHeight(35);
    obj.flowPart8:setName("flowPart8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart8);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("XP");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart8);
    obj.edit8:setAlign("client");
    obj.edit8:setField("historicoXp");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popHistorico);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.popHistorico);
    obj.dataLink1:setField("historicoValor");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.popHistorico);
    obj.dataLink2:setField("historicoBonus");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.popHistorico);
    obj.dataLink3:setField("historicoXp");
    obj.dataLink3:setName("dataLink3");

    obj.popFisicos = GUI.fromHandle(_obj_newObject("popup"));
    obj.popFisicos:setParent(obj);
    obj.popFisicos:setName("popFisicos");
    obj.popFisicos:setWidth(350);
    obj.popFisicos:setHeight(120);
    obj.popFisicos:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popFisicos, "autoScopeNode",  "false");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popFisicos);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(6);
    obj.flowLayout3:setMargins({bottom=4});
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout3);
    obj.flowPart9:setMinWidth(30);
    obj.flowPart9:setMaxWidth(75);
    obj.flowPart9:setHeight(35);
    obj.flowPart9:setName("flowPart9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart9);
    obj.label9:setAlign("client");
    obj.label9:setFontSize(10);
    obj.label9:setText("Força");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout3);
    obj.flowPart10:setMinWidth(30);
    obj.flowPart10:setMaxWidth(50);
    obj.flowPart10:setHeight(35);
    obj.flowPart10:setName("flowPart10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart10);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Base");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart10);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(30);
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setAlign("client");
    obj.label11:setTop(0);
    obj.label11:setWidth(30);
    obj.label11:setHeight(25);
    obj.label11:setField("baseforca");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setVertTextAlign("center");
    obj.label11:setName("label11");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout3);
    obj.flowPart11:setMinWidth(30);
    obj.flowPart11:setMaxWidth(50);
    obj.flowPart11:setHeight(35);
    obj.flowPart11:setName("flowPart11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart11);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Inicial");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart11);
    obj.edit9:setAlign("client");
    obj.edit9:setField("inicialforca");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(12);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout3);
    obj.flowPart12:setMinWidth(30);
    obj.flowPart12:setMaxWidth(50);
    obj.flowPart12:setHeight(35);
    obj.flowPart12:setName("flowPart12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart12);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("Apr.");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart12);
    obj.edit10:setAlign("client");
    obj.edit10:setField("bonusforca");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout3);
    obj.flowPart13:setMinWidth(30);
    obj.flowPart13:setMaxWidth(50);
    obj.flowPart13:setHeight(35);
    obj.flowPart13:setName("flowPart13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart13);
    obj.label14:setAlign("top");
    obj.label14:setFontSize(10);
    obj.label14:setText("XP");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWordWrap(true);
    obj.label14:setTextTrimming("none");
    obj.label14:setAutoSize(true);
    obj.label14:setName("label14");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart13);
    obj.edit11:setAlign("client");
    obj.edit11:setField("xpforca");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(12);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout3);
    obj.flowPart14:setMinWidth(30);
    obj.flowPart14:setMaxWidth(50);
    obj.flowPart14:setHeight(35);
    obj.flowPart14:setName("flowPart14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart14);
    obj.label15:setAlign("top");
    obj.label15:setFontSize(10);
    obj.label15:setText("Outros");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWordWrap(true);
    obj.label15:setTextTrimming("none");
    obj.label15:setAutoSize(true);
    obj.label15:setName("label15");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart14);
    obj.edit12:setAlign("client");
    obj.edit12:setField("outroforca");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(12);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout3);
    obj.flowPart15:setMinWidth(30);
    obj.flowPart15:setMaxWidth(75);
    obj.flowPart15:setHeight(35);
    obj.flowPart15:setName("flowPart15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart15);
    obj.label16:setAlign("client");
    obj.label16:setFontSize(10);
    obj.label16:setText("Agilidade");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setWordWrap(true);
    obj.label16:setTextTrimming("none");
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout3);
    obj.flowPart16:setMinWidth(30);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(35);
    obj.flowPart16:setName("flowPart16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart16);
    obj.label17:setAlign("top");
    obj.label17:setFontSize(10);
    obj.label17:setText("Base");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setWordWrap(true);
    obj.label17:setTextTrimming("none");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowPart16);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(30);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle2);
    obj.label18:setAlign("client");
    obj.label18:setTop(0);
    obj.label18:setWidth(30);
    obj.label18:setHeight(25);
    obj.label18:setField("baseagilidade");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("center");
    obj.label18:setName("label18");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout3);
    obj.flowPart17:setMinWidth(30);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(35);
    obj.flowPart17:setName("flowPart17");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart17);
    obj.label19:setAlign("top");
    obj.label19:setFontSize(10);
    obj.label19:setText("Inicial");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWordWrap(true);
    obj.label19:setTextTrimming("none");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart17);
    obj.edit13:setAlign("client");
    obj.edit13:setField("inicialagilidade");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(12);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout3);
    obj.flowPart18:setMinWidth(30);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(35);
    obj.flowPart18:setName("flowPart18");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart18);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(10);
    obj.label20:setText("Apr.");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart18);
    obj.edit14:setAlign("client");
    obj.edit14:setField("bonusagilidade");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(12);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout3);
    obj.flowPart19:setMinWidth(30);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(35);
    obj.flowPart19:setName("flowPart19");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart19);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(10);
    obj.label21:setText("XP");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWordWrap(true);
    obj.label21:setTextTrimming("none");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart19);
    obj.edit15:setAlign("client");
    obj.edit15:setField("xpagilidade");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(12);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout3);
    obj.flowPart20:setMinWidth(30);
    obj.flowPart20:setMaxWidth(50);
    obj.flowPart20:setHeight(35);
    obj.flowPart20:setName("flowPart20");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart20);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Outros");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart20);
    obj.edit16:setAlign("client");
    obj.edit16:setField("outroagilidade");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(12);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout3);
    obj.flowPart21:setMinWidth(30);
    obj.flowPart21:setMaxWidth(75);
    obj.flowPart21:setHeight(35);
    obj.flowPart21:setName("flowPart21");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart21);
    obj.label23:setAlign("client");
    obj.label23:setFontSize(10);
    obj.label23:setText("Resiliência");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout3);
    obj.flowPart22:setMinWidth(30);
    obj.flowPart22:setMaxWidth(50);
    obj.flowPart22:setHeight(35);
    obj.flowPart22:setName("flowPart22");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart22);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(10);
    obj.label24:setText("Base");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart22);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle3);
    obj.label25:setAlign("client");
    obj.label25:setTop(0);
    obj.label25:setWidth(30);
    obj.label25:setHeight(25);
    obj.label25:setField("baseresiliencia");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setVertTextAlign("center");
    obj.label25:setName("label25");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout3);
    obj.flowPart23:setMinWidth(30);
    obj.flowPart23:setMaxWidth(50);
    obj.flowPart23:setHeight(35);
    obj.flowPart23:setName("flowPart23");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart23);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Inicial");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart23);
    obj.edit17:setAlign("client");
    obj.edit17:setField("inicialresiliencia");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(12);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout3);
    obj.flowPart24:setMinWidth(30);
    obj.flowPart24:setMaxWidth(50);
    obj.flowPart24:setHeight(35);
    obj.flowPart24:setName("flowPart24");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart24);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Apr.");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart24);
    obj.edit18:setAlign("client");
    obj.edit18:setField("bonusresiliencia");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(12);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout3);
    obj.flowPart25:setMinWidth(30);
    obj.flowPart25:setMaxWidth(50);
    obj.flowPart25:setHeight(35);
    obj.flowPart25:setName("flowPart25");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart25);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(10);
    obj.label28:setText("XP");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart25);
    obj.edit19:setAlign("client");
    obj.edit19:setField("xpresiliencia");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(12);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout3);
    obj.flowPart26:setMinWidth(30);
    obj.flowPart26:setMaxWidth(50);
    obj.flowPart26:setHeight(35);
    obj.flowPart26:setName("flowPart26");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart26);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Outros");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart26);
    obj.edit20:setAlign("client");
    obj.edit20:setField("outroresiliencia");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(12);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.popMentais = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMentais:setParent(obj);
    obj.popMentais:setName("popMentais");
    obj.popMentais:setWidth(350);
    obj.popMentais:setHeight(120);
    obj.popMentais:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popMentais, "autoScopeNode",  "false");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.popMentais);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxControlsPerLine(6);
    obj.flowLayout4:setMargins({bottom=4});
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout4);
    obj.flowPart27:setMinWidth(30);
    obj.flowPart27:setMaxWidth(75);
    obj.flowPart27:setHeight(35);
    obj.flowPart27:setName("flowPart27");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart27);
    obj.label30:setAlign("client");
    obj.label30:setFontSize(10);
    obj.label30:setText("Carisma");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout4);
    obj.flowPart28:setMinWidth(30);
    obj.flowPart28:setMaxWidth(50);
    obj.flowPart28:setHeight(35);
    obj.flowPart28:setName("flowPart28");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart28);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Base");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowPart28);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle4);
    obj.label32:setAlign("client");
    obj.label32:setTop(0);
    obj.label32:setWidth(30);
    obj.label32:setHeight(25);
    obj.label32:setField("basecarisma");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setVertTextAlign("center");
    obj.label32:setName("label32");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout4);
    obj.flowPart29:setMinWidth(30);
    obj.flowPart29:setMaxWidth(50);
    obj.flowPart29:setHeight(35);
    obj.flowPart29:setName("flowPart29");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart29);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Inicial");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart29);
    obj.edit21:setAlign("client");
    obj.edit21:setField("inicialcarisma");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout4);
    obj.flowPart30:setMinWidth(30);
    obj.flowPart30:setMaxWidth(50);
    obj.flowPart30:setHeight(35);
    obj.flowPart30:setName("flowPart30");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart30);
    obj.label34:setAlign("top");
    obj.label34:setFontSize(10);
    obj.label34:setText("Apr.");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart30);
    obj.edit22:setAlign("client");
    obj.edit22:setField("bonuscarisma");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(12);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout4);
    obj.flowPart31:setMinWidth(30);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(35);
    obj.flowPart31:setName("flowPart31");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart31);
    obj.label35:setAlign("top");
    obj.label35:setFontSize(10);
    obj.label35:setText("XP");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setWordWrap(true);
    obj.label35:setTextTrimming("none");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart31);
    obj.edit23:setAlign("client");
    obj.edit23:setField("xpcarisma");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout4);
    obj.flowPart32:setMinWidth(30);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(35);
    obj.flowPart32:setName("flowPart32");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart32);
    obj.label36:setAlign("top");
    obj.label36:setFontSize(10);
    obj.label36:setText("Outros");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart32);
    obj.edit24:setAlign("client");
    obj.edit24:setField("outrocarisma");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(12);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout4);
    obj.flowPart33:setMinWidth(30);
    obj.flowPart33:setMaxWidth(75);
    obj.flowPart33:setHeight(35);
    obj.flowPart33:setName("flowPart33");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart33);
    obj.label37:setAlign("client");
    obj.label37:setFontSize(10);
    obj.label37:setText("Percepção");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout4);
    obj.flowPart34:setMinWidth(30);
    obj.flowPart34:setMaxWidth(50);
    obj.flowPart34:setHeight(35);
    obj.flowPart34:setName("flowPart34");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart34);
    obj.label38:setAlign("top");
    obj.label38:setFontSize(10);
    obj.label38:setText("Base");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setWordWrap(true);
    obj.label38:setTextTrimming("none");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowPart34);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle5);
    obj.label39:setAlign("client");
    obj.label39:setTop(0);
    obj.label39:setWidth(30);
    obj.label39:setHeight(25);
    obj.label39:setField("basepercepcao");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setVertTextAlign("center");
    obj.label39:setName("label39");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout4);
    obj.flowPart35:setMinWidth(30);
    obj.flowPart35:setMaxWidth(50);
    obj.flowPart35:setHeight(35);
    obj.flowPart35:setName("flowPart35");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart35);
    obj.label40:setAlign("top");
    obj.label40:setFontSize(10);
    obj.label40:setText("Inicial");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setWordWrap(true);
    obj.label40:setTextTrimming("none");
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart35);
    obj.edit25:setAlign("client");
    obj.edit25:setField("inicialpercepcao");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(12);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout4);
    obj.flowPart36:setMinWidth(30);
    obj.flowPart36:setMaxWidth(50);
    obj.flowPart36:setHeight(35);
    obj.flowPart36:setName("flowPart36");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart36);
    obj.label41:setAlign("top");
    obj.label41:setFontSize(10);
    obj.label41:setText("Apr.");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setWordWrap(true);
    obj.label41:setTextTrimming("none");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart36);
    obj.edit26:setAlign("client");
    obj.edit26:setField("bonuspercepcao");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout4);
    obj.flowPart37:setMinWidth(30);
    obj.flowPart37:setMaxWidth(50);
    obj.flowPart37:setHeight(35);
    obj.flowPart37:setName("flowPart37");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart37);
    obj.label42:setAlign("top");
    obj.label42:setFontSize(10);
    obj.label42:setText("XP");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setWordWrap(true);
    obj.label42:setTextTrimming("none");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart37);
    obj.edit27:setAlign("client");
    obj.edit27:setField("xppercepcao");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout4);
    obj.flowPart38:setMinWidth(30);
    obj.flowPart38:setMaxWidth(50);
    obj.flowPart38:setHeight(35);
    obj.flowPart38:setName("flowPart38");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart38);
    obj.label43:setAlign("top");
    obj.label43:setFontSize(10);
    obj.label43:setText("Outros");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setWordWrap(true);
    obj.label43:setTextTrimming("none");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart38);
    obj.edit28:setAlign("client");
    obj.edit28:setField("outropercepcao");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout4);
    obj.flowPart39:setMinWidth(30);
    obj.flowPart39:setMaxWidth(75);
    obj.flowPart39:setHeight(35);
    obj.flowPart39:setName("flowPart39");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart39);
    obj.label44:setAlign("client");
    obj.label44:setFontSize(10);
    obj.label44:setText("Perspicácia");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setWordWrap(true);
    obj.label44:setTextTrimming("none");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout4);
    obj.flowPart40:setMinWidth(30);
    obj.flowPart40:setMaxWidth(50);
    obj.flowPart40:setHeight(35);
    obj.flowPart40:setName("flowPart40");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart40);
    obj.label45:setAlign("top");
    obj.label45:setFontSize(10);
    obj.label45:setText("Base");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWordWrap(true);
    obj.label45:setTextTrimming("none");
    obj.label45:setAutoSize(true);
    obj.label45:setName("label45");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.flowPart40);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle6);
    obj.label46:setAlign("client");
    obj.label46:setTop(0);
    obj.label46:setWidth(30);
    obj.label46:setHeight(25);
    obj.label46:setField("baseperspicacia");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setVertTextAlign("center");
    obj.label46:setName("label46");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout4);
    obj.flowPart41:setMinWidth(30);
    obj.flowPart41:setMaxWidth(50);
    obj.flowPart41:setHeight(35);
    obj.flowPart41:setName("flowPart41");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart41);
    obj.label47:setAlign("top");
    obj.label47:setFontSize(10);
    obj.label47:setText("Inicial");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setWordWrap(true);
    obj.label47:setTextTrimming("none");
    obj.label47:setAutoSize(true);
    obj.label47:setName("label47");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart41);
    obj.edit29:setAlign("client");
    obj.edit29:setField("inicialperspicacia");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout4);
    obj.flowPart42:setMinWidth(30);
    obj.flowPart42:setMaxWidth(50);
    obj.flowPart42:setHeight(35);
    obj.flowPart42:setName("flowPart42");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart42);
    obj.label48:setAlign("top");
    obj.label48:setFontSize(10);
    obj.label48:setText("Apr.");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setWordWrap(true);
    obj.label48:setTextTrimming("none");
    obj.label48:setAutoSize(true);
    obj.label48:setName("label48");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart42);
    obj.edit30:setAlign("client");
    obj.edit30:setField("bonusperspicacia");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(12);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout4);
    obj.flowPart43:setMinWidth(30);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(35);
    obj.flowPart43:setName("flowPart43");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart43);
    obj.label49:setAlign("top");
    obj.label49:setFontSize(10);
    obj.label49:setText("XP");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWordWrap(true);
    obj.label49:setTextTrimming("none");
    obj.label49:setAutoSize(true);
    obj.label49:setName("label49");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart43);
    obj.edit31:setAlign("client");
    obj.edit31:setField("xpperspicacia");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout4);
    obj.flowPart44:setMinWidth(30);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(35);
    obj.flowPart44:setName("flowPart44");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart44);
    obj.label50:setAlign("top");
    obj.label50:setFontSize(10);
    obj.label50:setText("Outros");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setWordWrap(true);
    obj.label50:setTextTrimming("none");
    obj.label50:setAutoSize(true);
    obj.label50:setName("label50");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart44);
    obj.edit32:setAlign("client");
    obj.edit32:setField("outroperspicacia");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.popAegis = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAegis:setParent(obj);
    obj.popAegis:setName("popAegis");
    obj.popAegis:setWidth(350);
    obj.popAegis:setHeight(120);
    obj.popAegis:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAegis, "autoScopeNode",  "false");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.popAegis);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(6);
    obj.flowLayout5:setMargins({bottom=4});
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout5);
    obj.flowPart45:setMinWidth(30);
    obj.flowPart45:setMaxWidth(75);
    obj.flowPart45:setHeight(35);
    obj.flowPart45:setName("flowPart45");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart45);
    obj.label51:setAlign("client");
    obj.label51:setFontSize(10);
    obj.label51:setText("Consciência");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setWordWrap(true);
    obj.label51:setTextTrimming("none");
    obj.label51:setAutoSize(true);
    obj.label51:setName("label51");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout5);
    obj.flowPart46:setMinWidth(30);
    obj.flowPart46:setMaxWidth(50);
    obj.flowPart46:setHeight(35);
    obj.flowPart46:setName("flowPart46");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart46);
    obj.label52:setAlign("top");
    obj.label52:setFontSize(10);
    obj.label52:setText("Base");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setWordWrap(true);
    obj.label52:setTextTrimming("none");
    obj.label52:setAutoSize(true);
    obj.label52:setName("label52");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowPart46);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle7);
    obj.label53:setAlign("client");
    obj.label53:setTop(0);
    obj.label53:setWidth(30);
    obj.label53:setHeight(25);
    obj.label53:setField("baseconsciencia");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setName("label53");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout5);
    obj.flowPart47:setMinWidth(30);
    obj.flowPart47:setMaxWidth(50);
    obj.flowPart47:setHeight(35);
    obj.flowPart47:setName("flowPart47");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart47);
    obj.label54:setAlign("top");
    obj.label54:setFontSize(10);
    obj.label54:setText("Inicial");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setWordWrap(true);
    obj.label54:setTextTrimming("none");
    obj.label54:setAutoSize(true);
    obj.label54:setName("label54");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart47);
    obj.edit33:setAlign("client");
    obj.edit33:setField("inicialconsciencia");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout5);
    obj.flowPart48:setMinWidth(30);
    obj.flowPart48:setMaxWidth(50);
    obj.flowPart48:setHeight(35);
    obj.flowPart48:setName("flowPart48");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart48);
    obj.label55:setAlign("top");
    obj.label55:setFontSize(10);
    obj.label55:setText("Apr.");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setWordWrap(true);
    obj.label55:setTextTrimming("none");
    obj.label55:setAutoSize(true);
    obj.label55:setName("label55");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart48);
    obj.edit34:setAlign("client");
    obj.edit34:setField("bonusconsciencia");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout5);
    obj.flowPart49:setMinWidth(30);
    obj.flowPart49:setMaxWidth(50);
    obj.flowPart49:setHeight(35);
    obj.flowPart49:setName("flowPart49");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart49);
    obj.label56:setAlign("top");
    obj.label56:setFontSize(10);
    obj.label56:setText("XP");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setWordWrap(true);
    obj.label56:setTextTrimming("none");
    obj.label56:setAutoSize(true);
    obj.label56:setName("label56");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart49);
    obj.edit35:setAlign("client");
    obj.edit35:setField("xpconsciencia");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(12);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout5);
    obj.flowPart50:setMinWidth(30);
    obj.flowPart50:setMaxWidth(50);
    obj.flowPart50:setHeight(35);
    obj.flowPart50:setName("flowPart50");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart50);
    obj.label57:setAlign("top");
    obj.label57:setFontSize(10);
    obj.label57:setText("Outros");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setWordWrap(true);
    obj.label57:setTextTrimming("none");
    obj.label57:setAutoSize(true);
    obj.label57:setName("label57");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart50);
    obj.edit36:setAlign("client");
    obj.edit36:setField("outroconsciencia");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(12);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout5);
    obj.flowPart51:setMinWidth(30);
    obj.flowPart51:setMaxWidth(75);
    obj.flowPart51:setHeight(35);
    obj.flowPart51:setName("flowPart51");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart51);
    obj.label58:setAlign("client");
    obj.label58:setFontSize(10);
    obj.label58:setText("Espírito");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWordWrap(true);
    obj.label58:setTextTrimming("none");
    obj.label58:setAutoSize(true);
    obj.label58:setName("label58");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout5);
    obj.flowPart52:setMinWidth(30);
    obj.flowPart52:setMaxWidth(50);
    obj.flowPart52:setHeight(35);
    obj.flowPart52:setName("flowPart52");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart52);
    obj.label59:setAlign("top");
    obj.label59:setFontSize(10);
    obj.label59:setText("Base");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setWordWrap(true);
    obj.label59:setTextTrimming("none");
    obj.label59:setAutoSize(true);
    obj.label59:setName("label59");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowPart52);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle8);
    obj.label60:setAlign("client");
    obj.label60:setTop(0);
    obj.label60:setWidth(30);
    obj.label60:setHeight(25);
    obj.label60:setField("baseespirito");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setVertTextAlign("center");
    obj.label60:setName("label60");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout5);
    obj.flowPart53:setMinWidth(30);
    obj.flowPart53:setMaxWidth(50);
    obj.flowPart53:setHeight(35);
    obj.flowPart53:setName("flowPart53");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart53);
    obj.label61:setAlign("top");
    obj.label61:setFontSize(10);
    obj.label61:setText("Inicial");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setWordWrap(true);
    obj.label61:setTextTrimming("none");
    obj.label61:setAutoSize(true);
    obj.label61:setName("label61");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart53);
    obj.edit37:setAlign("client");
    obj.edit37:setField("inicialespirito");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(12);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout5);
    obj.flowPart54:setMinWidth(30);
    obj.flowPart54:setMaxWidth(50);
    obj.flowPart54:setHeight(35);
    obj.flowPart54:setName("flowPart54");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart54);
    obj.label62:setAlign("top");
    obj.label62:setFontSize(10);
    obj.label62:setText("Apr.");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setWordWrap(true);
    obj.label62:setTextTrimming("none");
    obj.label62:setAutoSize(true);
    obj.label62:setName("label62");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart54);
    obj.edit38:setAlign("client");
    obj.edit38:setField("bonusespirito");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontSize(12);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout5);
    obj.flowPart55:setMinWidth(30);
    obj.flowPart55:setMaxWidth(50);
    obj.flowPart55:setHeight(35);
    obj.flowPart55:setName("flowPart55");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart55);
    obj.label63:setAlign("top");
    obj.label63:setFontSize(10);
    obj.label63:setText("XP");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setWordWrap(true);
    obj.label63:setTextTrimming("none");
    obj.label63:setAutoSize(true);
    obj.label63:setName("label63");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart55);
    obj.edit39:setAlign("client");
    obj.edit39:setField("xpespirito");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(12);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout5);
    obj.flowPart56:setMinWidth(30);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setHeight(35);
    obj.flowPart56:setName("flowPart56");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart56);
    obj.label64:setAlign("top");
    obj.label64:setFontSize(10);
    obj.label64:setText("Outros");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setWordWrap(true);
    obj.label64:setTextTrimming("none");
    obj.label64:setAutoSize(true);
    obj.label64:setName("label64");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart56);
    obj.edit40:setAlign("client");
    obj.edit40:setField("outroespirito");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(12);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout5);
    obj.flowPart57:setMinWidth(30);
    obj.flowPart57:setMaxWidth(75);
    obj.flowPart57:setHeight(35);
    obj.flowPart57:setName("flowPart57");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart57);
    obj.label65:setAlign("client");
    obj.label65:setFontSize(10);
    obj.label65:setText("Perseverança");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setWordWrap(true);
    obj.label65:setTextTrimming("none");
    obj.label65:setAutoSize(true);
    obj.label65:setName("label65");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout5);
    obj.flowPart58:setMinWidth(30);
    obj.flowPart58:setMaxWidth(50);
    obj.flowPart58:setHeight(35);
    obj.flowPart58:setName("flowPart58");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart58);
    obj.label66:setAlign("top");
    obj.label66:setFontSize(10);
    obj.label66:setText("Base");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setWordWrap(true);
    obj.label66:setTextTrimming("none");
    obj.label66:setAutoSize(true);
    obj.label66:setName("label66");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowPart58);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle9);
    obj.label67:setAlign("client");
    obj.label67:setTop(0);
    obj.label67:setWidth(30);
    obj.label67:setHeight(25);
    obj.label67:setField("baseperseveranca");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setVertTextAlign("center");
    obj.label67:setName("label67");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout5);
    obj.flowPart59:setMinWidth(30);
    obj.flowPart59:setMaxWidth(50);
    obj.flowPart59:setHeight(35);
    obj.flowPart59:setName("flowPart59");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart59);
    obj.label68:setAlign("top");
    obj.label68:setFontSize(10);
    obj.label68:setText("Inicial");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWordWrap(true);
    obj.label68:setTextTrimming("none");
    obj.label68:setAutoSize(true);
    obj.label68:setName("label68");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart59);
    obj.edit41:setAlign("client");
    obj.edit41:setField("inicialperseveranca");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(12);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout5);
    obj.flowPart60:setMinWidth(30);
    obj.flowPart60:setMaxWidth(50);
    obj.flowPart60:setHeight(35);
    obj.flowPart60:setName("flowPart60");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart60);
    obj.label69:setAlign("top");
    obj.label69:setFontSize(10);
    obj.label69:setText("Apr.");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setWordWrap(true);
    obj.label69:setTextTrimming("none");
    obj.label69:setAutoSize(true);
    obj.label69:setName("label69");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart60);
    obj.edit42:setAlign("client");
    obj.edit42:setField("bonusperseveranca");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(12);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout5);
    obj.flowPart61:setMinWidth(30);
    obj.flowPart61:setMaxWidth(50);
    obj.flowPart61:setHeight(35);
    obj.flowPart61:setName("flowPart61");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart61);
    obj.label70:setAlign("top");
    obj.label70:setFontSize(10);
    obj.label70:setText("XP");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setWordWrap(true);
    obj.label70:setTextTrimming("none");
    obj.label70:setAutoSize(true);
    obj.label70:setName("label70");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart61);
    obj.edit43:setAlign("client");
    obj.edit43:setField("xpperseveranca");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(12);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout5);
    obj.flowPart62:setMinWidth(30);
    obj.flowPart62:setMaxWidth(50);
    obj.flowPart62:setHeight(35);
    obj.flowPart62:setName("flowPart62");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart62);
    obj.label71:setAlign("top");
    obj.label71:setFontSize(10);
    obj.label71:setText("Outros");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setWordWrap(true);
    obj.label71:setTextTrimming("none");
    obj.label71:setAutoSize(true);
    obj.label71:setName("label71");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart62);
    obj.edit44:setAlign("client");
    obj.edit44:setField("outroperseveranca");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(70);
    obj.layout1:setName("layout1");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout1);
    obj.rectangle10:setLeft(5);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(950);
    obj.rectangle10:setHeight(70);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(15);
    obj.rectangle10:setYradius(15);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout2);
    obj.label72:setLeft(0);
    obj.label72:setTop(5);
    obj.label72:setWidth(100);
    obj.label72:setHeight(20);
    obj.label72:setText("Nome");
    obj.label72:setHorzTextAlign("trailing");
    obj.label72:setName("label72");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout2);
    obj.edit45:setLeft(110);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(200);
    obj.edit45:setHeight(25);
    obj.edit45:setField("nome");
    obj.edit45:setName("edit45");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(320);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout3);
    obj.label73:setLeft(0);
    obj.label73:setTop(5);
    obj.label73:setWidth(100);
    obj.label73:setHeight(20);
    obj.label73:setText("Conceito");
    obj.label73:setHorzTextAlign("trailing");
    obj.label73:setName("label73");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout3);
    obj.edit46:setLeft(110);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(200);
    obj.edit46:setHeight(25);
    obj.edit46:setField("conceito");
    obj.edit46:setName("edit46");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(585);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout4);
    obj.label74:setLeft(0);
    obj.label74:setTop(5);
    obj.label74:setWidth(100);
    obj.label74:setHeight(20);
    obj.label74:setText("Facção");
    obj.label74:setHorzTextAlign("trailing");
    obj.label74:setName("label74");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout4);
    obj.edit47:setLeft(110);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(200);
    obj.edit47:setHeight(25);
    obj.edit47:setField("faccao");
    obj.edit47:setName("edit47");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout5);
    obj.label75:setLeft(0);
    obj.label75:setTop(5);
    obj.label75:setWidth(100);
    obj.label75:setHeight(20);
    obj.label75:setText("Ímpeto");
    obj.label75:setHorzTextAlign("trailing");
    obj.label75:setName("label75");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout5);
    obj.edit48:setLeft(110);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(200);
    obj.edit48:setHeight(25);
    obj.edit48:setField("impeto");
    obj.edit48:setName("edit48");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(320);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout6);
    obj.label76:setLeft(0);
    obj.label76:setTop(5);
    obj.label76:setWidth(100);
    obj.label76:setHeight(20);
    obj.label76:setText("Comportamento");
    obj.label76:setHorzTextAlign("trailing");
    obj.label76:setName("label76");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout6);
    obj.edit49:setLeft(110);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(200);
    obj.edit49:setHeight(25);
    obj.edit49:setField("comportamento");
    obj.edit49:setName("edit49");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(585);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(310);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout7);
    obj.label77:setLeft(0);
    obj.label77:setTop(5);
    obj.label77:setWidth(100);
    obj.label77:setHeight(20);
    obj.label77:setText("Direção");
    obj.label77:setHorzTextAlign("trailing");
    obj.label77:setName("label77");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout7);
    obj.edit50:setLeft(110);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(200);
    obj.edit50:setHeight(25);
    obj.edit50:setField("direcao");
    obj.edit50:setName("edit50");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(75);
    obj.layout8:setWidth(235);
    obj.layout8:setHeight(245);
    obj.layout8:setName("layout8");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout8);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(15);
    obj.rectangle11:setYradius(15);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout8);
    obj.label78:setLeft(5);
    obj.label78:setTop(0);
    obj.label78:setWidth(235);
    obj.label78:setHeight(20);
    obj.label78:setText("ATRIBUTOS");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.btFisicos = GUI.fromHandle(_obj_newObject("button"));
    obj.btFisicos:setParent(obj.layout8);
    obj.btFisicos:setLeft(140);
    obj.btFisicos:setTop(80);
    obj.btFisicos:setWidth(75);
    obj.btFisicos:setHeight(20);
    obj.btFisicos:setText("Físicos");
    obj.btFisicos:setHorzTextAlign("center");
    obj.btFisicos:setRotationAngle(90);
    obj.btFisicos:setName("btFisicos");

    obj.btMentais = GUI.fromHandle(_obj_newObject("button"));
    obj.btMentais:setParent(obj.layout8);
    obj.btMentais:setLeft(140);
    obj.btMentais:setTop(185);
    obj.btMentais:setWidth(75);
    obj.btMentais:setHeight(20);
    obj.btMentais:setText("Mentais");
    obj.btMentais:setHorzTextAlign("center");
    obj.btMentais:setRotationAngle(90);
    obj.btMentais:setName("btMentais");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout8);
    obj.label79:setLeft(110);
    obj.label79:setTop(25);
    obj.label79:setWidth(235);
    obj.label79:setHeight(20);
    obj.label79:setText(" Total");
    obj.label79:setName("label79");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(50);
    obj.layout9:setWidth(235);
    obj.layout9:setHeight(30);
    obj.layout9:setName("layout9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout9);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setHeight(15);
    obj.button1:setWidth(15);
    obj.button1:setText("1");
    obj.button1:setFontSize(9);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout9);
    obj.button2:setLeft(0);
    obj.button2:setTop(13);
    obj.button2:setHeight(15);
    obj.button2:setWidth(15);
    obj.button2:setText("2");
    obj.button2:setFontSize(9);
    obj.button2:setName("button2");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout9);
    obj.label80:setLeft(20);
    obj.label80:setTop(5);
    obj.label80:setWidth(85);
    obj.label80:setHeight(20);
    obj.label80:setText("Força");
    obj.label80:setName("label80");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout9);
    obj.rectangle12:setLeft(100);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout9);
    obj.label81:setLeft(100);
    obj.label81:setTop(3);
    obj.label81:setWidth(50);
    obj.label81:setHeight(20);
    obj.label81:setField("totalforca");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout9);
    obj.dataLink4:setField("baseforca");
    obj.dataLink4:setDefaultValue("3");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout9);
    obj.dataLink5:setFields({'baseforca', 'inicialforca', 'bonusforca', 'xpforca', 'outroforca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink5:setName("dataLink5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(80);
    obj.layout10:setWidth(235);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout10);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setHeight(15);
    obj.button3:setWidth(15);
    obj.button3:setText("1");
    obj.button3:setFontSize(9);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout10);
    obj.button4:setLeft(0);
    obj.button4:setTop(13);
    obj.button4:setHeight(15);
    obj.button4:setWidth(15);
    obj.button4:setText("2");
    obj.button4:setFontSize(9);
    obj.button4:setName("button4");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout10);
    obj.label82:setLeft(20);
    obj.label82:setTop(5);
    obj.label82:setWidth(85);
    obj.label82:setHeight(20);
    obj.label82:setText("Agilidade");
    obj.label82:setName("label82");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout10);
    obj.rectangle13:setLeft(100);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setLeft(100);
    obj.label83:setTop(3);
    obj.label83:setWidth(50);
    obj.label83:setHeight(20);
    obj.label83:setField("totalagilidade");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout10);
    obj.dataLink6:setField("baseagilidade");
    obj.dataLink6:setDefaultValue("3");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout10);
    obj.dataLink7:setFields({'baseagilidade', 'inicialagilidade', 'bonusagilidade', 'xpagilidade', 'outroagilidade', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink7:setName("dataLink7");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(110);
    obj.layout11:setWidth(235);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout11);
    obj.button5:setLeft(0);
    obj.button5:setTop(0);
    obj.button5:setHeight(15);
    obj.button5:setWidth(15);
    obj.button5:setText("1");
    obj.button5:setFontSize(9);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout11);
    obj.button6:setLeft(0);
    obj.button6:setTop(13);
    obj.button6:setHeight(15);
    obj.button6:setWidth(15);
    obj.button6:setText("2");
    obj.button6:setFontSize(9);
    obj.button6:setName("button6");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout11);
    obj.label84:setLeft(20);
    obj.label84:setTop(5);
    obj.label84:setWidth(85);
    obj.label84:setHeight(20);
    obj.label84:setText("Resiliência");
    obj.label84:setName("label84");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout11);
    obj.rectangle14:setLeft(100);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout11);
    obj.label85:setLeft(100);
    obj.label85:setTop(3);
    obj.label85:setWidth(50);
    obj.label85:setHeight(20);
    obj.label85:setField("totalresiliencia");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout11);
    obj.dataLink8:setField("baseresiliencia");
    obj.dataLink8:setDefaultValue("3");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout11);
    obj.dataLink9:setFields({'baseresiliencia', 'inicialresiliencia', 'bonusresiliencia', 'xpresiliencia', 'outroresiliencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink9:setName("dataLink9");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout8);
    obj.horzLine1:setLeft(0);
    obj.horzLine1:setTop(145);
    obj.horzLine1:setWidth(235);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(150);
    obj.layout12:setWidth(235);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout12);
    obj.button7:setLeft(0);
    obj.button7:setTop(0);
    obj.button7:setHeight(15);
    obj.button7:setWidth(15);
    obj.button7:setText("1");
    obj.button7:setFontSize(9);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout12);
    obj.button8:setLeft(0);
    obj.button8:setTop(13);
    obj.button8:setHeight(15);
    obj.button8:setWidth(15);
    obj.button8:setText("2");
    obj.button8:setFontSize(9);
    obj.button8:setName("button8");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout12);
    obj.label86:setLeft(20);
    obj.label86:setTop(5);
    obj.label86:setWidth(85);
    obj.label86:setHeight(20);
    obj.label86:setText("Carisma");
    obj.label86:setName("label86");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout12);
    obj.rectangle15:setLeft(100);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout12);
    obj.label87:setLeft(100);
    obj.label87:setTop(3);
    obj.label87:setWidth(50);
    obj.label87:setHeight(20);
    obj.label87:setField("totalcarisma");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout12);
    obj.dataLink10:setField("basecarisma");
    obj.dataLink10:setDefaultValue("3");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout12);
    obj.dataLink11:setFields({'basecarisma', 'inicialcarisma', 'bonuscarisma', 'xpcarisma', 'outrocarisma', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink11:setName("dataLink11");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(180);
    obj.layout13:setWidth(235);
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout13);
    obj.button9:setLeft(0);
    obj.button9:setTop(0);
    obj.button9:setHeight(15);
    obj.button9:setWidth(15);
    obj.button9:setText("1");
    obj.button9:setFontSize(9);
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout13);
    obj.button10:setLeft(0);
    obj.button10:setTop(13);
    obj.button10:setHeight(15);
    obj.button10:setWidth(15);
    obj.button10:setText("2");
    obj.button10:setFontSize(9);
    obj.button10:setName("button10");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout13);
    obj.label88:setLeft(20);
    obj.label88:setTop(5);
    obj.label88:setWidth(85);
    obj.label88:setHeight(20);
    obj.label88:setText("Percepção");
    obj.label88:setName("label88");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout13);
    obj.rectangle16:setLeft(100);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout13);
    obj.label89:setLeft(100);
    obj.label89:setTop(3);
    obj.label89:setWidth(50);
    obj.label89:setHeight(20);
    obj.label89:setField("totalpercepcao");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout13);
    obj.dataLink12:setField("basepercepcao");
    obj.dataLink12:setDefaultValue("3");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout13);
    obj.dataLink13:setFields({'basepercepcao', 'inicialpercepcao', 'bonuspercepcao', 'xppercepcao', 'outropercepcao', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink13:setName("dataLink13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(210);
    obj.layout14:setWidth(235);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout14);
    obj.button11:setLeft(0);
    obj.button11:setTop(0);
    obj.button11:setHeight(15);
    obj.button11:setWidth(15);
    obj.button11:setText("1");
    obj.button11:setFontSize(9);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout14);
    obj.button12:setLeft(0);
    obj.button12:setTop(13);
    obj.button12:setHeight(15);
    obj.button12:setWidth(15);
    obj.button12:setText("2");
    obj.button12:setFontSize(9);
    obj.button12:setName("button12");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout14);
    obj.label90:setLeft(20);
    obj.label90:setTop(5);
    obj.label90:setWidth(85);
    obj.label90:setHeight(20);
    obj.label90:setText("Perspicácia");
    obj.label90:setName("label90");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout14);
    obj.rectangle17:setLeft(100);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout14);
    obj.label91:setLeft(100);
    obj.label91:setTop(3);
    obj.label91:setWidth(50);
    obj.label91:setHeight(20);
    obj.label91:setField("totalperspicacia");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout14);
    obj.dataLink14:setField("baseperspicacia");
    obj.dataLink14:setDefaultValue("3");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout14);
    obj.dataLink15:setFields({'baseperspicacia', 'inicialperspicacia', 'bonusperspicacia', 'xpperspicacia', 'outroperspicacia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink15:setName("dataLink15");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(325);
    obj.layout15:setWidth(235);
    obj.layout15:setHeight(185);
    obj.layout15:setName("layout15");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout15);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setXradius(15);
    obj.rectangle18:setYradius(15);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setName("rectangle18");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout15);
    obj.label92:setLeft(5);
    obj.label92:setTop(0);
    obj.label92:setWidth(235);
    obj.label92:setHeight(20);
    obj.label92:setText("EIDOLON");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout15);
    obj.label93:setLeft(110);
    obj.label93:setTop(25);
    obj.label93:setWidth(235);
    obj.label93:setHeight(20);
    obj.label93:setText(" Total");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout15);
    obj.label94:setLeft(160);
    obj.label94:setTop(25);
    obj.label94:setWidth(235);
    obj.label94:setHeight(20);
    obj.label94:setText("Base");
    obj.label94:setName("label94");

    obj.btAegis = GUI.fromHandle(_obj_newObject("button"));
    obj.btAegis:setParent(obj.layout15);
    obj.btAegis:setLeft(140);
    obj.btAegis:setTop(80);
    obj.btAegis:setWidth(75);
    obj.btAegis:setHeight(20);
    obj.btAegis:setText("Aegis");
    obj.btAegis:setHorzTextAlign("center");
    obj.btAegis:setRotationAngle(90);
    obj.btAegis:setName("btAegis");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(50);
    obj.layout16:setWidth(235);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout16);
    obj.button13:setLeft(0);
    obj.button13:setTop(0);
    obj.button13:setHeight(15);
    obj.button13:setWidth(15);
    obj.button13:setText("1");
    obj.button13:setFontSize(9);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout16);
    obj.button14:setLeft(0);
    obj.button14:setTop(13);
    obj.button14:setHeight(15);
    obj.button14:setWidth(15);
    obj.button14:setText("2");
    obj.button14:setFontSize(9);
    obj.button14:setName("button14");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout16);
    obj.label95:setLeft(20);
    obj.label95:setTop(5);
    obj.label95:setWidth(85);
    obj.label95:setHeight(20);
    obj.label95:setText("Consciência");
    obj.label95:setName("label95");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout16);
    obj.rectangle19:setLeft(100);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout16);
    obj.label96:setLeft(100);
    obj.label96:setTop(3);
    obj.label96:setWidth(50);
    obj.label96:setHeight(20);
    obj.label96:setField("totalconsciencia");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout16);
    obj.dataLink16:setField("baseconsciencia");
    obj.dataLink16:setDefaultValue("1");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout16);
    obj.dataLink17:setFields({'baseconsciencia', 'inicialconsciencia', 'bonusconsciencia', 'xpconsciencia', 'outroconsciencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink17:setName("dataLink17");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(80);
    obj.layout17:setWidth(235);
    obj.layout17:setHeight(30);
    obj.layout17:setName("layout17");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout17);
    obj.button15:setLeft(0);
    obj.button15:setTop(0);
    obj.button15:setHeight(15);
    obj.button15:setWidth(15);
    obj.button15:setText("1");
    obj.button15:setFontSize(9);
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout17);
    obj.button16:setLeft(0);
    obj.button16:setTop(13);
    obj.button16:setHeight(15);
    obj.button16:setWidth(15);
    obj.button16:setText("2");
    obj.button16:setFontSize(9);
    obj.button16:setName("button16");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout17);
    obj.label97:setLeft(20);
    obj.label97:setTop(5);
    obj.label97:setWidth(85);
    obj.label97:setHeight(20);
    obj.label97:setText("Espírito");
    obj.label97:setName("label97");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout17);
    obj.rectangle20:setLeft(100);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout17);
    obj.label98:setLeft(100);
    obj.label98:setTop(3);
    obj.label98:setWidth(50);
    obj.label98:setHeight(20);
    obj.label98:setField("totalespirito");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout17);
    obj.dataLink18:setField("baseespirito");
    obj.dataLink18:setDefaultValue("1");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout17);
    obj.dataLink19:setFields({'baseespirito', 'inicialespirito', 'bonusespirito', 'xpespirito', 'outroespirito', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink19:setName("dataLink19");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(110);
    obj.layout18:setWidth(235);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout18);
    obj.button17:setLeft(0);
    obj.button17:setTop(0);
    obj.button17:setHeight(15);
    obj.button17:setWidth(15);
    obj.button17:setText("1");
    obj.button17:setFontSize(9);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout18);
    obj.button18:setLeft(0);
    obj.button18:setTop(13);
    obj.button18:setHeight(15);
    obj.button18:setWidth(15);
    obj.button18:setText("2");
    obj.button18:setFontSize(9);
    obj.button18:setName("button18");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout18);
    obj.label99:setLeft(20);
    obj.label99:setTop(5);
    obj.label99:setWidth(85);
    obj.label99:setHeight(20);
    obj.label99:setText("Perseverança");
    obj.label99:setName("label99");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout18);
    obj.rectangle21:setLeft(100);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout18);
    obj.label100:setLeft(100);
    obj.label100:setTop(3);
    obj.label100:setWidth(50);
    obj.label100:setHeight(20);
    obj.label100:setField("totalperseveranca");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout18);
    obj.dataLink20:setField("baseperseveranca");
    obj.dataLink20:setDefaultValue("1");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout18);
    obj.dataLink21:setFields({'baseperseveranca', 'inicialperseveranca', 'bonusperseveranca', 'xpperseveranca', 'outroperseveranca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink21:setName("dataLink21");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout15);
    obj.horzLine2:setLeft(0);
    obj.horzLine2:setTop(145);
    obj.horzLine2:setWidth(235);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(150);
    obj.layout19:setWidth(235);
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout19);
    obj.label101:setLeft(10);
    obj.label101:setTop(0);
    obj.label101:setWidth(85);
    obj.label101:setHeight(20);
    obj.label101:setText("Gladius");
    obj.label101:setName("label101");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout19);
    obj.progressBar1:setLeft(70);
    obj.progressBar1:setTop(5);
    obj.progressBar1:setWidth(65);
    obj.progressBar1:setHeight(15);
    obj.progressBar1:setColor("blue");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setMax(1);
    obj.progressBar1:setField("gladius");
    obj.progressBar1:setName("progressBar1");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout19);
    obj.edit51:setLeft(150);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(30);
    obj.edit51:setHeight(25);
    obj.edit51:setType("number");
    obj.edit51:setField("gladiusMin");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout19);
    obj.edit52:setLeft(180);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(30);
    obj.edit52:setHeight(25);
    obj.edit52:setType("number");
    obj.edit52:setField("gladiusMax");
    obj.edit52:setName("edit52");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(515);
    obj.layout20:setWidth(235);
    obj.layout20:setHeight(70);
    obj.layout20:setName("layout20");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout20);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setXradius(15);
    obj.rectangle22:setYradius(15);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setName("rectangle22");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout20);
    obj.button19:setLeft(10);
    obj.button19:setTop(10);
    obj.button19:setWidth(70);
    obj.button19:setHeight(20);
    obj.button19:setText("Iniciativa");
    obj.button19:setName("button19");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout20);
    obj.rectangle23:setLeft(90);
    obj.rectangle23:setTop(10);
    obj.rectangle23:setWidth(35);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("Black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout20);
    obj.label102:setLeft(100);
    obj.label102:setTop(10);
    obj.label102:setWidth(30);
    obj.label102:setHeight(20);
    obj.label102:setField("iniciativa");
    obj.label102:setName("label102");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout20);
    obj.edit53:setLeft(130);
    obj.edit53:setTop(10);
    obj.edit53:setWidth(30);
    obj.edit53:setHeight(25);
    obj.edit53:setType("number");
    obj.edit53:setField("iniciativaBonus");
    obj.edit53:setName("edit53");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout20);
    obj.label103:setLeft(165);
    obj.label103:setTop(10);
    obj.label103:setWidth(80);
    obj.label103:setHeight(20);
    obj.label103:setField("ms");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout20);
    obj.label104:setLeft(10);
    obj.label104:setTop(40);
    obj.label104:setWidth(90);
    obj.label104:setHeight(20);
    obj.label104:setText("Velocidade");
    obj.label104:setName("label104");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout20);
    obj.rectangle24:setLeft(90);
    obj.rectangle24:setTop(40);
    obj.rectangle24:setWidth(35);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout20);
    obj.label105:setLeft(100);
    obj.label105:setTop(40);
    obj.label105:setWidth(30);
    obj.label105:setHeight(20);
    obj.label105:setField("velocidade");
    obj.label105:setName("label105");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout20);
    obj.edit54:setLeft(130);
    obj.edit54:setTop(40);
    obj.edit54:setWidth(30);
    obj.edit54:setHeight(25);
    obj.edit54:setType("number");
    obj.edit54:setField("velocidadeBonus");
    obj.edit54:setName("edit54");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout20);
    obj.label106:setLeft(165);
    obj.label106:setTop(40);
    obj.label106:setWidth(80);
    obj.label106:setHeight(20);
    obj.label106:setField("kmh");
    obj.label106:setName("label106");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout20);
    obj.dataLink22:setFields({'totalforca', 'totalagilidade', 'totalperspicacia', 'iniciativaBonus', 'velocidadeBonus'});
    obj.dataLink22:setName("dataLink22");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox1);
    obj.layout21:setLeft(240);
    obj.layout21:setTop(75);
    obj.layout21:setWidth(300);
    obj.layout21:setHeight(320);
    obj.layout21:setName("layout21");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout21);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setXradius(15);
    obj.rectangle25:setYradius(15);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setName("rectangle25");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout21);
    obj.label107:setLeft(0);
    obj.label107:setTop(0);
    obj.label107:setWidth(300);
    obj.label107:setHeight(20);
    obj.label107:setText("HISTORICOS");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout21);
    obj.label108:setLeft(25);
    obj.label108:setTop(20);
    obj.label108:setWidth(315);
    obj.label108:setHeight(20);
    obj.label108:setText(" Nome");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout21);
    obj.label109:setLeft(135);
    obj.label109:setTop(20);
    obj.label109:setWidth(315);
    obj.label109:setHeight(20);
    obj.label109:setText("Total");
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout21);
    obj.label110:setLeft(170);
    obj.label110:setTop(20);
    obj.label110:setWidth(25);
    obj.label110:setHeight(20);
    obj.label110:setText("Ini");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout21);
    obj.label111:setLeft(195);
    obj.label111:setTop(20);
    obj.label111:setWidth(25);
    obj.label111:setHeight(20);
    obj.label111:setText("Apr");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout21);
    obj.label112:setLeft(220);
    obj.label112:setTop(20);
    obj.label112:setWidth(25);
    obj.label112:setHeight(20);
    obj.label112:setText("XP");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout21);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(40);
    obj.scrollBox2:setWidth(295);
    obj.scrollBox2:setHeight(260);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox2);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(0);
    obj.layout22:setWidth(270);
    obj.layout22:setHeight(35);
    obj.layout22:setName("layout22");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout22);
    obj.button20:setLeft(0);
    obj.button20:setTop(0);
    obj.button20:setHeight(15);
    obj.button20:setWidth(15);
    obj.button20:setText("1");
    obj.button20:setFontSize(9);
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout22);
    obj.button21:setLeft(0);
    obj.button21:setTop(15);
    obj.button21:setHeight(15);
    obj.button21:setWidth(15);
    obj.button21:setText("2");
    obj.button21:setFontSize(9);
    obj.button21:setName("button21");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout22);
    obj.edit55:setLeft(20);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(100);
    obj.edit55:setHeight(25);
    obj.edit55:setField("historicoNome1_1");
    obj.edit55:setName("edit55");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout22);
    obj.rectangle26:setLeft(125);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(35);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout22);
    obj.label113:setLeft(135);
    obj.label113:setTop(3);
    obj.label113:setWidth(30);
    obj.label113:setHeight(20);
    obj.label113:setField("historicoTotal1_1");
    obj.label113:setName("label113");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout22);
    obj.edit56:setLeft(165);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(25);
    obj.edit56:setHeight(25);
    obj.edit56:setField("historicoValor1_1");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout22);
    obj.edit57:setLeft(190);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(25);
    obj.edit57:setHeight(25);
    obj.edit57:setField("historicoBonus1_1");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout22);
    obj.edit58:setLeft(215);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(25);
    obj.edit58:setHeight(25);
    obj.edit58:setField("historicoXp1_1");
    obj.edit58:setName("edit58");

    obj.histPop1_1 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop1_1:setParent(obj.layout22);
    obj.histPop1_1:setLeft(240);
    obj.histPop1_1:setTop(0);
    obj.histPop1_1:setWidth(25);
    obj.histPop1_1:setHeight(25);
    obj.histPop1_1:setText("i");
    obj.histPop1_1:setName("histPop1_1");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout22);
    obj.dataLink23:setField("historicoValor1_1");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout22);
    obj.dataLink24:setField("historicoBonus1_1");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout22);
    obj.dataLink25:setField("historicoXp1_1");
    obj.dataLink25:setName("dataLink25");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox2);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(35);
    obj.layout23:setWidth(270);
    obj.layout23:setHeight(35);
    obj.layout23:setName("layout23");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout23);
    obj.button22:setLeft(0);
    obj.button22:setTop(0);
    obj.button22:setHeight(15);
    obj.button22:setWidth(15);
    obj.button22:setText("1");
    obj.button22:setFontSize(9);
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout23);
    obj.button23:setLeft(0);
    obj.button23:setTop(15);
    obj.button23:setHeight(15);
    obj.button23:setWidth(15);
    obj.button23:setText("2");
    obj.button23:setFontSize(9);
    obj.button23:setName("button23");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout23);
    obj.edit59:setLeft(20);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(100);
    obj.edit59:setHeight(25);
    obj.edit59:setField("historicoNome1_2");
    obj.edit59:setName("edit59");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout23);
    obj.rectangle27:setLeft(125);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(35);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("Black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout23);
    obj.label114:setLeft(135);
    obj.label114:setTop(3);
    obj.label114:setWidth(30);
    obj.label114:setHeight(20);
    obj.label114:setField("historicoTotal1_2");
    obj.label114:setName("label114");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout23);
    obj.edit60:setLeft(165);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(25);
    obj.edit60:setHeight(25);
    obj.edit60:setField("historicoValor1_2");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout23);
    obj.edit61:setLeft(190);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(25);
    obj.edit61:setHeight(25);
    obj.edit61:setField("historicoBonus1_2");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout23);
    obj.edit62:setLeft(215);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(25);
    obj.edit62:setHeight(25);
    obj.edit62:setField("historicoXp1_2");
    obj.edit62:setName("edit62");

    obj.histPop1_2 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop1_2:setParent(obj.layout23);
    obj.histPop1_2:setLeft(240);
    obj.histPop1_2:setTop(0);
    obj.histPop1_2:setWidth(25);
    obj.histPop1_2:setHeight(25);
    obj.histPop1_2:setText("i");
    obj.histPop1_2:setName("histPop1_2");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout23);
    obj.dataLink26:setField("historicoValor1_2");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout23);
    obj.dataLink27:setField("historicoBonus1_2");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout23);
    obj.dataLink28:setField("historicoXp1_2");
    obj.dataLink28:setName("dataLink28");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox2);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(70);
    obj.layout24:setWidth(270);
    obj.layout24:setHeight(35);
    obj.layout24:setName("layout24");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout24);
    obj.button24:setLeft(0);
    obj.button24:setTop(0);
    obj.button24:setHeight(15);
    obj.button24:setWidth(15);
    obj.button24:setText("1");
    obj.button24:setFontSize(9);
    obj.button24:setName("button24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout24);
    obj.button25:setLeft(0);
    obj.button25:setTop(15);
    obj.button25:setHeight(15);
    obj.button25:setWidth(15);
    obj.button25:setText("2");
    obj.button25:setFontSize(9);
    obj.button25:setName("button25");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout24);
    obj.edit63:setLeft(20);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(100);
    obj.edit63:setHeight(25);
    obj.edit63:setField("historicoNome1_3");
    obj.edit63:setName("edit63");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout24);
    obj.rectangle28:setLeft(125);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout24);
    obj.label115:setLeft(135);
    obj.label115:setTop(3);
    obj.label115:setWidth(30);
    obj.label115:setHeight(20);
    obj.label115:setField("historicoTotal1_3");
    obj.label115:setName("label115");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout24);
    obj.edit64:setLeft(165);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(25);
    obj.edit64:setHeight(25);
    obj.edit64:setField("historicoValor1_3");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout24);
    obj.edit65:setLeft(190);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(25);
    obj.edit65:setHeight(25);
    obj.edit65:setField("historicoBonus1_3");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout24);
    obj.edit66:setLeft(215);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(25);
    obj.edit66:setHeight(25);
    obj.edit66:setField("historicoXp1_3");
    obj.edit66:setName("edit66");

    obj.histPop1_3 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop1_3:setParent(obj.layout24);
    obj.histPop1_3:setLeft(240);
    obj.histPop1_3:setTop(0);
    obj.histPop1_3:setWidth(25);
    obj.histPop1_3:setHeight(25);
    obj.histPop1_3:setText("i");
    obj.histPop1_3:setName("histPop1_3");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout24);
    obj.dataLink29:setField("historicoValor1_3");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout24);
    obj.dataLink30:setField("historicoBonus1_3");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout24);
    obj.dataLink31:setField("historicoXp1_3");
    obj.dataLink31:setName("dataLink31");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox2);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(105);
    obj.layout25:setWidth(270);
    obj.layout25:setHeight(35);
    obj.layout25:setName("layout25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout25);
    obj.button26:setLeft(0);
    obj.button26:setTop(0);
    obj.button26:setHeight(15);
    obj.button26:setWidth(15);
    obj.button26:setText("1");
    obj.button26:setFontSize(9);
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout25);
    obj.button27:setLeft(0);
    obj.button27:setTop(15);
    obj.button27:setHeight(15);
    obj.button27:setWidth(15);
    obj.button27:setText("2");
    obj.button27:setFontSize(9);
    obj.button27:setName("button27");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout25);
    obj.edit67:setLeft(20);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(100);
    obj.edit67:setHeight(25);
    obj.edit67:setField("historicoNome1_4");
    obj.edit67:setName("edit67");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout25);
    obj.rectangle29:setLeft(125);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("Black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout25);
    obj.label116:setLeft(135);
    obj.label116:setTop(3);
    obj.label116:setWidth(30);
    obj.label116:setHeight(20);
    obj.label116:setField("historicoTotal1_4");
    obj.label116:setName("label116");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout25);
    obj.edit68:setLeft(165);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(25);
    obj.edit68:setHeight(25);
    obj.edit68:setField("historicoValor1_4");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout25);
    obj.edit69:setLeft(190);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(25);
    obj.edit69:setHeight(25);
    obj.edit69:setField("historicoBonus1_4");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout25);
    obj.edit70:setLeft(215);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(25);
    obj.edit70:setHeight(25);
    obj.edit70:setField("historicoXp1_4");
    obj.edit70:setName("edit70");

    obj.histPop1_4 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop1_4:setParent(obj.layout25);
    obj.histPop1_4:setLeft(240);
    obj.histPop1_4:setTop(0);
    obj.histPop1_4:setWidth(25);
    obj.histPop1_4:setHeight(25);
    obj.histPop1_4:setText("i");
    obj.histPop1_4:setName("histPop1_4");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout25);
    obj.dataLink32:setField("historicoValor1_4");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout25);
    obj.dataLink33:setField("historicoBonus1_4");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout25);
    obj.dataLink34:setField("historicoXp1_4");
    obj.dataLink34:setName("dataLink34");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox2);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(140);
    obj.layout26:setWidth(270);
    obj.layout26:setHeight(35);
    obj.layout26:setName("layout26");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout26);
    obj.button28:setLeft(0);
    obj.button28:setTop(0);
    obj.button28:setHeight(15);
    obj.button28:setWidth(15);
    obj.button28:setText("1");
    obj.button28:setFontSize(9);
    obj.button28:setName("button28");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout26);
    obj.button29:setLeft(0);
    obj.button29:setTop(15);
    obj.button29:setHeight(15);
    obj.button29:setWidth(15);
    obj.button29:setText("2");
    obj.button29:setFontSize(9);
    obj.button29:setName("button29");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout26);
    obj.edit71:setLeft(20);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(100);
    obj.edit71:setHeight(25);
    obj.edit71:setField("historicoNome1_5");
    obj.edit71:setName("edit71");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout26);
    obj.rectangle30:setLeft(125);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout26);
    obj.label117:setLeft(135);
    obj.label117:setTop(3);
    obj.label117:setWidth(30);
    obj.label117:setHeight(20);
    obj.label117:setField("historicoTotal1_5");
    obj.label117:setName("label117");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout26);
    obj.edit72:setLeft(165);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(25);
    obj.edit72:setHeight(25);
    obj.edit72:setField("historicoValor1_5");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout26);
    obj.edit73:setLeft(190);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(25);
    obj.edit73:setHeight(25);
    obj.edit73:setField("historicoBonus1_5");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout26);
    obj.edit74:setLeft(215);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(25);
    obj.edit74:setHeight(25);
    obj.edit74:setField("historicoXp1_5");
    obj.edit74:setName("edit74");

    obj.histPop1_5 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop1_5:setParent(obj.layout26);
    obj.histPop1_5:setLeft(240);
    obj.histPop1_5:setTop(0);
    obj.histPop1_5:setWidth(25);
    obj.histPop1_5:setHeight(25);
    obj.histPop1_5:setText("i");
    obj.histPop1_5:setName("histPop1_5");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout26);
    obj.dataLink35:setField("historicoValor1_5");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout26);
    obj.dataLink36:setField("historicoBonus1_5");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout26);
    obj.dataLink37:setField("historicoXp1_5");
    obj.dataLink37:setName("dataLink37");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox2);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(175);
    obj.layout27:setWidth(270);
    obj.layout27:setHeight(35);
    obj.layout27:setName("layout27");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout27);
    obj.button30:setLeft(0);
    obj.button30:setTop(0);
    obj.button30:setHeight(15);
    obj.button30:setWidth(15);
    obj.button30:setText("1");
    obj.button30:setFontSize(9);
    obj.button30:setName("button30");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout27);
    obj.button31:setLeft(0);
    obj.button31:setTop(15);
    obj.button31:setHeight(15);
    obj.button31:setWidth(15);
    obj.button31:setText("2");
    obj.button31:setFontSize(9);
    obj.button31:setName("button31");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout27);
    obj.edit75:setLeft(20);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(100);
    obj.edit75:setHeight(25);
    obj.edit75:setField("historicoNome1_6");
    obj.edit75:setName("edit75");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout27);
    obj.rectangle31:setLeft(125);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("Black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout27);
    obj.label118:setLeft(135);
    obj.label118:setTop(3);
    obj.label118:setWidth(30);
    obj.label118:setHeight(20);
    obj.label118:setField("historicoTotal1_6");
    obj.label118:setName("label118");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout27);
    obj.edit76:setLeft(165);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(25);
    obj.edit76:setHeight(25);
    obj.edit76:setField("historicoValor1_6");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout27);
    obj.edit77:setLeft(190);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(25);
    obj.edit77:setHeight(25);
    obj.edit77:setField("historicoBonus1_6");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout27);
    obj.edit78:setLeft(215);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(25);
    obj.edit78:setHeight(25);
    obj.edit78:setField("historicoXp1_6");
    obj.edit78:setName("edit78");

    obj.histPop1_6 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop1_6:setParent(obj.layout27);
    obj.histPop1_6:setLeft(240);
    obj.histPop1_6:setTop(0);
    obj.histPop1_6:setWidth(25);
    obj.histPop1_6:setHeight(25);
    obj.histPop1_6:setText("i");
    obj.histPop1_6:setName("histPop1_6");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout27);
    obj.dataLink38:setField("historicoValor1_6");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout27);
    obj.dataLink39:setField("historicoBonus1_6");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout27);
    obj.dataLink40:setField("historicoXp1_6");
    obj.dataLink40:setName("dataLink40");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox2);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(210);
    obj.layout28:setWidth(270);
    obj.layout28:setHeight(35);
    obj.layout28:setName("layout28");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout28);
    obj.button32:setLeft(0);
    obj.button32:setTop(0);
    obj.button32:setHeight(15);
    obj.button32:setWidth(15);
    obj.button32:setText("1");
    obj.button32:setFontSize(9);
    obj.button32:setName("button32");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout28);
    obj.button33:setLeft(0);
    obj.button33:setTop(15);
    obj.button33:setHeight(15);
    obj.button33:setWidth(15);
    obj.button33:setText("2");
    obj.button33:setFontSize(9);
    obj.button33:setName("button33");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout28);
    obj.edit79:setLeft(20);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(100);
    obj.edit79:setHeight(25);
    obj.edit79:setField("historicoNome2_1");
    obj.edit79:setName("edit79");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout28);
    obj.rectangle32:setLeft(125);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout28);
    obj.label119:setLeft(135);
    obj.label119:setTop(3);
    obj.label119:setWidth(30);
    obj.label119:setHeight(20);
    obj.label119:setField("historicoTotal2_1");
    obj.label119:setName("label119");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout28);
    obj.edit80:setLeft(165);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(25);
    obj.edit80:setHeight(25);
    obj.edit80:setField("historicoValor2_1");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout28);
    obj.edit81:setLeft(190);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(25);
    obj.edit81:setHeight(25);
    obj.edit81:setField("historicoBonus2_1");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout28);
    obj.edit82:setLeft(215);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(25);
    obj.edit82:setHeight(25);
    obj.edit82:setField("historicoXp2_1");
    obj.edit82:setName("edit82");

    obj.histPop2_1 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop2_1:setParent(obj.layout28);
    obj.histPop2_1:setLeft(240);
    obj.histPop2_1:setTop(0);
    obj.histPop2_1:setWidth(25);
    obj.histPop2_1:setHeight(25);
    obj.histPop2_1:setText("i");
    obj.histPop2_1:setName("histPop2_1");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout28);
    obj.dataLink41:setField("historicoValor2_1");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout28);
    obj.dataLink42:setField("historicoBonus2_1");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout28);
    obj.dataLink43:setField("historicoXp2_1");
    obj.dataLink43:setName("dataLink43");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox2);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(245);
    obj.layout29:setWidth(270);
    obj.layout29:setHeight(35);
    obj.layout29:setName("layout29");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout29);
    obj.button34:setLeft(0);
    obj.button34:setTop(0);
    obj.button34:setHeight(15);
    obj.button34:setWidth(15);
    obj.button34:setText("1");
    obj.button34:setFontSize(9);
    obj.button34:setName("button34");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout29);
    obj.button35:setLeft(0);
    obj.button35:setTop(15);
    obj.button35:setHeight(15);
    obj.button35:setWidth(15);
    obj.button35:setText("2");
    obj.button35:setFontSize(9);
    obj.button35:setName("button35");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout29);
    obj.edit83:setLeft(20);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(100);
    obj.edit83:setHeight(25);
    obj.edit83:setField("historicoNome2_2");
    obj.edit83:setName("edit83");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout29);
    obj.rectangle33:setLeft(125);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(35);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("Black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout29);
    obj.label120:setLeft(135);
    obj.label120:setTop(3);
    obj.label120:setWidth(30);
    obj.label120:setHeight(20);
    obj.label120:setField("historicoTotal2_2");
    obj.label120:setName("label120");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout29);
    obj.edit84:setLeft(165);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(25);
    obj.edit84:setHeight(25);
    obj.edit84:setField("historicoValor2_2");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout29);
    obj.edit85:setLeft(190);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(25);
    obj.edit85:setHeight(25);
    obj.edit85:setField("historicoBonus2_2");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout29);
    obj.edit86:setLeft(215);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(25);
    obj.edit86:setHeight(25);
    obj.edit86:setField("historicoXp2_2");
    obj.edit86:setName("edit86");

    obj.histPop2_2 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop2_2:setParent(obj.layout29);
    obj.histPop2_2:setLeft(240);
    obj.histPop2_2:setTop(0);
    obj.histPop2_2:setWidth(25);
    obj.histPop2_2:setHeight(25);
    obj.histPop2_2:setText("i");
    obj.histPop2_2:setName("histPop2_2");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout29);
    obj.dataLink44:setField("historicoValor2_2");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout29);
    obj.dataLink45:setField("historicoBonus2_2");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout29);
    obj.dataLink46:setField("historicoXp2_2");
    obj.dataLink46:setName("dataLink46");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(280);
    obj.layout30:setWidth(270);
    obj.layout30:setHeight(35);
    obj.layout30:setName("layout30");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout30);
    obj.button36:setLeft(0);
    obj.button36:setTop(0);
    obj.button36:setHeight(15);
    obj.button36:setWidth(15);
    obj.button36:setText("1");
    obj.button36:setFontSize(9);
    obj.button36:setName("button36");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout30);
    obj.button37:setLeft(0);
    obj.button37:setTop(15);
    obj.button37:setHeight(15);
    obj.button37:setWidth(15);
    obj.button37:setText("2");
    obj.button37:setFontSize(9);
    obj.button37:setName("button37");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout30);
    obj.edit87:setLeft(20);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(100);
    obj.edit87:setHeight(25);
    obj.edit87:setField("historicoNome2_3");
    obj.edit87:setName("edit87");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout30);
    obj.rectangle34:setLeft(125);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(35);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout30);
    obj.label121:setLeft(135);
    obj.label121:setTop(3);
    obj.label121:setWidth(30);
    obj.label121:setHeight(20);
    obj.label121:setField("historicoTotal2_3");
    obj.label121:setName("label121");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout30);
    obj.edit88:setLeft(165);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(25);
    obj.edit88:setHeight(25);
    obj.edit88:setField("historicoValor2_3");
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout30);
    obj.edit89:setLeft(190);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(25);
    obj.edit89:setHeight(25);
    obj.edit89:setField("historicoBonus2_3");
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout30);
    obj.edit90:setLeft(215);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(25);
    obj.edit90:setHeight(25);
    obj.edit90:setField("historicoXp2_3");
    obj.edit90:setName("edit90");

    obj.histPop2_3 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop2_3:setParent(obj.layout30);
    obj.histPop2_3:setLeft(240);
    obj.histPop2_3:setTop(0);
    obj.histPop2_3:setWidth(25);
    obj.histPop2_3:setHeight(25);
    obj.histPop2_3:setText("i");
    obj.histPop2_3:setName("histPop2_3");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout30);
    obj.dataLink47:setField("historicoValor2_3");
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout30);
    obj.dataLink48:setField("historicoBonus2_3");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout30);
    obj.dataLink49:setField("historicoXp2_3");
    obj.dataLink49:setName("dataLink49");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox2);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(315);
    obj.layout31:setWidth(270);
    obj.layout31:setHeight(35);
    obj.layout31:setName("layout31");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout31);
    obj.button38:setLeft(0);
    obj.button38:setTop(0);
    obj.button38:setHeight(15);
    obj.button38:setWidth(15);
    obj.button38:setText("1");
    obj.button38:setFontSize(9);
    obj.button38:setName("button38");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout31);
    obj.button39:setLeft(0);
    obj.button39:setTop(15);
    obj.button39:setHeight(15);
    obj.button39:setWidth(15);
    obj.button39:setText("2");
    obj.button39:setFontSize(9);
    obj.button39:setName("button39");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout31);
    obj.edit91:setLeft(20);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(100);
    obj.edit91:setHeight(25);
    obj.edit91:setField("historicoNome2_4");
    obj.edit91:setName("edit91");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout31);
    obj.rectangle35:setLeft(125);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(35);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("Black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout31);
    obj.label122:setLeft(135);
    obj.label122:setTop(3);
    obj.label122:setWidth(30);
    obj.label122:setHeight(20);
    obj.label122:setField("historicoTotal2_4");
    obj.label122:setName("label122");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout31);
    obj.edit92:setLeft(165);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(25);
    obj.edit92:setHeight(25);
    obj.edit92:setField("historicoValor2_4");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout31);
    obj.edit93:setLeft(190);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(25);
    obj.edit93:setHeight(25);
    obj.edit93:setField("historicoBonus2_4");
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout31);
    obj.edit94:setLeft(215);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(25);
    obj.edit94:setHeight(25);
    obj.edit94:setField("historicoXp2_4");
    obj.edit94:setName("edit94");

    obj.histPop2_4 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop2_4:setParent(obj.layout31);
    obj.histPop2_4:setLeft(240);
    obj.histPop2_4:setTop(0);
    obj.histPop2_4:setWidth(25);
    obj.histPop2_4:setHeight(25);
    obj.histPop2_4:setText("i");
    obj.histPop2_4:setName("histPop2_4");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout31);
    obj.dataLink50:setField("historicoValor2_4");
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout31);
    obj.dataLink51:setField("historicoBonus2_4");
    obj.dataLink51:setName("dataLink51");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout31);
    obj.dataLink52:setField("historicoXp2_4");
    obj.dataLink52:setName("dataLink52");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox2);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(350);
    obj.layout32:setWidth(270);
    obj.layout32:setHeight(35);
    obj.layout32:setName("layout32");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout32);
    obj.button40:setLeft(0);
    obj.button40:setTop(0);
    obj.button40:setHeight(15);
    obj.button40:setWidth(15);
    obj.button40:setText("1");
    obj.button40:setFontSize(9);
    obj.button40:setName("button40");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout32);
    obj.button41:setLeft(0);
    obj.button41:setTop(15);
    obj.button41:setHeight(15);
    obj.button41:setWidth(15);
    obj.button41:setText("2");
    obj.button41:setFontSize(9);
    obj.button41:setName("button41");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout32);
    obj.edit95:setLeft(20);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(100);
    obj.edit95:setHeight(25);
    obj.edit95:setField("historicoNome2_5");
    obj.edit95:setName("edit95");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout32);
    obj.rectangle36:setLeft(125);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(35);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("Black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout32);
    obj.label123:setLeft(135);
    obj.label123:setTop(3);
    obj.label123:setWidth(30);
    obj.label123:setHeight(20);
    obj.label123:setField("historicoTotal2_5");
    obj.label123:setName("label123");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout32);
    obj.edit96:setLeft(165);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(25);
    obj.edit96:setHeight(25);
    obj.edit96:setField("historicoValor2_5");
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout32);
    obj.edit97:setLeft(190);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(25);
    obj.edit97:setHeight(25);
    obj.edit97:setField("historicoBonus2_5");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout32);
    obj.edit98:setLeft(215);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(25);
    obj.edit98:setHeight(25);
    obj.edit98:setField("historicoXp2_5");
    obj.edit98:setName("edit98");

    obj.histPop2_5 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop2_5:setParent(obj.layout32);
    obj.histPop2_5:setLeft(240);
    obj.histPop2_5:setTop(0);
    obj.histPop2_5:setWidth(25);
    obj.histPop2_5:setHeight(25);
    obj.histPop2_5:setText("i");
    obj.histPop2_5:setName("histPop2_5");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout32);
    obj.dataLink53:setField("historicoValor2_5");
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout32);
    obj.dataLink54:setField("historicoBonus2_5");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout32);
    obj.dataLink55:setField("historicoXp2_5");
    obj.dataLink55:setName("dataLink55");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox2);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(385);
    obj.layout33:setWidth(270);
    obj.layout33:setHeight(35);
    obj.layout33:setName("layout33");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout33);
    obj.button42:setLeft(0);
    obj.button42:setTop(0);
    obj.button42:setHeight(15);
    obj.button42:setWidth(15);
    obj.button42:setText("1");
    obj.button42:setFontSize(9);
    obj.button42:setName("button42");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout33);
    obj.button43:setLeft(0);
    obj.button43:setTop(15);
    obj.button43:setHeight(15);
    obj.button43:setWidth(15);
    obj.button43:setText("2");
    obj.button43:setFontSize(9);
    obj.button43:setName("button43");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout33);
    obj.edit99:setLeft(20);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(100);
    obj.edit99:setHeight(25);
    obj.edit99:setField("historicoNome2_6");
    obj.edit99:setName("edit99");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout33);
    obj.rectangle37:setLeft(125);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(35);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("Black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout33);
    obj.label124:setLeft(135);
    obj.label124:setTop(3);
    obj.label124:setWidth(30);
    obj.label124:setHeight(20);
    obj.label124:setField("historicoTotal2_6");
    obj.label124:setName("label124");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout33);
    obj.edit100:setLeft(165);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(25);
    obj.edit100:setHeight(25);
    obj.edit100:setField("historicoValor2_6");
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout33);
    obj.edit101:setLeft(190);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(25);
    obj.edit101:setHeight(25);
    obj.edit101:setField("historicoBonus2_6");
    obj.edit101:setName("edit101");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout33);
    obj.edit102:setLeft(215);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(25);
    obj.edit102:setHeight(25);
    obj.edit102:setField("historicoXp2_6");
    obj.edit102:setName("edit102");

    obj.histPop2_6 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop2_6:setParent(obj.layout33);
    obj.histPop2_6:setLeft(240);
    obj.histPop2_6:setTop(0);
    obj.histPop2_6:setWidth(25);
    obj.histPop2_6:setHeight(25);
    obj.histPop2_6:setText("i");
    obj.histPop2_6:setName("histPop2_6");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout33);
    obj.dataLink56:setField("historicoValor2_6");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout33);
    obj.dataLink57:setField("historicoBonus2_6");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout33);
    obj.dataLink58:setField("historicoXp2_6");
    obj.dataLink58:setName("dataLink58");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox2);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(420);
    obj.layout34:setWidth(270);
    obj.layout34:setHeight(35);
    obj.layout34:setName("layout34");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout34);
    obj.button44:setLeft(0);
    obj.button44:setTop(0);
    obj.button44:setHeight(15);
    obj.button44:setWidth(15);
    obj.button44:setText("1");
    obj.button44:setFontSize(9);
    obj.button44:setName("button44");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout34);
    obj.button45:setLeft(0);
    obj.button45:setTop(15);
    obj.button45:setHeight(15);
    obj.button45:setWidth(15);
    obj.button45:setText("2");
    obj.button45:setFontSize(9);
    obj.button45:setName("button45");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout34);
    obj.edit103:setLeft(20);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(100);
    obj.edit103:setHeight(25);
    obj.edit103:setField("historicoNome3_1");
    obj.edit103:setName("edit103");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout34);
    obj.rectangle38:setLeft(125);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(35);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout34);
    obj.label125:setLeft(135);
    obj.label125:setTop(3);
    obj.label125:setWidth(30);
    obj.label125:setHeight(20);
    obj.label125:setField("historicoTotal3_1");
    obj.label125:setName("label125");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout34);
    obj.edit104:setLeft(165);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(25);
    obj.edit104:setHeight(25);
    obj.edit104:setField("historicoValor3_1");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout34);
    obj.edit105:setLeft(190);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(25);
    obj.edit105:setHeight(25);
    obj.edit105:setField("historicoBonus3_1");
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout34);
    obj.edit106:setLeft(215);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(25);
    obj.edit106:setHeight(25);
    obj.edit106:setField("historicoXp3_1");
    obj.edit106:setName("edit106");

    obj.histPop3_1 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop3_1:setParent(obj.layout34);
    obj.histPop3_1:setLeft(240);
    obj.histPop3_1:setTop(0);
    obj.histPop3_1:setWidth(25);
    obj.histPop3_1:setHeight(25);
    obj.histPop3_1:setText("i");
    obj.histPop3_1:setName("histPop3_1");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout34);
    obj.dataLink59:setField("historicoValor3_1");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout34);
    obj.dataLink60:setField("historicoBonus3_1");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout34);
    obj.dataLink61:setField("historicoXp3_1");
    obj.dataLink61:setName("dataLink61");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox2);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(455);
    obj.layout35:setWidth(270);
    obj.layout35:setHeight(35);
    obj.layout35:setName("layout35");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout35);
    obj.button46:setLeft(0);
    obj.button46:setTop(0);
    obj.button46:setHeight(15);
    obj.button46:setWidth(15);
    obj.button46:setText("1");
    obj.button46:setFontSize(9);
    obj.button46:setName("button46");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout35);
    obj.button47:setLeft(0);
    obj.button47:setTop(15);
    obj.button47:setHeight(15);
    obj.button47:setWidth(15);
    obj.button47:setText("2");
    obj.button47:setFontSize(9);
    obj.button47:setName("button47");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout35);
    obj.edit107:setLeft(20);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(100);
    obj.edit107:setHeight(25);
    obj.edit107:setField("historicoNome3_2");
    obj.edit107:setName("edit107");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout35);
    obj.rectangle39:setLeft(125);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(35);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout35);
    obj.label126:setLeft(135);
    obj.label126:setTop(3);
    obj.label126:setWidth(30);
    obj.label126:setHeight(20);
    obj.label126:setField("historicoTotal3_2");
    obj.label126:setName("label126");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout35);
    obj.edit108:setLeft(165);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(25);
    obj.edit108:setHeight(25);
    obj.edit108:setField("historicoValor3_2");
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout35);
    obj.edit109:setLeft(190);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(25);
    obj.edit109:setHeight(25);
    obj.edit109:setField("historicoBonus3_2");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout35);
    obj.edit110:setLeft(215);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(25);
    obj.edit110:setHeight(25);
    obj.edit110:setField("historicoXp3_2");
    obj.edit110:setName("edit110");

    obj.histPop3_2 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop3_2:setParent(obj.layout35);
    obj.histPop3_2:setLeft(240);
    obj.histPop3_2:setTop(0);
    obj.histPop3_2:setWidth(25);
    obj.histPop3_2:setHeight(25);
    obj.histPop3_2:setText("i");
    obj.histPop3_2:setName("histPop3_2");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout35);
    obj.dataLink62:setField("historicoValor3_2");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout35);
    obj.dataLink63:setField("historicoBonus3_2");
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout35);
    obj.dataLink64:setField("historicoXp3_2");
    obj.dataLink64:setName("dataLink64");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox2);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(490);
    obj.layout36:setWidth(270);
    obj.layout36:setHeight(35);
    obj.layout36:setName("layout36");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout36);
    obj.button48:setLeft(0);
    obj.button48:setTop(0);
    obj.button48:setHeight(15);
    obj.button48:setWidth(15);
    obj.button48:setText("1");
    obj.button48:setFontSize(9);
    obj.button48:setName("button48");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout36);
    obj.button49:setLeft(0);
    obj.button49:setTop(15);
    obj.button49:setHeight(15);
    obj.button49:setWidth(15);
    obj.button49:setText("2");
    obj.button49:setFontSize(9);
    obj.button49:setName("button49");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout36);
    obj.edit111:setLeft(20);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(100);
    obj.edit111:setHeight(25);
    obj.edit111:setField("historicoNome3_3");
    obj.edit111:setName("edit111");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout36);
    obj.rectangle40:setLeft(125);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout36);
    obj.label127:setLeft(135);
    obj.label127:setTop(3);
    obj.label127:setWidth(30);
    obj.label127:setHeight(20);
    obj.label127:setField("historicoTotal3_3");
    obj.label127:setName("label127");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout36);
    obj.edit112:setLeft(165);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(25);
    obj.edit112:setHeight(25);
    obj.edit112:setField("historicoValor3_3");
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout36);
    obj.edit113:setLeft(190);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(25);
    obj.edit113:setHeight(25);
    obj.edit113:setField("historicoBonus3_3");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout36);
    obj.edit114:setLeft(215);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(25);
    obj.edit114:setHeight(25);
    obj.edit114:setField("historicoXp3_3");
    obj.edit114:setName("edit114");

    obj.histPop3_3 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop3_3:setParent(obj.layout36);
    obj.histPop3_3:setLeft(240);
    obj.histPop3_3:setTop(0);
    obj.histPop3_3:setWidth(25);
    obj.histPop3_3:setHeight(25);
    obj.histPop3_3:setText("i");
    obj.histPop3_3:setName("histPop3_3");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout36);
    obj.dataLink65:setField("historicoValor3_3");
    obj.dataLink65:setName("dataLink65");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout36);
    obj.dataLink66:setField("historicoBonus3_3");
    obj.dataLink66:setName("dataLink66");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout36);
    obj.dataLink67:setField("historicoXp3_3");
    obj.dataLink67:setName("dataLink67");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox2);
    obj.layout37:setLeft(5);
    obj.layout37:setTop(525);
    obj.layout37:setWidth(270);
    obj.layout37:setHeight(35);
    obj.layout37:setName("layout37");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout37);
    obj.button50:setLeft(0);
    obj.button50:setTop(0);
    obj.button50:setHeight(15);
    obj.button50:setWidth(15);
    obj.button50:setText("1");
    obj.button50:setFontSize(9);
    obj.button50:setName("button50");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout37);
    obj.button51:setLeft(0);
    obj.button51:setTop(15);
    obj.button51:setHeight(15);
    obj.button51:setWidth(15);
    obj.button51:setText("2");
    obj.button51:setFontSize(9);
    obj.button51:setName("button51");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout37);
    obj.edit115:setLeft(20);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(100);
    obj.edit115:setHeight(25);
    obj.edit115:setField("historicoNome3_4");
    obj.edit115:setName("edit115");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout37);
    obj.rectangle41:setLeft(125);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(35);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("Black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout37);
    obj.label128:setLeft(135);
    obj.label128:setTop(3);
    obj.label128:setWidth(30);
    obj.label128:setHeight(20);
    obj.label128:setField("historicoTotal3_4");
    obj.label128:setName("label128");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout37);
    obj.edit116:setLeft(165);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(25);
    obj.edit116:setHeight(25);
    obj.edit116:setField("historicoValor3_4");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout37);
    obj.edit117:setLeft(190);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(25);
    obj.edit117:setHeight(25);
    obj.edit117:setField("historicoBonus3_4");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout37);
    obj.edit118:setLeft(215);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(25);
    obj.edit118:setHeight(25);
    obj.edit118:setField("historicoXp3_4");
    obj.edit118:setName("edit118");

    obj.histPop3_4 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop3_4:setParent(obj.layout37);
    obj.histPop3_4:setLeft(240);
    obj.histPop3_4:setTop(0);
    obj.histPop3_4:setWidth(25);
    obj.histPop3_4:setHeight(25);
    obj.histPop3_4:setText("i");
    obj.histPop3_4:setName("histPop3_4");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout37);
    obj.dataLink68:setField("historicoValor3_4");
    obj.dataLink68:setName("dataLink68");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout37);
    obj.dataLink69:setField("historicoBonus3_4");
    obj.dataLink69:setName("dataLink69");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout37);
    obj.dataLink70:setField("historicoXp3_4");
    obj.dataLink70:setName("dataLink70");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setLeft(5);
    obj.layout38:setTop(560);
    obj.layout38:setWidth(270);
    obj.layout38:setHeight(35);
    obj.layout38:setName("layout38");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout38);
    obj.button52:setLeft(0);
    obj.button52:setTop(0);
    obj.button52:setHeight(15);
    obj.button52:setWidth(15);
    obj.button52:setText("1");
    obj.button52:setFontSize(9);
    obj.button52:setName("button52");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout38);
    obj.button53:setLeft(0);
    obj.button53:setTop(15);
    obj.button53:setHeight(15);
    obj.button53:setWidth(15);
    obj.button53:setText("2");
    obj.button53:setFontSize(9);
    obj.button53:setName("button53");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout38);
    obj.edit119:setLeft(20);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(100);
    obj.edit119:setHeight(25);
    obj.edit119:setField("historicoNome3_5");
    obj.edit119:setName("edit119");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout38);
    obj.rectangle42:setLeft(125);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(35);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("Black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout38);
    obj.label129:setLeft(135);
    obj.label129:setTop(3);
    obj.label129:setWidth(30);
    obj.label129:setHeight(20);
    obj.label129:setField("historicoTotal3_5");
    obj.label129:setName("label129");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout38);
    obj.edit120:setLeft(165);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(25);
    obj.edit120:setHeight(25);
    obj.edit120:setField("historicoValor3_5");
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout38);
    obj.edit121:setLeft(190);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(25);
    obj.edit121:setHeight(25);
    obj.edit121:setField("historicoBonus3_5");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout38);
    obj.edit122:setLeft(215);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(25);
    obj.edit122:setHeight(25);
    obj.edit122:setField("historicoXp3_5");
    obj.edit122:setName("edit122");

    obj.histPop3_5 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop3_5:setParent(obj.layout38);
    obj.histPop3_5:setLeft(240);
    obj.histPop3_5:setTop(0);
    obj.histPop3_5:setWidth(25);
    obj.histPop3_5:setHeight(25);
    obj.histPop3_5:setText("i");
    obj.histPop3_5:setName("histPop3_5");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout38);
    obj.dataLink71:setField("historicoValor3_5");
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout38);
    obj.dataLink72:setField("historicoBonus3_5");
    obj.dataLink72:setName("dataLink72");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout38);
    obj.dataLink73:setField("historicoXp3_5");
    obj.dataLink73:setName("dataLink73");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox2);
    obj.layout39:setLeft(5);
    obj.layout39:setTop(595);
    obj.layout39:setWidth(270);
    obj.layout39:setHeight(35);
    obj.layout39:setName("layout39");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout39);
    obj.button54:setLeft(0);
    obj.button54:setTop(0);
    obj.button54:setHeight(15);
    obj.button54:setWidth(15);
    obj.button54:setText("1");
    obj.button54:setFontSize(9);
    obj.button54:setName("button54");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout39);
    obj.button55:setLeft(0);
    obj.button55:setTop(15);
    obj.button55:setHeight(15);
    obj.button55:setWidth(15);
    obj.button55:setText("2");
    obj.button55:setFontSize(9);
    obj.button55:setName("button55");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout39);
    obj.edit123:setLeft(20);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(100);
    obj.edit123:setHeight(25);
    obj.edit123:setField("historicoNome3_6");
    obj.edit123:setName("edit123");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout39);
    obj.rectangle43:setLeft(125);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(35);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("Black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout39);
    obj.label130:setLeft(135);
    obj.label130:setTop(3);
    obj.label130:setWidth(30);
    obj.label130:setHeight(20);
    obj.label130:setField("historicoTotal3_6");
    obj.label130:setName("label130");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout39);
    obj.edit124:setLeft(165);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(25);
    obj.edit124:setHeight(25);
    obj.edit124:setField("historicoValor3_6");
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout39);
    obj.edit125:setLeft(190);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(25);
    obj.edit125:setHeight(25);
    obj.edit125:setField("historicoBonus3_6");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout39);
    obj.edit126:setLeft(215);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(25);
    obj.edit126:setHeight(25);
    obj.edit126:setField("historicoXp3_6");
    obj.edit126:setName("edit126");

    obj.histPop3_6 = GUI.fromHandle(_obj_newObject("button"));
    obj.histPop3_6:setParent(obj.layout39);
    obj.histPop3_6:setLeft(240);
    obj.histPop3_6:setTop(0);
    obj.histPop3_6:setWidth(25);
    obj.histPop3_6:setHeight(25);
    obj.histPop3_6:setText("i");
    obj.histPop3_6:setName("histPop3_6");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout39);
    obj.dataLink74:setField("historicoValor3_6");
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout39);
    obj.dataLink75:setField("historicoBonus3_6");
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout39);
    obj.dataLink76:setField("historicoXp3_6");
    obj.dataLink76:setName("dataLink76");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox1);
    obj.layout40:setLeft(240);
    obj.layout40:setTop(400);
    obj.layout40:setWidth(300);
    obj.layout40:setHeight(180);
    obj.layout40:setName("layout40");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout40);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(15);
    obj.rectangle44:setYradius(15);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout40);
    obj.label131:setLeft(0);
    obj.label131:setTop(5);
    obj.label131:setWidth(300);
    obj.label131:setHeight(20);
    obj.label131:setText("OUTROS");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout40);
    obj.button56:setText("+");
    obj.button56:setLeft(100);
    obj.button56:setTop(5);
    obj.button56:setWidth(20);
    obj.button56:setHeight(20);
    obj.button56:setName("button56");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout40);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(20);
    obj.scrollBox3:setWidth(295);
    obj.scrollBox3:setHeight(160);
    obj.scrollBox3:setName("scrollBox3");

    obj.rclListaOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaOutros:setParent(obj.scrollBox3);
    obj.rclListaOutros:setName("rclListaOutros");
    obj.rclListaOutros:setField("campoDosOutros");
    obj.rclListaOutros:setTemplateForm("frmOther");
    obj.rclListaOutros:setAlign("client");
    obj.rclListaOutros:setMargins({left=5,right=5,top=5,bottom=5});
    obj.rclListaOutros:setLayout("vertical");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.scrollBox1);
    obj.layout41:setLeft(545);
    obj.layout41:setTop(75);
    obj.layout41:setWidth(210);
    obj.layout41:setHeight(450);
    obj.layout41:setName("layout41");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout41);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setXradius(15);
    obj.rectangle45:setYradius(15);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout41);
    obj.label132:setLeft(5);
    obj.label132:setTop(0);
    obj.label132:setWidth(210);
    obj.label132:setHeight(20);
    obj.label132:setText("SAÚDE");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout41);
    obj.horzLine3:setLeft(0);
    obj.horzLine3:setTop(25);
    obj.horzLine3:setWidth(210);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(30);
    obj.layout42:setWidth(210);
    obj.layout42:setHeight(60);
    obj.layout42:setName("layout42");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout42);
    obj.label133:setLeft(10);
    obj.label133:setTop(0);
    obj.label133:setWidth(95);
    obj.label133:setHeight(20);
    obj.label133:setText("LEVE");
    obj.label133:setName("label133");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.layout42);
    obj.flowLayout6:setLeft(100);
    obj.flowLayout6:setTop(0);
    obj.flowLayout6:setHeight(100);
    obj.flowLayout6:setWidth(60);
    obj.flowLayout6:setName("flowLayout6");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout6);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("check1_1_1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowLayout6);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setField("check2_1_1");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowLayout6);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setField("check3_1_1");
    obj.checkBox3:setName("checkBox3");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout6);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowLayout6);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setField("check1_2_1");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowLayout6);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setField("check2_2_1");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowLayout6);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setField("check3_2_1");
    obj.checkBox6:setName("checkBox6");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout6);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowLayout6);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setField("check1_3_1");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowLayout6);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setField("check2_3_1");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowLayout6);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setField("check3_3_1");
    obj.checkBox9:setName("checkBox9");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout6);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout42);
    obj.edit127:setLeft(170);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(30);
    obj.edit127:setHeight(25);
    obj.edit127:setField("penalidade1");
    obj.edit127:setName("edit127");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout42);
    obj.dataLink77:setField("penalidade1");
    obj.dataLink77:setDefaultValue("0");
    obj.dataLink77:setName("dataLink77");


				local function isAny1()
					local mod = sheet.check1_1_1 or sheet.check2_1_1 or sheet.check3_1_1;
					local quantidade = tonumber(3);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_1 or sheet.check2_2_1 or sheet.check3_2_1;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_1 or sheet.check2_3_1 or sheet.check3_3_1;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_1 or sheet.check2_4_1 or sheet.check3_4_1;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_1 or sheet.check2_5_1 or sheet.check3_5_1;
					end;
					return mod;
				end;
			


    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout41);
    obj.horzLine4:setLeft(0);
    obj.horzLine4:setTop(95);
    obj.horzLine4:setWidth(210);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setName("horzLine4");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setLeft(0);
    obj.layout43:setTop(100);
    obj.layout43:setWidth(210);
    obj.layout43:setHeight(40);
    obj.layout43:setName("layout43");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout43);
    obj.label134:setLeft(10);
    obj.label134:setTop(0);
    obj.label134:setWidth(95);
    obj.label134:setHeight(20);
    obj.label134:setText("MEDIO");
    obj.label134:setName("label134");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.layout43);
    obj.flowLayout7:setLeft(100);
    obj.flowLayout7:setTop(0);
    obj.flowLayout7:setHeight(100);
    obj.flowLayout7:setWidth(60);
    obj.flowLayout7:setName("flowLayout7");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowLayout7);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setField("check1_1_2");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowLayout7);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setField("check2_1_2");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowLayout7);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setField("check3_1_2");
    obj.checkBox12:setName("checkBox12");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout7);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowLayout7);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setField("check1_2_2");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowLayout7);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setField("check2_2_2");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowLayout7);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setField("check3_2_2");
    obj.checkBox15:setName("checkBox15");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout7);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout43);
    obj.edit128:setLeft(170);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(30);
    obj.edit128:setHeight(25);
    obj.edit128:setField("penalidade2");
    obj.edit128:setName("edit128");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout43);
    obj.dataLink78:setField("penalidade2");
    obj.dataLink78:setDefaultValue("0.5");
    obj.dataLink78:setName("dataLink78");


				local function isAny2()
					local mod = sheet.check1_1_2 or sheet.check2_1_2 or sheet.check3_1_2;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_2 or sheet.check2_2_2 or sheet.check3_2_2;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_2 or sheet.check2_3_2 or sheet.check3_3_2;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_2 or sheet.check2_4_2 or sheet.check3_4_2;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_2 or sheet.check2_5_2 or sheet.check3_5_2;
					end;
					return mod;
				end;
			


    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout41);
    obj.horzLine5:setLeft(0);
    obj.horzLine5:setTop(145);
    obj.horzLine5:setWidth(210);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setName("horzLine5");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout41);
    obj.layout44:setLeft(0);
    obj.layout44:setTop(150);
    obj.layout44:setWidth(210);
    obj.layout44:setHeight(40);
    obj.layout44:setName("layout44");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout44);
    obj.label135:setLeft(10);
    obj.label135:setTop(0);
    obj.label135:setWidth(95);
    obj.label135:setHeight(20);
    obj.label135:setText("SERIO");
    obj.label135:setName("label135");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.layout44);
    obj.flowLayout8:setLeft(100);
    obj.flowLayout8:setTop(0);
    obj.flowLayout8:setHeight(100);
    obj.flowLayout8:setWidth(60);
    obj.flowLayout8:setName("flowLayout8");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowLayout8);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(20);
    obj.checkBox16:setField("check1_1_3");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowLayout8);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(20);
    obj.checkBox17:setField("check2_1_3");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowLayout8);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(20);
    obj.checkBox18:setField("check3_1_3");
    obj.checkBox18:setName("checkBox18");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout8);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowLayout8);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(20);
    obj.checkBox19:setField("check1_2_3");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowLayout8);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(20);
    obj.checkBox20:setField("check2_2_3");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowLayout8);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setWidth(20);
    obj.checkBox21:setField("check3_2_3");
    obj.checkBox21:setName("checkBox21");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout8);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout44);
    obj.edit129:setLeft(170);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(30);
    obj.edit129:setHeight(25);
    obj.edit129:setField("penalidade3");
    obj.edit129:setName("edit129");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout44);
    obj.dataLink79:setField("penalidade3");
    obj.dataLink79:setDefaultValue("1");
    obj.dataLink79:setName("dataLink79");


				local function isAny3()
					local mod = sheet.check1_1_3 or sheet.check2_1_3 or sheet.check3_1_3;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_3 or sheet.check2_2_3 or sheet.check3_2_3;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_3 or sheet.check2_3_3 or sheet.check3_3_3;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_3 or sheet.check2_4_3 or sheet.check3_4_3;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_3 or sheet.check2_5_3 or sheet.check3_5_3;
					end;
					return mod;
				end;
			


    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout41);
    obj.horzLine6:setLeft(0);
    obj.horzLine6:setTop(195);
    obj.horzLine6:setWidth(210);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setName("horzLine6");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout41);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(200);
    obj.layout45:setWidth(210);
    obj.layout45:setHeight(40);
    obj.layout45:setName("layout45");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout45);
    obj.label136:setLeft(10);
    obj.label136:setTop(0);
    obj.label136:setWidth(95);
    obj.label136:setHeight(20);
    obj.label136:setText("GRAVE");
    obj.label136:setName("label136");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.layout45);
    obj.flowLayout9:setLeft(100);
    obj.flowLayout9:setTop(0);
    obj.flowLayout9:setHeight(100);
    obj.flowLayout9:setWidth(60);
    obj.flowLayout9:setName("flowLayout9");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowLayout9);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setWidth(20);
    obj.checkBox22:setField("check1_1_4");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowLayout9);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setWidth(20);
    obj.checkBox23:setField("check2_1_4");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowLayout9);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setWidth(20);
    obj.checkBox24:setField("check3_1_4");
    obj.checkBox24:setName("checkBox24");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout9);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.flowLayout9);
    obj.checkBox25:setAlign("left");
    obj.checkBox25:setWidth(20);
    obj.checkBox25:setField("check1_2_4");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.flowLayout9);
    obj.checkBox26:setAlign("left");
    obj.checkBox26:setWidth(20);
    obj.checkBox26:setField("check2_2_4");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.flowLayout9);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setWidth(20);
    obj.checkBox27:setField("check3_2_4");
    obj.checkBox27:setName("checkBox27");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout9);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout45);
    obj.edit130:setLeft(170);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(30);
    obj.edit130:setHeight(25);
    obj.edit130:setField("penalidade4");
    obj.edit130:setName("edit130");

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout45);
    obj.dataLink80:setField("penalidade4");
    obj.dataLink80:setDefaultValue("2");
    obj.dataLink80:setName("dataLink80");


				local function isAny4()
					local mod = sheet.check1_1_4 or sheet.check2_1_4 or sheet.check3_1_4;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_4 or sheet.check2_2_4 or sheet.check3_2_4;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_4 or sheet.check2_3_4 or sheet.check3_3_4;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_4 or sheet.check2_4_4 or sheet.check3_4_4;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_4 or sheet.check2_5_4 or sheet.check3_5_4;
					end;
					return mod;
				end;
			


    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout41);
    obj.horzLine7:setLeft(0);
    obj.horzLine7:setTop(245);
    obj.horzLine7:setWidth(210);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setName("horzLine7");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout41);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(250);
    obj.layout46:setWidth(210);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout46);
    obj.label137:setLeft(10);
    obj.label137:setTop(0);
    obj.label137:setWidth(95);
    obj.label137:setHeight(20);
    obj.label137:setText("INCAPACITADO");
    obj.label137:setName("label137");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.layout46);
    obj.flowLayout10:setLeft(100);
    obj.flowLayout10:setTop(0);
    obj.flowLayout10:setHeight(100);
    obj.flowLayout10:setWidth(60);
    obj.flowLayout10:setName("flowLayout10");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.flowLayout10);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setWidth(20);
    obj.checkBox28:setField("check1_1_5");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.flowLayout10);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setWidth(20);
    obj.checkBox29:setField("check2_1_5");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.flowLayout10);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setWidth(20);
    obj.checkBox30:setField("check3_1_5");
    obj.checkBox30:setName("checkBox30");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout10);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout46);
    obj.edit131:setLeft(170);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(30);
    obj.edit131:setHeight(25);
    obj.edit131:setField("penalidade5");
    obj.edit131:setName("edit131");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout46);
    obj.dataLink81:setField("penalidade5");
    obj.dataLink81:setDefaultValue("4");
    obj.dataLink81:setName("dataLink81");


				local function isAny5()
					local mod = sheet.check1_1_5 or sheet.check2_1_5 or sheet.check3_1_5;
					local quantidade = tonumber(1);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_5 or sheet.check2_2_5 or sheet.check3_2_5;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_5 or sheet.check2_3_5 or sheet.check3_3_5;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_5 or sheet.check2_4_5 or sheet.check3_4_5;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_5 or sheet.check2_5_5 or sheet.check3_5_5;
					end;
					return mod;
				end;
			


    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout41);
    obj.horzLine8:setLeft(0);
    obj.horzLine8:setTop(280);
    obj.horzLine8:setWidth(210);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setName("horzLine8");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout41);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(285);
    obj.layout47:setWidth(210);
    obj.layout47:setHeight(100);
    obj.layout47:setName("layout47");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout47);
    obj.label138:setLeft(10);
    obj.label138:setTop(0);
    obj.label138:setWidth(95);
    obj.label138:setHeight(20);
    obj.label138:setText("INCOSCIENTE");
    obj.label138:setName("label138");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.layout47);
    obj.flowLayout11:setLeft(100);
    obj.flowLayout11:setTop(0);
    obj.flowLayout11:setHeight(100);
    obj.flowLayout11:setWidth(60);
    obj.flowLayout11:setName("flowLayout11");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.flowLayout11);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setWidth(20);
    obj.checkBox31:setField("check1_1_6");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.flowLayout11);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setWidth(20);
    obj.checkBox32:setField("check2_1_6");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.flowLayout11);
    obj.checkBox33:setAlign("left");
    obj.checkBox33:setWidth(20);
    obj.checkBox33:setField("check3_1_6");
    obj.checkBox33:setName("checkBox33");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout11);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.flowLayout11);
    obj.checkBox34:setAlign("left");
    obj.checkBox34:setWidth(20);
    obj.checkBox34:setField("check1_2_6");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.flowLayout11);
    obj.checkBox35:setAlign("left");
    obj.checkBox35:setWidth(20);
    obj.checkBox35:setField("check2_2_6");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.flowLayout11);
    obj.checkBox36:setAlign("left");
    obj.checkBox36:setWidth(20);
    obj.checkBox36:setField("check3_2_6");
    obj.checkBox36:setName("checkBox36");

    obj.flowLineBreak12 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout11);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.flowLayout11);
    obj.checkBox37:setAlign("left");
    obj.checkBox37:setWidth(20);
    obj.checkBox37:setField("check1_3_6");
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.flowLayout11);
    obj.checkBox38:setAlign("left");
    obj.checkBox38:setWidth(20);
    obj.checkBox38:setField("check2_3_6");
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.flowLayout11);
    obj.checkBox39:setAlign("left");
    obj.checkBox39:setWidth(20);
    obj.checkBox39:setField("check3_3_6");
    obj.checkBox39:setName("checkBox39");

    obj.flowLineBreak13 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.flowLayout11);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.flowLayout11);
    obj.checkBox40:setAlign("left");
    obj.checkBox40:setWidth(20);
    obj.checkBox40:setField("check1_4_6");
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.flowLayout11);
    obj.checkBox41:setAlign("left");
    obj.checkBox41:setWidth(20);
    obj.checkBox41:setField("check2_4_6");
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.flowLayout11);
    obj.checkBox42:setAlign("left");
    obj.checkBox42:setWidth(20);
    obj.checkBox42:setField("check3_4_6");
    obj.checkBox42:setName("checkBox42");

    obj.flowLineBreak14 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.flowLayout11);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.flowLayout11);
    obj.checkBox43:setAlign("left");
    obj.checkBox43:setWidth(20);
    obj.checkBox43:setField("check1_5_6");
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.flowLayout11);
    obj.checkBox44:setAlign("left");
    obj.checkBox44:setWidth(20);
    obj.checkBox44:setField("check2_5_6");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.flowLayout11);
    obj.checkBox45:setAlign("left");
    obj.checkBox45:setWidth(20);
    obj.checkBox45:setField("check3_5_6");
    obj.checkBox45:setName("checkBox45");

    obj.flowLineBreak15 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.flowLayout11);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout47);
    obj.edit132:setLeft(170);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(30);
    obj.edit132:setHeight(25);
    obj.edit132:setField("penalidade6");
    obj.edit132:setName("edit132");

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout47);
    obj.dataLink82:setField("penalidade6");
    obj.dataLink82:setDefaultValue("0");
    obj.dataLink82:setName("dataLink82");


				local function isAny6()
					local mod = sheet.check1_1_6 or sheet.check2_1_6 or sheet.check3_1_6;
					local quantidade = tonumber(5);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_6 or sheet.check2_2_6 or sheet.check3_2_6;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_6 or sheet.check2_3_6 or sheet.check3_3_6;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_6 or sheet.check2_4_6 or sheet.check3_4_6;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_6 or sheet.check2_5_6 or sheet.check3_5_6;
					end;
					return mod;
				end;
			


    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout41);
    obj.horzLine9:setLeft(0);
    obj.horzLine9:setTop(385);
    obj.horzLine9:setWidth(210);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setName("horzLine9");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout41);
    obj.label139:setLeft(5);
    obj.label139:setTop(415);
    obj.label139:setWidth(60);
    obj.label139:setHeight(20);
    obj.label139:setText("Absorção");
    obj.label139:setName("label139");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout41);
    obj.label140:setLeft(65);
    obj.label140:setTop(390);
    obj.label140:setWidth(30);
    obj.label140:setHeight(20);
    obj.label140:setText("Total");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout41);
    obj.rectangle46:setLeft(65);
    obj.rectangle46:setTop(415);
    obj.rectangle46:setWidth(30);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("Black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout41);
    obj.label141:setLeft(65);
    obj.label141:setTop(415);
    obj.label141:setWidth(30);
    obj.label141:setHeight(25);
    obj.label141:setField("absorcao");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout41);
    obj.label142:setLeft(100);
    obj.label142:setTop(390);
    obj.label142:setWidth(30);
    obj.label142:setHeight(20);
    obj.label142:setText(" Res.");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout41);
    obj.rectangle47:setLeft(100);
    obj.rectangle47:setTop(415);
    obj.rectangle47:setWidth(30);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("Black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout41);
    obj.label143:setLeft(100);
    obj.label143:setTop(415);
    obj.label143:setWidth(30);
    obj.label143:setHeight(25);
    obj.label143:setField("absRes");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout41);
    obj.dataLink83:setField("totalresiliencia");
    obj.dataLink83:setName("dataLink83");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout41);
    obj.label144:setLeft(135);
    obj.label144:setTop(390);
    obj.label144:setWidth(30);
    obj.label144:setHeight(20);
    obj.label144:setText("Arm");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout41);
    obj.rectangle48:setLeft(135);
    obj.rectangle48:setTop(415);
    obj.rectangle48:setWidth(30);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("Black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout41);
    obj.label145:setLeft(135);
    obj.label145:setTop(415);
    obj.label145:setWidth(30);
    obj.label145:setHeight(25);
    obj.label145:setField("indiceArmadura");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout41);
    obj.label146:setLeft(170);
    obj.label146:setTop(390);
    obj.label146:setWidth(30);
    obj.label146:setHeight(20);
    obj.label146:setText(" Out.");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout41);
    obj.edit133:setLeft(170);
    obj.edit133:setTop(415);
    obj.edit133:setWidth(30);
    obj.edit133:setHeight(25);
    obj.edit133:setType("number");
    obj.edit133:setField("absOutros");
    obj.edit133:setName("edit133");

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout41);
    obj.dataLink84:setFields({'absRes', 'indiceArmadura', 'absOutros'});
    obj.dataLink84:setName("dataLink84");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox1);
    obj.layout48:setLeft(760);
    obj.layout48:setTop(445);
    obj.layout48:setWidth(300);
    obj.layout48:setHeight(80);
    obj.layout48:setName("layout48");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout48);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout48);
    obj.rectangle50:setLeft(10);
    obj.rectangle50:setTop(30);
    obj.rectangle50:setWidth(35);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("Black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout48);
    obj.label147:setLeft(5);
    obj.label147:setTop(10);
    obj.label147:setWidth(50);
    obj.label147:setHeight(20);
    obj.label147:setText("Dado 1");
    obj.label147:setName("label147");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout48);
    obj.label148:setLeft(20);
    obj.label148:setTop(32);
    obj.label148:setWidth(30);
    obj.label148:setHeight(20);
    obj.label148:setField("num1");
    obj.label148:setText("val");
    obj.label148:setName("label148");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout48);
    obj.label149:setLeft(46);
    obj.label149:setTop(32);
    obj.label149:setWidth(10);
    obj.label149:setHeight(20);
    obj.label149:setText("+");
    obj.label149:setName("label149");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout48);
    obj.rectangle51:setLeft(55);
    obj.rectangle51:setTop(30);
    obj.rectangle51:setWidth(35);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("Black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout48);
    obj.label150:setLeft(50);
    obj.label150:setTop(10);
    obj.label150:setWidth(50);
    obj.label150:setHeight(20);
    obj.label150:setText("Dado 2");
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout48);
    obj.label151:setLeft(65);
    obj.label151:setTop(32);
    obj.label151:setWidth(30);
    obj.label151:setHeight(20);
    obj.label151:setField("num2");
    obj.label151:setText("val");
    obj.label151:setName("label151");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout48);
    obj.button57:setLeft(70);
    obj.button57:setTop(60);
    obj.button57:setWidth(15);
    obj.button57:setHeight(15);
    obj.button57:setText("x");
    obj.button57:setFontSize(10);
    obj.button57:setName("button57");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout48);
    obj.label152:setLeft(105);
    obj.label152:setTop(60);
    obj.label152:setWidth(80);
    obj.label152:setHeight(15);
    obj.label152:setField("rollnome1");
    obj.label152:setFontSize(11);
    obj.label152:setHorzTextAlign("trailing");
    obj.label152:setName("label152");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout48);
    obj.label153:setLeft(185);
    obj.label153:setTop(60);
    obj.label153:setWidth(15);
    obj.label153:setHeight(15);
    obj.label153:setText("+");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout48);
    obj.label154:setLeft(200);
    obj.label154:setTop(60);
    obj.label154:setWidth(80);
    obj.label154:setHeight(15);
    obj.label154:setField("rollnome2");
    obj.label154:setFontSize(11);
    obj.label154:setName("label154");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout48);
    obj.label155:setLeft(92);
    obj.label155:setTop(32);
    obj.label155:setWidth(10);
    obj.label155:setHeight(20);
    obj.label155:setText("+");
    obj.label155:setName("label155");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout48);
    obj.label156:setLeft(105);
    obj.label156:setTop(10);
    obj.label156:setWidth(40);
    obj.label156:setHeight(20);
    obj.label156:setText("Especs");
    obj.label156:setName("label156");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout48);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setItems({'0', '1,5', '3'});
    obj.comboBox1:setValues({'0', '1', '2'});
    obj.comboBox1:setValue("0");
    obj.comboBox1:setField("especBonus");
    obj.comboBox1:setName("comboBox1");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout48);
    obj.label157:setLeft(160);
    obj.label157:setTop(10);
    obj.label157:setWidth(40);
    obj.label157:setHeight(20);
    obj.label157:setText("Extra");
    obj.label157:setName("label157");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout48);
    obj.edit134:setLeft(160);
    obj.edit134:setTop(30);
    obj.edit134:setWidth(30);
    obj.edit134:setHeight(25);
    obj.edit134:setField("extra");
    obj.edit134:setName("edit134");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout48);
    obj.label158:setLeft(195);
    obj.label158:setTop(10);
    obj.label158:setWidth(40);
    obj.label158:setHeight(20);
    obj.label158:setText("Dific.");
    obj.label158:setName("label158");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout48);
    obj.edit135:setLeft(195);
    obj.edit135:setTop(30);
    obj.edit135:setWidth(30);
    obj.edit135:setHeight(25);
    obj.edit135:setField("dificuldade");
    obj.edit135:setType("number");
    obj.edit135:setName("edit135");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout48);
    obj.button58:setLeft(230);
    obj.button58:setTop(30);
    obj.button58:setWidth(50);
    obj.button58:setText("ROLAR");
    obj.button58:setFontSize(11);
    obj.button58:setName("button58");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.scrollBox1);
    obj.rectangle52:setLeft(760);
    obj.rectangle52:setTop(90);
    obj.rectangle52:setWidth(350);
    obj.rectangle52:setHeight(350);
    obj.rectangle52:setColor("DimGray");
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(5);
    obj.rectangle52:setCornerType("innerLine");
    obj.rectangle52:setName("rectangle52");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(760);
    obj.image1:setTop(90);
    obj.image1:setWidth(350);
    obj.image1:setHeight(350);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");


		local function rolar()
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);
			local num1 = (tonumber(sheet.num1) or 0);
			local num2 = (tonumber(sheet.num2) or 0);
            local parada = num1 + num2 + (tonumber(sheet.extra) or 0);
            if sheet.especBonus=='1' then
            	parada = parada + 1.5;
            elseif sheet.especBonus=='2' then
            	parada = parada + 3;
            end;
			local pen = 0;
			if isAny6() then
				pen = tonumber(sheet.penalidade6) or 0;
			elseif isAny5() then
				pen = tonumber(sheet.penalidade5) or 0;
			elseif isAny4() then
				pen = tonumber(sheet.penalidade4) or 0;
			elseif isAny3() then
				pen = tonumber(sheet.penalidade3) or 0;
			elseif isAny2() then
				pen = tonumber(sheet.penalidade2) or 0;
			elseif isAny1() then
				pen = tonumber(sheet.penalidade1) or 0;
			end;
			parada = parada - math.abs(pen);
			
            parada = math.floor(parada);

           	local dificuldade = (tonumber(sheet.dificuldade) or 0);
           	dificuldade = dificuldade;

           	local nome = "";
           	if sheet.rollnome1 ~= nil then 
           		nome = sheet.rollnome1 .. " ";
           	end;
           	if sheet.rollnome2 ~= nil then
           		nome = nome .. "+ " .. sheet.rollnome2 .. " ";
           	end;

           	if parada < 1 then 
           		mesaDoPersonagem.activeChat:enviarMensagem("Sem dados suficientes para essa rolagem. ");
           		return;
           	end;

           	rolagem = rrpg.interpretarRolagem(parada .. "d10");
           	mesaDoPersonagem.activeChat:rolarDados(rolagem, nome .. "Dificuldade: " .. dificuldade  .. " (" .. num1 .. " + " .. num2 .. " + " .. (sheet.especBonus or 0) .. "x especializaçao + " .. (sheet.extra or 0) .. " - " .. pen .. " dano)", 
				function (rolado)
					local sucessos = 0;
					local op = rolado.ops[1];

					for j=1, #op.resultados, 1 do
						if op.resultados[j] >= dificuldade then
					    	sucessos = sucessos +1;
						end;
					end;
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					mesaDoPersonagem.activeChat:enviarMensagem(sucessos .. " Sucesso(s)!");
				end);
		end;
	


    obj._e_event0 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local node = NDB.getRoot(sheet)
            				local id = self.popHistorico.scopeNode.id or "_"
            				node["historicoValor"..id] = self.popHistorico.scopeNode.historicoValor
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local node = NDB.getRoot(sheet)
            				local id = self.popHistorico.scopeNode.id or "_"
            				node["historicoBonus"..id] = self.popHistorico.scopeNode.historicoBonus
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local node = NDB.getRoot(sheet)
            				local id = self.popHistorico.scopeNode.id or "_"
            				node["historicoXp"..id] = self.popHistorico.scopeNode.historicoXp
        end, obj);

    obj._e_event3 = obj.btFisicos:addEventListener("onClick",
        function (_)
            ShowPopup("popFisicos","btFisicos")
        end, obj);

    obj._e_event4 = obj.btMentais:addEventListener("onClick",
        function (_)
            ShowPopup("popMentais","btMentais")
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome1 = "Força";
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome2 = "Força";
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseforca) or 0)+
            							(tonumber(sheet.inicialforca) or 0)+
            							(tonumber(sheet.bonusforca) or 0)+
            							(tonumber(sheet.xpforca) or 0) +
            							(tonumber(sheet.outroforca) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "forca"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalforca = mod .. " | " ..(mod / 2);
            					sheet.testeforca = mod / 2;
            				else
            					sheet.totalforca = mod;
            					sheet.testeforca = mod;
            				end;
        end, obj);

    obj._e_event8 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome1 = "Agilidade";
        end, obj);

    obj._e_event9 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome2 = "Agilidade";
        end, obj);

    obj._e_event10 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseagilidade) or 0)+
            							(tonumber(sheet.inicialagilidade) or 0)+
            							(tonumber(sheet.bonusagilidade) or 0)+
            							(tonumber(sheet.xpagilidade) or 0) +
            							(tonumber(sheet.outroagilidade) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "agilidade"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalagilidade = mod .. " | " ..(mod / 2);
            					sheet.testeagilidade = mod / 2;
            				else
            					sheet.totalagilidade = mod;
            					sheet.testeagilidade = mod;
            				end;
        end, obj);

    obj._e_event11 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome1 = "Resiliência";
        end, obj);

    obj._e_event12 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome2 = "Resiliência";
        end, obj);

    obj._e_event13 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseresiliencia) or 0)+
            							(tonumber(sheet.inicialresiliencia) or 0)+
            							(tonumber(sheet.bonusresiliencia) or 0)+
            							(tonumber(sheet.xpresiliencia) or 0) +
            							(tonumber(sheet.outroresiliencia) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "resiliencia"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalresiliencia = mod .. " | " ..(mod / 2);
            					sheet.testeresiliencia = mod / 2;
            				else
            					sheet.totalresiliencia = mod;
            					sheet.testeresiliencia = mod;
            				end;
        end, obj);

    obj._e_event14 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome1 = "Carisma";
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome2 = "Carisma";
        end, obj);

    obj._e_event16 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.basecarisma) or 0)+
            							(tonumber(sheet.inicialcarisma) or 0)+
            							(tonumber(sheet.bonuscarisma) or 0)+
            							(tonumber(sheet.xpcarisma) or 0) +
            							(tonumber(sheet.outrocarisma) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "carisma"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalcarisma = mod .. " | " ..(mod / 2);
            					sheet.testecarisma = mod / 2;
            				else
            					sheet.totalcarisma = mod;
            					sheet.testecarisma = mod;
            				end;
        end, obj);

    obj._e_event17 = obj.button9:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome1 = "Percepção";
        end, obj);

    obj._e_event18 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome2 = "Percepção";
        end, obj);

    obj._e_event19 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.basepercepcao) or 0)+
            							(tonumber(sheet.inicialpercepcao) or 0)+
            							(tonumber(sheet.bonuspercepcao) or 0)+
            							(tonumber(sheet.xppercepcao) or 0) +
            							(tonumber(sheet.outropercepcao) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "percepcao"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalpercepcao = mod .. " | " ..(mod / 2);
            					sheet.testepercepcao = mod / 2;
            				else
            					sheet.totalpercepcao = mod;
            					sheet.testepercepcao = mod;
            				end;
        end, obj);

    obj._e_event20 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome1 = "Perspicácia";
        end, obj);

    obj._e_event21 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome2 = "Perspicácia";
        end, obj);

    obj._e_event22 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseperspicacia) or 0)+
            							(tonumber(sheet.inicialperspicacia) or 0)+
            							(tonumber(sheet.bonusperspicacia) or 0)+
            							(tonumber(sheet.xpperspicacia) or 0) +
            							(tonumber(sheet.outroperspicacia) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "perspicacia"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalperspicacia = mod .. " | " ..(mod / 2);
            					sheet.testeperspicacia = mod / 2;
            				else
            					sheet.totalperspicacia = mod;
            					sheet.testeperspicacia = mod;
            				end;
        end, obj);

    obj._e_event23 = obj.btAegis:addEventListener("onClick",
        function (_)
            ShowPopup("popAegis","btAegis")
        end, obj);

    obj._e_event24 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome1 = "Consciência";
        end, obj);

    obj._e_event25 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome2 = "Consciência";
        end, obj);

    obj._e_event26 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseconsciencia) or 0)+
            							(tonumber(sheet.inicialconsciencia) or 0)+
            							(tonumber(sheet.bonusconsciencia) or 0)+
            							(tonumber(sheet.xpconsciencia) or 0) +
            							(tonumber(sheet.outroconsciencia) or 0);
            				if 1 > 1 then
            					local pen = 0;
            					if "consciencia"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalconsciencia = mod .. " | " ..(mod / 1);
            					sheet.testeconsciencia = mod / 1;
            				else
            					sheet.totalconsciencia = mod;
            					sheet.testeconsciencia = mod;
            				end;
        end, obj);

    obj._e_event27 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome1 = "Espírito";
        end, obj);

    obj._e_event28 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome2 = "Espírito";
        end, obj);

    obj._e_event29 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseespirito) or 0)+
            							(tonumber(sheet.inicialespirito) or 0)+
            							(tonumber(sheet.bonusespirito) or 0)+
            							(tonumber(sheet.xpespirito) or 0) +
            							(tonumber(sheet.outroespirito) or 0);
            				if 1 > 1 then
            					local pen = 0;
            					if "espirito"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalespirito = mod .. " | " ..(mod / 1);
            					sheet.testeespirito = mod / 1;
            				else
            					sheet.totalespirito = mod;
            					sheet.testeespirito = mod;
            				end;
        end, obj);

    obj._e_event30 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome1 = "Perseverança";
        end, obj);

    obj._e_event31 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome2 = "Perseverança";
        end, obj);

    obj._e_event32 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseperseveranca) or 0)+
            							(tonumber(sheet.inicialperseveranca) or 0)+
            							(tonumber(sheet.bonusperseveranca) or 0)+
            							(tonumber(sheet.xpperseveranca) or 0) +
            							(tonumber(sheet.outroperseveranca) or 0);
            				if 1 > 1 then
            					local pen = 0;
            					if "perseveranca"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalperseveranca = mod .. " | " ..(mod / 1);
            					sheet.testeperseveranca = mod / 1;
            				else
            					sheet.totalperseveranca = mod;
            					sheet.testeperseveranca = mod;
            				end;
        end, obj);

    obj._e_event33 = obj.edit51:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event34 = obj.edit52:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event35 = obj.button19:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            					rolagem = rrpg.interpretarRolagem("1d10 + " .. (sheet.iniciativa or 0));
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (sheet.nome or 0));
        end, obj);

    obj._e_event36 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.iniciativa = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeperspicacia) or 0)) * 2 + (tonumber(sheet.iniciativaBonus) or 0);
            						sheet.velocidade = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeforca) or 0) + 2) * 2 + (tonumber(sheet.velocidadeBonus) or 0);
            						local mod = math.floor(((tonumber(sheet.velocidade) or 0)/3) * 100);
            						mod = mod / 100;
            						sheet.ms = mod .. "m/s";
            						sheet.kmh = ((tonumber(sheet.velocidade) or 0)*1.2) .. "Km/h";
            					end;
        end, obj);

    obj._e_event37 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event38 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event39 = obj.histPop1_1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode1_1== nil then
            					sheet.historicoNode1_1 = {}
            					sheet.historicoNode1_1.id = "1_1"
            				end
            
            				sheet.historicoNode1_1.historicoValor = sheet.historicoValor1_1
            				sheet.historicoNode1_1.historicoBonus = sheet.historicoBonus1_1
            				sheet.historicoNode1_1.historicoXp = sheet.historicoXp1_1
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode1_1);
            					pop:showPopupEx("right", self.histPop1_1);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event40 = obj.dataLink23:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event41 = obj.dataLink24:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event42 = obj.dataLink25:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event43 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event44 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event45 = obj.histPop1_2:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode1_2== nil then
            					sheet.historicoNode1_2 = {}
            					sheet.historicoNode1_2.id = "1_2"
            				end
            
            				sheet.historicoNode1_2.historicoValor = sheet.historicoValor1_2
            				sheet.historicoNode1_2.historicoBonus = sheet.historicoBonus1_2
            				sheet.historicoNode1_2.historicoXp = sheet.historicoXp1_2
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode1_2);
            					pop:showPopupEx("right", self.histPop1_2);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event46 = obj.dataLink26:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event47 = obj.dataLink27:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event48 = obj.dataLink28:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event49 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event50 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event51 = obj.histPop1_3:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode1_3== nil then
            					sheet.historicoNode1_3 = {}
            					sheet.historicoNode1_3.id = "1_3"
            				end
            
            				sheet.historicoNode1_3.historicoValor = sheet.historicoValor1_3
            				sheet.historicoNode1_3.historicoBonus = sheet.historicoBonus1_3
            				sheet.historicoNode1_3.historicoXp = sheet.historicoXp1_3
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode1_3);
            					pop:showPopupEx("right", self.histPop1_3);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event52 = obj.dataLink29:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event53 = obj.dataLink30:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event54 = obj.dataLink31:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event55 = obj.button26:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event56 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event57 = obj.histPop1_4:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode1_4== nil then
            					sheet.historicoNode1_4 = {}
            					sheet.historicoNode1_4.id = "1_4"
            				end
            
            				sheet.historicoNode1_4.historicoValor = sheet.historicoValor1_4
            				sheet.historicoNode1_4.historicoBonus = sheet.historicoBonus1_4
            				sheet.historicoNode1_4.historicoXp = sheet.historicoXp1_4
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode1_4);
            					pop:showPopupEx("right", self.histPop1_4);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event58 = obj.dataLink32:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event59 = obj.dataLink33:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event60 = obj.dataLink34:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event61 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event62 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event63 = obj.histPop1_5:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode1_5== nil then
            					sheet.historicoNode1_5 = {}
            					sheet.historicoNode1_5.id = "1_5"
            				end
            
            				sheet.historicoNode1_5.historicoValor = sheet.historicoValor1_5
            				sheet.historicoNode1_5.historicoBonus = sheet.historicoBonus1_5
            				sheet.historicoNode1_5.historicoXp = sheet.historicoXp1_5
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode1_5);
            					pop:showPopupEx("right", self.histPop1_5);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event64 = obj.dataLink35:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event65 = obj.dataLink36:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event66 = obj.dataLink37:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event67 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event68 = obj.button31:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event69 = obj.histPop1_6:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode1_6== nil then
            					sheet.historicoNode1_6 = {}
            					sheet.historicoNode1_6.id = "1_6"
            				end
            
            				sheet.historicoNode1_6.historicoValor = sheet.historicoValor1_6
            				sheet.historicoNode1_6.historicoBonus = sheet.historicoBonus1_6
            				sheet.historicoNode1_6.historicoXp = sheet.historicoXp1_6
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode1_6);
            					pop:showPopupEx("right", self.histPop1_6);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event70 = obj.dataLink38:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event71 = obj.dataLink39:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event72 = obj.dataLink40:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event73 = obj.button32:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event74 = obj.button33:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event75 = obj.histPop2_1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode2_1== nil then
            					sheet.historicoNode2_1 = {}
            					sheet.historicoNode2_1.id = "2_1"
            				end
            
            				sheet.historicoNode2_1.historicoValor = sheet.historicoValor2_1
            				sheet.historicoNode2_1.historicoBonus = sheet.historicoBonus2_1
            				sheet.historicoNode2_1.historicoXp = sheet.historicoXp2_1
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode2_1);
            					pop:showPopupEx("right", self.histPop2_1);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event76 = obj.dataLink41:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event77 = obj.dataLink42:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event78 = obj.dataLink43:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event79 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event80 = obj.button35:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event81 = obj.histPop2_2:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode2_2== nil then
            					sheet.historicoNode2_2 = {}
            					sheet.historicoNode2_2.id = "2_2"
            				end
            
            				sheet.historicoNode2_2.historicoValor = sheet.historicoValor2_2
            				sheet.historicoNode2_2.historicoBonus = sheet.historicoBonus2_2
            				sheet.historicoNode2_2.historicoXp = sheet.historicoXp2_2
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode2_2);
            					pop:showPopupEx("right", self.histPop2_2);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event82 = obj.dataLink44:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event83 = obj.dataLink45:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event84 = obj.dataLink46:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event85 = obj.button36:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event86 = obj.button37:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event87 = obj.histPop2_3:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode2_3== nil then
            					sheet.historicoNode2_3 = {}
            					sheet.historicoNode2_3.id = "2_3"
            				end
            
            				sheet.historicoNode2_3.historicoValor = sheet.historicoValor2_3
            				sheet.historicoNode2_3.historicoBonus = sheet.historicoBonus2_3
            				sheet.historicoNode2_3.historicoXp = sheet.historicoXp2_3
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode2_3);
            					pop:showPopupEx("right", self.histPop2_3);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event88 = obj.dataLink47:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event89 = obj.dataLink48:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event90 = obj.dataLink49:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event91 = obj.button38:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event92 = obj.button39:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event93 = obj.histPop2_4:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode2_4== nil then
            					sheet.historicoNode2_4 = {}
            					sheet.historicoNode2_4.id = "2_4"
            				end
            
            				sheet.historicoNode2_4.historicoValor = sheet.historicoValor2_4
            				sheet.historicoNode2_4.historicoBonus = sheet.historicoBonus2_4
            				sheet.historicoNode2_4.historicoXp = sheet.historicoXp2_4
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode2_4);
            					pop:showPopupEx("right", self.histPop2_4);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event94 = obj.dataLink50:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event95 = obj.dataLink51:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event96 = obj.dataLink52:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event97 = obj.button40:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event98 = obj.button41:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event99 = obj.histPop2_5:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode2_5== nil then
            					sheet.historicoNode2_5 = {}
            					sheet.historicoNode2_5.id = "2_5"
            				end
            
            				sheet.historicoNode2_5.historicoValor = sheet.historicoValor2_5
            				sheet.historicoNode2_5.historicoBonus = sheet.historicoBonus2_5
            				sheet.historicoNode2_5.historicoXp = sheet.historicoXp2_5
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode2_5);
            					pop:showPopupEx("right", self.histPop2_5);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event100 = obj.dataLink53:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event101 = obj.dataLink54:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event102 = obj.dataLink55:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event103 = obj.button42:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event104 = obj.button43:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event105 = obj.histPop2_6:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode2_6== nil then
            					sheet.historicoNode2_6 = {}
            					sheet.historicoNode2_6.id = "2_6"
            				end
            
            				sheet.historicoNode2_6.historicoValor = sheet.historicoValor2_6
            				sheet.historicoNode2_6.historicoBonus = sheet.historicoBonus2_6
            				sheet.historicoNode2_6.historicoXp = sheet.historicoXp2_6
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode2_6);
            					pop:showPopupEx("right", self.histPop2_6);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event106 = obj.dataLink56:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event107 = obj.dataLink57:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event108 = obj.dataLink58:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event109 = obj.button44:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event110 = obj.button45:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event111 = obj.histPop3_1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode3_1== nil then
            					sheet.historicoNode3_1 = {}
            					sheet.historicoNode3_1.id = "3_1"
            				end
            
            				sheet.historicoNode3_1.historicoValor = sheet.historicoValor3_1
            				sheet.historicoNode3_1.historicoBonus = sheet.historicoBonus3_1
            				sheet.historicoNode3_1.historicoXp = sheet.historicoXp3_1
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode3_1);
            					pop:showPopupEx("right", self.histPop3_1);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event112 = obj.dataLink59:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event113 = obj.dataLink60:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event114 = obj.dataLink61:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event115 = obj.button46:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event116 = obj.button47:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event117 = obj.histPop3_2:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode3_2== nil then
            					sheet.historicoNode3_2 = {}
            					sheet.historicoNode3_2.id = "3_2"
            				end
            
            				sheet.historicoNode3_2.historicoValor = sheet.historicoValor3_2
            				sheet.historicoNode3_2.historicoBonus = sheet.historicoBonus3_2
            				sheet.historicoNode3_2.historicoXp = sheet.historicoXp3_2
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode3_2);
            					pop:showPopupEx("right", self.histPop3_2);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event118 = obj.dataLink62:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event119 = obj.dataLink63:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event120 = obj.dataLink64:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event121 = obj.button48:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event122 = obj.button49:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event123 = obj.histPop3_3:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode3_3== nil then
            					sheet.historicoNode3_3 = {}
            					sheet.historicoNode3_3.id = "3_3"
            				end
            
            				sheet.historicoNode3_3.historicoValor = sheet.historicoValor3_3
            				sheet.historicoNode3_3.historicoBonus = sheet.historicoBonus3_3
            				sheet.historicoNode3_3.historicoXp = sheet.historicoXp3_3
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode3_3);
            					pop:showPopupEx("right", self.histPop3_3);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event124 = obj.dataLink65:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event125 = obj.dataLink66:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event126 = obj.dataLink67:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event127 = obj.button50:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event128 = obj.button51:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event129 = obj.histPop3_4:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode3_4== nil then
            					sheet.historicoNode3_4 = {}
            					sheet.historicoNode3_4.id = "3_4"
            				end
            
            				sheet.historicoNode3_4.historicoValor = sheet.historicoValor3_4
            				sheet.historicoNode3_4.historicoBonus = sheet.historicoBonus3_4
            				sheet.historicoNode3_4.historicoXp = sheet.historicoXp3_4
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode3_4);
            					pop:showPopupEx("right", self.histPop3_4);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event130 = obj.dataLink68:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event131 = obj.dataLink69:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event132 = obj.dataLink70:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event133 = obj.button52:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event134 = obj.button53:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event135 = obj.histPop3_5:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode3_5== nil then
            					sheet.historicoNode3_5 = {}
            					sheet.historicoNode3_5.id = "3_5"
            				end
            
            				sheet.historicoNode3_5.historicoValor = sheet.historicoValor3_5
            				sheet.historicoNode3_5.historicoBonus = sheet.historicoBonus3_5
            				sheet.historicoNode3_5.historicoXp = sheet.historicoXp3_5
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode3_5);
            					pop:showPopupEx("right", self.histPop3_5);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event136 = obj.dataLink71:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event137 = obj.dataLink72:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event138 = obj.dataLink73:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event139 = obj.button54:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event140 = obj.button55:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event141 = obj.histPop3_6:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popHistorico");
            
            				if sheet.historicoNode3_6== nil then
            					sheet.historicoNode3_6 = {}
            					sheet.historicoNode3_6.id = "3_6"
            				end
            
            				sheet.historicoNode3_6.historicoValor = sheet.historicoValor3_6
            				sheet.historicoNode3_6.historicoBonus = sheet.historicoBonus3_6
            				sheet.historicoNode3_6.historicoXp = sheet.historicoXp3_6
            					
            				if pop ~= nil then
            					pop:setNodeObject(sheet.historicoNode3_6);
            					pop:showPopupEx("right", self.histPop3_6);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event142 = obj.dataLink74:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event143 = obj.dataLink75:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event144 = obj.dataLink76:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event145 = obj.button56:addEventListener("onClick",
        function (_)
            local rcl = self.rclListaOutros:append();
            					if rcl~=nil then 
            						rcl.multXp = sheet.auditxpcost_out;
            						rcl.multApr = sheet.auditbonuscost_out;
            					end;
        end, obj);

    obj._e_event146 = obj.rclListaOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event147 = obj.dataLink83:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absRes = math.floor(tonumber(sheet.testeresiliencia) or 0);
            					end;
        end, obj);

    obj._e_event148 = obj.dataLink84:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absorcao = (tonumber(sheet.absRes) or 0) + (tonumber(sheet.absOutros) or 0) + (tonumber(sheet.indiceArmadura) or 0);
            					end;
        end, obj);

    obj._e_event149 = obj.button57:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            					sheet.field2 = nil;
            					sheet.num2 = nil;
            					sheet.rollnome2 = nil;
        end, obj);

    obj._e_event150 = obj.button58:addEventListener("onClick",
        function (_)
            rolar();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.histPop3_6 ~= nil then self.histPop3_6:destroy(); self.histPop3_6 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.histPop3_5 ~= nil then self.histPop3_5:destroy(); self.histPop3_5 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.btMentais ~= nil then self.btMentais:destroy(); self.btMentais = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.popAegis ~= nil then self.popAegis:destroy(); self.popAegis = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.histPop3_3 ~= nil then self.histPop3_3:destroy(); self.histPop3_3 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.histPop3_4 ~= nil then self.histPop3_4:destroy(); self.histPop3_4 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.histPop2_2 ~= nil then self.histPop2_2:destroy(); self.histPop2_2 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rclListaOutros ~= nil then self.rclListaOutros:destroy(); self.rclListaOutros = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.histPop1_1 ~= nil then self.histPop1_1:destroy(); self.histPop1_1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.histPop2_4 ~= nil then self.histPop2_4:destroy(); self.histPop2_4 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.btFisicos ~= nil then self.btFisicos:destroy(); self.btFisicos = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.histPop1_5 ~= nil then self.histPop1_5:destroy(); self.histPop1_5 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.histPop3_1 ~= nil then self.histPop3_1:destroy(); self.histPop3_1 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.histPop3_2 ~= nil then self.histPop3_2:destroy(); self.histPop3_2 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.histPop1_6 ~= nil then self.histPop1_6:destroy(); self.histPop1_6 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.histPop2_1 ~= nil then self.histPop2_1:destroy(); self.histPop2_1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.popMentais ~= nil then self.popMentais:destroy(); self.popMentais = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.histPop1_4 ~= nil then self.histPop1_4:destroy(); self.histPop1_4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.popHistorico ~= nil then self.popHistorico:destroy(); self.popHistorico = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.histPop2_5 ~= nil then self.histPop2_5:destroy(); self.histPop2_5 = nil; end;
        if self.btAegis ~= nil then self.btAegis:destroy(); self.btAegis = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.popFisicos ~= nil then self.popFisicos:destroy(); self.popFisicos = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.popOther ~= nil then self.popOther:destroy(); self.popOther = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.histPop2_6 ~= nil then self.histPop2_6:destroy(); self.histPop2_6 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.histPop1_3 ~= nil then self.histPop1_3:destroy(); self.histPop1_3 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.histPop2_3 ~= nil then self.histPop2_3:destroy(); self.histPop2_3 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.histPop1_2 ~= nil then self.histPop1_2:destroy(); self.histPop1_2 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmACN1()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmACN1();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmACN1 = {
    newEditor = newfrmACN1, 
    new = newfrmACN1, 
    name = "frmACN1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmACN1 = _frmACN1;
Firecast.registrarForm(_frmACN1);

return _frmACN1;
