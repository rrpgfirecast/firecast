require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmImperioDeJade2_svg()
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
    obj:setName("frmImperioDeJade2_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(872);
    obj.rectangle1:setHeight(1169);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(872);
    obj.image1:setHeight(1169);
    obj.image1:setSRC("/ImperioDeJade/images/2.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(44);
    obj.layout1:setTop(105);
    obj.layout1:setWidth(241);
    obj.layout1:setHeight(408);
    obj.layout1:setName("layout1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(241);
    obj.textEditor1:setHeight(408);
    obj.textEditor1:setFontSize(12);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Talentos");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(317);
    obj.layout2:setTop(118);
    obj.layout2:setWidth(239);
    obj.layout2:setHeight(59);
    obj.layout2:setName("layout2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(239);
    obj.textEditor2:setHeight(59);
    obj.textEditor2:setFontSize(12);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("Jutsus_basicos");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(317);
    obj.layout3:setTop(205);
    obj.layout3:setWidth(239);
    obj.layout3:setHeight(59);
    obj.layout3:setName("layout3");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout3);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(239);
    obj.textEditor3:setHeight(59);
    obj.textEditor3:setFontSize(12);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("Jutsus_medianos");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(317);
    obj.layout4:setTop(288);
    obj.layout4:setWidth(239);
    obj.layout4:setHeight(59);
    obj.layout4:setName("layout4");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout4);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(239);
    obj.textEditor4:setHeight(59);
    obj.textEditor4:setFontSize(12);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("Jutsus_avancados");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(317);
    obj.layout5:setTop(372);
    obj.layout5:setWidth(239);
    obj.layout5:setHeight(59);
    obj.layout5:setName("layout5");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout5);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(239);
    obj.textEditor5:setHeight(59);
    obj.textEditor5:setFontSize(12);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Jutsus_sublimes");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(317);
    obj.layout6:setTop(456);
    obj.layout6:setWidth(239);
    obj.layout6:setHeight(59);
    obj.layout6:setName("layout6");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout6);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(239);
    obj.textEditor6:setHeight(59);
    obj.textEditor6:setFontSize(12);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("Jutsus_lendarios");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(588);
    obj.layout7:setTop(105);
    obj.layout7:setWidth(241);
    obj.layout7:setHeight(408);
    obj.layout7:setName("layout7");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout7);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(241);
    obj.textEditor7:setHeight(408);
    obj.textEditor7:setFontSize(12);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("Equipamento");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(317);
    obj.layout8:setTop(574);
    obj.layout8:setWidth(240);
    obj.layout8:setHeight(135);
    obj.layout8:setName("layout8");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout8);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(240);
    obj.textEditor8:setHeight(135);
    obj.textEditor8:setFontSize(12);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setField("Idiomas");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setName("textEditor8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(70);
    obj.layout9:setTop(574);
    obj.layout9:setWidth(214);
    obj.layout9:setHeight(8);
    obj.layout9:setName("layout9");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout9);
    obj.textEditor9:setLeft(0);
    obj.textEditor9:setTop(0);
    obj.textEditor9:setWidth(214);
    obj.textEditor9:setHeight(8);
    obj.textEditor9:setFontSize(12);
    obj.textEditor9:setFontColor("#000000");
    obj.textEditor9:setField("Dinheiro_Yo");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setName("textEditor9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(70);
    obj.layout10:setTop(622);
    obj.layout10:setWidth(214);
    obj.layout10:setHeight(8);
    obj.layout10:setName("layout10");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout10);
    obj.textEditor10:setLeft(0);
    obj.textEditor10:setTop(0);
    obj.textEditor10:setWidth(214);
    obj.textEditor10:setHeight(8);
    obj.textEditor10:setFontSize(12);
    obj.textEditor10:setFontColor("#000000");
    obj.textEditor10:setField("Dinheiro_Yp");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setName("textEditor10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(70);
    obj.layout11:setTop(671);
    obj.layout11:setWidth(214);
    obj.layout11:setHeight(8);
    obj.layout11:setName("layout11");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout11);
    obj.textEditor11:setLeft(0);
    obj.textEditor11:setTop(0);
    obj.textEditor11:setWidth(214);
    obj.textEditor11:setHeight(8);
    obj.textEditor11:setFontSize(12);
    obj.textEditor11:setFontColor("#000000");
    obj.textEditor11:setField("Dinheiro_Y");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setName("textEditor11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(652);
    obj.layout12:setTop(575);
    obj.layout12:setWidth(176);
    obj.layout12:setHeight(8);
    obj.layout12:setName("layout12");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout12);
    obj.textEditor12:setLeft(0);
    obj.textEditor12:setTop(0);
    obj.textEditor12:setWidth(176);
    obj.textEditor12:setHeight(8);
    obj.textEditor12:setFontSize(12);
    obj.textEditor12:setFontColor("#000000");
    obj.textEditor12:setField("Campanha");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setName("textEditor12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(633);
    obj.layout13:setTop(596);
    obj.layout13:setWidth(195);
    obj.layout13:setHeight(8);
    obj.layout13:setName("layout13");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout13);
    obj.textEditor13:setLeft(0);
    obj.textEditor13:setTop(0);
    obj.textEditor13:setWidth(195);
    obj.textEditor13:setHeight(8);
    obj.textEditor13:setFontSize(12);
    obj.textEditor13:setFontColor("#000000");
    obj.textEditor13:setField("Mestre");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setName("textEditor13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(588);
    obj.layout14:setTop(633);
    obj.layout14:setWidth(240);
    obj.layout14:setHeight(37);
    obj.layout14:setName("layout14");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout14);
    obj.textEditor14:setLeft(0);
    obj.textEditor14:setTop(0);
    obj.textEditor14:setWidth(240);
    obj.textEditor14:setHeight(37);
    obj.textEditor14:setFontSize(12);
    obj.textEditor14:setFontColor("#000000");
    obj.textEditor14:setField("Outros_Jogadores");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setName("textEditor14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(643);
    obj.layout15:setTop(682);
    obj.layout15:setWidth(185);
    obj.layout15:setHeight(8);
    obj.layout15:setName("layout15");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout15);
    obj.textEditor15:setLeft(0);
    obj.textEditor15:setTop(0);
    obj.textEditor15:setWidth(185);
    obj.textEditor15:setHeight(8);
    obj.textEditor15:setFontSize(12);
    obj.textEditor15:setFontColor("#000000");
    obj.textEditor15:setField("XP_Atual");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setName("textEditor15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(717);
    obj.layout16:setTop(703);
    obj.layout16:setWidth(111);
    obj.layout16:setHeight(8);
    obj.layout16:setName("layout16");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout16);
    obj.textEditor16:setLeft(0);
    obj.textEditor16:setTop(0);
    obj.textEditor16:setWidth(111);
    obj.textEditor16:setHeight(8);
    obj.textEditor16:setFontSize(12);
    obj.textEditor16:setFontColor("#000000");
    obj.textEditor16:setField("XP_proximo_nivel");
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setName("textEditor16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(44);
    obj.layout17:setTop(768);
    obj.layout17:setWidth(250);
    obj.layout17:setHeight(142);
    obj.layout17:setName("layout17");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout17);
    obj.textEditor17:setLeft(0);
    obj.textEditor17:setTop(0);
    obj.textEditor17:setWidth(250);
    obj.textEditor17:setHeight(142);
    obj.textEditor17:setFontSize(12);
    obj.textEditor17:setFontColor("#000000");
    obj.textEditor17:setField("Notas1");
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setName("textEditor17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(580);
    obj.layout18:setTop(768);
    obj.layout18:setWidth(248);
    obj.layout18:setHeight(142);
    obj.layout18:setName("layout18");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout18);
    obj.textEditor18:setLeft(0);
    obj.textEditor18:setTop(0);
    obj.textEditor18:setWidth(248);
    obj.textEditor18:setHeight(142);
    obj.textEditor18:setFontSize(12);
    obj.textEditor18:setFontColor("#000000");
    obj.textEditor18:setField("Notas3");
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setName("textEditor18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(308);
    obj.layout19:setTop(768);
    obj.layout19:setWidth(255);
    obj.layout19:setHeight(142);
    obj.layout19:setName("layout19");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout19);
    obj.textEditor19:setLeft(0);
    obj.textEditor19:setTop(0);
    obj.textEditor19:setWidth(255);
    obj.textEditor19:setHeight(142);
    obj.textEditor19:setFontSize(12);
    obj.textEditor19:setFontColor("#000000");
    obj.textEditor19:setField("Notas2");
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setName("textEditor19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(44);
    obj.layout20:setTop(977);
    obj.layout20:setWidth(240);
    obj.layout20:setHeight(137);
    obj.layout20:setName("layout20");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout20);
    obj.textEditor20:setLeft(0);
    obj.textEditor20:setTop(0);
    obj.textEditor20:setWidth(240);
    obj.textEditor20:setHeight(137);
    obj.textEditor20:setFontSize(12);
    obj.textEditor20:setFontColor("#000000");
    obj.textEditor20:setField("historia");
    obj.textEditor20:setTransparent(true);
    obj.textEditor20:setName("textEditor20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(318);
    obj.layout21:setTop(977);
    obj.layout21:setWidth(237);
    obj.layout21:setHeight(137);
    obj.layout21:setName("layout21");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout21);
    obj.textEditor21:setLeft(0);
    obj.textEditor21:setTop(0);
    obj.textEditor21:setWidth(237);
    obj.textEditor21:setHeight(137);
    obj.textEditor21:setFontSize(12);
    obj.textEditor21:setFontColor("#000000");
    obj.textEditor21:setField("personalidade");
    obj.textEditor21:setTransparent(true);
    obj.textEditor21:setName("textEditor21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(588);
    obj.layout22:setTop(977);
    obj.layout22:setWidth(240);
    obj.layout22:setHeight(137);
    obj.layout22:setName("layout22");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout22);
    obj.textEditor22:setLeft(0);
    obj.textEditor22:setTop(0);
    obj.textEditor22:setWidth(240);
    obj.textEditor22:setHeight(137);
    obj.textEditor22:setFontSize(12);
    obj.textEditor22:setFontColor("#000000");
    obj.textEditor22:setField("aparencia");
    obj.textEditor22:setTransparent(true);
    obj.textEditor22:setName("textEditor22");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmImperioDeJade2_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmImperioDeJade2_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmImperioDeJade2_svg = {
    newEditor = newfrmImperioDeJade2_svg, 
    new = newfrmImperioDeJade2_svg, 
    name = "frmImperioDeJade2_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmImperioDeJade2_svg = _frmImperioDeJade2_svg;
Firecast.registrarForm(_frmImperioDeJade2_svg);

return _frmImperioDeJade2_svg;
