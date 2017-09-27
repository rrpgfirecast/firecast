require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ2_3_1()
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
    obj:setName("frmAMZ2_3_1");
    obj:setWidth(765);
    obj:setHeight(325);
    obj:setTheme("dark");
    obj:setMargins({top=5});

			
		local function askForDelete()
			dialogs.confirmYesNo("Deseja realmente apagar essa habilidade?",
								 function (confirmado)
									if confirmado then
										ndb.deleteNode(sheet);
									end;
								 end);
		end;
		


    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#191919");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(740);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(60);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(60);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(680);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(0);
    obj.label2:setTop(25);
    obj.label2:setWidth(60);
    obj.label2:setHeight(20);
    obj.label2:setText("Tipo");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(60);
    obj.edit2:setTop(25);
    obj.edit2:setWidth(705);
    obj.edit2:setHeight(25);
    obj.edit2:setField("tipo");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(0);
    obj.label3:setTop(75);
    obj.label3:setWidth(60);
    obj.label3:setHeight(20);
    obj.label3:setText("Descrição");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj);
    obj.textEditor1:setLeft(60);
    obj.textEditor1:setTop(50);
    obj.textEditor1:setWidth(705);
    obj.textEditor1:setHeight(75);
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(0);
    obj.label4:setTop(125);
    obj.label4:setWidth(60);
    obj.label4:setHeight(20);
    obj.label4:setText("Efeito");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(60);
    obj.edit3:setTop(125);
    obj.edit3:setWidth(705);
    obj.edit3:setHeight(25);
    obj.edit3:setField("efeito");
    obj.edit3:setName("edit3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(0);
    obj.label5:setTop(150);
    obj.label5:setWidth(60);
    obj.label5:setHeight(20);
    obj.label5:setText("Acerto");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(60);
    obj.edit4:setTop(150);
    obj.edit4:setWidth(705);
    obj.edit4:setHeight(25);
    obj.edit4:setField("acerto");
    obj.edit4:setName("edit4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(0);
    obj.label6:setTop(175);
    obj.label6:setWidth(60);
    obj.label6:setHeight(20);
    obj.label6:setText("Canalização");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(11);
    obj.label6:setName("label6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(60);
    obj.edit5:setTop(175);
    obj.edit5:setWidth(705);
    obj.edit5:setHeight(25);
    obj.edit5:setField("canalizacao");
    obj.edit5:setName("edit5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setLeft(0);
    obj.label7:setTop(200);
    obj.label7:setWidth(60);
    obj.label7:setHeight(20);
    obj.label7:setText("Condições");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(60);
    obj.edit6:setTop(200);
    obj.edit6:setWidth(705);
    obj.edit6:setHeight(25);
    obj.edit6:setField("condicoes");
    obj.edit6:setName("edit6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj);
    obj.label8:setLeft(0);
    obj.label8:setTop(225);
    obj.label8:setWidth(60);
    obj.label8:setHeight(20);
    obj.label8:setText("Duração");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setLeft(60);
    obj.edit7:setTop(225);
    obj.edit7:setWidth(705);
    obj.edit7:setHeight(25);
    obj.edit7:setField("duracao");
    obj.edit7:setName("edit7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj);
    obj.label9:setLeft(0);
    obj.label9:setTop(250);
    obj.label9:setWidth(60);
    obj.label9:setHeight(20);
    obj.label9:setText("Custo");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj);
    obj.edit8:setLeft(60);
    obj.edit8:setTop(250);
    obj.edit8:setWidth(705);
    obj.edit8:setHeight(25);
    obj.edit8:setField("custo");
    obj.edit8:setName("edit8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj);
    obj.label10:setLeft(0);
    obj.label10:setTop(275);
    obj.label10:setWidth(60);
    obj.label10:setHeight(20);
    obj.label10:setText("Dano");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj);
    obj.edit9:setLeft(60);
    obj.edit9:setTop(275);
    obj.edit9:setWidth(705);
    obj.edit9:setHeight(25);
    obj.edit9:setField("dano");
    obj.edit9:setName("edit9");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj);
    obj.label11:setLeft(0);
    obj.label11:setTop(300);
    obj.label11:setWidth(60);
    obj.label11:setHeight(20);
    obj.label11:setText("OBS.:");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj);
    obj.edit10:setLeft(60);
    obj.edit10:setTop(300);
    obj.edit10:setWidth(705);
    obj.edit10:setHeight(25);
    obj.edit10:setField("obs");
    obj.edit10:setName("edit10");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            askForDelete();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ2_3_1 = {
    newEditor = newfrmAMZ2_3_1, 
    new = newfrmAMZ2_3_1, 
    name = "frmAMZ2_3_1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ2_3_1 = _frmAMZ2_3_1;
rrpg.registrarForm(_frmAMZ2_3_1);

return _frmAMZ2_3_1;
