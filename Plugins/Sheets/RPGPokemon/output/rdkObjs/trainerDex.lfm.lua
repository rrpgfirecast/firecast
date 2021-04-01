require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDex()
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
    obj:setName("frmDex");
    obj:setHeight(80);
    obj:setWidth(185);
    obj:setMargins({top=2, right=5, bottom=2});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setMargins({left=5});
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setStrokeDash("dash");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setWidth(170);
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({top=5});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Dex #:");
    obj.label1:setWidth(40);
    obj.label1:setFontSize(10);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setAlign("left");
    obj.label1:setMargins({left=5});
    obj.label1:setName("label1");
    obj.label1:setFontColor("Moccasin");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(45);
    obj.rectangle2:setMargins({left=5});
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setStrokeDash("dash");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setField("pokeNumber");
    obj.edit1:setType("number");
    obj.edit1:setAlign("client");
    obj.edit1:setTransparent(true);
    obj.edit1:setMargins({left=3,right=3});
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("White");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout1);
    obj.imageCheckBox1:setWidth(20);
    obj.imageCheckBox1:setAlign("right");
    obj.imageCheckBox1:setField("pokeCaught");
    obj.imageCheckBox1:setOptimize(true);
    obj.imageCheckBox1:setMargins({left=5});
    obj.imageCheckBox1:setHint("Capturado?");
    obj.imageCheckBox1:setImageChecked("/img/pokeball-on.png");
    obj.imageCheckBox1:setImageUnchecked("/img/pokeball-off.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setText("X");
    obj.button1:setHint("Apagar Entrada");
    obj.button1:setWidth(20);
    obj.button1:setMargins({left=5, right=10});
    obj.button1:setName("button1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setWidth(170);
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({top=5});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Espécie:");
    obj.label2:setWidth(40);
    obj.label2:setFontSize(10);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setAlign("left");
    obj.label2:setMargins({left=5});
    obj.label2:setName("label2");
    obj.label2:setFontColor("Moccasin");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(120);
    obj.rectangle3:setMargins({left=5});
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setColor("transparent");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setStrokeDash("dash");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle3);
    obj.edit2:setField("pokeSpecie");
    obj.edit2:setAlign("client");
    obj.edit2:setTransparent(true);
    obj.edit2:setMargins({left=5,right=5});
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("White");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");

    obj.pokePopUp = GUI.fromHandle(_obj_newObject("popup"));
    obj.pokePopUp:setParent(obj);
    obj.pokePopUp:setName("pokePopUp");
    obj.pokePopUp:setWidth(430);
    obj.pokePopUp:setHeight(550);
    obj.pokePopUp:setBackOpacity(0.5);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.pokePopUp);
    obj.label3:setText("INFORMAÇÕES DA ESPÉCIE");
    obj.label3:setAlign("top");
    obj.label3:setHeight(30);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontSize(18);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.pokePopUp);
    obj.layout3:setAlign("top");
    obj.layout3:setWidth(250);
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({top=10,left=5});
    obj.layout3:setName("layout3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setText("Espécie:");
    obj.label4:setAlign("left");
    obj.label4:setWidth(60);
    obj.label4:setMargins({left=5});
    obj.label4:setName("label4");
    obj.label4:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setMargins({left=10});
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setColor("transparent");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setStrokeDash("dash");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle4);
    obj.edit3:setField("pokeSpecie");
    obj.edit3:setAlign("client");
    obj.edit3:setTransparent(true);
    obj.edit3:setMargins({left=5,right=15});
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("White");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setText("Dex Nº:");
    obj.label5:setAlign("right");
    obj.label5:setMargins({right=10});
    obj.label5:setWidth(50);
    obj.label5:setName("label5");
    obj.label5:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setAlign("right");
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setMargins({right=10});
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setColor("transparent");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setStrokeDash("dash");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle5);
    obj.edit4:setField("pokeNumber");
    obj.edit4:setAlign("client");
    obj.edit4:setType("number");
    obj.edit4:setTransparent(true);
    obj.edit4:setMargins({left=5,right=5});
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("White");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.pokePopUp);
    obj.layout4:setAlign("top");
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({top=10,left=5});
    obj.layout4:setName("layout4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setText("Categ.:");
    obj.label6:setAlign("left");
    obj.label6:setWidth(60);
    obj.label6:setMargins({left=5});
    obj.label6:setName("label6");
    obj.label6:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(200);
    obj.rectangle6:setMargins({left=10});
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setColor("transparent");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setStrokeDash("dash");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle6);
    obj.edit5:setField("pokeCat");
    obj.edit5:setAlign("client");
    obj.edit5:setTransparent(true);
    obj.edit5:setMargins({left=5,right=15});
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("White");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout4);
    obj.label7:setText("Pego:");
    obj.label7:setAlign("right");
    obj.label7:setMargins({right=10});
    obj.label7:setWidth(50);
    obj.label7:setName("label7");
    obj.label7:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout4);
    obj.rectangle7:setAlign("right");
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setMargins({right=10});
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setColor("transparent");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("bevel");
    obj.rectangle7:setStrokeDash("dash");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.rectangle7);
    obj.imageCheckBox2:setWidth(32);
    obj.imageCheckBox2:setAlign("client");
    obj.imageCheckBox2:setField("pokeCaught");
    obj.imageCheckBox2:setImageChecked("/img/pokeball-on.png");
    obj.imageCheckBox2:setImageUnchecked("/img/pokeball-off.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.pokePopUp);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setMargins({top=10, left=5});
    obj.layout5:setName("layout5");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout5);
    obj.label8:setText("Tipo:");
    obj.label8:setWidth(60);
    obj.label8:setAlign("left");
    obj.label8:setMargins({left=5});
    obj.label8:setName("label8");
    obj.label8:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout5);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(330);
    obj.rectangle8:setMargins({left=10});
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setColor("transparent");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setStrokeDash("dash");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle8);
    obj.edit6:setField("pokeType");
    obj.edit6:setAlign("client");
    obj.edit6:setTransparent(true);
    obj.edit6:setMargins({left=5, right=5});
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("White");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.pokePopUp);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({top=10, left=5});
    obj.layout6:setName("layout6");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setText("Habitat:");
    obj.label9:setWidth(60);
    obj.label9:setAlign("left");
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");
    obj.label9:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout6);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(330);
    obj.rectangle9:setMargins({left=10});
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setColor("transparent");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setStrokeDash("dash");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle9);
    obj.edit7:setField("pokeHabitat");
    obj.edit7:setAlign("client");
    obj.edit7:setTransparent(true);
    obj.edit7:setMargins({left=5, right=5});
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("White");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.pokePopUp);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(100);
    obj.layout7:setMargins({top=10, left=5});
    obj.layout7:setName("layout7");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout7);
    obj.label10:setText("Pokédex:");
    obj.label10:setWidth(60);
    obj.label10:setAlign("left");
    obj.label10:setMargins({left=5});
    obj.label10:setName("label10");
    obj.label10:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout7);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(330);
    obj.rectangle10:setMargins({left=10});
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setColor("transparent");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setStrokeDash("dash");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle10);
    obj.textEditor1:setField("pokedexEntry");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setMargins({top=5, bottom=5, left=15, right=15});
    obj.textEditor1:setHorzTextAlign("leading");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.pokePopUp);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setHeight(170);
    obj.rectangle11:setMargins({left=130, right=130, top=40, bottom=10});
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setColor("transparent");
    obj.rectangle11:setStrokeColor("Orange");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setCornerType("innerRound");
    obj.rectangle11:setStrokeDash("dash");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle11);
    obj.image1:setAlign("client");
    obj.image1:setField("pokeImgUrl");
    obj.image1:setStyle("proportional");
    obj.image1:setCenter(true);
    obj.image1:setWidth(150);
    obj.image1:setHeight(150);
    obj.image1:setMargins({left=10, right=10, top=10, bottom=10});
    obj.image1:setName("image1");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.pokePopUp);
    obj.label11:setField("urlDexNum");
    obj.label11:setVisible(false);
    obj.label11:setName("label11");
    obj.label11:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'pokeNumber', 'pokeCaught'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar este item?",
            						function (confirmado)
            								if confirmado then
            										ndb.deleteNode(sheet);
            								else
            										-- usuário escolheu NAO
            								end;
            						end);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local formPai = self:findControlByName("frmPtuTrainer");
            
            			if formPai ~= nil then
            				formPai.recalcDex();
            			end;
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
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.pokePopUp ~= nil then self.pokePopUp:destroy(); self.pokePopUp = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDex()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDex();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDex = {
    newEditor = newfrmDex, 
    new = newfrmDex, 
    name = "frmDex", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDex = _frmDex;
Firecast.registrarForm(_frmDex);

return _frmDex;
