require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmStaffItem()
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
    obj:setName("frmStaffItem");
    obj:setHeight(50);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setVisible(true);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(50);
    obj.label1:setText("Tipo");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("order");
    obj.comboBox1:setItems({'Primario','Secundario','Terciario'});
    obj.comboBox1:setValues({'1','2','3'});
    obj.comboBox1:setHint("Primario: Efeito principal do cajado. \n Secundario: efeito a 75% do preço. \n Terciario: efeito a 50% do preço. ");
    obj.comboBox1:setName("comboBox1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(50);
    obj.label2:setText("Nível");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(50);
    obj.edit1:setField("nivel");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setAlign("left");
    obj.label3:setWidth(50);
    obj.label3:setText("NC");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(50);
    obj.edit2:setField("nc");
    obj.edit2:setType("number");
    obj.edit2:setMin(8);
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("#212121");
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setAlign("left");
    obj.label4:setWidth(50);
    obj.label4:setText("Material");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle2);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(40);
    obj.edit3:setField("material");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setAlign("left");
    obj.label5:setWidth(50);
    obj.label5:setText("XP");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle2);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(40);
    obj.edit4:setField("xp");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setAlign("left");
    obj.label6:setWidth(50);
    obj.label6:setText("Cargas");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle2);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(40);
    obj.edit5:setField("cargas");
    obj.edit5:setType("number");
    obj.edit5:setMin(1);
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setAlign("left");
    obj.label7:setWidth(40);
    obj.label7:setText("Valor");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setAlign("left");
    obj.label8:setWidth(60);
    obj.label8:setField("price");
    obj.label8:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label8, "formatFloat",  ",0.## PO");
    obj.label8:setFontSize(10);
    obj.label8:setName("label8");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'nivel','nc','material','xp','cargas', 'order'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'order'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse efeito?",
            					function (confirmado)
            						if confirmado then
            							NDB.deleteNode(sheet);
            						end;
            					end);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local nivel = tonumber(sheet.nivel) or 0;
            			if nivel < 1 then nivel = 0.5 end;
            			local nc = tonumber(sheet.nc) or 8;
            			local material = tonumber(sheet.material) or 0;
            			local xp = tonumber(sheet.xp) or 0;
            			local cargas = tonumber(sheet.cargas) or 1;
            
            			local order = tonumber(sheet.order) or 0;
            			local mults = {1, 0.75, 0.5};
            			local mult = mults[order] or 1;
            
            			local price = nivel * nc * 750 * mult / cargas;
            			local materialCost = material * 50 / cargas;
            			local xpCost = xp * 5 / cargas;
            
            			sheet.price = price + materialCost + xpCost;
            			sheet.cost = (price/2) + materialCost;
            			sheet.xpCost = math.ceil(price/25) + xp;
            
            			local node = toolSheet;
            			local sumPrice = 0;
            			local sumCost = 0;
            			local sumXP = 0;
            			local nodes = NDB.getChildNodes(node.staffList); 
            			for i=1, #nodes, 1 do
            				sumPrice = sumPrice + (tonumber(nodes[i].price) or 0);
            				sumCost = sumCost + (tonumber(nodes[i].cost) or 0);
            				sumXP = sumXP + (tonumber(nodes[i].xpCost) or 0);
            			end;
            
            			node.staffPrice = sumPrice;
            			node.staffCost = sumCost;
            			node.staffXP = sumXP;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			toolSheet.sortStaff = 1;
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
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmStaffItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmStaffItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmStaffItem = {
    newEditor = newfrmStaffItem, 
    new = newfrmStaffItem, 
    name = "frmStaffItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmStaffItem = _frmStaffItem;
Firecast.registrarForm(_frmStaffItem);

return _frmStaffItem;
