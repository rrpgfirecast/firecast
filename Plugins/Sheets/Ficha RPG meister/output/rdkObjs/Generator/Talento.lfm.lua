require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGeneratorFeat()
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
    obj:setName("frmGeneratorFeat");
    obj:setHeight(25);
    obj:setWidth(600);
    obj:setMargins({top=2});

			
			local function askForDelete()
				Dialogs.confirmYesNo("Deseja realmente apagar esse talento?",
									 function (confirmado)
										if confirmado then
											NDB.deleteNode(sheet);
										end;
									 end);
			end;		
		


    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setAlign("left");
    obj.label1:setWidth(30);
    obj.label1:setField("nivelHabilidade");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setAlign("client");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setField("nomeHabilidade");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setAlign("right");
    obj.label3:setWidth(100);
    obj.label3:setField("obtencaoHabilidade");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setWidth(100);
    obj.button1:setText("Selecionar");
    obj.button1:setMargins({right=5});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setAlign("right");
    obj.button2:setWidth(50);
    obj.button2:setText("X");
    obj.button2:setMargins({left=5,right=5});
    obj.button2:setName("button2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet.lock then return end;
            
            			-- Show Feat Selection PopUp
            
            			local pop = self:findControlByName("popFeatSelection");
            				
            			if generatorSheet.feats==nil then 
            				generatorSheet.feats = {}
            			end
            
            			featSelected = sheet
            
            			if pop ~= nil then
            				pop:setNodeObject(generatorSheet.feats);
            				pop:showPopupEx("top", self);
            			else
            				showMessage("Ops, bug.. nao encontrei o popup de pericias para exibir");
            			end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
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

        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGeneratorFeat()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGeneratorFeat();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGeneratorFeat = {
    newEditor = newfrmGeneratorFeat, 
    new = newfrmGeneratorFeat, 
    name = "frmGeneratorFeat", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeneratorFeat = _frmGeneratorFeat;
Firecast.registrarForm(_frmGeneratorFeat);

return _frmGeneratorFeat;
