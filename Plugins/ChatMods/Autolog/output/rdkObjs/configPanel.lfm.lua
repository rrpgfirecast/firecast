require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newautologConfigPanel()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("autologConfigPanel");
    obj:setFormType("undefined");
    obj:setDataType("br.com.rrpg.Autolog");
    obj:setTitle("Autolog");
    obj:setWidth(290);
    obj:setHeight(245);


	-- nome da mesa a qual a janela se refere
	mesa = nil;
	


    obj.enableCheckBox = gui.fromHandle(_obj_newObject("checkBox"));
    obj.enableCheckBox:setParent(obj);
    obj.enableCheckBox:setName("enableCheckBox");
    obj.enableCheckBox:setLeft(10);
    obj.enableCheckBox:setTop(10);
    obj.enableCheckBox:setText("Habilitar Autolog");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setLeft(10);
    obj.horzLine1:setTop(40);
    obj.horzLine1:setWidth(270);
    obj.horzLine1:setName("horzLine1");

    obj.useLoginForPvtCheckBox = gui.fromHandle(_obj_newObject("checkBox"));
    obj.useLoginForPvtCheckBox:setParent(obj);
    obj.useLoginForPvtCheckBox:setName("useLoginForPvtCheckBox");
    obj.useLoginForPvtCheckBox:setLeft(10);
    obj.useLoginForPvtCheckBox:setTop(55);
    obj.useLoginForPvtCheckBox:setWidth(280);
    obj.useLoginForPvtCheckBox:setText("Usar login como nome para logs de PVT");

    obj.horzLine2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj);
    obj.horzLine2:setLeft(10);
    obj.horzLine2:setTop(85);
    obj.horzLine2:setWidth(270);
    obj.horzLine2:setName("horzLine2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(10);
    obj.label1:setTop(100);
    obj.label1:setWidth(200);
    obj.label1:setText("Copiar Log para o Clipboard:");
    obj.label1:setName("label1");

    obj.readLogButton = gui.fromHandle(_obj_newObject("button"));
    obj.readLogButton:setParent(obj);
    obj.readLogButton:setName("readLogButton");
    obj.readLogButton:setLeft(200);
    obj.readLogButton:setTop(100);
    obj.readLogButton:setText("Copiar");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(10);
    obj.label2:setTop(130);
    obj.label2:setWidth(200);
    obj.label2:setText("Exportar Log:");
    obj.label2:setName("label2");

    obj.exportLogButton = gui.fromHandle(_obj_newObject("button"));
    obj.exportLogButton:setParent(obj);
    obj.exportLogButton:setName("exportLogButton");
    obj.exportLogButton:setLeft(200);
    obj.exportLogButton:setTop(130);
    obj.exportLogButton:setText("Exportar");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(10);
    obj.label3:setTop(160);
    obj.label3:setText("Apagar Log:");
    obj.label3:setName("label3");

    obj.clearLogButton = gui.fromHandle(_obj_newObject("button"));
    obj.clearLogButton:setParent(obj);
    obj.clearLogButton:setName("clearLogButton");
    obj.clearLogButton:setLeft(200);
    obj.clearLogButton:setTop(160);
    obj.clearLogButton:setText("Apagar");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(10);
    obj.label4:setTop(190);
    obj.label4:setWidth(280);
    obj.label4:setText("Enviar últimas linhas do log para a mesa:");
    obj.label4:setName("label4");

    obj.linesToSendField = gui.fromHandle(_obj_newObject("edit"));
    obj.linesToSendField:setParent(obj);
    obj.linesToSendField:setName("linesToSendField");
    obj.linesToSendField:setLeft(10);
    obj.linesToSendField:setTop(211);
    obj.linesToSendField:setWidth(30);
    obj.linesToSendField:setHeight(20);
    obj.linesToSendField:setType("number");
    obj.linesToSendField:setKeyboardType("numberPad");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(45);
    obj.label5:setTop(211);
    obj.label5:setText("linhas");
    obj.label5:setName("label5");

    obj.sendLinesButton = gui.fromHandle(_obj_newObject("button"));
    obj.sendLinesButton:setParent(obj);
    obj.sendLinesButton:setName("sendLinesButton");
    obj.sendLinesButton:setLeft(200);
    obj.sendLinesButton:setTop(211);
    obj.sendLinesButton:setText("Enviar");

    obj._e_event0 = obj.enableCheckBox:addEventListener("onChange",
        function (self)
            enableAutolog(self.mesa, self.enableCheckBox.checked);
        end, obj);

    obj._e_event1 = obj.useLoginForPvtCheckBox:addEventListener("onChange",
        function (self)
            autolog.useLoginForPvtName = self.useLoginForPvtCheckBox.checked;
        end, obj);

    obj._e_event2 = obj.readLogButton:addEventListener("onClick",
        function (self)
            readLog(self.mesa);
        end, obj);

    obj._e_event3 = obj.exportLogButton:addEventListener("onClick",
        function (self)
            exportLog(self.mesa);
        end, obj);

    obj._e_event4 = obj.clearLogButton:addEventListener("onClick",
        function (self)
            clearLog(self.mesa);
        end, obj);

    obj._e_event5 = obj.sendLinesButton:addEventListener("onClick",
        function (self)
            sendLastMessages(self.mesa, self.linesToSendField.asNumber);
        end, obj);

    function obj:_releaseEvents()
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

        if self.clearLogButton ~= nil then self.clearLogButton:destroy(); self.clearLogButton = nil; end;
        if self.enableCheckBox ~= nil then self.enableCheckBox:destroy(); self.enableCheckBox = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.sendLinesButton ~= nil then self.sendLinesButton:destroy(); self.sendLinesButton = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.exportLogButton ~= nil then self.exportLogButton:destroy(); self.exportLogButton = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.linesToSendField ~= nil then self.linesToSendField:destroy(); self.linesToSendField = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.readLogButton ~= nil then self.readLogButton:destroy(); self.readLogButton = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.useLoginForPvtCheckBox ~= nil then self.useLoginForPvtCheckBox:destroy(); self.useLoginForPvtCheckBox = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _autologConfigPanel = {
    newEditor = newautologConfigPanel, 
    new = newautologConfigPanel, 
    name = "autologConfigPanel", 
    dataType = "br.com.rrpg.Autolog", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Autolog", 
    description=""};

autologConfigPanel = _autologConfigPanel;
rrpg.registrarForm(_autologConfigPanel);
rrpg.registrarDataType(_autologConfigPanel);

return _autologConfigPanel;
