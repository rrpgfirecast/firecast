require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmGeography()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmGeography");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.rclDestalhesDaGeografia = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDestalhesDaGeografia:setParent(obj.scrollBox1);
    obj.rclDestalhesDaGeografia:setLeft(0);
    obj.rclDestalhesDaGeografia:setTop(0);
    obj.rclDestalhesDaGeografia:setWidth(200);
    obj.rclDestalhesDaGeografia:setHeight(595);
    obj.rclDestalhesDaGeografia:setName("rclDestalhesDaGeografia");
    obj.rclDestalhesDaGeografia:setField("listaDeDestalhesDaGeografia");
    obj.rclDestalhesDaGeografia:setTemplateForm("frmGeographySelection");
    obj.rclDestalhesDaGeografia:setLayout("vertical");
    obj.rclDestalhesDaGeografia:setSelectable(true);

    obj.boxDetalhesDaGeografia = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDaGeografia:setParent(obj.scrollBox1);
    obj.boxDetalhesDaGeografia:setLeft(210);
    obj.boxDetalhesDaGeografia:setTop(0);
    obj.boxDetalhesDaGeografia:setWidth(1030);
    obj.boxDetalhesDaGeografia:setHeight(600);
    obj.boxDetalhesDaGeografia:setName("boxDetalhesDaGeografia");
    obj.boxDetalhesDaGeografia:setVisible(false);

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.boxDetalhesDaGeografia);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("descricao");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj._e_event0 = obj.rclDestalhesDaGeografia:addEventListener("onEndEnumeration",
        function (_)
            if sheet~= nil then
            					local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            					local mapa = self:findControlByName("mapa");
            
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            
            						local altura2 = tonumber(sheet.altura2) or 30;
            						local largura2 = tonumber(sheet.largura2) or 30;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn == nil then
            								local btn = gui.newButton();
            								btn.parent = mapa;
            								btn.left = node.left;
            								btn.top = node.top;
            								btn.width = largura2;
            								btn.height = altura2;
            								btn.cursor = "handPoint";
            								btn.hint = node.nome;
            								btn.opacity = 0.35;
            								btn.name = node.name;
            								btn.text = "";
            
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
            									local mapImage = self:findControlByName("mapImage");
            									local scale = 1;
            									if mapImage.scale > 1 then
            										scale = 0.5;
            									end;
            
            									sheet.drag = false;
            									node.left = btn.left*scale;
            									node.top = btn.top*scale;
            								end;
            							end;
            						end;
            					end;
            
            					if self.rclDestalhesDaGeografia.selectedNode== nil and #lugares>0 then
            						self.rclDestalhesDaGeografia.selectedNode = lugares[1]; 
            					end;
            				end;
        end, obj);

    obj._e_event1 = obj.rclDestalhesDaGeografia:addEventListener("onSelect",
        function (_)
            local node = self.rclDestalhesDaGeografia.selectedNode;
            					self.boxDetalhesDaGeografia.node = node; 
            					self.boxDetalhesDaGeografia.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.rclDestalhesDaGeografia:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            		        if (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            		            return -1;
            		        elseif (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            		            return 1;
            		        else   
            		            return 0;
            		        end;
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

        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.boxDetalhesDaGeografia ~= nil then self.boxDetalhesDaGeografia:destroy(); self.boxDetalhesDaGeografia = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.rclDestalhesDaGeografia ~= nil then self.rclDestalhesDaGeografia:destroy(); self.rclDestalhesDaGeografia = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGeography = {
    newEditor = newfrmGeography, 
    new = newfrmGeography, 
    name = "frmGeography", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeography = _frmGeography;
Firecast.registrarForm(_frmGeography);

return _frmGeography;
