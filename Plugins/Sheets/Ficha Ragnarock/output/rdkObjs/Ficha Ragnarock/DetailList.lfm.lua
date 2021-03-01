require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmDetailList()
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
    obj:setName("frmDetailList");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setField("bgDestail");
    obj.image1:setStyle("autoFit");
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("bgDestail");
    obj.dataLink1:setDefaultValue("http://blob.firecast.com.br/blobs/VPLCLETD_1601938/Aba_03.jpg");
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setHeight(660);
    obj.layout1:setWidth(1510);
    obj.layout1:setMargins({right=0});
    obj.layout1:setName("layout1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(500);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(500);
    obj.rectangle1:setHeight(660);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(200);
    obj.button1:setHeight(25);
    obj.button1:setText("Ativas");
    obj.button1:setHint("Adicionar");
    obj.button1:setName("button1");

    obj.rclAtiva = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAtiva:setParent(obj.layout2);
    obj.rclAtiva:setLeft(0);
    obj.rclAtiva:setTop(25);
    obj.rclAtiva:setWidth(500);
    obj.rclAtiva:setHeight(635);
    obj.rclAtiva:setName("rclAtiva");
    obj.rclAtiva:setField("listaAtivas");
    obj.rclAtiva:setTemplateForm("frmRecordListForm");
    obj.rclAtiva:setLayout("vertical");
    obj.rclAtiva:setSelectable(true);

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(500);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(500);
    obj.rectangle2:setHeight(660);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout3);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(200);
    obj.button2:setHeight(25);
    obj.button2:setText("Passivas");
    obj.button2:setHint("Adicionar");
    obj.button2:setName("button2");

    obj.rclPassiva = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclPassiva:setParent(obj.layout3);
    obj.rclPassiva:setLeft(0);
    obj.rclPassiva:setTop(25);
    obj.rclPassiva:setWidth(500);
    obj.rclPassiva:setHeight(635);
    obj.rclPassiva:setName("rclPassiva");
    obj.rclPassiva:setField("listaPassivas");
    obj.rclPassiva:setTemplateForm("frmRecordListForm");
    obj.rclPassiva:setLayout("vertical");
    obj.rclPassiva:setSelectable(true);

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(500);
    obj.layout4:setName("layout4");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(500);
    obj.rectangle3:setHeight(660);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setWidth(200);
    obj.button3:setHeight(25);
    obj.button3:setText("Perícias");
    obj.button3:setHint("Adicionar");
    obj.button3:setName("button3");

    obj.rclPericia = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclPericia:setParent(obj.layout4);
    obj.rclPericia:setLeft(0);
    obj.rclPericia:setTop(25);
    obj.rclPericia:setWidth(500);
    obj.rclPericia:setHeight(635);
    obj.rclPericia:setName("rclPericia");
    obj.rclPericia:setField("listaPericias");
    obj.rclPericia:setTemplateForm("frmPericiaForm");
    obj.rclPericia:setLayout("vertical");
    obj.rclPericia:setSelectable(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclAtiva:append();
        end, obj);

    obj._e_event1 = obj.rclAtiva:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclPassiva:append();
        end, obj);

    obj._e_event3 = obj.rclPassiva:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclPericia:append();
        end, obj);

    obj._e_event5 = obj.rclPericia:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

        if self.rclAtiva ~= nil then self.rclAtiva:destroy(); self.rclAtiva = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rclPericia ~= nil then self.rclPericia:destroy(); self.rclPericia = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rclPassiva ~= nil then self.rclPassiva:destroy(); self.rclPassiva = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmDetailList = {
    newEditor = newfrmDetailList, 
    new = newfrmDetailList, 
    name = "frmDetailList", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDetailList = _frmDetailList;
rrpg.registrarForm(_frmDetailList);

return _frmDetailList;
