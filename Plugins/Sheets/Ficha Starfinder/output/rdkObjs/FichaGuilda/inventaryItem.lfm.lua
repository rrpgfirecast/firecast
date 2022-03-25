require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmInventaryItem()
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
    obj:setName("frmInventaryItem");
    obj:setWidth(465);
    obj:setHeight(35);
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

		local function equipPrice()
			if sheet~= nil then
				local node = NDB.getRoot(sheet);

				local lists = {"rclInventarioNaves", "rclInventarioMechas", "rclInventarioVeiculos", "rclInventarioEquipamentos", "rclInventarioMunicao", "rclInventarioOutros", "rclInventarioArmas", "rclInventarioPecas"}
				local preco = 0;

				for j=1, #lists, 1 do
					local nodes = NDB.getChildNodes(node[lists[j]]); 
					for i=1, #nodes, 1 do
						preco = preco + ((tonumber(nodes[i].preco) or 0) * (tonumber(nodes[i].qtd) or 1));
					end
				end

				node.recursosGastos = preco;
			end;
		end;

		


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("name");
    obj.edit1:setName("edit1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("right");
    obj.layout1:setWidth(100);
    obj.layout1:setName("layout1");

    obj.precoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.precoLabel:setParent(obj.layout1);
    obj.precoLabel:setAlign("client");
    obj.precoLabel:setColor("black");
    obj.precoLabel:setStrokeColor("grey");
    obj.precoLabel:setStrokeSize(1);
    obj.precoLabel:setName("precoLabel");
    obj.precoLabel:setVisible(true);
    obj.precoLabel:setOpacity(0.75);
    obj.precoLabel:setCornerType("innerRound");
    obj.precoLabel:setXradius(5);
    obj.precoLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.precoLabel);
    obj.label1:setAlign("client");
    obj.label1:setField("preco");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(11);
    lfm_setPropAsString(obj.label1, "formatFloat",  ",0.## C");
    obj.label1:setName("label1");

    obj.precoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.precoEdit:setParent(obj.layout1);
    obj.precoEdit:setField("preco");
    obj.precoEdit:setAlign("client");
    obj.precoEdit:setType("float");
    obj.precoEdit:setFontSize(11);
    obj.precoEdit:setName("precoEdit");
    obj.precoEdit:setVisible(false);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setAlign("right");
    obj.edit2:setWidth(50);
    obj.edit2:setField("qtd");
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.precoLabel:addEventListener("onClick",
        function (_)
            self.precoLabel.visible = false;
                                self.precoEdit.visible = true;
                                self.precoEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.precoEdit:addEventListener("onChange",
        function (_)
            equipPrice()
        end, obj);

    obj._e_event2 = obj.precoEdit:addEventListener("onExit",
        function (_)
            self.precoLabel.visible = true;
                                self.precoEdit.visible = false;
        end, obj);

    obj._e_event3 = obj.edit2:addEventListener("onChange",
        function (_)
            equipPrice()
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
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

        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.precoLabel ~= nil then self.precoLabel:destroy(); self.precoLabel = nil; end;
        if self.precoEdit ~= nil then self.precoEdit:destroy(); self.precoEdit = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmInventaryItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmInventaryItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmInventaryItem = {
    newEditor = newfrmInventaryItem, 
    new = newfrmInventaryItem, 
    name = "frmInventaryItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInventaryItem = _frmInventaryItem;
Firecast.registrarForm(_frmInventaryItem);

return _frmInventaryItem;
