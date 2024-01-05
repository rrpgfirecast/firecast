require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMagia()
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
    obj:setName("frmMagia");
    obj:setHeight(255);
    obj:setMargins({top=10,bottom=-0});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setText("Spell");
    obj.button1:setTop(0);
    obj.button1:setLeft(0);
    obj.button1:setWidth(230);
    obj.button1:setName("button1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setField("nomeMagia");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setTop(20);
    obj.edit1:setLeft(0);
    obj.edit1:setWidth(230);
    obj.edit1:setName("edit1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Tradition");
    obj.label1:setLeft(265);
    obj.label1:setTop(0);
    obj.label1:setName("label1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setField("Tradicao");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setTop(20);
    obj.edit2:setLeft(230);
    obj.edit2:setWidth(120);
    obj.edit2:setName("edit2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setText("Type");
    obj.label2:setLeft(0);
    obj.label2:setTop(60);
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setField("escTipo");
    obj.comboBox1:setTop(50);
    obj.comboBox1:setLeft(35);
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setHeight(40);
    obj.comboBox1:setItems({'Utility', 'Attack'});
    obj.comboBox1:setName("comboBox1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setText("Rank");
    obj.label3:setLeft(100);
    obj.label3:setTop(60);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setField("NivelMagia");
    obj.edit3:setTop(50);
    obj.edit3:setLeft(135);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(40);
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setText("Attribute");
    obj.label4:setLeft(170);
    obj.label4:setTop(60);
    obj.label4:setName("label4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj);
    obj.comboBox2:setField("escAtributo");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setTop(50);
    obj.comboBox2:setLeft(230);
    obj.comboBox2:setWidth(120);
    obj.comboBox2:setHeight(40);
    obj.comboBox2:setItems({'Intellect', 'Will', 'None'});
    obj.comboBox2:setName("comboBox2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setText("Duration");
    obj.label5:setLeft(0);
    obj.label5:setTop(100);
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setField("Duracao");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTop(90);
    obj.edit4:setLeft(55);
    obj.edit4:setWidth(80);
    obj.edit4:setHeight(40);
    obj.edit4:setName("edit4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setText("Target");
    obj.label6:setLeft(140);
    obj.label6:setTop(100);
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setField("Alvo");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setTop(90);
    obj.edit5:setLeft(180);
    obj.edit5:setWidth(170);
    obj.edit5:setHeight(40);
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setText("Area");
    obj.label7:setLeft(0);
    obj.label7:setTop(140);
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setField("Area");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setTop(130);
    obj.edit6:setLeft(35);
    obj.edit6:setWidth(160);
    obj.edit6:setHeight(40);
    obj.edit6:setName("edit6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj);
    obj.label8:setText("Castings");
    obj.label8:setLeft(205);
    obj.label8:setTop(140);
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setField("qtdConjuracao");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setTop(130);
    obj.edit7:setLeft(260);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(40);
    obj.edit7:setName("edit7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj);
    obj.label9:setText("/");
    obj.label9:setLeft(303);
    obj.label9:setTop(140);
    obj.label9:setName("label9");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj);
    obj.edit8:setField("maxConjuracao");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setTop(130);
    obj.edit8:setLeft(320);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(40);
    obj.edit8:setName("edit8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj);
    obj.label10:setText("qtd");
    obj.label10:setLeft(267);
    obj.label10:setTop(125);
    obj.label10:setFontSize(8);
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj);
    obj.label11:setText("max");
    obj.label11:setLeft(327);
    obj.label11:setTop(125);
    obj.label11:setFontSize(8);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj);
    obj.label12:setText("Description");
    obj.label12:setLeft(0);
    obj.label12:setTop(175);
    obj.label12:setName("label12");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj);
    obj.textEditor1:setField("descMagia");
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(195);
    obj.textEditor1:setWidth(320);
    obj.textEditor1:setName("textEditor1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(245);
    obj.rectangle1:setColor("gray");
    obj.rectangle1:setWidth(350);
    obj.rectangle1:setHeight(5);
    obj.rectangle1:setName("rectangle1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setText("Del");
    obj.button2:setWidth(30);
    obj.button2:setLeft(320);
    obj.button2:setTop(195);
    obj.button2:setHeight(50);
    obj.button2:setName("button2");


        local function ligarMagia()
            if sheet.nomeMagia ~= nil then
                local magia = sheet.nomeMagia;
                local tradicao = sheet.Tradicao;
                local nivel = sheet.nivelMagia;
                local duracao = sheet.Duracao;
                local alvo = sheet.Alvo;
                local area = sheet.Area;
                local descricao = sheet.descMagia;

                if tradicao == nil then
                    tradicao = " ";
                end;

                if nivel == nil then
                    nivel = " ";
                end;


                local mesaDeRPG = Firecast.getMesaDe(sheet);
                mesaDeRPG.chat:enviarMensagem(magia .. " ( " .. tradicao .. " ) Nível - " .. nivel);
                if duracao ~= nil then
                    mesaDeRPG.chat:enviarMensagem("Duração: " .. duracao);
                end;
                if alvo ~= nil then
                    mesaDeRPG.chat:enviarMensagem("Alvo: " .. alvo);
                end;
                if area ~= nil then
                    mesaDeRPG.chat:enviarMensagem("Área: " .. area);
                end; 
                if descricao ~= nil then
                    mesaDeRPG.chat:enviarMensagem("--------------------");
                    mesaDeRPG.chat:enviarMensagem(descricao);
                    mesaDeRPG.chat:enviarMensagem("--------------------");
                end;               
            end;
        end;


    


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            ligarMagia()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
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

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMagia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMagia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMagia = {
    newEditor = newfrmMagia, 
    new = newfrmMagia, 
    name = "frmMagia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagia = _frmMagia;
Firecast.registrarForm(_frmMagia);

return _frmMagia;
