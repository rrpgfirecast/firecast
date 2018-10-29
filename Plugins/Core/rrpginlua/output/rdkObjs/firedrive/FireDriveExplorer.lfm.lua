require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFireDriveExplorer()
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
    obj:setName("frmFireDriveExplorer");
    obj:setTitle("FireDrive");
    obj:setHeight(300);
    obj:setWidth(300);
    obj:setResizable(true);


		function self:adaptarTamanhoDaTela()
			local sw, sh = System.getScreenSize();
			local dw = 650;
			local dh = 600;
		
			if dw > sw - 20 then
				dw = sw - 20;
			end;
			
			if dh > sh - 20 then
				dh = sh - 20;
			end;
						
			self.width = dw;
			self.height = dh;
		end;
	
		self:adaptarTamanhoDaTela();	
	
		local cUser = Firecast.getCurrentUser();
		local canUseFireDrive = cUser.isGold or cUser.isGoldPlus or cUser.isRuby;		

		if canUseFireDrive then							
			self.navigator = require("/firedrive/firedriveNavigator.dlua").newFDNavigatorLayout();				
		end;	
	


    obj.layCentro = GUI.fromHandle(_obj_newObject("layout"));
    obj.layCentro:setParent(obj);
    obj.layCentro:setName("layCentro");
    obj.layCentro:setAlign("client");


		if self.navigator ~= nil then
			self.navigator:gotoDir('/');
			self.navigator.align = "client";			
			self.navigator.parent = self.layCentro;		
		else
			local KG = require("/knowGold/knowGoldPanel.dlua");
			
			self.panKG = KG.newPanel();
			self.panKG:setInfo("FireDrive é uma hospedagem de arquivos na internet exclusiva para assinantes RRPG Gold");
			self.panKG.parent = self.layCentro;		
		end;
		
		self.onHide = function()		
			if self.navigator ~= nil then
				self.navigator:finalizar();
				self.navigator = nil;
			end;
		end;		
	


    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layCentro ~= nil then self.layCentro:destroy(); self.layCentro = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFireDriveExplorer()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFireDriveExplorer();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFireDriveExplorer = {
    newEditor = newfrmFireDriveExplorer, 
    new = newfrmFireDriveExplorer, 
    name = "frmFireDriveExplorer", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "FireDrive", 
    description=""};

frmFireDriveExplorer = _frmFireDriveExplorer;
Firecast.registrarForm(_frmFireDriveExplorer);

return _frmFireDriveExplorer;
