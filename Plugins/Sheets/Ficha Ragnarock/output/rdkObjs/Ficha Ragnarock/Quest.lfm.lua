require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmQuest()
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
    obj:setName("frmQuest");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setField("bgQuest");
    obj.image1:setStyle("autoFit");
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("bgQuest");
    obj.dataLink1:setDefaultValue("http://blob.firecast.com.br/blobs/FKMADRLH_1595976/Ragnarok_Quest_Window_2.0.jpg");
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setHeight(660);
    obj.layout1:setWidth(1225);
    obj.layout1:setMargins({right=0});
    obj.layout1:setName("layout1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(600);
    obj.layout2:setMargins({right=25});
    obj.layout2:setName("layout2");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(660);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(200);
    obj.button1:setHeight(25);
    obj.button1:setText("Em Andamento");
    obj.button1:setHint("Adicionar");
    obj.button1:setName("button1");

    obj.rclQuestAtiva = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclQuestAtiva:setParent(obj.layout2);
    obj.rclQuestAtiva:setLeft(0);
    obj.rclQuestAtiva:setTop(25);
    obj.rclQuestAtiva:setWidth(600);
    obj.rclQuestAtiva:setHeight(635);
    obj.rclQuestAtiva:setName("rclQuestAtiva");
    obj.rclQuestAtiva:setField("listaQuestsAtivas");
    obj.rclQuestAtiva:setTemplateForm("frmQuestForm");
    obj.rclQuestAtiva:setLayout("vertical");
    obj.rclQuestAtiva:setSelectable(true);

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(600);
    obj.layout3:setName("layout3");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(600);
    obj.rectangle2:setHeight(660);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout3);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(200);
    obj.button2:setHeight(25);
    obj.button2:setText("Terminadas");
    obj.button2:setHint("Adicionar");
    obj.button2:setName("button2");

    obj.rclQuestCompleta = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclQuestCompleta:setParent(obj.layout3);
    obj.rclQuestCompleta:setLeft(0);
    obj.rclQuestCompleta:setTop(25);
    obj.rclQuestCompleta:setWidth(600);
    obj.rclQuestCompleta:setHeight(635);
    obj.rclQuestCompleta:setName("rclQuestCompleta");
    obj.rclQuestCompleta:setField("listaQuestsCompletas");
    obj.rclQuestCompleta:setTemplateForm("frmQuestForm");
    obj.rclQuestCompleta:setLayout("vertical");
    obj.rclQuestCompleta:setSelectable(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclQuestAtiva:append();
        end, obj);

    obj._e_event1 = obj.rclQuestAtiva:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclQuestCompleta:append();
        end, obj);

    obj._e_event3 = obj.rclQuestCompleta:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rclQuestCompleta ~= nil then self.rclQuestCompleta:destroy(); self.rclQuestCompleta = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclQuestAtiva ~= nil then self.rclQuestAtiva:destroy(); self.rclQuestAtiva = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmQuest = {
    newEditor = newfrmQuest, 
    new = newfrmQuest, 
    name = "frmQuest", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmQuest = _frmQuest;
rrpg.registrarForm(_frmQuest);

return _frmQuest;
