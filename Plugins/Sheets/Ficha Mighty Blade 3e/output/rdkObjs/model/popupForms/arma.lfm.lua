require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmArma()
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
    obj:setName("frmArma");
    obj:setHeight(30);
    obj:setMargins({top=2,bottom=2});

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj);
    obj.flowPart1:setMinWidth(400);
    obj.flowPart1:setWidth(1400);
    obj.flowPart1:setMaxWidth(1600);
    obj.flowPart1:setHeight(30);
    obj.flowPart1:setName("flowPart1");


			local function askForDelete()
				Dialogs.confirmYesNo("Deseja realmente apagar '" .. (sheet.nomeArma or "<sem nome>").. "'?'",
									 function (confirmado)
										if confirmado then
											NDB.deleteNode(self.sheet);
										end;
									 end);
			end;
			
			local function attackWithWeapon()
				local pop = self:findControlByName("popArma");
					
				if pop ~= nil then
					pop:setNodeObject(sheet);
				end;
			
				local weaponName = sheet.nomeArma or "";
				local weaponAttribute = self:findControlByName("popWeaponAttribute").value or "forca";
				local weaponDamage = self:findControlByName("popInfoFielddanoArma").text or "0";	
				local rootSheet = NDB.getParent(NDB.getParent(sheet));
			
				local minhaMesa = Firecast.getMesaDe(sheet);
				local chat = minhaMesa.chat;
				local rolagem;
				local narration = "";
				
				if weaponAttribute == "forca" then
					rolagem = (2 + (sheet.forcaDadosBonus or 0)) .. "d6";
					
					if rootSheet.forca ~= nil and rootSheet.forca ~= 0 then
						rolagem = rolagem .. " + " .. rootSheet.forca;
					end;
				elseif weaponAttribute == "agilidade" then
					rolagem = (2 + (sheet.agilidadeDadosBonus or 0)) .. "d6";
					
					if rootSheet.agilidade ~= nil and rootSheet.agilidade ~= 0 then
						rolagem = rolagem .. " + " .. rootSheet.agilidade;
					end;
				elseif weaponAttribute == "inteligencia" then
					rolagem = (2 + (sheet.inteligenciaDadosBonus or 0)) .. "d6";
					
					if rootSheet.inteligencia ~= nil and rootSheet.inteligencia ~= 0 then
						rolagem = rolagem .. " + " .. rootSheet.inteligencia;
					end;
				elseif weaponAttribute == "vontade" then
					rolagem = (2 + (sheet.vontadeDadosBonus or 0)) .. "d6";
					
					if rootSheet.vontade ~= nil and rootSheet.vontade ~= 0 then
						rolagem = rolagem .. " + " .. rootSheet.vontade;
					end;
				end;				
				
				narration = narration .. weaponName;
				
				if weaponDamage ~= "0" and weaponDamage ~= "" and weaponName ~= "" then
					weaponDamage = " | Dano: " .. weaponDamage;
					narration = narration .. weaponDamage;
				end;
				
				chat:rolarDados(rolagem, narration);
			end;
			
			local function showArmaPopup()
				local pop = self:findControlByName("popArma");
				local popControle = self:findControlByName("buttonWeaponInfo");
					
				if pop ~= nil then
					pop:setNodeObject(self.sheet);
					pop:show("topCenter", popControle);
				else
					showMessage("Não foi encontrada a janela de descrição correspondente.");
				end;
			end;
			


    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(290);
    obj.edit1:setField("nomeArma");
    obj.edit1:setMargins({right=5});
    obj.edit1:setFontSize(18);
    obj.edit1:setName("edit1");

    obj.buttonWeaponInfo = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonWeaponInfo:setParent(obj.flowPart1);
    obj.buttonWeaponInfo:setName("buttonWeaponInfo");
    obj.buttonWeaponInfo:setAlign("left");
    obj.buttonWeaponInfo:setText("i");
    obj.buttonWeaponInfo:setWidth(30);
    obj.buttonWeaponInfo:setMargins({right=5});
    obj.buttonWeaponInfo:setFontSize(15);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowPart1);
    obj.button1:setAlign("left");
    obj.button1:setText("Atacar");
    obj.button1:setMargins({right=5});
    obj.button1:setName("button1");
    obj.button1:setFontSize(15);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowPart1);
    obj.button2:setAlign("left");
    obj.button2:setText("Apagar");
    obj.button2:setMargins({right=5});
    obj.button2:setName("button2");
    obj.button2:setFontSize(15);

    obj._e_event0 = obj.buttonWeaponInfo:addEventListener("onClick",
        function (_)
            showArmaPopup();
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            attackWithWeapon();
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.buttonWeaponInfo ~= nil then self.buttonWeaponInfo:destroy(); self.buttonWeaponInfo = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmArma()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmArma();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmArma = {
    newEditor = newfrmArma, 
    new = newfrmArma, 
    name = "frmArma", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmArma = _frmArma;
Firecast.registrarForm(_frmArma);

return _frmArma;
