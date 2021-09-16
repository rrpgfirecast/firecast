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
    obj:setHeight(155);
    obj:setWidth(325);
    obj:setMargins({top=5,bottom=5});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(320);
    obj.rectangle1:setHeight(160);
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.imagMagia = GUI.fromHandle(_obj_newObject("image"));
    obj.imagMagia:setParent(obj);
    obj.imagMagia:setTop(5);
    obj.imagMagia:setLeft(5);
    obj.imagMagia:setScale(1);
    obj.imagMagia:setField("imagemMagia");
    obj.imagMagia:setName("imagMagia");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Nome:");
    obj.label1:setTop(10);
    obj.label1:setLeft(5);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(50);
    obj.edit1:setTransparent(true);
    obj.edit1:setHeight(30);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(265);
    obj.edit1:setField("nomeMagia");
    obj.edit1:setMargins({right=2});
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setLeft(50);
    obj.horzLine1:setTop(30);
    obj.horzLine1:setWidth(265);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setText("Elemento:");
    obj.label2:setTop(45);
    obj.label2:setLeft(5);
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setLeft(67);
    obj.comboBox1:setTop(40);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setField("elemMagia");
    obj.comboBox1:setItems({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio', 'Universal'});
    obj.comboBox1:setValues({'Water', 'Air', 'Fire', 'Earth', 'Void', 'Universal'});
    obj.comboBox1:setName("comboBox1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setText("Maestria:");
    obj.label3:setTop(45);
    obj.label3:setLeft(180);
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(240);
    obj.edit2:setTransparent(true);
    obj.edit2:setTop(40);
    obj.edit2:setHeight(25);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("lvlMagia");
    obj.edit2:setWidth(25);
    obj.edit2:setMargins({right=2});
    obj.edit2:setName("edit2");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj);
    obj.horzLine2:setLeft(240);
    obj.horzLine2:setTop(65);
    obj.horzLine2:setWidth(25);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setText("Keywords:");
    obj.label4:setLeft(5);
    obj.label4:setTop(105);
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(68);
    obj.edit3:setTop(100);
    obj.edit3:setTransparent(true);
    obj.edit3:setHeight(25);
    obj.edit3:setWidth(135);
    obj.edit3:setField("tipoMagia");
    obj.edit3:setMargins({right=2});
    obj.edit3:setName("edit3");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj);
    obj.horzLine3:setLeft(68);
    obj.horzLine3:setTop(125);
    obj.horzLine3:setWidth(135);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setText("Área:");
    obj.label5:setLeft(180);
    obj.label5:setTop(75);
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(215);
    obj.edit4:setTop(70);
    obj.edit4:setTransparent(true);
    obj.edit4:setHeight(25);
    obj.edit4:setWidth(100);
    obj.edit4:setField("areaMagia");
    obj.edit4:setMargins({right=2});
    obj.edit4:setName("edit4");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj);
    obj.horzLine4:setLeft(215);
    obj.horzLine4:setTop(95);
    obj.horzLine4:setWidth(100);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setName("horzLine4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setText("Duração:");
    obj.label6:setLeft(210);
    obj.label6:setTop(105);
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(265);
    obj.edit5:setTop(100);
    obj.edit5:setHeight(25);
    obj.edit5:setTransparent(true);
    obj.edit5:setWidth(50);
    obj.edit5:setField("duraMagia");
    obj.edit5:setMargins({right=2});
    obj.edit5:setName("edit5");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj);
    obj.horzLine5:setLeft(265);
    obj.horzLine5:setTop(125);
    obj.horzLine5:setWidth(50);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setName("horzLine5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setText("Alcance:");
    obj.label7:setLeft(5);
    obj.label7:setTop(75);
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(60);
    obj.edit6:setTop(70);
    obj.edit6:setHeight(25);
    obj.edit6:setTransparent(true);
    obj.edit6:setWidth(107);
    obj.edit6:setField("alcMagia");
    obj.edit6:setMargins({right=2});
    obj.edit6:setName("edit6");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj);
    obj.horzLine6:setLeft(60);
    obj.horzLine6:setTop(95);
    obj.horzLine6:setWidth(107);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setName("horzLine6");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(290);
    obj.button1:setTop(40);
    obj.button1:setText("-");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.labDesc = GUI.fromHandle(_obj_newObject("button"));
    obj.labDesc:setParent(obj);
    obj.labDesc:setText("Descrição");
    obj.labDesc:setTop(130);
    obj.labDesc:setWidth(310);
    obj.labDesc:setLeft(5);
    obj.labDesc:setHeight(25);
    obj.labDesc:setName("labDesc");

    obj.popMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setTop(30);
    obj.popMagia:setLeft(500);
    obj.popMagia:setWidth(480);
    obj.popMagia:setHeight(160);
    obj.popMagia:setBackOpacity(0.5);
    lfm_setPropAsString(obj.popMagia, "autoScopeNode",  "true");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.popMagia);
    obj.label8:setText("Raises:");
    obj.label8:setTop(10);
    obj.label8:setLeft(5);
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.popMagia);
    obj.edit7:setLeft(50);
    obj.edit7:setHeight(25);
    obj.edit7:setTop(5);
    obj.edit7:setWidth(425);
    obj.edit7:setField("raiseMagia");
    obj.edit7:setName("edit7");

    obj.MinhaDescMag = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.MinhaDescMag:setParent(obj.popMagia);
    obj.MinhaDescMag:setMargins({top = 30});
    obj.MinhaDescMag:setName("MinhaDescMag");
    obj.MinhaDescMag:setField("descriMagia");
    obj.MinhaDescMag:setAlign("client");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'elemMagia'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event1 = obj.labDesc:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popMagia");
                            if pop ~= nil then
                            pop:setNodeObject(self.sheet);
                            pop:showPopupEx("right", self.labDesc);
                            else
                            showMessage("Ops, bug... Nao encontrei o popup para exibir");
                            end;
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
                                    local node = NDB.getRoot(sheet);
                                    local objetos = NDB.getChildNodes(node.magias);
            
                                    for i=1, #objetos, 1 do 
                                        if objetos[i].elemMagia == 'Water' then
                                            objetos[i].imagemMagia = 'http://blob.firecast.com.br/blobs/HGCVOFGV_1840554/Water.png';
                                        elseif objetos[i].elemMagia == 'Earth' then
                                            objetos[i].imagemMagia = 'http://blob.firecast.com.br/blobs/NVGJRJWF_1840560/Earth.png';
                                        elseif objetos[i].elemMagia == 'Air' then
                                            objetos[i].imagemMagia = 'http://blob.firecast.com.br/blobs/MDGKFTKT_1840555/Air.png';
                                        elseif objetos[i].elemMagia == 'Fire' then
                                            objetos[i].imagemMagia = 'http://blob.firecast.com.br/blobs/CUUULBSM_1840558/Fire.png';
                                        elseif objetos[i].elemMagia == 'Void' then
                                            objetos[i].imagemMagia = 'http://blob.firecast.com.br/blobs/ELMAJRDB_1840552/Void_1.png';
                                        elseif objetos[i].elemMagia == 'Universal' then
                                            objetos[i].imagemMagia = '0';
                                        end;
                                    end;
            
                                end
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
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.labDesc ~= nil then self.labDesc:destroy(); self.labDesc = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.imagMagia ~= nil then self.imagMagia:destroy(); self.imagMagia = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
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
