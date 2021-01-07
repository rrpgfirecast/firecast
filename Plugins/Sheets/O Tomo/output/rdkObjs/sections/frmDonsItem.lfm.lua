require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDonsItem()
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
    obj:setName("frmDonsItem");
    obj:setHeight(30);
    obj:setMargins({top=6,bottom=2, left=4, right=4});

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setWidth(14);
    obj.imageCheckBox1:setField("crossDon");
    obj.imageCheckBox1:setImageChecked("img/x.png");
    obj.imageCheckBox1:setImageUnchecked("");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setAlign("client");
    obj.edit1:setField("name");
    obj.edit1:setMargins({right=2});
    obj.edit1:setFontColor("black");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(14);
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontFamily("Ar Julian");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setWidth(30);
    obj.button1:setText("!");
    obj.button1:setFontColor("white");
    obj.button1:setFontSize(14);
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setMargins({right=2});
    obj.button1:setCursor("handPoint");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setAlign("right");
    obj.button2:setWidth(30);
    obj.button2:setText("➖");
    obj.button2:setFontColor("white");
    obj.button2:setFontSize(14);
    lfm_setPropAsString(obj.button2, "fontStyle",  "bold");
    obj.button2:setCursor("handPoint");
    obj.button2:setName("button2");

    obj.popDonsView = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDonsView:setParent(obj);
    obj.popDonsView:setName("popDonsView");
    obj.popDonsView:setWidth(600);
    obj.popDonsView:setHeight(150);
    obj.popDonsView:setBackOpacity(0.5);

    obj.boxDonsDetails = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDonsDetails:setParent(obj.popDonsView);
    obj.boxDonsDetails:setAlign("client");
    obj.boxDonsDetails:setName("boxDonsDetails");
    obj.boxDonsDetails:setPadding({top=4, left=4, bottom=4, right=4});

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.boxDonsDetails);
    obj.label1:setAlign("top");
    obj.label1:setText("Descrição");
    obj.label1:setAutoSize(true);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontColor("white");
    obj.label1:setFontSize(16);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.boxDonsDetails);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("donsDescription");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "white");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "showToolbar",  "false");
    obj.richEdit1:setName("richEdit1");

         
            local function showPopDons()
                self.popDonsView:show();               
            end
        


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            showPopDons();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
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

        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.popDonsView ~= nil then self.popDonsView:destroy(); self.popDonsView = nil; end;
        if self.boxDonsDetails ~= nil then self.boxDonsDetails:destroy(); self.boxDonsDetails = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDonsItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDonsItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDonsItem = {
    newEditor = newfrmDonsItem, 
    new = newfrmDonsItem, 
    name = "frmDonsItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDonsItem = _frmDonsItem;
Firecast.registrarForm(_frmDonsItem);

return _frmDonsItem;
