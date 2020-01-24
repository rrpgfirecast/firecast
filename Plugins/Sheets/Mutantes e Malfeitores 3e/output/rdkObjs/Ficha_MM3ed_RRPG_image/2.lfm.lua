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
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/Parede_2.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(43);
    obj.layout1:setTop(64);
    obj.layout1:setWidth(674);
    obj.layout1:setHeight(590);
    obj.layout1:setName("layout1");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout1);
    obj.richEdit1:setLeft(0);
    obj.richEdit1:setTop(0);
    obj.richEdit1:setWidth(674);
    obj.richEdit1:setHeight(590);
    obj.richEdit1:setField("Historia");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "14");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    lfm_setPropAsString(obj.richEdit1, "animateImages",  "true");
    obj.richEdit1:setName("richEdit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(452);
    obj.layout2:setTop(933);
    obj.layout2:setWidth(397);
    obj.layout2:setHeight(528);
    obj.layout2:setName("layout2");

    obj.richEnemy = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEnemy:setParent(obj.layout2);
    obj.richEnemy:setLeft(0);
    obj.richEnemy:setTop(0);
    obj.richEnemy:setWidth(397);
    obj.richEnemy:setHeight(305);
    obj.richEnemy:setField("Inimigos");
    obj.richEnemy:setName("richEnemy");
    lfm_setPropAsString(obj.richEnemy, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEnemy, "showToolbar",  "false");
    lfm_setPropAsString(obj.richEnemy, "defaultFontSize",  "14");
    lfm_setPropAsString(obj.richEnemy, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEnemy, "animateImages",  "true");
    obj.richEnemy:setHint("Você pode usar atalhos de edição de texto aqui\nou colar texto editado em outro lugar");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(452);
    obj.layout3:setTop(710);
    obj.layout3:setWidth(397);
    obj.layout3:setHeight(167);
    obj.layout3:setName("layout3");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout3);
    obj.richEdit2:setLeft(0);
    obj.richEdit2:setTop(0);
    obj.richEdit2:setWidth(397);
    obj.richEdit2:setHeight(170);
    obj.richEdit2:setField("QGeneral");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEdit2, "showToolbar",  "false");
    lfm_setPropAsString(obj.richEdit2, "defaultFontSize",  "16.5");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit2, "animateImages",  "true");
    obj.richEdit2:setHint("Você pode usar atalhos de edição de texto aqui\npor exemplo Ctrl+B para negrito");
    obj.richEdit2:setName("richEdit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(43);
    obj.layout4:setTop(710);
    obj.layout4:setWidth(397);
    obj.layout4:setHeight(751);
    obj.layout4:setName("layout4");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.layout4);
    obj.richEdit3:setLeft(0);
    obj.richEdit3:setTop(0);
    obj.richEdit3:setWidth(397);
    obj.richEdit3:setHeight(528);
    obj.richEdit3:setField("Complicacoes");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "#6cb098");
    lfm_setPropAsString(obj.richEdit3, "showToolbar",  "false");
    lfm_setPropAsString(obj.richEdit3, "defaultFontSize",  "16.5");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit3, "animateImages",  "true");
    obj.richEdit3:setHint("Você pode usar atalhos de edição de texto aqui\npor exemplo Ctrl+T para itálico");
    obj.richEdit3:setName("richEdit3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(728);
    obj.rectangle2:setTop(23);
    obj.rectangle2:setWidth(123);
    obj.rectangle2:setHeight(633);
    obj.rectangle2:setColor("#6cb098");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setLeft(730);
    obj.image2:setTop(24);
    obj.image2:setWidth(120);
    obj.image2:setHeight(631);
    obj.image2:setSRC("/Ficha_MM3ed_RRPG_image/images/barra.png");
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setLeft(728);
    obj.image3:setTop(23);
    obj.image3:setWidth(122);
    obj.image3:setHeight(633);
    obj.image3:setField("sobmanto");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    lfm_setPropAsString(obj.image3, "animate",  "true");
    obj.image3:setName("image3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(615);
    obj.label1:setTop(3);
    obj.label1:setWidth(33);
    obj.label1:setHeight(20);
    obj.label1:setFontSize(10);
    obj.label1:setFontColor("#3f8270");
    obj.label1:setText("GILGANTE E JANUS - VERSÃO DA FICHA: 2020-01-24");
    obj.label1:setName("label1");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);

    obj._e_event0 = obj.image3:addEventListener("onStartDrag",
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

        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.richEnemy ~= nil then self.richEnemy:destroy(); self.richEnemy = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
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
