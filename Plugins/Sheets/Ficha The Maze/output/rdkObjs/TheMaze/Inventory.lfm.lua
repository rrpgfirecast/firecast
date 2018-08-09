require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmInventory()
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
    obj:setName("frmInventory");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setColor("#FF000000");
    obj.rectangle1:setWidth(1363);
    obj.rectangle1:setHeight(686);
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(1210);
    obj.rectangle2:setHeight(555);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(200);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setLeft(205);
    obj.label2:setTop(5);
    obj.label2:setWidth(700);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Efeito");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setLeft(905);
    obj.label3:setTop(5);
    obj.label3:setWidth(150);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Tipo");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(1055);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Qtd");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(1105);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Max");
    obj.label5:setName("label5");

    obj.rclInventario = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventario:setParent(obj.rectangle2);
    obj.rclInventario:setLeft(5);
    obj.rclInventario:setTop(30);
    obj.rclInventario:setWidth(1200);
    obj.rclInventario:setHeight(520);
    obj.rclInventario:setName("rclInventario");
    obj.rclInventario:setField("listaDeItens");
    obj.rclInventario:setTemplateForm("frmItem");
    obj.rclInventario:setLayout("vertical");
    obj.rclInventario:setMinQt(8);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(560);
    obj.rectangle3:setWidth(310);
    obj.rectangle3:setHeight(110);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle3);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(310);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("Armazenamento");
    obj.label6:setName("label6");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle3);
    obj.comboBox1:setLeft(5);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(300);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("armazenamento1");
    obj.comboBox1:setItems({'', 'Coldre', 'Bolsa Grande'});
    obj.comboBox1:setValues({'0','4','6'});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle3);
    obj.comboBox2:setLeft(5);
    obj.comboBox2:setTop(55);
    obj.comboBox2:setWidth(300);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("armazenamento2");
    obj.comboBox2:setItems({'', 'Coldre', 'Bolsa Grande'});
    obj.comboBox2:setValues({'0','4','6'});
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle3);
    obj.comboBox3:setLeft(5);
    obj.comboBox3:setTop(80);
    obj.comboBox3:setWidth(300);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("armazenamento3");
    obj.comboBox3:setItems({'+0', '+1', '+2', '+3', '+4', '+5', '+6'});
    obj.comboBox3:setValues({'0','1','2','3','4','5','6'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle3);
    obj.dataLink1:setFields({'armazenamento1','armazenamento2','armazenamento3'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local armazenamento1 = (tonumber(sheet.armazenamento1) or 0);
            					local armazenamento2 = (tonumber(sheet.armazenamento2) or 0);
            					local armazenamento3 = (tonumber(sheet.armazenamento3) or 0);
            					local tamanho = 8 + armazenamento1 + armazenamento2 + armazenamento3;
            					sheet.inventarioTamanho = tamanho;
            					self.rclInventario.minQt = tamanho;
            
            					local objetos = ndb.getChildNodes(sheet.listaDeItens);
            
            					if #objetos > tamanho then
            						local excesso = #objetos - tamanho;
            						showMessage("Você possui " .. excesso .. " itens além do limite.");
            					end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rclInventario ~= nil then self.rclInventario:destroy(); self.rclInventario = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmInventory()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmInventory();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmInventory = {
    newEditor = newfrmInventory, 
    new = newfrmInventory, 
    name = "frmInventory", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInventory = _frmInventory;
Firecast.registrarForm(_frmInventory);

return _frmInventory;
