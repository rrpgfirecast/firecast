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

    obj.sizeLayout = gui.fromHandle(_obj_newObject("layout"));
    obj.sizeLayout:setParent(obj.mapa);
    obj.sizeLayout:setName("sizeLayout");
    obj.sizeLayout:setLeft(1160);
    obj.sizeLayout:setTop(0);
    obj.sizeLayout:setWidth(110);
    obj.sizeLayout:setHeight(200);

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.sizeLayout);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.sizeLayout);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(110);
    obj.label1:setHeight(20);
    obj.label1:setText("Altura Cidade");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setHint("Tamanho vertical em pixels dos botões/cidades do mapa. ");
    obj.label1:setHitTest(true);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.sizeLayout);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(25);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(20);
    obj.edit1:setField("altura");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setHint("Tamanho vertical dos botões/cidades do mapa. ");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.sizeLayout);
    obj.dataLink1:setField("altura");
    obj.dataLink1:setDefaultValue("25");
    obj.dataLink1:setName("dataLink1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.sizeLayout);
    obj.label2:setLeft(0);
    obj.label2:setTop(55);
    obj.label2:setWidth(110);
    obj.label2:setHeight(20);
    obj.label2:setText("Largura Cidade");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setHint("Tamanho horizontal em pixels dos botões/cidades do mapa. ");
    obj.label2:setHitTest(true);
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.sizeLayout);
    obj.edit2:setLeft(5);
    obj.edit2:setTop(75);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(20);
    obj.edit2:setField("largura");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setHint("Tamanho horizontal dos botões/cidades do mapa. ");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.sizeLayout);
    obj.dataLink2:setField("largura");
    obj.dataLink2:setDefaultValue("25");
    obj.dataLink2:setName("dataLink2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.sizeLayout);
    obj.label3:setLeft(0);
    obj.label3:setTop(105);
    obj.label3:setWidth(110);
    obj.label3:setHeight(20);
    obj.label3:setText("Altura Lugares");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setHint("Tamanho vertical em pixels dos botões/lugares do mapa. ");
    obj.label3:setHitTest(true);
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.sizeLayout);
    obj.edit3:setLeft(5);
    obj.edit3:setTop(125);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(20);
    obj.edit3:setField("altura2");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setHint("Tamanho vertical dos botões/lugares do mapa. ");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.sizeLayout);
    obj.dataLink3:setField("altura2");
    obj.dataLink3:setDefaultValue("30");
    obj.dataLink3:setName("dataLink3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.sizeLayout);
    obj.label4:setLeft(0);
    obj.label4:setTop(155);
    obj.label4:setWidth(110);
    obj.label4:setHeight(20);
    obj.label4:setText("Largura Lugares");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setHint("Tamanho horizontal em pixels dos botões/lugares do mapa. ");
    obj.label4:setHitTest(true);
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.sizeLayout);
    obj.edit4:setLeft(5);
    obj.edit4:setTop(175);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(20);
    obj.edit4:setField("largura2");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setHint("Tamanho horizontal dos botões/lugares do mapa. ");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.sizeLayout);
    obj.dataLink4:setField("largura2");
    obj.dataLink4:setDefaultValue("30");
    obj.dataLink4:setName("dataLink4");

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
		


    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            
            					for i=1, #cidades, 1 do
            						local node = cidades[i];
            						local altura = tonumber(sheet.altura) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.height = altura;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            
            					for i=1, #cidades, 1 do
            						local node = cidades[i];
            						local largura = tonumber(sheet.largura) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = largura;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            						local altura2 = tonumber(sheet.altura2) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.height = altura2;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            						local largura2 = tonumber(sheet.largura2) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = largura2;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event4 = obj.mapImage:addEventListener("onMouseDown",
        function (self, event)
            sheet.button = event.button;
            				sheet.x = event.x;
            				sheet.y = event.y;
            				sheet.shiftKey = event.shiftKey;
            				sheet.ctrlKey = event.ctrlKey;
            				sheet.altKey = event.altKey;
        end, obj);

    obj._e_event5 = obj.mapImage:addEventListener("onClick",
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
            					local altura = tonumber(sheet.altura) or 25;
            					local largura = tonumber(sheet.largura) or 25;
            
            					local altura2 = tonumber(sheet.altura2) or 30;
            					local largura2 = tonumber(sheet.largura2) or 30;
            
            					local btn = gui.newButton();
            					btn.parent = self.mapa;
            					btn.left = (sheet.x-12)/scale;
            					btn.top = (sheet.y-12)/scale;
            					btn.width = largura/scale;
            					btn.height = altura/scale;
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
            						if sheet.dragged then
            							sheet.dragged = false;
            							return;
            						end;
            						self.boxDetalhesDaCidade.node = node; 
            						self.boxDetalhesDaCidade.visible = (node ~= nil);
            						self.tabControl.tabIndex = 2;
            					end;
            
            					btn.onMouseDown = function(event) 
            						sheet.drag = true;
            						sheet.dragX = event.x;
            						sheet.dragY = event.y;
            					end;
            
            					btn.onMouseMove = function(event)
            						if sheet.drag~=true then return end;
            						sheet.dragged = true;
            
            						btn.top = btn.top + (event.y - sheet.dragY);
            						btn.left = btn.left + (event.x - sheet.dragX);
            					end;
            
            					btn.onMouseUp = function(event)
            						sheet.drag = false;
            
            						local mapImage = self:findControlByName("mapImage");
            						local scale = 1;
            						if mapImage.scale > 1 then
            							scale = 0.5;
            						end;
            						node.left = btn.left*scale;
            						node.top = btn.top*scale;
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
            					btn.width = largura2/scale;
            					btn.height = altura2/scale;
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
            						if sheet.dragged then
            							sheet.dragged = false;
            							return;
            						end;
            						self.boxDetalhesDaGeografia.node = node; 
            						self.boxDetalhesDaGeografia.visible = (node ~= nil);
            						self.tabControl.tabIndex = 3;
            					end;
            
            					btn.onMouseDown = function(event) 
            						sheet.drag = true;
            						sheet.dragX = event.x;
            						sheet.dragY = event.y;
            					end;
            
            					btn.onMouseMove = function(event)
            						if sheet.drag~=true then return end;
            						sheet.dragged = true;
            
            						btn.top = btn.top + (event.y - sheet.dragY);
            						btn.left = btn.left + (event.x - sheet.dragX);
            					end;
            
            					btn.onMouseUp = function(event)
            						sheet.drag = false;
            
            						local mapImage = self:findControlByName("mapImage");
            						local scale = 1;
            						if mapImage.scale > 1 then
            							scale = 0.5;
            						end;
            						node.left = btn.left*scale;
            						node.top = btn.top*scale;
            					end;
            
            					self.boxDetalhesDaGeografia.node = node;
            					self.boxDetalhesDaGeografia.visible = (node ~= nil);
            					self.tabControl.tabIndex = 3;
            
            				elseif sheet.altKey then
            					-- Zoom control
            					local mapRectangle = self:findControlByName("mapRectangle");
            					local scale = 2;
            					self.sizeLayout.left = 2320;
            
            					if mapImage.scale > 1 then
            						scale = 0.5;
            						self.sizeLayout.left = 1160;
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
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.mapa ~= nil then self.mapa:destroy(); self.mapa = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.sizeLayout ~= nil then self.sizeLayout:destroy(); self.sizeLayout = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.mapImage ~= nil then self.mapImage:destroy(); self.mapImage = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.mapRectangle ~= nil then self.mapRectangle:destroy(); self.mapRectangle = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
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
