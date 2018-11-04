require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmConsumiveis()
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
    obj:setName("frmConsumiveis");
    obj:setHeight(60);
    obj:setMargins({top=2,bottom=2});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(10);
    obj.label1:setTop(5);
    obj.label1:setWidth(50);
    obj.label1:setHeight(20);
    obj.label1:setText("NOME");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(60);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(163);
    obj.label2:setTop(5);
    obj.label2:setWidth(20);
    obj.label2:setHeight(20);
    obj.label2:setText("NC");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(185);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(25);
    obj.edit2:setHeight(25);
    obj.edit2:setField("nc");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(213);
    obj.label3:setTop(5);
    obj.label3:setWidth(20);
    obj.label3:setHeight(20);
    obj.label3:setText("CD");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(235);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(25);
    obj.edit3:setHeight(25);
    obj.edit3:setField("cd");
    obj.edit3:setName("edit3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(5);
    obj.button1:setTop(30);
    obj.button1:setWidth(50);
    obj.button1:setText("Dados");
    obj.button1:setName("button1");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(60);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setField("dados");
    obj.edit4:setName("edit4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(168);
    obj.label4:setTop(30);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("USOS");
    obj.label4:setName("label4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(210);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(25);
    obj.edit5:setHeight(25);
    obj.edit5:setField("usosMin");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(235);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(25);
    obj.edit6:setHeight(25);
    obj.edit6:setField("usosMax");
    obj.edit6:setName("edit6");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setAlign("right");
    obj.button2:setText("X");
    obj.button2:setWidth(18);
    obj.button2:setName("button2");


		local function teste()
			if sheet.usosMin~=nil then
				sheet.usosMin = tonumber(sheet.usosMin) - 1;
			end;
			
			if sheet.dados~=nil then
				local rolagem = rrpg.interpretarRolagem(sheet.dados);
				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
				local texto = "";
				if sheet.nome~=nil then
					texto = texto .. sheet.nome .. " foi usado.";
				else	
					texto = texto .. "Item foi usado";
				end;
				
				if sheet.cd~=nil then
					texto = texto .. " CD: " .. sheet.cd .. ".";
				end;
				
				mesaDoPersonagem.activeChat:rolarDados(rolagem, texto);
			end;
			
		end;
	


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            teste();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            ndb.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmConsumiveis = {
    newEditor = newfrmConsumiveis, 
    new = newfrmConsumiveis, 
    name = "frmConsumiveis", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmConsumiveis = _frmConsumiveis;
rrpg.registrarForm(_frmConsumiveis);

return _frmConsumiveis;
