require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_templateMagias()
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
    obj:setName("templateMagias");
    obj:setHeight(170);
    obj:setWidth(302.5);
    obj:setMargins({top=3, bottom=3, right=3, left=3});

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'elemMagia'});
    obj.dataLink1:setName("dataLink1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setColor("#202020");
    obj.rectangle1:setName("rectangle1");

    obj.imagMagia = GUI.fromHandle(_obj_newObject("image"));
    obj.imagMagia:setParent(obj.rectangle1);
    obj.imagMagia:setField("imagemMagia");
    obj.imagMagia:setName("imagMagia");
    obj.imagMagia:setAlign("client");
    obj.imagMagia:setStyle("autoFit");
    obj.imagMagia:setMargins({right=20, left=20});
    obj.imagMagia:setOpacity(0.2);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setHeight(30);
    obj.layout1:setTop(10);
    obj.layout1:setLeft(10);
    obj.layout1:setWidth(282.5);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Nome:");
    obj.label1:setAlign("left");
    obj.label1:setWidth(40);
    obj.label1:setMargins({right=2});
    obj.label1:setName("label1");
    obj.label1:setFontFamily("Cambria");
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("🞭");
    obj.button1:setWidth(30);
    obj.button1:setAlign("right");
    obj.button1:setMargins({left=2});
    obj.button1:setName("button1");
    obj.button1:setFontFamily("Cambria");
    obj.button1:setFontColor("white");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("nomeMagia");
    obj.edit1:setAlign("client");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontColor("#cdcdcd");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setField("nomeMagia");
    obj.dataLink2:setName("dataLink2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setHeight(30);
    obj.layout2:setTop(40);
    obj.layout2:setLeft(10);
    obj.layout2:setWidth(282.5);
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Keywords:");
    obj.label2:setAlign("left");
    obj.label2:setWidth(65);
    obj.label2:setMargins({right=2});
    obj.label2:setName("label2");
    obj.label2:setFontFamily("Cambria");
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setWidth(92);
    obj.layout3:setAlign("right");
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setText("Maestria:");
    obj.label3:setAlign("left");
    obj.label3:setWidth(60);
    obj.label3:setMargins({right=2});
    obj.label3:setName("label3");
    obj.label3:setFontFamily("Cambria");
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setAlign("left");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("lvlMagia");
    obj.edit2:setWidth(30);
    obj.edit2:setType("number");
    obj.edit2:setMargins({right=2});
    obj.edit2:setName("edit2");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontColor("#cdcdcd");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout3);
    obj.dataLink3:setDefaultValue("0");
    obj.dataLink3:setField("lvlMagia");
    obj.dataLink3:setName("dataLink3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setAlign("client");
    obj.edit3:setField("tipoMagia");
    obj.edit3:setMargins({right=2});
    obj.edit3:setName("edit3");
    obj.edit3:setFontFamily("Cambria");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontColor("#cdcdcd");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout2);
    obj.dataLink4:setDefaultValue("—");
    obj.dataLink4:setField("tipoMagia");
    obj.dataLink4:setName("dataLink4");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setHeight(30);
    obj.layout4:setTop(70);
    obj.layout4:setLeft(10);
    obj.layout4:setWidth(282.5);
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setText("Duração:");
    obj.label4:setAlign("left");
    obj.label4:setWidth(55);
    obj.label4:setMargins({right=2});
    obj.label4:setName("label4");
    obj.label4:setFontFamily("Cambria");
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(83);
    obj.edit4:setField("duraMagia");
    obj.edit4:setMargins({right=2});
    obj.edit4:setName("edit4");
    obj.edit4:setFontFamily("Cambria");
    obj.edit4:setTransparent(true);
    obj.edit4:setFontColor("#cdcdcd");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout4);
    obj.dataLink5:setDefaultValue("—");
    obj.dataLink5:setField("duraMagia");
    obj.dataLink5:setName("dataLink5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setText("Elemento:");
    obj.label5:setAlign("left");
    obj.label5:setWidth(65);
    obj.label5:setName("label5");
    obj.label5:setFontFamily("Cambria");
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout4);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(75);
    obj.comboBox1:setField("elemMagia");
    obj.comboBox1:setItems({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio', 'Universal'});
    obj.comboBox1:setValues({'Water', 'Air', 'Fire', 'Earth', 'Void', 'Universal'});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontFamily("Cambria");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("#cdcdcd");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout4);
    obj.dataLink6:setField("elemMagia");
    obj.dataLink6:setDefaultValue("Universal");
    obj.dataLink6:setName("dataLink6");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setHeight(30);
    obj.layout5:setTop(100);
    obj.layout5:setLeft(10);
    obj.layout5:setWidth(282.5);
    obj.layout5:setName("layout5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout5);
    obj.label6:setText("Área:");
    obj.label6:setAlign("left");
    obj.label6:setWidth(37);
    obj.label6:setMargins({right=2});
    obj.label6:setName("label6");
    obj.label6:setFontFamily("Cambria");
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(100);
    obj.edit5:setField("areaMagia");
    obj.edit5:setMargins({right=2});
    obj.edit5:setName("edit5");
    obj.edit5:setFontFamily("Cambria");
    obj.edit5:setTransparent(true);
    obj.edit5:setFontColor("#cdcdcd");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout5);
    obj.dataLink7:setDefaultValue("—");
    obj.dataLink7:setField("areaMagia");
    obj.dataLink7:setName("dataLink7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setText("Alcance:");
    obj.label7:setAlign("left");
    obj.label7:setWidth(55);
    obj.label7:setName("label7");
    obj.label7:setFontFamily("Cambria");
    obj.label7:setFontColor("white");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout5);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(107);
    obj.edit6:setField("alcMagia");
    obj.edit6:setName("edit6");
    obj.edit6:setFontFamily("Cambria");
    obj.edit6:setTransparent(true);
    obj.edit6:setFontColor("#cdcdcd");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout5);
    obj.dataLink8:setDefaultValue("—");
    obj.dataLink8:setField("alcMagia");
    obj.dataLink8:setName("dataLink8");

    obj.labDesc = GUI.fromHandle(_obj_newObject("button"));
    obj.labDesc:setParent(obj.rectangle1);
    obj.labDesc:setText("Descrição");
    obj.labDesc:setTop(130);
    obj.labDesc:setLeft(10);
    obj.labDesc:setWidth(282.5);
    obj.labDesc:setHeight(30);
    obj.labDesc:setName("labDesc");
    obj.labDesc:setFontFamily("Cambria");
    obj.labDesc:setFontColor("white");
    lfm_setPropAsString(obj.labDesc, "fontStyle",  "bold");

    obj.popMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.rectangle1);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setWidth(600);
    obj.popMagia:setHeight(300);
    obj.popMagia:setBackOpacity(0);
    obj.popMagia:setDrawContainer(false);
    lfm_setPropAsString(obj.popMagia, "autoScopeNode",  "true");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.popMagia);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0e0e0e");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setName("rectangle2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setField("imagemMagia");
    obj.image1:setAlign("client");
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({right=20, left=20});
    obj.image1:setOpacity(0.1);
    obj.image1:setName("image1");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setFontColor("white");
    obj.label8:setTop(10);
    obj.label8:setLeft(10);
    obj.label8:setWidth(580);
    obj.label8:setField("nomeMagia");
    obj.label8:setMargins({bottom=5});
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setFontFamily("Constantia");
    obj.label8:setFontSize(26);
    obj.label8:setHeight(30);
    obj.label8:setName("label8");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle2);
    obj.horzLine1:setTop(45);
    obj.horzLine1:setLeft(10);
    obj.horzLine1:setWidth(580);
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setName("horzLine1");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle2);
    obj.layout6:setTop(50);
    obj.layout6:setLeft(10);
    obj.layout6:setWidth(580);
    obj.layout6:setHeight(30);
    obj.layout6:setName("layout6");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setText("Raises:");
    obj.label9:setWidth(45);
    obj.label9:setAlign("left");
    obj.label9:setName("label9");
    obj.label9:setFontFamily("Cambria");
    obj.label9:setFontColor("white");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout6);
    obj.edit7:setAlign("client");
    obj.edit7:setField("raiseMagia");
    obj.edit7:setName("edit7");
    obj.edit7:setFontFamily("Cambria");
    obj.edit7:setTransparent(true);
    obj.edit7:setFontColor("#cdcdcd");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout6);
    obj.dataLink9:setDefaultValue("—");
    obj.dataLink9:setField("raiseMagia");
    obj.dataLink9:setName("dataLink9");

    obj.MinhaDescMag = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.MinhaDescMag:setParent(obj.rectangle2);
    obj.MinhaDescMag:setMargins({top=90, right=10, left=10, bottom=10});
    obj.MinhaDescMag:setName("MinhaDescMag");
    obj.MinhaDescMag:setField("descriMagia");
    obj.MinhaDescMag:setAlign("client");
    obj.MinhaDescMag:setTransparent(true);
    obj.MinhaDescMag:setFontFamily("Cambria");
    obj.MinhaDescMag:setFontColor("#cdcdcd");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle2);
    obj.dataLink10:setDefaultValue("Descrição.");
    obj.dataLink10:setField("descriMagia");
    obj.dataLink10:setName("dataLink10");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            			local node = NDB.getRoot(sheet);
            			local objetos = NDB.getChildNodes(node.magias);
            
            			for i=1, #objetos, 1 do 
            				if objetos[i].elemMagia == 'Water' then
            					objetos[i].imagemMagia = '/Frames/bgWater.png';
            				elseif objetos[i].elemMagia == 'Earth' then
            					objetos[i].imagemMagia = '/Frames/bgEarth.png';
            				elseif objetos[i].elemMagia == 'Air' then
            					objetos[i].imagemMagia = '/Frames/bgAir.png';
            				elseif objetos[i].elemMagia == 'Fire' then
            					objetos[i].imagemMagia = '/Frames/bgFire.png';
            				elseif objetos[i].elemMagia == 'Void' then
            					objetos[i].imagemMagia = '/Frames/bgVoid.png';
            				elseif objetos[i].elemMagia == 'Universal' then
            					objetos[i].imagemMagia = '0';
            				end;
            			end;
            
            		end
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event2 = obj.labDesc:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popMagia");
            			if pop ~= nil then
            			pop:setNodeObject(self.sheet);
            			pop:showPopupEx("bottom", self.labDesc);
            			else
            			showMessage("Ops, bug... Nao encontrei o popup para exibir");
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.labDesc ~= nil then self.labDesc:destroy(); self.labDesc = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.imagMagia ~= nil then self.imagMagia:destroy(); self.imagMagia = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.MinhaDescMag ~= nil then self.MinhaDescMag:destroy(); self.MinhaDescMag = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtemplateMagias()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_templateMagias();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _templateMagias = {
    newEditor = newtemplateMagias, 
    new = newtemplateMagias, 
    name = "templateMagias", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

templateMagias = _templateMagias;
Firecast.registrarForm(_templateMagias);

return _templateMagias;
