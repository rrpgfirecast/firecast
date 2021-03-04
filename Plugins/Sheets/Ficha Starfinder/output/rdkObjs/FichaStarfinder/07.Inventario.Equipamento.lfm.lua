require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister7A_svg()
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
    obj:setName("frmFichaRPGmeister7A_svg");
    obj:setWidth(465);
    obj:setHeight(25);
    obj:setTheme("dark");
    obj:setMargins({top=1});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse equipamento?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showPopup()
			local pop = self:findControlByName("popEquip");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottomCenter", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup para exibir");
			end;				
		end;

		local function equipPrice()
			if sheet~= nil then
				local node = NDB.getRoot(sheet);

				local preco = 0;
				local nodes = NDB.getChildNodes(node.campoDosEquipamentos); 
				for i=1, #nodes, 1 do
					preco = preco + (tonumber(nodes[i].preco) or 0);
				end
				node.precoEquipamentos = preco;

				preco = 0;
				nodes = NDB.getChildNodes(node.campoDosImplates); 
				for i=1, #nodes, 1 do
					preco = preco + (tonumber(nodes[i].preco) or 0);
				end

				node.precoImplantes = preco;
			end;
		end;

		local function equipWeight()
			if sheet~= nil then
				local node = NDB.getRoot(sheet);

				local peso = 0;
				local nodes = NDB.getChildNodes(node.campoDosEquipamentos); 
				for i=1, #nodes, 1 do
					peso = peso + (tonumber(nodes[i].peso) or 0);
				end
				node.pesoEquipamentos = peso;

				peso = 0;
				nodes = NDB.getChildNodes(node.campoDosImplates); 
				for i=1, #nodes, 1 do
					peso = peso + (tonumber(nodes[i].peso) or 0);
				end

				node.pesoImplantes = peso;
			end;
		end;
		


    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(1);
    obj.edit1:setWidth(270);
    obj.edit1:setHeight(23);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.equipWeightLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.equipWeightLabel:setParent(obj);
    obj.equipWeightLabel:setLeft(270);
    obj.equipWeightLabel:setTop(1);
    obj.equipWeightLabel:setWidth(50);
    obj.equipWeightLabel:setHeight(23);
    obj.equipWeightLabel:setColor("black");
    obj.equipWeightLabel:setStrokeColor("grey");
    obj.equipWeightLabel:setStrokeSize(1);
    obj.equipWeightLabel:setName("equipWeightLabel");
    obj.equipWeightLabel:setVisible(true);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.equipWeightLabel);
    obj.label1:setWidth(50);
    obj.label1:setHeight(23);
    obj.label1:setField("peso");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "formatFloat",  ",0.##");
    obj.label1:setName("label1");

    obj.equipWeightEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.equipWeightEdit:setParent(obj);
    obj.equipWeightEdit:setLeft(270);
    obj.equipWeightEdit:setTop(1);
    obj.equipWeightEdit:setWidth(50);
    obj.equipWeightEdit:setHeight(23);
    obj.equipWeightEdit:setField("peso");
    obj.equipWeightEdit:setType("float");
    obj.equipWeightEdit:setName("equipWeightEdit");
    obj.equipWeightEdit:setVisible(false);

    obj.equipPriceLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.equipPriceLabel:setParent(obj);
    obj.equipPriceLabel:setLeft(320);
    obj.equipPriceLabel:setTop(1);
    obj.equipPriceLabel:setWidth(75);
    obj.equipPriceLabel:setHeight(23);
    obj.equipPriceLabel:setColor("black");
    obj.equipPriceLabel:setStrokeColor("grey");
    obj.equipPriceLabel:setStrokeSize(1);
    obj.equipPriceLabel:setName("equipPriceLabel");
    obj.equipPriceLabel:setVisible(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.equipPriceLabel);
    obj.label2:setWidth(75);
    obj.label2:setHeight(23);
    obj.label2:setField("preco");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "formatFloat",  ",0.## C");
    obj.label2:setName("label2");

    obj.equipPriceEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.equipPriceEdit:setParent(obj);
    obj.equipPriceEdit:setLeft(320);
    obj.equipPriceEdit:setTop(1);
    obj.equipPriceEdit:setWidth(75);
    obj.equipPriceEdit:setHeight(23);
    obj.equipPriceEdit:setField("preco");
    obj.equipPriceEdit:setType("float");
    obj.equipPriceEdit:setName("equipPriceEdit");
    obj.equipPriceEdit:setVisible(false);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(395);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(420);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj._e_event0 = obj.equipWeightLabel:addEventListener("onClick",
        function (_)
            self.equipWeightLabel.visible = false;
            			self.equipWeightEdit.visible = true;
            			self.equipWeightEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.equipWeightEdit:addEventListener("onUserChange",
        function (_)
            equipWeight();
        end, obj);

    obj._e_event2 = obj.equipWeightEdit:addEventListener("onExit",
        function (_)
            self.equipWeightLabel.visible = true;
            			self.equipWeightEdit.visible = false;
        end, obj);

    obj._e_event3 = obj.equipPriceLabel:addEventListener("onClick",
        function (_)
            self.equipPriceLabel.visible = false;
            			self.equipPriceEdit.visible = true;
            			self.equipPriceEdit:setFocus();
        end, obj);

    obj._e_event4 = obj.equipPriceEdit:addEventListener("onUserChange",
        function (_)
            equipPrice();
        end, obj);

    obj._e_event5 = obj.equipPriceEdit:addEventListener("onExit",
        function (_)
            self.equipPriceLabel.visible = true;
            			self.equipPriceEdit.visible = false;
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (_)
            showPopup();
        end, obj);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
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

        if self.equipPriceLabel ~= nil then self.equipPriceLabel:destroy(); self.equipPriceLabel = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.equipWeightLabel ~= nil then self.equipWeightLabel:destroy(); self.equipWeightLabel = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.equipWeightEdit ~= nil then self.equipWeightEdit:destroy(); self.equipWeightEdit = nil; end;
        if self.equipPriceEdit ~= nil then self.equipPriceEdit:destroy(); self.equipPriceEdit = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister7A_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister7A_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister7A_svg = {
    newEditor = newfrmFichaRPGmeister7A_svg, 
    new = newfrmFichaRPGmeister7A_svg, 
    name = "frmFichaRPGmeister7A_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister7A_svg = _frmFichaRPGmeister7A_svg;
Firecast.registrarForm(_frmFichaRPGmeister7A_svg);

return _frmFichaRPGmeister7A_svg;
