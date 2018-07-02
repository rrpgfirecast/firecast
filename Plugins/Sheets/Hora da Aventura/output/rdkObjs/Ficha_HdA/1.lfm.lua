require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFicha_HdA1_svg()
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
    obj:setName("frmFicha_HdA1_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1077);
    obj.rectangle1:setHeight(1474);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1077);
    obj.image1:setHeight(1474);
    obj.image1:setSRC("/Ficha_HdA/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(58);
    obj.layout1:setTop(90);
    obj.layout1:setWidth(502);
    obj.layout1:setHeight(53);
    obj.layout1:setName("layout1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontSize(24);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(502);
    obj.edit1:setHeight(54);
    obj.edit1:setField("NOME");
    obj.edit1:setName("edit1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(57);
    obj.layout2:setTop(216);
    obj.layout2:setWidth(503);
    obj.layout2:setHeight(57);
    obj.layout2:setName("layout2");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(18);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(503);
    obj.textEditor1:setHeight(57);
    obj.textEditor1:setField("CONCEITO");
    obj.textEditor1:setName("textEditor1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(593);
    obj.layout3:setTop(305);
    obj.layout3:setWidth(409);
    obj.layout3:setHeight(147);
    obj.layout3:setName("layout3");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout3);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(18);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(409);
    obj.textEditor2:setHeight(147);
    obj.textEditor2:setField("HISTORICO");
    obj.textEditor2:setName("textEditor2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(595);
    obj.layout4:setTop(526);
    obj.layout4:setWidth(406);
    obj.layout4:setHeight(140);
    obj.layout4:setName("layout4");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout4);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(18);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(406);
    obj.textEditor3:setHeight(140);
    obj.textEditor3:setField("EQUIPAMENTO");
    obj.textEditor3:setName("textEditor3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(315);
    obj.layout5:setTop(695);
    obj.layout5:setWidth(80);
    obj.layout5:setHeight(80);
    obj.layout5:setName("layout5");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(50);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setType("number");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(70);
    obj.edit2:setField("ATRIBUTO1_5");
    obj.edit2:setName("edit2");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(636);
    obj.layout6:setTop(695);
    obj.layout6:setWidth(80);
    obj.layout6:setHeight(80);
    obj.layout6:setName("layout6");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(50);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(70);
    obj.edit3:setField("ATRIBUTO2_4");
    obj.edit3:setName("edit3");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(962);
    obj.layout7:setTop(695);
    obj.layout7:setWidth(80);
    obj.layout7:setHeight(80);
    obj.layout7:setName("layout7");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(50);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setType("number");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(70);
    obj.edit4:setField("ATRIBUTO3_3");
    obj.edit4:setName("edit4");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(120);
    obj.layout8:setTop(761);
    obj.layout8:setWidth(162);
    obj.layout8:setHeight(46);
    obj.layout8:setName("layout8");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(28);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(162);
    obj.edit5:setHeight(47);
    obj.edit5:setField("ATRIBUTO1");
    obj.edit5:setName("edit5");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(446);
    obj.layout9:setTop(760);
    obj.layout9:setWidth(162);
    obj.layout9:setHeight(46);
    obj.layout9:setName("layout9");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(28);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(162);
    obj.edit6:setHeight(47);
    obj.edit6:setField("ATRIBUTO2");
    obj.edit6:setName("edit6");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(769);
    obj.layout10:setTop(756);
    obj.layout10:setWidth(162);
    obj.layout10:setHeight(46);
    obj.layout10:setName("layout10");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(28);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(162);
    obj.edit7:setHeight(47);
    obj.edit7:setField("ATRIBUTO3");
    obj.edit7:setName("edit7");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(867);
    obj.layout11:setTop(1138);
    obj.layout11:setWidth(42);
    obj.layout11:setHeight(27);
    obj.layout11:setName("layout11");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout11);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(20);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setType("number");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(42);
    obj.edit8:setHeight(28);
    obj.edit8:setField("PE");
    obj.edit8:setName("edit8");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(67);
    obj.layout12:setTop(886);
    obj.layout12:setWidth(269);
    obj.layout12:setHeight(196);
    obj.layout12:setName("layout12");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout12);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(269);
    obj.textEditor4:setHeight(196);
    obj.textEditor4:setFontSize(18);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setField("PROEZA1");
    obj.textEditor4:setName("textEditor4");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(393);
    obj.layout13:setTop(888);
    obj.layout13:setWidth(269);
    obj.layout13:setHeight(196);
    obj.layout13:setName("layout13");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout13);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(269);
    obj.textEditor5:setHeight(196);
    obj.textEditor5:setFontSize(18);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setField("PROEZA2");
    obj.textEditor5:setName("textEditor5");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(717);
    obj.layout14:setTop(886);
    obj.layout14:setWidth(269);
    obj.layout14:setHeight(196);
    obj.layout14:setName("layout14");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout14);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(269);
    obj.textEditor6:setHeight(196);
    obj.textEditor6:setFontSize(18);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setField("PROEZA3");
    obj.textEditor6:setName("textEditor6");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(54);
    obj.layout15:setTop(1158);
    obj.layout15:setWidth(282);
    obj.layout15:setHeight(130);
    obj.layout15:setName("layout15");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout15);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(282);
    obj.textEditor7:setHeight(130);
    obj.textEditor7:setFontSize(18);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setField("DEFEITO");
    obj.textEditor7:setName("textEditor7");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(492);
    obj.layout16:setTop(1195);
    obj.layout16:setWidth(50);
    obj.layout16:setHeight(50);
    obj.layout16:setName("layout16");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout16);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(36);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setType("number");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(70);
    obj.edit9:setHeight(70);
    obj.edit9:setField("PH");
    obj.edit9:setName("edit9");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(798);
    obj.layout17:setTop(1248);
    obj.layout17:setWidth(20);
    obj.layout17:setHeight(20);
    obj.layout17:setName("layout17");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout17);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("VIDA1");
    obj.checkBox1:setName("checkBox1");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(857);
    obj.layout18:setTop(1248);
    obj.layout18:setWidth(20);
    obj.layout18:setHeight(20);
    obj.layout18:setName("layout18");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout18);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setField("VIDA2");
    obj.checkBox2:setName("checkBox2");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(916);
    obj.layout19:setTop(1248);
    obj.layout19:setWidth(20);
    obj.layout19:setHeight(20);
    obj.layout19:setName("layout19");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout19);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setField("VIDA3");
    obj.checkBox3:setName("checkBox3");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(974);
    obj.layout20:setTop(1248);
    obj.layout20:setWidth(20);
    obj.layout20:setHeight(20);
    obj.layout20:setName("layout20");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout20);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setHeight(20);
    obj.checkBox4:setField("VIDA4");
    obj.checkBox4:setName("checkBox4");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(115);
    obj.layout21:setTop(1387);
    obj.layout21:setWidth(197);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout21);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(16.5);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(197);
    obj.edit10:setHeight(26);
    obj.edit10:setField("ESTADO1");
    obj.edit10:setName("edit10");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(431);
    obj.layout22:setTop(1387);
    obj.layout22:setWidth(197);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout22);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(16.5);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(197);
    obj.edit11:setHeight(26);
    obj.edit11:setField("ESTADO2");
    obj.edit11:setName("edit11");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(744);
    obj.layout23:setTop(1387);
    obj.layout23:setWidth(197);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout23);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(16.5);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(197);
    obj.edit12:setHeight(26);
    obj.edit12:setField("ESTADO3");
    obj.edit12:setName("edit12");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(190);
    obj.layout24:setTop(340);
    obj.layout24:setWidth(290);
    obj.layout24:setHeight(290);
    obj.layout24:setName("layout24");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout24);
    obj.image2:setEditable(true);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(290);
    obj.image2:setHeight(290);
    obj.image2:setStyle("proportional");
    obj.image2:setField("IMG");
    obj.image2:setName("image2");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFicha_HdA1_svg = {
    newEditor = newfrmFicha_HdA1_svg, 
    new = newfrmFicha_HdA1_svg, 
    name = "frmFicha_HdA1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha_HdA1_svg = _frmFicha_HdA1_svg;
rrpg.registrarForm(_frmFicha_HdA1_svg);

return _frmFicha_HdA1_svg;
