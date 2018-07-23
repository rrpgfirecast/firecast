require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGeneral()
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
    obj:setName("frmGeneral");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(410);
    obj.rectangle1:setHeight(110);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setText("NOME");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(100);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setText("TIPO");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(100);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(300);
    obj.edit2:setHeight(25);
    obj.edit2:setField("tipo");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(5);
    obj.label3:setTop(55);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("DESCRITOR");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(100);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(300);
    obj.edit3:setHeight(25);
    obj.edit3:setField("descritor");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(5);
    obj.label4:setTop(80);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("FOCO");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(100);
    obj.edit4:setTop(80);
    obj.edit4:setWidth(300);
    obj.edit4:setHeight(25);
    obj.edit4:setField("foco");
    obj.edit4:setName("edit4");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(120);
    obj.rectangle2:setWidth(410);
    obj.rectangle2:setHeight(300);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle2);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adicionar Antecedente");
    obj.button1:setName("button1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(35);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("ANTECEDENTE");
    obj.label5:setName("label5");

    obj.rclAntecedente = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAntecedente:setParent(obj.rectangle2);
    obj.rclAntecedente:setLeft(5);
    obj.rclAntecedente:setTop(30);
    obj.rclAntecedente:setWidth(400);
    obj.rclAntecedente:setHeight(260);
    obj.rclAntecedente:setName("rclAntecedente");
    obj.rclAntecedente:setField("listaDeAntecedentes");
    obj.rclAntecedente:setTemplateForm("frmSimpleListItem");
    obj.rclAntecedente:setLayout("verticalTiles");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(420);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(410);
    obj.rectangle3:setHeight(300);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle3);
    obj.button2:setLeft(5);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Adicionar Habilidade Especial");
    obj.button2:setName("button2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle3);
    obj.label6:setLeft(35);
    obj.label6:setTop(5);
    obj.label6:setWidth(200);
    obj.label6:setHeight(25);
    obj.label6:setText("HABILIDADES ESPECIAIS");
    obj.label6:setName("label6");

    obj.rclHabilidadesEspeciais = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesEspeciais:setParent(obj.rectangle3);
    obj.rclHabilidadesEspeciais:setLeft(5);
    obj.rclHabilidadesEspeciais:setTop(30);
    obj.rclHabilidadesEspeciais:setWidth(400);
    obj.rclHabilidadesEspeciais:setHeight(260);
    obj.rclHabilidadesEspeciais:setName("rclHabilidadesEspeciais");
    obj.rclHabilidadesEspeciais:setField("listaDeHabilidadesEspeciais");
    obj.rclHabilidadesEspeciais:setTemplateForm("frmSimpleListItem");
    obj.rclHabilidadesEspeciais:setLayout("verticalTiles");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(420);
    obj.rectangle4:setTop(310);
    obj.rectangle4:setWidth(410);
    obj.rectangle4:setHeight(120);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle4);
    obj.label7:setLeft(35);
    obj.label7:setTop(5);
    obj.label7:setWidth(200);
    obj.label7:setHeight(25);
    obj.label7:setText("DESENVOLVIMENTO");
    obj.label7:setName("label7");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle4);
    obj.checkBox1:setField("desenvolvimento0");
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(35);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setText("AUMENTAR HABILIDADES");
    obj.checkBox1:setHint("4 pontos nos atributos.");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle4);
    obj.checkBox2:setField("desenvolvimento1");
    obj.checkBox2:setLeft(5);
    obj.checkBox2:setTop(55);
    obj.checkBox2:setWidth(200);
    obj.checkBox2:setText("IR EM DIREÇÃO A PERFEIÇÃO.");
    obj.checkBox2:setHint("Adicione um a uma de suas margens. ");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle4);
    obj.checkBox3:setField("desenvolvimento2");
    obj.checkBox3:setLeft(5);
    obj.checkBox3:setTop(75);
    obj.checkBox3:setWidth(200);
    obj.checkBox3:setText("ESFORÇO EXTRA.");
    obj.checkBox3:setHint("Aumente esforço em 1.");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle4);
    obj.checkBox4:setField("desenvolvimento3");
    obj.checkBox4:setLeft(5);
    obj.checkBox4:setTop(95);
    obj.checkBox4:setWidth(200);
    obj.checkBox4:setText("TREINAMENTO DE PERICIAS.");
    obj.checkBox4:setHint("Torne-se treinado em uma perícia a sua escolha, ou especialize-se em uma que já for treinado. ");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.rectangle4);
    obj.checkBox5:setField("desenvolvimento4");
    obj.checkBox5:setLeft(205);
    obj.checkBox5:setTop(35);
    obj.checkBox5:setWidth(70);
    obj.checkBox5:setText("OUTRO");
    obj.checkBox5:setName("checkBox5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle4);
    obj.edit5:setLeft(275);
    obj.edit5:setTop(35);
    obj.edit5:setWidth(125);
    obj.edit5:setHeight(20);
    obj.edit5:setField("outroDesenvolvimento4");
    obj.edit5:setFontSize(11);
    obj.edit5:setName("edit5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.rectangle4);
    obj.checkBox6:setField("desenvolvimento5");
    obj.checkBox6:setLeft(205);
    obj.checkBox6:setTop(55);
    obj.checkBox6:setWidth(70);
    obj.checkBox6:setText("OUTRO");
    obj.checkBox6:setName("checkBox6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle4);
    obj.edit6:setLeft(275);
    obj.edit6:setTop(55);
    obj.edit6:setWidth(125);
    obj.edit6:setHeight(20);
    obj.edit6:setField("outroDesenvolvimento5");
    obj.edit6:setFontSize(11);
    obj.edit6:setName("edit6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.rectangle4);
    obj.checkBox7:setField("desenvolvimento6");
    obj.checkBox7:setLeft(205);
    obj.checkBox7:setTop(75);
    obj.checkBox7:setWidth(70);
    obj.checkBox7:setText("OUTRO");
    obj.checkBox7:setName("checkBox7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle4);
    obj.edit7:setLeft(275);
    obj.edit7:setTop(75);
    obj.edit7:setWidth(125);
    obj.edit7:setHeight(20);
    obj.edit7:setField("outroDesenvolvimento6");
    obj.edit7:setFontSize(11);
    obj.edit7:setName("edit7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.rectangle4);
    obj.checkBox8:setField("desenvolvimento7");
    obj.checkBox8:setLeft(205);
    obj.checkBox8:setTop(95);
    obj.checkBox8:setWidth(70);
    obj.checkBox8:setText("OUTRO");
    obj.checkBox8:setName("checkBox8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle4);
    obj.edit8:setLeft(275);
    obj.edit8:setTop(95);
    obj.edit8:setWidth(125);
    obj.edit8:setHeight(20);
    obj.edit8:setField("outroDesenvolvimento7");
    obj.edit8:setFontSize(11);
    obj.edit8:setName("edit8");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(840);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(362);
    obj.rectangle5:setHeight(362);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(841);
    obj.image1:setTop(1);
    obj.image1:setWidth(360);
    obj.image1:setHeight(360);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclAntecedente:append();
        end, obj);

    obj._e_event1 = obj.rclAntecedente:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclHabilidadesEspeciais:append();
        end, obj);

    obj._e_event3 = obj.rclHabilidadesEspeciais:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event4 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.rclAntecedente ~= nil then self.rclAntecedente:destroy(); self.rclAntecedente = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclHabilidadesEspeciais ~= nil then self.rclHabilidadesEspeciais:destroy(); self.rclHabilidadesEspeciais = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGeneral()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGeneral();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGeneral = {
    newEditor = newfrmGeneral, 
    new = newfrmGeneral, 
    name = "frmGeneral", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeneral = _frmGeneral;
Firecast.registrarForm(_frmGeneral);

return _frmGeneral;
