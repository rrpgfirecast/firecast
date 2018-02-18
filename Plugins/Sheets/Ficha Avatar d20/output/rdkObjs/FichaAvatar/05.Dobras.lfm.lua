require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmDobras()
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
    obj:setName("frmDobras");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.popDobra = gui.fromHandle(_obj_newObject("popup"));
    obj.popDobra:setParent(obj);
    obj.popDobra:setName("popDobra");
    obj.popDobra:setWidth(250);
    obj.popDobra:setHeight(250);
    obj.popDobra:setBackOpacity(0.4);

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popDobra);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.popTecnica = gui.fromHandle(_obj_newObject("popup"));
    obj.popTecnica:setParent(obj);
    obj.popTecnica:setName("popTecnica");
    obj.popTecnica:setWidth(250);
    obj.popTecnica:setHeight(250);
    obj.popTecnica:setBackOpacity(0.4);

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popTecnica);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(125);
    obj.flowPart1:setMaxWidth(250);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Duração");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("duracao");
    obj.edit1:setFontSize(12);
    obj.edit1:setName("edit1");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(125);
    obj.flowPart2:setMaxWidth(250);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("CD");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("cd");
    obj.edit2:setFontSize(12);
    obj.edit2:setName("edit2");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(125);
    obj.flowPart3:setMaxWidth(250);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("Material");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("material");
    obj.edit3:setFontSize(12);
    obj.edit3:setName("edit3");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popTecnica);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(335);
    obj.layout1:setHeight(600);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(5);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(335);
    obj.label4:setHeight(20);
    obj.label4:setText("TECNICAS");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(5);
    obj.label5:setTop(25);
    obj.label5:setWidth(150);
    obj.label5:setHeight(20);
    obj.label5:setText("TIPO");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setLeft(155);
    obj.label6:setTop(25);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setText("NÍVEL");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setLeft(205);
    obj.label7:setTop(25);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("PT");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.rclListaDasDobras = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasDobras:setParent(obj.layout1);
    obj.rclListaDasDobras:setName("rclListaDasDobras");
    obj.rclListaDasDobras:setField("campoDasDobras");
    obj.rclListaDasDobras:setTemplateForm("frmDobra");
    obj.rclListaDasDobras:setLeft(5);
    obj.rclListaDasDobras:setTop(50);
    obj.rclListaDasDobras:setWidth(320);
    obj.rclListaDasDobras:setHeight(545);
    obj.rclListaDasDobras:setLayout("vertical");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(345);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(335);
    obj.layout2:setHeight(600);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0000007F");
    obj.rectangle2:setName("rectangle2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("+");
    obj.button2:setLeft(5);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(335);
    obj.label8:setHeight(20);
    obj.label8:setText("TECNICAS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(5);
    obj.label9:setTop(25);
    obj.label9:setWidth(150);
    obj.label9:setHeight(20);
    obj.label9:setText("TIPO");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(155);
    obj.label10:setTop(25);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("NÍVEL");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(205);
    obj.label11:setTop(25);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("PT");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.rclListaDasTecnicas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTecnicas:setParent(obj.layout2);
    obj.rclListaDasTecnicas:setName("rclListaDasTecnicas");
    obj.rclListaDasTecnicas:setField("campoDasTecnicas");
    obj.rclListaDasTecnicas:setTemplateForm("frmTecnica");
    obj.rclListaDasTecnicas:setLeft(5);
    obj.rclListaDasTecnicas:setTop(50);
    obj.rclListaDasTecnicas:setWidth(320);
    obj.rclListaDasTecnicas:setHeight(545);
    obj.rclListaDasTecnicas:setLayout("vertical");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(690);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(335);
    obj.layout3:setHeight(600);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#0000007F");
    obj.rectangle3:setName("rectangle3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setText("+");
    obj.button3:setLeft(5);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setLeft(0);
    obj.label12:setTop(0);
    obj.label12:setWidth(335);
    obj.label12:setHeight(20);
    obj.label12:setText("TECNICAS AVANÇADAS");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(5);
    obj.label13:setTop(25);
    obj.label13:setWidth(150);
    obj.label13:setHeight(20);
    obj.label13:setText("TIPO");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(155);
    obj.label14:setTop(25);
    obj.label14:setWidth(50);
    obj.label14:setHeight(20);
    obj.label14:setText("NÍVEL");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(205);
    obj.label15:setTop(25);
    obj.label15:setWidth(50);
    obj.label15:setHeight(20);
    obj.label15:setText("PT");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.rclListaDasTecnicasAvancadas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTecnicasAvancadas:setParent(obj.layout3);
    obj.rclListaDasTecnicasAvancadas:setName("rclListaDasTecnicasAvancadas");
    obj.rclListaDasTecnicasAvancadas:setField("campoDasTecnicasAvancadas");
    obj.rclListaDasTecnicasAvancadas:setTemplateForm("frmTecnica");
    obj.rclListaDasTecnicasAvancadas:setLeft(5);
    obj.rclListaDasTecnicasAvancadas:setTop(50);
    obj.rclListaDasTecnicasAvancadas:setWidth(320);
    obj.rclListaDasTecnicasAvancadas:setHeight(545);
    obj.rclListaDasTecnicasAvancadas:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDasDobras:append();
        end, obj);

    obj._e_event1 = obj.rclListaDasDobras:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclListaDasTecnicas:append();
        end, obj);

    obj._e_event3 = obj.rclListaDasTecnicas:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclListaDasTecnicasAvancadas:append();
        end, obj);

    obj._e_event5 = obj.rclListaDasTecnicasAvancadas:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.popTecnica ~= nil then self.popTecnica:destroy(); self.popTecnica = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rclListaDasTecnicas ~= nil then self.rclListaDasTecnicas:destroy(); self.rclListaDasTecnicas = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.popDobra ~= nil then self.popDobra:destroy(); self.popDobra = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rclListaDasDobras ~= nil then self.rclListaDasDobras:destroy(); self.rclListaDasDobras = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rclListaDasTecnicasAvancadas ~= nil then self.rclListaDasTecnicasAvancadas:destroy(); self.rclListaDasTecnicasAvancadas = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmDobras = {
    newEditor = newfrmDobras, 
    new = newfrmDobras, 
    name = "frmDobras", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDobras = _frmDobras;
rrpg.registrarForm(_frmDobras);

return _frmDobras;
