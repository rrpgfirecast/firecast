require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_templateSkills()
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
    obj:setName("templateSkills");
    obj:setHeight(30);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setName("layout1");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout1);
    obj.checkBox1:setField("MarcadorSkillEscola");
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setMargins({left=23});
    obj.checkBox1:setHint("Perícia de Escola");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("MarcadorSkillEscola");
    obj.dataLink1:setDefaultValue("false");
    obj.dataLink1:setName("dataLink1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("nomeSkill");
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(195);
    obj.edit1:setMargins({right=2});
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("white");
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setTransparent(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setField("nomeSkill");
    obj.dataLink2:setName("dataLink2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(79);
    obj.rectangle1:setMargins({right=2});
    obj.rectangle1:setName("rectangle1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setField("tipoSkill");
    obj.comboBox1:setItems({'Alta', 'Baixa', 'Bugei', 'Mercante'});
    obj.comboBox1:setValues({'Alta', 'Baixa', 'Bugei', 'Mercante'});
    obj.comboBox1:setMargins({right=2, left=2});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontFamily("Cambria");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("#cdcdcd");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setField("rankSkill");
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(42);
    obj.edit2:setMargins({right=2});
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(99);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("white");
    obj.edit2:setName("edit2");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setTransparent(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setDefaultValue("1");
    obj.dataLink3:setField("rankSkill");
    obj.dataLink3:setName("dataLink3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setColor("#212121");
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(94);
    obj.rectangle2:setMargins({right=2});
    obj.rectangle2:setName("rectangle2");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle2);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setMargins({right=2, left=2});
    obj.comboBox2:setItems({'Vigor', 'Vontade', 'Força', 'Percepção', 'Reflexos', 'Astúcia', 'Agilidade', 'Inteligência', 'Vazio'});
    obj.comboBox2:setField("atributoSkill");
    obj.comboBox2:setValues({'StaminON', 'WillpoweON', 'StrengtON', 'PerceptioON', 'ReflexeON', 'AwarenesON', 'AgilitON', 'IntelligencON', 'VoiON'});
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setFontFamily("Cambria");
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setFontColor("#cdcdcd");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setField("ROLAGEM");
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(80);
    obj.edit3:setMargins({right=2});
    obj.edit3:setName("edit3");
    obj.edit3:setFontFamily("Cambria");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontColor("#cdcdcd");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout1);
    obj.dataLink4:setDefaultValue("xky");
    obj.dataLink4:setField("ROLAGEM");
    obj.dataLink4:setName("dataLink4");

    obj.btnEnfase1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEnfase1:setParent(obj.layout1);
    obj.btnEnfase1:setTop(0);
    obj.btnEnfase1:setLeft(541);
    obj.btnEnfase1:setText("𝐞");
    obj.btnEnfase1:setHint("Ênfases");
    obj.btnEnfase1:setName("btnEnfase1");
    obj.btnEnfase1:setWidth(30);
    obj.btnEnfase1:setHeight(30);
    obj.btnEnfase1:setFontColor("#272727");

    obj.btnEnfase2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEnfase2:setParent(obj.layout1);
    obj.btnEnfase2:setTop(0);
    obj.btnEnfase2:setLeft(541);
    obj.btnEnfase2:setText("𝐞");
    obj.btnEnfase2:setHint("Ênfases");
    obj.btnEnfase2:setName("btnEnfase2");
    obj.btnEnfase2:setWidth(30);
    obj.btnEnfase2:setHeight(30);
    obj.btnEnfase2:setVisible(false);

    obj.popUp_Enfases = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_Enfases:setParent(obj.layout1);
    obj.popUp_Enfases:setName("popUp_Enfases");
    obj.popUp_Enfases:setWidth(200);
    obj.popUp_Enfases:setHeight(150);
    obj.popUp_Enfases:setBackOpacity(0);
    obj.popUp_Enfases:setDrawContainer(false);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.popUp_Enfases);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#0e0e0e");
    obj.rectangle3:setPadding({top=10, left=10, bottom=10, right=10});
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle3);
    obj.label1:setAlign("top");
    obj.label1:setText("Ê N F A S E S");
    obj.label1:setMargins({bottom=5});
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontFamily("Constantia");
    obj.label1:setName("label1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle3);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({bottom=5});
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setName("horzLine1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle3);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setFontFamily("Cambria");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setField("enfasesSkill");
    obj.textEditor1:setName("textEditor1");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle3);
    obj.dataLink5:setField("enfasesSkill");
    obj.dataLink5:setDefaultValue("—");
    obj.dataLink5:setName("dataLink5");

    obj.btnMaestria1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMaestria1:setParent(obj.layout1);
    obj.btnMaestria1:setTop(0);
    obj.btnMaestria1:setLeft(572);
    obj.btnMaestria1:setText("𝐌");
    obj.btnMaestria1:setHint("Maestrias");
    obj.btnMaestria1:setName("btnMaestria1");
    obj.btnMaestria1:setHeight(30);
    obj.btnMaestria1:setWidth(30);
    obj.btnMaestria1:setFontColor("#272727");

    obj.btnMaestria2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMaestria2:setParent(obj.layout1);
    obj.btnMaestria2:setTop(0);
    obj.btnMaestria2:setLeft(572);
    obj.btnMaestria2:setText("𝐌");
    obj.btnMaestria2:setHint("Maestrias");
    obj.btnMaestria2:setName("btnMaestria2");
    obj.btnMaestria2:setHeight(30);
    obj.btnMaestria2:setWidth(30);
    obj.btnMaestria2:setVisible(false);

    obj.popUp_Maestrias = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_Maestrias:setParent(obj.layout1);
    obj.popUp_Maestrias:setName("popUp_Maestrias");
    obj.popUp_Maestrias:setWidth(385);
    obj.popUp_Maestrias:setHeight(350);
    obj.popUp_Maestrias:setBackOpacity(0);
    obj.popUp_Maestrias:setDrawContainer(false);

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.popUp_Maestrias);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#0e0e0e");
    obj.rectangle4:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setName("rectangle4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle4);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#0e0e0e");
    obj.rectangle5:setPadding({top=10, left=10, bottom=10, right=10});
    obj.rectangle5:setXradius(8);
    obj.rectangle5:setYradius(8);
    obj.rectangle5:setStrokeColor("#272727");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setName("rectangle5");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle5);
    obj.label2:setAlign("top");
    obj.label2:setHeight(30);
    obj.label2:setFontSize(25);
    obj.label2:setMargins({bottom=10});
    obj.label2:setFontFamily("Constantia");
    obj.label2:setText("HABILIDADES DE MAESTRIA");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle5);
    obj.label3:setAlign("top");
    obj.label3:setText("N Í V E L   3");
    obj.label3:setMargins({bottom=5});
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontFamily("Constantia");
    obj.label3:setName("label3");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.rectangle5);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setMargins({bottom=5});
    obj.horzLine2:setStrokeColor("#424242");
    obj.horzLine2:setName("horzLine2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle5);
    obj.textEditor2:setAlign("top");
    obj.textEditor2:setHeight(55);
    obj.textEditor2:setMargins({bottom=10});
    obj.textEditor2:setFontFamily("Cambria");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setField("maestria3Skill");
    obj.textEditor2:setName("textEditor2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle5);
    obj.label4:setAlign("top");
    obj.label4:setText("N Í V E L   5");
    obj.label4:setMargins({bottom=5});
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontFamily("Constantia");
    obj.label4:setName("label4");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.rectangle5);
    obj.horzLine3:setAlign("top");
    obj.horzLine3:setMargins({bottom=5});
    obj.horzLine3:setStrokeColor("#424242");
    obj.horzLine3:setName("horzLine3");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle5);
    obj.textEditor3:setAlign("top");
    obj.textEditor3:setHeight(55);
    obj.textEditor3:setMargins({bottom=10});
    obj.textEditor3:setFontFamily("Cambria");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setField("maestria5Skill");
    obj.textEditor3:setName("textEditor3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle5);
    obj.label5:setAlign("top");
    obj.label5:setText("N Í V E L   7");
    obj.label5:setMargins({bottom=5});
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontFamily("Constantia");
    obj.label5:setName("label5");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.rectangle5);
    obj.horzLine4:setAlign("top");
    obj.horzLine4:setMargins({bottom=5});
    obj.horzLine4:setStrokeColor("#424242");
    obj.horzLine4:setName("horzLine4");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle5);
    obj.textEditor4:setAlign("top");
    obj.textEditor4:setHeight(55);
    obj.textEditor4:setMargins({bottom=10});
    obj.textEditor4:setFontFamily("Cambria");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setField("maestria7Skill");
    obj.textEditor4:setName("textEditor4");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle5);
    obj.dataLink6:setFields({'maestria3Skill', 'maestria5Skill', 'maestria7Skill'});
    obj.dataLink6:setDefaultValues({'—', '—', '—'});
    obj.dataLink6:setName("dataLink6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle5);
    obj.label6:setTop(50);
    obj.label6:setLeft(53);
    obj.label6:setWidth(300);
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setField("nomeSkill");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontFamily("Constantia");
    obj.label6:setName("label6");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setTop(0);
    obj.button1:setLeft(603);
    obj.button1:setText("🞭");
    obj.button1:setHint("Apagar Perícia");
    obj.button1:setHeight(30);
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout1);
    obj.dataLink7:setField("rankSkill");
    obj.dataLink7:setName("dataLink7");

    obj._e_event0 = obj.btnEnfase1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_Enfases");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("right", self.btnEnfase1);
            				else
            					showMessage("Ops, não encontrei o pop-up para exibir");
            				end;
        end, obj);

    obj._e_event1 = obj.btnEnfase2:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_Enfases");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("right", self.btnEnfase2);
            				else
            					showMessage("Ops, não encontrei o pop-up para exibir");
            				end;
        end, obj);

    obj._e_event2 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            						if(sheet.enfasesSkill == nil or sheet.enfasesSkill == "—") then
            							self.btnEnfase1.visible = true;
            							self.btnEnfase2.visible = false;
            						else
            							self.btnEnfase2.visible = true;
            							self.btnEnfase1.visible = false;
            						end;
        end, obj);

    obj._e_event3 = obj.btnMaestria1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_Maestrias");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("right", self.btnMaestria1);
            				else
            					showMessage("Ops, não encontrei o pop-up para exibir");
            				end;
        end, obj);

    obj._e_event4 = obj.btnMaestria2:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_Maestrias");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("right", self.btnMaestria2);
            				else
            					showMessage("Ops, não encontrei o pop-up para exibir");
            				end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							if(	(sheet.maestria3Skill == nil or sheet.maestria3Skill == "—") and
            								(sheet.maestria5Skill == nil or sheet.maestria5Skill == "—") and
            								(sheet.maestria7Skill == nil or sheet.maestria7Skill == "—")) then
            								self.btnMaestria1.visible = true;
            								self.btnMaestria2.visible = false;
            							else
            								self.btnMaestria2.visible = true;
            								self.btnMaestria1.visible = false;
            							end;
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					local node = NDB.getRoot(sheet);
            					local objetos = NDB.getChildNodes(node.pericias);
            					local soma = 0;
            
            					for i=1, #objetos, 1 do 
            						soma = soma + (tonumber(objetos[i].rankSkill) or 0);
            					end;
            
            					node.countSum = soma;
            				end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.btnEnfase2 ~= nil then self.btnEnfase2:destroy(); self.btnEnfase2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.popUp_Enfases ~= nil then self.popUp_Enfases:destroy(); self.popUp_Enfases = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.popUp_Maestrias ~= nil then self.popUp_Maestrias:destroy(); self.popUp_Maestrias = nil; end;
        if self.btnEnfase1 ~= nil then self.btnEnfase1:destroy(); self.btnEnfase1 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.btnMaestria1 ~= nil then self.btnMaestria1:destroy(); self.btnMaestria1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.btnMaestria2 ~= nil then self.btnMaestria2:destroy(); self.btnMaestria2 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtemplateSkills()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_templateSkills();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _templateSkills = {
    newEditor = newtemplateSkills, 
    new = newtemplateSkills, 
    name = "templateSkills", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

templateSkills = _templateSkills;
Firecast.registrarForm(_templateSkills);

return _templateSkills;
