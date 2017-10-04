require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMap()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmMap");
    obj:setAlign("client");

    obj.mapa = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.mapa:setParent(obj);
    obj.mapa:setAlign("client");
    obj.mapa:setName("mapa");

    obj.mapRectangle = gui.fromHandle(_obj_newObject("rectangle"));
    obj.mapRectangle:setParent(obj.mapa);
    obj.mapRectangle:setLeft(0);
    obj.mapRectangle:setTop(0);
    obj.mapRectangle:setWidth(1152);
    obj.mapRectangle:setHeight(648);
    obj.mapRectangle:setColor("black");
    obj.mapRectangle:setName("mapRectangle");

    obj.mapImage = gui.fromHandle(_obj_newObject("image"));
    obj.mapImage:setParent(obj.mapa);
    obj.mapImage:setWidth(1152);
    obj.mapImage:setHeight(648);
    obj.mapImage:setField("mapa");
    obj.mapImage:setName("mapImage");
    obj.mapImage:setHitTest(true);
    obj.mapImage:setStyle("proportional");
    obj.mapImage:setHint("Clique para alterar Imagem, shift+clique para adicionar Cidade, ctrl+clique para adicionar Ponto de Interesse. ");


			_obj_setProp(self.mapImage.handle, "Stretch", true);
		


    obj._e_event0 = obj.mapImage:addEventListener("onMouseDown",
        function (self, event)
            sheet.button = event.button;
            				sheet.x = event.x;
            				sheet.y = event.y;
            				sheet.shiftKey = event.shiftKey;
            				sheet.ctrlKey = event.ctrlKey;
            				sheet.altKey = event.altKey;
        end, obj);

    obj._e_event1 = obj.mapImage:addEventListener("onClick",
        function (self)
            if sheet==nil then return end;
            				
            				local mesa = rrpg.getMesaDe(sheet);
            				local mapImage = self:findControlByName("mapImage");
            
            
            
            				if sheet.shiftKey then
            					if not ndb.testPermission(sheet, "write") then return end;
            					-- Adicionar Cidade
            					if sheet.cityNum == nil then
            						sheet.cityNum = 0;
            					end;
            					sheet.cityNum = sheet.cityNum + 1;
            
            					local scale = 1;
            					if mapImage.scale > 1 then
            						scale = 0.5;
            					end;
            
            					local btn = gui.newButton();
            					btn.parent = self.mapa;
            					btn.left = (sheet.x-12)/scale;
            					btn.top = (sheet.y-12)/scale;
            					btn.width = 25/scale;
            					btn.height = 25/scale;
            					btn.cursor = "handPoint";
            					btn.hint = "Cidade";
            					btn.opacity = 0.35;
            					btn.name = "button_c"..sheet.cityNum;
            					btn.text = "";
            
            					local node = self.rclDestalhesDaCidade:append();
            					node.name = btn.name;
            					node.left = btn.left * scale;
            					node.top = btn.top * scale;
            					node.nome = "Cidade";
            
            					local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            					node.contador = #cidades;
            
            					btn.onClick = function() 
            						self.boxDetalhesDaCidade.node = node; 
            						self.boxDetalhesDaCidade.visible = (node ~= nil);
            						self.tabControl.tabIndex = 2;
            					end;
            
            					self.boxDetalhesDaCidade.node = node;
            					self.boxDetalhesDaCidade.visible = (node ~= nil);
            					self.tabControl.tabIndex = 2;
            
            				elseif sheet.ctrlKey then
            					if not ndb.testPermission(sheet, "write") then return end;
            					-- Adicionar Ponto de Interesse
            					if sheet.geographyNum == nil then
            						sheet.geographyNum = 0;
            					end;
            					sheet.geographyNum = sheet.geographyNum + 1;
            
            					local scale = 1;
            					if mapImage.scale > 1 then
            						scale = 0.5;
            					end;
            
            					local btn = gui.newButton();
            					btn.parent = self.mapa;
            					btn.left = (sheet.x-15)/scale;
            					btn.top = (sheet.y-15)/scale;
            					btn.width = 30/scale;
            					btn.height = 30/scale;
            					btn.cursor = "handPoint";
            					btn.hint = "Lugar";
            					btn.opacity = 0.35;
            					btn.name = "button_g"..sheet.geographyNum;
            					btn.text = "";
            
            					local node = self.rclDestalhesDaGeografia:append();
            					node.name = btn.name;
            					node.left = btn.left * scale;
            					node.top = btn.top * scale;
            					node.nome = "Lugar";
            					
            					local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            					node.contador = #lugares;
            
            					btn.onClick = function() 
            						self.boxDetalhesDaGeografia.node = node; 
            						self.boxDetalhesDaGeografia.visible = (node ~= nil);
            						self.tabControl.tabIndex = 3;
            					end;
            
            					self.boxDetalhesDaGeografia.node = node;
            					self.boxDetalhesDaGeografia.visible = (node ~= nil);
            					self.tabControl.tabIndex = 3;
            
            				elseif sheet.altKey then
            					-- Zoom control
            					local mapRectangle = self:findControlByName("mapRectangle");
            					local scale = 2;
            
            					if mapImage.scale > 1 then
            						scale = 0.5;
            					end;
            
            					mapImage.scale = mapImage.scale * scale;
            					mapRectangle.width = mapRectangle.width * scale;
            					mapRectangle.height = mapRectangle.height * scale;
            
            					-- repositioning city buttons
            					local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            					for i=1, #cidades, 1 do
            						local node = cidades[i];
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = btn.width * scale;
            								btn.height = btn.height * scale;
            								btn.left = btn.left * scale;
            								btn.top = btn.top * scale;
            							end;
            						end;
            					end;
            
            					-- repositioning places buttons
            					local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = btn.width * scale;
            								btn.height = btn.height * scale;
            								btn.left = btn.left * scale;
            								btn.top = btn.top * scale;
            							end;
            						end;
            					end;
            
            				else
            					if not ndb.testPermission(sheet, "write") then return end;
            					-- Alterar Imagem
            					Dialogs.selectImageURL(nil,
            						function(url)
            							sheet.mapa = url;
            						end);
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

        if self.mapa ~= nil then self.mapa:destroy(); self.mapa = nil; end;
        if self.mapRectangle ~= nil then self.mapRectangle:destroy(); self.mapRectangle = nil; end;
        if self.mapImage ~= nil then self.mapImage:destroy(); self.mapImage = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMap = {
    newEditor = newfrmMap, 
    new = newfrmMap, 
    name = "frmMap", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMap = _frmMap;
rrpg.registrarForm(_frmMap);

return _frmMap;
