require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_truques()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

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
    obj:setName("truques");
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
    obj.popUp_:setHeight(350);
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
    obj.label1:setField("fldTruques");
    obj.label1:setHeight(35);
    obj.label1:setFontSize(30);
    obj.label1:setAlign("top");
    obj.label1:setMargins({top=5, left=10, right=195});
    obj.label1:setName("label1");
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setTextTrimming("character");
    obj.label1:setFontFamily("Constantia");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setField("fldGrau");
    lfm_setPropAsString(obj.label2, "anchors", "right top");
    obj.label2:setRight(0);
    obj.label2:setTop(25);
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setTextTrimming("character");
    obj.label2:setFontFamily("Constantia");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle2);
    obj.comboBox1:setField("fldLegado");
    lfm_setPropAsString(obj.comboBox1, "anchors", "right top");
    obj.comboBox1:setRight(-60);
    obj.comboBox1:setTop(23);
    obj.comboBox1:setItems({'Livre', 'Amante', 'Caçador', 'Criador', 'Curandeiro', 'Guerreiro', 'Juiz', 'Líder', 'Mensageiro', 'Mentiroso', 'Protetor', 'Sábio'});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontSize(14);
    obj.comboBox1:setFontColor("#cdcdcd");
    obj.comboBox1:setTextTrimming("character");
    obj.comboBox1:setFontFamily("Constantia");
    obj.comboBox1:setTransparent(true);
    lfm_setPropAsString(obj.comboBox1, "fontStyle", "italic");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle2);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({left=10, right=10, top=10});
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#424242");

    obj.nomeTru = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeTru:setParent(obj.rectangle2);
    obj.nomeTru:setMargins({top=10, left=10, right=10, bottom=10});
    obj.nomeTru:setAlign("client");
    obj.nomeTru:setTransparent(true);
    obj.nomeTru:setFontColor("#cdcdcd");
    obj.nomeTru:setField("fld");
    obj.nomeTru:setName("nomeTru");
    obj.nomeTru:setFontFamily("Constantia");
    obj.nomeTru:setFontSize(15);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setField("fld");
    obj.dataLink1:setDefaultValue("Descrição do Truque");
    obj.dataLink1:setName("dataLink1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(201);
    obj.edit1:setField("fldTruques");
    lfm_setPropAsString(obj.edit1, "fontStyle", "bold");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("fldTruques");
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setName("dataLink2");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout1);
    obj.comboBox2:setField("fldLegado");
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setItems({'Livre', 'Amante', 'Caçador', 'Criador', 'Curandeiro', 'Guerreiro', 'Juiz', 'Líder', 'Mensageiro', 'Mentiroso', 'Protetor', 'Sábio'});
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setFontSize(14);
    obj.comboBox2:setFontColor("#cdcdcd");
    obj.comboBox2:setTextTrimming("character");
    obj.comboBox2:setFontFamily("Constantia");
    obj.comboBox2:setTransparent(true);
    lfm_setPropAsString(obj.comboBox2, "fontStyle", "italic");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout1);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setWidth(70);
    obj.comboBox3:setField("fldGrau");
    obj.comboBox3:setItems({'Heróico', 'Imortal'});
    obj.comboBox3:setName("comboBox3");
    obj.comboBox3:setFontSize(14);
    obj.comboBox3:setFontColor("#cdcdcd");
    obj.comboBox3:setTextTrimming("character");
    obj.comboBox3:setFontFamily("Constantia");
    obj.comboBox3:setTransparent(true);
    lfm_setPropAsString(obj.comboBox3, "fontStyle", "italic");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("🞭");
    obj.button1:setWidth(22);
    obj.button1:setHeight(22);
    obj.button1:setAlign("right");
    obj.button1:setMargins({top=1, bottom=1, right=5});
    obj.button1:setHint("Apagar Truque");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeBut:addEventListener("onClick",
        function (event)
            local pop = self:findControlByName("popUp_");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("mouse", self.nomeTru_);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end);

    obj._e_event1 = obj.nomeButB:addEventListener("onClick",
        function (event)
            local pop = self:findControlByName("popUp_");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("mouse", self.nomeTru_);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld == nil or sheet.fld == "Descrição do Truque") then
            										self.nomeBut.visible = true;
            										self.nomeButB.visible = false;
            									else
            										self.nomeButB.visible = true;
            										self.nomeBut.visible = false;
            									end;
        end);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

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

        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.nomeTru ~= nil then self.nomeTru:destroy(); self.nomeTru = nil; end;
        if self.popUp_ ~= nil then self.popUp_:destroy(); self.popUp_ = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.nomeBut ~= nil then self.nomeBut:destroy(); self.nomeBut = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.nomeButB ~= nil then self.nomeButB:destroy(); self.nomeButB = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtruques()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_truques();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _truques = {
    newEditor = newtruques, 
    new = newtruques, 
    name = "truques", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

truques = _truques;
Firecast.registrarForm(_truques);

return _truques;
