require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaOdisseia2_04_L_svg()
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
    obj:setName("frmFichaOdisseia2_04_L_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(952);
    obj.rectangle1:setHeight(1347);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(952);
    obj.image1:setHeight(1347);
    obj.image1:setSRC("FichaOdisseia2.0/images/7.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle1);
    obj.scrollBox2:setLeft(5);
    obj.scrollBox2:setTop(115);
    obj.scrollBox2:setWidth(952);
    obj.scrollBox2:setHeight(505);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox2);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Rolagem Habilidade");
    obj.button1:setWidth(190);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.scrollBox2);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmLRL");
    obj.rclListaDosItens:setLeft(1);
    obj.rclListaDosItens:setTop(40);
    obj.rclListaDosItens:setHeight(40);
    obj.rclListaDosItens:setWidth(950);
    obj.rclListaDosItens:setAutoHeight(true);

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle1);
    obj.scrollBox3:setLeft(5);
    obj.scrollBox3:setTop(625);
    obj.scrollBox3:setWidth(952);
    obj.scrollBox3:setHeight(600);
    obj.scrollBox3:setName("scrollBox3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox3);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("Rolagem Dano");
    obj.button2:setWidth(150);
    obj.button2:setAlign("left");
    obj.button2:setName("button2");

    obj.rclDano = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDano:setParent(obj.scrollBox3);
    obj.rclDano:setName("rclDano");
    obj.rclDano:setField("campoDano");
    obj.rclDano:setTemplateForm("frmLDL");
    obj.rclDano:setLeft(1);
    obj.rclDano:setTop(40);
    obj.rclDano:setHeight(40);
    obj.rclDano:setWidth(950);
    obj.rclDano:setAutoHeight(true);

    obj.boxDano = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDano:setParent(obj.scrollBox3);
    obj.boxDano:setName("boxDano");
    obj.boxDano:setVisible(false);
    obj.boxDano:setAlign("right");
    obj.boxDano:setWidth(400);
    obj.boxDano:setMargins({left=4, right=4});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDano);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setHeight(80);
    obj.rectangle2:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setAlign("left");
    obj.label1:setText("Nome do Dano:");
    obj.label1:setFontColor("white");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setMargins({left=5, right=5});
    obj.rectangle3:setName("rectangle3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle3);
    obj.edit1:setFontSize(18);
    obj.edit1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("Black");
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoDano");
    obj.edit1:setHitTest(true);
    obj.edit1:setHint("Título da Rolagem");
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(100);
    obj.layout4:setName("layout4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setLeft(60);
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setWidth(180);
    obj.rectangle4:setTop(3);
    obj.rectangle4:setMargins({left=2});
    obj.rectangle4:setName("rectangle4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle4);
    obj.edit2:setFontSize(16);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("Black");
    obj.edit2:setAlign("client");
    obj.edit2:setField("RolD");
    obj.edit2:setHitTest(true);
    obj.edit2:setHint("Dados de Dano");
    obj.edit2:setName("edit2");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout4);
    obj.rectangle5:setLeft(250);
    obj.rectangle5:setTop(3);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setMargins({left=2});
    obj.rectangle5:setName("rectangle5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle5);
    obj.edit3:setFontSize(16);
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setFontColor("Black");
    obj.edit3:setAlign("client");
    obj.edit3:setField("Mult");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setHitTest(true);
    obj.edit3:setHint("Multiplicador (Apenas em rolagens de Dano)");
    obj.edit3:setName("edit3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDosItens:append();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclDano:append();
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rclDano ~= nil then self.rclDano:destroy(); self.rclDano = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.boxDano ~= nil then self.boxDano:destroy(); self.boxDano = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaOdisseia2_04_L_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaOdisseia2_04_L_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaOdisseia2_04_L_svg = {
    newEditor = newfrmFichaOdisseia2_04_L_svg, 
    new = newfrmFichaOdisseia2_04_L_svg, 
    name = "frmFichaOdisseia2_04_L_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaOdisseia2_04_L_svg = _frmFichaOdisseia2_04_L_svg;
Firecast.registrarForm(_frmFichaOdisseia2_04_L_svg);

return _frmFichaOdisseia2_04_L_svg;
