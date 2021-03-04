require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmNPCs()
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
    obj:setName("frmNPCs");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setField("bgNPC");
    obj.image1:setStyle("autoFit");
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.image1);
    obj.dataLink1:setField("bgNPC");
    obj.dataLink1:setDefaultValue("http://blob.firecast.com.br/blobs/VAPCNRTG_1601946/Aba_07.jpg");
    obj.dataLink1:setName("dataLink1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.image1);
    obj.button1:setAlign("top");
    obj.button1:setText("Novo NPC");
    obj.button1:setHint("Adicionar");
    obj.button1:setMargins({bottom=10});
    obj.button1:setName("button1");

    obj.rclNPCs = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclNPCs:setParent(obj.image1);
    obj.rclNPCs:setAlign("client");
    obj.rclNPCs:setName("rclNPCs");
    obj.rclNPCs:setField("listaNPCs");
    obj.rclNPCs:setTemplateForm("frmNPCForm");
    obj.rclNPCs:setLayout("horizontalTiles");
    obj.rclNPCs:setSelectable(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclNPCs:append();
        end, obj);

    obj._e_event1 = obj.rclNPCs:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            			        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rclNPCs ~= nil then self.rclNPCs:destroy(); self.rclNPCs = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmNPCs = {
    newEditor = newfrmNPCs, 
    new = newfrmNPCs, 
    name = "frmNPCs", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmNPCs = _frmNPCs;
rrpg.registrarForm(_frmNPCs);

return _frmNPCs;
