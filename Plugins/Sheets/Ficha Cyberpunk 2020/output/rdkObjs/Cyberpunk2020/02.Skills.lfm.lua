require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSkills()
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
    obj:setName("frmSkills");
    obj:setAlign("client");


		local function updateAtributes(num)
			local mod = 0;
			
			if num == "1" then
				mod = tonumber(sheet.atratividade) or 0;
			elseif num == "2" then
				mod = tonumber(sheet.tipoCorporal) or 0;
			elseif num == "3" then
				mod = tonumber(sheet.autocontrole) or 0;
			elseif num == "4" then
				mod = tonumber(sheet.reflexos) or 0;
			elseif num == "5" then
				mod = tonumber(sheet.tecnica) or 0;
			elseif num == "6" then
				mod = tonumber(sheet.inteligencia) or 0;
			elseif num == "7" then
				mod = tonumber(sheet.empatia) or 0;
			end;

			local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
			for i=1, #nodes, 1 do
				if nodes[i].atributo == num then
					nodes[i].atributoPericia = mod;
				end;
			end
		end;

	


    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'atratividade', 'tipoCorporal', 'autocontrole', 'reflexos', 'tecnica', 'inteligencia', 'empatia'});
    obj.dataLink1:setName("dataLink1");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setColor("#FF000000");
    obj.rectangle1:setWidth(1363);
    obj.rectangle1:setHeight(686);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(830);
    obj.layout1:setHeight(685);
    obj.layout1:setName("layout1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("NOME DA PERÍCIA");
    obj.label1:setLeft(20);
    obj.label1:setTop(1);
    obj.label1:setWidth(135);
    obj.label1:setHeight(20);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("CHAVE");
    obj.label2:setLeft(165);
    obj.label2:setTop(1);
    obj.label2:setWidth(60);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setText("TOTAL");
    obj.label3:setLeft(245);
    obj.label3:setTop(1);
    obj.label3:setWidth(40);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("ATR");
    obj.label4:setLeft(285);
    obj.label4:setTop(1);
    obj.label4:setWidth(33);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setText("PTS");
    obj.label5:setLeft(320);
    obj.label5:setTop(1);
    obj.label5:setWidth(40);
    obj.label5:setHeight(20);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setText("NOME DA PERÍCIA");
    obj.label6:setLeft(415);
    obj.label6:setTop(1);
    obj.label6:setWidth(135);
    obj.label6:setHeight(20);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setText("CHAVE");
    obj.label7:setLeft(560);
    obj.label7:setTop(1);
    obj.label7:setWidth(60);
    obj.label7:setHeight(20);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setText("TOTAL");
    obj.label8:setLeft(640);
    obj.label8:setTop(1);
    obj.label8:setWidth(40);
    obj.label8:setHeight(20);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setText("ATR");
    obj.label9:setLeft(680);
    obj.label9:setTop(1);
    obj.label9:setWidth(33);
    obj.label9:setHeight(20);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setText("PTS");
    obj.label10:setLeft(715);
    obj.label10:setTop(1);
    obj.label10:setWidth(40);
    obj.label10:setHeight(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rclListaDasPericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.layout1);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmSkillItem");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(820);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setText("Nova Perícia");
    obj.button1:setLeft(840);
    obj.button1:setTop(0);
    obj.button1:setWidth(125);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            			updateAtributes("1");
            			updateAtributes("2");
            			updateAtributes("3");
            			updateAtributes("4");
            			updateAtributes("5");
            			updateAtributes("6");
            			updateAtributes("7");
        end, obj);

    obj._e_event1 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if utils.compareStringPtBr(nodeA.atributo, nodeB.atributo)== 0 then
            						return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
            					else 
            		            	return utils.compareStringPtBr(nodeA.atributo, nodeB.atributo);
            		            end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDasPericias:append();
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
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSkills = {
    newEditor = newfrmSkills, 
    new = newfrmSkills, 
    name = "frmSkills", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSkills = _frmSkills;
rrpg.registrarForm(_frmSkills);

return _frmSkills;
