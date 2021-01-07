require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSdG3_svg()
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
    obj:setName("frmSdG3_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1259);
    obj.rectangle1:setHeight(1786);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1259);
    obj.image1:setHeight(1786);
    obj.image1:setSRC("/SdG/images/3.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setField("img1");
    obj.image2:setStyle("autoFit");
    obj.image2:setEditable(true);
    obj.image2:setLeft(803);
    obj.image2:setTop(228);
    obj.image2:setWidth(380);
    obj.image2:setHeight(342);
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setField("img2");
    obj.image3:setStyle("autoFit");
    obj.image3:setEditable(true);
    obj.image3:setLeft(682);
    obj.image3:setTop(643);
    obj.image3:setWidth(462);
    obj.image3:setHeight(422);
    obj.image3:setName("image3");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(22);
    obj.layout1:setTop(646);
    obj.layout1:setWidth(569);
    obj.layout1:setHeight(418);
    obj.layout1:setName("layout1");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout1);
    obj.richEdit1:setLeft(0);
    obj.richEdit1:setTop(0);
    obj.richEdit1:setWidth(569);
    obj.richEdit1:setHeight(419);
    obj.richEdit1:setField("Anotações");
    obj.richEdit1:setName("richEdit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(116);
    obj.layout2:setTop(1182);
    obj.layout2:setWidth(1026);
    obj.layout2:setHeight(458);
    obj.layout2:setName("layout2");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout2);
    obj.richEdit2:setLeft(0);
    obj.richEdit2:setTop(0);
    obj.richEdit2:setWidth(1026);
    obj.richEdit2:setHeight(458);
    obj.richEdit2:setField("BG");
    obj.richEdit2:setName("richEdit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(129);
    obj.layout3:setTop(279);
    obj.layout3:setWidth(261);
    obj.layout3:setHeight(79);
    obj.layout3:setName("layout3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout3);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(24.1);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(261);
    obj.textEditor1:setHeight(80);
    obj.textEditor1:setField("Conjuge");
    obj.textEditor1:setName("textEditor1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(123);
    obj.layout4:setTop(349);
    obj.layout4:setWidth(267);
    obj.layout4:setHeight(35);
    obj.layout4:setName("layout4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(24.1);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(267);
    obj.edit1:setHeight(36);
    obj.edit1:setField("Crenca");
    obj.edit1:setName("edit1");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(122);
    obj.layout5:setTop(384);
    obj.layout5:setWidth(618);
    obj.layout5:setHeight(35);
    obj.layout5:setName("layout5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(24.1);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(618);
    obj.edit2:setHeight(36);
    obj.edit2:setField("Brasao");
    obj.edit2:setName("edit2");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(152);
    obj.layout6:setTop(421);
    obj.layout6:setWidth(237);
    obj.layout6:setHeight(35);
    obj.layout6:setName("layout6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(24.1);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(237);
    obj.edit3:setHeight(36);
    obj.edit3:setField("Serv1");
    obj.edit3:setName("edit3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(427);
    obj.layout7:setTop(420);
    obj.layout7:setWidth(316);
    obj.layout7:setHeight(35);
    obj.layout7:setName("layout7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(24.1);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(316);
    obj.edit4:setHeight(36);
    obj.edit4:setField("Serv2");
    obj.edit4:setName("edit4");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(160);
    obj.layout8:setTop(457);
    obj.layout8:setWidth(582);
    obj.layout8:setHeight(35);
    obj.layout8:setName("layout8");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(24.1);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(582);
    obj.edit5:setHeight(36);
    obj.edit5:setField("Juramento");
    obj.edit5:setName("edit5");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(129);
    obj.layout9:setTop(495);
    obj.layout9:setWidth(258);
    obj.layout9:setHeight(35);
    obj.layout9:setName("layout9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(24.1);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(258);
    obj.edit6:setHeight(36);
    obj.edit6:setField("Idi1");
    obj.edit6:setName("edit6");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(407);
    obj.layout10:setTop(495);
    obj.layout10:setWidth(336);
    obj.layout10:setHeight(35);
    obj.layout10:setName("layout10");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(24.1);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(336);
    obj.edit7:setHeight(36);
    obj.edit7:setField("Idi2");
    obj.edit7:setName("edit7");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(461);
    obj.layout11:setTop(279);
    obj.layout11:setWidth(281);
    obj.layout11:setHeight(35);
    obj.layout11:setName("layout11");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout11);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(24.1);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(281);
    obj.edit8:setHeight(36);
    obj.edit8:setField("Filhos");
    obj.edit8:setName("edit8");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(512);
    obj.layout12:setTop(309);
    obj.layout12:setWidth(231);
    obj.layout12:setHeight(35);
    obj.layout12:setName("layout12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(24.1);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(231);
    obj.edit9:setHeight(36);
    obj.edit9:setField("Infância");
    obj.edit9:setName("edit9");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(480);
    obj.layout13:setTop(346);
    obj.layout13:setWidth(262);
    obj.layout13:setHeight(35);
    obj.layout13:setName("layout13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout13);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(24.1);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(262);
    obj.edit10:setHeight(36);
    obj.edit10:setField("povo");
    obj.edit10:setName("edit10");

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
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSdG3_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSdG3_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSdG3_svg = {
    newEditor = newfrmSdG3_svg, 
    new = newfrmSdG3_svg, 
    name = "frmSdG3_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSdG3_svg = _frmSdG3_svg;
Firecast.registrarForm(_frmSdG3_svg);

return _frmSdG3_svg;
