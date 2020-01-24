require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frm_FM()
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
    obj:setName("frm_FM");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ficha_MM3e");
    obj:setTitle("Ficha Multiaba");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(150);
    obj.label1:setTop(0);
    obj.label1:setWidth(550);
    obj.label1:setHeight(50);
    obj.label1:setRotationAngle(0);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setText("Os códigos desta aba foram adaptados de Ambesek/RPGMeister no GitHub.\n Obrigado por compartilhar! ^^");
    obj.label1:setName("label1");

    obj.popCredit = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCredit:setParent(obj.scrollBox1);
    obj.popCredit:setName("popCredit");
    obj.popCredit:setWidth(210);
    obj.popCredit:setHeight(120);
    obj.popCredit:setBackOpacity(0.4);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.popCredit);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(120);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setHeight(110);
    obj.rectangle1:setColor("#3f8270");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(0);
    obj.label2:setTop(1);
    obj.label2:setWidth(200);
    obj.label2:setHeight(50);
    obj.label2:setText("● Antes de criar, estabeleça um Padrão Global no botão ao lado.");
    obj.label2:setFontColor("white");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(0);
    obj.label3:setTop(40);
    obj.label3:setWidth(200);
    obj.label3:setHeight(70);
    obj.label3:setText("● Acumular muitas abas pode gerar algum lag para carregar \n a ficha. ");
    obj.label3:setFontColor("white");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setMargins({top=2});
    obj.label3:setName("label3");

    obj.popupSettings = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupSettings:setParent(obj.scrollBox1);
    obj.popupSettings:setName("popupSettings");
    obj.popupSettings:setWidth(210);
    obj.popupSettings:setHeight(160);
    obj.popupSettings:setBackOpacity(0.4);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.popupSettings);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(160);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(150);
    obj.rectangle2:setColor("#3f8270");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setTop(0);
    obj.label4:setWidth(150);
    obj.label4:setHeight(25);
    obj.label4:setText("Cor padrão de Fundo");
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.colorComboBox1 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorComboBox1:setParent(obj.layout2);
    obj.colorComboBox1:setLeft(150);
    obj.colorComboBox1:setTop(0);
    obj.colorComboBox1:setWidth(50);
    obj.colorComboBox1:setHeight(25);
    obj.colorComboBox1:setField("backgroundColor");
    obj.colorComboBox1:setColor("black");
    obj.colorComboBox1:setUseAlpha(false);
    obj.colorComboBox1:setHint("Muda a cor padrão da cor de fundo do editor de texto. ");
    obj.colorComboBox1:setName("colorComboBox1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setTop(25);
    obj.label5:setWidth(150);
    obj.label5:setHeight(25);
    obj.label5:setText("Cor padrão de Fonte");
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.colorComboBox2 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.colorComboBox2:setParent(obj.layout2);
    obj.colorComboBox2:setLeft(150);
    obj.colorComboBox2:setTop(25);
    obj.colorComboBox2:setWidth(50);
    obj.colorComboBox2:setHeight(25);
    obj.colorComboBox2:setField("fontColor");
    obj.colorComboBox2:setColor("black");
    obj.colorComboBox2:setUseAlpha(false);
    obj.colorComboBox2:setHint("Muda a cor padrão da fonte do editor de texto.");
    obj.colorComboBox2:setName("colorComboBox2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("fontColor");
    obj.dataLink1:setDefaultValue("#FFFFFF");
    obj.dataLink1:setName("dataLink1");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setTop(50);
    obj.label6:setWidth(150);
    obj.label6:setHeight(25);
    obj.label6:setText("Tamanho padrão de Fonte");
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontSize(11);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(150);
    obj.edit1:setTop(50);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setType("number");
    obj.edit1:setField("fontSize");
    obj.edit1:setMin(8);
    obj.edit1:setMax(72);
    obj.edit1:setName("edit1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setField("fontSize");
    obj.dataLink2:setDefaultValue("15");
    obj.dataLink2:setName("dataLink2");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout2);
    obj.checkBox1:setTop(75);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setText("Ocultar barra de edição");
    obj.checkBox1:setFontColor("white");
    obj.checkBox1:setVertTextAlign("center");
    obj.checkBox1:setField("showToolbar");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout2);
    obj.checkBox2:setTop(100);
    obj.checkBox2:setWidth(200);
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setText("Padrão Global.");
    obj.checkBox2:setFontColor("white");
    obj.checkBox2:setVertTextAlign("center");
    obj.checkBox2:setField("global");
    obj.checkBox2:setHint("Vai usar essas configurações em todas as abas.");
    obj.checkBox2:setName("checkBox2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setTop(125);
    obj.button1:setWidth(200);
    obj.button1:setHeight(25);
    obj.button1:setText("Padrão Global.");
    obj.button1:setHint("Vai usar as últimas configurações usadas em outras abas nessa.");
    obj.button1:setName("button1");


			local default = NDB.load("defaults.xml");
			
			--colocar algo para quando sheet terminar de carregar puxar os valores de default. 

			local function dump(o)
			   if type(o) == 'table' then
				  local s = '{ '
				  for k,v in pairs(o) do
					 if type(k) ~= 'number' then k = '"'..k..'"' end
					 s = s .. '['..k..'] = ' .. dump(v) .. ','
				  end
				  return s .. '} '
			   else
				  return tostring(o)
			   end
			end
			
			local function loadDefault()
				if sheet==nil then return end;

				if default.global then
					sheet.showToolbar = default.showToolbar;
					sheet.fontSize = default.fontSize;
					sheet.fontColor = default.fontColor;
					sheet.backgroundColor = default.backgroundColor;
					sheet.global = true;
				end;

				self.txt.showToolbar = not sheet.showToolbar;
				self.txt.defaultFontSize = sheet.fontSize;
				self.txt.defaultFontColor = sheet.fontColor;
				self.txt.backgroundColor = sheet.backgroundColor;

			end;
			


    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setAlign("top");
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(150);
    obj.layout4:setName("layout4");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout4);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(45);
    obj.button2:setHeight(45);
    obj.button2:setText("");
    obj.button2:setHint("Adiciona nova aba. ");
    obj.button2:setName("button2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button2);
    obj.image1:setLeft(5);
    obj.image1:setTop(5);
    obj.image1:setWidth(35);
    obj.image1:setHeight(35);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/addIcon.png");
    obj.image1:setName("image1");

    obj.settingsBT = GUI.fromHandle(_obj_newObject("button"));
    obj.settingsBT:setParent(obj.layout4);
    obj.settingsBT:setLeft(50);
    obj.settingsBT:setTop(0);
    obj.settingsBT:setWidth(45);
    obj.settingsBT:setHeight(45);
    obj.settingsBT:setText("");
    obj.settingsBT:setName("settingsBT");
    obj.settingsBT:setHint("Opções da ficha.");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.settingsBT);
    obj.image2:setLeft(5);
    obj.image2:setTop(5);
    obj.image2:setWidth(35);
    obj.image2:setHeight(35);
    obj.image2:setSRC("/Ficha_MM3ed_RRPG_image/images/config.png");
    obj.image2:setName("image2");

    obj.creditBt = GUI.fromHandle(_obj_newObject("button"));
    obj.creditBt:setParent(obj.layout4);
    obj.creditBt:setLeft(100);
    obj.creditBt:setTop(0);
    obj.creditBt:setWidth(45);
    obj.creditBt:setHeight(45);
    obj.creditBt:setText("");
    obj.creditBt:setName("creditBt");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.creditBt);
    obj.image3:setLeft(5);
    obj.image3:setTop(5);
    obj.image3:setWidth(35);
    obj.image3:setHeight(35);
    obj.image3:setSRC("/Ficha_MM3ed_RRPG_image/images/helpIcon.png");
    obj.image3:setName("image3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("client");
    obj.layout5:setName("layout5");

    obj.rclAbas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAbas:setParent(obj.layout5);
    obj.rclAbas:setName("rclAbas");
    obj.rclAbas:setField("abas");
    obj.rclAbas:setTemplateForm("frm_FM_Aba");
    obj.rclAbas:setAlign("top");
    obj.rclAbas:setHeight(46);
    obj.rclAbas:setSelectable(true);
    obj.rclAbas:setLayout("horizontal");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setAlign("client");
    obj.layout6:setName("layout6");

    obj.boxTexto = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxTexto:setParent(obj.layout6);
    obj.boxTexto:setName("boxTexto");
    obj.boxTexto:setAlign("client");
    obj.boxTexto:setVisible(false);

    obj.txt = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.txt:setParent(obj.boxTexto);
    obj.txt:setName("txt");
    obj.txt:setAlign("client");
    lfm_setPropAsString(obj.txt, "backgroundColor",  "black");
    lfm_setPropAsString(obj.txt, "defaultFontColor",  "white");
    obj.txt:setField("txt");
    lfm_setPropAsString(obj.txt, "hideSelection",  "false");
    lfm_setPropAsString(obj.txt, "animateImages",  "true");

    obj._e_event0 = obj.colorComboBox1:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.backgroundColor = sheet.backgroundColor;
            							default.backgroundColor = sheet.backgroundColor;
            						end;
        end, obj);

    obj._e_event1 = obj.colorComboBox2:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.defaultFontColor = sheet.fontColor;
            							default.fontColor = sheet.fontColor;
            						end;
        end, obj);

    obj._e_event2 = obj.edit1:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.defaultFontSize = sheet.fontSize;
            							default.fontSize = sheet.fontSize;
            						end;
        end, obj);

    obj._e_event3 = obj.checkBox1:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            							self.txt.showToolbar = not sheet.showToolbar;
            							default.showToolbar = sheet.showToolbar;
            						end;
        end, obj);

    obj._e_event4 = obj.checkBox2:addEventListener("onChange",
        function (_)
            if sheet~=nil then
            						default.global = sheet.global;
            					end;
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            							local default = NDB.load("defaults.xml");
            							
            							sheet.showToolbar = default.showToolbar;
            							self.txt.showToolbar = not sheet.showToolbar;
            
            							sheet.fontSize = default.fontSize;
            							self.txt.defaultFontSize = sheet.fontSize;
            
            							sheet.fontColor = default.fontColor;
            							self.txt.defaultFontColor = sheet.fontColor;
            							
            							sheet.backgroundColor = default.backgroundColor;
            							self.txt.backgroundColor = sheet.backgroundColor;
            						end;
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclAbas:append();
        end, obj);

    obj._e_event7 = obj.settingsBT:addEventListener("onClick",
        function (_)
            loadDefault();
            						local pop = self:findControlByName("popupSettings");
            					
            						if pop ~= nil then
            							pop:setNodeObject(self.sheet);
            							pop:showPopupEx("bottom", self.settingsBT);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup de opções para exibir");
            						end;
        end, obj);

    obj._e_event8 = obj.creditBt:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popCredit");
            					
            						if pop ~= nil then
            							pop:setNodeObject(self.sheet);
            							pop:showPopupEx("bottom", self.creditBt);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup de creditos para exibir");
            						end;
        end, obj);

    obj._e_event9 = obj.rclAbas:addEventListener("onSelect",
        function (_)
            local node = self.rclAbas.selectedNode;
            						self.boxTexto.node = node;
            						self.boxTexto.visible = (node ~= nil);
        end, obj);

    obj._e_event10 = obj.rclAbas:addEventListener("onEndEnumeration",
        function (_)
            if self.rclAbas.selectedNode == nil and sheet ~= nil then
            							local nodes = NDB.getChildNodes(sheet.abas);			   
            
            							if #nodes > 0 then
            								self.rclAbas.selectedNode = nodes[1];
            							end;
            						end;
        end, obj);

    obj._e_event11 = obj.txt:addEventListener("onMouseMove",
        function (_, event)
            loadDefault();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
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

        if self.settingsBT ~= nil then self.settingsBT:destroy(); self.settingsBT = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.creditBt ~= nil then self.creditBt:destroy(); self.creditBt = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.boxTexto ~= nil then self.boxTexto:destroy(); self.boxTexto = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.popupSettings ~= nil then self.popupSettings:destroy(); self.popupSettings = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.popCredit ~= nil then self.popCredit:destroy(); self.popCredit = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.colorComboBox2 ~= nil then self.colorComboBox2:destroy(); self.colorComboBox2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rclAbas ~= nil then self.rclAbas:destroy(); self.rclAbas = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.txt ~= nil then self.txt:destroy(); self.txt = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.colorComboBox1 ~= nil then self.colorComboBox1:destroy(); self.colorComboBox1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrm_FM()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frm_FM();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frm_FM = {
    newEditor = newfrm_FM, 
    new = newfrm_FM, 
    name = "frm_FM", 
    dataType = "Ficha_MM3e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Multiaba", 
    description=""};

frm_FM = _frm_FM;
Firecast.registrarForm(_frm_FM);
Firecast.registrarDataType(_frm_FM);

return _frm_FM;
