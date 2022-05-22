require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaACN()
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
    obj:setName("frmFichaACN");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.FichaACN");
    obj:setTitle("Ficha ACN");
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
        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmACN1 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN1:setParent(obj.tab1);
    obj.frmACN1:setName("frmACN1");
    obj.frmACN1:setAlign("client");
    obj.frmACN1:setTheme("dark");


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
    obj.popOther:setParent(obj.frmACN1);
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
    obj.popHistorico:setParent(obj.frmACN1);
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
    obj.popFisicos:setParent(obj.frmACN1);
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
    obj.popMentais:setParent(obj.frmACN1);
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
    obj.popAegis:setParent(obj.frmACN1);
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
    obj.scrollBox1:setParent(obj.frmACN1);
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
	


    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Aptidões");
    obj.tab2:setName("tab2");

    obj.frmACN2 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN2:setParent(obj.tab2);
    obj.frmACN2:setName("frmACN2");
    obj.frmACN2:setAlign("client");
    obj.frmACN2:setTheme("dark");
    obj.frmACN2:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmACN2);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox4);
    obj.layout49:setLeft(0);
    obj.layout49:setTop(0);
    obj.layout49:setWidth(280);
    obj.layout49:setHeight(630);
    obj.layout49:setName("layout49");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout49);
    obj.rectangle53:setLeft(0);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(280);
    obj.rectangle53:setHeight(630);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(15);
    obj.rectangle53:setYradius(15);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout49);
    obj.label159:setLeft(5);
    obj.label159:setTop(0);
    obj.label159:setWidth(240);
    obj.label159:setHeight(20);
    obj.label159:setText("TALENTOS FISICOS");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout49);
    obj.label160:setLeft(25);
    obj.label160:setTop(25);
    obj.label160:setWidth(315);
    obj.label160:setHeight(20);
    obj.label160:setText(" Nome");
    obj.label160:setName("label160");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout49);
    obj.label161:setLeft(135);
    obj.label161:setTop(25);
    obj.label161:setWidth(315);
    obj.label161:setHeight(20);
    obj.label161:setText("Total");
    obj.label161:setName("label161");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout49);
    obj.label162:setLeft(170);
    obj.label162:setTop(25);
    obj.label162:setWidth(315);
    obj.label162:setHeight(20);
    obj.label162:setText(" Inic");
    obj.label162:setName("label162");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout49);
    obj.label163:setLeft(202);
    obj.label163:setTop(25);
    obj.label163:setWidth(315);
    obj.label163:setHeight(20);
    obj.label163:setText(" Apr.");
    obj.label163:setName("label163");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout49);
    obj.label164:setLeft(235);
    obj.label164:setTop(25);
    obj.label164:setWidth(315);
    obj.label164:setHeight(20);
    obj.label164:setText("  XP");
    obj.label164:setName("label164");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(50);
    obj.layout50:setWidth(270);
    obj.layout50:setHeight(50);
    obj.layout50:setName("layout50");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout50);
    obj.button59:setLeft(0);
    obj.button59:setTop(0);
    obj.button59:setHeight(15);
    obj.button59:setWidth(15);
    obj.button59:setText("1");
    obj.button59:setFontSize(9);
    obj.button59:setName("button59");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout50);
    obj.button60:setLeft(0);
    obj.button60:setTop(15);
    obj.button60:setHeight(15);
    obj.button60:setWidth(15);
    obj.button60:setText("2");
    obj.button60:setFontSize(9);
    obj.button60:setName("button60");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout50);
    obj.edit136:setLeft(20);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(100);
    obj.edit136:setHeight(25);
    obj.edit136:setField("nome0_1");
    obj.edit136:setName("edit136");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout50);
    obj.rectangle54:setLeft(125);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(40);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("Black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout50);
    obj.label165:setLeft(125);
    obj.label165:setTop(3);
    obj.label165:setWidth(40);
    obj.label165:setHeight(20);
    obj.label165:setField("total20_1");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout50);
    obj.edit137:setLeft(170);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(30);
    obj.edit137:setHeight(25);
    obj.edit137:setType("number");
    obj.edit137:setMin(0);
    obj.edit137:setField("base0_1");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout50);
    obj.edit138:setLeft(205);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(30);
    obj.edit138:setHeight(25);
    obj.edit138:setType("number");
    obj.edit138:setMin(0);
    obj.edit138:setField("bonus0_1");
    obj.edit138:setName("edit138");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout50);
    obj.edit139:setLeft(240);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(30);
    obj.edit139:setHeight(25);
    obj.edit139:setType("number");
    obj.edit139:setMin(0);
    obj.edit139:setField("xp0_1");
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout50);
    obj.edit140:setLeft(20);
    obj.edit140:setTop(28);
    obj.edit140:setWidth(250);
    obj.edit140:setHeight(20);
    obj.edit140:setField("espec0_1");
    obj.edit140:setName("edit140");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setLeft(5);
    obj.layout51:setTop(100);
    obj.layout51:setWidth(270);
    obj.layout51:setHeight(50);
    obj.layout51:setName("layout51");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout51);
    obj.button61:setLeft(0);
    obj.button61:setTop(0);
    obj.button61:setHeight(15);
    obj.button61:setWidth(15);
    obj.button61:setText("1");
    obj.button61:setFontSize(9);
    obj.button61:setName("button61");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout51);
    obj.button62:setLeft(0);
    obj.button62:setTop(15);
    obj.button62:setHeight(15);
    obj.button62:setWidth(15);
    obj.button62:setText("2");
    obj.button62:setFontSize(9);
    obj.button62:setName("button62");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout51);
    obj.edit141:setLeft(20);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(100);
    obj.edit141:setHeight(25);
    obj.edit141:setField("nome0_2");
    obj.edit141:setName("edit141");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout51);
    obj.rectangle55:setLeft(125);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(40);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("Black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout51);
    obj.label166:setLeft(125);
    obj.label166:setTop(3);
    obj.label166:setWidth(40);
    obj.label166:setHeight(20);
    obj.label166:setField("total20_2");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout51);
    obj.edit142:setLeft(170);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(30);
    obj.edit142:setHeight(25);
    obj.edit142:setType("number");
    obj.edit142:setMin(0);
    obj.edit142:setField("base0_2");
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout51);
    obj.edit143:setLeft(205);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(30);
    obj.edit143:setHeight(25);
    obj.edit143:setType("number");
    obj.edit143:setMin(0);
    obj.edit143:setField("bonus0_2");
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout51);
    obj.edit144:setLeft(240);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(30);
    obj.edit144:setHeight(25);
    obj.edit144:setType("number");
    obj.edit144:setMin(0);
    obj.edit144:setField("xp0_2");
    obj.edit144:setName("edit144");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout51);
    obj.edit145:setLeft(20);
    obj.edit145:setTop(28);
    obj.edit145:setWidth(250);
    obj.edit145:setHeight(20);
    obj.edit145:setField("espec0_2");
    obj.edit145:setName("edit145");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setLeft(5);
    obj.layout52:setTop(150);
    obj.layout52:setWidth(270);
    obj.layout52:setHeight(50);
    obj.layout52:setName("layout52");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout52);
    obj.button63:setLeft(0);
    obj.button63:setTop(0);
    obj.button63:setHeight(15);
    obj.button63:setWidth(15);
    obj.button63:setText("1");
    obj.button63:setFontSize(9);
    obj.button63:setName("button63");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout52);
    obj.button64:setLeft(0);
    obj.button64:setTop(15);
    obj.button64:setHeight(15);
    obj.button64:setWidth(15);
    obj.button64:setText("2");
    obj.button64:setFontSize(9);
    obj.button64:setName("button64");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout52);
    obj.edit146:setLeft(20);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(100);
    obj.edit146:setHeight(25);
    obj.edit146:setField("nome0_3");
    obj.edit146:setName("edit146");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout52);
    obj.rectangle56:setLeft(125);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(40);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("Black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout52);
    obj.label167:setLeft(125);
    obj.label167:setTop(3);
    obj.label167:setWidth(40);
    obj.label167:setHeight(20);
    obj.label167:setField("total20_3");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout52);
    obj.edit147:setLeft(170);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(30);
    obj.edit147:setHeight(25);
    obj.edit147:setType("number");
    obj.edit147:setMin(0);
    obj.edit147:setField("base0_3");
    obj.edit147:setName("edit147");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout52);
    obj.edit148:setLeft(205);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(30);
    obj.edit148:setHeight(25);
    obj.edit148:setType("number");
    obj.edit148:setMin(0);
    obj.edit148:setField("bonus0_3");
    obj.edit148:setName("edit148");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout52);
    obj.edit149:setLeft(240);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(30);
    obj.edit149:setHeight(25);
    obj.edit149:setType("number");
    obj.edit149:setMin(0);
    obj.edit149:setField("xp0_3");
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout52);
    obj.edit150:setLeft(20);
    obj.edit150:setTop(28);
    obj.edit150:setWidth(250);
    obj.edit150:setHeight(20);
    obj.edit150:setField("espec0_3");
    obj.edit150:setName("edit150");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout49);
    obj.layout53:setLeft(5);
    obj.layout53:setTop(200);
    obj.layout53:setWidth(270);
    obj.layout53:setHeight(50);
    obj.layout53:setName("layout53");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout53);
    obj.button65:setLeft(0);
    obj.button65:setTop(0);
    obj.button65:setHeight(15);
    obj.button65:setWidth(15);
    obj.button65:setText("1");
    obj.button65:setFontSize(9);
    obj.button65:setName("button65");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout53);
    obj.button66:setLeft(0);
    obj.button66:setTop(15);
    obj.button66:setHeight(15);
    obj.button66:setWidth(15);
    obj.button66:setText("2");
    obj.button66:setFontSize(9);
    obj.button66:setName("button66");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout53);
    obj.edit151:setLeft(20);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(100);
    obj.edit151:setHeight(25);
    obj.edit151:setField("nome0_4");
    obj.edit151:setName("edit151");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout53);
    obj.rectangle57:setLeft(125);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(40);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("Black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout53);
    obj.label168:setLeft(125);
    obj.label168:setTop(3);
    obj.label168:setWidth(40);
    obj.label168:setHeight(20);
    obj.label168:setField("total20_4");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout53);
    obj.edit152:setLeft(170);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(30);
    obj.edit152:setHeight(25);
    obj.edit152:setType("number");
    obj.edit152:setMin(0);
    obj.edit152:setField("base0_4");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout53);
    obj.edit153:setLeft(205);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(30);
    obj.edit153:setHeight(25);
    obj.edit153:setType("number");
    obj.edit153:setMin(0);
    obj.edit153:setField("bonus0_4");
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout53);
    obj.edit154:setLeft(240);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(30);
    obj.edit154:setHeight(25);
    obj.edit154:setType("number");
    obj.edit154:setMin(0);
    obj.edit154:setField("xp0_4");
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout53);
    obj.edit155:setLeft(20);
    obj.edit155:setTop(28);
    obj.edit155:setWidth(250);
    obj.edit155:setHeight(20);
    obj.edit155:setField("espec0_4");
    obj.edit155:setName("edit155");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout49);
    obj.layout54:setLeft(5);
    obj.layout54:setTop(250);
    obj.layout54:setWidth(270);
    obj.layout54:setHeight(50);
    obj.layout54:setName("layout54");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout54);
    obj.button67:setLeft(0);
    obj.button67:setTop(0);
    obj.button67:setHeight(15);
    obj.button67:setWidth(15);
    obj.button67:setText("1");
    obj.button67:setFontSize(9);
    obj.button67:setName("button67");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout54);
    obj.button68:setLeft(0);
    obj.button68:setTop(15);
    obj.button68:setHeight(15);
    obj.button68:setWidth(15);
    obj.button68:setText("2");
    obj.button68:setFontSize(9);
    obj.button68:setName("button68");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout54);
    obj.edit156:setLeft(20);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(100);
    obj.edit156:setHeight(25);
    obj.edit156:setField("nome0_5");
    obj.edit156:setName("edit156");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout54);
    obj.rectangle58:setLeft(125);
    obj.rectangle58:setTop(0);
    obj.rectangle58:setWidth(40);
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("Black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout54);
    obj.label169:setLeft(125);
    obj.label169:setTop(3);
    obj.label169:setWidth(40);
    obj.label169:setHeight(20);
    obj.label169:setField("total20_5");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout54);
    obj.edit157:setLeft(170);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(30);
    obj.edit157:setHeight(25);
    obj.edit157:setType("number");
    obj.edit157:setMin(0);
    obj.edit157:setField("base0_5");
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout54);
    obj.edit158:setLeft(205);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(30);
    obj.edit158:setHeight(25);
    obj.edit158:setType("number");
    obj.edit158:setMin(0);
    obj.edit158:setField("bonus0_5");
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout54);
    obj.edit159:setLeft(240);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(30);
    obj.edit159:setHeight(25);
    obj.edit159:setType("number");
    obj.edit159:setMin(0);
    obj.edit159:setField("xp0_5");
    obj.edit159:setName("edit159");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout54);
    obj.edit160:setLeft(20);
    obj.edit160:setTop(28);
    obj.edit160:setWidth(250);
    obj.edit160:setHeight(20);
    obj.edit160:setField("espec0_5");
    obj.edit160:setName("edit160");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout49);
    obj.layout55:setLeft(5);
    obj.layout55:setTop(300);
    obj.layout55:setWidth(270);
    obj.layout55:setHeight(50);
    obj.layout55:setName("layout55");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout55);
    obj.button69:setLeft(0);
    obj.button69:setTop(0);
    obj.button69:setHeight(15);
    obj.button69:setWidth(15);
    obj.button69:setText("1");
    obj.button69:setFontSize(9);
    obj.button69:setName("button69");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout55);
    obj.button70:setLeft(0);
    obj.button70:setTop(15);
    obj.button70:setHeight(15);
    obj.button70:setWidth(15);
    obj.button70:setText("2");
    obj.button70:setFontSize(9);
    obj.button70:setName("button70");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout55);
    obj.edit161:setLeft(20);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(100);
    obj.edit161:setHeight(25);
    obj.edit161:setField("nome0_6");
    obj.edit161:setName("edit161");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout55);
    obj.rectangle59:setLeft(125);
    obj.rectangle59:setTop(0);
    obj.rectangle59:setWidth(40);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("Black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout55);
    obj.label170:setLeft(125);
    obj.label170:setTop(3);
    obj.label170:setWidth(40);
    obj.label170:setHeight(20);
    obj.label170:setField("total20_6");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout55);
    obj.edit162:setLeft(170);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(30);
    obj.edit162:setHeight(25);
    obj.edit162:setType("number");
    obj.edit162:setMin(0);
    obj.edit162:setField("base0_6");
    obj.edit162:setName("edit162");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout55);
    obj.edit163:setLeft(205);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(30);
    obj.edit163:setHeight(25);
    obj.edit163:setType("number");
    obj.edit163:setMin(0);
    obj.edit163:setField("bonus0_6");
    obj.edit163:setName("edit163");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout55);
    obj.edit164:setLeft(240);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(30);
    obj.edit164:setHeight(25);
    obj.edit164:setType("number");
    obj.edit164:setMin(0);
    obj.edit164:setField("xp0_6");
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout55);
    obj.edit165:setLeft(20);
    obj.edit165:setTop(28);
    obj.edit165:setWidth(250);
    obj.edit165:setHeight(20);
    obj.edit165:setField("espec0_6");
    obj.edit165:setName("edit165");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout49);
    obj.layout56:setLeft(5);
    obj.layout56:setTop(350);
    obj.layout56:setWidth(270);
    obj.layout56:setHeight(50);
    obj.layout56:setName("layout56");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout56);
    obj.button71:setLeft(0);
    obj.button71:setTop(0);
    obj.button71:setHeight(15);
    obj.button71:setWidth(15);
    obj.button71:setText("1");
    obj.button71:setFontSize(9);
    obj.button71:setName("button71");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout56);
    obj.button72:setLeft(0);
    obj.button72:setTop(15);
    obj.button72:setHeight(15);
    obj.button72:setWidth(15);
    obj.button72:setText("2");
    obj.button72:setFontSize(9);
    obj.button72:setName("button72");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout56);
    obj.edit166:setLeft(20);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(100);
    obj.edit166:setHeight(25);
    obj.edit166:setField("nome0_7");
    obj.edit166:setName("edit166");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout56);
    obj.rectangle60:setLeft(125);
    obj.rectangle60:setTop(0);
    obj.rectangle60:setWidth(40);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("Black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout56);
    obj.label171:setLeft(125);
    obj.label171:setTop(3);
    obj.label171:setWidth(40);
    obj.label171:setHeight(20);
    obj.label171:setField("total20_7");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout56);
    obj.edit167:setLeft(170);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(30);
    obj.edit167:setHeight(25);
    obj.edit167:setType("number");
    obj.edit167:setMin(0);
    obj.edit167:setField("base0_7");
    obj.edit167:setName("edit167");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout56);
    obj.edit168:setLeft(205);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(30);
    obj.edit168:setHeight(25);
    obj.edit168:setType("number");
    obj.edit168:setMin(0);
    obj.edit168:setField("bonus0_7");
    obj.edit168:setName("edit168");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout56);
    obj.edit169:setLeft(240);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(30);
    obj.edit169:setHeight(25);
    obj.edit169:setType("number");
    obj.edit169:setMin(0);
    obj.edit169:setField("xp0_7");
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout56);
    obj.edit170:setLeft(20);
    obj.edit170:setTop(28);
    obj.edit170:setWidth(250);
    obj.edit170:setHeight(20);
    obj.edit170:setField("espec0_7");
    obj.edit170:setName("edit170");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout49);
    obj.layout57:setLeft(5);
    obj.layout57:setTop(400);
    obj.layout57:setWidth(270);
    obj.layout57:setHeight(50);
    obj.layout57:setName("layout57");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout57);
    obj.button73:setLeft(0);
    obj.button73:setTop(0);
    obj.button73:setHeight(15);
    obj.button73:setWidth(15);
    obj.button73:setText("1");
    obj.button73:setFontSize(9);
    obj.button73:setName("button73");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout57);
    obj.button74:setLeft(0);
    obj.button74:setTop(15);
    obj.button74:setHeight(15);
    obj.button74:setWidth(15);
    obj.button74:setText("2");
    obj.button74:setFontSize(9);
    obj.button74:setName("button74");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout57);
    obj.edit171:setLeft(20);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(100);
    obj.edit171:setHeight(25);
    obj.edit171:setField("nome0_8");
    obj.edit171:setName("edit171");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout57);
    obj.rectangle61:setLeft(125);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(40);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("Black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout57);
    obj.label172:setLeft(125);
    obj.label172:setTop(3);
    obj.label172:setWidth(40);
    obj.label172:setHeight(20);
    obj.label172:setField("total20_8");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout57);
    obj.edit172:setLeft(170);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(30);
    obj.edit172:setHeight(25);
    obj.edit172:setType("number");
    obj.edit172:setMin(0);
    obj.edit172:setField("base0_8");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout57);
    obj.edit173:setLeft(205);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(30);
    obj.edit173:setHeight(25);
    obj.edit173:setType("number");
    obj.edit173:setMin(0);
    obj.edit173:setField("bonus0_8");
    obj.edit173:setName("edit173");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout57);
    obj.edit174:setLeft(240);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(30);
    obj.edit174:setHeight(25);
    obj.edit174:setType("number");
    obj.edit174:setMin(0);
    obj.edit174:setField("xp0_8");
    obj.edit174:setName("edit174");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout57);
    obj.edit175:setLeft(20);
    obj.edit175:setTop(28);
    obj.edit175:setWidth(250);
    obj.edit175:setHeight(20);
    obj.edit175:setField("espec0_8");
    obj.edit175:setName("edit175");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout49);
    obj.layout58:setLeft(5);
    obj.layout58:setTop(450);
    obj.layout58:setWidth(270);
    obj.layout58:setHeight(50);
    obj.layout58:setName("layout58");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout58);
    obj.button75:setLeft(0);
    obj.button75:setTop(0);
    obj.button75:setHeight(15);
    obj.button75:setWidth(15);
    obj.button75:setText("1");
    obj.button75:setFontSize(9);
    obj.button75:setName("button75");

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout58);
    obj.button76:setLeft(0);
    obj.button76:setTop(15);
    obj.button76:setHeight(15);
    obj.button76:setWidth(15);
    obj.button76:setText("2");
    obj.button76:setFontSize(9);
    obj.button76:setName("button76");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout58);
    obj.edit176:setLeft(20);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(100);
    obj.edit176:setHeight(25);
    obj.edit176:setField("nome0_9");
    obj.edit176:setName("edit176");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout58);
    obj.rectangle62:setLeft(125);
    obj.rectangle62:setTop(0);
    obj.rectangle62:setWidth(40);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("Black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout58);
    obj.label173:setLeft(125);
    obj.label173:setTop(3);
    obj.label173:setWidth(40);
    obj.label173:setHeight(20);
    obj.label173:setField("total20_9");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout58);
    obj.edit177:setLeft(170);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(30);
    obj.edit177:setHeight(25);
    obj.edit177:setType("number");
    obj.edit177:setMin(0);
    obj.edit177:setField("base0_9");
    obj.edit177:setName("edit177");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout58);
    obj.edit178:setLeft(205);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(30);
    obj.edit178:setHeight(25);
    obj.edit178:setType("number");
    obj.edit178:setMin(0);
    obj.edit178:setField("bonus0_9");
    obj.edit178:setName("edit178");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout58);
    obj.edit179:setLeft(240);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(30);
    obj.edit179:setHeight(25);
    obj.edit179:setType("number");
    obj.edit179:setMin(0);
    obj.edit179:setField("xp0_9");
    obj.edit179:setName("edit179");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout58);
    obj.edit180:setLeft(20);
    obj.edit180:setTop(28);
    obj.edit180:setWidth(250);
    obj.edit180:setHeight(20);
    obj.edit180:setField("espec0_9");
    obj.edit180:setName("edit180");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout49);
    obj.layout59:setLeft(5);
    obj.layout59:setTop(500);
    obj.layout59:setWidth(270);
    obj.layout59:setHeight(50);
    obj.layout59:setName("layout59");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout59);
    obj.button77:setLeft(0);
    obj.button77:setTop(0);
    obj.button77:setHeight(15);
    obj.button77:setWidth(15);
    obj.button77:setText("1");
    obj.button77:setFontSize(9);
    obj.button77:setName("button77");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout59);
    obj.button78:setLeft(0);
    obj.button78:setTop(15);
    obj.button78:setHeight(15);
    obj.button78:setWidth(15);
    obj.button78:setText("2");
    obj.button78:setFontSize(9);
    obj.button78:setName("button78");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout59);
    obj.edit181:setLeft(20);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(100);
    obj.edit181:setHeight(25);
    obj.edit181:setField("nome0_10");
    obj.edit181:setName("edit181");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout59);
    obj.rectangle63:setLeft(125);
    obj.rectangle63:setTop(0);
    obj.rectangle63:setWidth(40);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("Black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout59);
    obj.label174:setLeft(125);
    obj.label174:setTop(3);
    obj.label174:setWidth(40);
    obj.label174:setHeight(20);
    obj.label174:setField("total20_10");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout59);
    obj.edit182:setLeft(170);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(30);
    obj.edit182:setHeight(25);
    obj.edit182:setType("number");
    obj.edit182:setMin(0);
    obj.edit182:setField("base0_10");
    obj.edit182:setName("edit182");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout59);
    obj.edit183:setLeft(205);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(30);
    obj.edit183:setHeight(25);
    obj.edit183:setType("number");
    obj.edit183:setMin(0);
    obj.edit183:setField("bonus0_10");
    obj.edit183:setName("edit183");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout59);
    obj.edit184:setLeft(240);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(30);
    obj.edit184:setHeight(25);
    obj.edit184:setType("number");
    obj.edit184:setMin(0);
    obj.edit184:setField("xp0_10");
    obj.edit184:setName("edit184");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout59);
    obj.edit185:setLeft(20);
    obj.edit185:setTop(28);
    obj.edit185:setWidth(250);
    obj.edit185:setHeight(20);
    obj.edit185:setField("espec0_10");
    obj.edit185:setName("edit185");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout49);
    obj.layout60:setLeft(5);
    obj.layout60:setTop(550);
    obj.layout60:setWidth(270);
    obj.layout60:setHeight(50);
    obj.layout60:setName("layout60");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout60);
    obj.button79:setLeft(0);
    obj.button79:setTop(0);
    obj.button79:setHeight(15);
    obj.button79:setWidth(15);
    obj.button79:setText("1");
    obj.button79:setFontSize(9);
    obj.button79:setName("button79");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout60);
    obj.button80:setLeft(0);
    obj.button80:setTop(15);
    obj.button80:setHeight(15);
    obj.button80:setWidth(15);
    obj.button80:setText("2");
    obj.button80:setFontSize(9);
    obj.button80:setName("button80");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout60);
    obj.edit186:setLeft(20);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(100);
    obj.edit186:setHeight(25);
    obj.edit186:setField("nome0_11");
    obj.edit186:setName("edit186");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout60);
    obj.rectangle64:setLeft(125);
    obj.rectangle64:setTop(0);
    obj.rectangle64:setWidth(40);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("Black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout60);
    obj.label175:setLeft(125);
    obj.label175:setTop(3);
    obj.label175:setWidth(40);
    obj.label175:setHeight(20);
    obj.label175:setField("total20_11");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout60);
    obj.edit187:setLeft(170);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(30);
    obj.edit187:setHeight(25);
    obj.edit187:setType("number");
    obj.edit187:setMin(0);
    obj.edit187:setField("base0_11");
    obj.edit187:setName("edit187");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout60);
    obj.edit188:setLeft(205);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(30);
    obj.edit188:setHeight(25);
    obj.edit188:setType("number");
    obj.edit188:setMin(0);
    obj.edit188:setField("bonus0_11");
    obj.edit188:setName("edit188");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout60);
    obj.edit189:setLeft(240);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(30);
    obj.edit189:setHeight(25);
    obj.edit189:setType("number");
    obj.edit189:setMin(0);
    obj.edit189:setField("xp0_11");
    obj.edit189:setName("edit189");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout60);
    obj.edit190:setLeft(20);
    obj.edit190:setTop(28);
    obj.edit190:setWidth(250);
    obj.edit190:setHeight(20);
    obj.edit190:setField("espec0_11");
    obj.edit190:setName("edit190");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout49);
    obj.layout61:setLeft(5);
    obj.layout61:setTop(600);
    obj.layout61:setWidth(270);
    obj.layout61:setHeight(50);
    obj.layout61:setName("layout61");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.layout61);
    obj.button81:setLeft(0);
    obj.button81:setTop(0);
    obj.button81:setHeight(15);
    obj.button81:setWidth(15);
    obj.button81:setText("1");
    obj.button81:setFontSize(9);
    obj.button81:setName("button81");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.layout61);
    obj.button82:setLeft(0);
    obj.button82:setTop(15);
    obj.button82:setHeight(15);
    obj.button82:setWidth(15);
    obj.button82:setText("2");
    obj.button82:setFontSize(9);
    obj.button82:setName("button82");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout61);
    obj.edit191:setLeft(20);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(100);
    obj.edit191:setHeight(25);
    obj.edit191:setField("nome0_12");
    obj.edit191:setName("edit191");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout61);
    obj.rectangle65:setLeft(125);
    obj.rectangle65:setTop(0);
    obj.rectangle65:setWidth(40);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("Black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout61);
    obj.label176:setLeft(125);
    obj.label176:setTop(3);
    obj.label176:setWidth(40);
    obj.label176:setHeight(20);
    obj.label176:setField("total20_12");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout61);
    obj.edit192:setLeft(170);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(30);
    obj.edit192:setHeight(25);
    obj.edit192:setType("number");
    obj.edit192:setMin(0);
    obj.edit192:setField("base0_12");
    obj.edit192:setName("edit192");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout61);
    obj.edit193:setLeft(205);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(30);
    obj.edit193:setHeight(25);
    obj.edit193:setType("number");
    obj.edit193:setMin(0);
    obj.edit193:setField("bonus0_12");
    obj.edit193:setName("edit193");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout61);
    obj.edit194:setLeft(240);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(30);
    obj.edit194:setHeight(25);
    obj.edit194:setType("number");
    obj.edit194:setMin(0);
    obj.edit194:setField("xp0_12");
    obj.edit194:setName("edit194");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout61);
    obj.edit195:setLeft(20);
    obj.edit195:setTop(28);
    obj.edit195:setWidth(250);
    obj.edit195:setHeight(20);
    obj.edit195:setField("espec0_12");
    obj.edit195:setName("edit195");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox4);
    obj.layout62:setLeft(300);
    obj.layout62:setTop(0);
    obj.layout62:setWidth(280);
    obj.layout62:setHeight(630);
    obj.layout62:setName("layout62");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout62);
    obj.rectangle66:setLeft(0);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(280);
    obj.rectangle66:setHeight(630);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setXradius(15);
    obj.rectangle66:setYradius(15);
    obj.rectangle66:setCornerType("round");
    obj.rectangle66:setName("rectangle66");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout62);
    obj.label177:setLeft(5);
    obj.label177:setTop(0);
    obj.label177:setWidth(240);
    obj.label177:setHeight(20);
    obj.label177:setText("CONHECIMENTOS FISICOS");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout62);
    obj.label178:setLeft(25);
    obj.label178:setTop(25);
    obj.label178:setWidth(315);
    obj.label178:setHeight(20);
    obj.label178:setText(" Nome");
    obj.label178:setName("label178");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout62);
    obj.label179:setLeft(135);
    obj.label179:setTop(25);
    obj.label179:setWidth(315);
    obj.label179:setHeight(20);
    obj.label179:setText("Total");
    obj.label179:setName("label179");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout62);
    obj.label180:setLeft(170);
    obj.label180:setTop(25);
    obj.label180:setWidth(315);
    obj.label180:setHeight(20);
    obj.label180:setText(" Inic");
    obj.label180:setName("label180");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout62);
    obj.label181:setLeft(202);
    obj.label181:setTop(25);
    obj.label181:setWidth(315);
    obj.label181:setHeight(20);
    obj.label181:setText(" Apr.");
    obj.label181:setName("label181");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout62);
    obj.label182:setLeft(235);
    obj.label182:setTop(25);
    obj.label182:setWidth(315);
    obj.label182:setHeight(20);
    obj.label182:setText("  XP");
    obj.label182:setName("label182");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setLeft(5);
    obj.layout63:setTop(50);
    obj.layout63:setWidth(270);
    obj.layout63:setHeight(50);
    obj.layout63:setName("layout63");

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.layout63);
    obj.button83:setLeft(0);
    obj.button83:setTop(0);
    obj.button83:setHeight(15);
    obj.button83:setWidth(15);
    obj.button83:setText("1");
    obj.button83:setFontSize(9);
    obj.button83:setName("button83");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.layout63);
    obj.button84:setLeft(0);
    obj.button84:setTop(15);
    obj.button84:setHeight(15);
    obj.button84:setWidth(15);
    obj.button84:setText("2");
    obj.button84:setFontSize(9);
    obj.button84:setName("button84");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout63);
    obj.edit196:setLeft(20);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(100);
    obj.edit196:setHeight(25);
    obj.edit196:setField("nome2_1");
    obj.edit196:setName("edit196");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout63);
    obj.rectangle67:setLeft(125);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(40);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("Black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout63);
    obj.label183:setLeft(125);
    obj.label183:setTop(3);
    obj.label183:setWidth(40);
    obj.label183:setHeight(20);
    obj.label183:setField("total22_1");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout63);
    obj.edit197:setLeft(170);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(30);
    obj.edit197:setHeight(25);
    obj.edit197:setType("number");
    obj.edit197:setMin(0);
    obj.edit197:setField("base2_1");
    obj.edit197:setName("edit197");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout63);
    obj.edit198:setLeft(205);
    obj.edit198:setTop(0);
    obj.edit198:setWidth(30);
    obj.edit198:setHeight(25);
    obj.edit198:setType("number");
    obj.edit198:setMin(0);
    obj.edit198:setField("bonus2_1");
    obj.edit198:setName("edit198");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout63);
    obj.edit199:setLeft(240);
    obj.edit199:setTop(0);
    obj.edit199:setWidth(30);
    obj.edit199:setHeight(25);
    obj.edit199:setType("number");
    obj.edit199:setMin(0);
    obj.edit199:setField("xp2_1");
    obj.edit199:setName("edit199");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout63);
    obj.edit200:setLeft(20);
    obj.edit200:setTop(28);
    obj.edit200:setWidth(250);
    obj.edit200:setHeight(20);
    obj.edit200:setField("espec2_1");
    obj.edit200:setName("edit200");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout62);
    obj.layout64:setLeft(5);
    obj.layout64:setTop(100);
    obj.layout64:setWidth(270);
    obj.layout64:setHeight(50);
    obj.layout64:setName("layout64");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.layout64);
    obj.button85:setLeft(0);
    obj.button85:setTop(0);
    obj.button85:setHeight(15);
    obj.button85:setWidth(15);
    obj.button85:setText("1");
    obj.button85:setFontSize(9);
    obj.button85:setName("button85");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.layout64);
    obj.button86:setLeft(0);
    obj.button86:setTop(15);
    obj.button86:setHeight(15);
    obj.button86:setWidth(15);
    obj.button86:setText("2");
    obj.button86:setFontSize(9);
    obj.button86:setName("button86");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout64);
    obj.edit201:setLeft(20);
    obj.edit201:setTop(0);
    obj.edit201:setWidth(100);
    obj.edit201:setHeight(25);
    obj.edit201:setField("nome2_2");
    obj.edit201:setName("edit201");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout64);
    obj.rectangle68:setLeft(125);
    obj.rectangle68:setTop(0);
    obj.rectangle68:setWidth(40);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("Black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout64);
    obj.label184:setLeft(125);
    obj.label184:setTop(3);
    obj.label184:setWidth(40);
    obj.label184:setHeight(20);
    obj.label184:setField("total22_2");
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout64);
    obj.edit202:setLeft(170);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(30);
    obj.edit202:setHeight(25);
    obj.edit202:setType("number");
    obj.edit202:setMin(0);
    obj.edit202:setField("base2_2");
    obj.edit202:setName("edit202");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout64);
    obj.edit203:setLeft(205);
    obj.edit203:setTop(0);
    obj.edit203:setWidth(30);
    obj.edit203:setHeight(25);
    obj.edit203:setType("number");
    obj.edit203:setMin(0);
    obj.edit203:setField("bonus2_2");
    obj.edit203:setName("edit203");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout64);
    obj.edit204:setLeft(240);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(30);
    obj.edit204:setHeight(25);
    obj.edit204:setType("number");
    obj.edit204:setMin(0);
    obj.edit204:setField("xp2_2");
    obj.edit204:setName("edit204");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout64);
    obj.edit205:setLeft(20);
    obj.edit205:setTop(28);
    obj.edit205:setWidth(250);
    obj.edit205:setHeight(20);
    obj.edit205:setField("espec2_2");
    obj.edit205:setName("edit205");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout62);
    obj.layout65:setLeft(5);
    obj.layout65:setTop(150);
    obj.layout65:setWidth(270);
    obj.layout65:setHeight(50);
    obj.layout65:setName("layout65");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.layout65);
    obj.button87:setLeft(0);
    obj.button87:setTop(0);
    obj.button87:setHeight(15);
    obj.button87:setWidth(15);
    obj.button87:setText("1");
    obj.button87:setFontSize(9);
    obj.button87:setName("button87");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.layout65);
    obj.button88:setLeft(0);
    obj.button88:setTop(15);
    obj.button88:setHeight(15);
    obj.button88:setWidth(15);
    obj.button88:setText("2");
    obj.button88:setFontSize(9);
    obj.button88:setName("button88");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout65);
    obj.edit206:setLeft(20);
    obj.edit206:setTop(0);
    obj.edit206:setWidth(100);
    obj.edit206:setHeight(25);
    obj.edit206:setField("nome2_3");
    obj.edit206:setName("edit206");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout65);
    obj.rectangle69:setLeft(125);
    obj.rectangle69:setTop(0);
    obj.rectangle69:setWidth(40);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("Black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout65);
    obj.label185:setLeft(125);
    obj.label185:setTop(3);
    obj.label185:setWidth(40);
    obj.label185:setHeight(20);
    obj.label185:setField("total22_3");
    obj.label185:setHorzTextAlign("center");
    obj.label185:setName("label185");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout65);
    obj.edit207:setLeft(170);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(30);
    obj.edit207:setHeight(25);
    obj.edit207:setType("number");
    obj.edit207:setMin(0);
    obj.edit207:setField("base2_3");
    obj.edit207:setName("edit207");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout65);
    obj.edit208:setLeft(205);
    obj.edit208:setTop(0);
    obj.edit208:setWidth(30);
    obj.edit208:setHeight(25);
    obj.edit208:setType("number");
    obj.edit208:setMin(0);
    obj.edit208:setField("bonus2_3");
    obj.edit208:setName("edit208");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout65);
    obj.edit209:setLeft(240);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(30);
    obj.edit209:setHeight(25);
    obj.edit209:setType("number");
    obj.edit209:setMin(0);
    obj.edit209:setField("xp2_3");
    obj.edit209:setName("edit209");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout65);
    obj.edit210:setLeft(20);
    obj.edit210:setTop(28);
    obj.edit210:setWidth(250);
    obj.edit210:setHeight(20);
    obj.edit210:setField("espec2_3");
    obj.edit210:setName("edit210");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout62);
    obj.layout66:setLeft(5);
    obj.layout66:setTop(200);
    obj.layout66:setWidth(270);
    obj.layout66:setHeight(50);
    obj.layout66:setName("layout66");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.layout66);
    obj.button89:setLeft(0);
    obj.button89:setTop(0);
    obj.button89:setHeight(15);
    obj.button89:setWidth(15);
    obj.button89:setText("1");
    obj.button89:setFontSize(9);
    obj.button89:setName("button89");

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.layout66);
    obj.button90:setLeft(0);
    obj.button90:setTop(15);
    obj.button90:setHeight(15);
    obj.button90:setWidth(15);
    obj.button90:setText("2");
    obj.button90:setFontSize(9);
    obj.button90:setName("button90");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout66);
    obj.edit211:setLeft(20);
    obj.edit211:setTop(0);
    obj.edit211:setWidth(100);
    obj.edit211:setHeight(25);
    obj.edit211:setField("nome2_4");
    obj.edit211:setName("edit211");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout66);
    obj.rectangle70:setLeft(125);
    obj.rectangle70:setTop(0);
    obj.rectangle70:setWidth(40);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("Black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout66);
    obj.label186:setLeft(125);
    obj.label186:setTop(3);
    obj.label186:setWidth(40);
    obj.label186:setHeight(20);
    obj.label186:setField("total22_4");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout66);
    obj.edit212:setLeft(170);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(30);
    obj.edit212:setHeight(25);
    obj.edit212:setType("number");
    obj.edit212:setMin(0);
    obj.edit212:setField("base2_4");
    obj.edit212:setName("edit212");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout66);
    obj.edit213:setLeft(205);
    obj.edit213:setTop(0);
    obj.edit213:setWidth(30);
    obj.edit213:setHeight(25);
    obj.edit213:setType("number");
    obj.edit213:setMin(0);
    obj.edit213:setField("bonus2_4");
    obj.edit213:setName("edit213");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout66);
    obj.edit214:setLeft(240);
    obj.edit214:setTop(0);
    obj.edit214:setWidth(30);
    obj.edit214:setHeight(25);
    obj.edit214:setType("number");
    obj.edit214:setMin(0);
    obj.edit214:setField("xp2_4");
    obj.edit214:setName("edit214");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout66);
    obj.edit215:setLeft(20);
    obj.edit215:setTop(28);
    obj.edit215:setWidth(250);
    obj.edit215:setHeight(20);
    obj.edit215:setField("espec2_4");
    obj.edit215:setName("edit215");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout62);
    obj.layout67:setLeft(5);
    obj.layout67:setTop(250);
    obj.layout67:setWidth(270);
    obj.layout67:setHeight(50);
    obj.layout67:setName("layout67");

    obj.button91 = GUI.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.layout67);
    obj.button91:setLeft(0);
    obj.button91:setTop(0);
    obj.button91:setHeight(15);
    obj.button91:setWidth(15);
    obj.button91:setText("1");
    obj.button91:setFontSize(9);
    obj.button91:setName("button91");

    obj.button92 = GUI.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.layout67);
    obj.button92:setLeft(0);
    obj.button92:setTop(15);
    obj.button92:setHeight(15);
    obj.button92:setWidth(15);
    obj.button92:setText("2");
    obj.button92:setFontSize(9);
    obj.button92:setName("button92");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout67);
    obj.edit216:setLeft(20);
    obj.edit216:setTop(0);
    obj.edit216:setWidth(100);
    obj.edit216:setHeight(25);
    obj.edit216:setField("nome2_5");
    obj.edit216:setName("edit216");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout67);
    obj.rectangle71:setLeft(125);
    obj.rectangle71:setTop(0);
    obj.rectangle71:setWidth(40);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("Black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout67);
    obj.label187:setLeft(125);
    obj.label187:setTop(3);
    obj.label187:setWidth(40);
    obj.label187:setHeight(20);
    obj.label187:setField("total22_5");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout67);
    obj.edit217:setLeft(170);
    obj.edit217:setTop(0);
    obj.edit217:setWidth(30);
    obj.edit217:setHeight(25);
    obj.edit217:setType("number");
    obj.edit217:setMin(0);
    obj.edit217:setField("base2_5");
    obj.edit217:setName("edit217");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout67);
    obj.edit218:setLeft(205);
    obj.edit218:setTop(0);
    obj.edit218:setWidth(30);
    obj.edit218:setHeight(25);
    obj.edit218:setType("number");
    obj.edit218:setMin(0);
    obj.edit218:setField("bonus2_5");
    obj.edit218:setName("edit218");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout67);
    obj.edit219:setLeft(240);
    obj.edit219:setTop(0);
    obj.edit219:setWidth(30);
    obj.edit219:setHeight(25);
    obj.edit219:setType("number");
    obj.edit219:setMin(0);
    obj.edit219:setField("xp2_5");
    obj.edit219:setName("edit219");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout67);
    obj.edit220:setLeft(20);
    obj.edit220:setTop(28);
    obj.edit220:setWidth(250);
    obj.edit220:setHeight(20);
    obj.edit220:setField("espec2_5");
    obj.edit220:setName("edit220");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout62);
    obj.layout68:setLeft(5);
    obj.layout68:setTop(300);
    obj.layout68:setWidth(270);
    obj.layout68:setHeight(50);
    obj.layout68:setName("layout68");

    obj.button93 = GUI.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.layout68);
    obj.button93:setLeft(0);
    obj.button93:setTop(0);
    obj.button93:setHeight(15);
    obj.button93:setWidth(15);
    obj.button93:setText("1");
    obj.button93:setFontSize(9);
    obj.button93:setName("button93");

    obj.button94 = GUI.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.layout68);
    obj.button94:setLeft(0);
    obj.button94:setTop(15);
    obj.button94:setHeight(15);
    obj.button94:setWidth(15);
    obj.button94:setText("2");
    obj.button94:setFontSize(9);
    obj.button94:setName("button94");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout68);
    obj.edit221:setLeft(20);
    obj.edit221:setTop(0);
    obj.edit221:setWidth(100);
    obj.edit221:setHeight(25);
    obj.edit221:setField("nome2_6");
    obj.edit221:setName("edit221");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout68);
    obj.rectangle72:setLeft(125);
    obj.rectangle72:setTop(0);
    obj.rectangle72:setWidth(40);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("Black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout68);
    obj.label188:setLeft(125);
    obj.label188:setTop(3);
    obj.label188:setWidth(40);
    obj.label188:setHeight(20);
    obj.label188:setField("total22_6");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout68);
    obj.edit222:setLeft(170);
    obj.edit222:setTop(0);
    obj.edit222:setWidth(30);
    obj.edit222:setHeight(25);
    obj.edit222:setType("number");
    obj.edit222:setMin(0);
    obj.edit222:setField("base2_6");
    obj.edit222:setName("edit222");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout68);
    obj.edit223:setLeft(205);
    obj.edit223:setTop(0);
    obj.edit223:setWidth(30);
    obj.edit223:setHeight(25);
    obj.edit223:setType("number");
    obj.edit223:setMin(0);
    obj.edit223:setField("bonus2_6");
    obj.edit223:setName("edit223");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout68);
    obj.edit224:setLeft(240);
    obj.edit224:setTop(0);
    obj.edit224:setWidth(30);
    obj.edit224:setHeight(25);
    obj.edit224:setType("number");
    obj.edit224:setMin(0);
    obj.edit224:setField("xp2_6");
    obj.edit224:setName("edit224");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout68);
    obj.edit225:setLeft(20);
    obj.edit225:setTop(28);
    obj.edit225:setWidth(250);
    obj.edit225:setHeight(20);
    obj.edit225:setField("espec2_6");
    obj.edit225:setName("edit225");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout62);
    obj.layout69:setLeft(5);
    obj.layout69:setTop(350);
    obj.layout69:setWidth(270);
    obj.layout69:setHeight(50);
    obj.layout69:setName("layout69");

    obj.button95 = GUI.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.layout69);
    obj.button95:setLeft(0);
    obj.button95:setTop(0);
    obj.button95:setHeight(15);
    obj.button95:setWidth(15);
    obj.button95:setText("1");
    obj.button95:setFontSize(9);
    obj.button95:setName("button95");

    obj.button96 = GUI.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.layout69);
    obj.button96:setLeft(0);
    obj.button96:setTop(15);
    obj.button96:setHeight(15);
    obj.button96:setWidth(15);
    obj.button96:setText("2");
    obj.button96:setFontSize(9);
    obj.button96:setName("button96");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout69);
    obj.edit226:setLeft(20);
    obj.edit226:setTop(0);
    obj.edit226:setWidth(100);
    obj.edit226:setHeight(25);
    obj.edit226:setField("nome2_7");
    obj.edit226:setName("edit226");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout69);
    obj.rectangle73:setLeft(125);
    obj.rectangle73:setTop(0);
    obj.rectangle73:setWidth(40);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("Black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout69);
    obj.label189:setLeft(125);
    obj.label189:setTop(3);
    obj.label189:setWidth(40);
    obj.label189:setHeight(20);
    obj.label189:setField("total22_7");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout69);
    obj.edit227:setLeft(170);
    obj.edit227:setTop(0);
    obj.edit227:setWidth(30);
    obj.edit227:setHeight(25);
    obj.edit227:setType("number");
    obj.edit227:setMin(0);
    obj.edit227:setField("base2_7");
    obj.edit227:setName("edit227");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout69);
    obj.edit228:setLeft(205);
    obj.edit228:setTop(0);
    obj.edit228:setWidth(30);
    obj.edit228:setHeight(25);
    obj.edit228:setType("number");
    obj.edit228:setMin(0);
    obj.edit228:setField("bonus2_7");
    obj.edit228:setName("edit228");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout69);
    obj.edit229:setLeft(240);
    obj.edit229:setTop(0);
    obj.edit229:setWidth(30);
    obj.edit229:setHeight(25);
    obj.edit229:setType("number");
    obj.edit229:setMin(0);
    obj.edit229:setField("xp2_7");
    obj.edit229:setName("edit229");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout69);
    obj.edit230:setLeft(20);
    obj.edit230:setTop(28);
    obj.edit230:setWidth(250);
    obj.edit230:setHeight(20);
    obj.edit230:setField("espec2_7");
    obj.edit230:setName("edit230");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout62);
    obj.layout70:setLeft(5);
    obj.layout70:setTop(400);
    obj.layout70:setWidth(270);
    obj.layout70:setHeight(50);
    obj.layout70:setName("layout70");

    obj.button97 = GUI.fromHandle(_obj_newObject("button"));
    obj.button97:setParent(obj.layout70);
    obj.button97:setLeft(0);
    obj.button97:setTop(0);
    obj.button97:setHeight(15);
    obj.button97:setWidth(15);
    obj.button97:setText("1");
    obj.button97:setFontSize(9);
    obj.button97:setName("button97");

    obj.button98 = GUI.fromHandle(_obj_newObject("button"));
    obj.button98:setParent(obj.layout70);
    obj.button98:setLeft(0);
    obj.button98:setTop(15);
    obj.button98:setHeight(15);
    obj.button98:setWidth(15);
    obj.button98:setText("2");
    obj.button98:setFontSize(9);
    obj.button98:setName("button98");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout70);
    obj.edit231:setLeft(20);
    obj.edit231:setTop(0);
    obj.edit231:setWidth(100);
    obj.edit231:setHeight(25);
    obj.edit231:setField("nome2_8");
    obj.edit231:setName("edit231");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout70);
    obj.rectangle74:setLeft(125);
    obj.rectangle74:setTop(0);
    obj.rectangle74:setWidth(40);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("Black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout70);
    obj.label190:setLeft(125);
    obj.label190:setTop(3);
    obj.label190:setWidth(40);
    obj.label190:setHeight(20);
    obj.label190:setField("total22_8");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout70);
    obj.edit232:setLeft(170);
    obj.edit232:setTop(0);
    obj.edit232:setWidth(30);
    obj.edit232:setHeight(25);
    obj.edit232:setType("number");
    obj.edit232:setMin(0);
    obj.edit232:setField("base2_8");
    obj.edit232:setName("edit232");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout70);
    obj.edit233:setLeft(205);
    obj.edit233:setTop(0);
    obj.edit233:setWidth(30);
    obj.edit233:setHeight(25);
    obj.edit233:setType("number");
    obj.edit233:setMin(0);
    obj.edit233:setField("bonus2_8");
    obj.edit233:setName("edit233");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout70);
    obj.edit234:setLeft(240);
    obj.edit234:setTop(0);
    obj.edit234:setWidth(30);
    obj.edit234:setHeight(25);
    obj.edit234:setType("number");
    obj.edit234:setMin(0);
    obj.edit234:setField("xp2_8");
    obj.edit234:setName("edit234");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout70);
    obj.edit235:setLeft(20);
    obj.edit235:setTop(28);
    obj.edit235:setWidth(250);
    obj.edit235:setHeight(20);
    obj.edit235:setField("espec2_8");
    obj.edit235:setName("edit235");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout62);
    obj.layout71:setLeft(5);
    obj.layout71:setTop(450);
    obj.layout71:setWidth(270);
    obj.layout71:setHeight(50);
    obj.layout71:setName("layout71");

    obj.button99 = GUI.fromHandle(_obj_newObject("button"));
    obj.button99:setParent(obj.layout71);
    obj.button99:setLeft(0);
    obj.button99:setTop(0);
    obj.button99:setHeight(15);
    obj.button99:setWidth(15);
    obj.button99:setText("1");
    obj.button99:setFontSize(9);
    obj.button99:setName("button99");

    obj.button100 = GUI.fromHandle(_obj_newObject("button"));
    obj.button100:setParent(obj.layout71);
    obj.button100:setLeft(0);
    obj.button100:setTop(15);
    obj.button100:setHeight(15);
    obj.button100:setWidth(15);
    obj.button100:setText("2");
    obj.button100:setFontSize(9);
    obj.button100:setName("button100");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout71);
    obj.edit236:setLeft(20);
    obj.edit236:setTop(0);
    obj.edit236:setWidth(100);
    obj.edit236:setHeight(25);
    obj.edit236:setField("nome2_9");
    obj.edit236:setName("edit236");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout71);
    obj.rectangle75:setLeft(125);
    obj.rectangle75:setTop(0);
    obj.rectangle75:setWidth(40);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("Black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout71);
    obj.label191:setLeft(125);
    obj.label191:setTop(3);
    obj.label191:setWidth(40);
    obj.label191:setHeight(20);
    obj.label191:setField("total22_9");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout71);
    obj.edit237:setLeft(170);
    obj.edit237:setTop(0);
    obj.edit237:setWidth(30);
    obj.edit237:setHeight(25);
    obj.edit237:setType("number");
    obj.edit237:setMin(0);
    obj.edit237:setField("base2_9");
    obj.edit237:setName("edit237");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout71);
    obj.edit238:setLeft(205);
    obj.edit238:setTop(0);
    obj.edit238:setWidth(30);
    obj.edit238:setHeight(25);
    obj.edit238:setType("number");
    obj.edit238:setMin(0);
    obj.edit238:setField("bonus2_9");
    obj.edit238:setName("edit238");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout71);
    obj.edit239:setLeft(240);
    obj.edit239:setTop(0);
    obj.edit239:setWidth(30);
    obj.edit239:setHeight(25);
    obj.edit239:setType("number");
    obj.edit239:setMin(0);
    obj.edit239:setField("xp2_9");
    obj.edit239:setName("edit239");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout71);
    obj.edit240:setLeft(20);
    obj.edit240:setTop(28);
    obj.edit240:setWidth(250);
    obj.edit240:setHeight(20);
    obj.edit240:setField("espec2_9");
    obj.edit240:setName("edit240");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout62);
    obj.layout72:setLeft(5);
    obj.layout72:setTop(500);
    obj.layout72:setWidth(270);
    obj.layout72:setHeight(50);
    obj.layout72:setName("layout72");

    obj.button101 = GUI.fromHandle(_obj_newObject("button"));
    obj.button101:setParent(obj.layout72);
    obj.button101:setLeft(0);
    obj.button101:setTop(0);
    obj.button101:setHeight(15);
    obj.button101:setWidth(15);
    obj.button101:setText("1");
    obj.button101:setFontSize(9);
    obj.button101:setName("button101");

    obj.button102 = GUI.fromHandle(_obj_newObject("button"));
    obj.button102:setParent(obj.layout72);
    obj.button102:setLeft(0);
    obj.button102:setTop(15);
    obj.button102:setHeight(15);
    obj.button102:setWidth(15);
    obj.button102:setText("2");
    obj.button102:setFontSize(9);
    obj.button102:setName("button102");

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout72);
    obj.edit241:setLeft(20);
    obj.edit241:setTop(0);
    obj.edit241:setWidth(100);
    obj.edit241:setHeight(25);
    obj.edit241:setField("nome2_10");
    obj.edit241:setName("edit241");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout72);
    obj.rectangle76:setLeft(125);
    obj.rectangle76:setTop(0);
    obj.rectangle76:setWidth(40);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("Black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout72);
    obj.label192:setLeft(125);
    obj.label192:setTop(3);
    obj.label192:setWidth(40);
    obj.label192:setHeight(20);
    obj.label192:setField("total22_10");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout72);
    obj.edit242:setLeft(170);
    obj.edit242:setTop(0);
    obj.edit242:setWidth(30);
    obj.edit242:setHeight(25);
    obj.edit242:setType("number");
    obj.edit242:setMin(0);
    obj.edit242:setField("base2_10");
    obj.edit242:setName("edit242");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout72);
    obj.edit243:setLeft(205);
    obj.edit243:setTop(0);
    obj.edit243:setWidth(30);
    obj.edit243:setHeight(25);
    obj.edit243:setType("number");
    obj.edit243:setMin(0);
    obj.edit243:setField("bonus2_10");
    obj.edit243:setName("edit243");

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout72);
    obj.edit244:setLeft(240);
    obj.edit244:setTop(0);
    obj.edit244:setWidth(30);
    obj.edit244:setHeight(25);
    obj.edit244:setType("number");
    obj.edit244:setMin(0);
    obj.edit244:setField("xp2_10");
    obj.edit244:setName("edit244");

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout72);
    obj.edit245:setLeft(20);
    obj.edit245:setTop(28);
    obj.edit245:setWidth(250);
    obj.edit245:setHeight(20);
    obj.edit245:setField("espec2_10");
    obj.edit245:setName("edit245");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout62);
    obj.layout73:setLeft(5);
    obj.layout73:setTop(550);
    obj.layout73:setWidth(270);
    obj.layout73:setHeight(50);
    obj.layout73:setName("layout73");

    obj.button103 = GUI.fromHandle(_obj_newObject("button"));
    obj.button103:setParent(obj.layout73);
    obj.button103:setLeft(0);
    obj.button103:setTop(0);
    obj.button103:setHeight(15);
    obj.button103:setWidth(15);
    obj.button103:setText("1");
    obj.button103:setFontSize(9);
    obj.button103:setName("button103");

    obj.button104 = GUI.fromHandle(_obj_newObject("button"));
    obj.button104:setParent(obj.layout73);
    obj.button104:setLeft(0);
    obj.button104:setTop(15);
    obj.button104:setHeight(15);
    obj.button104:setWidth(15);
    obj.button104:setText("2");
    obj.button104:setFontSize(9);
    obj.button104:setName("button104");

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout73);
    obj.edit246:setLeft(20);
    obj.edit246:setTop(0);
    obj.edit246:setWidth(100);
    obj.edit246:setHeight(25);
    obj.edit246:setField("nome2_11");
    obj.edit246:setName("edit246");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout73);
    obj.rectangle77:setLeft(125);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(40);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("Black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout73);
    obj.label193:setLeft(125);
    obj.label193:setTop(3);
    obj.label193:setWidth(40);
    obj.label193:setHeight(20);
    obj.label193:setField("total22_11");
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout73);
    obj.edit247:setLeft(170);
    obj.edit247:setTop(0);
    obj.edit247:setWidth(30);
    obj.edit247:setHeight(25);
    obj.edit247:setType("number");
    obj.edit247:setMin(0);
    obj.edit247:setField("base2_11");
    obj.edit247:setName("edit247");

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout73);
    obj.edit248:setLeft(205);
    obj.edit248:setTop(0);
    obj.edit248:setWidth(30);
    obj.edit248:setHeight(25);
    obj.edit248:setType("number");
    obj.edit248:setMin(0);
    obj.edit248:setField("bonus2_11");
    obj.edit248:setName("edit248");

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout73);
    obj.edit249:setLeft(240);
    obj.edit249:setTop(0);
    obj.edit249:setWidth(30);
    obj.edit249:setHeight(25);
    obj.edit249:setType("number");
    obj.edit249:setMin(0);
    obj.edit249:setField("xp2_11");
    obj.edit249:setName("edit249");

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout73);
    obj.edit250:setLeft(20);
    obj.edit250:setTop(28);
    obj.edit250:setWidth(250);
    obj.edit250:setHeight(20);
    obj.edit250:setField("espec2_11");
    obj.edit250:setName("edit250");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout62);
    obj.layout74:setLeft(5);
    obj.layout74:setTop(600);
    obj.layout74:setWidth(270);
    obj.layout74:setHeight(50);
    obj.layout74:setName("layout74");

    obj.button105 = GUI.fromHandle(_obj_newObject("button"));
    obj.button105:setParent(obj.layout74);
    obj.button105:setLeft(0);
    obj.button105:setTop(0);
    obj.button105:setHeight(15);
    obj.button105:setWidth(15);
    obj.button105:setText("1");
    obj.button105:setFontSize(9);
    obj.button105:setName("button105");

    obj.button106 = GUI.fromHandle(_obj_newObject("button"));
    obj.button106:setParent(obj.layout74);
    obj.button106:setLeft(0);
    obj.button106:setTop(15);
    obj.button106:setHeight(15);
    obj.button106:setWidth(15);
    obj.button106:setText("2");
    obj.button106:setFontSize(9);
    obj.button106:setName("button106");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout74);
    obj.edit251:setLeft(20);
    obj.edit251:setTop(0);
    obj.edit251:setWidth(100);
    obj.edit251:setHeight(25);
    obj.edit251:setField("nome2_12");
    obj.edit251:setName("edit251");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout74);
    obj.rectangle78:setLeft(125);
    obj.rectangle78:setTop(0);
    obj.rectangle78:setWidth(40);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("Black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout74);
    obj.label194:setLeft(125);
    obj.label194:setTop(3);
    obj.label194:setWidth(40);
    obj.label194:setHeight(20);
    obj.label194:setField("total22_12");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout74);
    obj.edit252:setLeft(170);
    obj.edit252:setTop(0);
    obj.edit252:setWidth(30);
    obj.edit252:setHeight(25);
    obj.edit252:setType("number");
    obj.edit252:setMin(0);
    obj.edit252:setField("base2_12");
    obj.edit252:setName("edit252");

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout74);
    obj.edit253:setLeft(205);
    obj.edit253:setTop(0);
    obj.edit253:setWidth(30);
    obj.edit253:setHeight(25);
    obj.edit253:setType("number");
    obj.edit253:setMin(0);
    obj.edit253:setField("bonus2_12");
    obj.edit253:setName("edit253");

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout74);
    obj.edit254:setLeft(240);
    obj.edit254:setTop(0);
    obj.edit254:setWidth(30);
    obj.edit254:setHeight(25);
    obj.edit254:setType("number");
    obj.edit254:setMin(0);
    obj.edit254:setField("xp2_12");
    obj.edit254:setName("edit254");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout74);
    obj.edit255:setLeft(20);
    obj.edit255:setTop(28);
    obj.edit255:setWidth(250);
    obj.edit255:setHeight(20);
    obj.edit255:setField("espec2_12");
    obj.edit255:setName("edit255");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.scrollBox4);
    obj.layout75:setLeft(600);
    obj.layout75:setTop(0);
    obj.layout75:setWidth(280);
    obj.layout75:setHeight(630);
    obj.layout75:setName("layout75");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout75);
    obj.rectangle79:setLeft(0);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(280);
    obj.rectangle79:setHeight(630);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setXradius(15);
    obj.rectangle79:setYradius(15);
    obj.rectangle79:setCornerType("round");
    obj.rectangle79:setName("rectangle79");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout75);
    obj.label195:setLeft(5);
    obj.label195:setTop(0);
    obj.label195:setWidth(240);
    obj.label195:setHeight(20);
    obj.label195:setText("TALENTOS MENTAIS");
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout75);
    obj.label196:setLeft(25);
    obj.label196:setTop(25);
    obj.label196:setWidth(315);
    obj.label196:setHeight(20);
    obj.label196:setText(" Nome");
    obj.label196:setName("label196");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout75);
    obj.label197:setLeft(135);
    obj.label197:setTop(25);
    obj.label197:setWidth(315);
    obj.label197:setHeight(20);
    obj.label197:setText("Total");
    obj.label197:setName("label197");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout75);
    obj.label198:setLeft(170);
    obj.label198:setTop(25);
    obj.label198:setWidth(315);
    obj.label198:setHeight(20);
    obj.label198:setText(" Inic");
    obj.label198:setName("label198");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout75);
    obj.label199:setLeft(202);
    obj.label199:setTop(25);
    obj.label199:setWidth(315);
    obj.label199:setHeight(20);
    obj.label199:setText(" Apr.");
    obj.label199:setName("label199");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout75);
    obj.label200:setLeft(235);
    obj.label200:setTop(25);
    obj.label200:setWidth(315);
    obj.label200:setHeight(20);
    obj.label200:setText("  XP");
    obj.label200:setName("label200");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setLeft(5);
    obj.layout76:setTop(50);
    obj.layout76:setWidth(270);
    obj.layout76:setHeight(50);
    obj.layout76:setName("layout76");

    obj.button107 = GUI.fromHandle(_obj_newObject("button"));
    obj.button107:setParent(obj.layout76);
    obj.button107:setLeft(0);
    obj.button107:setTop(0);
    obj.button107:setHeight(15);
    obj.button107:setWidth(15);
    obj.button107:setText("1");
    obj.button107:setFontSize(9);
    obj.button107:setName("button107");

    obj.button108 = GUI.fromHandle(_obj_newObject("button"));
    obj.button108:setParent(obj.layout76);
    obj.button108:setLeft(0);
    obj.button108:setTop(15);
    obj.button108:setHeight(15);
    obj.button108:setWidth(15);
    obj.button108:setText("2");
    obj.button108:setFontSize(9);
    obj.button108:setName("button108");

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout76);
    obj.edit256:setLeft(20);
    obj.edit256:setTop(0);
    obj.edit256:setWidth(100);
    obj.edit256:setHeight(25);
    obj.edit256:setField("nome1_1");
    obj.edit256:setName("edit256");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout76);
    obj.rectangle80:setLeft(125);
    obj.rectangle80:setTop(0);
    obj.rectangle80:setWidth(40);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("Black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout76);
    obj.label201:setLeft(125);
    obj.label201:setTop(3);
    obj.label201:setWidth(40);
    obj.label201:setHeight(20);
    obj.label201:setField("total21_1");
    obj.label201:setHorzTextAlign("center");
    obj.label201:setName("label201");

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout76);
    obj.edit257:setLeft(170);
    obj.edit257:setTop(0);
    obj.edit257:setWidth(30);
    obj.edit257:setHeight(25);
    obj.edit257:setType("number");
    obj.edit257:setMin(0);
    obj.edit257:setField("base1_1");
    obj.edit257:setName("edit257");

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout76);
    obj.edit258:setLeft(205);
    obj.edit258:setTop(0);
    obj.edit258:setWidth(30);
    obj.edit258:setHeight(25);
    obj.edit258:setType("number");
    obj.edit258:setMin(0);
    obj.edit258:setField("bonus1_1");
    obj.edit258:setName("edit258");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout76);
    obj.edit259:setLeft(240);
    obj.edit259:setTop(0);
    obj.edit259:setWidth(30);
    obj.edit259:setHeight(25);
    obj.edit259:setType("number");
    obj.edit259:setMin(0);
    obj.edit259:setField("xp1_1");
    obj.edit259:setName("edit259");

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout76);
    obj.edit260:setLeft(20);
    obj.edit260:setTop(28);
    obj.edit260:setWidth(250);
    obj.edit260:setHeight(20);
    obj.edit260:setField("espec1_1");
    obj.edit260:setName("edit260");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout75);
    obj.layout77:setLeft(5);
    obj.layout77:setTop(100);
    obj.layout77:setWidth(270);
    obj.layout77:setHeight(50);
    obj.layout77:setName("layout77");

    obj.button109 = GUI.fromHandle(_obj_newObject("button"));
    obj.button109:setParent(obj.layout77);
    obj.button109:setLeft(0);
    obj.button109:setTop(0);
    obj.button109:setHeight(15);
    obj.button109:setWidth(15);
    obj.button109:setText("1");
    obj.button109:setFontSize(9);
    obj.button109:setName("button109");

    obj.button110 = GUI.fromHandle(_obj_newObject("button"));
    obj.button110:setParent(obj.layout77);
    obj.button110:setLeft(0);
    obj.button110:setTop(15);
    obj.button110:setHeight(15);
    obj.button110:setWidth(15);
    obj.button110:setText("2");
    obj.button110:setFontSize(9);
    obj.button110:setName("button110");

    obj.edit261 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout77);
    obj.edit261:setLeft(20);
    obj.edit261:setTop(0);
    obj.edit261:setWidth(100);
    obj.edit261:setHeight(25);
    obj.edit261:setField("nome1_2");
    obj.edit261:setName("edit261");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout77);
    obj.rectangle81:setLeft(125);
    obj.rectangle81:setTop(0);
    obj.rectangle81:setWidth(40);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("Black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout77);
    obj.label202:setLeft(125);
    obj.label202:setTop(3);
    obj.label202:setWidth(40);
    obj.label202:setHeight(20);
    obj.label202:setField("total21_2");
    obj.label202:setHorzTextAlign("center");
    obj.label202:setName("label202");

    obj.edit262 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout77);
    obj.edit262:setLeft(170);
    obj.edit262:setTop(0);
    obj.edit262:setWidth(30);
    obj.edit262:setHeight(25);
    obj.edit262:setType("number");
    obj.edit262:setMin(0);
    obj.edit262:setField("base1_2");
    obj.edit262:setName("edit262");

    obj.edit263 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout77);
    obj.edit263:setLeft(205);
    obj.edit263:setTop(0);
    obj.edit263:setWidth(30);
    obj.edit263:setHeight(25);
    obj.edit263:setType("number");
    obj.edit263:setMin(0);
    obj.edit263:setField("bonus1_2");
    obj.edit263:setName("edit263");

    obj.edit264 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout77);
    obj.edit264:setLeft(240);
    obj.edit264:setTop(0);
    obj.edit264:setWidth(30);
    obj.edit264:setHeight(25);
    obj.edit264:setType("number");
    obj.edit264:setMin(0);
    obj.edit264:setField("xp1_2");
    obj.edit264:setName("edit264");

    obj.edit265 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout77);
    obj.edit265:setLeft(20);
    obj.edit265:setTop(28);
    obj.edit265:setWidth(250);
    obj.edit265:setHeight(20);
    obj.edit265:setField("espec1_2");
    obj.edit265:setName("edit265");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout75);
    obj.layout78:setLeft(5);
    obj.layout78:setTop(150);
    obj.layout78:setWidth(270);
    obj.layout78:setHeight(50);
    obj.layout78:setName("layout78");

    obj.button111 = GUI.fromHandle(_obj_newObject("button"));
    obj.button111:setParent(obj.layout78);
    obj.button111:setLeft(0);
    obj.button111:setTop(0);
    obj.button111:setHeight(15);
    obj.button111:setWidth(15);
    obj.button111:setText("1");
    obj.button111:setFontSize(9);
    obj.button111:setName("button111");

    obj.button112 = GUI.fromHandle(_obj_newObject("button"));
    obj.button112:setParent(obj.layout78);
    obj.button112:setLeft(0);
    obj.button112:setTop(15);
    obj.button112:setHeight(15);
    obj.button112:setWidth(15);
    obj.button112:setText("2");
    obj.button112:setFontSize(9);
    obj.button112:setName("button112");

    obj.edit266 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout78);
    obj.edit266:setLeft(20);
    obj.edit266:setTop(0);
    obj.edit266:setWidth(100);
    obj.edit266:setHeight(25);
    obj.edit266:setField("nome1_3");
    obj.edit266:setName("edit266");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout78);
    obj.rectangle82:setLeft(125);
    obj.rectangle82:setTop(0);
    obj.rectangle82:setWidth(40);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("Black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout78);
    obj.label203:setLeft(125);
    obj.label203:setTop(3);
    obj.label203:setWidth(40);
    obj.label203:setHeight(20);
    obj.label203:setField("total21_3");
    obj.label203:setHorzTextAlign("center");
    obj.label203:setName("label203");

    obj.edit267 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout78);
    obj.edit267:setLeft(170);
    obj.edit267:setTop(0);
    obj.edit267:setWidth(30);
    obj.edit267:setHeight(25);
    obj.edit267:setType("number");
    obj.edit267:setMin(0);
    obj.edit267:setField("base1_3");
    obj.edit267:setName("edit267");

    obj.edit268 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout78);
    obj.edit268:setLeft(205);
    obj.edit268:setTop(0);
    obj.edit268:setWidth(30);
    obj.edit268:setHeight(25);
    obj.edit268:setType("number");
    obj.edit268:setMin(0);
    obj.edit268:setField("bonus1_3");
    obj.edit268:setName("edit268");

    obj.edit269 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout78);
    obj.edit269:setLeft(240);
    obj.edit269:setTop(0);
    obj.edit269:setWidth(30);
    obj.edit269:setHeight(25);
    obj.edit269:setType("number");
    obj.edit269:setMin(0);
    obj.edit269:setField("xp1_3");
    obj.edit269:setName("edit269");

    obj.edit270 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout78);
    obj.edit270:setLeft(20);
    obj.edit270:setTop(28);
    obj.edit270:setWidth(250);
    obj.edit270:setHeight(20);
    obj.edit270:setField("espec1_3");
    obj.edit270:setName("edit270");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout75);
    obj.layout79:setLeft(5);
    obj.layout79:setTop(200);
    obj.layout79:setWidth(270);
    obj.layout79:setHeight(50);
    obj.layout79:setName("layout79");

    obj.button113 = GUI.fromHandle(_obj_newObject("button"));
    obj.button113:setParent(obj.layout79);
    obj.button113:setLeft(0);
    obj.button113:setTop(0);
    obj.button113:setHeight(15);
    obj.button113:setWidth(15);
    obj.button113:setText("1");
    obj.button113:setFontSize(9);
    obj.button113:setName("button113");

    obj.button114 = GUI.fromHandle(_obj_newObject("button"));
    obj.button114:setParent(obj.layout79);
    obj.button114:setLeft(0);
    obj.button114:setTop(15);
    obj.button114:setHeight(15);
    obj.button114:setWidth(15);
    obj.button114:setText("2");
    obj.button114:setFontSize(9);
    obj.button114:setName("button114");

    obj.edit271 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout79);
    obj.edit271:setLeft(20);
    obj.edit271:setTop(0);
    obj.edit271:setWidth(100);
    obj.edit271:setHeight(25);
    obj.edit271:setField("nome1_4");
    obj.edit271:setName("edit271");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout79);
    obj.rectangle83:setLeft(125);
    obj.rectangle83:setTop(0);
    obj.rectangle83:setWidth(40);
    obj.rectangle83:setHeight(25);
    obj.rectangle83:setColor("Black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout79);
    obj.label204:setLeft(125);
    obj.label204:setTop(3);
    obj.label204:setWidth(40);
    obj.label204:setHeight(20);
    obj.label204:setField("total21_4");
    obj.label204:setHorzTextAlign("center");
    obj.label204:setName("label204");

    obj.edit272 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout79);
    obj.edit272:setLeft(170);
    obj.edit272:setTop(0);
    obj.edit272:setWidth(30);
    obj.edit272:setHeight(25);
    obj.edit272:setType("number");
    obj.edit272:setMin(0);
    obj.edit272:setField("base1_4");
    obj.edit272:setName("edit272");

    obj.edit273 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout79);
    obj.edit273:setLeft(205);
    obj.edit273:setTop(0);
    obj.edit273:setWidth(30);
    obj.edit273:setHeight(25);
    obj.edit273:setType("number");
    obj.edit273:setMin(0);
    obj.edit273:setField("bonus1_4");
    obj.edit273:setName("edit273");

    obj.edit274 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout79);
    obj.edit274:setLeft(240);
    obj.edit274:setTop(0);
    obj.edit274:setWidth(30);
    obj.edit274:setHeight(25);
    obj.edit274:setType("number");
    obj.edit274:setMin(0);
    obj.edit274:setField("xp1_4");
    obj.edit274:setName("edit274");

    obj.edit275 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout79);
    obj.edit275:setLeft(20);
    obj.edit275:setTop(28);
    obj.edit275:setWidth(250);
    obj.edit275:setHeight(20);
    obj.edit275:setField("espec1_4");
    obj.edit275:setName("edit275");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout75);
    obj.layout80:setLeft(5);
    obj.layout80:setTop(250);
    obj.layout80:setWidth(270);
    obj.layout80:setHeight(50);
    obj.layout80:setName("layout80");

    obj.button115 = GUI.fromHandle(_obj_newObject("button"));
    obj.button115:setParent(obj.layout80);
    obj.button115:setLeft(0);
    obj.button115:setTop(0);
    obj.button115:setHeight(15);
    obj.button115:setWidth(15);
    obj.button115:setText("1");
    obj.button115:setFontSize(9);
    obj.button115:setName("button115");

    obj.button116 = GUI.fromHandle(_obj_newObject("button"));
    obj.button116:setParent(obj.layout80);
    obj.button116:setLeft(0);
    obj.button116:setTop(15);
    obj.button116:setHeight(15);
    obj.button116:setWidth(15);
    obj.button116:setText("2");
    obj.button116:setFontSize(9);
    obj.button116:setName("button116");

    obj.edit276 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout80);
    obj.edit276:setLeft(20);
    obj.edit276:setTop(0);
    obj.edit276:setWidth(100);
    obj.edit276:setHeight(25);
    obj.edit276:setField("nome1_5");
    obj.edit276:setName("edit276");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout80);
    obj.rectangle84:setLeft(125);
    obj.rectangle84:setTop(0);
    obj.rectangle84:setWidth(40);
    obj.rectangle84:setHeight(25);
    obj.rectangle84:setColor("Black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout80);
    obj.label205:setLeft(125);
    obj.label205:setTop(3);
    obj.label205:setWidth(40);
    obj.label205:setHeight(20);
    obj.label205:setField("total21_5");
    obj.label205:setHorzTextAlign("center");
    obj.label205:setName("label205");

    obj.edit277 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout80);
    obj.edit277:setLeft(170);
    obj.edit277:setTop(0);
    obj.edit277:setWidth(30);
    obj.edit277:setHeight(25);
    obj.edit277:setType("number");
    obj.edit277:setMin(0);
    obj.edit277:setField("base1_5");
    obj.edit277:setName("edit277");

    obj.edit278 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout80);
    obj.edit278:setLeft(205);
    obj.edit278:setTop(0);
    obj.edit278:setWidth(30);
    obj.edit278:setHeight(25);
    obj.edit278:setType("number");
    obj.edit278:setMin(0);
    obj.edit278:setField("bonus1_5");
    obj.edit278:setName("edit278");

    obj.edit279 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout80);
    obj.edit279:setLeft(240);
    obj.edit279:setTop(0);
    obj.edit279:setWidth(30);
    obj.edit279:setHeight(25);
    obj.edit279:setType("number");
    obj.edit279:setMin(0);
    obj.edit279:setField("xp1_5");
    obj.edit279:setName("edit279");

    obj.edit280 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout80);
    obj.edit280:setLeft(20);
    obj.edit280:setTop(28);
    obj.edit280:setWidth(250);
    obj.edit280:setHeight(20);
    obj.edit280:setField("espec1_5");
    obj.edit280:setName("edit280");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout75);
    obj.layout81:setLeft(5);
    obj.layout81:setTop(300);
    obj.layout81:setWidth(270);
    obj.layout81:setHeight(50);
    obj.layout81:setName("layout81");

    obj.button117 = GUI.fromHandle(_obj_newObject("button"));
    obj.button117:setParent(obj.layout81);
    obj.button117:setLeft(0);
    obj.button117:setTop(0);
    obj.button117:setHeight(15);
    obj.button117:setWidth(15);
    obj.button117:setText("1");
    obj.button117:setFontSize(9);
    obj.button117:setName("button117");

    obj.button118 = GUI.fromHandle(_obj_newObject("button"));
    obj.button118:setParent(obj.layout81);
    obj.button118:setLeft(0);
    obj.button118:setTop(15);
    obj.button118:setHeight(15);
    obj.button118:setWidth(15);
    obj.button118:setText("2");
    obj.button118:setFontSize(9);
    obj.button118:setName("button118");

    obj.edit281 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout81);
    obj.edit281:setLeft(20);
    obj.edit281:setTop(0);
    obj.edit281:setWidth(100);
    obj.edit281:setHeight(25);
    obj.edit281:setField("nome1_6");
    obj.edit281:setName("edit281");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout81);
    obj.rectangle85:setLeft(125);
    obj.rectangle85:setTop(0);
    obj.rectangle85:setWidth(40);
    obj.rectangle85:setHeight(25);
    obj.rectangle85:setColor("Black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout81);
    obj.label206:setLeft(125);
    obj.label206:setTop(3);
    obj.label206:setWidth(40);
    obj.label206:setHeight(20);
    obj.label206:setField("total21_6");
    obj.label206:setHorzTextAlign("center");
    obj.label206:setName("label206");

    obj.edit282 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout81);
    obj.edit282:setLeft(170);
    obj.edit282:setTop(0);
    obj.edit282:setWidth(30);
    obj.edit282:setHeight(25);
    obj.edit282:setType("number");
    obj.edit282:setMin(0);
    obj.edit282:setField("base1_6");
    obj.edit282:setName("edit282");

    obj.edit283 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout81);
    obj.edit283:setLeft(205);
    obj.edit283:setTop(0);
    obj.edit283:setWidth(30);
    obj.edit283:setHeight(25);
    obj.edit283:setType("number");
    obj.edit283:setMin(0);
    obj.edit283:setField("bonus1_6");
    obj.edit283:setName("edit283");

    obj.edit284 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout81);
    obj.edit284:setLeft(240);
    obj.edit284:setTop(0);
    obj.edit284:setWidth(30);
    obj.edit284:setHeight(25);
    obj.edit284:setType("number");
    obj.edit284:setMin(0);
    obj.edit284:setField("xp1_6");
    obj.edit284:setName("edit284");

    obj.edit285 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout81);
    obj.edit285:setLeft(20);
    obj.edit285:setTop(28);
    obj.edit285:setWidth(250);
    obj.edit285:setHeight(20);
    obj.edit285:setField("espec1_6");
    obj.edit285:setName("edit285");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout75);
    obj.layout82:setLeft(5);
    obj.layout82:setTop(350);
    obj.layout82:setWidth(270);
    obj.layout82:setHeight(50);
    obj.layout82:setName("layout82");

    obj.button119 = GUI.fromHandle(_obj_newObject("button"));
    obj.button119:setParent(obj.layout82);
    obj.button119:setLeft(0);
    obj.button119:setTop(0);
    obj.button119:setHeight(15);
    obj.button119:setWidth(15);
    obj.button119:setText("1");
    obj.button119:setFontSize(9);
    obj.button119:setName("button119");

    obj.button120 = GUI.fromHandle(_obj_newObject("button"));
    obj.button120:setParent(obj.layout82);
    obj.button120:setLeft(0);
    obj.button120:setTop(15);
    obj.button120:setHeight(15);
    obj.button120:setWidth(15);
    obj.button120:setText("2");
    obj.button120:setFontSize(9);
    obj.button120:setName("button120");

    obj.edit286 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout82);
    obj.edit286:setLeft(20);
    obj.edit286:setTop(0);
    obj.edit286:setWidth(100);
    obj.edit286:setHeight(25);
    obj.edit286:setField("nome1_7");
    obj.edit286:setName("edit286");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout82);
    obj.rectangle86:setLeft(125);
    obj.rectangle86:setTop(0);
    obj.rectangle86:setWidth(40);
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("Black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout82);
    obj.label207:setLeft(125);
    obj.label207:setTop(3);
    obj.label207:setWidth(40);
    obj.label207:setHeight(20);
    obj.label207:setField("total21_7");
    obj.label207:setHorzTextAlign("center");
    obj.label207:setName("label207");

    obj.edit287 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout82);
    obj.edit287:setLeft(170);
    obj.edit287:setTop(0);
    obj.edit287:setWidth(30);
    obj.edit287:setHeight(25);
    obj.edit287:setType("number");
    obj.edit287:setMin(0);
    obj.edit287:setField("base1_7");
    obj.edit287:setName("edit287");

    obj.edit288 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout82);
    obj.edit288:setLeft(205);
    obj.edit288:setTop(0);
    obj.edit288:setWidth(30);
    obj.edit288:setHeight(25);
    obj.edit288:setType("number");
    obj.edit288:setMin(0);
    obj.edit288:setField("bonus1_7");
    obj.edit288:setName("edit288");

    obj.edit289 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout82);
    obj.edit289:setLeft(240);
    obj.edit289:setTop(0);
    obj.edit289:setWidth(30);
    obj.edit289:setHeight(25);
    obj.edit289:setType("number");
    obj.edit289:setMin(0);
    obj.edit289:setField("xp1_7");
    obj.edit289:setName("edit289");

    obj.edit290 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout82);
    obj.edit290:setLeft(20);
    obj.edit290:setTop(28);
    obj.edit290:setWidth(250);
    obj.edit290:setHeight(20);
    obj.edit290:setField("espec1_7");
    obj.edit290:setName("edit290");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout75);
    obj.layout83:setLeft(5);
    obj.layout83:setTop(400);
    obj.layout83:setWidth(270);
    obj.layout83:setHeight(50);
    obj.layout83:setName("layout83");

    obj.button121 = GUI.fromHandle(_obj_newObject("button"));
    obj.button121:setParent(obj.layout83);
    obj.button121:setLeft(0);
    obj.button121:setTop(0);
    obj.button121:setHeight(15);
    obj.button121:setWidth(15);
    obj.button121:setText("1");
    obj.button121:setFontSize(9);
    obj.button121:setName("button121");

    obj.button122 = GUI.fromHandle(_obj_newObject("button"));
    obj.button122:setParent(obj.layout83);
    obj.button122:setLeft(0);
    obj.button122:setTop(15);
    obj.button122:setHeight(15);
    obj.button122:setWidth(15);
    obj.button122:setText("2");
    obj.button122:setFontSize(9);
    obj.button122:setName("button122");

    obj.edit291 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout83);
    obj.edit291:setLeft(20);
    obj.edit291:setTop(0);
    obj.edit291:setWidth(100);
    obj.edit291:setHeight(25);
    obj.edit291:setField("nome1_8");
    obj.edit291:setName("edit291");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout83);
    obj.rectangle87:setLeft(125);
    obj.rectangle87:setTop(0);
    obj.rectangle87:setWidth(40);
    obj.rectangle87:setHeight(25);
    obj.rectangle87:setColor("Black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout83);
    obj.label208:setLeft(125);
    obj.label208:setTop(3);
    obj.label208:setWidth(40);
    obj.label208:setHeight(20);
    obj.label208:setField("total21_8");
    obj.label208:setHorzTextAlign("center");
    obj.label208:setName("label208");

    obj.edit292 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout83);
    obj.edit292:setLeft(170);
    obj.edit292:setTop(0);
    obj.edit292:setWidth(30);
    obj.edit292:setHeight(25);
    obj.edit292:setType("number");
    obj.edit292:setMin(0);
    obj.edit292:setField("base1_8");
    obj.edit292:setName("edit292");

    obj.edit293 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout83);
    obj.edit293:setLeft(205);
    obj.edit293:setTop(0);
    obj.edit293:setWidth(30);
    obj.edit293:setHeight(25);
    obj.edit293:setType("number");
    obj.edit293:setMin(0);
    obj.edit293:setField("bonus1_8");
    obj.edit293:setName("edit293");

    obj.edit294 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout83);
    obj.edit294:setLeft(240);
    obj.edit294:setTop(0);
    obj.edit294:setWidth(30);
    obj.edit294:setHeight(25);
    obj.edit294:setType("number");
    obj.edit294:setMin(0);
    obj.edit294:setField("xp1_8");
    obj.edit294:setName("edit294");

    obj.edit295 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout83);
    obj.edit295:setLeft(20);
    obj.edit295:setTop(28);
    obj.edit295:setWidth(250);
    obj.edit295:setHeight(20);
    obj.edit295:setField("espec1_8");
    obj.edit295:setName("edit295");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout75);
    obj.layout84:setLeft(5);
    obj.layout84:setTop(450);
    obj.layout84:setWidth(270);
    obj.layout84:setHeight(50);
    obj.layout84:setName("layout84");

    obj.button123 = GUI.fromHandle(_obj_newObject("button"));
    obj.button123:setParent(obj.layout84);
    obj.button123:setLeft(0);
    obj.button123:setTop(0);
    obj.button123:setHeight(15);
    obj.button123:setWidth(15);
    obj.button123:setText("1");
    obj.button123:setFontSize(9);
    obj.button123:setName("button123");

    obj.button124 = GUI.fromHandle(_obj_newObject("button"));
    obj.button124:setParent(obj.layout84);
    obj.button124:setLeft(0);
    obj.button124:setTop(15);
    obj.button124:setHeight(15);
    obj.button124:setWidth(15);
    obj.button124:setText("2");
    obj.button124:setFontSize(9);
    obj.button124:setName("button124");

    obj.edit296 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout84);
    obj.edit296:setLeft(20);
    obj.edit296:setTop(0);
    obj.edit296:setWidth(100);
    obj.edit296:setHeight(25);
    obj.edit296:setField("nome1_9");
    obj.edit296:setName("edit296");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout84);
    obj.rectangle88:setLeft(125);
    obj.rectangle88:setTop(0);
    obj.rectangle88:setWidth(40);
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("Black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout84);
    obj.label209:setLeft(125);
    obj.label209:setTop(3);
    obj.label209:setWidth(40);
    obj.label209:setHeight(20);
    obj.label209:setField("total21_9");
    obj.label209:setHorzTextAlign("center");
    obj.label209:setName("label209");

    obj.edit297 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout84);
    obj.edit297:setLeft(170);
    obj.edit297:setTop(0);
    obj.edit297:setWidth(30);
    obj.edit297:setHeight(25);
    obj.edit297:setType("number");
    obj.edit297:setMin(0);
    obj.edit297:setField("base1_9");
    obj.edit297:setName("edit297");

    obj.edit298 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout84);
    obj.edit298:setLeft(205);
    obj.edit298:setTop(0);
    obj.edit298:setWidth(30);
    obj.edit298:setHeight(25);
    obj.edit298:setType("number");
    obj.edit298:setMin(0);
    obj.edit298:setField("bonus1_9");
    obj.edit298:setName("edit298");

    obj.edit299 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout84);
    obj.edit299:setLeft(240);
    obj.edit299:setTop(0);
    obj.edit299:setWidth(30);
    obj.edit299:setHeight(25);
    obj.edit299:setType("number");
    obj.edit299:setMin(0);
    obj.edit299:setField("xp1_9");
    obj.edit299:setName("edit299");

    obj.edit300 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout84);
    obj.edit300:setLeft(20);
    obj.edit300:setTop(28);
    obj.edit300:setWidth(250);
    obj.edit300:setHeight(20);
    obj.edit300:setField("espec1_9");
    obj.edit300:setName("edit300");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout75);
    obj.layout85:setLeft(5);
    obj.layout85:setTop(500);
    obj.layout85:setWidth(270);
    obj.layout85:setHeight(50);
    obj.layout85:setName("layout85");

    obj.button125 = GUI.fromHandle(_obj_newObject("button"));
    obj.button125:setParent(obj.layout85);
    obj.button125:setLeft(0);
    obj.button125:setTop(0);
    obj.button125:setHeight(15);
    obj.button125:setWidth(15);
    obj.button125:setText("1");
    obj.button125:setFontSize(9);
    obj.button125:setName("button125");

    obj.button126 = GUI.fromHandle(_obj_newObject("button"));
    obj.button126:setParent(obj.layout85);
    obj.button126:setLeft(0);
    obj.button126:setTop(15);
    obj.button126:setHeight(15);
    obj.button126:setWidth(15);
    obj.button126:setText("2");
    obj.button126:setFontSize(9);
    obj.button126:setName("button126");

    obj.edit301 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout85);
    obj.edit301:setLeft(20);
    obj.edit301:setTop(0);
    obj.edit301:setWidth(100);
    obj.edit301:setHeight(25);
    obj.edit301:setField("nome1_10");
    obj.edit301:setName("edit301");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout85);
    obj.rectangle89:setLeft(125);
    obj.rectangle89:setTop(0);
    obj.rectangle89:setWidth(40);
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("Black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout85);
    obj.label210:setLeft(125);
    obj.label210:setTop(3);
    obj.label210:setWidth(40);
    obj.label210:setHeight(20);
    obj.label210:setField("total21_10");
    obj.label210:setHorzTextAlign("center");
    obj.label210:setName("label210");

    obj.edit302 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout85);
    obj.edit302:setLeft(170);
    obj.edit302:setTop(0);
    obj.edit302:setWidth(30);
    obj.edit302:setHeight(25);
    obj.edit302:setType("number");
    obj.edit302:setMin(0);
    obj.edit302:setField("base1_10");
    obj.edit302:setName("edit302");

    obj.edit303 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout85);
    obj.edit303:setLeft(205);
    obj.edit303:setTop(0);
    obj.edit303:setWidth(30);
    obj.edit303:setHeight(25);
    obj.edit303:setType("number");
    obj.edit303:setMin(0);
    obj.edit303:setField("bonus1_10");
    obj.edit303:setName("edit303");

    obj.edit304 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout85);
    obj.edit304:setLeft(240);
    obj.edit304:setTop(0);
    obj.edit304:setWidth(30);
    obj.edit304:setHeight(25);
    obj.edit304:setType("number");
    obj.edit304:setMin(0);
    obj.edit304:setField("xp1_10");
    obj.edit304:setName("edit304");

    obj.edit305 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout85);
    obj.edit305:setLeft(20);
    obj.edit305:setTop(28);
    obj.edit305:setWidth(250);
    obj.edit305:setHeight(20);
    obj.edit305:setField("espec1_10");
    obj.edit305:setName("edit305");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout75);
    obj.layout86:setLeft(5);
    obj.layout86:setTop(550);
    obj.layout86:setWidth(270);
    obj.layout86:setHeight(50);
    obj.layout86:setName("layout86");

    obj.button127 = GUI.fromHandle(_obj_newObject("button"));
    obj.button127:setParent(obj.layout86);
    obj.button127:setLeft(0);
    obj.button127:setTop(0);
    obj.button127:setHeight(15);
    obj.button127:setWidth(15);
    obj.button127:setText("1");
    obj.button127:setFontSize(9);
    obj.button127:setName("button127");

    obj.button128 = GUI.fromHandle(_obj_newObject("button"));
    obj.button128:setParent(obj.layout86);
    obj.button128:setLeft(0);
    obj.button128:setTop(15);
    obj.button128:setHeight(15);
    obj.button128:setWidth(15);
    obj.button128:setText("2");
    obj.button128:setFontSize(9);
    obj.button128:setName("button128");

    obj.edit306 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout86);
    obj.edit306:setLeft(20);
    obj.edit306:setTop(0);
    obj.edit306:setWidth(100);
    obj.edit306:setHeight(25);
    obj.edit306:setField("nome1_11");
    obj.edit306:setName("edit306");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout86);
    obj.rectangle90:setLeft(125);
    obj.rectangle90:setTop(0);
    obj.rectangle90:setWidth(40);
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("Black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout86);
    obj.label211:setLeft(125);
    obj.label211:setTop(3);
    obj.label211:setWidth(40);
    obj.label211:setHeight(20);
    obj.label211:setField("total21_11");
    obj.label211:setHorzTextAlign("center");
    obj.label211:setName("label211");

    obj.edit307 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout86);
    obj.edit307:setLeft(170);
    obj.edit307:setTop(0);
    obj.edit307:setWidth(30);
    obj.edit307:setHeight(25);
    obj.edit307:setType("number");
    obj.edit307:setMin(0);
    obj.edit307:setField("base1_11");
    obj.edit307:setName("edit307");

    obj.edit308 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout86);
    obj.edit308:setLeft(205);
    obj.edit308:setTop(0);
    obj.edit308:setWidth(30);
    obj.edit308:setHeight(25);
    obj.edit308:setType("number");
    obj.edit308:setMin(0);
    obj.edit308:setField("bonus1_11");
    obj.edit308:setName("edit308");

    obj.edit309 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout86);
    obj.edit309:setLeft(240);
    obj.edit309:setTop(0);
    obj.edit309:setWidth(30);
    obj.edit309:setHeight(25);
    obj.edit309:setType("number");
    obj.edit309:setMin(0);
    obj.edit309:setField("xp1_11");
    obj.edit309:setName("edit309");

    obj.edit310 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout86);
    obj.edit310:setLeft(20);
    obj.edit310:setTop(28);
    obj.edit310:setWidth(250);
    obj.edit310:setHeight(20);
    obj.edit310:setField("espec1_11");
    obj.edit310:setName("edit310");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout75);
    obj.layout87:setLeft(5);
    obj.layout87:setTop(600);
    obj.layout87:setWidth(270);
    obj.layout87:setHeight(50);
    obj.layout87:setName("layout87");

    obj.button129 = GUI.fromHandle(_obj_newObject("button"));
    obj.button129:setParent(obj.layout87);
    obj.button129:setLeft(0);
    obj.button129:setTop(0);
    obj.button129:setHeight(15);
    obj.button129:setWidth(15);
    obj.button129:setText("1");
    obj.button129:setFontSize(9);
    obj.button129:setName("button129");

    obj.button130 = GUI.fromHandle(_obj_newObject("button"));
    obj.button130:setParent(obj.layout87);
    obj.button130:setLeft(0);
    obj.button130:setTop(15);
    obj.button130:setHeight(15);
    obj.button130:setWidth(15);
    obj.button130:setText("2");
    obj.button130:setFontSize(9);
    obj.button130:setName("button130");

    obj.edit311 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout87);
    obj.edit311:setLeft(20);
    obj.edit311:setTop(0);
    obj.edit311:setWidth(100);
    obj.edit311:setHeight(25);
    obj.edit311:setField("nome1_12");
    obj.edit311:setName("edit311");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout87);
    obj.rectangle91:setLeft(125);
    obj.rectangle91:setTop(0);
    obj.rectangle91:setWidth(40);
    obj.rectangle91:setHeight(25);
    obj.rectangle91:setColor("Black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout87);
    obj.label212:setLeft(125);
    obj.label212:setTop(3);
    obj.label212:setWidth(40);
    obj.label212:setHeight(20);
    obj.label212:setField("total21_12");
    obj.label212:setHorzTextAlign("center");
    obj.label212:setName("label212");

    obj.edit312 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout87);
    obj.edit312:setLeft(170);
    obj.edit312:setTop(0);
    obj.edit312:setWidth(30);
    obj.edit312:setHeight(25);
    obj.edit312:setType("number");
    obj.edit312:setMin(0);
    obj.edit312:setField("base1_12");
    obj.edit312:setName("edit312");

    obj.edit313 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout87);
    obj.edit313:setLeft(205);
    obj.edit313:setTop(0);
    obj.edit313:setWidth(30);
    obj.edit313:setHeight(25);
    obj.edit313:setType("number");
    obj.edit313:setMin(0);
    obj.edit313:setField("bonus1_12");
    obj.edit313:setName("edit313");

    obj.edit314 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout87);
    obj.edit314:setLeft(240);
    obj.edit314:setTop(0);
    obj.edit314:setWidth(30);
    obj.edit314:setHeight(25);
    obj.edit314:setType("number");
    obj.edit314:setMin(0);
    obj.edit314:setField("xp1_12");
    obj.edit314:setName("edit314");

    obj.edit315 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout87);
    obj.edit315:setLeft(20);
    obj.edit315:setTop(28);
    obj.edit315:setWidth(250);
    obj.edit315:setHeight(20);
    obj.edit315:setField("espec1_12");
    obj.edit315:setName("edit315");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox4);
    obj.layout88:setLeft(900);
    obj.layout88:setTop(0);
    obj.layout88:setWidth(280);
    obj.layout88:setHeight(630);
    obj.layout88:setName("layout88");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout88);
    obj.rectangle92:setLeft(0);
    obj.rectangle92:setTop(0);
    obj.rectangle92:setWidth(280);
    obj.rectangle92:setHeight(630);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setXradius(15);
    obj.rectangle92:setYradius(15);
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setName("rectangle92");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout88);
    obj.label213:setLeft(5);
    obj.label213:setTop(0);
    obj.label213:setWidth(240);
    obj.label213:setHeight(20);
    obj.label213:setText("CONHECIMENTOS MENTAIS");
    obj.label213:setHorzTextAlign("center");
    obj.label213:setName("label213");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout88);
    obj.label214:setLeft(25);
    obj.label214:setTop(25);
    obj.label214:setWidth(315);
    obj.label214:setHeight(20);
    obj.label214:setText(" Nome");
    obj.label214:setName("label214");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout88);
    obj.label215:setLeft(135);
    obj.label215:setTop(25);
    obj.label215:setWidth(315);
    obj.label215:setHeight(20);
    obj.label215:setText("Total");
    obj.label215:setName("label215");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout88);
    obj.label216:setLeft(170);
    obj.label216:setTop(25);
    obj.label216:setWidth(315);
    obj.label216:setHeight(20);
    obj.label216:setText(" Inic");
    obj.label216:setName("label216");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout88);
    obj.label217:setLeft(202);
    obj.label217:setTop(25);
    obj.label217:setWidth(315);
    obj.label217:setHeight(20);
    obj.label217:setText(" Apr.");
    obj.label217:setName("label217");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout88);
    obj.label218:setLeft(235);
    obj.label218:setTop(25);
    obj.label218:setWidth(315);
    obj.label218:setHeight(20);
    obj.label218:setText("  XP");
    obj.label218:setName("label218");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout88);
    obj.layout89:setLeft(5);
    obj.layout89:setTop(50);
    obj.layout89:setWidth(270);
    obj.layout89:setHeight(50);
    obj.layout89:setName("layout89");

    obj.button131 = GUI.fromHandle(_obj_newObject("button"));
    obj.button131:setParent(obj.layout89);
    obj.button131:setLeft(0);
    obj.button131:setTop(0);
    obj.button131:setHeight(15);
    obj.button131:setWidth(15);
    obj.button131:setText("1");
    obj.button131:setFontSize(9);
    obj.button131:setName("button131");

    obj.button132 = GUI.fromHandle(_obj_newObject("button"));
    obj.button132:setParent(obj.layout89);
    obj.button132:setLeft(0);
    obj.button132:setTop(15);
    obj.button132:setHeight(15);
    obj.button132:setWidth(15);
    obj.button132:setText("2");
    obj.button132:setFontSize(9);
    obj.button132:setName("button132");

    obj.edit316 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout89);
    obj.edit316:setLeft(20);
    obj.edit316:setTop(0);
    obj.edit316:setWidth(100);
    obj.edit316:setHeight(25);
    obj.edit316:setField("nome3_1");
    obj.edit316:setName("edit316");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout89);
    obj.rectangle93:setLeft(125);
    obj.rectangle93:setTop(0);
    obj.rectangle93:setWidth(40);
    obj.rectangle93:setHeight(25);
    obj.rectangle93:setColor("Black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout89);
    obj.label219:setLeft(125);
    obj.label219:setTop(3);
    obj.label219:setWidth(40);
    obj.label219:setHeight(20);
    obj.label219:setField("total23_1");
    obj.label219:setHorzTextAlign("center");
    obj.label219:setName("label219");

    obj.edit317 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout89);
    obj.edit317:setLeft(170);
    obj.edit317:setTop(0);
    obj.edit317:setWidth(30);
    obj.edit317:setHeight(25);
    obj.edit317:setType("number");
    obj.edit317:setMin(0);
    obj.edit317:setField("base3_1");
    obj.edit317:setName("edit317");

    obj.edit318 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout89);
    obj.edit318:setLeft(205);
    obj.edit318:setTop(0);
    obj.edit318:setWidth(30);
    obj.edit318:setHeight(25);
    obj.edit318:setType("number");
    obj.edit318:setMin(0);
    obj.edit318:setField("bonus3_1");
    obj.edit318:setName("edit318");

    obj.edit319 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout89);
    obj.edit319:setLeft(240);
    obj.edit319:setTop(0);
    obj.edit319:setWidth(30);
    obj.edit319:setHeight(25);
    obj.edit319:setType("number");
    obj.edit319:setMin(0);
    obj.edit319:setField("xp3_1");
    obj.edit319:setName("edit319");

    obj.edit320 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout89);
    obj.edit320:setLeft(20);
    obj.edit320:setTop(28);
    obj.edit320:setWidth(250);
    obj.edit320:setHeight(20);
    obj.edit320:setField("espec3_1");
    obj.edit320:setName("edit320");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout88);
    obj.layout90:setLeft(5);
    obj.layout90:setTop(100);
    obj.layout90:setWidth(270);
    obj.layout90:setHeight(50);
    obj.layout90:setName("layout90");

    obj.button133 = GUI.fromHandle(_obj_newObject("button"));
    obj.button133:setParent(obj.layout90);
    obj.button133:setLeft(0);
    obj.button133:setTop(0);
    obj.button133:setHeight(15);
    obj.button133:setWidth(15);
    obj.button133:setText("1");
    obj.button133:setFontSize(9);
    obj.button133:setName("button133");

    obj.button134 = GUI.fromHandle(_obj_newObject("button"));
    obj.button134:setParent(obj.layout90);
    obj.button134:setLeft(0);
    obj.button134:setTop(15);
    obj.button134:setHeight(15);
    obj.button134:setWidth(15);
    obj.button134:setText("2");
    obj.button134:setFontSize(9);
    obj.button134:setName("button134");

    obj.edit321 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout90);
    obj.edit321:setLeft(20);
    obj.edit321:setTop(0);
    obj.edit321:setWidth(100);
    obj.edit321:setHeight(25);
    obj.edit321:setField("nome3_2");
    obj.edit321:setName("edit321");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout90);
    obj.rectangle94:setLeft(125);
    obj.rectangle94:setTop(0);
    obj.rectangle94:setWidth(40);
    obj.rectangle94:setHeight(25);
    obj.rectangle94:setColor("Black");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setName("rectangle94");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout90);
    obj.label220:setLeft(125);
    obj.label220:setTop(3);
    obj.label220:setWidth(40);
    obj.label220:setHeight(20);
    obj.label220:setField("total23_2");
    obj.label220:setHorzTextAlign("center");
    obj.label220:setName("label220");

    obj.edit322 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout90);
    obj.edit322:setLeft(170);
    obj.edit322:setTop(0);
    obj.edit322:setWidth(30);
    obj.edit322:setHeight(25);
    obj.edit322:setType("number");
    obj.edit322:setMin(0);
    obj.edit322:setField("base3_2");
    obj.edit322:setName("edit322");

    obj.edit323 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout90);
    obj.edit323:setLeft(205);
    obj.edit323:setTop(0);
    obj.edit323:setWidth(30);
    obj.edit323:setHeight(25);
    obj.edit323:setType("number");
    obj.edit323:setMin(0);
    obj.edit323:setField("bonus3_2");
    obj.edit323:setName("edit323");

    obj.edit324 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout90);
    obj.edit324:setLeft(240);
    obj.edit324:setTop(0);
    obj.edit324:setWidth(30);
    obj.edit324:setHeight(25);
    obj.edit324:setType("number");
    obj.edit324:setMin(0);
    obj.edit324:setField("xp3_2");
    obj.edit324:setName("edit324");

    obj.edit325 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout90);
    obj.edit325:setLeft(20);
    obj.edit325:setTop(28);
    obj.edit325:setWidth(250);
    obj.edit325:setHeight(20);
    obj.edit325:setField("espec3_2");
    obj.edit325:setName("edit325");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout88);
    obj.layout91:setLeft(5);
    obj.layout91:setTop(150);
    obj.layout91:setWidth(270);
    obj.layout91:setHeight(50);
    obj.layout91:setName("layout91");

    obj.button135 = GUI.fromHandle(_obj_newObject("button"));
    obj.button135:setParent(obj.layout91);
    obj.button135:setLeft(0);
    obj.button135:setTop(0);
    obj.button135:setHeight(15);
    obj.button135:setWidth(15);
    obj.button135:setText("1");
    obj.button135:setFontSize(9);
    obj.button135:setName("button135");

    obj.button136 = GUI.fromHandle(_obj_newObject("button"));
    obj.button136:setParent(obj.layout91);
    obj.button136:setLeft(0);
    obj.button136:setTop(15);
    obj.button136:setHeight(15);
    obj.button136:setWidth(15);
    obj.button136:setText("2");
    obj.button136:setFontSize(9);
    obj.button136:setName("button136");

    obj.edit326 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout91);
    obj.edit326:setLeft(20);
    obj.edit326:setTop(0);
    obj.edit326:setWidth(100);
    obj.edit326:setHeight(25);
    obj.edit326:setField("nome3_3");
    obj.edit326:setName("edit326");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout91);
    obj.rectangle95:setLeft(125);
    obj.rectangle95:setTop(0);
    obj.rectangle95:setWidth(40);
    obj.rectangle95:setHeight(25);
    obj.rectangle95:setColor("Black");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setName("rectangle95");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout91);
    obj.label221:setLeft(125);
    obj.label221:setTop(3);
    obj.label221:setWidth(40);
    obj.label221:setHeight(20);
    obj.label221:setField("total23_3");
    obj.label221:setHorzTextAlign("center");
    obj.label221:setName("label221");

    obj.edit327 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout91);
    obj.edit327:setLeft(170);
    obj.edit327:setTop(0);
    obj.edit327:setWidth(30);
    obj.edit327:setHeight(25);
    obj.edit327:setType("number");
    obj.edit327:setMin(0);
    obj.edit327:setField("base3_3");
    obj.edit327:setName("edit327");

    obj.edit328 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout91);
    obj.edit328:setLeft(205);
    obj.edit328:setTop(0);
    obj.edit328:setWidth(30);
    obj.edit328:setHeight(25);
    obj.edit328:setType("number");
    obj.edit328:setMin(0);
    obj.edit328:setField("bonus3_3");
    obj.edit328:setName("edit328");

    obj.edit329 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout91);
    obj.edit329:setLeft(240);
    obj.edit329:setTop(0);
    obj.edit329:setWidth(30);
    obj.edit329:setHeight(25);
    obj.edit329:setType("number");
    obj.edit329:setMin(0);
    obj.edit329:setField("xp3_3");
    obj.edit329:setName("edit329");

    obj.edit330 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout91);
    obj.edit330:setLeft(20);
    obj.edit330:setTop(28);
    obj.edit330:setWidth(250);
    obj.edit330:setHeight(20);
    obj.edit330:setField("espec3_3");
    obj.edit330:setName("edit330");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout88);
    obj.layout92:setLeft(5);
    obj.layout92:setTop(200);
    obj.layout92:setWidth(270);
    obj.layout92:setHeight(50);
    obj.layout92:setName("layout92");

    obj.button137 = GUI.fromHandle(_obj_newObject("button"));
    obj.button137:setParent(obj.layout92);
    obj.button137:setLeft(0);
    obj.button137:setTop(0);
    obj.button137:setHeight(15);
    obj.button137:setWidth(15);
    obj.button137:setText("1");
    obj.button137:setFontSize(9);
    obj.button137:setName("button137");

    obj.button138 = GUI.fromHandle(_obj_newObject("button"));
    obj.button138:setParent(obj.layout92);
    obj.button138:setLeft(0);
    obj.button138:setTop(15);
    obj.button138:setHeight(15);
    obj.button138:setWidth(15);
    obj.button138:setText("2");
    obj.button138:setFontSize(9);
    obj.button138:setName("button138");

    obj.edit331 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout92);
    obj.edit331:setLeft(20);
    obj.edit331:setTop(0);
    obj.edit331:setWidth(100);
    obj.edit331:setHeight(25);
    obj.edit331:setField("nome3_4");
    obj.edit331:setName("edit331");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout92);
    obj.rectangle96:setLeft(125);
    obj.rectangle96:setTop(0);
    obj.rectangle96:setWidth(40);
    obj.rectangle96:setHeight(25);
    obj.rectangle96:setColor("Black");
    obj.rectangle96:setStrokeColor("white");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setName("rectangle96");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout92);
    obj.label222:setLeft(125);
    obj.label222:setTop(3);
    obj.label222:setWidth(40);
    obj.label222:setHeight(20);
    obj.label222:setField("total23_4");
    obj.label222:setHorzTextAlign("center");
    obj.label222:setName("label222");

    obj.edit332 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout92);
    obj.edit332:setLeft(170);
    obj.edit332:setTop(0);
    obj.edit332:setWidth(30);
    obj.edit332:setHeight(25);
    obj.edit332:setType("number");
    obj.edit332:setMin(0);
    obj.edit332:setField("base3_4");
    obj.edit332:setName("edit332");

    obj.edit333 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout92);
    obj.edit333:setLeft(205);
    obj.edit333:setTop(0);
    obj.edit333:setWidth(30);
    obj.edit333:setHeight(25);
    obj.edit333:setType("number");
    obj.edit333:setMin(0);
    obj.edit333:setField("bonus3_4");
    obj.edit333:setName("edit333");

    obj.edit334 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout92);
    obj.edit334:setLeft(240);
    obj.edit334:setTop(0);
    obj.edit334:setWidth(30);
    obj.edit334:setHeight(25);
    obj.edit334:setType("number");
    obj.edit334:setMin(0);
    obj.edit334:setField("xp3_4");
    obj.edit334:setName("edit334");

    obj.edit335 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout92);
    obj.edit335:setLeft(20);
    obj.edit335:setTop(28);
    obj.edit335:setWidth(250);
    obj.edit335:setHeight(20);
    obj.edit335:setField("espec3_4");
    obj.edit335:setName("edit335");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout88);
    obj.layout93:setLeft(5);
    obj.layout93:setTop(250);
    obj.layout93:setWidth(270);
    obj.layout93:setHeight(50);
    obj.layout93:setName("layout93");

    obj.button139 = GUI.fromHandle(_obj_newObject("button"));
    obj.button139:setParent(obj.layout93);
    obj.button139:setLeft(0);
    obj.button139:setTop(0);
    obj.button139:setHeight(15);
    obj.button139:setWidth(15);
    obj.button139:setText("1");
    obj.button139:setFontSize(9);
    obj.button139:setName("button139");

    obj.button140 = GUI.fromHandle(_obj_newObject("button"));
    obj.button140:setParent(obj.layout93);
    obj.button140:setLeft(0);
    obj.button140:setTop(15);
    obj.button140:setHeight(15);
    obj.button140:setWidth(15);
    obj.button140:setText("2");
    obj.button140:setFontSize(9);
    obj.button140:setName("button140");

    obj.edit336 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout93);
    obj.edit336:setLeft(20);
    obj.edit336:setTop(0);
    obj.edit336:setWidth(100);
    obj.edit336:setHeight(25);
    obj.edit336:setField("nome3_5");
    obj.edit336:setName("edit336");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout93);
    obj.rectangle97:setLeft(125);
    obj.rectangle97:setTop(0);
    obj.rectangle97:setWidth(40);
    obj.rectangle97:setHeight(25);
    obj.rectangle97:setColor("Black");
    obj.rectangle97:setStrokeColor("white");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setName("rectangle97");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout93);
    obj.label223:setLeft(125);
    obj.label223:setTop(3);
    obj.label223:setWidth(40);
    obj.label223:setHeight(20);
    obj.label223:setField("total23_5");
    obj.label223:setHorzTextAlign("center");
    obj.label223:setName("label223");

    obj.edit337 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout93);
    obj.edit337:setLeft(170);
    obj.edit337:setTop(0);
    obj.edit337:setWidth(30);
    obj.edit337:setHeight(25);
    obj.edit337:setType("number");
    obj.edit337:setMin(0);
    obj.edit337:setField("base3_5");
    obj.edit337:setName("edit337");

    obj.edit338 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout93);
    obj.edit338:setLeft(205);
    obj.edit338:setTop(0);
    obj.edit338:setWidth(30);
    obj.edit338:setHeight(25);
    obj.edit338:setType("number");
    obj.edit338:setMin(0);
    obj.edit338:setField("bonus3_5");
    obj.edit338:setName("edit338");

    obj.edit339 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout93);
    obj.edit339:setLeft(240);
    obj.edit339:setTop(0);
    obj.edit339:setWidth(30);
    obj.edit339:setHeight(25);
    obj.edit339:setType("number");
    obj.edit339:setMin(0);
    obj.edit339:setField("xp3_5");
    obj.edit339:setName("edit339");

    obj.edit340 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout93);
    obj.edit340:setLeft(20);
    obj.edit340:setTop(28);
    obj.edit340:setWidth(250);
    obj.edit340:setHeight(20);
    obj.edit340:setField("espec3_5");
    obj.edit340:setName("edit340");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout88);
    obj.layout94:setLeft(5);
    obj.layout94:setTop(300);
    obj.layout94:setWidth(270);
    obj.layout94:setHeight(50);
    obj.layout94:setName("layout94");

    obj.button141 = GUI.fromHandle(_obj_newObject("button"));
    obj.button141:setParent(obj.layout94);
    obj.button141:setLeft(0);
    obj.button141:setTop(0);
    obj.button141:setHeight(15);
    obj.button141:setWidth(15);
    obj.button141:setText("1");
    obj.button141:setFontSize(9);
    obj.button141:setName("button141");

    obj.button142 = GUI.fromHandle(_obj_newObject("button"));
    obj.button142:setParent(obj.layout94);
    obj.button142:setLeft(0);
    obj.button142:setTop(15);
    obj.button142:setHeight(15);
    obj.button142:setWidth(15);
    obj.button142:setText("2");
    obj.button142:setFontSize(9);
    obj.button142:setName("button142");

    obj.edit341 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout94);
    obj.edit341:setLeft(20);
    obj.edit341:setTop(0);
    obj.edit341:setWidth(100);
    obj.edit341:setHeight(25);
    obj.edit341:setField("nome3_6");
    obj.edit341:setName("edit341");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout94);
    obj.rectangle98:setLeft(125);
    obj.rectangle98:setTop(0);
    obj.rectangle98:setWidth(40);
    obj.rectangle98:setHeight(25);
    obj.rectangle98:setColor("Black");
    obj.rectangle98:setStrokeColor("white");
    obj.rectangle98:setStrokeSize(1);
    obj.rectangle98:setName("rectangle98");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout94);
    obj.label224:setLeft(125);
    obj.label224:setTop(3);
    obj.label224:setWidth(40);
    obj.label224:setHeight(20);
    obj.label224:setField("total23_6");
    obj.label224:setHorzTextAlign("center");
    obj.label224:setName("label224");

    obj.edit342 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout94);
    obj.edit342:setLeft(170);
    obj.edit342:setTop(0);
    obj.edit342:setWidth(30);
    obj.edit342:setHeight(25);
    obj.edit342:setType("number");
    obj.edit342:setMin(0);
    obj.edit342:setField("base3_6");
    obj.edit342:setName("edit342");

    obj.edit343 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout94);
    obj.edit343:setLeft(205);
    obj.edit343:setTop(0);
    obj.edit343:setWidth(30);
    obj.edit343:setHeight(25);
    obj.edit343:setType("number");
    obj.edit343:setMin(0);
    obj.edit343:setField("bonus3_6");
    obj.edit343:setName("edit343");

    obj.edit344 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout94);
    obj.edit344:setLeft(240);
    obj.edit344:setTop(0);
    obj.edit344:setWidth(30);
    obj.edit344:setHeight(25);
    obj.edit344:setType("number");
    obj.edit344:setMin(0);
    obj.edit344:setField("xp3_6");
    obj.edit344:setName("edit344");

    obj.edit345 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout94);
    obj.edit345:setLeft(20);
    obj.edit345:setTop(28);
    obj.edit345:setWidth(250);
    obj.edit345:setHeight(20);
    obj.edit345:setField("espec3_6");
    obj.edit345:setName("edit345");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout88);
    obj.layout95:setLeft(5);
    obj.layout95:setTop(350);
    obj.layout95:setWidth(270);
    obj.layout95:setHeight(50);
    obj.layout95:setName("layout95");

    obj.button143 = GUI.fromHandle(_obj_newObject("button"));
    obj.button143:setParent(obj.layout95);
    obj.button143:setLeft(0);
    obj.button143:setTop(0);
    obj.button143:setHeight(15);
    obj.button143:setWidth(15);
    obj.button143:setText("1");
    obj.button143:setFontSize(9);
    obj.button143:setName("button143");

    obj.button144 = GUI.fromHandle(_obj_newObject("button"));
    obj.button144:setParent(obj.layout95);
    obj.button144:setLeft(0);
    obj.button144:setTop(15);
    obj.button144:setHeight(15);
    obj.button144:setWidth(15);
    obj.button144:setText("2");
    obj.button144:setFontSize(9);
    obj.button144:setName("button144");

    obj.edit346 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout95);
    obj.edit346:setLeft(20);
    obj.edit346:setTop(0);
    obj.edit346:setWidth(100);
    obj.edit346:setHeight(25);
    obj.edit346:setField("nome3_7");
    obj.edit346:setName("edit346");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout95);
    obj.rectangle99:setLeft(125);
    obj.rectangle99:setTop(0);
    obj.rectangle99:setWidth(40);
    obj.rectangle99:setHeight(25);
    obj.rectangle99:setColor("Black");
    obj.rectangle99:setStrokeColor("white");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setName("rectangle99");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout95);
    obj.label225:setLeft(125);
    obj.label225:setTop(3);
    obj.label225:setWidth(40);
    obj.label225:setHeight(20);
    obj.label225:setField("total23_7");
    obj.label225:setHorzTextAlign("center");
    obj.label225:setName("label225");

    obj.edit347 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout95);
    obj.edit347:setLeft(170);
    obj.edit347:setTop(0);
    obj.edit347:setWidth(30);
    obj.edit347:setHeight(25);
    obj.edit347:setType("number");
    obj.edit347:setMin(0);
    obj.edit347:setField("base3_7");
    obj.edit347:setName("edit347");

    obj.edit348 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout95);
    obj.edit348:setLeft(205);
    obj.edit348:setTop(0);
    obj.edit348:setWidth(30);
    obj.edit348:setHeight(25);
    obj.edit348:setType("number");
    obj.edit348:setMin(0);
    obj.edit348:setField("bonus3_7");
    obj.edit348:setName("edit348");

    obj.edit349 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout95);
    obj.edit349:setLeft(240);
    obj.edit349:setTop(0);
    obj.edit349:setWidth(30);
    obj.edit349:setHeight(25);
    obj.edit349:setType("number");
    obj.edit349:setMin(0);
    obj.edit349:setField("xp3_7");
    obj.edit349:setName("edit349");

    obj.edit350 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout95);
    obj.edit350:setLeft(20);
    obj.edit350:setTop(28);
    obj.edit350:setWidth(250);
    obj.edit350:setHeight(20);
    obj.edit350:setField("espec3_7");
    obj.edit350:setName("edit350");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout88);
    obj.layout96:setLeft(5);
    obj.layout96:setTop(400);
    obj.layout96:setWidth(270);
    obj.layout96:setHeight(50);
    obj.layout96:setName("layout96");

    obj.button145 = GUI.fromHandle(_obj_newObject("button"));
    obj.button145:setParent(obj.layout96);
    obj.button145:setLeft(0);
    obj.button145:setTop(0);
    obj.button145:setHeight(15);
    obj.button145:setWidth(15);
    obj.button145:setText("1");
    obj.button145:setFontSize(9);
    obj.button145:setName("button145");

    obj.button146 = GUI.fromHandle(_obj_newObject("button"));
    obj.button146:setParent(obj.layout96);
    obj.button146:setLeft(0);
    obj.button146:setTop(15);
    obj.button146:setHeight(15);
    obj.button146:setWidth(15);
    obj.button146:setText("2");
    obj.button146:setFontSize(9);
    obj.button146:setName("button146");

    obj.edit351 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout96);
    obj.edit351:setLeft(20);
    obj.edit351:setTop(0);
    obj.edit351:setWidth(100);
    obj.edit351:setHeight(25);
    obj.edit351:setField("nome3_8");
    obj.edit351:setName("edit351");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout96);
    obj.rectangle100:setLeft(125);
    obj.rectangle100:setTop(0);
    obj.rectangle100:setWidth(40);
    obj.rectangle100:setHeight(25);
    obj.rectangle100:setColor("Black");
    obj.rectangle100:setStrokeColor("white");
    obj.rectangle100:setStrokeSize(1);
    obj.rectangle100:setName("rectangle100");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout96);
    obj.label226:setLeft(125);
    obj.label226:setTop(3);
    obj.label226:setWidth(40);
    obj.label226:setHeight(20);
    obj.label226:setField("total23_8");
    obj.label226:setHorzTextAlign("center");
    obj.label226:setName("label226");

    obj.edit352 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout96);
    obj.edit352:setLeft(170);
    obj.edit352:setTop(0);
    obj.edit352:setWidth(30);
    obj.edit352:setHeight(25);
    obj.edit352:setType("number");
    obj.edit352:setMin(0);
    obj.edit352:setField("base3_8");
    obj.edit352:setName("edit352");

    obj.edit353 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout96);
    obj.edit353:setLeft(205);
    obj.edit353:setTop(0);
    obj.edit353:setWidth(30);
    obj.edit353:setHeight(25);
    obj.edit353:setType("number");
    obj.edit353:setMin(0);
    obj.edit353:setField("bonus3_8");
    obj.edit353:setName("edit353");

    obj.edit354 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout96);
    obj.edit354:setLeft(240);
    obj.edit354:setTop(0);
    obj.edit354:setWidth(30);
    obj.edit354:setHeight(25);
    obj.edit354:setType("number");
    obj.edit354:setMin(0);
    obj.edit354:setField("xp3_8");
    obj.edit354:setName("edit354");

    obj.edit355 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout96);
    obj.edit355:setLeft(20);
    obj.edit355:setTop(28);
    obj.edit355:setWidth(250);
    obj.edit355:setHeight(20);
    obj.edit355:setField("espec3_8");
    obj.edit355:setName("edit355");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout88);
    obj.layout97:setLeft(5);
    obj.layout97:setTop(450);
    obj.layout97:setWidth(270);
    obj.layout97:setHeight(50);
    obj.layout97:setName("layout97");

    obj.button147 = GUI.fromHandle(_obj_newObject("button"));
    obj.button147:setParent(obj.layout97);
    obj.button147:setLeft(0);
    obj.button147:setTop(0);
    obj.button147:setHeight(15);
    obj.button147:setWidth(15);
    obj.button147:setText("1");
    obj.button147:setFontSize(9);
    obj.button147:setName("button147");

    obj.button148 = GUI.fromHandle(_obj_newObject("button"));
    obj.button148:setParent(obj.layout97);
    obj.button148:setLeft(0);
    obj.button148:setTop(15);
    obj.button148:setHeight(15);
    obj.button148:setWidth(15);
    obj.button148:setText("2");
    obj.button148:setFontSize(9);
    obj.button148:setName("button148");

    obj.edit356 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout97);
    obj.edit356:setLeft(20);
    obj.edit356:setTop(0);
    obj.edit356:setWidth(100);
    obj.edit356:setHeight(25);
    obj.edit356:setField("nome3_9");
    obj.edit356:setName("edit356");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout97);
    obj.rectangle101:setLeft(125);
    obj.rectangle101:setTop(0);
    obj.rectangle101:setWidth(40);
    obj.rectangle101:setHeight(25);
    obj.rectangle101:setColor("Black");
    obj.rectangle101:setStrokeColor("white");
    obj.rectangle101:setStrokeSize(1);
    obj.rectangle101:setName("rectangle101");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout97);
    obj.label227:setLeft(125);
    obj.label227:setTop(3);
    obj.label227:setWidth(40);
    obj.label227:setHeight(20);
    obj.label227:setField("total23_9");
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.edit357 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout97);
    obj.edit357:setLeft(170);
    obj.edit357:setTop(0);
    obj.edit357:setWidth(30);
    obj.edit357:setHeight(25);
    obj.edit357:setType("number");
    obj.edit357:setMin(0);
    obj.edit357:setField("base3_9");
    obj.edit357:setName("edit357");

    obj.edit358 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout97);
    obj.edit358:setLeft(205);
    obj.edit358:setTop(0);
    obj.edit358:setWidth(30);
    obj.edit358:setHeight(25);
    obj.edit358:setType("number");
    obj.edit358:setMin(0);
    obj.edit358:setField("bonus3_9");
    obj.edit358:setName("edit358");

    obj.edit359 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout97);
    obj.edit359:setLeft(240);
    obj.edit359:setTop(0);
    obj.edit359:setWidth(30);
    obj.edit359:setHeight(25);
    obj.edit359:setType("number");
    obj.edit359:setMin(0);
    obj.edit359:setField("xp3_9");
    obj.edit359:setName("edit359");

    obj.edit360 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout97);
    obj.edit360:setLeft(20);
    obj.edit360:setTop(28);
    obj.edit360:setWidth(250);
    obj.edit360:setHeight(20);
    obj.edit360:setField("espec3_9");
    obj.edit360:setName("edit360");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout88);
    obj.layout98:setLeft(5);
    obj.layout98:setTop(500);
    obj.layout98:setWidth(270);
    obj.layout98:setHeight(50);
    obj.layout98:setName("layout98");

    obj.button149 = GUI.fromHandle(_obj_newObject("button"));
    obj.button149:setParent(obj.layout98);
    obj.button149:setLeft(0);
    obj.button149:setTop(0);
    obj.button149:setHeight(15);
    obj.button149:setWidth(15);
    obj.button149:setText("1");
    obj.button149:setFontSize(9);
    obj.button149:setName("button149");

    obj.button150 = GUI.fromHandle(_obj_newObject("button"));
    obj.button150:setParent(obj.layout98);
    obj.button150:setLeft(0);
    obj.button150:setTop(15);
    obj.button150:setHeight(15);
    obj.button150:setWidth(15);
    obj.button150:setText("2");
    obj.button150:setFontSize(9);
    obj.button150:setName("button150");

    obj.edit361 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout98);
    obj.edit361:setLeft(20);
    obj.edit361:setTop(0);
    obj.edit361:setWidth(100);
    obj.edit361:setHeight(25);
    obj.edit361:setField("nome3_10");
    obj.edit361:setName("edit361");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout98);
    obj.rectangle102:setLeft(125);
    obj.rectangle102:setTop(0);
    obj.rectangle102:setWidth(40);
    obj.rectangle102:setHeight(25);
    obj.rectangle102:setColor("Black");
    obj.rectangle102:setStrokeColor("white");
    obj.rectangle102:setStrokeSize(1);
    obj.rectangle102:setName("rectangle102");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout98);
    obj.label228:setLeft(125);
    obj.label228:setTop(3);
    obj.label228:setWidth(40);
    obj.label228:setHeight(20);
    obj.label228:setField("total23_10");
    obj.label228:setHorzTextAlign("center");
    obj.label228:setName("label228");

    obj.edit362 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout98);
    obj.edit362:setLeft(170);
    obj.edit362:setTop(0);
    obj.edit362:setWidth(30);
    obj.edit362:setHeight(25);
    obj.edit362:setType("number");
    obj.edit362:setMin(0);
    obj.edit362:setField("base3_10");
    obj.edit362:setName("edit362");

    obj.edit363 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout98);
    obj.edit363:setLeft(205);
    obj.edit363:setTop(0);
    obj.edit363:setWidth(30);
    obj.edit363:setHeight(25);
    obj.edit363:setType("number");
    obj.edit363:setMin(0);
    obj.edit363:setField("bonus3_10");
    obj.edit363:setName("edit363");

    obj.edit364 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout98);
    obj.edit364:setLeft(240);
    obj.edit364:setTop(0);
    obj.edit364:setWidth(30);
    obj.edit364:setHeight(25);
    obj.edit364:setType("number");
    obj.edit364:setMin(0);
    obj.edit364:setField("xp3_10");
    obj.edit364:setName("edit364");

    obj.edit365 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout98);
    obj.edit365:setLeft(20);
    obj.edit365:setTop(28);
    obj.edit365:setWidth(250);
    obj.edit365:setHeight(20);
    obj.edit365:setField("espec3_10");
    obj.edit365:setName("edit365");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout88);
    obj.layout99:setLeft(5);
    obj.layout99:setTop(550);
    obj.layout99:setWidth(270);
    obj.layout99:setHeight(50);
    obj.layout99:setName("layout99");

    obj.button151 = GUI.fromHandle(_obj_newObject("button"));
    obj.button151:setParent(obj.layout99);
    obj.button151:setLeft(0);
    obj.button151:setTop(0);
    obj.button151:setHeight(15);
    obj.button151:setWidth(15);
    obj.button151:setText("1");
    obj.button151:setFontSize(9);
    obj.button151:setName("button151");

    obj.button152 = GUI.fromHandle(_obj_newObject("button"));
    obj.button152:setParent(obj.layout99);
    obj.button152:setLeft(0);
    obj.button152:setTop(15);
    obj.button152:setHeight(15);
    obj.button152:setWidth(15);
    obj.button152:setText("2");
    obj.button152:setFontSize(9);
    obj.button152:setName("button152");

    obj.edit366 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout99);
    obj.edit366:setLeft(20);
    obj.edit366:setTop(0);
    obj.edit366:setWidth(100);
    obj.edit366:setHeight(25);
    obj.edit366:setField("nome3_11");
    obj.edit366:setName("edit366");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout99);
    obj.rectangle103:setLeft(125);
    obj.rectangle103:setTop(0);
    obj.rectangle103:setWidth(40);
    obj.rectangle103:setHeight(25);
    obj.rectangle103:setColor("Black");
    obj.rectangle103:setStrokeColor("white");
    obj.rectangle103:setStrokeSize(1);
    obj.rectangle103:setName("rectangle103");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout99);
    obj.label229:setLeft(125);
    obj.label229:setTop(3);
    obj.label229:setWidth(40);
    obj.label229:setHeight(20);
    obj.label229:setField("total23_11");
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.edit367 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout99);
    obj.edit367:setLeft(170);
    obj.edit367:setTop(0);
    obj.edit367:setWidth(30);
    obj.edit367:setHeight(25);
    obj.edit367:setType("number");
    obj.edit367:setMin(0);
    obj.edit367:setField("base3_11");
    obj.edit367:setName("edit367");

    obj.edit368 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout99);
    obj.edit368:setLeft(205);
    obj.edit368:setTop(0);
    obj.edit368:setWidth(30);
    obj.edit368:setHeight(25);
    obj.edit368:setType("number");
    obj.edit368:setMin(0);
    obj.edit368:setField("bonus3_11");
    obj.edit368:setName("edit368");

    obj.edit369 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout99);
    obj.edit369:setLeft(240);
    obj.edit369:setTop(0);
    obj.edit369:setWidth(30);
    obj.edit369:setHeight(25);
    obj.edit369:setType("number");
    obj.edit369:setMin(0);
    obj.edit369:setField("xp3_11");
    obj.edit369:setName("edit369");

    obj.edit370 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout99);
    obj.edit370:setLeft(20);
    obj.edit370:setTop(28);
    obj.edit370:setWidth(250);
    obj.edit370:setHeight(20);
    obj.edit370:setField("espec3_11");
    obj.edit370:setName("edit370");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout88);
    obj.layout100:setLeft(5);
    obj.layout100:setTop(600);
    obj.layout100:setWidth(270);
    obj.layout100:setHeight(50);
    obj.layout100:setName("layout100");

    obj.button153 = GUI.fromHandle(_obj_newObject("button"));
    obj.button153:setParent(obj.layout100);
    obj.button153:setLeft(0);
    obj.button153:setTop(0);
    obj.button153:setHeight(15);
    obj.button153:setWidth(15);
    obj.button153:setText("1");
    obj.button153:setFontSize(9);
    obj.button153:setName("button153");

    obj.button154 = GUI.fromHandle(_obj_newObject("button"));
    obj.button154:setParent(obj.layout100);
    obj.button154:setLeft(0);
    obj.button154:setTop(15);
    obj.button154:setHeight(15);
    obj.button154:setWidth(15);
    obj.button154:setText("2");
    obj.button154:setFontSize(9);
    obj.button154:setName("button154");

    obj.edit371 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout100);
    obj.edit371:setLeft(20);
    obj.edit371:setTop(0);
    obj.edit371:setWidth(100);
    obj.edit371:setHeight(25);
    obj.edit371:setField("nome3_12");
    obj.edit371:setName("edit371");

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout100);
    obj.rectangle104:setLeft(125);
    obj.rectangle104:setTop(0);
    obj.rectangle104:setWidth(40);
    obj.rectangle104:setHeight(25);
    obj.rectangle104:setColor("Black");
    obj.rectangle104:setStrokeColor("white");
    obj.rectangle104:setStrokeSize(1);
    obj.rectangle104:setName("rectangle104");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout100);
    obj.label230:setLeft(125);
    obj.label230:setTop(3);
    obj.label230:setWidth(40);
    obj.label230:setHeight(20);
    obj.label230:setField("total23_12");
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.edit372 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout100);
    obj.edit372:setLeft(170);
    obj.edit372:setTop(0);
    obj.edit372:setWidth(30);
    obj.edit372:setHeight(25);
    obj.edit372:setType("number");
    obj.edit372:setMin(0);
    obj.edit372:setField("base3_12");
    obj.edit372:setName("edit372");

    obj.edit373 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout100);
    obj.edit373:setLeft(205);
    obj.edit373:setTop(0);
    obj.edit373:setWidth(30);
    obj.edit373:setHeight(25);
    obj.edit373:setType("number");
    obj.edit373:setMin(0);
    obj.edit373:setField("bonus3_12");
    obj.edit373:setName("edit373");

    obj.edit374 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout100);
    obj.edit374:setLeft(240);
    obj.edit374:setTop(0);
    obj.edit374:setWidth(30);
    obj.edit374:setHeight(25);
    obj.edit374:setType("number");
    obj.edit374:setMin(0);
    obj.edit374:setField("xp3_12");
    obj.edit374:setName("edit374");

    obj.edit375 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout100);
    obj.edit375:setLeft(20);
    obj.edit375:setTop(28);
    obj.edit375:setWidth(250);
    obj.edit375:setHeight(20);
    obj.edit375:setField("espec3_12");
    obj.edit375:setName("edit375");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.scrollBox4);
    obj.layout101:setLeft(1200);
    obj.layout101:setTop(0);
    obj.layout101:setWidth(110);
    obj.layout101:setHeight(270);
    obj.layout101:setName("layout101");

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout101);
    obj.rectangle105:setAlign("client");
    obj.rectangle105:setColor("black");
    obj.rectangle105:setXradius(15);
    obj.rectangle105:setYradius(15);
    obj.rectangle105:setCornerType("round");
    obj.rectangle105:setName("rectangle105");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout101);
    obj.label231:setLeft(5);
    obj.label231:setTop(10);
    obj.label231:setWidth(50);
    obj.label231:setHeight(20);
    obj.label231:setText("Dado 1");
    obj.label231:setName("label231");

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout101);
    obj.rectangle106:setLeft(50);
    obj.rectangle106:setTop(8);
    obj.rectangle106:setWidth(35);
    obj.rectangle106:setHeight(25);
    obj.rectangle106:setColor("Black");
    obj.rectangle106:setStrokeColor("white");
    obj.rectangle106:setStrokeSize(1);
    obj.rectangle106:setName("rectangle106");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout101);
    obj.label232:setLeft(60);
    obj.label232:setTop(10);
    obj.label232:setWidth(30);
    obj.label232:setHeight(20);
    obj.label232:setField("num1");
    obj.label232:setText("val");
    obj.label232:setName("label232");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout101);
    obj.label233:setLeft(63);
    obj.label233:setTop(35);
    obj.label233:setWidth(10);
    obj.label233:setHeight(20);
    obj.label233:setText("+");
    obj.label233:setName("label233");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout101);
    obj.label234:setLeft(5);
    obj.label234:setTop(60);
    obj.label234:setWidth(50);
    obj.label234:setHeight(20);
    obj.label234:setText("Dado 2");
    obj.label234:setName("label234");

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout101);
    obj.rectangle107:setLeft(50);
    obj.rectangle107:setTop(58);
    obj.rectangle107:setWidth(35);
    obj.rectangle107:setHeight(25);
    obj.rectangle107:setColor("Black");
    obj.rectangle107:setStrokeColor("white");
    obj.rectangle107:setStrokeSize(1);
    obj.rectangle107:setName("rectangle107");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout101);
    obj.label235:setLeft(60);
    obj.label235:setTop(60);
    obj.label235:setWidth(30);
    obj.label235:setHeight(20);
    obj.label235:setField("num2");
    obj.label235:setText("val");
    obj.label235:setName("label235");

    obj.button155 = GUI.fromHandle(_obj_newObject("button"));
    obj.button155:setParent(obj.layout101);
    obj.button155:setLeft(85);
    obj.button155:setTop(63);
    obj.button155:setWidth(15);
    obj.button155:setHeight(15);
    obj.button155:setText("x");
    obj.button155:setFontSize(10);
    obj.button155:setName("button155");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout101);
    obj.label236:setLeft(63);
    obj.label236:setTop(85);
    obj.label236:setWidth(10);
    obj.label236:setHeight(20);
    obj.label236:setText("+");
    obj.label236:setName("label236");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout101);
    obj.label237:setLeft(5);
    obj.label237:setTop(110);
    obj.label237:setWidth(40);
    obj.label237:setHeight(20);
    obj.label237:setText("Especs");
    obj.label237:setName("label237");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout101);
    obj.comboBox2:setLeft(50);
    obj.comboBox2:setTop(110);
    obj.comboBox2:setWidth(50);
    obj.comboBox2:setItems({'0', '1,5', '3'});
    obj.comboBox2:setValues({'0', '1', '2'});
    obj.comboBox2:setValue("0");
    obj.comboBox2:setField("especBonus");
    obj.comboBox2:setName("comboBox2");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout101);
    obj.label238:setLeft(5);
    obj.label238:setTop(135);
    obj.label238:setWidth(40);
    obj.label238:setHeight(20);
    obj.label238:setText("Extra");
    obj.label238:setName("label238");

    obj.edit376 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout101);
    obj.edit376:setLeft(50);
    obj.edit376:setTop(135);
    obj.edit376:setWidth(30);
    obj.edit376:setHeight(25);
    obj.edit376:setField("extra");
    obj.edit376:setName("edit376");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout101);
    obj.label239:setLeft(5);
    obj.label239:setTop(165);
    obj.label239:setWidth(40);
    obj.label239:setHeight(20);
    obj.label239:setText("Dific.");
    obj.label239:setName("label239");

    obj.edit377 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout101);
    obj.edit377:setLeft(50);
    obj.edit377:setTop(165);
    obj.edit377:setWidth(30);
    obj.edit377:setHeight(25);
    obj.edit377:setField("dificuldade");
    obj.edit377:setType("number");
    obj.edit377:setName("edit377");

    obj.button156 = GUI.fromHandle(_obj_newObject("button"));
    obj.button156:setParent(obj.layout101);
    obj.button156:setLeft(30);
    obj.button156:setTop(195);
    obj.button156:setWidth(50);
    obj.button156:setText("ROLAR");
    obj.button156:setFontSize(11);
    obj.button156:setName("button156");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout101);
    obj.label240:setLeft(5);
    obj.label240:setTop(220);
    obj.label240:setWidth(100);
    obj.label240:setHeight(15);
    obj.label240:setField("rollnome1");
    obj.label240:setFontSize(11);
    obj.label240:setHorzTextAlign("center");
    obj.label240:setName("label240");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout101);
    obj.label241:setLeft(5);
    obj.label241:setTop(235);
    obj.label241:setWidth(100);
    obj.label241:setHeight(15);
    obj.label241:setText("+");
    obj.label241:setHorzTextAlign("center");
    obj.label241:setName("label241");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout101);
    obj.label242:setLeft(5);
    obj.label242:setTop(250);
    obj.label242:setWidth(100);
    obj.label242:setHeight(15);
    obj.label242:setField("rollnome2");
    obj.label242:setFontSize(11);
    obj.label242:setHorzTextAlign("center");
    obj.label242:setName("label242");

    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.scrollBox4);
    obj.dataLink85:setFields({'nome0_1','nome0_2','nome0_3','nome0_4','nome0_5','nome0_6','nome0_7','nome0_8','nome1_1','nome1_2','nome1_3','nome1_4','nome1_5','nome1_6','nome1_7','nome1_8','nome1_9','nome1_10','nome2_1','nome2_2','nome2_3','nome2_4','nome2_5','nome2_6','nome2_7','nome2_8','nome3_1','nome3_2','nome3_3','nome3_4','nome3_5','nome3_6','nome3_7','nome3_8','nome3_9','nome3_10'});
    obj.dataLink85:setDefaultValues({'Armas Brancas','Arremesso','Briga','Esportes','Esquiva','Furtividade','Prestidigitação','Sobrevivência','Empatia','Emp. Animais','Etiqueta','Expressão','Intimidação','Investigação','Lábia','Liderança','Manha','Prontidão','Acrobacia','Armas de Fogo','Arte da Fuga','Artes Marciais','Conduçao','Oficios','Performace','Subterfúgio','Acadêmicos','Administração','Ciências','Computação','Cultura','Direito','Medicina','Ocultismo','Política','Tecnologia'});
    obj.dataLink85:setName("dataLink85");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmACN3 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN3:setParent(obj.tab3);
    obj.frmACN3:setName("frmACN3");
    obj.frmACN3:setAlign("client");
    obj.frmACN3:setTheme("dark");
    obj.frmACN3:setMargins({top=1});

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmACN3);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.scrollBox5);
    obj.layout102:setLeft(0);
    obj.layout102:setTop(0);
    obj.layout102:setWidth(400);
    obj.layout102:setHeight(600);
    obj.layout102:setName("layout102");

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout102);
    obj.rectangle108:setLeft(0);
    obj.rectangle108:setTop(0);
    obj.rectangle108:setWidth(400);
    obj.rectangle108:setHeight(600);
    obj.rectangle108:setColor("black");
    obj.rectangle108:setXradius(15);
    obj.rectangle108:setYradius(15);
    obj.rectangle108:setCornerType("round");
    obj.rectangle108:setName("rectangle108");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout102);
    obj.label243:setLeft(0);
    obj.label243:setTop(0);
    obj.label243:setWidth(400);
    obj.label243:setHeight(20);
    obj.label243:setText("EQUIPAMENTOS");
    obj.label243:setHorzTextAlign("center");
    obj.label243:setName("label243");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout102);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(560);
    obj.textEditor3:setField("equipamentos");
    obj.textEditor3:setName("textEditor3");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.scrollBox5);
    obj.layout103:setLeft(410);
    obj.layout103:setTop(0);
    obj.layout103:setWidth(400);
    obj.layout103:setHeight(250);
    obj.layout103:setName("layout103");

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout103);
    obj.rectangle109:setLeft(0);
    obj.rectangle109:setTop(0);
    obj.rectangle109:setWidth(400);
    obj.rectangle109:setHeight(250);
    obj.rectangle109:setColor("black");
    obj.rectangle109:setXradius(15);
    obj.rectangle109:setYradius(15);
    obj.rectangle109:setCornerType("round");
    obj.rectangle109:setName("rectangle109");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout103);
    obj.label244:setLeft(0);
    obj.label244:setTop(0);
    obj.label244:setWidth(400);
    obj.label244:setHeight(20);
    obj.label244:setText("POSSES");
    obj.label244:setHorzTextAlign("center");
    obj.label244:setName("label244");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout103);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(210);
    obj.textEditor4:setField("bens");
    obj.textEditor4:setName("textEditor4");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.scrollBox5);
    obj.layout104:setLeft(820);
    obj.layout104:setTop(0);
    obj.layout104:setWidth(400);
    obj.layout104:setHeight(250);
    obj.layout104:setName("layout104");

    obj.rectangle110 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout104);
    obj.rectangle110:setLeft(0);
    obj.rectangle110:setTop(0);
    obj.rectangle110:setWidth(400);
    obj.rectangle110:setHeight(250);
    obj.rectangle110:setColor("black");
    obj.rectangle110:setXradius(15);
    obj.rectangle110:setYradius(15);
    obj.rectangle110:setCornerType("round");
    obj.rectangle110:setName("rectangle110");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout104);
    obj.label245:setLeft(0);
    obj.label245:setTop(0);
    obj.label245:setWidth(400);
    obj.label245:setHeight(20);
    obj.label245:setText("OUTROS");
    obj.label245:setHorzTextAlign("center");
    obj.label245:setName("label245");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout104);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(210);
    obj.textEditor5:setField("outrosItens");
    obj.textEditor5:setName("textEditor5");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.scrollBox5);
    obj.layout105:setLeft(410);
    obj.layout105:setTop(260);
    obj.layout105:setWidth(810);
    obj.layout105:setHeight(245);
    obj.layout105:setName("layout105");

    obj.rectangle111 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout105);
    obj.rectangle111:setLeft(0);
    obj.rectangle111:setTop(0);
    obj.rectangle111:setWidth(810);
    obj.rectangle111:setHeight(245);
    obj.rectangle111:setColor("black");
    obj.rectangle111:setXradius(15);
    obj.rectangle111:setYradius(15);
    obj.rectangle111:setCornerType("round");
    obj.rectangle111:setName("rectangle111");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout105);
    obj.label246:setLeft(0);
    obj.label246:setTop(0);
    obj.label246:setWidth(810);
    obj.label246:setHeight(20);
    obj.label246:setText("ARMAS");
    obj.label246:setHorzTextAlign("center");
    obj.label246:setName("label246");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout105);
    obj.label247:setLeft(10);
    obj.label247:setTop(25);
    obj.label247:setWidth(150);
    obj.label247:setHeight(20);
    obj.label247:setText("Nome");
    obj.label247:setName("label247");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout105);
    obj.label248:setLeft(170);
    obj.label248:setTop(25);
    obj.label248:setWidth(150);
    obj.label248:setHeight(20);
    obj.label248:setText("Teste");
    obj.label248:setName("label248");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout105);
    obj.label249:setLeft(330);
    obj.label249:setTop(25);
    obj.label249:setWidth(35);
    obj.label249:setHeight(20);
    obj.label249:setText("Dific");
    obj.label249:setName("label249");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout105);
    obj.label250:setLeft(370);
    obj.label250:setTop(25);
    obj.label250:setWidth(40);
    obj.label250:setHeight(20);
    obj.label250:setText("Dano");
    obj.label250:setName("label250");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.layout105);
    obj.label251:setLeft(410);
    obj.label251:setTop(25);
    obj.label251:setWidth(35);
    obj.label251:setHeight(20);
    obj.label251:setText("Mun.");
    obj.label251:setName("label251");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.layout105);
    obj.label252:setLeft(450);
    obj.label252:setTop(25);
    obj.label252:setWidth(350);
    obj.label252:setHeight(20);
    obj.label252:setText("Outros");
    obj.label252:setName("label252");

    obj.edit378 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout105);
    obj.edit378:setLeft(10);
    obj.edit378:setTop(50);
    obj.edit378:setWidth(150);
    obj.edit378:setHeight(25);
    obj.edit378:setField("nome1");
    obj.edit378:setName("edit378");

    obj.edit379 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout105);
    obj.edit379:setLeft(170);
    obj.edit379:setTop(50);
    obj.edit379:setWidth(150);
    obj.edit379:setHeight(25);
    obj.edit379:setField("teste1");
    obj.edit379:setName("edit379");

    obj.edit380 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout105);
    obj.edit380:setLeft(330);
    obj.edit380:setTop(50);
    obj.edit380:setWidth(30);
    obj.edit380:setHeight(25);
    obj.edit380:setField("dificuldade1");
    obj.edit380:setName("edit380");

    obj.edit381 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout105);
    obj.edit381:setLeft(370);
    obj.edit381:setTop(50);
    obj.edit381:setWidth(30);
    obj.edit381:setHeight(25);
    obj.edit381:setField("dano1");
    obj.edit381:setName("edit381");

    obj.edit382 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout105);
    obj.edit382:setLeft(410);
    obj.edit382:setTop(50);
    obj.edit382:setWidth(30);
    obj.edit382:setHeight(25);
    obj.edit382:setField("municao1");
    obj.edit382:setName("edit382");

    obj.edit383 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout105);
    obj.edit383:setLeft(450);
    obj.edit383:setTop(50);
    obj.edit383:setWidth(350);
    obj.edit383:setHeight(25);
    obj.edit383:setField("outros1");
    obj.edit383:setName("edit383");

    obj.edit384 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout105);
    obj.edit384:setLeft(10);
    obj.edit384:setTop(80);
    obj.edit384:setWidth(150);
    obj.edit384:setHeight(25);
    obj.edit384:setField("nome2");
    obj.edit384:setName("edit384");

    obj.edit385 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout105);
    obj.edit385:setLeft(170);
    obj.edit385:setTop(80);
    obj.edit385:setWidth(150);
    obj.edit385:setHeight(25);
    obj.edit385:setField("teste2");
    obj.edit385:setName("edit385");

    obj.edit386 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout105);
    obj.edit386:setLeft(330);
    obj.edit386:setTop(80);
    obj.edit386:setWidth(30);
    obj.edit386:setHeight(25);
    obj.edit386:setField("dificuldade2");
    obj.edit386:setName("edit386");

    obj.edit387 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout105);
    obj.edit387:setLeft(370);
    obj.edit387:setTop(80);
    obj.edit387:setWidth(30);
    obj.edit387:setHeight(25);
    obj.edit387:setField("dano2");
    obj.edit387:setName("edit387");

    obj.edit388 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout105);
    obj.edit388:setLeft(410);
    obj.edit388:setTop(80);
    obj.edit388:setWidth(30);
    obj.edit388:setHeight(25);
    obj.edit388:setField("municao2");
    obj.edit388:setName("edit388");

    obj.edit389 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.layout105);
    obj.edit389:setLeft(450);
    obj.edit389:setTop(80);
    obj.edit389:setWidth(350);
    obj.edit389:setHeight(25);
    obj.edit389:setField("outros2");
    obj.edit389:setName("edit389");

    obj.edit390 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.layout105);
    obj.edit390:setLeft(10);
    obj.edit390:setTop(110);
    obj.edit390:setWidth(150);
    obj.edit390:setHeight(25);
    obj.edit390:setField("nome3");
    obj.edit390:setName("edit390");

    obj.edit391 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.layout105);
    obj.edit391:setLeft(170);
    obj.edit391:setTop(110);
    obj.edit391:setWidth(150);
    obj.edit391:setHeight(25);
    obj.edit391:setField("teste3");
    obj.edit391:setName("edit391");

    obj.edit392 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.layout105);
    obj.edit392:setLeft(330);
    obj.edit392:setTop(110);
    obj.edit392:setWidth(30);
    obj.edit392:setHeight(25);
    obj.edit392:setField("dificuldade3");
    obj.edit392:setName("edit392");

    obj.edit393 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.layout105);
    obj.edit393:setLeft(370);
    obj.edit393:setTop(110);
    obj.edit393:setWidth(30);
    obj.edit393:setHeight(25);
    obj.edit393:setField("dano3");
    obj.edit393:setName("edit393");

    obj.edit394 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.layout105);
    obj.edit394:setLeft(410);
    obj.edit394:setTop(110);
    obj.edit394:setWidth(30);
    obj.edit394:setHeight(25);
    obj.edit394:setField("municao3");
    obj.edit394:setName("edit394");

    obj.edit395 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.layout105);
    obj.edit395:setLeft(450);
    obj.edit395:setTop(110);
    obj.edit395:setWidth(350);
    obj.edit395:setHeight(25);
    obj.edit395:setField("outros3");
    obj.edit395:setName("edit395");

    obj.edit396 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.layout105);
    obj.edit396:setLeft(10);
    obj.edit396:setTop(140);
    obj.edit396:setWidth(150);
    obj.edit396:setHeight(25);
    obj.edit396:setField("nome4");
    obj.edit396:setName("edit396");

    obj.edit397 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.layout105);
    obj.edit397:setLeft(170);
    obj.edit397:setTop(140);
    obj.edit397:setWidth(150);
    obj.edit397:setHeight(25);
    obj.edit397:setField("teste4");
    obj.edit397:setName("edit397");

    obj.edit398 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.layout105);
    obj.edit398:setLeft(330);
    obj.edit398:setTop(140);
    obj.edit398:setWidth(30);
    obj.edit398:setHeight(25);
    obj.edit398:setField("dificuldade4");
    obj.edit398:setName("edit398");

    obj.edit399 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.layout105);
    obj.edit399:setLeft(370);
    obj.edit399:setTop(140);
    obj.edit399:setWidth(30);
    obj.edit399:setHeight(25);
    obj.edit399:setField("dano4");
    obj.edit399:setName("edit399");

    obj.edit400 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.layout105);
    obj.edit400:setLeft(410);
    obj.edit400:setTop(140);
    obj.edit400:setWidth(30);
    obj.edit400:setHeight(25);
    obj.edit400:setField("municao4");
    obj.edit400:setName("edit400");

    obj.edit401 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.layout105);
    obj.edit401:setLeft(450);
    obj.edit401:setTop(140);
    obj.edit401:setWidth(350);
    obj.edit401:setHeight(25);
    obj.edit401:setField("outros4");
    obj.edit401:setName("edit401");

    obj.edit402 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit402:setParent(obj.layout105);
    obj.edit402:setLeft(10);
    obj.edit402:setTop(170);
    obj.edit402:setWidth(150);
    obj.edit402:setHeight(25);
    obj.edit402:setField("nome5");
    obj.edit402:setName("edit402");

    obj.edit403 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit403:setParent(obj.layout105);
    obj.edit403:setLeft(170);
    obj.edit403:setTop(170);
    obj.edit403:setWidth(150);
    obj.edit403:setHeight(25);
    obj.edit403:setField("teste5");
    obj.edit403:setName("edit403");

    obj.edit404 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit404:setParent(obj.layout105);
    obj.edit404:setLeft(330);
    obj.edit404:setTop(170);
    obj.edit404:setWidth(30);
    obj.edit404:setHeight(25);
    obj.edit404:setField("dificuldade5");
    obj.edit404:setName("edit404");

    obj.edit405 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit405:setParent(obj.layout105);
    obj.edit405:setLeft(370);
    obj.edit405:setTop(170);
    obj.edit405:setWidth(30);
    obj.edit405:setHeight(25);
    obj.edit405:setField("dano5");
    obj.edit405:setName("edit405");

    obj.edit406 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit406:setParent(obj.layout105);
    obj.edit406:setLeft(410);
    obj.edit406:setTop(170);
    obj.edit406:setWidth(30);
    obj.edit406:setHeight(25);
    obj.edit406:setField("municao5");
    obj.edit406:setName("edit406");

    obj.edit407 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit407:setParent(obj.layout105);
    obj.edit407:setLeft(450);
    obj.edit407:setTop(170);
    obj.edit407:setWidth(350);
    obj.edit407:setHeight(25);
    obj.edit407:setField("outros5");
    obj.edit407:setName("edit407");

    obj.edit408 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit408:setParent(obj.layout105);
    obj.edit408:setLeft(10);
    obj.edit408:setTop(200);
    obj.edit408:setWidth(150);
    obj.edit408:setHeight(25);
    obj.edit408:setField("nome6");
    obj.edit408:setName("edit408");

    obj.edit409 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit409:setParent(obj.layout105);
    obj.edit409:setLeft(170);
    obj.edit409:setTop(200);
    obj.edit409:setWidth(150);
    obj.edit409:setHeight(25);
    obj.edit409:setField("teste6");
    obj.edit409:setName("edit409");

    obj.edit410 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit410:setParent(obj.layout105);
    obj.edit410:setLeft(330);
    obj.edit410:setTop(200);
    obj.edit410:setWidth(30);
    obj.edit410:setHeight(25);
    obj.edit410:setField("dificuldade6");
    obj.edit410:setName("edit410");

    obj.edit411 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit411:setParent(obj.layout105);
    obj.edit411:setLeft(370);
    obj.edit411:setTop(200);
    obj.edit411:setWidth(30);
    obj.edit411:setHeight(25);
    obj.edit411:setField("dano6");
    obj.edit411:setName("edit411");

    obj.edit412 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit412:setParent(obj.layout105);
    obj.edit412:setLeft(410);
    obj.edit412:setTop(200);
    obj.edit412:setWidth(30);
    obj.edit412:setHeight(25);
    obj.edit412:setField("municao6");
    obj.edit412:setName("edit412");

    obj.edit413 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit413:setParent(obj.layout105);
    obj.edit413:setLeft(450);
    obj.edit413:setTop(200);
    obj.edit413:setWidth(350);
    obj.edit413:setHeight(25);
    obj.edit413:setField("outros6");
    obj.edit413:setName("edit413");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.scrollBox5);
    obj.layout106:setLeft(410);
    obj.layout106:setTop(515);
    obj.layout106:setWidth(400);
    obj.layout106:setHeight(85);
    obj.layout106:setName("layout106");

    obj.rectangle112 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout106);
    obj.rectangle112:setLeft(0);
    obj.rectangle112:setTop(0);
    obj.rectangle112:setWidth(400);
    obj.rectangle112:setHeight(85);
    obj.rectangle112:setColor("black");
    obj.rectangle112:setXradius(15);
    obj.rectangle112:setYradius(15);
    obj.rectangle112:setCornerType("round");
    obj.rectangle112:setName("rectangle112");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.layout106);
    obj.label253:setLeft(0);
    obj.label253:setTop(0);
    obj.label253:setWidth(400);
    obj.label253:setHeight(20);
    obj.label253:setText("PROTEÇÃO/ARMADURA");
    obj.label253:setHorzTextAlign("center");
    obj.label253:setName("label253");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout106);
    obj.label254:setLeft(10);
    obj.label254:setTop(30);
    obj.label254:setWidth(45);
    obj.label254:setHeight(20);
    obj.label254:setText("Tipo");
    obj.label254:setName("label254");

    obj.edit414 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit414:setParent(obj.layout106);
    obj.edit414:setLeft(55);
    obj.edit414:setTop(25);
    obj.edit414:setWidth(135);
    obj.edit414:setHeight(25);
    obj.edit414:setField("tipoArmadura");
    obj.edit414:setName("edit414");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.layout106);
    obj.label255:setLeft(195);
    obj.label255:setTop(30);
    obj.label255:setWidth(40);
    obj.label255:setHeight(20);
    obj.label255:setText("Índice");
    obj.label255:setName("label255");

    obj.edit415 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit415:setParent(obj.layout106);
    obj.edit415:setLeft(240);
    obj.edit415:setTop(25);
    obj.edit415:setWidth(35);
    obj.edit415:setHeight(25);
    obj.edit415:setField("indiceArmadura");
    obj.edit415:setName("edit415");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.layout106);
    obj.label256:setLeft(285);
    obj.label256:setTop(30);
    obj.label256:setWidth(70);
    obj.label256:setHeight(20);
    obj.label256:setText("Penalidade");
    obj.label256:setName("label256");

    obj.edit416 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit416:setParent(obj.layout106);
    obj.edit416:setLeft(355);
    obj.edit416:setTop(25);
    obj.edit416:setWidth(30);
    obj.edit416:setHeight(25);
    obj.edit416:setField("penalidadeArmadura");
    obj.edit416:setName("edit416");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.layout106);
    obj.label257:setLeft(10);
    obj.label257:setTop(55);
    obj.label257:setWidth(45);
    obj.label257:setHeight(20);
    obj.label257:setText("Outros");
    obj.label257:setName("label257");

    obj.edit417 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit417:setParent(obj.layout106);
    obj.edit417:setLeft(55);
    obj.edit417:setTop(50);
    obj.edit417:setWidth(135);
    obj.edit417:setHeight(25);
    obj.edit417:setField("outrosArmadura");
    obj.edit417:setName("edit417");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.layout106);
    obj.label258:setLeft(195);
    obj.label258:setTop(55);
    obj.label258:setWidth(40);
    obj.label258:setHeight(20);
    obj.label258:setText("Força");
    obj.label258:setName("label258");

    obj.edit418 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit418:setParent(obj.layout106);
    obj.edit418:setLeft(240);
    obj.edit418:setTop(50);
    obj.edit418:setWidth(35);
    obj.edit418:setHeight(25);
    obj.edit418:setField("forcaMinArmadura");
    obj.edit418:setName("edit418");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.layout106);
    obj.label259:setLeft(285);
    obj.label259:setTop(55);
    obj.label259:setWidth(70);
    obj.label259:setHeight(20);
    obj.label259:setText("Eficácia");
    obj.label259:setName("label259");

    obj.edit419 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit419:setParent(obj.layout106);
    obj.edit419:setLeft(355);
    obj.edit419:setTop(50);
    obj.edit419:setWidth(30);
    obj.edit419:setHeight(25);
    obj.edit419:setField("eficaciaArmadura");
    obj.edit419:setName("edit419");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.scrollBox5);
    obj.layout107:setLeft(820);
    obj.layout107:setTop(515);
    obj.layout107:setWidth(400);
    obj.layout107:setHeight(85);
    obj.layout107:setName("layout107");

    obj.rectangle113 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout107);
    obj.rectangle113:setLeft(0);
    obj.rectangle113:setTop(0);
    obj.rectangle113:setWidth(400);
    obj.rectangle113:setHeight(85);
    obj.rectangle113:setColor("black");
    obj.rectangle113:setXradius(15);
    obj.rectangle113:setYradius(15);
    obj.rectangle113:setCornerType("round");
    obj.rectangle113:setName("rectangle113");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.layout107);
    obj.label260:setLeft(0);
    obj.label260:setTop(0);
    obj.label260:setWidth(400);
    obj.label260:setHeight(20);
    obj.label260:setText("PROTEÇÃO/ESCUDO");
    obj.label260:setHorzTextAlign("center");
    obj.label260:setName("label260");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.layout107);
    obj.label261:setLeft(10);
    obj.label261:setTop(30);
    obj.label261:setWidth(45);
    obj.label261:setHeight(20);
    obj.label261:setText("Tipo");
    obj.label261:setName("label261");

    obj.edit420 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit420:setParent(obj.layout107);
    obj.edit420:setLeft(55);
    obj.edit420:setTop(25);
    obj.edit420:setWidth(135);
    obj.edit420:setHeight(25);
    obj.edit420:setField("tipoEscudo");
    obj.edit420:setName("edit420");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.layout107);
    obj.label262:setLeft(195);
    obj.label262:setTop(30);
    obj.label262:setWidth(40);
    obj.label262:setHeight(20);
    obj.label262:setText("Aparar");
    obj.label262:setName("label262");

    obj.edit421 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit421:setParent(obj.layout107);
    obj.edit421:setLeft(240);
    obj.edit421:setTop(25);
    obj.edit421:setWidth(35);
    obj.edit421:setHeight(25);
    obj.edit421:setField("apararEscudo");
    obj.edit421:setName("edit421");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.layout107);
    obj.label263:setLeft(285);
    obj.label263:setTop(30);
    obj.label263:setWidth(70);
    obj.label263:setHeight(20);
    obj.label263:setText("Penalidade");
    obj.label263:setName("label263");

    obj.edit422 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit422:setParent(obj.layout107);
    obj.edit422:setLeft(355);
    obj.edit422:setTop(25);
    obj.edit422:setWidth(30);
    obj.edit422:setHeight(25);
    obj.edit422:setField("penalidadeEscudo");
    obj.edit422:setName("edit422");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.layout107);
    obj.label264:setLeft(10);
    obj.label264:setTop(55);
    obj.label264:setWidth(45);
    obj.label264:setHeight(20);
    obj.label264:setText("Outros");
    obj.label264:setName("label264");

    obj.edit423 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit423:setParent(obj.layout107);
    obj.edit423:setLeft(55);
    obj.edit423:setTop(50);
    obj.edit423:setWidth(135);
    obj.edit423:setHeight(25);
    obj.edit423:setField("outrosEscudo");
    obj.edit423:setName("edit423");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.layout107);
    obj.label265:setLeft(195);
    obj.label265:setTop(55);
    obj.label265:setWidth(40);
    obj.label265:setHeight(20);
    obj.label265:setText("Força");
    obj.label265:setName("label265");

    obj.edit424 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit424:setParent(obj.layout107);
    obj.edit424:setLeft(240);
    obj.edit424:setTop(50);
    obj.edit424:setWidth(35);
    obj.edit424:setHeight(25);
    obj.edit424:setField("forcaMinEscudo");
    obj.edit424:setName("edit424");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.layout107);
    obj.label266:setLeft(285);
    obj.label266:setTop(55);
    obj.label266:setWidth(70);
    obj.label266:setHeight(20);
    obj.label266:setText("Cobertura");
    obj.label266:setName("label266");

    obj.edit425 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit425:setParent(obj.layout107);
    obj.edit425:setLeft(355);
    obj.edit425:setTop(50);
    obj.edit425:setWidth(30);
    obj.edit425:setHeight(25);
    obj.edit425:setField("coberturaEscudo");
    obj.edit425:setName("edit425");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrições");
    obj.tab4:setName("tab4");

    obj.frmACN4 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN4:setParent(obj.tab4);
    obj.frmACN4:setName("frmACN4");
    obj.frmACN4:setAlign("client");
    obj.frmACN4:setTheme("dark");
    obj.frmACN4:setMargins({top=1});

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmACN4);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.scrollBox6);
    obj.layout108:setLeft(0);
    obj.layout108:setTop(0);
    obj.layout108:setWidth(960);
    obj.layout108:setHeight(70);
    obj.layout108:setName("layout108");

    obj.rectangle114 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout108);
    obj.rectangle114:setLeft(5);
    obj.rectangle114:setTop(0);
    obj.rectangle114:setWidth(950);
    obj.rectangle114:setHeight(70);
    obj.rectangle114:setColor("black");
    obj.rectangle114:setXradius(15);
    obj.rectangle114:setYradius(15);
    obj.rectangle114:setCornerType("round");
    obj.rectangle114:setName("rectangle114");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout108);
    obj.layout109:setLeft(5);
    obj.layout109:setTop(5);
    obj.layout109:setWidth(310);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.layout109);
    obj.label267:setLeft(0);
    obj.label267:setTop(5);
    obj.label267:setWidth(100);
    obj.label267:setHeight(20);
    obj.label267:setText("Sexo");
    obj.label267:setHorzTextAlign("trailing");
    obj.label267:setName("label267");

    obj.edit426 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit426:setParent(obj.layout109);
    obj.edit426:setLeft(110);
    obj.edit426:setTop(0);
    obj.edit426:setWidth(200);
    obj.edit426:setHeight(25);
    obj.edit426:setField("desc_sexo");
    obj.edit426:setName("edit426");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout108);
    obj.layout110:setLeft(320);
    obj.layout110:setTop(5);
    obj.layout110:setWidth(310);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.layout110);
    obj.label268:setLeft(0);
    obj.label268:setTop(5);
    obj.label268:setWidth(100);
    obj.label268:setHeight(20);
    obj.label268:setText("Altura");
    obj.label268:setHorzTextAlign("trailing");
    obj.label268:setName("label268");

    obj.edit427 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit427:setParent(obj.layout110);
    obj.edit427:setLeft(110);
    obj.edit427:setTop(0);
    obj.edit427:setWidth(200);
    obj.edit427:setHeight(25);
    obj.edit427:setField("desc_altura");
    obj.edit427:setName("edit427");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout108);
    obj.layout111:setLeft(585);
    obj.layout111:setTop(5);
    obj.layout111:setWidth(310);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.layout111);
    obj.label269:setLeft(0);
    obj.label269:setTop(5);
    obj.label269:setWidth(100);
    obj.label269:setHeight(20);
    obj.label269:setText("Olhos");
    obj.label269:setHorzTextAlign("trailing");
    obj.label269:setName("label269");

    obj.edit428 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit428:setParent(obj.layout111);
    obj.edit428:setLeft(110);
    obj.edit428:setTop(0);
    obj.edit428:setWidth(200);
    obj.edit428:setHeight(25);
    obj.edit428:setField("desc_olhos");
    obj.edit428:setName("edit428");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout108);
    obj.layout112:setLeft(5);
    obj.layout112:setTop(35);
    obj.layout112:setWidth(310);
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.layout112);
    obj.label270:setLeft(0);
    obj.label270:setTop(5);
    obj.label270:setWidth(100);
    obj.label270:setHeight(20);
    obj.label270:setText("Raça");
    obj.label270:setHorzTextAlign("trailing");
    obj.label270:setName("label270");

    obj.edit429 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit429:setParent(obj.layout112);
    obj.edit429:setLeft(110);
    obj.edit429:setTop(0);
    obj.edit429:setWidth(200);
    obj.edit429:setHeight(25);
    obj.edit429:setField("desc_raca");
    obj.edit429:setName("edit429");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout108);
    obj.layout113:setLeft(320);
    obj.layout113:setTop(35);
    obj.layout113:setWidth(310);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.layout113);
    obj.label271:setLeft(0);
    obj.label271:setTop(5);
    obj.label271:setWidth(100);
    obj.label271:setHeight(20);
    obj.label271:setText("Nascimento");
    obj.label271:setHorzTextAlign("trailing");
    obj.label271:setName("label271");

    obj.edit430 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit430:setParent(obj.layout113);
    obj.edit430:setLeft(110);
    obj.edit430:setTop(0);
    obj.edit430:setWidth(200);
    obj.edit430:setHeight(25);
    obj.edit430:setField("desc_nascimento");
    obj.edit430:setName("edit430");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout108);
    obj.layout114:setLeft(585);
    obj.layout114:setTop(35);
    obj.layout114:setWidth(310);
    obj.layout114:setHeight(25);
    obj.layout114:setName("layout114");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.layout114);
    obj.label272:setLeft(0);
    obj.label272:setTop(5);
    obj.label272:setWidth(100);
    obj.label272:setHeight(20);
    obj.label272:setText("Cabelo");
    obj.label272:setHorzTextAlign("trailing");
    obj.label272:setName("label272");

    obj.edit431 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit431:setParent(obj.layout114);
    obj.edit431:setLeft(110);
    obj.edit431:setTop(0);
    obj.edit431:setWidth(200);
    obj.edit431:setHeight(25);
    obj.edit431:setField("desc_cabelo");
    obj.edit431:setName("edit431");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox6);
    obj.layout115:setLeft(0);
    obj.layout115:setTop(80);
    obj.layout115:setWidth(400);
    obj.layout115:setHeight(175);
    obj.layout115:setName("layout115");

    obj.rectangle115 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout115);
    obj.rectangle115:setLeft(0);
    obj.rectangle115:setTop(0);
    obj.rectangle115:setWidth(400);
    obj.rectangle115:setHeight(175);
    obj.rectangle115:setColor("black");
    obj.rectangle115:setXradius(15);
    obj.rectangle115:setYradius(15);
    obj.rectangle115:setCornerType("round");
    obj.rectangle115:setName("rectangle115");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.layout115);
    obj.label273:setLeft(0);
    obj.label273:setTop(0);
    obj.label273:setWidth(400);
    obj.label273:setHeight(20);
    obj.label273:setText("Aparencia");
    obj.label273:setHorzTextAlign("center");
    obj.label273:setName("label273");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout115);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(135);
    obj.textEditor6:setField("aparencia");
    obj.textEditor6:setName("textEditor6");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.scrollBox6);
    obj.layout116:setLeft(0);
    obj.layout116:setTop(260);
    obj.layout116:setWidth(400);
    obj.layout116:setHeight(175);
    obj.layout116:setName("layout116");

    obj.rectangle116 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout116);
    obj.rectangle116:setLeft(0);
    obj.rectangle116:setTop(0);
    obj.rectangle116:setWidth(400);
    obj.rectangle116:setHeight(175);
    obj.rectangle116:setColor("black");
    obj.rectangle116:setXradius(15);
    obj.rectangle116:setYradius(15);
    obj.rectangle116:setCornerType("round");
    obj.rectangle116:setName("rectangle116");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.layout116);
    obj.label274:setLeft(0);
    obj.label274:setTop(0);
    obj.label274:setWidth(400);
    obj.label274:setHeight(20);
    obj.label274:setText("Personalidade");
    obj.label274:setHorzTextAlign("center");
    obj.label274:setName("label274");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout116);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(380);
    obj.textEditor7:setHeight(135);
    obj.textEditor7:setField("personalidade");
    obj.textEditor7:setName("textEditor7");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.scrollBox6);
    obj.layout117:setLeft(0);
    obj.layout117:setTop(440);
    obj.layout117:setWidth(400);
    obj.layout117:setHeight(175);
    obj.layout117:setName("layout117");

    obj.rectangle117 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout117);
    obj.rectangle117:setLeft(0);
    obj.rectangle117:setTop(0);
    obj.rectangle117:setWidth(400);
    obj.rectangle117:setHeight(175);
    obj.rectangle117:setColor("black");
    obj.rectangle117:setXradius(15);
    obj.rectangle117:setYradius(15);
    obj.rectangle117:setCornerType("round");
    obj.rectangle117:setName("rectangle117");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.layout117);
    obj.label275:setLeft(0);
    obj.label275:setTop(0);
    obj.label275:setWidth(400);
    obj.label275:setHeight(20);
    obj.label275:setText("Idiomas");
    obj.label275:setHorzTextAlign("center");
    obj.label275:setName("label275");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout117);
    obj.textEditor8:setLeft(10);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(380);
    obj.textEditor8:setHeight(135);
    obj.textEditor8:setField("idiomas");
    obj.textEditor8:setName("textEditor8");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.scrollBox6);
    obj.layout118:setLeft(410);
    obj.layout118:setTop(80);
    obj.layout118:setWidth(800);
    obj.layout118:setHeight(535);
    obj.layout118:setName("layout118");

    obj.rectangle118 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout118);
    obj.rectangle118:setLeft(0);
    obj.rectangle118:setTop(0);
    obj.rectangle118:setWidth(800);
    obj.rectangle118:setHeight(535);
    obj.rectangle118:setColor("black");
    obj.rectangle118:setXradius(15);
    obj.rectangle118:setYradius(15);
    obj.rectangle118:setCornerType("round");
    obj.rectangle118:setName("rectangle118");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.layout118);
    obj.label276:setLeft(0);
    obj.label276:setTop(0);
    obj.label276:setWidth(800);
    obj.label276:setHeight(20);
    obj.label276:setText("Historia");
    obj.label276:setHorzTextAlign("center");
    obj.label276:setName("label276");

    obj.button157 = GUI.fromHandle(_obj_newObject("button"));
    obj.button157:setParent(obj.layout118);
    obj.button157:setLeft(695);
    obj.button157:setTop(1);
    obj.button157:setWidth(100);
    obj.button157:setHeight(20);
    obj.button157:setText("Copiar Antigo");
    obj.button157:setName("button157");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout118);
    obj.richEdit1:setLeft(10);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(780);
    obj.richEdit1:setHeight(495);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações A");
    obj.tab5:setName("tab5");

    obj.frmACN5 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN5:setParent(obj.tab5);
    obj.frmACN5:setName("frmACN5");
    obj.frmACN5:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmACN5);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.scrollBox7);
    obj.layout119:setAlign("left");
    obj.layout119:setWidth(400);
    obj.layout119:setMargins({right=10});
    obj.layout119:setName("layout119");

    obj.rectangle119 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout119);
    obj.rectangle119:setAlign("client");
    obj.rectangle119:setColor("black");
    obj.rectangle119:setXradius(5);
    obj.rectangle119:setYradius(15);
    obj.rectangle119:setCornerType("round");
    obj.rectangle119:setName("rectangle119");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.rectangle119);
    obj.label277:setAlign("top");
    obj.label277:setHeight(20);
    obj.label277:setText("Anotações");
    obj.label277:setHorzTextAlign("center");
    obj.label277:setName("label277");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle119);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("anotacoes1");
    obj.textEditor9:setMargins({left=10,right=10,bottom=10});
    obj.textEditor9:setName("textEditor9");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.scrollBox7);
    obj.layout120:setAlign("left");
    obj.layout120:setWidth(400);
    obj.layout120:setMargins({right=10});
    obj.layout120:setName("layout120");

    obj.rectangle120 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout120);
    obj.rectangle120:setAlign("client");
    obj.rectangle120:setColor("black");
    obj.rectangle120:setXradius(5);
    obj.rectangle120:setYradius(15);
    obj.rectangle120:setCornerType("round");
    obj.rectangle120:setName("rectangle120");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.rectangle120);
    obj.label278:setAlign("top");
    obj.label278:setHeight(20);
    obj.label278:setText("Anotações");
    obj.label278:setHorzTextAlign("center");
    obj.label278:setName("label278");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle120);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setField("anotacoes2");
    obj.textEditor10:setMargins({left=10,right=10,bottom=10});
    obj.textEditor10:setName("textEditor10");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox7);
    obj.layout121:setAlign("left");
    obj.layout121:setWidth(400);
    obj.layout121:setMargins({right=10});
    obj.layout121:setName("layout121");

    obj.rectangle121 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout121);
    obj.rectangle121:setAlign("client");
    obj.rectangle121:setColor("black");
    obj.rectangle121:setXradius(5);
    obj.rectangle121:setYradius(15);
    obj.rectangle121:setCornerType("round");
    obj.rectangle121:setName("rectangle121");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.rectangle121);
    obj.label279:setAlign("top");
    obj.label279:setHeight(20);
    obj.label279:setText("Anotações");
    obj.label279:setHorzTextAlign("center");
    obj.label279:setName("label279");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle121);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("anotacoes3");
    obj.textEditor11:setMargins({left=10,right=10,bottom=10});
    obj.textEditor11:setName("textEditor11");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Anotações B");
    obj.tab6:setName("tab6");

    obj.frmACN5_2 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN5_2:setParent(obj.tab6);
    obj.frmACN5_2:setName("frmACN5_2");
    obj.frmACN5_2:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmACN5_2);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox8);
    obj.layout122:setAlign("left");
    obj.layout122:setWidth(400);
    obj.layout122:setMargins({right=10});
    obj.layout122:setName("layout122");

    obj.rectangle122 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout122);
    obj.rectangle122:setAlign("client");
    obj.rectangle122:setColor("black");
    obj.rectangle122:setXradius(5);
    obj.rectangle122:setYradius(15);
    obj.rectangle122:setCornerType("round");
    obj.rectangle122:setName("rectangle122");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.rectangle122);
    obj.label280:setAlign("top");
    obj.label280:setHeight(20);
    obj.label280:setText("Anotações");
    obj.label280:setHorzTextAlign("center");
    obj.label280:setName("label280");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle122);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("anotacoes4");
    obj.textEditor12:setMargins({left=10,right=10,bottom=10});
    obj.textEditor12:setName("textEditor12");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox8);
    obj.layout123:setAlign("left");
    obj.layout123:setWidth(400);
    obj.layout123:setMargins({right=10});
    obj.layout123:setName("layout123");

    obj.rectangle123 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.layout123);
    obj.rectangle123:setAlign("client");
    obj.rectangle123:setColor("black");
    obj.rectangle123:setXradius(5);
    obj.rectangle123:setYradius(15);
    obj.rectangle123:setCornerType("round");
    obj.rectangle123:setName("rectangle123");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.rectangle123);
    obj.label281:setAlign("top");
    obj.label281:setHeight(20);
    obj.label281:setText("Anotações");
    obj.label281:setHorzTextAlign("center");
    obj.label281:setName("label281");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.rectangle123);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("anotacoes5");
    obj.textEditor13:setMargins({left=10,right=10,bottom=10});
    obj.textEditor13:setName("textEditor13");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox8);
    obj.layout124:setAlign("left");
    obj.layout124:setWidth(400);
    obj.layout124:setMargins({right=10});
    obj.layout124:setName("layout124");

    obj.rectangle124 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.layout124);
    obj.rectangle124:setAlign("client");
    obj.rectangle124:setColor("black");
    obj.rectangle124:setXradius(5);
    obj.rectangle124:setYradius(15);
    obj.rectangle124:setCornerType("round");
    obj.rectangle124:setName("rectangle124");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.rectangle124);
    obj.label282:setAlign("top");
    obj.label282:setHeight(20);
    obj.label282:setText("Anotações");
    obj.label282:setHorzTextAlign("center");
    obj.label282:setName("label282");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.rectangle124);
    obj.textEditor14:setAlign("client");
    obj.textEditor14:setField("anotacoes6");
    obj.textEditor14:setMargins({left=10,right=10,bottom=10});
    obj.textEditor14:setName("textEditor14");

    obj.rectangle125 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.rectangle124);
    obj.rectangle125:setAlign("bottom");
    obj.rectangle125:setHeight(380);
    obj.rectangle125:setColor("DimGray");
    obj.rectangle125:setXradius(5);
    obj.rectangle125:setYradius(5);
    obj.rectangle125:setCornerType("innerLine");
    obj.rectangle125:setMargins({left=10,right=10,bottom=10});
    obj.rectangle125:setStrokeColor("white");
    obj.rectangle125:setStrokeSize(1);
    obj.rectangle125:setName("rectangle125");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle125);
    obj.image2:setAlign("client");
    obj.image2:setField("anotacoesPic6");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Creditos");
    obj.tab7:setName("tab7");

    obj.frmACN6 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN6:setParent(obj.tab7);
    obj.frmACN6:setName("frmACN6");
    obj.frmACN6:setAlign("client");
    obj.frmACN6:setTheme("dark");
    obj.frmACN6:setMargins({top=1});


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
    obj.scrollBox9:setParent(obj.frmACN6);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox9);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(500);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Ficha ACN/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox9);
    obj.image4:setLeft(550);
    obj.image4:setTop(0);
    obj.image4:setWidth(500);
    obj.image4:setHeight(250);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/Ficha ACN/images/SALEM.png");
    obj.image4:setName("image4");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.scrollBox9);
    obj.layout125:setLeft(550);
    obj.layout125:setTop(260);
    obj.layout125:setWidth(200);
    obj.layout125:setHeight(150);
    obj.layout125:setName("layout125");

    obj.rectangle126 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.layout125);
    obj.rectangle126:setLeft(0);
    obj.rectangle126:setTop(0);
    obj.rectangle126:setWidth(200);
    obj.rectangle126:setHeight(150);
    obj.rectangle126:setColor("black");
    obj.rectangle126:setXradius(15);
    obj.rectangle126:setYradius(15);
    obj.rectangle126:setCornerType("round");
    obj.rectangle126:setName("rectangle126");

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.layout125);
    obj.label283:setLeft(0);
    obj.label283:setTop(10);
    obj.label283:setWidth(200);
    obj.label283:setHeight(20);
    obj.label283:setText("Programador: Vinny (Ambesek)");
    obj.label283:setHorzTextAlign("center");
    obj.label283:setName("label283");

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.layout125);
    obj.label284:setLeft(0);
    obj.label284:setTop(35);
    obj.label284:setWidth(200);
    obj.label284:setHeight(20);
    obj.label284:setText("Arte: Nefer (Nefertyne)");
    obj.label284:setHorzTextAlign("center");
    obj.label284:setName("label284");

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.layout125);
    obj.label285:setLeft(0);
    obj.label285:setTop(60);
    obj.label285:setWidth(200);
    obj.label285:setHeight(20);
    obj.label285:setText("Consultor: Π (Pi)");
    obj.label285:setHorzTextAlign("center");
    obj.label285:setName("label285");

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.layout125);
    obj.label286:setLeft(0);
    obj.label286:setTop(95);
    obj.label286:setWidth(200);
    obj.label286:setHeight(20);
    obj.label286:setText("Ficha feita para a mesa SALEM");
    obj.label286:setHorzTextAlign("center");
    obj.label286:setName("label286");

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.layout125);
    obj.label287:setLeft(0);
    obj.label287:setTop(120);
    obj.label287:setWidth(200);
    obj.label287:setHeight(20);
    obj.label287:setText("Sistema: Ao Cair da Noite");
    obj.label287:setHorzTextAlign("center");
    obj.label287:setName("label287");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.scrollBox9);
    obj.layout126:setLeft(550);
    obj.layout126:setTop(420);
    obj.layout126:setWidth(200);
    obj.layout126:setHeight(150);
    obj.layout126:setName("layout126");

    obj.rectangle127 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.layout126);
    obj.rectangle127:setLeft(0);
    obj.rectangle127:setTop(0);
    obj.rectangle127:setWidth(200);
    obj.rectangle127:setHeight(150);
    obj.rectangle127:setColor("black");
    obj.rectangle127:setName("rectangle127");

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.layout126);
    obj.label288:setLeft(0);
    obj.label288:setTop(10);
    obj.label288:setWidth(80);
    obj.label288:setHeight(20);
    obj.label288:setText("Tema:");
    obj.label288:setHorzTextAlign("center");
    obj.label288:setName("label288");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout126);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(10);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("theme");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setItems({'Escuro', 'Claro'});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout126);
    obj.dataLink86:setField("theme");
    obj.dataLink86:setDefaultValue("Escuro");
    obj.dataLink86:setName("dataLink86");

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.layout126);
    obj.label289:setLeft(0);
    obj.label289:setTop(35);
    obj.label289:setWidth(90);
    obj.label289:setHeight(20);
    obj.label289:setText("Cores: ");
    obj.label289:setHorzTextAlign("center");
    obj.label289:setName("label289");

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.layout126);
    obj.label290:setLeft(0);
    obj.label290:setTop(60);
    obj.label290:setWidth(90);
    obj.label290:setHeight(20);
    obj.label290:setText("Fundo ");
    obj.label290:setHorzTextAlign("center");
    obj.label290:setName("label290");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout126);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(60);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorBackground");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout126);
    obj.dataLink87:setField("colorBackground");
    obj.dataLink87:setDefaultValue("#000000");
    obj.dataLink87:setName("dataLink87");

    obj.label291 = GUI.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.layout126);
    obj.label291:setLeft(0);
    obj.label291:setTop(85);
    obj.label291:setWidth(90);
    obj.label291:setHeight(20);
    obj.label291:setText("Linhas ");
    obj.label291:setHorzTextAlign("center");
    obj.label291:setName("label291");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout126);
    obj.comboBox5:setLeft(95);
    obj.comboBox5:setTop(85);
    obj.comboBox5:setWidth(90);
    obj.comboBox5:setField("colorStroke");
    obj.comboBox5:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox5:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout126);
    obj.dataLink88:setField("colorStroke");
    obj.dataLink88:setDefaultValue("#FFFFFF");
    obj.dataLink88:setName("dataLink88");

    obj.label292 = GUI.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.layout126);
    obj.label292:setLeft(0);
    obj.label292:setTop(110);
    obj.label292:setWidth(90);
    obj.label292:setHeight(20);
    obj.label292:setText("Fonte ");
    obj.label292:setHorzTextAlign("center");
    obj.label292:setName("label292");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout126);
    obj.comboBox6:setLeft(95);
    obj.comboBox6:setTop(110);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setField("colorFont");
    obj.comboBox6:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox6:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout126);
    obj.dataLink89:setField("colorFont");
    obj.dataLink89:setDefaultValue("#FFFFFF");
    obj.dataLink89:setName("dataLink89");

    obj.label293 = GUI.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.scrollBox9);
    obj.label293:setLeft(0);
    obj.label293:setTop(505);
    obj.label293:setWidth(200);
    obj.label293:setHeight(20);
    obj.label293:setText("Versão Atual: ");
    obj.label293:setHorzTextAlign("leading");
    obj.label293:setField("versionInstalled");
    obj.label293:setName("label293");

    obj.label294 = GUI.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.scrollBox9);
    obj.label294:setLeft(0);
    obj.label294:setTop(530);
    obj.label294:setWidth(200);
    obj.label294:setHeight(20);
    obj.label294:setText("Sua Versão: ");
    obj.label294:setHorzTextAlign("leading");
    obj.label294:setField("versionDownloaded");
    obj.label294:setName("label294");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.scrollBox9);
    obj.checkBox46:setLeft(0);
    obj.checkBox46:setTop(555);
    obj.checkBox46:setWidth(200);
    obj.checkBox46:setHeight(20);
    obj.checkBox46:setField("noUpdate");
    obj.checkBox46:setText("Não pedir para atualizar.");
    obj.checkBox46:setName("checkBox46");

    obj.button158 = GUI.fromHandle(_obj_newObject("button"));
    obj.button158:setParent(obj.scrollBox9);
    obj.button158:setLeft(180);
    obj.button158:setTop(505);
    obj.button158:setWidth(100);
    obj.button158:setText("Change Log");
    obj.button158:setName("button158");

    obj.button159 = GUI.fromHandle(_obj_newObject("button"));
    obj.button159:setParent(obj.scrollBox9);
    obj.button159:setLeft(180);
    obj.button159:setTop(530);
    obj.button159:setWidth(100);
    obj.button159:setText("Atualizar");
    obj.button159:setName("button159");

    obj.label295 = GUI.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.scrollBox9);
    obj.label295:setLeft(305);
    obj.label295:setTop(505);
    obj.label295:setWidth(200);
    obj.label295:setHeight(20);
    obj.label295:setText("Conheça as Mesas:");
    obj.label295:setName("label295");

    obj.button160 = GUI.fromHandle(_obj_newObject("button"));
    obj.button160:setParent(obj.scrollBox9);
    obj.button160:setLeft(305);
    obj.button160:setTop(530);
    obj.button160:setWidth(100);
    obj.button160:setText("RPGmeister");
    obj.button160:setName("button160");

    obj.button161 = GUI.fromHandle(_obj_newObject("button"));
    obj.button161:setParent(obj.scrollBox9);
    obj.button161:setLeft(410);
    obj.button161:setTop(530);
    obj.button161:setWidth(100);
    obj.button161:setText("SALEM");
    obj.button161:setName("button161");

    obj.button162 = GUI.fromHandle(_obj_newObject("button"));
    obj.button162:setParent(obj.scrollBox9);
    obj.button162:setLeft(180);
    obj.button162:setTop(555);
    obj.button162:setWidth(100);
    obj.button162:setHeight(20);
    obj.button162:setText("Exportar Ficha");
    obj.button162:setName("button162");

    obj.button163 = GUI.fromHandle(_obj_newObject("button"));
    obj.button163:setParent(obj.scrollBox9);
    obj.button163:setLeft(180);
    obj.button163:setTop(580);
    obj.button163:setWidth(100);
    obj.button163:setHeight(20);
    obj.button163:setText("Importar Ficha");
    obj.button163:setName("button163");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox9);
    obj.layout127:setLeft(760);
    obj.layout127:setTop(260);
    obj.layout127:setWidth(340);
    obj.layout127:setHeight(295);
    obj.layout127:setName("layout127");

    obj.rectangle128 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.layout127);
    obj.rectangle128:setAlign("client");
    obj.rectangle128:setColor("black");
    obj.rectangle128:setXradius(15);
    obj.rectangle128:setYradius(15);
    obj.rectangle128:setCornerType("round");
    obj.rectangle128:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle128:setName("rectangle128");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle128);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(25);
    obj.layout128:setName("layout128");

    obj.label296 = GUI.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.layout128);
    obj.label296:setAlign("left");
    obj.label296:setWidth(75);
    obj.label296:setText("");
    obj.label296:setMargins({right=5});
    obj.label296:setName("label296");

    obj.label297 = GUI.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.layout128);
    obj.label297:setAlign("left");
    obj.label297:setWidth(40);
    obj.label297:setText("Inic");
    obj.label297:setMargins({right=5});
    obj.label297:setHorzTextAlign("center");
    obj.label297:setName("label297");

    obj.label298 = GUI.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.layout128);
    obj.label298:setAlign("left");
    obj.label298:setWidth(85);
    obj.label298:setText("Aprimoramento");
    obj.label298:setMargins({right=5});
    obj.label298:setHorzTextAlign("center");
    obj.label298:setFontSize(11);
    obj.label298:setName("label298");

    obj.label299 = GUI.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.layout128);
    obj.label299:setAlign("left");
    obj.label299:setWidth(40);
    obj.label299:setText("Custo");
    obj.label299:setMargins({left=25,right=5});
    obj.label299:setHorzTextAlign("center");
    obj.label299:setName("label299");

    obj.label300 = GUI.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.layout128);
    obj.label300:setAlign("left");
    obj.label300:setWidth(40);
    obj.label300:setText("XP");
    obj.label300:setMargins({left=0,right=5});
    obj.label300:setHorzTextAlign("center");
    obj.label300:setName("label300");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle128);
    obj.layout129:setAlign("top");
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.label301 = GUI.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.layout129);
    obj.label301:setAlign("left");
    obj.label301:setWidth(75);
    obj.label301:setText("Atr. Físico");
    obj.label301:setMargins({right=5});
    obj.label301:setName("label301");

    obj.rectangle129 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.layout129);
    obj.rectangle129:setAlign("left");
    obj.rectangle129:setWidth(40);
    obj.rectangle129:setColor("black");
    obj.rectangle129:setStrokeColor("white");
    obj.rectangle129:setStrokeSize(1);
    obj.rectangle129:setMargins({right=5});
    obj.rectangle129:setName("rectangle129");

    obj.label302 = GUI.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.rectangle129);
    obj.label302:setAlign("client");
    obj.label302:setField("auditini_atrFis");
    obj.label302:setHorzTextAlign("center");
    obj.label302:setName("label302");

    obj.edit432 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit432:setParent(obj.layout129);
    obj.edit432:setAlign("left");
    obj.edit432:setWidth(40);
    obj.edit432:setField("auditbonuscost_atrFis");
    obj.edit432:setMargins({right=5});
    obj.edit432:setType("float");
    obj.edit432:setDecimalPlaces(1);
    obj.edit432:setName("edit432");

    obj.rectangle130 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.layout129);
    obj.rectangle130:setAlign("left");
    obj.rectangle130:setWidth(40);
    obj.rectangle130:setColor("black");
    obj.rectangle130:setStrokeColor("white");
    obj.rectangle130:setStrokeSize(1);
    obj.rectangle130:setMargins({right=5});
    obj.rectangle130:setName("rectangle130");

    obj.label303 = GUI.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.rectangle130);
    obj.label303:setAlign("client");
    obj.label303:setField("auditbonus_atrFis");
    obj.label303:setHorzTextAlign("center");
    obj.label303:setName("label303");

    obj.edit433 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit433:setParent(obj.layout129);
    obj.edit433:setAlign("left");
    obj.edit433:setWidth(40);
    obj.edit433:setField("auditxpcost_atrFis");
    obj.edit433:setMargins({left=25,right=5});
    obj.edit433:setType("float");
    obj.edit433:setDecimalPlaces(1);
    obj.edit433:setName("edit433");

    obj.rectangle131 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.layout129);
    obj.rectangle131:setAlign("left");
    obj.rectangle131:setWidth(40);
    obj.rectangle131:setColor("black");
    obj.rectangle131:setStrokeColor("white");
    obj.rectangle131:setStrokeSize(1);
    obj.rectangle131:setMargins({right=5});
    obj.rectangle131:setName("rectangle131");

    obj.label304 = GUI.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.rectangle131);
    obj.label304:setAlign("client");
    obj.label304:setField("auditxp_atrFis");
    obj.label304:setHorzTextAlign("center");
    obj.label304:setName("label304");

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.rectangle128);
    obj.dataLink90:setField("auditbonuscost_atrFis");
    obj.dataLink90:setDefaultValue("3");
    obj.dataLink90:setName("dataLink90");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.rectangle128);
    obj.dataLink91:setField("auditxpcost_atrFis");
    obj.dataLink91:setDefaultValue("3");
    obj.dataLink91:setName("dataLink91");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle128);
    obj.layout130:setAlign("top");
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.label305 = GUI.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.layout130);
    obj.label305:setAlign("left");
    obj.label305:setWidth(75);
    obj.label305:setText("Atr. Mental");
    obj.label305:setMargins({right=5});
    obj.label305:setName("label305");

    obj.rectangle132 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.layout130);
    obj.rectangle132:setAlign("left");
    obj.rectangle132:setWidth(40);
    obj.rectangle132:setColor("black");
    obj.rectangle132:setStrokeColor("white");
    obj.rectangle132:setStrokeSize(1);
    obj.rectangle132:setMargins({right=5});
    obj.rectangle132:setName("rectangle132");

    obj.label306 = GUI.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.rectangle132);
    obj.label306:setAlign("client");
    obj.label306:setField("auditini_atrMen");
    obj.label306:setHorzTextAlign("center");
    obj.label306:setName("label306");

    obj.edit434 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit434:setParent(obj.layout130);
    obj.edit434:setAlign("left");
    obj.edit434:setWidth(40);
    obj.edit434:setField("auditbonuscost_atrMen");
    obj.edit434:setMargins({right=5});
    obj.edit434:setType("float");
    obj.edit434:setDecimalPlaces(1);
    obj.edit434:setName("edit434");

    obj.rectangle133 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.layout130);
    obj.rectangle133:setAlign("left");
    obj.rectangle133:setWidth(40);
    obj.rectangle133:setColor("black");
    obj.rectangle133:setStrokeColor("white");
    obj.rectangle133:setStrokeSize(1);
    obj.rectangle133:setMargins({right=5});
    obj.rectangle133:setName("rectangle133");

    obj.label307 = GUI.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.rectangle133);
    obj.label307:setAlign("client");
    obj.label307:setField("auditbonus_atrMen");
    obj.label307:setHorzTextAlign("center");
    obj.label307:setName("label307");

    obj.edit435 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit435:setParent(obj.layout130);
    obj.edit435:setAlign("left");
    obj.edit435:setWidth(40);
    obj.edit435:setField("auditxpcost_atrMen");
    obj.edit435:setMargins({left=25,right=5});
    obj.edit435:setType("float");
    obj.edit435:setDecimalPlaces(1);
    obj.edit435:setName("edit435");

    obj.rectangle134 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout130);
    obj.rectangle134:setAlign("left");
    obj.rectangle134:setWidth(40);
    obj.rectangle134:setColor("black");
    obj.rectangle134:setStrokeColor("white");
    obj.rectangle134:setStrokeSize(1);
    obj.rectangle134:setMargins({right=5});
    obj.rectangle134:setName("rectangle134");

    obj.label308 = GUI.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.rectangle134);
    obj.label308:setAlign("client");
    obj.label308:setField("auditxp_atrMen");
    obj.label308:setHorzTextAlign("center");
    obj.label308:setName("label308");

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.rectangle128);
    obj.dataLink92:setField("auditbonuscost_atrMen");
    obj.dataLink92:setDefaultValue("3");
    obj.dataLink92:setName("dataLink92");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.rectangle128);
    obj.dataLink93:setField("auditxpcost_atrMen");
    obj.dataLink93:setDefaultValue("3");
    obj.dataLink93:setName("dataLink93");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle128);
    obj.layout131:setAlign("top");
    obj.layout131:setHeight(25);
    obj.layout131:setName("layout131");

    obj.label309 = GUI.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.layout131);
    obj.label309:setAlign("left");
    obj.label309:setWidth(75);
    obj.label309:setText("Apt. Físico");
    obj.label309:setMargins({right=5});
    obj.label309:setName("label309");

    obj.rectangle135 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.layout131);
    obj.rectangle135:setAlign("left");
    obj.rectangle135:setWidth(40);
    obj.rectangle135:setColor("black");
    obj.rectangle135:setStrokeColor("white");
    obj.rectangle135:setStrokeSize(1);
    obj.rectangle135:setMargins({right=5});
    obj.rectangle135:setName("rectangle135");

    obj.label310 = GUI.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.rectangle135);
    obj.label310:setAlign("client");
    obj.label310:setField("auditini_aptFis");
    obj.label310:setHorzTextAlign("center");
    obj.label310:setName("label310");

    obj.edit436 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit436:setParent(obj.layout131);
    obj.edit436:setAlign("left");
    obj.edit436:setWidth(40);
    obj.edit436:setField("auditbonuscost_aptFis");
    obj.edit436:setMargins({right=5});
    obj.edit436:setType("float");
    obj.edit436:setDecimalPlaces(1);
    obj.edit436:setName("edit436");

    obj.rectangle136 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.layout131);
    obj.rectangle136:setAlign("left");
    obj.rectangle136:setWidth(40);
    obj.rectangle136:setColor("black");
    obj.rectangle136:setStrokeColor("white");
    obj.rectangle136:setStrokeSize(1);
    obj.rectangle136:setMargins({right=5});
    obj.rectangle136:setName("rectangle136");

    obj.label311 = GUI.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.rectangle136);
    obj.label311:setAlign("client");
    obj.label311:setField("auditbonus_aptFis");
    obj.label311:setHorzTextAlign("center");
    obj.label311:setName("label311");

    obj.edit437 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit437:setParent(obj.layout131);
    obj.edit437:setAlign("left");
    obj.edit437:setWidth(40);
    obj.edit437:setField("auditxpcost_aptFis");
    obj.edit437:setMargins({left=25,right=5});
    obj.edit437:setType("float");
    obj.edit437:setDecimalPlaces(1);
    obj.edit437:setName("edit437");

    obj.rectangle137 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.layout131);
    obj.rectangle137:setAlign("left");
    obj.rectangle137:setWidth(40);
    obj.rectangle137:setColor("black");
    obj.rectangle137:setStrokeColor("white");
    obj.rectangle137:setStrokeSize(1);
    obj.rectangle137:setMargins({right=5});
    obj.rectangle137:setName("rectangle137");

    obj.label312 = GUI.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.rectangle137);
    obj.label312:setAlign("client");
    obj.label312:setField("auditxp_aptFis");
    obj.label312:setHorzTextAlign("center");
    obj.label312:setName("label312");

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.rectangle128);
    obj.dataLink94:setField("auditbonuscost_aptFis");
    obj.dataLink94:setDefaultValue("1");
    obj.dataLink94:setName("dataLink94");

    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.rectangle128);
    obj.dataLink95:setField("auditxpcost_aptFis");
    obj.dataLink95:setDefaultValue("1.5");
    obj.dataLink95:setName("dataLink95");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle128);
    obj.layout132:setAlign("top");
    obj.layout132:setHeight(25);
    obj.layout132:setName("layout132");

    obj.label313 = GUI.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.layout132);
    obj.label313:setAlign("left");
    obj.label313:setWidth(75);
    obj.label313:setText("Apt. Mental");
    obj.label313:setMargins({right=5});
    obj.label313:setName("label313");

    obj.rectangle138 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.layout132);
    obj.rectangle138:setAlign("left");
    obj.rectangle138:setWidth(40);
    obj.rectangle138:setColor("black");
    obj.rectangle138:setStrokeColor("white");
    obj.rectangle138:setStrokeSize(1);
    obj.rectangle138:setMargins({right=5});
    obj.rectangle138:setName("rectangle138");

    obj.label314 = GUI.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.rectangle138);
    obj.label314:setAlign("client");
    obj.label314:setField("auditini_aptMen");
    obj.label314:setHorzTextAlign("center");
    obj.label314:setName("label314");

    obj.edit438 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit438:setParent(obj.layout132);
    obj.edit438:setAlign("left");
    obj.edit438:setWidth(40);
    obj.edit438:setField("auditbonuscost_aptMen");
    obj.edit438:setMargins({right=5});
    obj.edit438:setType("float");
    obj.edit438:setDecimalPlaces(1);
    obj.edit438:setName("edit438");

    obj.rectangle139 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.layout132);
    obj.rectangle139:setAlign("left");
    obj.rectangle139:setWidth(40);
    obj.rectangle139:setColor("black");
    obj.rectangle139:setStrokeColor("white");
    obj.rectangle139:setStrokeSize(1);
    obj.rectangle139:setMargins({right=5});
    obj.rectangle139:setName("rectangle139");

    obj.label315 = GUI.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.rectangle139);
    obj.label315:setAlign("client");
    obj.label315:setField("auditbonus_aptMen");
    obj.label315:setHorzTextAlign("center");
    obj.label315:setName("label315");

    obj.edit439 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit439:setParent(obj.layout132);
    obj.edit439:setAlign("left");
    obj.edit439:setWidth(40);
    obj.edit439:setField("auditxpcost_aptMen");
    obj.edit439:setMargins({left=25,right=5});
    obj.edit439:setType("float");
    obj.edit439:setDecimalPlaces(1);
    obj.edit439:setName("edit439");

    obj.rectangle140 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle140:setParent(obj.layout132);
    obj.rectangle140:setAlign("left");
    obj.rectangle140:setWidth(40);
    obj.rectangle140:setColor("black");
    obj.rectangle140:setStrokeColor("white");
    obj.rectangle140:setStrokeSize(1);
    obj.rectangle140:setMargins({right=5});
    obj.rectangle140:setName("rectangle140");

    obj.label316 = GUI.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.rectangle140);
    obj.label316:setAlign("client");
    obj.label316:setField("auditxp_aptMen");
    obj.label316:setHorzTextAlign("center");
    obj.label316:setName("label316");

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.rectangle128);
    obj.dataLink96:setField("auditbonuscost_aptMen");
    obj.dataLink96:setDefaultValue("1");
    obj.dataLink96:setName("dataLink96");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.rectangle128);
    obj.dataLink97:setField("auditxpcost_aptMen");
    obj.dataLink97:setDefaultValue("1.5");
    obj.dataLink97:setName("dataLink97");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle128);
    obj.layout133:setAlign("top");
    obj.layout133:setHeight(25);
    obj.layout133:setName("layout133");

    obj.label317 = GUI.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.layout133);
    obj.label317:setAlign("left");
    obj.label317:setWidth(75);
    obj.label317:setText("Especialização");
    obj.label317:setMargins({right=5});
    obj.label317:setFontSize(11);
    obj.label317:setName("label317");

    obj.edit440 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit440:setParent(obj.layout133);
    obj.edit440:setAlign("left");
    obj.edit440:setWidth(40);
    obj.edit440:setField("auditini_espec");
    obj.edit440:setMargins({right=5});
    obj.edit440:setName("edit440");

    obj.edit441 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit441:setParent(obj.layout133);
    obj.edit441:setAlign("left");
    obj.edit441:setWidth(40);
    obj.edit441:setField("auditbonuscost_espec");
    obj.edit441:setMargins({right=5});
    obj.edit441:setName("edit441");

    obj.edit442 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit442:setParent(obj.layout133);
    obj.edit442:setAlign("left");
    obj.edit442:setWidth(40);
    obj.edit442:setField("auditbonus_espec");
    obj.edit442:setMargins({right=5});
    obj.edit442:setName("edit442");

    obj.edit443 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit443:setParent(obj.layout133);
    obj.edit443:setAlign("left");
    obj.edit443:setWidth(40);
    obj.edit443:setField("auditxpcost_espec");
    obj.edit443:setMargins({left=25,right=5});
    obj.edit443:setName("edit443");

    obj.edit444 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit444:setParent(obj.layout133);
    obj.edit444:setAlign("left");
    obj.edit444:setWidth(40);
    obj.edit444:setField("auditxp_espec");
    obj.edit444:setName("edit444");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle128);
    obj.layout134:setAlign("top");
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.label318 = GUI.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.layout134);
    obj.label318:setAlign("left");
    obj.label318:setWidth(75);
    obj.label318:setText("Historico");
    obj.label318:setMargins({right=5});
    obj.label318:setName("label318");

    obj.rectangle141 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle141:setParent(obj.layout134);
    obj.rectangle141:setAlign("left");
    obj.rectangle141:setWidth(40);
    obj.rectangle141:setColor("black");
    obj.rectangle141:setStrokeColor("white");
    obj.rectangle141:setStrokeSize(1);
    obj.rectangle141:setMargins({right=5});
    obj.rectangle141:setName("rectangle141");

    obj.label319 = GUI.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.rectangle141);
    obj.label319:setAlign("client");
    obj.label319:setField("auditini_hist");
    obj.label319:setHorzTextAlign("center");
    obj.label319:setName("label319");

    obj.edit445 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit445:setParent(obj.layout134);
    obj.edit445:setAlign("left");
    obj.edit445:setWidth(40);
    obj.edit445:setField("auditbonuscost_hist");
    obj.edit445:setMargins({right=5});
    obj.edit445:setType("float");
    obj.edit445:setDecimalPlaces(1);
    obj.edit445:setName("edit445");

    obj.rectangle142 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle142:setParent(obj.layout134);
    obj.rectangle142:setAlign("left");
    obj.rectangle142:setWidth(40);
    obj.rectangle142:setColor("black");
    obj.rectangle142:setStrokeColor("white");
    obj.rectangle142:setStrokeSize(1);
    obj.rectangle142:setMargins({right=5});
    obj.rectangle142:setName("rectangle142");

    obj.label320 = GUI.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.rectangle142);
    obj.label320:setAlign("client");
    obj.label320:setField("auditbonus_hist");
    obj.label320:setHorzTextAlign("center");
    obj.label320:setName("label320");

    obj.edit446 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit446:setParent(obj.layout134);
    obj.edit446:setAlign("left");
    obj.edit446:setWidth(40);
    obj.edit446:setField("auditxpcost_hist");
    obj.edit446:setMargins({left=25,right=5});
    obj.edit446:setType("float");
    obj.edit446:setDecimalPlaces(1);
    obj.edit446:setName("edit446");

    obj.rectangle143 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle143:setParent(obj.layout134);
    obj.rectangle143:setAlign("left");
    obj.rectangle143:setWidth(40);
    obj.rectangle143:setColor("black");
    obj.rectangle143:setStrokeColor("white");
    obj.rectangle143:setStrokeSize(1);
    obj.rectangle143:setMargins({right=5});
    obj.rectangle143:setName("rectangle143");

    obj.label321 = GUI.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.rectangle143);
    obj.label321:setAlign("client");
    obj.label321:setField("auditxp_hist");
    obj.label321:setHorzTextAlign("center");
    obj.label321:setName("label321");

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.rectangle128);
    obj.dataLink98:setField("auditbonuscost_hist");
    obj.dataLink98:setDefaultValue("1");
    obj.dataLink98:setName("dataLink98");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.rectangle128);
    obj.dataLink99:setField("auditxpcost_hist");
    obj.dataLink99:setDefaultValue("2");
    obj.dataLink99:setName("dataLink99");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle128);
    obj.layout135:setAlign("top");
    obj.layout135:setHeight(25);
    obj.layout135:setName("layout135");

    obj.label322 = GUI.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.layout135);
    obj.label322:setAlign("left");
    obj.label322:setWidth(75);
    obj.label322:setText("Eidolon");
    obj.label322:setMargins({right=5});
    obj.label322:setName("label322");

    obj.rectangle144 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle144:setParent(obj.layout135);
    obj.rectangle144:setAlign("left");
    obj.rectangle144:setWidth(40);
    obj.rectangle144:setColor("black");
    obj.rectangle144:setStrokeColor("white");
    obj.rectangle144:setStrokeSize(1);
    obj.rectangle144:setMargins({right=5});
    obj.rectangle144:setName("rectangle144");

    obj.label323 = GUI.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.rectangle144);
    obj.label323:setAlign("client");
    obj.label323:setField("auditini_eido");
    obj.label323:setHorzTextAlign("center");
    obj.label323:setName("label323");

    obj.edit447 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit447:setParent(obj.layout135);
    obj.edit447:setAlign("left");
    obj.edit447:setWidth(40);
    obj.edit447:setField("auditbonuscost_eido");
    obj.edit447:setMargins({right=5});
    obj.edit447:setType("float");
    obj.edit447:setDecimalPlaces(1);
    obj.edit447:setName("edit447");

    obj.rectangle145 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle145:setParent(obj.layout135);
    obj.rectangle145:setAlign("left");
    obj.rectangle145:setWidth(40);
    obj.rectangle145:setColor("black");
    obj.rectangle145:setStrokeColor("white");
    obj.rectangle145:setStrokeSize(1);
    obj.rectangle145:setMargins({right=5});
    obj.rectangle145:setName("rectangle145");

    obj.label324 = GUI.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.rectangle145);
    obj.label324:setAlign("client");
    obj.label324:setField("auditbonus_eido");
    obj.label324:setHorzTextAlign("center");
    obj.label324:setName("label324");

    obj.edit448 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit448:setParent(obj.layout135);
    obj.edit448:setAlign("left");
    obj.edit448:setWidth(40);
    obj.edit448:setField("auditxpcost_eido");
    obj.edit448:setMargins({left=25,right=5});
    obj.edit448:setType("float");
    obj.edit448:setDecimalPlaces(1);
    obj.edit448:setName("edit448");

    obj.rectangle146 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle146:setParent(obj.layout135);
    obj.rectangle146:setAlign("left");
    obj.rectangle146:setWidth(40);
    obj.rectangle146:setColor("black");
    obj.rectangle146:setStrokeColor("white");
    obj.rectangle146:setStrokeSize(1);
    obj.rectangle146:setMargins({right=5});
    obj.rectangle146:setName("rectangle146");

    obj.label325 = GUI.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.rectangle146);
    obj.label325:setAlign("client");
    obj.label325:setField("auditxp_eido");
    obj.label325:setHorzTextAlign("center");
    obj.label325:setName("label325");

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.rectangle128);
    obj.dataLink100:setField("auditbonuscost_eido");
    obj.dataLink100:setDefaultValue("2");
    obj.dataLink100:setName("dataLink100");

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.rectangle128);
    obj.dataLink101:setField("auditxpcost_eido");
    obj.dataLink101:setDefaultValue("1");
    obj.dataLink101:setName("dataLink101");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle128);
    obj.layout136:setAlign("top");
    obj.layout136:setHeight(25);
    obj.layout136:setName("layout136");

    obj.label326 = GUI.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.layout136);
    obj.label326:setAlign("left");
    obj.label326:setWidth(75);
    obj.label326:setText("Outros");
    obj.label326:setMargins({right=5});
    obj.label326:setName("label326");

    obj.rectangle147 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle147:setParent(obj.layout136);
    obj.rectangle147:setAlign("left");
    obj.rectangle147:setWidth(40);
    obj.rectangle147:setColor("black");
    obj.rectangle147:setStrokeColor("white");
    obj.rectangle147:setStrokeSize(1);
    obj.rectangle147:setMargins({right=5});
    obj.rectangle147:setName("rectangle147");

    obj.label327 = GUI.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.rectangle147);
    obj.label327:setAlign("client");
    obj.label327:setField("auditini_out");
    obj.label327:setHorzTextAlign("center");
    obj.label327:setName("label327");

    obj.edit449 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit449:setParent(obj.layout136);
    obj.edit449:setAlign("left");
    obj.edit449:setWidth(40);
    obj.edit449:setField("auditbonuscost_out");
    obj.edit449:setMargins({right=5});
    obj.edit449:setType("float");
    obj.edit449:setDecimalPlaces(1);
    obj.edit449:setName("edit449");

    obj.rectangle148 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle148:setParent(obj.layout136);
    obj.rectangle148:setAlign("left");
    obj.rectangle148:setWidth(40);
    obj.rectangle148:setColor("black");
    obj.rectangle148:setStrokeColor("white");
    obj.rectangle148:setStrokeSize(1);
    obj.rectangle148:setMargins({right=5});
    obj.rectangle148:setName("rectangle148");

    obj.label328 = GUI.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.rectangle148);
    obj.label328:setAlign("client");
    obj.label328:setField("auditbonus_out");
    obj.label328:setHorzTextAlign("center");
    obj.label328:setName("label328");

    obj.edit450 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit450:setParent(obj.layout136);
    obj.edit450:setAlign("left");
    obj.edit450:setWidth(40);
    obj.edit450:setField("auditxpcost_out");
    obj.edit450:setMargins({left=25,right=5});
    obj.edit450:setType("float");
    obj.edit450:setDecimalPlaces(1);
    obj.edit450:setName("edit450");

    obj.rectangle149 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle149:setParent(obj.layout136);
    obj.rectangle149:setAlign("left");
    obj.rectangle149:setWidth(40);
    obj.rectangle149:setColor("black");
    obj.rectangle149:setStrokeColor("white");
    obj.rectangle149:setStrokeSize(1);
    obj.rectangle149:setMargins({right=5});
    obj.rectangle149:setName("rectangle149");

    obj.label329 = GUI.fromHandle(_obj_newObject("label"));
    obj.label329:setParent(obj.rectangle149);
    obj.label329:setAlign("client");
    obj.label329:setField("auditxp_out");
    obj.label329:setHorzTextAlign("center");
    obj.label329:setName("label329");

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.rectangle128);
    obj.dataLink102:setField("auditbonuscost_out");
    obj.dataLink102:setDefaultValue("5");
    obj.dataLink102:setName("dataLink102");

    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.rectangle128);
    obj.dataLink103:setField("auditxpcost_out");
    obj.dataLink103:setDefaultValue("5");
    obj.dataLink103:setName("dataLink103");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle128);
    obj.layout137:setAlign("top");
    obj.layout137:setHeight(25);
    obj.layout137:setName("layout137");

    obj.label330 = GUI.fromHandle(_obj_newObject("label"));
    obj.label330:setParent(obj.layout137);
    obj.label330:setAlign("left");
    obj.label330:setWidth(75);
    obj.label330:setText("Extra");
    obj.label330:setMargins({right=5});
    obj.label330:setName("label330");

    obj.edit451 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit451:setParent(obj.layout137);
    obj.edit451:setAlign("left");
    obj.edit451:setWidth(40);
    obj.edit451:setField("auditini_extra");
    obj.edit451:setMargins({right=5});
    obj.edit451:setName("edit451");

    obj.edit452 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit452:setParent(obj.layout137);
    obj.edit452:setAlign("left");
    obj.edit452:setWidth(40);
    obj.edit452:setField("auditbonuscost_extra");
    obj.edit452:setMargins({right=5});
    obj.edit452:setName("edit452");

    obj.edit453 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit453:setParent(obj.layout137);
    obj.edit453:setAlign("left");
    obj.edit453:setWidth(40);
    obj.edit453:setField("auditbonus_extra");
    obj.edit453:setMargins({right=5});
    obj.edit453:setName("edit453");

    obj.edit454 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit454:setParent(obj.layout137);
    obj.edit454:setAlign("left");
    obj.edit454:setWidth(40);
    obj.edit454:setField("auditxpcost_extra");
    obj.edit454:setMargins({left=25,right=5});
    obj.edit454:setName("edit454");

    obj.edit455 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit455:setParent(obj.layout137);
    obj.edit455:setAlign("left");
    obj.edit455:setWidth(40);
    obj.edit455:setField("auditxp_extra");
    obj.edit455:setName("edit455");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle128);
    obj.layout138:setAlign("top");
    obj.layout138:setHeight(25);
    obj.layout138:setName("layout138");

    obj.label331 = GUI.fromHandle(_obj_newObject("label"));
    obj.label331:setParent(obj.layout138);
    obj.label331:setAlign("left");
    obj.label331:setWidth(75);
    obj.label331:setText("Total");
    obj.label331:setMargins({right=5});
    obj.label331:setName("label331");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout138);
    obj.layout139:setAlign("left");
    obj.layout139:setWidth(40);
    obj.layout139:setMargins({right=5});
    obj.layout139:setName("layout139");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout138);
    obj.layout140:setAlign("left");
    obj.layout140:setWidth(40);
    obj.layout140:setMargins({right=5});
    obj.layout140:setName("layout140");

    obj.rectangle150 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle150:setParent(obj.layout138);
    obj.rectangle150:setAlign("left");
    obj.rectangle150:setWidth(40);
    obj.rectangle150:setColor("black");
    obj.rectangle150:setStrokeColor("white");
    obj.rectangle150:setStrokeSize(1);
    obj.rectangle150:setMargins({right=5});
    obj.rectangle150:setName("rectangle150");

    obj.label332 = GUI.fromHandle(_obj_newObject("label"));
    obj.label332:setParent(obj.rectangle150);
    obj.label332:setAlign("client");
    obj.label332:setField("auditbonus_total");
    obj.label332:setHorzTextAlign("center");
    obj.label332:setName("label332");

    obj.edit456 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit456:setParent(obj.layout138);
    obj.edit456:setAlign("left");
    obj.edit456:setWidth(40);
    obj.edit456:setField("XP");
    obj.edit456:setMargins({left=25});
    obj.edit456:setName("edit456");

    obj.rectangle151 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle151:setParent(obj.layout138);
    obj.rectangle151:setAlign("left");
    obj.rectangle151:setWidth(40);
    obj.rectangle151:setColor("black");
    obj.rectangle151:setStrokeColor("white");
    obj.rectangle151:setStrokeSize(1);
    obj.rectangle151:setMargins({right=5});
    obj.rectangle151:setName("rectangle151");

    obj.label333 = GUI.fromHandle(_obj_newObject("label"));
    obj.label333:setParent(obj.rectangle151);
    obj.label333:setAlign("client");
    obj.label333:setField("auditxp_total");
    obj.label333:setHorzTextAlign("center");
    obj.label333:setName("label333");

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout127);
    obj.dataLink104:setFields({'inicialforca', 'inicialagilidade', 'inicialresiliencia'});
    obj.dataLink104:setName("dataLink104");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout127);
    obj.dataLink105:setFields({'bonusforca', 'bonusagilidade', 'bonusresiliencia','auditbonuscost_atrFis'});
    obj.dataLink105:setName("dataLink105");

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout127);
    obj.dataLink106:setFields({'xpforca', 'xpagilidade', 'xpresiliencia', 'testeforca', 'testeagilidade', 'testeresiliencia','auditxpcost_atrFis', 'outroforca', 'outroagilidade', 'outroresiliencia'});
    obj.dataLink106:setName("dataLink106");

    obj.dataLink107 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout127);
    obj.dataLink107:setFields({'inicialcarisma', 'inicialpercepcao', 'inicialperspicacia'});
    obj.dataLink107:setName("dataLink107");

    obj.dataLink108 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout127);
    obj.dataLink108:setFields({'bonuscarisma', 'bonuspercepcao', 'bonusperspicacia','auditbonuscost_atrMen'});
    obj.dataLink108:setName("dataLink108");

    obj.dataLink109 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout127);
    obj.dataLink109:setFields({'xpcarisma', 'xppercepcao', 'xpperspicacia', 'testecarisma', 'testepercepcao', 'testeperspicacia','auditxpcost_atrMen', 'outrocarisma', 'outropercepcao', 'outroperspicacia'});
    obj.dataLink109:setName("dataLink109");

    obj.dataLink110 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink110:setParent(obj.layout127);
    obj.dataLink110:setFields({'base0_1', 'base0_2', 'base0_3', 'base0_4', 'base0_5', 'base0_6', 'base0_7', 'base0_8', 'base0_9', 'base0_10', 'base0_11', 'base0_12', 'base2_1', 'base2_2', 'base2_3', 'base2_4', 'base2_5', 'base2_6', 'base2_7', 'base2_8', 'base2_9', 'base2_10', 'base2_11', 'base2_12'});
    obj.dataLink110:setName("dataLink110");

    obj.dataLink111 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink111:setParent(obj.layout127);
    obj.dataLink111:setFields({'bonus0_1', 'bonus0_2', 'bonus0_3', 'bonus0_4', 'bonus0_5', 'bonus0_6', 'bonus0_7', 'bonus0_8', 'bonus0_9', 'bonus0_10', 'bonus0_11', 'bonus0_12', 'bonus2_1', 'bonus2_2', 'bonus2_3', 'bonus2_4', 'bonus2_5', 'bonus2_6', 'bonus2_7', 'bonus2_8', 'bonus2_9', 'bonus2_10', 'bonus2_11', 'bonus2_12','auditbonuscost_aptFis'});
    obj.dataLink111:setName("dataLink111");

    obj.dataLink112 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink112:setParent(obj.layout127);
    obj.dataLink112:setFields({'xp0_1', 'xp0_2', 'xp0_3', 'xp0_4', 'xp0_5', 'xp0_6', 'xp0_7', 'xp0_8', 'xp0_9', 'xp0_10', 'xp0_11', 'xp0_12', 'xp2_1', 'xp2_2', 'xp2_3', 'xp2_4', 'xp2_5', 'xp2_6', 'xp2_7', 'xp2_8', 'xp2_9', 'xp2_10', 'xp2_11', 'xp2_12', 'total0_1', 'total0_2', 'total0_3', 'total0_4', 'total0_5', 'total0_6', 'total0_7', 'total0_8', 'total0_9', 'total0_10', 'total0_11', 'total0_12', 'total2_1', 'total2_2', 'total2_3', 'total2_4', 'total2_5', 'total2_6', 'total2_7', 'total2_8', 'total2_9', 'total2_10', 'total2_11', 'total2_12','auditxpcost_aptFis'});
    obj.dataLink112:setName("dataLink112");

    obj.dataLink113 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink113:setParent(obj.layout127);
    obj.dataLink113:setFields({'base1_1', 'base1_2', 'base1_3', 'base1_4', 'base1_5', 'base1_6', 'base1_7', 'base1_8', 'base1_9', 'base1_10', 'base1_11', 'base1_12', 'base3_1', 'base3_2', 'base3_3', 'base3_4', 'base3_5', 'base3_6', 'base3_7', 'base3_8', 'base3_9', 'base3_10', 'base3_11', 'base3_12'});
    obj.dataLink113:setName("dataLink113");

    obj.dataLink114 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink114:setParent(obj.layout127);
    obj.dataLink114:setFields({'bonus1_1', 'bonus1_2', 'bonus1_3', 'bonus1_4', 'bonus1_5', 'bonus1_6', 'bonus1_7', 'bonus1_8', 'bonus1_9', 'bonus1_10', 'bonus1_11', 'bonus1_12', 'bonus3_1', 'bonus3_2', 'bonus3_3', 'bonus3_4', 'bonus3_5', 'bonus3_6', 'bonus3_7', 'bonus3_8', 'bonus3_9', 'bonus3_10', 'bonus3_11', 'bonus3_12','auditbonuscost_aptMen'});
    obj.dataLink114:setName("dataLink114");

    obj.dataLink115 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink115:setParent(obj.layout127);
    obj.dataLink115:setFields({'xp1_1', 'xp1_2', 'xp1_3', 'xp1_4', 'xp1_5', 'xp1_6', 'xp1_7', 'xp1_8', 'xp1_9', 'xp1_10', 'xp1_11', 'xp1_12', 'xp3_1', 'xp3_2', 'xp3_3', 'xp3_4', 'xp3_5', 'xp3_6', 'xp3_7', 'xp3_8', 'xp3_9', 'xp3_10', 'xp3_11', 'xp3_12', 'total1_1', 'total1_2', 'total1_3', 'total1_4', 'total1_5', 'total1_6', 'total1_7', 'total1_8', 'total1_9', 'total1_10', 'total1_11', 'total1_12', 'total3_1', 'total3_2', 'total3_3', 'total3_4', 'total3_5', 'total3_6', 'total3_7', 'total3_8', 'total3_9', 'total3_10', 'total3_11', 'total3_12','auditxpcost_aptMen'});
    obj.dataLink115:setName("dataLink115");

    obj.dataLink116 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink116:setParent(obj.layout127);
    obj.dataLink116:setFields({'historicoValor1_1', 'historicoValor1_2', 'historicoValor1_3', 'historicoValor1_4', 'historicoValor1_5', 'historicoValor1_6', 'historicoValor2_1', 'historicoValor2_2', 'historicoValor2_3', 'historicoValor2_4', 'historicoValor2_5', 'historicoValor2_6', 'historicoValor3_1', 'historicoValor3_2', 'historicoValor3_3', 'historicoValor3_4', 'historicoValor3_5', 'historicoValor3_6'});
    obj.dataLink116:setName("dataLink116");

    obj.dataLink117 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink117:setParent(obj.layout127);
    obj.dataLink117:setFields({'historicoBonus1_1', 'historicoBonus1_2', 'historicoBonus1_3', 'historicoBonus1_4', 'historicoBonus1_5', 'historicoBonus1_6', 'historicoBonus2_1', 'historicoBonus2_2', 'historicoBonus2_3', 'historicoBonus2_4', 'historicoBonus2_5', 'historicoBonus2_6', 'historicoBonus3_1', 'historicoBonus3_2', 'historicoBonus3_3', 'historicoBonus3_4', 'historicoBonus3_5', 'historicoBonus3_6','auditbonuscost_hist'});
    obj.dataLink117:setName("dataLink117");

    obj.dataLink118 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink118:setParent(obj.layout127);
    obj.dataLink118:setFields({'historicoXp1_1', 'historicoXp1_2', 'historicoXp1_3', 'historicoXp1_4', 'historicoXp1_5', 'historicoXp1_6', 'historicoXp2_1', 'historicoXp2_2', 'historicoXp2_3', 'historicoXp2_4', 'historicoXp2_5', 'historicoXp2_6', 'historicoXp3_1', 'historicoXp3_2', 'historicoXp3_3', 'historicoXp3_4', 'historicoXp3_5', 'historicoXp3_6', 'historicoTotal1_1', 'historicoTotal1_2', 'historicoTotal1_3', 'historicoTotal1_4', 'historicoTotal1_5', 'historicoTotal1_6', 'historicoTotal2_1', 'historicoTotal2_2', 'historicoTotal2_3', 'historicoTotal2_4', 'historicoTotal2_5', 'historicoTotal2_6', 'historicoTotal3_1', 'historicoTotal3_2', 'historicoTotal3_3', 'historicoTotal3_4', 'historicoTotal3_5', 'historicoTotal3_6','auditxpcost_hist'});
    obj.dataLink118:setName("dataLink118");

    obj.dataLink119 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink119:setParent(obj.layout127);
    obj.dataLink119:setFields({'inicialconsciencia', 'inicialespirito', 'inicialperseveranca'});
    obj.dataLink119:setName("dataLink119");

    obj.dataLink120 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink120:setParent(obj.layout127);
    obj.dataLink120:setFields({'bonusconsciencia', 'bonusespirito', 'bonusperseveranca','auditbonuscost_eido'});
    obj.dataLink120:setName("dataLink120");

    obj.dataLink121 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink121:setParent(obj.layout127);
    obj.dataLink121:setFields({'xpconsciencia', 'xpespirito', 'xpperseveranca', 'testeconsciencia', 'testeespirito', 'testeperseveranca','auditxpcost_eido', 'outroconsciencia', 'outroespirito', 'outroperseveranca'});
    obj.dataLink121:setName("dataLink121");

    obj.dataLink122 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink122:setParent(obj.layout127);
    obj.dataLink122:setFields({'auditbonus_atrFis', 'auditbonus_atrMen', 'auditbonus_aptFis', 'auditbonus_aptMen', 'auditbonus_hist', 'auditbonus_eido', 'auditbonus_out', 'auditbonus_espec', 'auditbonus_extra'});
    obj.dataLink122:setName("dataLink122");

    obj.dataLink123 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink123:setParent(obj.layout127);
    obj.dataLink123:setFields({'auditxp_atrFis', 'auditxp_atrMen', 'auditxp_aptFis', 'auditxp_aptMen', 'auditxp_hist', 'auditxp_eido', 'auditxp_out', 'auditxp_espec', 'auditxp_extra'});
    obj.dataLink123:setName("dataLink123");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/output/Ao%20cair%20da%20noite.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/output/Ao%20cair%20da%20noite.rpk?raw=true');
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
                        end,"checkForModification");
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local node = NDB.getRoot(sheet)
            				local id = self.popHistorico.scopeNode.id or "_"
            				node["historicoValor"..id] = self.popHistorico.scopeNode.historicoValor
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local node = NDB.getRoot(sheet)
            				local id = self.popHistorico.scopeNode.id or "_"
            				node["historicoBonus"..id] = self.popHistorico.scopeNode.historicoBonus
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local node = NDB.getRoot(sheet)
            				local id = self.popHistorico.scopeNode.id or "_"
            				node["historicoXp"..id] = self.popHistorico.scopeNode.historicoXp
        end, obj);

    obj._e_event4 = obj.btFisicos:addEventListener("onClick",
        function (_)
            ShowPopup("popFisicos","btFisicos")
        end, obj);

    obj._e_event5 = obj.btMentais:addEventListener("onClick",
        function (_)
            ShowPopup("popMentais","btMentais")
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome1 = "Força";
        end, obj);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome2 = "Força";
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
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

    obj._e_event9 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome1 = "Agilidade";
        end, obj);

    obj._e_event10 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome2 = "Agilidade";
        end, obj);

    obj._e_event11 = obj.dataLink7:addEventListener("onChange",
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

    obj._e_event12 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome1 = "Resiliência";
        end, obj);

    obj._e_event13 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome2 = "Resiliência";
        end, obj);

    obj._e_event14 = obj.dataLink9:addEventListener("onChange",
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

    obj._e_event15 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome1 = "Carisma";
        end, obj);

    obj._e_event16 = obj.button8:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome2 = "Carisma";
        end, obj);

    obj._e_event17 = obj.dataLink11:addEventListener("onChange",
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

    obj._e_event18 = obj.button9:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome1 = "Percepção";
        end, obj);

    obj._e_event19 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome2 = "Percepção";
        end, obj);

    obj._e_event20 = obj.dataLink13:addEventListener("onChange",
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

    obj._e_event21 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome1 = "Perspicácia";
        end, obj);

    obj._e_event22 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome2 = "Perspicácia";
        end, obj);

    obj._e_event23 = obj.dataLink15:addEventListener("onChange",
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

    obj._e_event24 = obj.btAegis:addEventListener("onClick",
        function (_)
            ShowPopup("popAegis","btAegis")
        end, obj);

    obj._e_event25 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome1 = "Consciência";
        end, obj);

    obj._e_event26 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome2 = "Consciência";
        end, obj);

    obj._e_event27 = obj.dataLink17:addEventListener("onChange",
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

    obj._e_event28 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome1 = "Espírito";
        end, obj);

    obj._e_event29 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome2 = "Espírito";
        end, obj);

    obj._e_event30 = obj.dataLink19:addEventListener("onChange",
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

    obj._e_event31 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome1 = "Perseverança";
        end, obj);

    obj._e_event32 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome2 = "Perseverança";
        end, obj);

    obj._e_event33 = obj.dataLink21:addEventListener("onChange",
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

    obj._e_event34 = obj.edit51:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event35 = obj.edit52:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event36 = obj.button19:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            					rolagem = rrpg.interpretarRolagem("1d10 + " .. (sheet.iniciativa or 0));
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (sheet.nome or 0));
        end, obj);

    obj._e_event37 = obj.dataLink22:addEventListener("onChange",
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

    obj._e_event38 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event39 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event40 = obj.histPop1_1:addEventListener("onClick",
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

    obj._e_event41 = obj.dataLink23:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event42 = obj.dataLink24:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event43 = obj.dataLink25:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event44 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event45 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event46 = obj.histPop1_2:addEventListener("onClick",
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

    obj._e_event47 = obj.dataLink26:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event48 = obj.dataLink27:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event49 = obj.dataLink28:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event50 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event51 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event52 = obj.histPop1_3:addEventListener("onClick",
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

    obj._e_event53 = obj.dataLink29:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event54 = obj.dataLink30:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event55 = obj.dataLink31:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event56 = obj.button26:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event57 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event58 = obj.histPop1_4:addEventListener("onClick",
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

    obj._e_event59 = obj.dataLink32:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event60 = obj.dataLink33:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event61 = obj.dataLink34:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event62 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event63 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event64 = obj.histPop1_5:addEventListener("onClick",
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

    obj._e_event65 = obj.dataLink35:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event66 = obj.dataLink36:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event67 = obj.dataLink37:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event68 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event69 = obj.button31:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event70 = obj.histPop1_6:addEventListener("onClick",
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

    obj._e_event71 = obj.dataLink38:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event72 = obj.dataLink39:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event73 = obj.dataLink40:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event74 = obj.button32:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event75 = obj.button33:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event76 = obj.histPop2_1:addEventListener("onClick",
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

    obj._e_event77 = obj.dataLink41:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event78 = obj.dataLink42:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event79 = obj.dataLink43:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event80 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event81 = obj.button35:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event82 = obj.histPop2_2:addEventListener("onClick",
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

    obj._e_event83 = obj.dataLink44:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event84 = obj.dataLink45:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event85 = obj.dataLink46:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event86 = obj.button36:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event87 = obj.button37:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event88 = obj.histPop2_3:addEventListener("onClick",
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

    obj._e_event89 = obj.dataLink47:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event90 = obj.dataLink48:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event91 = obj.dataLink49:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event92 = obj.button38:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event93 = obj.button39:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event94 = obj.histPop2_4:addEventListener("onClick",
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

    obj._e_event95 = obj.dataLink50:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event96 = obj.dataLink51:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event97 = obj.dataLink52:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event98 = obj.button40:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event99 = obj.button41:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event100 = obj.histPop2_5:addEventListener("onClick",
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

    obj._e_event101 = obj.dataLink53:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event102 = obj.dataLink54:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event103 = obj.dataLink55:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event104 = obj.button42:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event105 = obj.button43:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event106 = obj.histPop2_6:addEventListener("onClick",
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

    obj._e_event107 = obj.dataLink56:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event108 = obj.dataLink57:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event109 = obj.dataLink58:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event110 = obj.button44:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event111 = obj.button45:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event112 = obj.histPop3_1:addEventListener("onClick",
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

    obj._e_event113 = obj.dataLink59:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event114 = obj.dataLink60:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event115 = obj.dataLink61:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event116 = obj.button46:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event117 = obj.button47:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event118 = obj.histPop3_2:addEventListener("onClick",
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

    obj._e_event119 = obj.dataLink62:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event120 = obj.dataLink63:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event121 = obj.dataLink64:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event122 = obj.button48:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event123 = obj.button49:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event124 = obj.histPop3_3:addEventListener("onClick",
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

    obj._e_event125 = obj.dataLink65:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event126 = obj.dataLink66:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event127 = obj.dataLink67:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event128 = obj.button50:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event129 = obj.button51:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event130 = obj.histPop3_4:addEventListener("onClick",
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

    obj._e_event131 = obj.dataLink68:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event132 = obj.dataLink69:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event133 = obj.dataLink70:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event134 = obj.button52:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event135 = obj.button53:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event136 = obj.histPop3_5:addEventListener("onClick",
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

    obj._e_event137 = obj.dataLink71:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event138 = obj.dataLink72:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event139 = obj.dataLink73:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event140 = obj.button54:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event141 = obj.button55:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event142 = obj.histPop3_6:addEventListener("onClick",
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

    obj._e_event143 = obj.dataLink74:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event144 = obj.dataLink75:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event145 = obj.dataLink76:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event146 = obj.button56:addEventListener("onClick",
        function (_)
            local rcl = self.rclListaOutros:append();
            					if rcl~=nil then 
            						rcl.multXp = sheet.auditxpcost_out;
            						rcl.multApr = sheet.auditbonuscost_out;
            					end;
        end, obj);

    obj._e_event147 = obj.rclListaOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event148 = obj.dataLink83:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absRes = math.floor(tonumber(sheet.testeresiliencia) or 0);
            					end;
        end, obj);

    obj._e_event149 = obj.dataLink84:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absorcao = (tonumber(sheet.absRes) or 0) + (tonumber(sheet.absOutros) or 0) + (tonumber(sheet.indiceArmadura) or 0);
            					end;
        end, obj);

    obj._e_event150 = obj.button57:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            					sheet.field2 = nil;
            					sheet.num2 = nil;
            					sheet.rollnome2 = nil;
        end, obj);

    obj._e_event151 = obj.button58:addEventListener("onClick",
        function (_)
            rolar();
        end, obj);

    obj._e_event152 = obj.button59:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_1) or 0);
            				sheet.rollnome1 = sheet.nome0_1;
        end, obj);

    obj._e_event153 = obj.button60:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_1) or 0);
            				sheet.rollnome2 = sheet.nome0_1;
        end, obj);

    obj._e_event154 = obj.edit137:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_1) or 0)+
            											(tonumber(sheet.bonus0_1) or 0)+
            											(tonumber(sheet.xp0_1) or 0);
            					sheet.total0_1 = mod / 2;
            					sheet.total20_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event155 = obj.edit138:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_1) or 0)+
            											(tonumber(sheet.bonus0_1) or 0)+
            											(tonumber(sheet.xp0_1) or 0);
            					sheet.total0_1 = mod / 2;
            					sheet.total20_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event156 = obj.edit139:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_1) or 0)+
            											(tonumber(sheet.bonus0_1) or 0)+
            											(tonumber(sheet.xp0_1) or 0);
            					sheet.total0_1 = mod / 2;
            					sheet.total20_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event157 = obj.button61:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_2) or 0);
            				sheet.rollnome1 = sheet.nome0_2;
        end, obj);

    obj._e_event158 = obj.button62:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_2) or 0);
            				sheet.rollnome2 = sheet.nome0_2;
        end, obj);

    obj._e_event159 = obj.edit142:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_2) or 0)+
            											(tonumber(sheet.bonus0_2) or 0)+
            											(tonumber(sheet.xp0_2) or 0);
            					sheet.total0_2 = mod / 2;
            					sheet.total20_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event160 = obj.edit143:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_2) or 0)+
            											(tonumber(sheet.bonus0_2) or 0)+
            											(tonumber(sheet.xp0_2) or 0);
            					sheet.total0_2 = mod / 2;
            					sheet.total20_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event161 = obj.edit144:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_2) or 0)+
            											(tonumber(sheet.bonus0_2) or 0)+
            											(tonumber(sheet.xp0_2) or 0);
            					sheet.total0_2 = mod / 2;
            					sheet.total20_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event162 = obj.button63:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_3) or 0);
            				sheet.rollnome1 = sheet.nome0_3;
        end, obj);

    obj._e_event163 = obj.button64:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_3) or 0);
            				sheet.rollnome2 = sheet.nome0_3;
        end, obj);

    obj._e_event164 = obj.edit147:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_3) or 0)+
            											(tonumber(sheet.bonus0_3) or 0)+
            											(tonumber(sheet.xp0_3) or 0);
            					sheet.total0_3 = mod / 2;
            					sheet.total20_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event165 = obj.edit148:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_3) or 0)+
            											(tonumber(sheet.bonus0_3) or 0)+
            											(tonumber(sheet.xp0_3) or 0);
            					sheet.total0_3 = mod / 2;
            					sheet.total20_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event166 = obj.edit149:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_3) or 0)+
            											(tonumber(sheet.bonus0_3) or 0)+
            											(tonumber(sheet.xp0_3) or 0);
            					sheet.total0_3 = mod / 2;
            					sheet.total20_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event167 = obj.button65:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_4) or 0);
            				sheet.rollnome1 = sheet.nome0_4;
        end, obj);

    obj._e_event168 = obj.button66:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_4) or 0);
            				sheet.rollnome2 = sheet.nome0_4;
        end, obj);

    obj._e_event169 = obj.edit152:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_4) or 0)+
            											(tonumber(sheet.bonus0_4) or 0)+
            											(tonumber(sheet.xp0_4) or 0);
            					sheet.total0_4 = mod / 2;
            					sheet.total20_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event170 = obj.edit153:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_4) or 0)+
            											(tonumber(sheet.bonus0_4) or 0)+
            											(tonumber(sheet.xp0_4) or 0);
            					sheet.total0_4 = mod / 2;
            					sheet.total20_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event171 = obj.edit154:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_4) or 0)+
            											(tonumber(sheet.bonus0_4) or 0)+
            											(tonumber(sheet.xp0_4) or 0);
            					sheet.total0_4 = mod / 2;
            					sheet.total20_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event172 = obj.button67:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_5) or 0);
            				sheet.rollnome1 = sheet.nome0_5;
        end, obj);

    obj._e_event173 = obj.button68:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_5) or 0);
            				sheet.rollnome2 = sheet.nome0_5;
        end, obj);

    obj._e_event174 = obj.edit157:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_5) or 0)+
            											(tonumber(sheet.bonus0_5) or 0)+
            											(tonumber(sheet.xp0_5) or 0);
            					sheet.total0_5 = mod / 2;
            					sheet.total20_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event175 = obj.edit158:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_5) or 0)+
            											(tonumber(sheet.bonus0_5) or 0)+
            											(tonumber(sheet.xp0_5) or 0);
            					sheet.total0_5 = mod / 2;
            					sheet.total20_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event176 = obj.edit159:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_5) or 0)+
            											(tonumber(sheet.bonus0_5) or 0)+
            											(tonumber(sheet.xp0_5) or 0);
            					sheet.total0_5 = mod / 2;
            					sheet.total20_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event177 = obj.button69:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_6) or 0);
            				sheet.rollnome1 = sheet.nome0_6;
        end, obj);

    obj._e_event178 = obj.button70:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_6) or 0);
            				sheet.rollnome2 = sheet.nome0_6;
        end, obj);

    obj._e_event179 = obj.edit162:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_6) or 0)+
            											(tonumber(sheet.bonus0_6) or 0)+
            											(tonumber(sheet.xp0_6) or 0);
            					sheet.total0_6 = mod / 2;
            					sheet.total20_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event180 = obj.edit163:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_6) or 0)+
            											(tonumber(sheet.bonus0_6) or 0)+
            											(tonumber(sheet.xp0_6) or 0);
            					sheet.total0_6 = mod / 2;
            					sheet.total20_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event181 = obj.edit164:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_6) or 0)+
            											(tonumber(sheet.bonus0_6) or 0)+
            											(tonumber(sheet.xp0_6) or 0);
            					sheet.total0_6 = mod / 2;
            					sheet.total20_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event182 = obj.button71:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_7) or 0);
            				sheet.rollnome1 = sheet.nome0_7;
        end, obj);

    obj._e_event183 = obj.button72:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_7) or 0);
            				sheet.rollnome2 = sheet.nome0_7;
        end, obj);

    obj._e_event184 = obj.edit167:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_7) or 0)+
            											(tonumber(sheet.bonus0_7) or 0)+
            											(tonumber(sheet.xp0_7) or 0);
            					sheet.total0_7 = mod / 2;
            					sheet.total20_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event185 = obj.edit168:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_7) or 0)+
            											(tonumber(sheet.bonus0_7) or 0)+
            											(tonumber(sheet.xp0_7) or 0);
            					sheet.total0_7 = mod / 2;
            					sheet.total20_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event186 = obj.edit169:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_7) or 0)+
            											(tonumber(sheet.bonus0_7) or 0)+
            											(tonumber(sheet.xp0_7) or 0);
            					sheet.total0_7 = mod / 2;
            					sheet.total20_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event187 = obj.button73:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_8) or 0);
            				sheet.rollnome1 = sheet.nome0_8;
        end, obj);

    obj._e_event188 = obj.button74:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_8) or 0);
            				sheet.rollnome2 = sheet.nome0_8;
        end, obj);

    obj._e_event189 = obj.edit172:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_8) or 0)+
            											(tonumber(sheet.bonus0_8) or 0)+
            											(tonumber(sheet.xp0_8) or 0);
            					sheet.total0_8 = mod / 2;
            					sheet.total20_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event190 = obj.edit173:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_8) or 0)+
            											(tonumber(sheet.bonus0_8) or 0)+
            											(tonumber(sheet.xp0_8) or 0);
            					sheet.total0_8 = mod / 2;
            					sheet.total20_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event191 = obj.edit174:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_8) or 0)+
            											(tonumber(sheet.bonus0_8) or 0)+
            											(tonumber(sheet.xp0_8) or 0);
            					sheet.total0_8 = mod / 2;
            					sheet.total20_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event192 = obj.button75:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_9) or 0);
            				sheet.rollnome1 = sheet.nome0_9;
        end, obj);

    obj._e_event193 = obj.button76:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_9) or 0);
            				sheet.rollnome2 = sheet.nome0_9;
        end, obj);

    obj._e_event194 = obj.edit177:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_9) or 0)+
            											(tonumber(sheet.bonus0_9) or 0)+
            											(tonumber(sheet.xp0_9) or 0);
            					sheet.total0_9 = mod / 2;
            					sheet.total20_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event195 = obj.edit178:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_9) or 0)+
            											(tonumber(sheet.bonus0_9) or 0)+
            											(tonumber(sheet.xp0_9) or 0);
            					sheet.total0_9 = mod / 2;
            					sheet.total20_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event196 = obj.edit179:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_9) or 0)+
            											(tonumber(sheet.bonus0_9) or 0)+
            											(tonumber(sheet.xp0_9) or 0);
            					sheet.total0_9 = mod / 2;
            					sheet.total20_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event197 = obj.button77:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_10) or 0);
            				sheet.rollnome1 = sheet.nome0_10;
        end, obj);

    obj._e_event198 = obj.button78:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_10) or 0);
            				sheet.rollnome2 = sheet.nome0_10;
        end, obj);

    obj._e_event199 = obj.edit182:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_10) or 0)+
            											(tonumber(sheet.bonus0_10) or 0)+
            											(tonumber(sheet.xp0_10) or 0);
            					sheet.total0_10 = mod / 2;
            					sheet.total20_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event200 = obj.edit183:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_10) or 0)+
            											(tonumber(sheet.bonus0_10) or 0)+
            											(tonumber(sheet.xp0_10) or 0);
            					sheet.total0_10 = mod / 2;
            					sheet.total20_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event201 = obj.edit184:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_10) or 0)+
            											(tonumber(sheet.bonus0_10) or 0)+
            											(tonumber(sheet.xp0_10) or 0);
            					sheet.total0_10 = mod / 2;
            					sheet.total20_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event202 = obj.button79:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_11) or 0);
            				sheet.rollnome1 = sheet.nome0_11;
        end, obj);

    obj._e_event203 = obj.button80:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_11) or 0);
            				sheet.rollnome2 = sheet.nome0_11;
        end, obj);

    obj._e_event204 = obj.edit187:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_11) or 0)+
            											(tonumber(sheet.bonus0_11) or 0)+
            											(tonumber(sheet.xp0_11) or 0);
            					sheet.total0_11 = mod / 2;
            					sheet.total20_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event205 = obj.edit188:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_11) or 0)+
            											(tonumber(sheet.bonus0_11) or 0)+
            											(tonumber(sheet.xp0_11) or 0);
            					sheet.total0_11 = mod / 2;
            					sheet.total20_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event206 = obj.edit189:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_11) or 0)+
            											(tonumber(sheet.bonus0_11) or 0)+
            											(tonumber(sheet.xp0_11) or 0);
            					sheet.total0_11 = mod / 2;
            					sheet.total20_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event207 = obj.button81:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_12) or 0);
            				sheet.rollnome1 = sheet.nome0_12;
        end, obj);

    obj._e_event208 = obj.button82:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_12) or 0);
            				sheet.rollnome2 = sheet.nome0_12;
        end, obj);

    obj._e_event209 = obj.edit192:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_12) or 0)+
            											(tonumber(sheet.bonus0_12) or 0)+
            											(tonumber(sheet.xp0_12) or 0);
            					sheet.total0_12 = mod / 2;
            					sheet.total20_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event210 = obj.edit193:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_12) or 0)+
            											(tonumber(sheet.bonus0_12) or 0)+
            											(tonumber(sheet.xp0_12) or 0);
            					sheet.total0_12 = mod / 2;
            					sheet.total20_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event211 = obj.edit194:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_12) or 0)+
            											(tonumber(sheet.bonus0_12) or 0)+
            											(tonumber(sheet.xp0_12) or 0);
            					sheet.total0_12 = mod / 2;
            					sheet.total20_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event212 = obj.button83:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_1) or 0);
            				sheet.rollnome1 = sheet.nome2_1;
        end, obj);

    obj._e_event213 = obj.button84:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_1) or 0);
            				sheet.rollnome2 = sheet.nome2_1;
        end, obj);

    obj._e_event214 = obj.edit197:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_1) or 0)+
            											(tonumber(sheet.bonus2_1) or 0)+
            											(tonumber(sheet.xp2_1) or 0);
            					sheet.total2_1 = mod / 2;
            					sheet.total22_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event215 = obj.edit198:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_1) or 0)+
            											(tonumber(sheet.bonus2_1) or 0)+
            											(tonumber(sheet.xp2_1) or 0);
            					sheet.total2_1 = mod / 2;
            					sheet.total22_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event216 = obj.edit199:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_1) or 0)+
            											(tonumber(sheet.bonus2_1) or 0)+
            											(tonumber(sheet.xp2_1) or 0);
            					sheet.total2_1 = mod / 2;
            					sheet.total22_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event217 = obj.button85:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_2) or 0);
            				sheet.rollnome1 = sheet.nome2_2;
        end, obj);

    obj._e_event218 = obj.button86:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_2) or 0);
            				sheet.rollnome2 = sheet.nome2_2;
        end, obj);

    obj._e_event219 = obj.edit202:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_2) or 0)+
            											(tonumber(sheet.bonus2_2) or 0)+
            											(tonumber(sheet.xp2_2) or 0);
            					sheet.total2_2 = mod / 2;
            					sheet.total22_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event220 = obj.edit203:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_2) or 0)+
            											(tonumber(sheet.bonus2_2) or 0)+
            											(tonumber(sheet.xp2_2) or 0);
            					sheet.total2_2 = mod / 2;
            					sheet.total22_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event221 = obj.edit204:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_2) or 0)+
            											(tonumber(sheet.bonus2_2) or 0)+
            											(tonumber(sheet.xp2_2) or 0);
            					sheet.total2_2 = mod / 2;
            					sheet.total22_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event222 = obj.button87:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_3) or 0);
            				sheet.rollnome1 = sheet.nome2_3;
        end, obj);

    obj._e_event223 = obj.button88:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_3) or 0);
            				sheet.rollnome2 = sheet.nome2_3;
        end, obj);

    obj._e_event224 = obj.edit207:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_3) or 0)+
            											(tonumber(sheet.bonus2_3) or 0)+
            											(tonumber(sheet.xp2_3) or 0);
            					sheet.total2_3 = mod / 2;
            					sheet.total22_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event225 = obj.edit208:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_3) or 0)+
            											(tonumber(sheet.bonus2_3) or 0)+
            											(tonumber(sheet.xp2_3) or 0);
            					sheet.total2_3 = mod / 2;
            					sheet.total22_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event226 = obj.edit209:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_3) or 0)+
            											(tonumber(sheet.bonus2_3) or 0)+
            											(tonumber(sheet.xp2_3) or 0);
            					sheet.total2_3 = mod / 2;
            					sheet.total22_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event227 = obj.button89:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_4) or 0);
            				sheet.rollnome1 = sheet.nome2_4;
        end, obj);

    obj._e_event228 = obj.button90:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_4) or 0);
            				sheet.rollnome2 = sheet.nome2_4;
        end, obj);

    obj._e_event229 = obj.edit212:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_4) or 0)+
            											(tonumber(sheet.bonus2_4) or 0)+
            											(tonumber(sheet.xp2_4) or 0);
            					sheet.total2_4 = mod / 2;
            					sheet.total22_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event230 = obj.edit213:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_4) or 0)+
            											(tonumber(sheet.bonus2_4) or 0)+
            											(tonumber(sheet.xp2_4) or 0);
            					sheet.total2_4 = mod / 2;
            					sheet.total22_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event231 = obj.edit214:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_4) or 0)+
            											(tonumber(sheet.bonus2_4) or 0)+
            											(tonumber(sheet.xp2_4) or 0);
            					sheet.total2_4 = mod / 2;
            					sheet.total22_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event232 = obj.button91:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_5) or 0);
            				sheet.rollnome1 = sheet.nome2_5;
        end, obj);

    obj._e_event233 = obj.button92:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_5) or 0);
            				sheet.rollnome2 = sheet.nome2_5;
        end, obj);

    obj._e_event234 = obj.edit217:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_5) or 0)+
            											(tonumber(sheet.bonus2_5) or 0)+
            											(tonumber(sheet.xp2_5) or 0);
            					sheet.total2_5 = mod / 2;
            					sheet.total22_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event235 = obj.edit218:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_5) or 0)+
            											(tonumber(sheet.bonus2_5) or 0)+
            											(tonumber(sheet.xp2_5) or 0);
            					sheet.total2_5 = mod / 2;
            					sheet.total22_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event236 = obj.edit219:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_5) or 0)+
            											(tonumber(sheet.bonus2_5) or 0)+
            											(tonumber(sheet.xp2_5) or 0);
            					sheet.total2_5 = mod / 2;
            					sheet.total22_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event237 = obj.button93:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_6) or 0);
            				sheet.rollnome1 = sheet.nome2_6;
        end, obj);

    obj._e_event238 = obj.button94:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_6) or 0);
            				sheet.rollnome2 = sheet.nome2_6;
        end, obj);

    obj._e_event239 = obj.edit222:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_6) or 0)+
            											(tonumber(sheet.bonus2_6) or 0)+
            											(tonumber(sheet.xp2_6) or 0);
            					sheet.total2_6 = mod / 2;
            					sheet.total22_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event240 = obj.edit223:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_6) or 0)+
            											(tonumber(sheet.bonus2_6) or 0)+
            											(tonumber(sheet.xp2_6) or 0);
            					sheet.total2_6 = mod / 2;
            					sheet.total22_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event241 = obj.edit224:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_6) or 0)+
            											(tonumber(sheet.bonus2_6) or 0)+
            											(tonumber(sheet.xp2_6) or 0);
            					sheet.total2_6 = mod / 2;
            					sheet.total22_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event242 = obj.button95:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_7) or 0);
            				sheet.rollnome1 = sheet.nome2_7;
        end, obj);

    obj._e_event243 = obj.button96:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_7) or 0);
            				sheet.rollnome2 = sheet.nome2_7;
        end, obj);

    obj._e_event244 = obj.edit227:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_7) or 0)+
            											(tonumber(sheet.bonus2_7) or 0)+
            											(tonumber(sheet.xp2_7) or 0);
            					sheet.total2_7 = mod / 2;
            					sheet.total22_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event245 = obj.edit228:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_7) or 0)+
            											(tonumber(sheet.bonus2_7) or 0)+
            											(tonumber(sheet.xp2_7) or 0);
            					sheet.total2_7 = mod / 2;
            					sheet.total22_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event246 = obj.edit229:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_7) or 0)+
            											(tonumber(sheet.bonus2_7) or 0)+
            											(tonumber(sheet.xp2_7) or 0);
            					sheet.total2_7 = mod / 2;
            					sheet.total22_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event247 = obj.button97:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_8) or 0);
            				sheet.rollnome1 = sheet.nome2_8;
        end, obj);

    obj._e_event248 = obj.button98:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_8) or 0);
            				sheet.rollnome2 = sheet.nome2_8;
        end, obj);

    obj._e_event249 = obj.edit232:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_8) or 0)+
            											(tonumber(sheet.bonus2_8) or 0)+
            											(tonumber(sheet.xp2_8) or 0);
            					sheet.total2_8 = mod / 2;
            					sheet.total22_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event250 = obj.edit233:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_8) or 0)+
            											(tonumber(sheet.bonus2_8) or 0)+
            											(tonumber(sheet.xp2_8) or 0);
            					sheet.total2_8 = mod / 2;
            					sheet.total22_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event251 = obj.edit234:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_8) or 0)+
            											(tonumber(sheet.bonus2_8) or 0)+
            											(tonumber(sheet.xp2_8) or 0);
            					sheet.total2_8 = mod / 2;
            					sheet.total22_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event252 = obj.button99:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_9) or 0);
            				sheet.rollnome1 = sheet.nome2_9;
        end, obj);

    obj._e_event253 = obj.button100:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_9) or 0);
            				sheet.rollnome2 = sheet.nome2_9;
        end, obj);

    obj._e_event254 = obj.edit237:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_9) or 0)+
            											(tonumber(sheet.bonus2_9) or 0)+
            											(tonumber(sheet.xp2_9) or 0);
            					sheet.total2_9 = mod / 2;
            					sheet.total22_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event255 = obj.edit238:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_9) or 0)+
            											(tonumber(sheet.bonus2_9) or 0)+
            											(tonumber(sheet.xp2_9) or 0);
            					sheet.total2_9 = mod / 2;
            					sheet.total22_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event256 = obj.edit239:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_9) or 0)+
            											(tonumber(sheet.bonus2_9) or 0)+
            											(tonumber(sheet.xp2_9) or 0);
            					sheet.total2_9 = mod / 2;
            					sheet.total22_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event257 = obj.button101:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_10) or 0);
            				sheet.rollnome1 = sheet.nome2_10;
        end, obj);

    obj._e_event258 = obj.button102:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_10) or 0);
            				sheet.rollnome2 = sheet.nome2_10;
        end, obj);

    obj._e_event259 = obj.edit242:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_10) or 0)+
            											(tonumber(sheet.bonus2_10) or 0)+
            											(tonumber(sheet.xp2_10) or 0);
            					sheet.total2_10 = mod / 2;
            					sheet.total22_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event260 = obj.edit243:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_10) or 0)+
            											(tonumber(sheet.bonus2_10) or 0)+
            											(tonumber(sheet.xp2_10) or 0);
            					sheet.total2_10 = mod / 2;
            					sheet.total22_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event261 = obj.edit244:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_10) or 0)+
            											(tonumber(sheet.bonus2_10) or 0)+
            											(tonumber(sheet.xp2_10) or 0);
            					sheet.total2_10 = mod / 2;
            					sheet.total22_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event262 = obj.button103:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_11) or 0);
            				sheet.rollnome1 = sheet.nome2_11;
        end, obj);

    obj._e_event263 = obj.button104:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_11) or 0);
            				sheet.rollnome2 = sheet.nome2_11;
        end, obj);

    obj._e_event264 = obj.edit247:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_11) or 0)+
            											(tonumber(sheet.bonus2_11) or 0)+
            											(tonumber(sheet.xp2_11) or 0);
            					sheet.total2_11 = mod / 2;
            					sheet.total22_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event265 = obj.edit248:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_11) or 0)+
            											(tonumber(sheet.bonus2_11) or 0)+
            											(tonumber(sheet.xp2_11) or 0);
            					sheet.total2_11 = mod / 2;
            					sheet.total22_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event266 = obj.edit249:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_11) or 0)+
            											(tonumber(sheet.bonus2_11) or 0)+
            											(tonumber(sheet.xp2_11) or 0);
            					sheet.total2_11 = mod / 2;
            					sheet.total22_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event267 = obj.button105:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_12) or 0);
            				sheet.rollnome1 = sheet.nome2_12;
        end, obj);

    obj._e_event268 = obj.button106:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_12) or 0);
            				sheet.rollnome2 = sheet.nome2_12;
        end, obj);

    obj._e_event269 = obj.edit252:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_12) or 0)+
            											(tonumber(sheet.bonus2_12) or 0)+
            											(tonumber(sheet.xp2_12) or 0);
            					sheet.total2_12 = mod / 2;
            					sheet.total22_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event270 = obj.edit253:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_12) or 0)+
            											(tonumber(sheet.bonus2_12) or 0)+
            											(tonumber(sheet.xp2_12) or 0);
            					sheet.total2_12 = mod / 2;
            					sheet.total22_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event271 = obj.edit254:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_12) or 0)+
            											(tonumber(sheet.bonus2_12) or 0)+
            											(tonumber(sheet.xp2_12) or 0);
            					sheet.total2_12 = mod / 2;
            					sheet.total22_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event272 = obj.button107:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_1) or 0);
            				sheet.rollnome1 = sheet.nome1_1;
        end, obj);

    obj._e_event273 = obj.button108:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_1) or 0);
            				sheet.rollnome2 = sheet.nome1_1;
        end, obj);

    obj._e_event274 = obj.edit257:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_1) or 0)+
            											(tonumber(sheet.bonus1_1) or 0)+
            											(tonumber(sheet.xp1_1) or 0);
            					sheet.total1_1 = mod / 2;
            					sheet.total21_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event275 = obj.edit258:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_1) or 0)+
            											(tonumber(sheet.bonus1_1) or 0)+
            											(tonumber(sheet.xp1_1) or 0);
            					sheet.total1_1 = mod / 2;
            					sheet.total21_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event276 = obj.edit259:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_1) or 0)+
            											(tonumber(sheet.bonus1_1) or 0)+
            											(tonumber(sheet.xp1_1) or 0);
            					sheet.total1_1 = mod / 2;
            					sheet.total21_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event277 = obj.button109:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_2) or 0);
            				sheet.rollnome1 = sheet.nome1_2;
        end, obj);

    obj._e_event278 = obj.button110:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_2) or 0);
            				sheet.rollnome2 = sheet.nome1_2;
        end, obj);

    obj._e_event279 = obj.edit262:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_2) or 0)+
            											(tonumber(sheet.bonus1_2) or 0)+
            											(tonumber(sheet.xp1_2) or 0);
            					sheet.total1_2 = mod / 2;
            					sheet.total21_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event280 = obj.edit263:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_2) or 0)+
            											(tonumber(sheet.bonus1_2) or 0)+
            											(tonumber(sheet.xp1_2) or 0);
            					sheet.total1_2 = mod / 2;
            					sheet.total21_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event281 = obj.edit264:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_2) or 0)+
            											(tonumber(sheet.bonus1_2) or 0)+
            											(tonumber(sheet.xp1_2) or 0);
            					sheet.total1_2 = mod / 2;
            					sheet.total21_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event282 = obj.button111:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_3) or 0);
            				sheet.rollnome1 = sheet.nome1_3;
        end, obj);

    obj._e_event283 = obj.button112:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_3) or 0);
            				sheet.rollnome2 = sheet.nome1_3;
        end, obj);

    obj._e_event284 = obj.edit267:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_3) or 0)+
            											(tonumber(sheet.bonus1_3) or 0)+
            											(tonumber(sheet.xp1_3) or 0);
            					sheet.total1_3 = mod / 2;
            					sheet.total21_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event285 = obj.edit268:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_3) or 0)+
            											(tonumber(sheet.bonus1_3) or 0)+
            											(tonumber(sheet.xp1_3) or 0);
            					sheet.total1_3 = mod / 2;
            					sheet.total21_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event286 = obj.edit269:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_3) or 0)+
            											(tonumber(sheet.bonus1_3) or 0)+
            											(tonumber(sheet.xp1_3) or 0);
            					sheet.total1_3 = mod / 2;
            					sheet.total21_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event287 = obj.button113:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_4) or 0);
            				sheet.rollnome1 = sheet.nome1_4;
        end, obj);

    obj._e_event288 = obj.button114:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_4) or 0);
            				sheet.rollnome2 = sheet.nome1_4;
        end, obj);

    obj._e_event289 = obj.edit272:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_4) or 0)+
            											(tonumber(sheet.bonus1_4) or 0)+
            											(tonumber(sheet.xp1_4) or 0);
            					sheet.total1_4 = mod / 2;
            					sheet.total21_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event290 = obj.edit273:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_4) or 0)+
            											(tonumber(sheet.bonus1_4) or 0)+
            											(tonumber(sheet.xp1_4) or 0);
            					sheet.total1_4 = mod / 2;
            					sheet.total21_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event291 = obj.edit274:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_4) or 0)+
            											(tonumber(sheet.bonus1_4) or 0)+
            											(tonumber(sheet.xp1_4) or 0);
            					sheet.total1_4 = mod / 2;
            					sheet.total21_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event292 = obj.button115:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_5) or 0);
            				sheet.rollnome1 = sheet.nome1_5;
        end, obj);

    obj._e_event293 = obj.button116:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_5) or 0);
            				sheet.rollnome2 = sheet.nome1_5;
        end, obj);

    obj._e_event294 = obj.edit277:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_5) or 0)+
            											(tonumber(sheet.bonus1_5) or 0)+
            											(tonumber(sheet.xp1_5) or 0);
            					sheet.total1_5 = mod / 2;
            					sheet.total21_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event295 = obj.edit278:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_5) or 0)+
            											(tonumber(sheet.bonus1_5) or 0)+
            											(tonumber(sheet.xp1_5) or 0);
            					sheet.total1_5 = mod / 2;
            					sheet.total21_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event296 = obj.edit279:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_5) or 0)+
            											(tonumber(sheet.bonus1_5) or 0)+
            											(tonumber(sheet.xp1_5) or 0);
            					sheet.total1_5 = mod / 2;
            					sheet.total21_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event297 = obj.button117:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_6) or 0);
            				sheet.rollnome1 = sheet.nome1_6;
        end, obj);

    obj._e_event298 = obj.button118:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_6) or 0);
            				sheet.rollnome2 = sheet.nome1_6;
        end, obj);

    obj._e_event299 = obj.edit282:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_6) or 0)+
            											(tonumber(sheet.bonus1_6) or 0)+
            											(tonumber(sheet.xp1_6) or 0);
            					sheet.total1_6 = mod / 2;
            					sheet.total21_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event300 = obj.edit283:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_6) or 0)+
            											(tonumber(sheet.bonus1_6) or 0)+
            											(tonumber(sheet.xp1_6) or 0);
            					sheet.total1_6 = mod / 2;
            					sheet.total21_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event301 = obj.edit284:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_6) or 0)+
            											(tonumber(sheet.bonus1_6) or 0)+
            											(tonumber(sheet.xp1_6) or 0);
            					sheet.total1_6 = mod / 2;
            					sheet.total21_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event302 = obj.button119:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_7) or 0);
            				sheet.rollnome1 = sheet.nome1_7;
        end, obj);

    obj._e_event303 = obj.button120:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_7) or 0);
            				sheet.rollnome2 = sheet.nome1_7;
        end, obj);

    obj._e_event304 = obj.edit287:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_7) or 0)+
            											(tonumber(sheet.bonus1_7) or 0)+
            											(tonumber(sheet.xp1_7) or 0);
            					sheet.total1_7 = mod / 2;
            					sheet.total21_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event305 = obj.edit288:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_7) or 0)+
            											(tonumber(sheet.bonus1_7) or 0)+
            											(tonumber(sheet.xp1_7) or 0);
            					sheet.total1_7 = mod / 2;
            					sheet.total21_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event306 = obj.edit289:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_7) or 0)+
            											(tonumber(sheet.bonus1_7) or 0)+
            											(tonumber(sheet.xp1_7) or 0);
            					sheet.total1_7 = mod / 2;
            					sheet.total21_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event307 = obj.button121:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_8) or 0);
            				sheet.rollnome1 = sheet.nome1_8;
        end, obj);

    obj._e_event308 = obj.button122:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_8) or 0);
            				sheet.rollnome2 = sheet.nome1_8;
        end, obj);

    obj._e_event309 = obj.edit292:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_8) or 0)+
            											(tonumber(sheet.bonus1_8) or 0)+
            											(tonumber(sheet.xp1_8) or 0);
            					sheet.total1_8 = mod / 2;
            					sheet.total21_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event310 = obj.edit293:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_8) or 0)+
            											(tonumber(sheet.bonus1_8) or 0)+
            											(tonumber(sheet.xp1_8) or 0);
            					sheet.total1_8 = mod / 2;
            					sheet.total21_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event311 = obj.edit294:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_8) or 0)+
            											(tonumber(sheet.bonus1_8) or 0)+
            											(tonumber(sheet.xp1_8) or 0);
            					sheet.total1_8 = mod / 2;
            					sheet.total21_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event312 = obj.button123:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_9) or 0);
            				sheet.rollnome1 = sheet.nome1_9;
        end, obj);

    obj._e_event313 = obj.button124:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_9) or 0);
            				sheet.rollnome2 = sheet.nome1_9;
        end, obj);

    obj._e_event314 = obj.edit297:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_9) or 0)+
            											(tonumber(sheet.bonus1_9) or 0)+
            											(tonumber(sheet.xp1_9) or 0);
            					sheet.total1_9 = mod / 2;
            					sheet.total21_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event315 = obj.edit298:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_9) or 0)+
            											(tonumber(sheet.bonus1_9) or 0)+
            											(tonumber(sheet.xp1_9) or 0);
            					sheet.total1_9 = mod / 2;
            					sheet.total21_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event316 = obj.edit299:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_9) or 0)+
            											(tonumber(sheet.bonus1_9) or 0)+
            											(tonumber(sheet.xp1_9) or 0);
            					sheet.total1_9 = mod / 2;
            					sheet.total21_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event317 = obj.button125:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_10) or 0);
            				sheet.rollnome1 = sheet.nome1_10;
        end, obj);

    obj._e_event318 = obj.button126:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_10) or 0);
            				sheet.rollnome2 = sheet.nome1_10;
        end, obj);

    obj._e_event319 = obj.edit302:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_10) or 0)+
            											(tonumber(sheet.bonus1_10) or 0)+
            											(tonumber(sheet.xp1_10) or 0);
            					sheet.total1_10 = mod / 2;
            					sheet.total21_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event320 = obj.edit303:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_10) or 0)+
            											(tonumber(sheet.bonus1_10) or 0)+
            											(tonumber(sheet.xp1_10) or 0);
            					sheet.total1_10 = mod / 2;
            					sheet.total21_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event321 = obj.edit304:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_10) or 0)+
            											(tonumber(sheet.bonus1_10) or 0)+
            											(tonumber(sheet.xp1_10) or 0);
            					sheet.total1_10 = mod / 2;
            					sheet.total21_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event322 = obj.button127:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_11) or 0);
            				sheet.rollnome1 = sheet.nome1_11;
        end, obj);

    obj._e_event323 = obj.button128:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_11) or 0);
            				sheet.rollnome2 = sheet.nome1_11;
        end, obj);

    obj._e_event324 = obj.edit307:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_11) or 0)+
            											(tonumber(sheet.bonus1_11) or 0)+
            											(tonumber(sheet.xp1_11) or 0);
            					sheet.total1_11 = mod / 2;
            					sheet.total21_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event325 = obj.edit308:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_11) or 0)+
            											(tonumber(sheet.bonus1_11) or 0)+
            											(tonumber(sheet.xp1_11) or 0);
            					sheet.total1_11 = mod / 2;
            					sheet.total21_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event326 = obj.edit309:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_11) or 0)+
            											(tonumber(sheet.bonus1_11) or 0)+
            											(tonumber(sheet.xp1_11) or 0);
            					sheet.total1_11 = mod / 2;
            					sheet.total21_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event327 = obj.button129:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_12) or 0);
            				sheet.rollnome1 = sheet.nome1_12;
        end, obj);

    obj._e_event328 = obj.button130:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_12) or 0);
            				sheet.rollnome2 = sheet.nome1_12;
        end, obj);

    obj._e_event329 = obj.edit312:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_12) or 0)+
            											(tonumber(sheet.bonus1_12) or 0)+
            											(tonumber(sheet.xp1_12) or 0);
            					sheet.total1_12 = mod / 2;
            					sheet.total21_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event330 = obj.edit313:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_12) or 0)+
            											(tonumber(sheet.bonus1_12) or 0)+
            											(tonumber(sheet.xp1_12) or 0);
            					sheet.total1_12 = mod / 2;
            					sheet.total21_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event331 = obj.edit314:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_12) or 0)+
            											(tonumber(sheet.bonus1_12) or 0)+
            											(tonumber(sheet.xp1_12) or 0);
            					sheet.total1_12 = mod / 2;
            					sheet.total21_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event332 = obj.button131:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_1) or 0);
            				sheet.rollnome1 = sheet.nome3_1;
        end, obj);

    obj._e_event333 = obj.button132:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_1) or 0);
            				sheet.rollnome2 = sheet.nome3_1;
        end, obj);

    obj._e_event334 = obj.edit317:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_1) or 0)+
            											(tonumber(sheet.bonus3_1) or 0)+
            											(tonumber(sheet.xp3_1) or 0);
            					sheet.total3_1 = mod / 2;
            					sheet.total23_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event335 = obj.edit318:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_1) or 0)+
            											(tonumber(sheet.bonus3_1) or 0)+
            											(tonumber(sheet.xp3_1) or 0);
            					sheet.total3_1 = mod / 2;
            					sheet.total23_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event336 = obj.edit319:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_1) or 0)+
            											(tonumber(sheet.bonus3_1) or 0)+
            											(tonumber(sheet.xp3_1) or 0);
            					sheet.total3_1 = mod / 2;
            					sheet.total23_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event337 = obj.button133:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_2) or 0);
            				sheet.rollnome1 = sheet.nome3_2;
        end, obj);

    obj._e_event338 = obj.button134:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_2) or 0);
            				sheet.rollnome2 = sheet.nome3_2;
        end, obj);

    obj._e_event339 = obj.edit322:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_2) or 0)+
            											(tonumber(sheet.bonus3_2) or 0)+
            											(tonumber(sheet.xp3_2) or 0);
            					sheet.total3_2 = mod / 2;
            					sheet.total23_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event340 = obj.edit323:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_2) or 0)+
            											(tonumber(sheet.bonus3_2) or 0)+
            											(tonumber(sheet.xp3_2) or 0);
            					sheet.total3_2 = mod / 2;
            					sheet.total23_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event341 = obj.edit324:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_2) or 0)+
            											(tonumber(sheet.bonus3_2) or 0)+
            											(tonumber(sheet.xp3_2) or 0);
            					sheet.total3_2 = mod / 2;
            					sheet.total23_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event342 = obj.button135:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_3) or 0);
            				sheet.rollnome1 = sheet.nome3_3;
        end, obj);

    obj._e_event343 = obj.button136:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_3) or 0);
            				sheet.rollnome2 = sheet.nome3_3;
        end, obj);

    obj._e_event344 = obj.edit327:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_3) or 0)+
            											(tonumber(sheet.bonus3_3) or 0)+
            											(tonumber(sheet.xp3_3) or 0);
            					sheet.total3_3 = mod / 2;
            					sheet.total23_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event345 = obj.edit328:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_3) or 0)+
            											(tonumber(sheet.bonus3_3) or 0)+
            											(tonumber(sheet.xp3_3) or 0);
            					sheet.total3_3 = mod / 2;
            					sheet.total23_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event346 = obj.edit329:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_3) or 0)+
            											(tonumber(sheet.bonus3_3) or 0)+
            											(tonumber(sheet.xp3_3) or 0);
            					sheet.total3_3 = mod / 2;
            					sheet.total23_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event347 = obj.button137:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_4) or 0);
            				sheet.rollnome1 = sheet.nome3_4;
        end, obj);

    obj._e_event348 = obj.button138:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_4) or 0);
            				sheet.rollnome2 = sheet.nome3_4;
        end, obj);

    obj._e_event349 = obj.edit332:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_4) or 0)+
            											(tonumber(sheet.bonus3_4) or 0)+
            											(tonumber(sheet.xp3_4) or 0);
            					sheet.total3_4 = mod / 2;
            					sheet.total23_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event350 = obj.edit333:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_4) or 0)+
            											(tonumber(sheet.bonus3_4) or 0)+
            											(tonumber(sheet.xp3_4) or 0);
            					sheet.total3_4 = mod / 2;
            					sheet.total23_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event351 = obj.edit334:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_4) or 0)+
            											(tonumber(sheet.bonus3_4) or 0)+
            											(tonumber(sheet.xp3_4) or 0);
            					sheet.total3_4 = mod / 2;
            					sheet.total23_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event352 = obj.button139:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_5) or 0);
            				sheet.rollnome1 = sheet.nome3_5;
        end, obj);

    obj._e_event353 = obj.button140:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_5) or 0);
            				sheet.rollnome2 = sheet.nome3_5;
        end, obj);

    obj._e_event354 = obj.edit337:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_5) or 0)+
            											(tonumber(sheet.bonus3_5) or 0)+
            											(tonumber(sheet.xp3_5) or 0);
            					sheet.total3_5 = mod / 2;
            					sheet.total23_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event355 = obj.edit338:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_5) or 0)+
            											(tonumber(sheet.bonus3_5) or 0)+
            											(tonumber(sheet.xp3_5) or 0);
            					sheet.total3_5 = mod / 2;
            					sheet.total23_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event356 = obj.edit339:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_5) or 0)+
            											(tonumber(sheet.bonus3_5) or 0)+
            											(tonumber(sheet.xp3_5) or 0);
            					sheet.total3_5 = mod / 2;
            					sheet.total23_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event357 = obj.button141:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_6) or 0);
            				sheet.rollnome1 = sheet.nome3_6;
        end, obj);

    obj._e_event358 = obj.button142:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_6) or 0);
            				sheet.rollnome2 = sheet.nome3_6;
        end, obj);

    obj._e_event359 = obj.edit342:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_6) or 0)+
            											(tonumber(sheet.bonus3_6) or 0)+
            											(tonumber(sheet.xp3_6) or 0);
            					sheet.total3_6 = mod / 2;
            					sheet.total23_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event360 = obj.edit343:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_6) or 0)+
            											(tonumber(sheet.bonus3_6) or 0)+
            											(tonumber(sheet.xp3_6) or 0);
            					sheet.total3_6 = mod / 2;
            					sheet.total23_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event361 = obj.edit344:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_6) or 0)+
            											(tonumber(sheet.bonus3_6) or 0)+
            											(tonumber(sheet.xp3_6) or 0);
            					sheet.total3_6 = mod / 2;
            					sheet.total23_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event362 = obj.button143:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_7) or 0);
            				sheet.rollnome1 = sheet.nome3_7;
        end, obj);

    obj._e_event363 = obj.button144:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_7) or 0);
            				sheet.rollnome2 = sheet.nome3_7;
        end, obj);

    obj._e_event364 = obj.edit347:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_7) or 0)+
            											(tonumber(sheet.bonus3_7) or 0)+
            											(tonumber(sheet.xp3_7) or 0);
            					sheet.total3_7 = mod / 2;
            					sheet.total23_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event365 = obj.edit348:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_7) or 0)+
            											(tonumber(sheet.bonus3_7) or 0)+
            											(tonumber(sheet.xp3_7) or 0);
            					sheet.total3_7 = mod / 2;
            					sheet.total23_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event366 = obj.edit349:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_7) or 0)+
            											(tonumber(sheet.bonus3_7) or 0)+
            											(tonumber(sheet.xp3_7) or 0);
            					sheet.total3_7 = mod / 2;
            					sheet.total23_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event367 = obj.button145:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_8) or 0);
            				sheet.rollnome1 = sheet.nome3_8;
        end, obj);

    obj._e_event368 = obj.button146:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_8) or 0);
            				sheet.rollnome2 = sheet.nome3_8;
        end, obj);

    obj._e_event369 = obj.edit352:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_8) or 0)+
            											(tonumber(sheet.bonus3_8) or 0)+
            											(tonumber(sheet.xp3_8) or 0);
            					sheet.total3_8 = mod / 2;
            					sheet.total23_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event370 = obj.edit353:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_8) or 0)+
            											(tonumber(sheet.bonus3_8) or 0)+
            											(tonumber(sheet.xp3_8) or 0);
            					sheet.total3_8 = mod / 2;
            					sheet.total23_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event371 = obj.edit354:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_8) or 0)+
            											(tonumber(sheet.bonus3_8) or 0)+
            											(tonumber(sheet.xp3_8) or 0);
            					sheet.total3_8 = mod / 2;
            					sheet.total23_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event372 = obj.button147:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_9) or 0);
            				sheet.rollnome1 = sheet.nome3_9;
        end, obj);

    obj._e_event373 = obj.button148:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_9) or 0);
            				sheet.rollnome2 = sheet.nome3_9;
        end, obj);

    obj._e_event374 = obj.edit357:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_9) or 0)+
            											(tonumber(sheet.bonus3_9) or 0)+
            											(tonumber(sheet.xp3_9) or 0);
            					sheet.total3_9 = mod / 2;
            					sheet.total23_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event375 = obj.edit358:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_9) or 0)+
            											(tonumber(sheet.bonus3_9) or 0)+
            											(tonumber(sheet.xp3_9) or 0);
            					sheet.total3_9 = mod / 2;
            					sheet.total23_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event376 = obj.edit359:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_9) or 0)+
            											(tonumber(sheet.bonus3_9) or 0)+
            											(tonumber(sheet.xp3_9) or 0);
            					sheet.total3_9 = mod / 2;
            					sheet.total23_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event377 = obj.button149:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_10) or 0);
            				sheet.rollnome1 = sheet.nome3_10;
        end, obj);

    obj._e_event378 = obj.button150:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_10) or 0);
            				sheet.rollnome2 = sheet.nome3_10;
        end, obj);

    obj._e_event379 = obj.edit362:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_10) or 0)+
            											(tonumber(sheet.bonus3_10) or 0)+
            											(tonumber(sheet.xp3_10) or 0);
            					sheet.total3_10 = mod / 2;
            					sheet.total23_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event380 = obj.edit363:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_10) or 0)+
            											(tonumber(sheet.bonus3_10) or 0)+
            											(tonumber(sheet.xp3_10) or 0);
            					sheet.total3_10 = mod / 2;
            					sheet.total23_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event381 = obj.edit364:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_10) or 0)+
            											(tonumber(sheet.bonus3_10) or 0)+
            											(tonumber(sheet.xp3_10) or 0);
            					sheet.total3_10 = mod / 2;
            					sheet.total23_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event382 = obj.button151:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_11) or 0);
            				sheet.rollnome1 = sheet.nome3_11;
        end, obj);

    obj._e_event383 = obj.button152:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_11) or 0);
            				sheet.rollnome2 = sheet.nome3_11;
        end, obj);

    obj._e_event384 = obj.edit367:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_11) or 0)+
            											(tonumber(sheet.bonus3_11) or 0)+
            											(tonumber(sheet.xp3_11) or 0);
            					sheet.total3_11 = mod / 2;
            					sheet.total23_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event385 = obj.edit368:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_11) or 0)+
            											(tonumber(sheet.bonus3_11) or 0)+
            											(tonumber(sheet.xp3_11) or 0);
            					sheet.total3_11 = mod / 2;
            					sheet.total23_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event386 = obj.edit369:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_11) or 0)+
            											(tonumber(sheet.bonus3_11) or 0)+
            											(tonumber(sheet.xp3_11) or 0);
            					sheet.total3_11 = mod / 2;
            					sheet.total23_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event387 = obj.button153:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_12) or 0);
            				sheet.rollnome1 = sheet.nome3_12;
        end, obj);

    obj._e_event388 = obj.button154:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_12) or 0);
            				sheet.rollnome2 = sheet.nome3_12;
        end, obj);

    obj._e_event389 = obj.edit372:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_12) or 0)+
            											(tonumber(sheet.bonus3_12) or 0)+
            											(tonumber(sheet.xp3_12) or 0);
            					sheet.total3_12 = mod / 2;
            					sheet.total23_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event390 = obj.edit373:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_12) or 0)+
            											(tonumber(sheet.bonus3_12) or 0)+
            											(tonumber(sheet.xp3_12) or 0);
            					sheet.total3_12 = mod / 2;
            					sheet.total23_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event391 = obj.edit374:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_12) or 0)+
            											(tonumber(sheet.bonus3_12) or 0)+
            											(tonumber(sheet.xp3_12) or 0);
            					sheet.total3_12 = mod / 2;
            					sheet.total23_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event392 = obj.button155:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            					sheet.field2 = nil;
            					sheet.num2 = nil;
            					sheet.nome2 = nil;
        end, obj);

    obj._e_event393 = obj.button156:addEventListener("onClick",
        function (_)
            rolar();
        end, obj);

    obj._e_event394 = obj.button157:addEventListener("onClick",
        function (_)
            System.setClipboardText(sheet.historia);
        end, obj);

    obj._e_event395 = obj.dataLink86:addEventListener("onChange",
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

    obj._e_event396 = obj.dataLink87:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event397 = obj.dataLink88:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event398 = obj.dataLink89:addEventListener("onChange",
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

    obj._e_event399 = obj.button158:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/README.md')
        end, obj);

    obj._e_event400 = obj.button159:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/output/Ao%20cair%20da%20noite.rpk?raw=true')
        end, obj);

    obj._e_event401 = obj.button160:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event402 = obj.button161:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=97151');
        end, obj);

    obj._e_event403 = obj.button162:addEventListener("onClick",
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

    obj._e_event404 = obj.button163:addEventListener("onClick",
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

    obj._e_event405 = obj.dataLink104:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = (tonumber(sheet.inicialforca) or 0) + 
            									(tonumber(sheet.inicialagilidade) or 0) + 
            									(tonumber(sheet.inicialresiliencia) or 0);
            					sheet.auditini_atrFis = fisicos;
        end, obj);

    obj._e_event406 = obj.dataLink105:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = (tonumber(sheet.bonusforca) or 0) + 
            									(tonumber(sheet.bonusagilidade) or 0) + 
            									(tonumber(sheet.bonusresiliencia) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_atrFis) or 1);
            					sheet.auditbonus_atrFis = fisicos * mult;
        end, obj);

    obj._e_event407 = obj.dataLink106:addEventListener("onChange",
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

    obj._e_event408 = obj.dataLink107:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.inicialcarisma) or 0) + 
            									(tonumber(sheet.inicialpercepcao) or 0) + 
            									(tonumber(sheet.inicialperspicacia) or 0);
            					sheet.auditini_atrMen = mentais;
        end, obj);

    obj._e_event409 = obj.dataLink108:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.bonuscarisma) or 0) + 
            									(tonumber(sheet.bonuspercepcao) or 0) + 
            									(tonumber(sheet.bonusperspicacia) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_atrMen) or 1);
            					sheet.auditbonus_atrMen = mentais * mult;
        end, obj);

    obj._e_event410 = obj.dataLink109:addEventListener("onChange",
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

    obj._e_event411 = obj.dataLink110:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = (tonumber(sheet.base0_1) or 0) + (tonumber(sheet.base0_2) or 0) + (tonumber(sheet.base0_3) or 0) + (tonumber(sheet.base0_4) or 0) + (tonumber(sheet.base0_5) or 0) + (tonumber(sheet.base0_6) or 0) + (tonumber(sheet.base0_7) or 0) + (tonumber(sheet.base0_8) or 0) + (tonumber(sheet.base0_9) or 0) + (tonumber(sheet.base0_10) or 0) + (tonumber(sheet.base0_11) or 0) + (tonumber(sheet.base0_12) or 0) + (tonumber(sheet.base2_1) or 0) + (tonumber(sheet.base2_2) or 0) + (tonumber(sheet.base2_3) or 0) + (tonumber(sheet.base2_4) or 0) + (tonumber(sheet.base2_5) or 0) + (tonumber(sheet.base2_6) or 0) + (tonumber(sheet.base2_7) or 0) + (tonumber(sheet.base2_8) or 0) + (tonumber(sheet.base2_9) or 0) + (tonumber(sheet.base2_10) or 0) + (tonumber(sheet.base2_11) or 0) + (tonumber(sheet.base2_12) or 0);
            					sheet.auditini_aptFis = fisicos;
        end, obj);

    obj._e_event412 = obj.dataLink111:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = (tonumber(sheet.bonus0_1) or 0) + (tonumber(sheet.bonus0_2) or 0) + (tonumber(sheet.bonus0_3) or 0) + (tonumber(sheet.bonus0_4) or 0) + (tonumber(sheet.bonus0_5) or 0) + (tonumber(sheet.bonus0_6) or 0) + (tonumber(sheet.bonus0_7) or 0) + (tonumber(sheet.bonus0_8) or 0) + (tonumber(sheet.bonus0_9) or 0) + (tonumber(sheet.bonus0_10) or 0) + (tonumber(sheet.bonus0_11) or 0) + (tonumber(sheet.bonus0_12) or 0) + (tonumber(sheet.bonus2_1) or 0) + (tonumber(sheet.bonus2_2) or 0) + (tonumber(sheet.bonus2_3) or 0) + (tonumber(sheet.bonus2_4) or 0) + (tonumber(sheet.bonus2_5) or 0) + (tonumber(sheet.bonus2_6) or 0) + (tonumber(sheet.bonus2_7) or 0) + (tonumber(sheet.bonus2_8) or 0) + (tonumber(sheet.bonus2_9) or 0) + (tonumber(sheet.bonus2_10) or 0) + (tonumber(sheet.bonus2_11) or 0) + (tonumber(sheet.bonus2_12) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_aptFis) or 1);
            					sheet.auditbonus_aptFis = fisicos * mult;
        end, obj);

    obj._e_event413 = obj.dataLink112:addEventListener("onChange",
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

    obj._e_event414 = obj.dataLink113:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.base1_1) or 0) + (tonumber(sheet.base1_2) or 0) + (tonumber(sheet.base1_3) or 0) + (tonumber(sheet.base1_4) or 0) + (tonumber(sheet.base1_5) or 0) + (tonumber(sheet.base1_6) or 0) + (tonumber(sheet.base1_7) or 0) + (tonumber(sheet.base1_8) or 0) + (tonumber(sheet.base1_9) or 0) + (tonumber(sheet.base1_10) or 0) + (tonumber(sheet.base1_11) or 0) + (tonumber(sheet.base1_12) or 0) + (tonumber(sheet.base3_1) or 0) + (tonumber(sheet.base3_2) or 0) + (tonumber(sheet.base3_3) or 0) + (tonumber(sheet.base3_4) or 0) + (tonumber(sheet.base3_5) or 0) + (tonumber(sheet.base3_6) or 0) + (tonumber(sheet.base3_7) or 0) + (tonumber(sheet.base3_8) or 0) + (tonumber(sheet.base3_9) or 0) + (tonumber(sheet.base3_10) or 0) + (tonumber(sheet.base3_11) or 0) + (tonumber(sheet.base3_12) or 0);
            					sheet.auditini_aptMen = mentais;
        end, obj);

    obj._e_event415 = obj.dataLink114:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.bonus1_1) or 0) + (tonumber(sheet.bonus1_2) or 0) + (tonumber(sheet.bonus1_3) or 0) + (tonumber(sheet.bonus1_4) or 0) + (tonumber(sheet.bonus1_5) or 0) + (tonumber(sheet.bonus1_6) or 0) + (tonumber(sheet.bonus1_7) or 0) + (tonumber(sheet.bonus1_8) or 0) + (tonumber(sheet.bonus1_9) or 0) + (tonumber(sheet.bonus1_10) or 0) + (tonumber(sheet.bonus1_11) or 0) + (tonumber(sheet.bonus1_12) or 0) + (tonumber(sheet.bonus3_1) or 0) + (tonumber(sheet.bonus3_2) or 0) + (tonumber(sheet.bonus3_3) or 0) + (tonumber(sheet.bonus3_4) or 0) + (tonumber(sheet.bonus3_5) or 0) + (tonumber(sheet.bonus3_6) or 0) + (tonumber(sheet.bonus3_7) or 0) + (tonumber(sheet.bonus3_8) or 0) + (tonumber(sheet.bonus3_9) or 0) + (tonumber(sheet.bonus3_10) or 0) + (tonumber(sheet.bonus3_11) or 0) + (tonumber(sheet.bonus3_12) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_aptMen) or 1);
            					sheet.auditbonus_aptMen = mentais * mult;
        end, obj);

    obj._e_event416 = obj.dataLink115:addEventListener("onChange",
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

    obj._e_event417 = obj.dataLink116:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historico = (tonumber(sheet.historicoValor1_1) or 0) + (tonumber(sheet.historicoValor1_2) or 0) + (tonumber(sheet.historicoValor1_3) or 0) + (tonumber(sheet.historicoValor1_4) or 0) + (tonumber(sheet.historicoValor1_5) or 0) + (tonumber(sheet.historicoValor1_6) or 0) + (tonumber(sheet.historicoValor2_1) or 0) + (tonumber(sheet.historicoValor2_2) or 0) + (tonumber(sheet.historicoValor2_3) or 0) + (tonumber(sheet.historicoValor2_4) or 0) + (tonumber(sheet.historicoValor2_5) or 0) + (tonumber(sheet.historicoValor2_6) or 0) + (tonumber(sheet.historicoValor3_1) or 0) + (tonumber(sheet.historicoValor3_2) or 0) + (tonumber(sheet.historicoValor3_3) or 0) + (tonumber(sheet.historicoValor3_4) or 0) + (tonumber(sheet.historicoValor3_5) or 0) + (tonumber(sheet.historicoValor3_6) or 0);
            					sheet.auditini_hist = historico;
        end, obj);

    obj._e_event418 = obj.dataLink117:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historico = (tonumber(sheet.historicoBonus1_1) or 0) + (tonumber(sheet.historicoBonus1_2) or 0) + (tonumber(sheet.historicoBonus1_3) or 0) + (tonumber(sheet.historicoBonus1_4) or 0) + (tonumber(sheet.historicoBonus1_5) or 0) + (tonumber(sheet.historicoBonus1_6) or 0) + (tonumber(sheet.historicoBonus2_1) or 0) + (tonumber(sheet.historicoBonus2_2) or 0) + (tonumber(sheet.historicoBonus2_3) or 0) + (tonumber(sheet.historicoBonus2_4) or 0) + (tonumber(sheet.historicoBonus2_5) or 0) + (tonumber(sheet.historicoBonus2_6) or 0) + (tonumber(sheet.historicoBonus3_1) or 0) + (tonumber(sheet.historicoBonus3_2) or 0) + (tonumber(sheet.historicoBonus3_3) or 0) + (tonumber(sheet.historicoBonus3_4) or 0) + (tonumber(sheet.historicoBonus3_5) or 0) + (tonumber(sheet.historicoBonus3_6) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_hist) or 1);
            					sheet.auditbonus_hist = historico * mult;
        end, obj);

    obj._e_event419 = obj.dataLink118:addEventListener("onChange",
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

    obj._e_event420 = obj.dataLink119:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local eidolon = (tonumber(sheet.inicialconsciencia) or 0) + (tonumber(sheet.inicialespirito) or 0) + (tonumber(sheet.inicialperseveranca) or 0);
            					sheet.auditini_eido = eidolon;
        end, obj);

    obj._e_event421 = obj.dataLink120:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local eidolon = (tonumber(sheet.bonusconsciencia) or 0) + (tonumber(sheet.bonusespirito) or 0) + (tonumber(sheet.bonusperseveranca) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_eido) or 1);
            					sheet.auditbonus_eido = eidolon * mult;
        end, obj);

    obj._e_event422 = obj.dataLink121:addEventListener("onChange",
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

    obj._e_event423 = obj.dataLink122:addEventListener("onChange",
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

    obj._e_event424 = obj.dataLink123:addEventListener("onChange",
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
        __o_rrpgObjs.removeEventListenerById(self._e_event424);
        __o_rrpgObjs.removeEventListenerById(self._e_event423);
        __o_rrpgObjs.removeEventListenerById(self._e_event422);
        __o_rrpgObjs.removeEventListenerById(self._e_event421);
        __o_rrpgObjs.removeEventListenerById(self._e_event420);
        __o_rrpgObjs.removeEventListenerById(self._e_event419);
        __o_rrpgObjs.removeEventListenerById(self._e_event418);
        __o_rrpgObjs.removeEventListenerById(self._e_event417);
        __o_rrpgObjs.removeEventListenerById(self._e_event416);
        __o_rrpgObjs.removeEventListenerById(self._e_event415);
        __o_rrpgObjs.removeEventListenerById(self._e_event414);
        __o_rrpgObjs.removeEventListenerById(self._e_event413);
        __o_rrpgObjs.removeEventListenerById(self._e_event412);
        __o_rrpgObjs.removeEventListenerById(self._e_event411);
        __o_rrpgObjs.removeEventListenerById(self._e_event410);
        __o_rrpgObjs.removeEventListenerById(self._e_event409);
        __o_rrpgObjs.removeEventListenerById(self._e_event408);
        __o_rrpgObjs.removeEventListenerById(self._e_event407);
        __o_rrpgObjs.removeEventListenerById(self._e_event406);
        __o_rrpgObjs.removeEventListenerById(self._e_event405);
        __o_rrpgObjs.removeEventListenerById(self._e_event404);
        __o_rrpgObjs.removeEventListenerById(self._e_event403);
        __o_rrpgObjs.removeEventListenerById(self._e_event402);
        __o_rrpgObjs.removeEventListenerById(self._e_event401);
        __o_rrpgObjs.removeEventListenerById(self._e_event400);
        __o_rrpgObjs.removeEventListenerById(self._e_event399);
        __o_rrpgObjs.removeEventListenerById(self._e_event398);
        __o_rrpgObjs.removeEventListenerById(self._e_event397);
        __o_rrpgObjs.removeEventListenerById(self._e_event396);
        __o_rrpgObjs.removeEventListenerById(self._e_event395);
        __o_rrpgObjs.removeEventListenerById(self._e_event394);
        __o_rrpgObjs.removeEventListenerById(self._e_event393);
        __o_rrpgObjs.removeEventListenerById(self._e_event392);
        __o_rrpgObjs.removeEventListenerById(self._e_event391);
        __o_rrpgObjs.removeEventListenerById(self._e_event390);
        __o_rrpgObjs.removeEventListenerById(self._e_event389);
        __o_rrpgObjs.removeEventListenerById(self._e_event388);
        __o_rrpgObjs.removeEventListenerById(self._e_event387);
        __o_rrpgObjs.removeEventListenerById(self._e_event386);
        __o_rrpgObjs.removeEventListenerById(self._e_event385);
        __o_rrpgObjs.removeEventListenerById(self._e_event384);
        __o_rrpgObjs.removeEventListenerById(self._e_event383);
        __o_rrpgObjs.removeEventListenerById(self._e_event382);
        __o_rrpgObjs.removeEventListenerById(self._e_event381);
        __o_rrpgObjs.removeEventListenerById(self._e_event380);
        __o_rrpgObjs.removeEventListenerById(self._e_event379);
        __o_rrpgObjs.removeEventListenerById(self._e_event378);
        __o_rrpgObjs.removeEventListenerById(self._e_event377);
        __o_rrpgObjs.removeEventListenerById(self._e_event376);
        __o_rrpgObjs.removeEventListenerById(self._e_event375);
        __o_rrpgObjs.removeEventListenerById(self._e_event374);
        __o_rrpgObjs.removeEventListenerById(self._e_event373);
        __o_rrpgObjs.removeEventListenerById(self._e_event372);
        __o_rrpgObjs.removeEventListenerById(self._e_event371);
        __o_rrpgObjs.removeEventListenerById(self._e_event370);
        __o_rrpgObjs.removeEventListenerById(self._e_event369);
        __o_rrpgObjs.removeEventListenerById(self._e_event368);
        __o_rrpgObjs.removeEventListenerById(self._e_event367);
        __o_rrpgObjs.removeEventListenerById(self._e_event366);
        __o_rrpgObjs.removeEventListenerById(self._e_event365);
        __o_rrpgObjs.removeEventListenerById(self._e_event364);
        __o_rrpgObjs.removeEventListenerById(self._e_event363);
        __o_rrpgObjs.removeEventListenerById(self._e_event362);
        __o_rrpgObjs.removeEventListenerById(self._e_event361);
        __o_rrpgObjs.removeEventListenerById(self._e_event360);
        __o_rrpgObjs.removeEventListenerById(self._e_event359);
        __o_rrpgObjs.removeEventListenerById(self._e_event358);
        __o_rrpgObjs.removeEventListenerById(self._e_event357);
        __o_rrpgObjs.removeEventListenerById(self._e_event356);
        __o_rrpgObjs.removeEventListenerById(self._e_event355);
        __o_rrpgObjs.removeEventListenerById(self._e_event354);
        __o_rrpgObjs.removeEventListenerById(self._e_event353);
        __o_rrpgObjs.removeEventListenerById(self._e_event352);
        __o_rrpgObjs.removeEventListenerById(self._e_event351);
        __o_rrpgObjs.removeEventListenerById(self._e_event350);
        __o_rrpgObjs.removeEventListenerById(self._e_event349);
        __o_rrpgObjs.removeEventListenerById(self._e_event348);
        __o_rrpgObjs.removeEventListenerById(self._e_event347);
        __o_rrpgObjs.removeEventListenerById(self._e_event346);
        __o_rrpgObjs.removeEventListenerById(self._e_event345);
        __o_rrpgObjs.removeEventListenerById(self._e_event344);
        __o_rrpgObjs.removeEventListenerById(self._e_event343);
        __o_rrpgObjs.removeEventListenerById(self._e_event342);
        __o_rrpgObjs.removeEventListenerById(self._e_event341);
        __o_rrpgObjs.removeEventListenerById(self._e_event340);
        __o_rrpgObjs.removeEventListenerById(self._e_event339);
        __o_rrpgObjs.removeEventListenerById(self._e_event338);
        __o_rrpgObjs.removeEventListenerById(self._e_event337);
        __o_rrpgObjs.removeEventListenerById(self._e_event336);
        __o_rrpgObjs.removeEventListenerById(self._e_event335);
        __o_rrpgObjs.removeEventListenerById(self._e_event334);
        __o_rrpgObjs.removeEventListenerById(self._e_event333);
        __o_rrpgObjs.removeEventListenerById(self._e_event332);
        __o_rrpgObjs.removeEventListenerById(self._e_event331);
        __o_rrpgObjs.removeEventListenerById(self._e_event330);
        __o_rrpgObjs.removeEventListenerById(self._e_event329);
        __o_rrpgObjs.removeEventListenerById(self._e_event328);
        __o_rrpgObjs.removeEventListenerById(self._e_event327);
        __o_rrpgObjs.removeEventListenerById(self._e_event326);
        __o_rrpgObjs.removeEventListenerById(self._e_event325);
        __o_rrpgObjs.removeEventListenerById(self._e_event324);
        __o_rrpgObjs.removeEventListenerById(self._e_event323);
        __o_rrpgObjs.removeEventListenerById(self._e_event322);
        __o_rrpgObjs.removeEventListenerById(self._e_event321);
        __o_rrpgObjs.removeEventListenerById(self._e_event320);
        __o_rrpgObjs.removeEventListenerById(self._e_event319);
        __o_rrpgObjs.removeEventListenerById(self._e_event318);
        __o_rrpgObjs.removeEventListenerById(self._e_event317);
        __o_rrpgObjs.removeEventListenerById(self._e_event316);
        __o_rrpgObjs.removeEventListenerById(self._e_event315);
        __o_rrpgObjs.removeEventListenerById(self._e_event314);
        __o_rrpgObjs.removeEventListenerById(self._e_event313);
        __o_rrpgObjs.removeEventListenerById(self._e_event312);
        __o_rrpgObjs.removeEventListenerById(self._e_event311);
        __o_rrpgObjs.removeEventListenerById(self._e_event310);
        __o_rrpgObjs.removeEventListenerById(self._e_event309);
        __o_rrpgObjs.removeEventListenerById(self._e_event308);
        __o_rrpgObjs.removeEventListenerById(self._e_event307);
        __o_rrpgObjs.removeEventListenerById(self._e_event306);
        __o_rrpgObjs.removeEventListenerById(self._e_event305);
        __o_rrpgObjs.removeEventListenerById(self._e_event304);
        __o_rrpgObjs.removeEventListenerById(self._e_event303);
        __o_rrpgObjs.removeEventListenerById(self._e_event302);
        __o_rrpgObjs.removeEventListenerById(self._e_event301);
        __o_rrpgObjs.removeEventListenerById(self._e_event300);
        __o_rrpgObjs.removeEventListenerById(self._e_event299);
        __o_rrpgObjs.removeEventListenerById(self._e_event298);
        __o_rrpgObjs.removeEventListenerById(self._e_event297);
        __o_rrpgObjs.removeEventListenerById(self._e_event296);
        __o_rrpgObjs.removeEventListenerById(self._e_event295);
        __o_rrpgObjs.removeEventListenerById(self._e_event294);
        __o_rrpgObjs.removeEventListenerById(self._e_event293);
        __o_rrpgObjs.removeEventListenerById(self._e_event292);
        __o_rrpgObjs.removeEventListenerById(self._e_event291);
        __o_rrpgObjs.removeEventListenerById(self._e_event290);
        __o_rrpgObjs.removeEventListenerById(self._e_event289);
        __o_rrpgObjs.removeEventListenerById(self._e_event288);
        __o_rrpgObjs.removeEventListenerById(self._e_event287);
        __o_rrpgObjs.removeEventListenerById(self._e_event286);
        __o_rrpgObjs.removeEventListenerById(self._e_event285);
        __o_rrpgObjs.removeEventListenerById(self._e_event284);
        __o_rrpgObjs.removeEventListenerById(self._e_event283);
        __o_rrpgObjs.removeEventListenerById(self._e_event282);
        __o_rrpgObjs.removeEventListenerById(self._e_event281);
        __o_rrpgObjs.removeEventListenerById(self._e_event280);
        __o_rrpgObjs.removeEventListenerById(self._e_event279);
        __o_rrpgObjs.removeEventListenerById(self._e_event278);
        __o_rrpgObjs.removeEventListenerById(self._e_event277);
        __o_rrpgObjs.removeEventListenerById(self._e_event276);
        __o_rrpgObjs.removeEventListenerById(self._e_event275);
        __o_rrpgObjs.removeEventListenerById(self._e_event274);
        __o_rrpgObjs.removeEventListenerById(self._e_event273);
        __o_rrpgObjs.removeEventListenerById(self._e_event272);
        __o_rrpgObjs.removeEventListenerById(self._e_event271);
        __o_rrpgObjs.removeEventListenerById(self._e_event270);
        __o_rrpgObjs.removeEventListenerById(self._e_event269);
        __o_rrpgObjs.removeEventListenerById(self._e_event268);
        __o_rrpgObjs.removeEventListenerById(self._e_event267);
        __o_rrpgObjs.removeEventListenerById(self._e_event266);
        __o_rrpgObjs.removeEventListenerById(self._e_event265);
        __o_rrpgObjs.removeEventListenerById(self._e_event264);
        __o_rrpgObjs.removeEventListenerById(self._e_event263);
        __o_rrpgObjs.removeEventListenerById(self._e_event262);
        __o_rrpgObjs.removeEventListenerById(self._e_event261);
        __o_rrpgObjs.removeEventListenerById(self._e_event260);
        __o_rrpgObjs.removeEventListenerById(self._e_event259);
        __o_rrpgObjs.removeEventListenerById(self._e_event258);
        __o_rrpgObjs.removeEventListenerById(self._e_event257);
        __o_rrpgObjs.removeEventListenerById(self._e_event256);
        __o_rrpgObjs.removeEventListenerById(self._e_event255);
        __o_rrpgObjs.removeEventListenerById(self._e_event254);
        __o_rrpgObjs.removeEventListenerById(self._e_event253);
        __o_rrpgObjs.removeEventListenerById(self._e_event252);
        __o_rrpgObjs.removeEventListenerById(self._e_event251);
        __o_rrpgObjs.removeEventListenerById(self._e_event250);
        __o_rrpgObjs.removeEventListenerById(self._e_event249);
        __o_rrpgObjs.removeEventListenerById(self._e_event248);
        __o_rrpgObjs.removeEventListenerById(self._e_event247);
        __o_rrpgObjs.removeEventListenerById(self._e_event246);
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
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

        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.button110 ~= nil then self.button110:destroy(); self.button110 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.rectangle148 ~= nil then self.rectangle148:destroy(); self.rectangle148 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.button115 ~= nil then self.button115:destroy(); self.button115 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.button140 ~= nil then self.button140:destroy(); self.button140 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit431 ~= nil then self.edit431:destroy(); self.edit431 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label331 ~= nil then self.label331:destroy(); self.label331 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit429 ~= nil then self.edit429:destroy(); self.edit429 = nil; end;
        if self.edit442 ~= nil then self.edit442:destroy(); self.edit442 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.button106 ~= nil then self.button106:destroy(); self.button106 = nil; end;
        if self.label332 ~= nil then self.label332:destroy(); self.label332 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.histPop1_1 ~= nil then self.histPop1_1:destroy(); self.histPop1_1 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.label315 ~= nil then self.label315:destroy(); self.label315 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.label306 ~= nil then self.label306:destroy(); self.label306 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.histPop3_1 ~= nil then self.histPop3_1:destroy(); self.histPop3_1 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label317 ~= nil then self.label317:destroy(); self.label317 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit390 ~= nil then self.edit390:destroy(); self.edit390 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.histPop3_2 ~= nil then self.histPop3_2:destroy(); self.histPop3_2 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.button99 ~= nil then self.button99:destroy(); self.button99 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.button153 ~= nil then self.button153:destroy(); self.button153 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.rectangle146 ~= nil then self.rectangle146:destroy(); self.rectangle146 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.button97 ~= nil then self.button97:destroy(); self.button97 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.button102 ~= nil then self.button102:destroy(); self.button102 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.button149 ~= nil then self.button149:destroy(); self.button149 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.button158 ~= nil then self.button158:destroy(); self.button158 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.button134 ~= nil then self.button134:destroy(); self.button134 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.button148 ~= nil then self.button148:destroy(); self.button148 = nil; end;
        if self.rectangle140 ~= nil then self.rectangle140:destroy(); self.rectangle140 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.rectangle147 ~= nil then self.rectangle147:destroy(); self.rectangle147 = nil; end;
        if self.button138 ~= nil then self.button138:destroy(); self.button138 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.dataLink112 ~= nil then self.dataLink112:destroy(); self.dataLink112 = nil; end;
        if self.button152 ~= nil then self.button152:destroy(); self.button152 = nil; end;
        if self.histPop1_4 ~= nil then self.histPop1_4:destroy(); self.histPop1_4 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit449 ~= nil then self.edit449:destroy(); self.edit449 = nil; end;
        if self.button141 ~= nil then self.button141:destroy(); self.button141 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.edit421 ~= nil then self.edit421:destroy(); self.edit421 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.frmACN2 ~= nil then self.frmACN2:destroy(); self.frmACN2 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.popHistorico ~= nil then self.popHistorico:destroy(); self.popHistorico = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.btAegis ~= nil then self.btAegis:destroy(); self.btAegis = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.popFisicos ~= nil then self.popFisicos:destroy(); self.popFisicos = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.button126 ~= nil then self.button126:destroy(); self.button126 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.button139 ~= nil then self.button139:destroy(); self.button139 = nil; end;
        if self.button132 ~= nil then self.button132:destroy(); self.button132 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.button161 ~= nil then self.button161:destroy(); self.button161 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.edit408 ~= nil then self.edit408:destroy(); self.edit408 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.button131 ~= nil then self.button131:destroy(); self.button131 = nil; end;
        if self.button127 ~= nil then self.button127:destroy(); self.button127 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.edit444 ~= nil then self.edit444:destroy(); self.edit444 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit403 ~= nil then self.edit403:destroy(); self.edit403 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.button163 ~= nil then self.button163:destroy(); self.button163 = nil; end;
        if self.label314 ~= nil then self.label314:destroy(); self.label314 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.dataLink118 ~= nil then self.dataLink118:destroy(); self.dataLink118 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.frmACN3 ~= nil then self.frmACN3:destroy(); self.frmACN3 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.edit436 ~= nil then self.edit436:destroy(); self.edit436 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.histPop2_3 ~= nil then self.histPop2_3:destroy(); self.histPop2_3 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.button123 ~= nil then self.button123:destroy(); self.button123 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.button116 ~= nil then self.button116:destroy(); self.button116 = nil; end;
        if self.edit434 ~= nil then self.edit434:destroy(); self.edit434 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.rectangle144 ~= nil then self.rectangle144:destroy(); self.rectangle144 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.histPop3_6 ~= nil then self.histPop3_6:destroy(); self.histPop3_6 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button159 ~= nil then self.button159:destroy(); self.button159 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.edit445 ~= nil then self.edit445:destroy(); self.edit445 = nil; end;
        if self.button151 ~= nil then self.button151:destroy(); self.button151 = nil; end;
        if self.label328 ~= nil then self.label328:destroy(); self.label328 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.edit412 ~= nil then self.edit412:destroy(); self.edit412 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.edit413 ~= nil then self.edit413:destroy(); self.edit413 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.btMentais ~= nil then self.btMentais:destroy(); self.btMentais = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.edit452 ~= nil then self.edit452:destroy(); self.edit452 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.label302 ~= nil then self.label302:destroy(); self.label302 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.popAegis ~= nil then self.popAegis:destroy(); self.popAegis = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.edit441 ~= nil then self.edit441:destroy(); self.edit441 = nil; end;
        if self.edit423 ~= nil then self.edit423:destroy(); self.edit423 = nil; end;
        if self.rectangle143 ~= nil then self.rectangle143:destroy(); self.rectangle143 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.histPop3_4 ~= nil then self.histPop3_4:destroy(); self.histPop3_4 = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.dataLink114 ~= nil then self.dataLink114:destroy(); self.dataLink114 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.button160 ~= nil then self.button160:destroy(); self.button160 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.button111 ~= nil then self.button111:destroy(); self.button111 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.button124 ~= nil then self.button124:destroy(); self.button124 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.edit435 ~= nil then self.edit435:destroy(); self.edit435 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.histPop2_4 ~= nil then self.histPop2_4:destroy(); self.histPop2_4 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.edit424 ~= nil then self.edit424:destroy(); self.edit424 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit415 ~= nil then self.edit415:destroy(); self.edit415 = nil; end;
        if self.histPop1_5 ~= nil then self.histPop1_5:destroy(); self.histPop1_5 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.button154 ~= nil then self.button154:destroy(); self.button154 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit432 ~= nil then self.edit432:destroy(); self.edit432 = nil; end;
        if self.edit438 ~= nil then self.edit438:destroy(); self.edit438 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.label326 ~= nil then self.label326:destroy(); self.label326 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.edit450 ~= nil then self.edit450:destroy(); self.edit450 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit411 ~= nil then self.edit411:destroy(); self.edit411 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.button113 ~= nil then self.button113:destroy(); self.button113 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.edit422 ~= nil then self.edit422:destroy(); self.edit422 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.button119 ~= nil then self.button119:destroy(); self.button119 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit406 ~= nil then self.edit406:destroy(); self.edit406 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.edit455 ~= nil then self.edit455:destroy(); self.edit455 = nil; end;
        if self.edit453 ~= nil then self.edit453:destroy(); self.edit453 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.histPop2_5 ~= nil then self.histPop2_5:destroy(); self.histPop2_5 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.button143 ~= nil then self.button143:destroy(); self.button143 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.button103 ~= nil then self.button103:destroy(); self.button103 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.button144 ~= nil then self.button144:destroy(); self.button144 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.frmACN6 ~= nil then self.frmACN6:destroy(); self.frmACN6 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit405 ~= nil then self.edit405:destroy(); self.edit405 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.button157 ~= nil then self.button157:destroy(); self.button157 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.button156 ~= nil then self.button156:destroy(); self.button156 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.button114 ~= nil then self.button114:destroy(); self.button114 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.label329 ~= nil then self.label329:destroy(); self.label329 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.button150 ~= nil then self.button150:destroy(); self.button150 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.button135 ~= nil then self.button135:destroy(); self.button135 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.button122 ~= nil then self.button122:destroy(); self.button122 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit404 ~= nil then self.edit404:destroy(); self.edit404 = nil; end;
        if self.histPop3_3 ~= nil then self.histPop3_3:destroy(); self.histPop3_3 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.edit446 ~= nil then self.edit446:destroy(); self.edit446 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.edit440 ~= nil then self.edit440:destroy(); self.edit440 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.button121 ~= nil then self.button121:destroy(); self.button121 = nil; end;
        if self.button108 ~= nil then self.button108:destroy(); self.button108 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.dataLink111 ~= nil then self.dataLink111:destroy(); self.dataLink111 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit419 ~= nil then self.edit419:destroy(); self.edit419 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.button118 ~= nil then self.button118:destroy(); self.button118 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.btFisicos ~= nil then self.btFisicos:destroy(); self.btFisicos = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.button162 ~= nil then self.button162:destroy(); self.button162 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.label325 ~= nil then self.label325:destroy(); self.label325 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.dataLink120 ~= nil then self.dataLink120:destroy(); self.dataLink120 = nil; end;
        if self.dataLink113 ~= nil then self.dataLink113:destroy(); self.dataLink113 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.button105 ~= nil then self.button105:destroy(); self.button105 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.label330 ~= nil then self.label330:destroy(); self.label330 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label333 ~= nil then self.label333:destroy(); self.label333 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.button145 ~= nil then self.button145:destroy(); self.button145 = nil; end;
        if self.label304 ~= nil then self.label304:destroy(); self.label304 = nil; end;
        if self.edit439 ~= nil then self.edit439:destroy(); self.edit439 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.button109 ~= nil then self.button109:destroy(); self.button109 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit416 ~= nil then self.edit416:destroy(); self.edit416 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.dataLink117 ~= nil then self.dataLink117:destroy(); self.dataLink117 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.rectangle150 ~= nil then self.rectangle150:destroy(); self.rectangle150 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.edit454 ~= nil then self.edit454:destroy(); self.edit454 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.dataLink123 ~= nil then self.dataLink123:destroy(); self.dataLink123 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.histPop2_1 ~= nil then self.histPop2_1:destroy(); self.histPop2_1 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.edit451 ~= nil then self.edit451:destroy(); self.edit451 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit402 ~= nil then self.edit402:destroy(); self.edit402 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.button128 ~= nil then self.button128:destroy(); self.button128 = nil; end;
        if self.button120 ~= nil then self.button120:destroy(); self.button120 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.button155 ~= nil then self.button155:destroy(); self.button155 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.dataLink116 ~= nil then self.dataLink116:destroy(); self.dataLink116 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.edit428 ~= nil then self.edit428:destroy(); self.edit428 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.frmACN5 ~= nil then self.frmACN5:destroy(); self.frmACN5 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.button104 ~= nil then self.button104:destroy(); self.button104 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.edit426 ~= nil then self.edit426:destroy(); self.edit426 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.button125 ~= nil then self.button125:destroy(); self.button125 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.popOther ~= nil then self.popOther:destroy(); self.popOther = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.rectangle151 ~= nil then self.rectangle151:destroy(); self.rectangle151 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.histPop1_3 ~= nil then self.histPop1_3:destroy(); self.histPop1_3 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button142 ~= nil then self.button142:destroy(); self.button142 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.histPop1_2 ~= nil then self.histPop1_2:destroy(); self.histPop1_2 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit430 ~= nil then self.edit430:destroy(); self.edit430 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.edit456 ~= nil then self.edit456:destroy(); self.edit456 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.histPop3_5 ~= nil then self.histPop3_5:destroy(); self.histPop3_5 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.rectangle149 ~= nil then self.rectangle149:destroy(); self.rectangle149 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.button146 ~= nil then self.button146:destroy(); self.button146 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.button133 ~= nil then self.button133:destroy(); self.button133 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.rclListaOutros ~= nil then self.rclListaOutros:destroy(); self.rclListaOutros = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.histPop2_2 ~= nil then self.histPop2_2:destroy(); self.histPop2_2 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.button107 ~= nil then self.button107:destroy(); self.button107 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.edit410 ~= nil then self.edit410:destroy(); self.edit410 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.rectangle145 ~= nil then self.rectangle145:destroy(); self.rectangle145 = nil; end;
        if self.edit420 ~= nil then self.edit420:destroy(); self.edit420 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.button98 ~= nil then self.button98:destroy(); self.button98 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.label313 ~= nil then self.label313:destroy(); self.label313 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.dataLink121 ~= nil then self.dataLink121:destroy(); self.dataLink121 = nil; end;
        if self.button147 ~= nil then self.button147:destroy(); self.button147 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.edit409 ~= nil then self.edit409:destroy(); self.edit409 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.dataLink119 ~= nil then self.dataLink119:destroy(); self.dataLink119 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.button100 ~= nil then self.button100:destroy(); self.button100 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit418 ~= nil then self.edit418:destroy(); self.edit418 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button112 ~= nil then self.button112:destroy(); self.button112 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.button129 ~= nil then self.button129:destroy(); self.button129 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.frmACN4 ~= nil then self.frmACN4:destroy(); self.frmACN4 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.dataLink110 ~= nil then self.dataLink110:destroy(); self.dataLink110 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.frmACN1 ~= nil then self.frmACN1:destroy(); self.frmACN1 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.button137 ~= nil then self.button137:destroy(); self.button137 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button136 ~= nil then self.button136:destroy(); self.button136 = nil; end;
        if self.edit447 ~= nil then self.edit447:destroy(); self.edit447 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.dataLink122 ~= nil then self.dataLink122:destroy(); self.dataLink122 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.button117 ~= nil then self.button117:destroy(); self.button117 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.rectangle141 ~= nil then self.rectangle141:destroy(); self.rectangle141 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.dataLink115 ~= nil then self.dataLink115:destroy(); self.dataLink115 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.histPop1_6 ~= nil then self.histPop1_6:destroy(); self.histPop1_6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.button130 ~= nil then self.button130:destroy(); self.button130 = nil; end;
        if self.edit417 ~= nil then self.edit417:destroy(); self.edit417 = nil; end;
        if self.rectangle142 ~= nil then self.rectangle142:destroy(); self.rectangle142 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.popMentais ~= nil then self.popMentais:destroy(); self.popMentais = nil; end;
        if self.edit448 ~= nil then self.edit448:destroy(); self.edit448 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.edit437 ~= nil then self.edit437:destroy(); self.edit437 = nil; end;
        if self.edit443 ~= nil then self.edit443:destroy(); self.edit443 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.edit433 ~= nil then self.edit433:destroy(); self.edit433 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.frmACN5_2 ~= nil then self.frmACN5_2:destroy(); self.frmACN5_2 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.button101 ~= nil then self.button101:destroy(); self.button101 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit425 ~= nil then self.edit425:destroy(); self.edit425 = nil; end;
        if self.edit427 ~= nil then self.edit427:destroy(); self.edit427 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.edit414 ~= nil then self.edit414:destroy(); self.edit414 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.histPop2_6 ~= nil then self.histPop2_6:destroy(); self.histPop2_6 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit407 ~= nil then self.edit407:destroy(); self.edit407 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaACN()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaACN();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaACN = {
    newEditor = newfrmFichaACN, 
    new = newfrmFichaACN, 
    name = "frmFichaACN", 
    dataType = "Ambesek.Nefertyne.FichaACN", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha ACN", 
    description=""};

frmFichaACN = _frmFichaACN;
Firecast.registrarForm(_frmFichaACN);
Firecast.registrarDataType(_frmFichaACN);

return _frmFichaACN;
