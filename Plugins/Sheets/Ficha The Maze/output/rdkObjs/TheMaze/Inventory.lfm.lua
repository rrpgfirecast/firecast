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
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(895);
    obj.rectangle1:setHeight(225);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(22);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(100);
    obj.label1:setTop(5);
    obj.label1:setWidth(300);
    obj.label1:setHeight(20);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome do Item Equipado");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(400);
    obj.label2:setTop(5);
    obj.label2:setWidth(40);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Act");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(440);
    obj.label3:setTop(5);
    obj.label3:setWidth(150);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Marca1");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(590);
    obj.label4:setTop(5);
    obj.label4:setWidth(150);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Marca2");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(740);
    obj.label5:setTop(5);
    obj.label5:setWidth(150);
    obj.label5:setHeight(20);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Marca3");
    obj.label5:setName("label5");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(50);
    obj.layout2:setName("layout2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(5);
    obj.label6:setTop(15);
    obj.label6:setWidth(95);
    obj.label6:setHeight(20);
    obj.label6:setText("Primária");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(25);
    obj.edit1:setField("equip_arma");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(400);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(40);
    obj.edit2:setHeight(25);
    obj.edit2:setField("equip_arma_act");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(440);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(150);
    obj.edit3:setHeight(25);
    obj.edit3:setField("equip_arma_marca1");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(590);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(150);
    obj.edit4:setHeight(25);
    obj.edit4:setField("equip_arma_marca2");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setLeft(740);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(150);
    obj.edit5:setHeight(25);
    obj.edit5:setField("equip_arma_marca3");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(100);
    obj.label7:setTop(30);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("Efeito:");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(150);
    obj.edit6:setTop(25);
    obj.edit6:setWidth(740);
    obj.edit6:setHeight(25);
    obj.edit6:setField("equip_arma_desc");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(50);
    obj.layout3:setName("layout3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(5);
    obj.label8:setTop(15);
    obj.label8:setWidth(95);
    obj.label8:setHeight(20);
    obj.label8:setText("Secundária");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(100);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(300);
    obj.edit7:setHeight(25);
    obj.edit7:setField("equip_arma2");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setLeft(400);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(25);
    obj.edit8:setField("equip_arma2_act");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setLeft(440);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(150);
    obj.edit9:setHeight(25);
    obj.edit9:setField("equip_arma2_marca1");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setLeft(590);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(150);
    obj.edit10:setHeight(25);
    obj.edit10:setField("equip_arma2_marca2");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setLeft(740);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(150);
    obj.edit11:setHeight(25);
    obj.edit11:setField("equip_arma2_marca3");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(100);
    obj.label9:setTop(30);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("Efeito:");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setLeft(150);
    obj.edit12:setTop(25);
    obj.edit12:setWidth(740);
    obj.edit12:setHeight(25);
    obj.edit12:setField("equip_arma2_desc");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setName("edit12");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(50);
    obj.layout4:setName("layout4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout4);
    obj.label10:setLeft(5);
    obj.label10:setTop(15);
    obj.label10:setWidth(95);
    obj.label10:setHeight(20);
    obj.label10:setText("Equipamento");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout4);
    obj.edit13:setLeft(100);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(300);
    obj.edit13:setHeight(25);
    obj.edit13:setField("equip_equipamento");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout4);
    obj.edit14:setLeft(400);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("equip_equipamento_act");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setLeft(440);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(150);
    obj.edit15:setHeight(25);
    obj.edit15:setField("equip_equipamento_marca1");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout4);
    obj.edit16:setLeft(590);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(150);
    obj.edit16:setHeight(25);
    obj.edit16:setField("equip_equipamento_marca2");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout4);
    obj.edit17:setLeft(740);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(150);
    obj.edit17:setHeight(25);
    obj.edit17:setField("equip_equipamento_marca3");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setName("edit17");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout4);
    obj.label11:setLeft(100);
    obj.label11:setTop(30);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("Efeito:");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout4);
    obj.edit18:setLeft(150);
    obj.edit18:setTop(25);
    obj.edit18:setWidth(740);
    obj.edit18:setHeight(25);
    obj.edit18:setField("equip_equipamento_desc");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setName("edit18");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(50);
    obj.layout5:setName("layout5");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout5);
    obj.label12:setLeft(5);
    obj.label12:setTop(15);
    obj.label12:setWidth(95);
    obj.label12:setHeight(20);
    obj.label12:setText("Vestimenta");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setLeft(100);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(300);
    obj.edit19:setHeight(25);
    obj.edit19:setField("equip_vestimenta");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout5);
    obj.edit20:setLeft(400);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setField("equip_vestimenta_act");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout5);
    obj.edit21:setLeft(440);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(150);
    obj.edit21:setHeight(25);
    obj.edit21:setField("equip_vestimenta_marca1");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout5);
    obj.edit22:setLeft(590);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(150);
    obj.edit22:setHeight(25);
    obj.edit22:setField("equip_vestimenta_marca2");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout5);
    obj.edit23:setLeft(740);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(150);
    obj.edit23:setHeight(25);
    obj.edit23:setField("equip_vestimenta_marca3");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setName("edit23");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout5);
    obj.label13:setLeft(100);
    obj.label13:setTop(30);
    obj.label13:setWidth(50);
    obj.label13:setHeight(20);
    obj.label13:setText("Efeito:");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout5);
    obj.edit24:setLeft(150);
    obj.edit24:setTop(25);
    obj.edit24:setWidth(740);
    obj.edit24:setHeight(25);
    obj.edit24:setField("equip_vestimenta_desc");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setName("edit24");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(900);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(310);
    obj.rectangle2:setHeight(110);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle2);
    obj.label14:setLeft(0);
    obj.label14:setTop(5);
    obj.label14:setWidth(310);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("Armazenamento");
    obj.label14:setName("label14");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle2);
    obj.comboBox1:setLeft(5);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(300);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("armazenamento1");
    obj.comboBox1:setItems({'', 'Coldre Pequeno', 'Coldre Grande'});
    obj.comboBox1:setValues({'0','3','6'});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle2);
    obj.comboBox2:setLeft(5);
    obj.comboBox2:setTop(55);
    obj.comboBox2:setWidth(300);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("armazenamento2");
    obj.comboBox2:setItems({'', 'Coldre Pequeno', 'Coldre Grande'});
    obj.comboBox2:setValues({'0','3','6'});
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle2);
    obj.comboBox3:setLeft(5);
    obj.comboBox3:setTop(80);
    obj.comboBox3:setWidth(300);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("armazenamento3");
    obj.comboBox3:setItems({'+0', '+1', '+2', '+3', '+4', '+5', '+6'});
    obj.comboBox3:setValues({'0','1','2','3','4','5','6'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setFields({'armazenamento1','armazenamento2','armazenamento3'});
    obj.dataLink1:setName("dataLink1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(230);
    obj.rectangle3:setWidth(1210);
    obj.rectangle3:setHeight(505);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle3);
    obj.label15:setLeft(5);
    obj.label15:setTop(5);
    obj.label15:setWidth(200);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Itens Guardados");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle3);
    obj.label16:setLeft(205);
    obj.label16:setTop(5);
    obj.label16:setWidth(700);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Efeitos Adicionais");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle3);
    obj.label17:setLeft(905);
    obj.label17:setTop(5);
    obj.label17:setWidth(150);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("Tipo");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle3);
    obj.label18:setLeft(1055);
    obj.label18:setTop(5);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("Qtd");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle3);
    obj.label19:setLeft(1105);
    obj.label19:setTop(5);
    obj.label19:setWidth(50);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Max");
    obj.label19:setName("label19");

    obj.rclInventario = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventario:setParent(obj.rectangle3);
    obj.rclInventario:setLeft(5);
    obj.rclInventario:setTop(30);
    obj.rclInventario:setWidth(1200);
    obj.rclInventario:setHeight(470);
    obj.rclInventario:setName("rclInventario");
    obj.rclInventario:setField("listaDeItens");
    obj.rclInventario:setTemplateForm("frmItem");
    obj.rclInventario:setLayout("vertical");
    obj.rclInventario:setMinQt(10);

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local armazenamento1 = (tonumber(sheet.armazenamento1) or 0);
            					local armazenamento2 = (tonumber(sheet.armazenamento2) or 0);
            					local armazenamento3 = (tonumber(sheet.armazenamento3) or 0);
            					local tamanho = 10 + armazenamento1 + armazenamento2 + armazenamento3;
            					sheet.inventarioTamanho = tamanho;
            					self.rclInventario.minQt = tamanho;
            
            					local objetos = NDB.getChildNodes(sheet.listaDeItens);
            
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

        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rclInventario ~= nil then self.rclInventario:destroy(); self.rclInventario = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
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
