require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAnimal()
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
    obj:setName("frmAnimal");
    obj:setHeight(800);
    obj:setWidth(1200);
    obj:setTheme("light");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(1200);
    obj.rectangle1:setHeight(800);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setXradius(8);
    obj.rectangle1:setYradius(8);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(600);
    obj.layout1:setHeight(800);
    obj.layout1:setName("layout1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout1);
    obj.image1:setWidth(600);
    obj.image1:setHeight(400);
    obj.image1:setLeft(10);
    obj.image1:setTop(140);
    obj.image1:setStyle("proportional");
    obj.image1:setCenter(true);
    obj.image1:setSRC("/DZ_Ficha2.0/images/FichaPET.png");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("Pet_Nick");
    obj.edit1:setWidth(500);
    obj.edit1:setHeight(60);
    obj.edit1:setTop(150);
    obj.edit1:setLeft(100);
    obj.edit1:setFontSize(30);
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setField("Pet_Fisico");
    obj.edit2:setWidth(40);
    obj.edit2:setHeight(30);
    obj.edit2:setTop(208);
    obj.edit2:setLeft(180);
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setField("Pet_Social");
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(30);
    obj.edit3:setTop(240);
    obj.edit3:setLeft(180);
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setField("Pet_Inteligencia");
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(30);
    obj.edit4:setTop(270);
    obj.edit4:setLeft(180);
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setField("Pet_Percep");
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(30);
    obj.edit5:setTop(310);
    obj.edit5:setLeft(180);
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setField("Pet_Espiritual");
    obj.edit6:setWidth(40);
    obj.edit6:setHeight(30);
    obj.edit6:setTop(340);
    obj.edit6:setLeft(180);
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setField("Pet_Per1");
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(30);
    obj.edit7:setTop(208);
    obj.edit7:setLeft(325);
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setField("Pet_Per2");
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(30);
    obj.edit8:setTop(240);
    obj.edit8:setLeft(325);
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setField("Pet_Per3");
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(30);
    obj.edit9:setTop(270);
    obj.edit9:setLeft(325);
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout1);
    obj.edit10:setField("Pet_Per4");
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(30);
    obj.edit10:setTop(300);
    obj.edit10:setLeft(325);
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout1);
    obj.edit11:setField("Pet_Per5");
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(30);
    obj.edit11:setTop(330);
    obj.edit11:setLeft(325);
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout1);
    obj.edit12:setField("Pet_Per6");
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(30);
    obj.edit12:setTop(360);
    obj.edit12:setLeft(325);
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout1);
    obj.edit13:setField("Pet_Per7");
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(30);
    obj.edit13:setTop(400);
    obj.edit13:setLeft(325);
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout1);
    obj.edit14:setField("Pet_Saude1");
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(30);
    obj.edit14:setTop(256);
    obj.edit14:setLeft(385);
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout1);
    obj.edit15:setField("Pet_Saude2");
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(30);
    obj.edit15:setTop(256);
    obj.edit15:setLeft(422);
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout1);
    obj.edit16:setField("Pet_Saude3");
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(30);
    obj.edit16:setTop(256);
    obj.edit16:setLeft(452);
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout1);
    obj.edit17:setField("Pet_Iniciativa");
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(30);
    obj.edit17:setTop(325);
    obj.edit17:setLeft(470);
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout1);
    obj.edit18:setField("Pet_AtkNick");
    obj.edit18:setWidth(200);
    obj.edit18:setHeight(30);
    obj.edit18:setTop(430);
    obj.edit18:setLeft(100);
    obj.edit18:setFontSize(20);
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout1);
    obj.edit19:setField("Pet_AtkGolpe");
    obj.edit19:setWidth(200);
    obj.edit19:setHeight(30);
    obj.edit19:setTop(458);
    obj.edit19:setLeft(200);
    obj.edit19:setFontColor("gray");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout1);
    obj.edit20:setField("Pet_AtkDano");
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(30);
    obj.edit20:setTop(478);
    obj.edit20:setLeft(195);
    obj.edit20:setFontColor("gray");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout1);
    obj.edit21:setField("Pet_AtkCD");
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(30);
    obj.edit21:setTop(478);
    obj.edit21:setLeft(270);
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout1);
    obj.edit22:setField("Pet_Des");
    obj.edit22:setWidth(140);
    obj.edit22:setHeight(30);
    obj.edit22:setTop(400);
    obj.edit22:setLeft(385);
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout1);
    obj.edit23:setField("Pet_Des2");
    obj.edit23:setWidth(140);
    obj.edit23:setHeight(30);
    obj.edit23:setTop(420);
    obj.edit23:setLeft(385);
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setName("edit23");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout1);
    obj.image2:setWidth(400);
    obj.image2:setHeight(300);
    obj.image2:setLeft(100);
    obj.image2:setTop(505);
    obj.image2:setSRC("/DZ_Ficha2.0/images/ImgSize_400x300.png");
    obj.image2:setStyle("proportional");
    obj.image2:setEditable(true);
    obj.image2:setShowProgress(true);
    obj.image2:setOptimize(true);
    obj.image2:setField("PetII");
    obj.image2:setName("image2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(600);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(600);
    obj.layout2:setHeight(800);
    obj.layout2:setName("layout2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout2);
    obj.image3:setWidth(600);
    obj.image3:setHeight(400);
    obj.image3:setLeft(10);
    obj.image3:setTop(140);
    obj.image3:setStyle("proportional");
    obj.image3:setCenter(true);
    obj.image3:setSRC("/DZ_Ficha2.0/images/FichaPET.png");
    obj.image3:setName("image3");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout2);
    obj.edit24:setField("Pet2_Nick");
    obj.edit24:setWidth(500);
    obj.edit24:setHeight(60);
    obj.edit24:setTop(150);
    obj.edit24:setLeft(100);
    obj.edit24:setFontSize(30);
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout2);
    obj.edit25:setField("Pet2_Fisico");
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(30);
    obj.edit25:setTop(208);
    obj.edit25:setLeft(180);
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout2);
    obj.edit26:setField("Pet2_Social");
    obj.edit26:setWidth(40);
    obj.edit26:setHeight(30);
    obj.edit26:setTop(240);
    obj.edit26:setLeft(180);
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout2);
    obj.edit27:setField("Pet2_Inteligencia");
    obj.edit27:setWidth(40);
    obj.edit27:setHeight(30);
    obj.edit27:setTop(270);
    obj.edit27:setLeft(180);
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout2);
    obj.edit28:setField("Pet2_Percep");
    obj.edit28:setWidth(40);
    obj.edit28:setHeight(30);
    obj.edit28:setTop(310);
    obj.edit28:setLeft(180);
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout2);
    obj.edit29:setField("Pet2_Espiritual");
    obj.edit29:setWidth(40);
    obj.edit29:setHeight(30);
    obj.edit29:setTop(340);
    obj.edit29:setLeft(180);
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout2);
    obj.edit30:setField("Pet2_Per1");
    obj.edit30:setWidth(40);
    obj.edit30:setHeight(30);
    obj.edit30:setTop(208);
    obj.edit30:setLeft(325);
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout2);
    obj.edit31:setField("Pet2_Per2");
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(30);
    obj.edit31:setTop(240);
    obj.edit31:setLeft(325);
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout2);
    obj.edit32:setField("Pet2_Per3");
    obj.edit32:setWidth(40);
    obj.edit32:setHeight(30);
    obj.edit32:setTop(270);
    obj.edit32:setLeft(325);
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout2);
    obj.edit33:setField("Pet2_Per4");
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(30);
    obj.edit33:setTop(300);
    obj.edit33:setLeft(325);
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout2);
    obj.edit34:setField("Pet2_Per5");
    obj.edit34:setWidth(40);
    obj.edit34:setHeight(30);
    obj.edit34:setTop(330);
    obj.edit34:setLeft(325);
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout2);
    obj.edit35:setField("Pet2_Per6");
    obj.edit35:setWidth(40);
    obj.edit35:setHeight(30);
    obj.edit35:setTop(360);
    obj.edit35:setLeft(325);
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout2);
    obj.edit36:setField("Pet2_Per7");
    obj.edit36:setWidth(40);
    obj.edit36:setHeight(30);
    obj.edit36:setTop(400);
    obj.edit36:setLeft(325);
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout2);
    obj.edit37:setField("Pet2_Saude1");
    obj.edit37:setWidth(40);
    obj.edit37:setHeight(30);
    obj.edit37:setTop(256);
    obj.edit37:setLeft(385);
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout2);
    obj.edit38:setField("Pet2_Saude2");
    obj.edit38:setWidth(40);
    obj.edit38:setHeight(30);
    obj.edit38:setTop(256);
    obj.edit38:setLeft(422);
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout2);
    obj.edit39:setField("Pet2_Saude3");
    obj.edit39:setWidth(40);
    obj.edit39:setHeight(30);
    obj.edit39:setTop(256);
    obj.edit39:setLeft(452);
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout2);
    obj.edit40:setField("Pet2_Iniciativa");
    obj.edit40:setWidth(40);
    obj.edit40:setHeight(30);
    obj.edit40:setTop(325);
    obj.edit40:setLeft(470);
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout2);
    obj.edit41:setField("Pet2_AtkNick");
    obj.edit41:setWidth(200);
    obj.edit41:setHeight(30);
    obj.edit41:setTop(430);
    obj.edit41:setLeft(100);
    obj.edit41:setFontSize(20);
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout2);
    obj.edit42:setField("Pet2_AtkGolpe");
    obj.edit42:setWidth(200);
    obj.edit42:setHeight(30);
    obj.edit42:setTop(458);
    obj.edit42:setLeft(200);
    obj.edit42:setFontColor("gray");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout2);
    obj.edit43:setField("Pet2_AtkDano");
    obj.edit43:setWidth(40);
    obj.edit43:setHeight(30);
    obj.edit43:setTop(478);
    obj.edit43:setLeft(195);
    obj.edit43:setFontColor("gray");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout2);
    obj.edit44:setField("Pet2_AtkCD");
    obj.edit44:setWidth(40);
    obj.edit44:setHeight(30);
    obj.edit44:setTop(478);
    obj.edit44:setLeft(270);
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout2);
    obj.edit45:setField("Pet2_Des");
    obj.edit45:setWidth(140);
    obj.edit45:setHeight(30);
    obj.edit45:setTop(400);
    obj.edit45:setLeft(385);
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout2);
    obj.edit46:setField("Pet2_Des2");
    obj.edit46:setWidth(140);
    obj.edit46:setHeight(30);
    obj.edit46:setTop(420);
    obj.edit46:setLeft(385);
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setName("edit46");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout2);
    obj.image4:setWidth(400);
    obj.image4:setHeight(300);
    obj.image4:setLeft(100);
    obj.image4:setTop(505);
    obj.image4:setSRC("/DZ_Ficha2.0/images/ImgSize_400x300.png");
    obj.image4:setStyle("proportional");
    obj.image4:setEditable(true);
    obj.image4:setShowProgress(true);
    obj.image4:setOptimize(true);
    obj.image4:setField("Pet2II");
    obj.image4:setName("image4");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAnimal()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAnimal();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAnimal = {
    newEditor = newfrmAnimal, 
    new = newfrmAnimal, 
    name = "frmAnimal", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAnimal = _frmAnimal;
Firecast.registrarForm(_frmAnimal);

return _frmAnimal;
