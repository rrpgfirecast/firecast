require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMultImageCheckbox()
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
    obj:setName("frmMultImageCheckbox");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(100);
    obj.button1:setHeight(100);
    obj.button1:setHint("click to change image");
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.button1);
    obj.dataLink1:setField("clickableImage");
    obj.dataLink1:setDefaultValue("http://firecast.blob.core.windows.net/blobs/KEMDMPRM_386214.png");
    obj.dataLink1:setName("dataLink1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button1);
    obj.image1:setAlign("client");
    obj.image1:setField("clickableImage");
    obj.image1:setMargins({left=5, right=5, top=5, bottom=5});
    obj.image1:setStyle("proportional");
    obj.image1:setName("image1");


				-- criando array das imagens que vão ser utilizadas. 
				-- melhor usar imagens hospedadas no firedrive nesse caso
				local pics = {	"http://firecast.blob.core.windows.net/blobs/KEMDMPRM_386214.png", 
								"http://firecast.blob.core.windows.net/blobs/IAUQMVUR_386260.png", 
								"http://firecast.blob.core.windows.net/blobs/QNIIBIMV_386244.png", 
								"http://firecast.blob.core.windows.net/blobs/APKABCKF_386218.png", 
								"http://firecast.blob.core.windows.net/blobs/DFBFKPTH_386212.png", 
								"http://firecast.blob.core.windows.net/blobs/PPIRFSBI_386208.png", 
								"http://firecast.blob.core.windows.net/blobs/FGLDGNRW_386257.png", 
								"http://firecast.blob.core.windows.net/blobs/LFRIRPIW_386226.png", 
								"http://firecast.blob.core.windows.net/blobs/CEJAMDNT_386246.png", 
								"http://firecast.blob.core.windows.net/blobs/MKLJSRET_386230.png"};
				


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet.imageCounter == nil then
            					sheet.imageCounter = 0;
            				end;
            				-- Contador que vai de 0 a 9 e reseta ao passar de 9
            				sheet.imageCounter = (sheet.imageCounter + 1) % #pics;
            				-- pegando imagem do array. O +1 é por que arrays em lua começam em 1 e não em 0
            				sheet.clickableImage = pics[sheet.imageCounter +1];
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

        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMultImageCheckbox()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMultImageCheckbox();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMultImageCheckbox = {
    newEditor = newfrmMultImageCheckbox, 
    new = newfrmMultImageCheckbox, 
    name = "frmMultImageCheckbox", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMultImageCheckbox = _frmMultImageCheckbox;
Firecast.registrarForm(_frmMultImageCheckbox);

return _frmMultImageCheckbox;
