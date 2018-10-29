require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha_MM3ed_RRPG_image2_svg()
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
    obj:setName("frmFicha_MM3ed_RRPG_image2_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(893);
    obj.rectangle1:setHeight(1263);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(893);
    obj.image1:setHeight(1263);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/2.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(43);
    obj.layout1:setTop(64);
    obj.layout1:setWidth(397);
    obj.layout1:setHeight(590);
    obj.layout1:setName("layout1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(397);
    obj.textEditor1:setHeight(590);
    obj.textEditor1:setFontSize(16.5);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Historia");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(452);
    obj.layout2:setTop(933);
    obj.layout2:setWidth(397);
    obj.layout2:setHeight(305);
    obj.layout2:setName("layout2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(397);
    obj.textEditor2:setHeight(305);
    obj.textEditor2:setFontSize(16.5);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("Inimigos");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(43);
    obj.layout3:setTop(710);
    obj.layout3:setWidth(397);
    obj.layout3:setHeight(528);
    obj.layout3:setName("layout3");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout3);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(397);
    obj.textEditor3:setHeight(528);
    obj.textEditor3:setFontSize(16.5);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("Anotacoes");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(452);
    obj.layout4:setTop(620);
    obj.layout4:setWidth(397);
    obj.layout4:setHeight(256);
    obj.layout4:setName("layout4");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout4);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(398);
    obj.textEditor4:setHeight(256);
    obj.textEditor4:setFontSize(16.5);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("QGeneral");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(452);
    obj.layout5:setTop(287);
    obj.layout5:setWidth(397);
    obj.layout5:setHeight(276);
    obj.layout5:setName("layout5");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout5);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(398);
    obj.textEditor5:setHeight(276);
    obj.textEditor5:setFontSize(16.5);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Complicacoes");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(450);
    obj.rectangle2:setTop(22);
    obj.rectangle2:setWidth(402);
    obj.rectangle2:setHeight(214);
    obj.rectangle2:setColor("#6cb098");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setLeft(452);
    obj.image2:setTop(23);
    obj.image2:setWidth(399);
    obj.image2:setHeight(211);
    obj.image2:setField("sobmanto");
    obj.image2:setEditable(true);
    obj.image2:setStyle("proportional");
    obj.image2:setName("image2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(600);
    obj.label1:setTop(1240);
    obj.label1:setWidth(33);
    obj.label1:setHeight(20);
    obj.label1:setText("GILGANTE E JANUS - VERSAO DA FICHA: 2.8");
    obj.label1:setName("label1");
    obj.label1:setFontColor("black");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);

    obj._e_event0 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.sobmanto);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha_MM3ed_RRPG_image2_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha_MM3ed_RRPG_image2_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha_MM3ed_RRPG_image2_svg = {
    newEditor = newfrmFicha_MM3ed_RRPG_image2_svg, 
    new = newfrmFicha_MM3ed_RRPG_image2_svg, 
    name = "frmFicha_MM3ed_RRPG_image2_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha_MM3ed_RRPG_image2_svg = _frmFicha_MM3ed_RRPG_image2_svg;
Firecast.registrarForm(_frmFicha_MM3ed_RRPG_image2_svg);

return _frmFicha_MM3ed_RRPG_image2_svg;
