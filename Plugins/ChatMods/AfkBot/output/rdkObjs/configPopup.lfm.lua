require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_afkbotPopup()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("afkbotPopup");
    obj:setFormType("undefined");
    obj:setDataType("ambesek.afkbot");
    obj:setTitle("AfkBot");
    obj:setWidth(290);
    obj:setHeight(500);

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Opções");
    obj.tab1:setPadding({left=10,right=10,top=10});
    obj.tab1:setName("tab1");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.tab1);
    obj.checkBox1:setField("botEnabled");
    obj.checkBox1:setAlign("top");
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setText("Habilitar AfkBot");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.tab1);
    obj.checkBox2:setField("autoEnable");
    obj.checkBox2:setAlign("top");
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setText("Autoligar quando ausente");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.tab1);
    obj.checkBox3:setField("spectator");
    obj.checkBox3:setAlign("top");
    obj.checkBox3:setHeight(25);
    obj.checkBox3:setText("Alertar automaticamente espectadores");
    obj.checkBox3:setName("checkBox3");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(190);
    obj.label1:setText("Tempo entre mensagens (min)");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("delay");
    obj.edit1:setType("number");
    obj.edit1:setMin(1);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.tab1);
    obj.label2:setAlign("top");
    obj.label2:setHeight(25);
    obj.label2:setField("lastAlert");
    obj.label2:setName("label2");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.tab1);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setHeight(5);
    obj.horzLine1:setName("horzLine1");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.tab1);
    obj.checkBox4:setAlign("top");
    obj.checkBox4:setHeight(25);
    obj.checkBox4:setField("stopDice");
    obj.checkBox4:setText("Expulsar espectadores rolando dados.");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.tab1);
    obj.checkBox5:setAlign("top");
    obj.checkBox5:setHeight(25);
    obj.checkBox5:setField("allowNewPlayer");
    obj.checkBox5:setText("Não expulsar espectadores com ficha.");
    obj.checkBox5:setName("checkBox5");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.tab1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setAlign("left");
    obj.label3:setWidth(190);
    obj.label3:setText("Kickar na ocorrencia Nº");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(50);
    obj.edit2:setField("limitDice");
    obj.edit2:setType("number");
    obj.edit2:setMin(1);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.tab1);
    obj.checkBox6:setAlign("top");
    obj.checkBox6:setHeight(25);
    obj.checkBox6:setText("Expulsar espectadores rindo.");
    obj.checkBox6:setField("stopLaugh");
    obj.checkBox6:setName("checkBox6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.tab1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setAlign("left");
    obj.label4:setWidth(190);
    obj.label4:setText("Kickar na ocorrencia Nº");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(50);
    obj.edit3:setField("limitLaugh");
    obj.edit3:setType("number");
    obj.edit3:setMin(1);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.tab1);
    obj.checkBox7:setAlign("top");
    obj.checkBox7:setHeight(25);
    obj.checkBox7:setText("Tirar voz de jogadores expulsos.");
    obj.checkBox7:setField("noVoice");
    obj.checkBox7:setName("checkBox7");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.tab1);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setHeight(5);
    obj.horzLine2:setName("horzLine2");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.tab1);
    obj.checkBox8:setAlign("top");
    obj.checkBox8:setHeight(25);
    obj.checkBox8:setText("Dar voz aos jogadores.");
    obj.checkBox8:setField("giveVoice");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.tab1);
    obj.checkBox9:setAlign("top");
    obj.checkBox9:setHeight(25);
    obj.checkBox9:setText("Permitir jogadores passarem seu turno.");
    obj.checkBox9:setField("passAction");
    obj.checkBox9:setName("checkBox9");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.tab1);
    obj.horzLine3:setAlign("top");
    obj.horzLine3:setHeight(5);
    obj.horzLine3:setName("horzLine3");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.tab1);
    obj.checkBox10:setAlign("top");
    obj.checkBox10:setHeight(25);
    obj.checkBox10:setText("Dar ficha aos jogadores.");
    obj.checkBox10:setField("giveSheet");
    obj.checkBox10:setName("checkBox10");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.tab1);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setAlign("left");
    obj.label5:setWidth(90);
    obj.label5:setText("DataType");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(150);
    obj.edit4:setField("dataType");
    obj.edit4:setName("edit4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.tab1);
    obj.dataLink1:setFields({'botEnabled','autoEnable'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.tab1);
    obj.dataLink2:setFields({'clock'});
    obj.dataLink2:setName("dataLink2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("AfkBot");
    obj.tab2:setName("tab2");

    obj.messagesList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.messagesList:setParent(obj.tab2);
    obj.messagesList:setLeft(10);
    obj.messagesList:setTop(5);
    obj.messagesList:setWidth(270);
    obj.messagesList:setHeight(490);
    obj.messagesList:setField("messagesList");
    obj.messagesList:setName("messagesList");
    obj.messagesList:setTemplateForm("frmMessageItem");
    obj.messagesList:setLayout("vertical");
    obj.messagesList:setMinQt(1);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.tab2);
    obj.dataLink3:setField("addMessage");
    obj.dataLink3:setName("dataLink3");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("AutoKick");
    obj.tab3:setName("tab3");

    obj.kickList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.kickList:setParent(obj.tab3);
    obj.kickList:setLeft(10);
    obj.kickList:setTop(5);
    obj.kickList:setWidth(270);
    obj.kickList:setHeight(490);
    obj.kickList:setField("kickList");
    obj.kickList:setName("kickList");
    obj.kickList:setTemplateForm("frmKickItem");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.tab3);
    obj.dataLink4:setField("addUser");
    obj.dataLink4:setName("dataLink4");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("AutoWelcome");
    obj.tab4:setName("tab4");

    obj.welcomeList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.welcomeList:setParent(obj.tab4);
    obj.welcomeList:setLeft(10);
    obj.welcomeList:setTop(5);
    obj.welcomeList:setWidth(270);
    obj.welcomeList:setHeight(490);
    obj.welcomeList:setField("welcomeList");
    obj.welcomeList:setName("welcomeList");
    obj.welcomeList:setTemplateForm("frmWelcomeItem");
    obj.welcomeList:setMinQt(1);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.tab4);
    obj.dataLink5:setField("addWelcome");
    obj.dataLink5:setName("dataLink5");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					if oldValue == nil then return end;
            					if sheet.botEnabled then 
            						local delay = tonumber(sheet.delay) or 5;
            						sheet.clock = os.time() - (delay * 60);
            					end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					if sheet.clock == nil then sheet.clock = os.time() end;
            					local clock = os.date("*t", sheet.clock);
            
            					sheet.lastAlert = "Ultimo alerta: " .. clock.day .. "/" .. clock.month .. "/" .. clock.year .. " as " .. clock.hour .. ":" .. clock.min .. ":" .. clock.sec;
        end, obj);

    obj._e_event2 = obj.messagesList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            						return 0;
            					elseif nodeA.enabled then
            						return -1;
            					elseif nodeB.enabled then
            						return 1;
            					end;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local addMessage = tonumber(sheet.addMessage) or 0;
            					if addMessage>0 then
            						sheet.addMessage = 0;
            						local item = self.messagesList:append();
            						item.enabled = false;
            					end;
        end, obj);

    obj._e_event4 = obj.kickList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.user and nodeB.user then 
            						return Utils.compareStringPtBr(nodeA.login, nodeB.login);
            					elseif nodeA.user then
            						return 1;
            					elseif nodeB.user then
            						return -1;
            					end;
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local addUser = tonumber(sheet.addUser) or 0;
            					if addUser>0 then
            						sheet.addUser = 0;
            						local item = self.kickList:append();
            						sheet.newUser = item;
            					end;
        end, obj);

    obj._e_event6 = obj.welcomeList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.user and nodeB.user then 
            						return Utils.compareStringPtBr(nodeA.login, nodeB.login);
            					elseif nodeA.user then
            						return 1;
            					elseif nodeB.user then
            						return -1;
            					end;
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local addWelcome = tonumber(sheet.addWelcome) or 0;
            					if addWelcome>0 then
            						sheet.addWelcome = 0;
            						local item = self.welcomeList:append();
            						item.enabled = false;
            					end;
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

        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.welcomeList ~= nil then self.welcomeList:destroy(); self.welcomeList = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.kickList ~= nil then self.kickList:destroy(); self.kickList = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.messagesList ~= nil then self.messagesList:destroy(); self.messagesList = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newafkbotPopup()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_afkbotPopup();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _afkbotPopup = {
    newEditor = newafkbotPopup, 
    new = newafkbotPopup, 
    name = "afkbotPopup", 
    dataType = "ambesek.afkbot", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "AfkBot", 
    description=""};

afkbotPopup = _afkbotPopup;
Firecast.registrarForm(_afkbotPopup);
Firecast.registrarDataType(_afkbotPopup);

return _afkbotPopup;
