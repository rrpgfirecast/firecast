require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTeste()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmTeste");
    obj:setWidth(300);
    obj:setHeight(100);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setHeight(100);
    obj.flowPart1:setWidth(300);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(5000);
    obj.flowPart1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labdesenhequadrados = GUI.fromHandle(_obj_newObject("label"));
    obj.labdesenhequadrados:setParent(obj.flowPart1);
    obj.labdesenhequadrados:setName("labdesenhequadrados");
    obj.labdesenhequadrados:setAutoSize(true);
    obj.labdesenhequadrados:setFontColor("red");
    obj.labdesenhequadrados:setAlign("top");
    obj.labdesenhequadrados:setWidth(280);
    obj.labdesenhequadrados:setWordWrap(true);
    obj.labdesenhequadrados:setHorzTextAlign("center");
    obj.labdesenhequadrados:setVertTextAlign("leading");
    obj.labdesenhequadrados:setMargins({right=5});

    obj.labtamanhomundo = GUI.fromHandle(_obj_newObject("label"));
    obj.labtamanhomundo:setParent(obj.flowPart1);
    obj.labtamanhomundo:setName("labtamanhomundo");
    obj.labtamanhomundo:setAutoSize(true);
    obj.labtamanhomundo:setFontColor("black");
    obj.labtamanhomundo:setAlign("top");
    obj.labtamanhomundo:setWidth(280);
    obj.labtamanhomundo:setWordWrap(true);
    obj.labtamanhomundo:setHorzTextAlign("center");
    obj.labtamanhomundo:setVertTextAlign("leading");
    obj.labtamanhomundo:setMargins({right=5});

	
		
		self.labdesenhequadrados.text = lang('scene.gridFineTuning.dica');
		self.labtamanhomundo.text = lang('scene.gridFineTuning.tamanho');
		
		


    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.labdesenhequadrados ~= nil then self.labdesenhequadrados:destroy(); self.labdesenhequadrados = nil; end;
        if self.labtamanhomundo ~= nil then self.labtamanhomundo:destroy(); self.labtamanhomundo = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTeste()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTeste();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTeste = {
    newEditor = newfrmTeste, 
    new = newfrmTeste, 
    name = "frmTeste", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmTeste = _frmTeste;
Firecast.registrarForm(_frmTeste);

return _frmTeste;
