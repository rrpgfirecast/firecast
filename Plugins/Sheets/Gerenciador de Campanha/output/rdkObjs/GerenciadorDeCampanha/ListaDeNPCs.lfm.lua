require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFM()
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
    obj:setName("frmFM");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.FichaMultiaba");
    obj:setTitle("Ficha Multiaba");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(1470);
    obj.layout1:setHeight(50);
    obj.layout1:setName("layout1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(45);
    obj.button1:setHeight(45);
    obj.button1:setText("");
    obj.button1:setHint("Adiciona nova aba. ");
    obj.button1:setName("button1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button1);
    obj.image1:setMargins({left = 5, right = 5, top = 5, bottom = 5});
    obj.image1:setAlign("client");
    obj.image1:setSRC("/GerenciadorDeCampanha/images/addlista.png");
    obj.image1:setName("image1");

    obj.rclAbas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAbas:setParent(obj.layout1);
    obj.rclAbas:setName("rclAbas");
    obj.rclAbas:setField("opcoesFalsas");
    obj.rclAbas:setTemplateForm("frmFM_Aba");
    obj.rclAbas:setLeft(200);
    obj.rclAbas:setTop(0);
    obj.rclAbas:setWidth(1270);
    obj.rclAbas:setHeight(46);
    obj.rclAbas:setSelectable(true);
    obj.rclAbas:setLayout("horizontal");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setAlign("client");
    obj.layout2:setName("layout2");

    obj.boxTexto = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxTexto:setParent(obj.layout2);
    obj.boxTexto:setName("boxTexto");
    obj.boxTexto:setAlign("client");
    obj.boxTexto:setVisible(false);

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.boxTexto);
    obj.button2:setLeft(50);
    obj.button2:setTop(0);
    obj.button2:setWidth(45);
    obj.button2:setHeight(45);
    obj.button2:setText("");
    obj.button2:setHint("Abre as configurações da lista de NPCs. ");
    obj.button2:setName("button2");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.button2);
    obj.image2:setMargins({left = 5, right = 5, top = 5, bottom = 5});
    obj.image2:setAlign("client");
    obj.image2:setSRC("/GerenciadorDeCampanha/images/config.png");
    obj.image2:setName("image2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.boxTexto);
    obj.button3:setLeft(100);
    obj.button3:setTop(0);
    obj.button3:setWidth(45);
    obj.button3:setHeight(45);
    obj.button3:setText("");
    obj.button3:setHint("Adiciona novo personagem. ");
    obj.button3:setName("button3");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.button3);
    obj.image3:setMargins({left = 5, right = 5, top = 5, bottom = 5});
    obj.image3:setAlign("client");
    obj.image3:setSRC("/GerenciadorDeCampanha/images/addnpc.png");
    obj.image3:setName("image3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.boxTexto);
    obj.button4:setLeft(150);
    obj.button4:setTop(0);
    obj.button4:setWidth(45);
    obj.button4:setHeight(45);
    obj.button4:setText("");
    obj.button4:setHint("Organiza a lista. ");
    obj.button4:setName("button4");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.button4);
    obj.image4:setMargins({left = 5, right = 5, top = 5, bottom = 5});
    obj.image4:setAlign("client");
    obj.image4:setSRC("/GerenciadorDeCampanha/images/organize.png");
    obj.image4:setName("image4");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.boxTexto);
    obj.layout3:setAlign("client");
    obj.layout3:setMargins({top=50});
    obj.layout3:setName("layout3");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout3);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.rclListaDeNPCs = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeNPCs:setParent(obj.layout3);
    obj.rclListaDeNPCs:setName("rclListaDeNPCs");
    obj.rclListaDeNPCs:setLayout("verticalTiles");
    obj.rclListaDeNPCs:setField("campoDosNPC");
    obj.rclListaDeNPCs:setTemplateForm("CaixaFichaNPC");
    obj.rclListaDeNPCs:setAlign("client");
    obj.rclListaDeNPCs:setAutoHeight(true);
    obj.rclListaDeNPCs:setSelectable(true);
    obj.rclListaDeNPCs:setMinQt(0);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclAbas:append();
        end, obj);

    obj._e_event1 = obj.rclAbas:addEventListener("onSelect",
        function (self)
            local node = self.rclAbas.selectedNode;
                                self.boxTexto.node = node;
                                self.boxTexto.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.Config.scopeNode = sheet;self.Config:show();
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclListaDeNPCs:append();
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclListaDeNPCs:sort();
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rclListaDeNPCs ~= nil then self.rclListaDeNPCs:destroy(); self.rclListaDeNPCs = nil; end;
        if self.boxTexto ~= nil then self.boxTexto:destroy(); self.boxTexto = nil; end;
        if self.rclAbas ~= nil then self.rclAbas:destroy(); self.rclAbas = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFM = {
    newEditor = newfrmFM, 
    new = newfrmFM, 
    name = "frmFM", 
    dataType = "Ambesek.Nefertyne.FichaMultiaba", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Multiaba", 
    description=""};

frmFM = _frmFM;
rrpg.registrarForm(_frmFM);
rrpg.registrarDataType(_frmFM);

return _frmFM;
