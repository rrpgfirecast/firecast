require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmQuestForm()
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
    obj:setName("frmQuestForm");
    obj:setWidth(575);
    obj:setHeight(125);
    obj:setMargins({top=1});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(50);
    obj.layout1:setName("layout1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(150);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("Missão");
    obj.label1:setWidth(150);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTop(20);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(150);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setText("Responsável");
    obj.label2:setWidth(150);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTop(20);
    obj.edit2:setField("contratante");
    obj.edit2:setWidth(150);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setText("Recompensa");
    obj.label3:setWidth(100);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTop(20);
    obj.edit3:setField("pagamento");
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(50);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(50);
    obj.button1:setText("<->");
    obj.button1:setMargins({left=5});
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setAlign("left");
    obj.button2:setWidth(50);
    obj.button2:setText("X");
    obj.button2:setMargins({left=5});
    obj.button2:setName("button2");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setAlign("left");
    obj.textEditor1:setWidth(285);
    obj.textEditor1:setField("desc");
    obj.textEditor1:setMargins({right=5});
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle1);
    obj.textEditor2:setAlign("left");
    obj.textEditor2:setWidth(285);
    obj.textEditor2:setField("desc2");
    obj.textEditor2:setName("textEditor2");

    obj._e_event0 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            if sheet==nil then return end;
            
            					local node = ndb.getRoot(sheet);
            					local parent = ndb.getParent(sheet);
            					local target = nil;
            					local rcl = nil;
            
            					if parent == node.listaQuestsAtivas then
            						rcl = self:findControlByName("rclQuestCompleta");
            					elseif parent == node.listaQuestsCompletas then
            						rcl = self:findControlByName("rclQuestAtiva");
            					else
            						--showMessage("Desconhecido");
            					end;
            
            					if rcl == nil then return end;
            
            					target = rcl:append();
            
            					if target == nil then return end;
            
            					target.nome = sheet.nome;
            					target.contratante = sheet.contratante;
            					target.pagamento = sheet.pagamento;
            					target.avatar = sheet.avatar;
            					target.desc = sheet.desc;
            					target.desc2 = sheet.desc2;
            
            					ndb.deleteNode(sheet);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa habilidade?",
            						function (confirmado)
            							if confirmado then
            								ndb.deleteNode(sheet);
            							end;
            					end);
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmQuestForm = {
    newEditor = newfrmQuestForm, 
    new = newfrmQuestForm, 
    name = "frmQuestForm", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmQuestForm = _frmQuestForm;
rrpg.registrarForm(_frmQuestForm);

return _frmQuestForm;
