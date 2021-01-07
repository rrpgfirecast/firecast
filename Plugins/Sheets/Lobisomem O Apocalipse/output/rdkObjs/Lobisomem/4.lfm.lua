require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frma4_svg()
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
    obj:setName("frma4_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1369);
    obj.rectangle1:setHeight(1937);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1369);
    obj.image1:setHeight(1937);
    obj.image1:setSRC("/Lobisomem/images/pre.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(111);
    obj.layout1:setTop(362);
    obj.layout1:setWidth(1150);
    obj.layout1:setHeight(495);
    obj.layout1:setName("layout1");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout1);
    obj.richEdit1:setLeft(0);
    obj.richEdit1:setTop(0);
    obj.richEdit1:setWidth(1150);
    obj.richEdit1:setHeight(496);
    obj.richEdit1:setField("Prelœdio_1");
    obj.richEdit1:setName("richEdit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(174);
    obj.layout2:setTop(914);
    obj.layout2:setWidth(247);
    obj.layout2:setHeight(33);
    obj.layout2:setName("layout2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(22.6);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(247);
    obj.edit1:setHeight(34);
    obj.edit1:setField("Idade");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(202);
    obj.layout3:setTop(947);
    obj.layout3:setWidth(220);
    obj.layout3:setHeight(33);
    obj.layout3:setName("layout3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(22.6);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(220);
    obj.edit2:setHeight(34);
    obj.edit2:setField("Cabelos");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(188);
    obj.layout4:setTop(979);
    obj.layout4:setWidth(233);
    obj.layout4:setHeight(33);
    obj.layout4:setName("layout4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(22.6);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(233);
    obj.edit3:setHeight(34);
    obj.edit3:setField("Olhos");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(174);
    obj.layout5:setTop(1012);
    obj.layout5:setWidth(247);
    obj.layout5:setHeight(33);
    obj.layout5:setName("layout5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(22.6);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(247);
    obj.edit4:setHeight(34);
    obj.edit4:setField("Raça");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(274);
    obj.layout6:setTop(1045);
    obj.layout6:setWidth(147);
    obj.layout6:setHeight(33);
    obj.layout6:setName("layout6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(22.6);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(147);
    obj.edit5:setHeight(34);
    obj.edit5:setField("Nacionalidade");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(453);
    obj.layout7:setTop(914);
    obj.layout7:setWidth(799);
    obj.layout7:setHeight(230);
    obj.layout7:setName("layout7");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout7);
    obj.richEdit2:setLeft(0);
    obj.richEdit2:setTop(0);
    obj.richEdit2:setWidth(799);
    obj.richEdit2:setHeight(231);
    obj.richEdit2:setField("_1_3");
    obj.richEdit2:setName("richEdit2");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(169);
    obj.layout8:setTop(1077);
    obj.layout8:setWidth(252);
    obj.layout8:setHeight(33);
    obj.layout8:setName("layout8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(22.6);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(252);
    obj.edit6:setHeight(34);
    obj.edit6:setField("Sexo");
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(241);
    obj.layout9:setTop(1142);
    obj.layout9:setWidth(82);
    obj.layout9:setHeight(33);
    obj.layout9:setName("layout9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(22.6);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(82);
    obj.edit7:setHeight(34);
    obj.edit7:setField("Hominídeo");
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(340);
    obj.layout10:setTop(1142);
    obj.layout10:setWidth(82);
    obj.layout10:setHeight(33);
    obj.layout10:setName("layout10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(22.6);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(82);
    obj.edit8:setHeight(34);
    obj.edit8:setField("undefined_8");
    obj.edit8:setName("edit8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(200);
    obj.layout11:setTop(1175);
    obj.layout11:setWidth(123);
    obj.layout11:setHeight(33);
    obj.layout11:setName("layout11");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout11);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(22.6);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(123);
    obj.edit9:setHeight(34);
    obj.edit9:setField("Glabro");
    obj.edit9:setName("edit9");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(340);
    obj.layout12:setTop(1175);
    obj.layout12:setWidth(82);
    obj.layout12:setHeight(33);
    obj.layout12:setName("layout12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout12);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(22.6);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(82);
    obj.edit10:setHeight(34);
    obj.edit10:setField("undefined_9");
    obj.edit10:setName("edit10");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(453);
    obj.layout13:setTop(1175);
    obj.layout13:setWidth(799);
    obj.layout13:setHeight(65);
    obj.layout13:setName("layout13");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout13);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(23);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(799);
    obj.textEditor1:setHeight(66);
    obj.textEditor1:setField("Altura__Peso_2");
    obj.textEditor1:setName("textEditor1");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(188);
    obj.layout14:setTop(1207);
    obj.layout14:setWidth(137);
    obj.layout14:setHeight(33);
    obj.layout14:setName("layout14");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout14);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(22.6);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(137);
    obj.edit11:setHeight(34);
    obj.edit11:setField("Crinos");
    obj.edit11:setName("edit11");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(340);
    obj.layout15:setTop(1207);
    obj.layout15:setWidth(82);
    obj.layout15:setHeight(33);
    obj.layout15:setName("layout15");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout15);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(22.6);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(82);
    obj.edit12:setHeight(34);
    obj.edit12:setField("undefined_10");
    obj.edit12:setName("edit12");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(186);
    obj.layout16:setTop(1240);
    obj.layout16:setWidth(137);
    obj.layout16:setHeight(33);
    obj.layout16:setName("layout16");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout16);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(22.6);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(137);
    obj.edit13:setHeight(34);
    obj.edit13:setField("Hispo");
    obj.edit13:setName("edit13");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(340);
    obj.layout17:setTop(1240);
    obj.layout17:setWidth(82);
    obj.layout17:setHeight(33);
    obj.layout17:setName("layout17");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout17);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(22.6);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(82);
    obj.edit14:setHeight(34);
    obj.edit14:setField("undefined_11");
    obj.edit14:setName("edit14");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(743);
    obj.layout18:setTop(1240);
    obj.layout18:setWidth(509);
    obj.layout18:setHeight(66);
    obj.layout18:setName("layout18");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout18);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(23);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(509);
    obj.textEditor2:setHeight(67);
    obj.textEditor2:setField("Deformidades_de_Impuro");
    obj.textEditor2:setName("textEditor2");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(199);
    obj.layout19:setTop(1272);
    obj.layout19:setWidth(123);
    obj.layout19:setHeight(33);
    obj.layout19:setName("layout19");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout19);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(22.6);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(123);
    obj.edit15:setHeight(34);
    obj.edit15:setField("Lupino");
    obj.edit15:setName("edit15");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(340);
    obj.layout20:setTop(1272);
    obj.layout20:setWidth(82);
    obj.layout20:setHeight(33);
    obj.layout20:setName("layout20");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout20);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(22.6);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(82);
    obj.edit16:setHeight(34);
    obj.edit16:setField("undefined_12");
    obj.edit16:setName("edit16");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(104);
    obj.layout21:setTop(1430.4);
    obj.layout21:setWidth(574);
    obj.layout21:setHeight(405.6);
    obj.layout21:setName("layout21");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout21);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(574);
    obj.textEditor3:setHeight(405.6);
    obj.textEditor3:setFontSize(23);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("Relações_da_matilha");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(695);
    obj.layout22:setTop(1430.4);
    obj.layout22:setWidth(557);
    obj.layout22:setHeight(405.6);
    obj.layout22:setName("layout22");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout22);
    obj.image2:setField("imagemDoPersonagem");
    obj.image2:setEditable(true);
    obj.image2:setStyle("proportional");
    obj.image2:setAlign("client");
    obj.image2:setName("image2");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrma4_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frma4_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frma4_svg = {
    newEditor = newfrma4_svg, 
    new = newfrma4_svg, 
    name = "frma4_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frma4_svg = _frma4_svg;
Firecast.registrarForm(_frma4_svg);

return _frma4_svg;
