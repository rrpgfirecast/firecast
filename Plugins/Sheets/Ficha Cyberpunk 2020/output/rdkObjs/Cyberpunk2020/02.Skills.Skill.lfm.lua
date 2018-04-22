require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSkillItem()
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
    obj:setName("frmSkillItem");
    obj:setWidth(410);
    obj:setHeight(25);
    obj:setTheme("dark");
    obj:setMargins({top=2, bottom=2, right=10});

			
		local function askForDelete()
			dialogs.confirmYesNo("Deseja realmente apagar essa perícia?",
				function (confirmado)
					if confirmado then
						ndb.deleteNode(sheet);
					end;
				end);
		end;

		local function showPericiaPopup()
			local pop = self:findControlByName("popPericia");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("right", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de pericias para exibir");
			end;				
		end;

		


    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#202020");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(5);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(155);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setLeft(160);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(70);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("atributo");
    obj.comboBox1:setItems({'ATR', 'TCO', 'AuCon', 'REF', 'TEC', 'INT', 'EMP'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setLeft(240);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setField("total");
    obj.label1:setText("0");
    obj.label1:setLeft(240);
    obj.label1:setTop(0);
    obj.label1:setWidth(35);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setLeft(280);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(33);
    obj.rectangle3:setHeight(24);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setField("atributoPericia");
    obj.label2:setText("0");
    obj.label2:setLeft(280);
    obj.label2:setTop(0);
    obj.label2:setWidth(33);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(320);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setField("pontos");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(350);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(375);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'atributoPericia', 'pontos', 'atributo', 'cyber', 'magia', 'outros'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.edit1:addEventListener("onChange",
        function (self)
            local rcl = self:findControlByName("rclListaDasPericias");
            			if rcl~= nil then
            				rcl:sort();
            			end;
        end, obj);

    obj._e_event1 = obj.comboBox1:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            
            				local atributoPericia = 0;
            				local node = ndb.getRoot(sheet);
            
            				if sheet.atributo == "1" then
            					atributoPericia = tonumber(node.atratividade) or 0;
            				elseif sheet.atributo == "2" then
            					atributoPericia = tonumber(node.tipoCorporal) or 0;
            				elseif sheet.atributo == "3" then
            					atributoPericia = tonumber(node.autocontrole) or 0;
            				elseif sheet.atributo == "4" then
            					atributoPericia = tonumber(node.reflexos) or 0;
            				elseif sheet.atributo == "5" then
            					atributoPericia = tonumber(node.tecnica) or 0;
            				elseif sheet.atributo == "6" then
            					atributoPericia = tonumber(node.inteligencia) or 0;
            				elseif sheet.atributo == "7" then
            					atributoPericia = tonumber(node.empatia) or 0;
            				end;
            				sheet.atributoPericia = atributoPericia;
            			end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (self)
            showPericiaPopup();
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            askForDelete();
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet== nil then return end;
            
            			local mod = 0;
            			mod = 	(tonumber(sheet.atributoPericia) or 0) +
            					(tonumber(sheet.pontos) or 0) +
            					(tonumber(sheet.cyber) or 0) +
            					(tonumber(sheet.magia) or 0) +
            					(tonumber(sheet.outros) or 0);
            
            			sheet.total = mod;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSkillItem = {
    newEditor = newfrmSkillItem, 
    new = newfrmSkillItem, 
    name = "frmSkillItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSkillItem = _frmSkillItem;
rrpg.registrarForm(_frmSkillItem);

return _frmSkillItem;
