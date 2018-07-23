require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGerenciador01()
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
    obj:setName("frmGerenciador01");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(680);
    obj.rectangle1:setHeight(615);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(550);
    obj.label1:setHeight(25);
    obj.label1:setText("JOGADORES");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setText("Jogador");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(105);
    obj.label3:setTop(30);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("Personagem");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(205);
    obj.label4:setTop(30);
    obj.label4:setWidth(75);
    obj.label4:setHeight(25);
    obj.label4:setText("XP Inicial");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(280);
    obj.label5:setTop(30);
    obj.label5:setWidth(75);
    obj.label5:setHeight(25);
    obj.label5:setText("XP Gasta");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(355);
    obj.label6:setTop(30);
    obj.label6:setWidth(75);
    obj.label6:setHeight(25);
    obj.label6:setText("XP Total");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(430);
    obj.label7:setTop(30);
    obj.label7:setWidth(25);
    obj.label7:setHeight(25);
    obj.label7:setText("NEP");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(455);
    obj.label8:setTop(30);
    obj.label8:setWidth(75);
    obj.label8:setHeight(25);
    obj.label8:setText("PO Inicial");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(530);
    obj.label9:setTop(30);
    obj.label9:setWidth(75);
    obj.label9:setHeight(25);
    obj.label9:setText("PO Total");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(605);
    obj.label10:setTop(30);
    obj.label10:setWidth(25);
    obj.label10:setHeight(25);
    obj.label10:setText("Nº");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(600);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("V");
    obj.button1:setHint("Dá voz a todos jogadores da lista, retira +Jogador dos outros e ativa mesa moderada. ");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(650);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Novo");
    obj.button2:setName("button2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle1);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(55);
    obj.scrollBox2:setWidth(680);
    obj.scrollBox2:setHeight(440);
    obj.scrollBox2:setName("scrollBox2");

    obj.rclJogadores = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclJogadores:setParent(obj.scrollBox2);
    obj.rclJogadores:setLeft(0);
    obj.rclJogadores:setTop(0);
    obj.rclJogadores:setWidth(660);
    obj.rclJogadores:setHeight(440);
    obj.rclJogadores:setItemHeight(35);
    obj.rclJogadores:setAutoHeight(true);
    obj.rclJogadores:setMinQt(1);
    obj.rclJogadores:setName("rclJogadores");
    obj.rclJogadores:setField("jogadores");
    obj.rclJogadores:setTemplateForm("frmGerenciador01_Jogadores");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            						local jogadores = ndb.getChildNodes(sheet.jogadores);
            						local jogadoresNome = "";
            						local mesa = rrpg.getMesaDe(sheet);
            						local usuarios = mesa.jogadores;
            
            						mesa:requestSetModerada(true);
            						for i=1, #jogadores, 1 do
            							jogadoresNome = jogadoresNome .. jogadores[i].jogador .. " ";
            						end;
            
            						for i=1, #usuarios, 1 do 
            							if string.find(jogadoresNome, usuarios[i].login)== nil then
            								if not usuarios[i].isMestre then
            									usuarios[i]:requestSetJogador(false);
            									usuarios[i]:requestSetVoz(false);
            								end
            							else
            								usuarios[i]:requestSetJogador(true);
            								usuarios[i]:requestSetVoz(true);
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclJogadores:append();
        end, obj);

    obj._e_event2 = obj.rclJogadores:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            local mod1 = nodeA.xp;
            						local mod2 = nodeB.xp;
            						if mod1==nil then
            							mod1 = "0";
            						end;
            						if mod2==nil then
            							mod2 = "0";
            						end;
            						return (utils.compareStringPtBr(mod1, mod2) * -1);
        end, obj);

    obj._e_event3 = obj.rclJogadores:addEventListener("onEndEnumeration",
        function (_)
            if self.rclJogadores.selectedNode == nil and sheet ~= nil then
            					        local nodes = ndb.getChildNodes(sheet.jogadores);               
            
            					        if #nodes > 0 then
            					            self.rclJogadores.selectedNode = nodes[1];
            					        end;
            					    end;
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

        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.rclJogadores ~= nil then self.rclJogadores:destroy(); self.rclJogadores = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGerenciador01()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGerenciador01();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGerenciador01 = {
    newEditor = newfrmGerenciador01, 
    new = newfrmGerenciador01, 
    name = "frmGerenciador01", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador01 = _frmGerenciador01;
Firecast.registrarForm(_frmGerenciador01);

return _frmGerenciador01;
