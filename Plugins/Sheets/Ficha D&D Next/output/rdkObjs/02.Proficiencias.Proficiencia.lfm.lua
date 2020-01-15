require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDnDNext_proficiencias_proficiencia()
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
    obj:setName("frmDnDNext_proficiencias_proficiencia");
    obj:setHeight(25);
    obj:setWidth(350);
    obj:setMargins({top=2,right=10});

			
		local function askForDelete()
			dialogs.confirmYesNo("Deseja realmente apagar essa habilidade?",
				function (confirmado)
					if confirmado then
						ndb.deleteNode(sheet);
					end;
				end);
		end;
	


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#202020");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.x1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.x1:setParent(obj);
    obj.x1:setAlign("left");
    obj.x1:setWidth(20);
    obj.x1:setField("x1");
    obj.x1:setName("x1");
    obj.x1:setOptimize(false);
    obj.x1:setImageChecked("images/checkbox1_checked.png");
    obj.x1:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.x1:setHeight(20);

    obj.x2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.x2:setParent(obj);
    obj.x2:setAlign("left");
    obj.x2:setWidth(20);
    obj.x2:setField("x2");
    obj.x2:setName("x2");
    obj.x2:setOptimize(false);
    obj.x2:setImageChecked("images/checkbox1_checked.png");
    obj.x2:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.x2:setHeight(20);

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setField("atr");
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setName("comboBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(26);
    obj.layout1:setMargins({left=2});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setField("total");
    obj.label1:setAlign("client");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("trailing");
    obj.label1:setTextTrimming("none");
    obj.label1:setName("label1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout1);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setName("horzLine1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nome");
    obj.edit1:setVertTextAlign("trailing");
    obj.edit1:setMargins({left=5});
    obj.edit1:setWordWrap(false);
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'x1','x2','atr'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("losango");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("x1");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("x2");
    obj.dataLink4:setName("dataLink4");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = ndb.getRoot(sheet);
            
            			local bonus = 0;
            			if sheet.x1 then
            				bonus = tonumber(node.bonusProficiencia) or 0;
            			elseif sheet.x2 then
            				bonus = (tonumber(node.bonusProficiencia) or 0) * 2;
            			end;
            			
            			local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma", ""};
            			local atrNum = tonumber(sheet.atr) or 7;
            			local atribute = atr[atrNum] or "";
            			mod = tonumber(node.atributos["mod" .. atribute]) or 0;
            			
            			sheet.total = bonus + mod;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.losango then 
            				self.x1.imageChecked="images/checkbox2_checked.png";
            				self.x1.imageUnchecked="images/checkbox2_unchecked.png";
            				self.x2.imageChecked="images/checkbox2_checked.png";
            				self.x2.imageUnchecked="images/checkbox2_unchecked.png";
            			else
            				self.x1.imageChecked="images/checkbox1_checked.png";
            				self.x1.imageUnchecked="images/checkbox1_unchecked.png";
            				self.x2.imageChecked="images/checkbox1_checked.png";
            				self.x2.imageUnchecked="images/checkbox1_unchecked.png";
            			end;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.x1 then
            				sheet.x2 = false;
            			end
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.x2 then
            				sheet.x1 = false;
            			end
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.x2 ~= nil then self.x2:destroy(); self.x2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.x1 ~= nil then self.x1:destroy(); self.x1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDnDNext_proficiencias_proficiencia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDnDNext_proficiencias_proficiencia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDnDNext_proficiencias_proficiencia = {
    newEditor = newfrmDnDNext_proficiencias_proficiencia, 
    new = newfrmDnDNext_proficiencias_proficiencia, 
    name = "frmDnDNext_proficiencias_proficiencia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDnDNext_proficiencias_proficiencia = _frmDnDNext_proficiencias_proficiencia;
Firecast.registrarForm(_frmDnDNext_proficiencias_proficiencia);

return _frmDnDNext_proficiencias_proficiencia;
