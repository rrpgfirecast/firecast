require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_herancas()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

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
    obj:setName("herancas");
    obj:setHeight(25);
    obj:setAlign("top");
    obj:setMargins({bottom=10});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(85);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.nomeCheckHer_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckHer_01:setParent(obj.layout2);
    obj.nomeCheckHer_01:setField("fldCheckHer_01");
    obj.nomeCheckHer_01:setName("nomeCheckHer_01");
    obj.nomeCheckHer_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckHer_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckHer_01:setHeight(25);
    obj.nomeCheckHer_01:setWidth(14);
    obj.nomeCheckHer_01:setAlign("right");
    obj.nomeCheckHer_01:setMargins({left=3});
    obj.nomeCheckHer_01:setAutoChange(false);

    obj.nomeCheckHer_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckHer_02:setParent(obj.layout2);
    obj.nomeCheckHer_02:setField("fldCheckHer_02");
    obj.nomeCheckHer_02:setName("nomeCheckHer_02");
    obj.nomeCheckHer_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckHer_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckHer_02:setHeight(25);
    obj.nomeCheckHer_02:setWidth(14);
    obj.nomeCheckHer_02:setAlign("right");
    obj.nomeCheckHer_02:setMargins({left=3});
    obj.nomeCheckHer_02:setAutoChange(false);

    obj.nomeCheckHer_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckHer_03:setParent(obj.layout2);
    obj.nomeCheckHer_03:setField("fldCheckHer_03");
    obj.nomeCheckHer_03:setName("nomeCheckHer_03");
    obj.nomeCheckHer_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckHer_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckHer_03:setHeight(25);
    obj.nomeCheckHer_03:setWidth(14);
    obj.nomeCheckHer_03:setAlign("right");
    obj.nomeCheckHer_03:setMargins({left=3});
    obj.nomeCheckHer_03:setAutoChange(false);

    obj.nomeCheckHer_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckHer_04:setParent(obj.layout2);
    obj.nomeCheckHer_04:setField("fldCheckHer_04");
    obj.nomeCheckHer_04:setName("nomeCheckHer_04");
    obj.nomeCheckHer_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckHer_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckHer_04:setHeight(25);
    obj.nomeCheckHer_04:setWidth(14);
    obj.nomeCheckHer_04:setAlign("right");
    obj.nomeCheckHer_04:setMargins({left=3});
    obj.nomeCheckHer_04:setAutoChange(false);

    obj.nomeCheckHer_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckHer_05:setParent(obj.layout2);
    obj.nomeCheckHer_05:setField("fldCheckHer_05");
    obj.nomeCheckHer_05:setName("nomeCheckHer_05");
    obj.nomeCheckHer_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckHer_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckHer_05:setHeight(25);
    obj.nomeCheckHer_05:setWidth(14);
    obj.nomeCheckHer_05:setAlign("right");
    obj.nomeCheckHer_05:setMargins({left=3});
    obj.nomeCheckHer_05:setAutoChange(false);

    obj.nomeBut = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut:setParent(obj.layout1);
    obj.nomeBut:setName("nomeBut");
    obj.nomeBut:setText("𝐢");
    obj.nomeBut:setWidth(22);
    obj.nomeBut:setHeight(22);
    obj.nomeBut:setAlign("left");
    obj.nomeBut:setMargins({top=1, bottom=1, right=5});
    obj.nomeBut:setFontColor("#272727");

    obj.nomeButB = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeButB:setParent(obj.layout1);
    obj.nomeButB:setName("nomeButB");
    obj.nomeButB:setText("𝐢");
    obj.nomeButB:setWidth(22);
    obj.nomeButB:setHeight(22);
    obj.nomeButB:setAlign("left");
    obj.nomeButB:setMargins({top=1, bottom=1, right=5});
    obj.nomeButB:setFontColor("white");
    obj.nomeButB:setVisible(false);

    obj.popUp_ = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_:setParent(obj.layout1);
    obj.popUp_:setName("popUp_");
    obj.popUp_:setWidth(630);
    obj.popUp_:setHeight(350);
    obj.popUp_:setBackOpacity(0);
    obj.popUp_:setDrawContainer(false);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popUp_);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0e0e0e");
    obj.rectangle1:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0e0e0e");
    obj.rectangle2:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle2:setXradius(8);
    obj.rectangle2:setYradius(8);
    obj.rectangle2:setStrokeColor("#272727");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setField("fldHerancas");
    obj.label1:setHeight(35);
    obj.label1:setFontSize(30);
    obj.label1:setAlign("top");
    obj.label1:setMargins({top=5, left=10, right=80});
    obj.label1:setName("label1");
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setTextTrimming("character");
    obj.label1:setFontFamily("Constantia");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setField("fldHerTipo");
    lfm_setPropAsString(obj.label2, "anchors", "right top");
    obj.label2:setRight(0);
    obj.label2:setTop(25);
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setTextTrimming("character");
    obj.label2:setFontFamily("Constantia");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle2);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({left=10, right=10, top=10});
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#424242");

    obj.nomeHer = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeHer:setParent(obj.rectangle2);
    obj.nomeHer:setMargins({top=10, left=10, right=10, bottom=10});
    obj.nomeHer:setAlign("client");
    obj.nomeHer:setTransparent(true);
    obj.nomeHer:setFontColor("#cdcdcd");
    obj.nomeHer:setField("fld");
    obj.nomeHer:setName("nomeHer");
    obj.nomeHer:setFontFamily("Constantia");
    obj.nomeHer:setFontSize(15);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setField("fld");
    obj.dataLink1:setDefaultValue("Descrição da Herança");
    obj.dataLink1:setName("dataLink1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(182);
    lfm_setPropAsString(obj.edit1, "fontStyle", "bold");
    obj.edit1:setField("fldHerancas");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("fldHerancas");
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setName("dataLink2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setField("fldHerTipo");
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setItems({'Criatura', 'Guia', 'Relíquia', 'Seguidor'});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontSize(14);
    obj.comboBox1:setFontColor("#cdcdcd");
    obj.comboBox1:setTextTrimming("character");
    obj.comboBox1:setFontFamily("Constantia");
    obj.comboBox1:setTransparent(true);
    lfm_setPropAsString(obj.comboBox1, "fontStyle", "italic");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(22);
    obj.layout3:setHeight(22);
    obj.layout3:setName("layout3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setText("🞭");
    obj.button1:setWidth(22);
    obj.button1:setHeight(22);
    obj.button1:setHint("Apagar Herança");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeCheckHer_01:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckHer_01 = not sheet.fldCheckHer_01;
            				
            				if(sheet.fldCheckHer_02) then 
            					sheet.fldCheckHer_01 = true; 
            					sheet.fldCheckHer_02 = false; 
            					sheet.fldCheckHer_03 = false; 
            					sheet.fldCheckHer_04 = false; 
            					sheet.fldCheckHer_05 = false; 
            				end;
            			
        end);

    obj._e_event1 = obj.nomeCheckHer_02:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckHer_02 = not sheet.fldCheckHer_02;
            				
            				if(sheet.fldCheckHer_02) then 
            					sheet.fldCheckHer_01 = true; 
            				else 
            					sheet.fldCheckHer_01 = false;
            				end;
            				
            				if(sheet.fldCheckHer_03) then 
            					sheet.fldCheckHer_01 = true; 
            					sheet.fldCheckHer_02 = true; 
            					sheet.fldCheckHer_03 = false; 
            					sheet.fldCheckHer_04 = false; 
            					sheet.fldCheckHer_05 = false; 
            				end;
            			
        end);

    obj._e_event2 = obj.nomeCheckHer_03:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckHer_03 = not sheet.fldCheckHer_03;
            				
            				if(sheet.fldCheckHer_03) then 
            					sheet.fldCheckHer_01 = true; 
            					sheet.fldCheckHer_02 = true; 
            				else 
            					sheet.fldCheckHer_01 = false; 
            					sheet.fldCheckHer_02 = false; 
            				end;
            				
            				if(sheet.fldCheckHer_04) then 
            					sheet.fldCheckHer_01 = true; 
            					sheet.fldCheckHer_02 = true; 
            					sheet.fldCheckHer_03 = true; 
            					sheet.fldCheckHer_04 = false; 
            					sheet.fldCheckHer_05 = false; 
            				end;
            			
        end);

    obj._e_event3 = obj.nomeCheckHer_04:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckHer_04 = not sheet.fldCheckHer_04;
            				
            				if(sheet.fldCheckHer_04) then 
            					sheet.fldCheckHer_01 = true; 
            					sheet.fldCheckHer_02 = true; 
            					sheet.fldCheckHer_03 = true; 
            				else 
            					sheet.fldCheckHer_01 = false; 
            					sheet.fldCheckHer_02 = false; 
            					sheet.fldCheckHer_03 = false; 
            				end;
            				
            				if(sheet.fldCheckHer_05) then 
            					sheet.fldCheckHer_01 = true; 
            					sheet.fldCheckHer_02 = true; 
            					sheet.fldCheckHer_03 = true; 
            					sheet.fldCheckHer_04 = true; 
            					sheet.fldCheckHer_05 = false; 
            				end;
            			
        end);

    obj._e_event4 = obj.nomeCheckHer_05:addEventListener("onClick",
        function (event)
            
            				sheet.fldCheckHer_05 = not sheet.fldCheckHer_05;
            				
            				if(sheet.fldCheckHer_05) then 
            					sheet.fldCheckHer_01 = true; 
            					sheet.fldCheckHer_02 = true; 
            					sheet.fldCheckHer_03 = true; 
            					sheet.fldCheckHer_04 = true; 
            				else 
            					sheet.fldCheckHer_01 = false; 
            					sheet.fldCheckHer_02 = false; 
            					sheet.fldCheckHer_03 = false; 
            					sheet.fldCheckHer_04 = false; 
            				end;
            			
        end);

    obj._e_event5 = obj.nomeBut:addEventListener("onClick",
        function (event)
            local pop = self:findControlByName("popUp_");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("mouse", self.nomeTru_);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end);

    obj._e_event6 = obj.nomeButB:addEventListener("onClick",
        function (event)
            local pop = self:findControlByName("popUp_");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("mouse", self.nomeTru_);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end);

    obj._e_event7 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld == nil or sheet.fld == "Descrição da Herança") then
            										self.nomeBut.visible = true;
            										self.nomeButB.visible = false;
            									else
            										self.nomeButB.visible = true;
            										self.nomeBut.visible = false;
            									end;
        end);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.nomeCheckHer_04 ~= nil then self.nomeCheckHer_04:destroy(); self.nomeCheckHer_04 = nil; end;
        if self.popUp_ ~= nil then self.popUp_:destroy(); self.popUp_ = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.nomeCheckHer_01 ~= nil then self.nomeCheckHer_01:destroy(); self.nomeCheckHer_01 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.nomeCheckHer_05 ~= nil then self.nomeCheckHer_05:destroy(); self.nomeCheckHer_05 = nil; end;
        if self.nomeCheckHer_02 ~= nil then self.nomeCheckHer_02:destroy(); self.nomeCheckHer_02 = nil; end;
        if self.nomeBut ~= nil then self.nomeBut:destroy(); self.nomeBut = nil; end;
        if self.nomeHer ~= nil then self.nomeHer:destroy(); self.nomeHer = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.nomeButB ~= nil then self.nomeButB:destroy(); self.nomeButB = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.nomeCheckHer_03 ~= nil then self.nomeCheckHer_03:destroy(); self.nomeCheckHer_03 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newherancas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_herancas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _herancas = {
    newEditor = newherancas, 
    new = newherancas, 
    name = "herancas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

herancas = _herancas;
Firecast.registrarForm(_herancas);

return _herancas;
