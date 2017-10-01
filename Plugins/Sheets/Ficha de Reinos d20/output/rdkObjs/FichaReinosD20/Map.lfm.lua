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

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.mapa);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(1152);
    obj.rectangle1:setHeight(648);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.mapa);
    obj.image1:setWidth(1152);
    obj.image1:setHeight(648);
    obj.image1:setField("mapa");
    obj.image1:setHitTest(true);
    obj.image1:setStyle("proportional");
    obj.image1:setHint("Clique para alterar Imagem, shift+clique para adicionar Cidade, ctrl+clique para adicionar Ponto de Interesse. ");
    obj.image1:setName("image1");

    obj._e_event0 = obj.image1:addEventListener("onMouseDown",
        function (self, event)
            sheet.button = event.button;
            				sheet.x = event.x;
            				sheet.y = event.y;
            				sheet.shiftKey = event.shiftKey;
            				sheet.ctrlKey = event.ctrlKey;
            				sheet.altKey = event.altKey;
        end, obj);

    obj._e_event1 = obj.image1:addEventListener("onClick",
        function (self)
            if sheet==nil then return end;
            				
            				local mesa = rrpg.getMesaDe(sheet);
            				if not ndb.testPermission(sheet, "write") then return end;
            
            				if sheet.shiftKey then
            					-- Adicionar Cidade
            					if sheet.cityNum == nil then
            						sheet.cityNum = 0;
            					end;
            					sheet.cityNum = sheet.cityNum + 1;
            
            					local btn = gui.newButton();
            					btn.parent = self.mapa;
            					btn.left = sheet.x-12;
            					btn.top = sheet.y-12;
            					btn.width = 25;
            					btn.height = 25;
            					btn.cursor = "handPoint";
            					btn.hint = "Cidade";
            					btn.opacity = 0.35;
            					btn.name = "button_c"..sheet.cityNum;
            					btn.text = "";
            
            					local node = self.rclDestalhesDaCidade:append();
            					node.name = btn.name;
            					node.left = btn.left;
            					node.top = btn.top;
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
            					-- Adicionar Ponto de Interesse
            					if sheet.geographyNum == nil then
            						sheet.geographyNum = 0;
            					end;
            					sheet.geographyNum = sheet.geographyNum + 1;
            
            					local btn = gui.newButton();
            					btn.parent = self.mapa;
            					btn.left = sheet.x-15;
            					btn.top = sheet.y-15;
            					btn.width = 30;
            					btn.height = 30;
            					btn.cursor = "handPoint";
            					btn.hint = "Lugar";
            					btn.opacity = 0.35;
            					btn.name = "button_g"..sheet.geographyNum;
            					btn.text = "";
            
            					local node = self.rclDestalhesDaGeografia:append();
            					node.name = btn.name;
            					node.left = btn.left;
            					node.top = btn.top;
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
            
            					
            				else
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
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
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
