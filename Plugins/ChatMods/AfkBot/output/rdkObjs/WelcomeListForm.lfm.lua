require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmWelcomeItem()
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
    obj:setName("frmWelcomeItem");
    obj:setWidth(250);
    obj:setHeight(75);
    obj:setMargins({top=1});

    obj.add = gui.fromHandle(_obj_newObject("button"));
    obj.add:setParent(obj);
    obj.add:setWidth(250);
    obj.add:setHeight(75);
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

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.message);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(140);
    obj.edit1:setHeight(20);
    obj.edit1:setField("login");
    obj.edit1:setFontSize(11);
    obj.edit1:setName("edit1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.message);
    obj.checkBox1:setField("permanent");
    obj.checkBox1:setLeft(145);
    obj.checkBox1:setTop(5);
    obj.checkBox1:setWidth(100);
    obj.checkBox1:setFontSize(11);
    obj.checkBox1:setText("Permanente");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.message);
    obj.button1:setLeft(225);
    obj.button1:setTop(5);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.message);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(50);
    obj.textEditor1:setField("message");
    obj.textEditor1:setName("textEditor1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("login");
    obj.dataLink1:setDefaultValue("login");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("message");
    obj.dataLink2:setDefaultValue("Mensagem.");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("enabled");
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.add:addEventListener("onClick",
        function (self)
            sheet.enabled = true;
            			local node = ndb.getParent(ndb.getParent(sheet));
            			node.addWelcome = 1;
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

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
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
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.message ~= nil then self.message:destroy(); self.message = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.add ~= nil then self.add:destroy(); self.add = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmWelcomeItem = {
    newEditor = newfrmWelcomeItem, 
    new = newfrmWelcomeItem, 
    name = "frmWelcomeItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmWelcomeItem = _frmWelcomeItem;
rrpg.registrarForm(_frmWelcomeItem);

return _frmWelcomeItem;
