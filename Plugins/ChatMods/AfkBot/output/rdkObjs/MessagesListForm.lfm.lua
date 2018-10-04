require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMessageItem()
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
    obj:setName("frmMessageItem");
    obj:setWidth(250);
    obj:setHeight(240);
    obj:setMargins({top=1});

    obj.add = gui.fromHandle(_obj_newObject("button"));
    obj.add:setParent(obj);
    obj.add:setWidth(250);
    obj.add:setHeight(240);
    obj.add:setFontSize(25);
    obj.add:setText("NOVA MENSAGEM");
    obj.add:setName("add");
    obj.add:setVisible(true);

    obj.message = gui.fromHandle(_obj_newObject("rectangle"));
    obj.message:setParent(obj);
    obj.message:setAlign("client");
    obj.message:setColor("#212121");
    obj.message:setName("message");
    obj.message:setVisible(false);

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.message);
    obj.checkBox1:setField("d1");
    obj.checkBox1:setLeft(10);
    obj.checkBox1:setTop(10);
    obj.checkBox1:setText("DOM");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.message);
    obj.checkBox2:setField("d2");
    obj.checkBox2:setLeft(70);
    obj.checkBox2:setTop(10);
    obj.checkBox2:setText("SEG");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.message);
    obj.checkBox3:setField("d3");
    obj.checkBox3:setLeft(130);
    obj.checkBox3:setTop(10);
    obj.checkBox3:setText("TER");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.message);
    obj.checkBox4:setField("d4");
    obj.checkBox4:setLeft(190);
    obj.checkBox4:setTop(10);
    obj.checkBox4:setText("QUA");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.message);
    obj.checkBox5:setField("d5");
    obj.checkBox5:setLeft(40);
    obj.checkBox5:setTop(35);
    obj.checkBox5:setText("QUI");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.message);
    obj.checkBox6:setField("d6");
    obj.checkBox6:setLeft(100);
    obj.checkBox6:setTop(35);
    obj.checkBox6:setText("SEX");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.message);
    obj.checkBox7:setField("d7");
    obj.checkBox7:setLeft(160);
    obj.checkBox7:setTop(35);
    obj.checkBox7:setText("SAB");
    obj.checkBox7:setName("checkBox7");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.message);
    obj.horzLine1:setLeft(10);
    obj.horzLine1:setTop(60);
    obj.horzLine1:setWidth(230);
    obj.horzLine1:setName("horzLine1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.message);
    obj.label1:setLeft(10);
    obj.label1:setTop(70);
    obj.label1:setWidth(90);
    obj.label1:setHeight(25);
    obj.label1:setText("Inicio");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.message);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(70);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("hourStart");
    obj.edit1:setType("number");
    obj.edit1:setMin(0);
    obj.edit1:setMax(23);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.message);
    obj.edit2:setLeft(160);
    obj.edit2:setTop(70);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("minuteStart");
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(59);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.message);
    obj.label2:setLeft(10);
    obj.label2:setTop(95);
    obj.label2:setWidth(90);
    obj.label2:setHeight(25);
    obj.label2:setText("Fim");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.message);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(95);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("hourEnd");
    obj.edit3:setType("number");
    obj.edit3:setMin(0);
    obj.edit3:setMax(23);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.message);
    obj.edit4:setLeft(160);
    obj.edit4:setTop(95);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("minuteEnd");
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setMax(59);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.horzLine2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.message);
    obj.horzLine2:setLeft(10);
    obj.horzLine2:setTop(130);
    obj.horzLine2:setWidth(230);
    obj.horzLine2:setName("horzLine2");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.message);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(135);
    obj.textEditor1:setWidth(205);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("message");
    obj.textEditor1:setName("textEditor1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.message);
    obj.button1:setLeft(215);
    obj.button1:setTop(135);
    obj.button1:setWidth(25);
    obj.button1:setHeight(100);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("enabled");
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.add:addEventListener("onClick",
        function (self)
            sheet.enabled = true;
            			local node = ndb.getParent(ndb.getParent(sheet));
            			node.addMessage = 1;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa mensagem?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
            						end;
            				end);
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.enabled==true then
            				self.message.visible = true;
            				self.add.visible = false;
            			else
            				self.message.visible = false;
            				self.add.visible = true;
            			end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.message ~= nil then self.message:destroy(); self.message = nil; end;
        if self.add ~= nil then self.add:destroy(); self.add = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMessageItem = {
    newEditor = newfrmMessageItem, 
    new = newfrmMessageItem, 
    name = "frmMessageItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMessageItem = _frmMessageItem;
rrpg.registrarForm(_frmMessageItem);

return _frmMessageItem;
