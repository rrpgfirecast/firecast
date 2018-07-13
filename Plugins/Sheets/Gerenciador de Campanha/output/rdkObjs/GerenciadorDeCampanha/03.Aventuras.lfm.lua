require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmGerenciador03()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmGerenciador03");
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
    obj.rectangle1:setWidth(830);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(830);
    obj.label1:setHeight(20);
    obj.label1:setText("LISTA DE AVENTURAS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("+");
    obj.button1:setHint("Nova Aventura");
    obj.button1:setName("button1");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.scrollBox1);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(20);
    obj.scrollBox2:setWidth(830);
    obj.scrollBox2:setHeight(590);
    obj.scrollBox2:setName("scrollBox2");

    obj.rclAventuras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAventuras:setParent(obj.scrollBox2);
    obj.rclAventuras:setLeft(0);
    obj.rclAventuras:setTop(0);
    obj.rclAventuras:setWidth(810);
    obj.rclAventuras:setHeight(600);
    obj.rclAventuras:setItemHeight(200);
    obj.rclAventuras:setAutoHeight(true);
    obj.rclAventuras:setMinQt(1);
    obj.rclAventuras:setName("rclAventuras");
    obj.rclAventuras:setField("aventuras");
    obj.rclAventuras:setTemplateForm("frmGerenciador03_AVENTURA");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(835);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(310);
    obj.rectangle2:setHeight(615);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setLeft(5);
    obj.label2:setTop(5);
    obj.label2:setWidth(310);
    obj.label2:setHeight(25);
    obj.label2:setText("SESSÕES");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setLeft(5);
    obj.label3:setTop(30);
    obj.label3:setWidth(30);
    obj.label3:setHeight(25);
    obj.label3:setText("Nº");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(35);
    obj.label4:setTop(30);
    obj.label4:setWidth(80);
    obj.label4:setHeight(25);
    obj.label4:setText("Data");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(165);
    obj.label5:setTop(30);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("Log");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle2);
    obj.button2:setLeft(265);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Novo");
    obj.button2:setName("button2");

    obj.rclSessoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSessoes:setParent(obj.rectangle2);
    obj.rclSessoes:setLeft(0);
    obj.rclSessoes:setTop(55);
    obj.rclSessoes:setWidth(310);
    obj.rclSessoes:setHeight(555);
    obj.rclSessoes:setItemHeight(35);
    obj.rclSessoes:setName("rclSessoes");
    obj.rclSessoes:setField("sessoes");
    obj.rclSessoes:setTemplateForm("frmGerenciador01_Sessao");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            						local aventuras = ndb.getChildNodes(sheet.aventuras);
            						local num = #aventuras + 1;
            
            						local node = self.rclAventuras:append();
            						if node~=nil then
            							node.numero = num;
            						end;
            
            						self.rclAventuras:sort();
            					end;
        end, obj);

    obj._e_event1 = obj.rclAventuras:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                return 1;
            		            elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                return -1;
            		            else   
            		                return 0;
            		            end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            						local sessoes = ndb.getChildNodes(sheet.sessoes);
            						local num = 1;
            
            						if #sessoes > 0 then
            							num = (tonumber(sessoes[#sessoes].numero) or 0) + 1
            						end;
            
            						local node = self.rclSessoes:append();
            						if node~=nil then
            							node.numero = num;
            							node.data = os.date("%d/%m/%Y", os.time());
            						end;
            
            						self.rclSessoes:sort();
            					end;
        end, obj);

    obj._e_event3 = obj.rclSessoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                return 1;
            		            elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                return -1;
            		            else   
            		                return 0;
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
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rclAventuras ~= nil then self.rclAventuras:destroy(); self.rclAventuras = nil; end;
        if self.rclSessoes ~= nil then self.rclSessoes:destroy(); self.rclSessoes = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciador03 = {
    newEditor = newfrmGerenciador03, 
    new = newfrmGerenciador03, 
    name = "frmGerenciador03", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador03 = _frmGerenciador03;
Firecast.registrarForm(_frmGerenciador03);

return _frmGerenciador03;
