require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_esferas()
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
    obj:setName("esferas");
    obj:setHeight(25);
    obj:setAlign("top");
    obj:setMargins({bottom=10});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.nomeBut = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut:setParent(obj.layout1);
    obj.nomeBut:setName("nomeBut");
    obj.nomeBut:setText("𝐢");
    obj.nomeBut:setWidth(22);
    obj.nomeBut:setHeight(22);
    obj.nomeBut:setAlign("left");
    obj.nomeBut:setMargins({top=1, bottom=1, right=5});
    obj.nomeBut:setFontColor("#272727");

    obj.nomeButB = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeButB:setParent(obj.layout1);
    obj.nomeButB:setName("nomeButB");
    obj.nomeButB:setText("𝐢");
    obj.nomeButB:setWidth(22);
    obj.nomeButB:setHeight(22);
    obj.nomeButB:setAlign("left");
    obj.nomeButB:setMargins({top=1, bottom=1, right=5});
    obj.nomeButB:setFontColor("white");
    obj.nomeButB:setVisible(false);

    obj.popUp_ = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_:setParent(obj.layout1);
    obj.popUp_:setName("popUp_");
    obj.popUp_:setWidth(630);
    obj.popUp_:setHeight(445);
    obj.popUp_:setBackOpacity(0);
    obj.popUp_:setDrawContainer(false);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popUp_);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0e0e0e");
    obj.rectangle1:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0e0e0e");
    obj.rectangle2:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle2:setXradius(8);
    obj.rectangle2:setYradius(8);
    obj.rectangle2:setStrokeColor("#272727");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setField("fldEsferas");
    obj.label1:setHeight(35);
    obj.label1:setFontSize(30);
    obj.label1:setAlign("top");
    obj.label1:setMargins({top=5, left=10, right=80});
    obj.label1:setName("label1");
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setTextTrimming("character");
    obj.label1:setFontFamily("Constantia");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setField("fldEsfTipo");
    lfm_setPropAsString(obj.label2, "anchors",  "right top");
    obj.label2:setRight(0);
    obj.label2:setTop(25);
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setTextTrimming("character");
    obj.label2:setFontFamily("Constantia");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle2);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({left=10, right=10, top=10});
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#424242");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle2);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(95);
    obj.layout2:setMargins({top=5});
    obj.layout2:setPadding({left=10, right=10});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setWidth(310);
    obj.layout3:setAlign("left");
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(35);
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setAlign("left");
    obj.label3:setWidth(70);
    obj.label3:setText("Custo: ");
    obj.label3:setName("label3");
    obj.label3:setFontSize(14);
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setTextTrimming("character");
    obj.label3:setFontFamily("Constantia");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setAlign("client");
    obj.edit1:setField("fldCusto");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout4);
    obj.dataLink1:setField("fldCusto");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(35);
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setAlign("left");
    obj.label4:setWidth(70);
    obj.label4:setText("Duração: ");
    obj.label4:setName("label4");
    obj.label4:setFontSize(14);
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setTextTrimming("character");
    obj.label4:setFontFamily("Constantia");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setAlign("client");
    obj.edit2:setField("fldDuracao");
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(14);
    obj.edit2:setFontColor("#cdcdcd");
    obj.edit2:setTextTrimming("character");
    obj.edit2:setFontFamily("Constantia");
    obj.edit2:setTransparent(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout5);
    obj.dataLink2:setField("fldDuracao");
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setName("dataLink2");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(35);
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setAlign("left");
    obj.label5:setWidth(70);
    obj.label5:setText("Alvo: ");
    obj.label5:setName("label5");
    obj.label5:setFontSize(14);
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setTextTrimming("character");
    obj.label5:setFontFamily("Constantia");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setAlign("client");
    obj.edit3:setField("fldAlvo");
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#cdcdcd");
    obj.edit3:setTextTrimming("character");
    obj.edit3:setFontFamily("Constantia");
    obj.edit3:setTransparent(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout6);
    obj.dataLink3:setField("fldAlvo");
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setName("dataLink3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("red");
    obj.rectangle3:setName("rectangle3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setWidth(310);
    obj.layout7:setAlign("left");
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(35);
    obj.layout8:setName("layout8");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout8);
    obj.label6:setAlign("left");
    obj.label6:setWidth(70);
    obj.label6:setText("Alcance: ");
    obj.label6:setName("label6");
    obj.label6:setFontSize(14);
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setTextTrimming("character");
    obj.label6:setFontFamily("Constantia");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setAlign("client");
    obj.edit4:setField("fldAlcance");
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(14);
    obj.edit4:setFontColor("#cdcdcd");
    obj.edit4:setTextTrimming("character");
    obj.edit4:setFontFamily("Constantia");
    obj.edit4:setTransparent(true);

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout8);
    obj.dataLink4:setField("fldAlcance");
    obj.dataLink4:setDefaultValue("—");
    obj.dataLink4:setName("dataLink4");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(35);
    obj.layout9:setName("layout9");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout9);
    obj.label7:setAlign("left");
    obj.label7:setWidth(70);
    obj.label7:setText("Ação: ");
    obj.label7:setName("label7");
    obj.label7:setFontSize(14);
    obj.label7:setFontColor("white");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setTextTrimming("character");
    obj.label7:setFontFamily("Constantia");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout9);
    obj.edit5:setAlign("client");
    obj.edit5:setField("fldAcao");
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#cdcdcd");
    obj.edit5:setTextTrimming("character");
    obj.edit5:setFontFamily("Constantia");
    obj.edit5:setTransparent(true);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout9);
    obj.dataLink5:setField("fldAcao");
    obj.dataLink5:setDefaultValue("—");
    obj.dataLink5:setName("dataLink5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(35);
    obj.layout10:setName("layout10");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout10);
    obj.label8:setAlign("left");
    obj.label8:setWidth(70);
    obj.label8:setText("Conflito: ");
    obj.label8:setName("label8");
    obj.label8:setFontSize(14);
    obj.label8:setFontColor("white");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setTextTrimming("character");
    obj.label8:setFontFamily("Constantia");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setAlign("client");
    obj.edit6:setField("fldConflito");
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#cdcdcd");
    obj.edit6:setTextTrimming("character");
    obj.edit6:setFontFamily("Constantia");
    obj.edit6:setTransparent(true);

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout10);
    obj.dataLink6:setField("fldConflito");
    obj.dataLink6:setDefaultValue("—");
    obj.dataLink6:setName("dataLink6");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout7);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("red");
    obj.rectangle4:setName("rectangle4");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.rectangle2);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setMargins({left=10, right=10, top=10});
    obj.horzLine2:setName("horzLine2");
    obj.horzLine2:setStrokeColor("#424242");

    obj.nomeEsf = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeEsf:setParent(obj.rectangle2);
    obj.nomeEsf:setMargins({top=10, left=10, right=10, bottom=10});
    obj.nomeEsf:setAlign("client");
    obj.nomeEsf:setTransparent(true);
    obj.nomeEsf:setFontColor("#cdcdcd");
    obj.nomeEsf:setField("fld");
    obj.nomeEsf:setName("nomeEsf");
    obj.nomeEsf:setFontFamily("Constantia");
    obj.nomeEsf:setFontSize(15);

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle2);
    obj.dataLink7:setField("fld");
    obj.dataLink7:setDefaultValue("Descrição do Poder");
    obj.dataLink7:setName("dataLink7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(201);
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setField("fldEsferas");
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#cdcdcd");
    obj.edit7:setTextTrimming("character");
    obj.edit7:setFontFamily("Constantia");
    obj.edit7:setTransparent(true);

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout1);
    obj.dataLink8:setField("fldEsferas");
    obj.dataLink8:setDefaultValue("—");
    obj.dataLink8:setName("dataLink8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(105);
    obj.edit8:setMargins({right=5});
    lfm_setPropAsString(obj.edit8, "fontStyle",  "italic");
    obj.edit8:setField("fldEsfCategoria");
    obj.edit8:setName("edit8");
    obj.edit8:setFontSize(14);
    obj.edit8:setFontColor("#cdcdcd");
    obj.edit8:setTextTrimming("character");
    obj.edit8:setFontFamily("Constantia");
    obj.edit8:setTransparent(true);

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout1);
    obj.dataLink9:setField("fldEsfCategoria");
    obj.dataLink9:setDefaultValue("Esfera");
    obj.dataLink9:setName("dataLink9");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setField("fldEsfTipo");
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setItems({'Esfera', 'Poder'});
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontSize(14);
    obj.comboBox1:setFontColor("#cdcdcd");
    obj.comboBox1:setTextTrimming("character");
    obj.comboBox1:setFontFamily("Constantia");
    obj.comboBox1:setTransparent(true);
    lfm_setPropAsString(obj.comboBox1, "fontStyle",  "italic");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("🞭");
    obj.button1:setWidth(22);
    obj.button1:setHeight(22);
    obj.button1:setAlign("right");
    obj.button1:setMargins({top=1, bottom=1, right=5});
    obj.button1:setHint("Apagar Herança");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeBut:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("mouse", self.nomeTru_);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event1 = obj.nomeButB:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("mouse", self.nomeTru_);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event2 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld == nil or sheet.fld == "Descrição do Poder") then
            										self.nomeBut.visible = true;
            										self.nomeButB.visible = false;
            									else
            										self.nomeButB.visible = true;
            										self.nomeBut.visible = false;
            									end;
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.nomeEsf ~= nil then self.nomeEsf:destroy(); self.nomeEsf = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.nomeBut ~= nil then self.nomeBut:destroy(); self.nomeBut = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.popUp_ ~= nil then self.popUp_:destroy(); self.popUp_ = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.nomeButB ~= nil then self.nomeButB:destroy(); self.nomeButB = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newesferas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_esferas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _esferas = {
    newEditor = newesferas, 
    new = newesferas, 
    name = "esferas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

esferas = _esferas;
Firecast.registrarForm(_esferas);

return _esferas;
