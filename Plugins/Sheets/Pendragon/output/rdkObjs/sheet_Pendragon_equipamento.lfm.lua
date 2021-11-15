require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmEquipamentos()
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
    obj:setName("frmEquipamentos");
    obj:setAlign("client");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setPadding({top = 10});
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("☙ EQUIPAMENTOS");
    obj.label1:setWidth(200);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("#0080ff");
    obj.label1:setFontFamily("Palatino Linotype");
    obj.label1:setFontSize(20);
    obj.label1:setName("label1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(450);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setHeight(2);
    obj.rectangle2:setWidth(535);
    obj.rectangle2:setTop(25);
    obj.rectangle2:setColor("#0080ff");
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setMargins({top = 10});
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setName("rectangle3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle3);
    obj.label2:setAlign("left");
    obj.label2:setWidth(230);
    obj.label2:setText("ITEM");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("#cdcdcd");
    obj.label2:setFontFamily("Palatino Linotype");
    obj.label2:setFontSize(14);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle3);
    obj.label3:setAlign("left");
    obj.label3:setWidth(50);
    obj.label3:setText("QNT.");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("#cdcdcd");
    obj.label3:setFontFamily("Palatino Linotype");
    obj.label3:setFontSize(14);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle3);
    obj.label4:setAlign("left");
    obj.label4:setWidth(255);
    obj.label4:setText("STATUS");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("#cdcdcd");
    obj.label4:setFontFamily("Palatino Linotype");
    obj.label4:setFontSize(14);
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle3);
    obj.label5:setAlign("left");
    obj.label5:setWidth(80);
    obj.label5:setText("VALOR");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("#cdcdcd");
    obj.label5:setFontFamily("Palatino Linotype");
    obj.label5:setFontSize(14);
    obj.label5:setName("label5");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(650);
    obj.layout4:setName("layout4");

    obj.rclEquips = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquips:setParent(obj.layout4);
    obj.rclEquips:setAlign("top");
    obj.rclEquips:setMinQt(4);
    obj.rclEquips:setLayout("vertical");
    obj.rclEquips:setName("rclEquips");
    obj.rclEquips:setField("fldEquips");
    obj.rclEquips:setTemplateForm("equips");
    obj.rclEquips:setAutoHeight(true);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("top");
    obj.layout5:setName("layout5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout5);
    obj.button1:setLeft(625);
    obj.button1:setHeight(25);
    obj.button1:setTop(1);
    obj.button1:setText("🞦");
    obj.button1:setWidth(25);
    obj.button1:setHint("Novo Equipamento");
    obj.button1:setName("button1");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setAlign("top");
    obj.layout6:setName("layout6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setAlign("left");
    obj.label6:setText("☙ ANIMAIS");
    obj.label6:setWidth(125);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontColor("#0080ff");
    obj.label6:setFontFamily("Palatino Linotype");
    obj.label6:setFontSize(20);
    obj.label6:setName("label6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(525);
    obj.layout7:setName("layout7");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout7);
    obj.rectangle4:setHeight(2);
    obj.rectangle4:setWidth(535);
    obj.rectangle4:setTop(25);
    obj.rectangle4:setColor("#0080ff");
    obj.rectangle4:setName("rectangle4");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout4);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setMargins({top = 10});
    obj.layout8:setName("layout8");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout8);
    obj.rectangle5:setName("rectangle5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle5);
    obj.label7:setAlign("left");
    obj.label7:setWidth(230);
    obj.label7:setText("ANIMAL");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setFontColor("#cdcdcd");
    obj.label7:setFontFamily("Palatino Linotype");
    obj.label7:setFontSize(14);
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle5);
    obj.label8:setAlign("left");
    obj.label8:setWidth(50);
    obj.label8:setText("QNT.");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setFontColor("#cdcdcd");
    obj.label8:setFontFamily("Palatino Linotype");
    obj.label8:setFontSize(14);
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle5);
    obj.label9:setAlign("left");
    obj.label9:setWidth(255);
    obj.label9:setText("STATUS");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setFontColor("#cdcdcd");
    obj.label9:setFontFamily("Palatino Linotype");
    obj.label9:setFontSize(14);
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle5);
    obj.label10:setAlign("left");
    obj.label10:setWidth(80);
    obj.label10:setText("VALOR");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setFontColor("#cdcdcd");
    obj.label10:setFontFamily("Palatino Linotype");
    obj.label10:setFontSize(14);
    obj.label10:setName("label10");

    obj.rclHorses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHorses:setParent(obj.layout4);
    obj.rclHorses:setAlign("top");
    obj.rclHorses:setMinQt(4);
    obj.rclHorses:setLayout("vertical");
    obj.rclHorses:setName("rclHorses");
    obj.rclHorses:setField("fldHorses");
    obj.rclHorses:setTemplateForm("equips");
    obj.rclHorses:setAutoHeight(true);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setAlign("top");
    obj.layout9:setName("layout9");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout9);
    obj.button2:setLeft(625);
    obj.button2:setHeight(25);
    obj.button2:setTop(1);
    obj.button2:setText("🞦");
    obj.button2:setWidth(25);
    obj.button2:setHint("Novo Animal");
    obj.button2:setName("button2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout4);
    obj.layout10:setAlign("top");
    obj.layout10:setName("layout10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout10);
    obj.label11:setMargins({left=40});
    obj.label11:setAlign("left");
    obj.label11:setWidth(60);
    obj.label11:setText("LIBRAS:");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setFontColor("#cdcdcd");
    obj.label11:setFontFamily("Palatino Linotype");
    obj.label11:setFontSize(14);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setAlign("left");
    obj.label12:setWidth(10);
    obj.label12:setText("£");
    obj.label12:setFontColor("white");
    obj.label12:setFontFamily("Cambria");
    obj.label12:setFontSize(14);
    obj.label12:setName("label12");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout10);
    obj.edit1:setField("fldLibras");
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(30);
    obj.edit1:setName("edit1");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout10);
    obj.label13:setMargins({left=50});
    obj.label13:setAlign("left");
    obj.label13:setWidth(90);
    obj.label13:setText("DENÁRIOS:");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setFontColor("#cdcdcd");
    obj.label13:setFontFamily("Palatino Linotype");
    obj.label13:setFontSize(14);
    obj.label13:setName("label13");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout10);
    obj.edit2:setField("fldDenarios");
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(30);
    obj.edit2:setName("edit2");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout10);
    obj.label14:setAlign("left");
    obj.label14:setWidth(12);
    obj.label14:setText("d.");
    obj.label14:setFontColor("white");
    obj.label14:setFontFamily("Cambria");
    obj.label14:setFontSize(14);
    obj.label14:setName("label14");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout10);
    obj.dataLink1:setFields({'fldLibras', 'fldDenarios'});
    obj.dataLink1:setDefaultValues({'—', '—'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.rclEquips:addEventListener("onItemRemoved",
        function (_, node, form)
            self.frmEquipamentos:needRepaint();
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclEquips:append(); self.frmEquipamentos:needRepaint();
        end, obj);

    obj._e_event2 = obj.rclHorses:addEventListener("onItemRemoved",
        function (_, node, form)
            self.frmEquipamentos:needRepaint();
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclHorses:append(); self.frmEquipamentos:needRepaint();
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rclHorses ~= nil then self.rclHorses:destroy(); self.rclHorses = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rclEquips ~= nil then self.rclEquips:destroy(); self.rclEquips = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmEquipamentos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmEquipamentos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmEquipamentos = {
    newEditor = newfrmEquipamentos, 
    new = newfrmEquipamentos, 
    name = "frmEquipamentos", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmEquipamentos = _frmEquipamentos;
Firecast.registrarForm(_frmEquipamentos);

return _frmEquipamentos;
