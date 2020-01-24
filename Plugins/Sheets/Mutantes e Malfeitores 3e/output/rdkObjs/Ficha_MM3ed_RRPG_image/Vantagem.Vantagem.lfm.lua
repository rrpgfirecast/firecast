require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaMM3eVantagens_svg()
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
    obj:setName("frmFichaMM3eVantagens_svg");
    obj:setWidth(435);
    obj:setHeight(25);
    obj:setTheme("light");
    obj:setMargins({top=2, bottom=2, right=2});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa Vantagem?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;
		
		


    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(383);
    obj.button1:setTop(-1);
    obj.button1:setAlign("right");
    obj.button1:setWidth(13);
    obj.button1:setHeight(13);
    obj.button1:setText("X");
    obj.button1:setVertTextAlign("center");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#bedbd5");
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setHeight(32);
    obj.rectangle1:setName("rectangle1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(164);
    obj.textEditor1:setTop(-2);
    obj.textEditor1:setWidth(206);
    obj.textEditor1:setHeight(30);
    obj.textEditor1:setFontSize(10);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("descVantagem");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setFontColor("black");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(168);
    obj.edit1:setHeight(28);
    obj.edit1:setField("nomeVantagem");
    obj.edit1:setName("edit1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(368);
    obj.rectangle2:setTop(-1);
    obj.rectangle2:setWidth(20);
    obj.rectangle2:setHeight(29);
    obj.rectangle2:setAlign("right");
    obj.rectangle2:setColor("#3f8270");
    obj.rectangle2:setStrokeColor("#bedbd5");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontColor("white");
    obj.edit2:setLeft(364);
    obj.edit2:setTop(-1);
    obj.edit2:setWidth(22);
    obj.edit2:setHeight(29);
    obj.edit2:setField("ppVantagem");
    obj.edit2:setName("edit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'ppVantagem'});
    obj.dataLink1:setDefaultValues({'1'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'ppVantagem'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            				local node = NDB.getRoot(sheet);
            				local mod = 0;
            
            				local nodes = NDB.getChildNodes(node.dVantagens); 
            				--showMessage(#nodes);
            				for i=1, #nodes, 1 do					
            					mod = mod + (tonumber(nodes[i].ppVantagem) or 0);					
            				end
            
            				node.TotalppVantagem = mod;				
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaMM3eVantagens_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaMM3eVantagens_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaMM3eVantagens_svg = {
    newEditor = newfrmFichaMM3eVantagens_svg, 
    new = newfrmFichaMM3eVantagens_svg, 
    name = "frmFichaMM3eVantagens_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaMM3eVantagens_svg = _frmFichaMM3eVantagens_svg;
Firecast.registrarForm(_frmFichaMM3eVantagens_svg);

return _frmFichaMM3eVantagens_svg;
