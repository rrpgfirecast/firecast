require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister10_svg()
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
    obj:setName("frmFichaRPGmeister10_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(1210);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(1210);
    obj.label1:setHeight(20);
    obj.label1:setText("PAGINA EXCLUSIVA DO MESTRE");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(50);
    obj.button1:setHeight(20);
    obj.button1:setText("Exibir");
    obj.button1:setHint("Exibe as Anotações do Mestre.");
    obj.button1:setName("button1");

    obj.a1 = gui.fromHandle(_obj_newObject("layout"));
    obj.a1:setParent(obj.scrollBox1);
    obj.a1:setLeft(0);
    obj.a1:setTop(0);
    obj.a1:setWidth(400);
    obj.a1:setHeight(605);
    obj.a1:setName("a1");
    obj.a1:setVisible(false);

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.a1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.a1);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(400);
    obj.label2:setHeight(20);
    obj.label2:setText("ANOTAÇÕES");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.a1);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(380);
    obj.textEditor1:setHeight(575);
    obj.textEditor1:setField("anotacoes1");
    obj.textEditor1:setName("textEditor1");

    obj.a2 = gui.fromHandle(_obj_newObject("layout"));
    obj.a2:setParent(obj.scrollBox1);
    obj.a2:setLeft(405);
    obj.a2:setTop(0);
    obj.a2:setWidth(400);
    obj.a2:setHeight(605);
    obj.a2:setName("a2");
    obj.a2:setVisible(false);

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.a2);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.a2);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(400);
    obj.label3:setHeight(20);
    obj.label3:setText("ANOTAÇÕES");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.a2);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(575);
    obj.textEditor2:setField("anotacoes2");
    obj.textEditor2:setName("textEditor2");

    obj.a3 = gui.fromHandle(_obj_newObject("layout"));
    obj.a3:setParent(obj.scrollBox1);
    obj.a3:setLeft(810);
    obj.a3:setTop(0);
    obj.a3:setWidth(400);
    obj.a3:setHeight(605);
    obj.a3:setName("a3");
    obj.a3:setVisible(false);

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.a3);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.a3);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(400);
    obj.label4:setHeight(20);
    obj.label4:setText("ANOTAÇÕES");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.a3);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(575);
    obj.textEditor3:setField("anotacoes3");
    obj.textEditor3:setName("textEditor3");


				local function secret()
					local mesa = rrpg.getMesaDe(sheet);
					
					if mesa.meuJogador.isMestre then
						self.a1.visible = true;
						self.a2.visible = true;
						self.a3.visible = true;
					else
						self.a1.visible = false;
						self.a2.visible = false;
						self.a3.visible = false;
					end;
				end;
			


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            secret();
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

        if self.a1 ~= nil then self.a1:destroy(); self.a1 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.a2 ~= nil then self.a2:destroy(); self.a2 = nil; end;
        if self.a3 ~= nil then self.a3:destroy(); self.a3 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister10_svg = {
    newEditor = newfrmFichaRPGmeister10_svg, 
    new = newfrmFichaRPGmeister10_svg, 
    name = "frmFichaRPGmeister10_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister10_svg = _frmFichaRPGmeister10_svg;
rrpg.registrarForm(_frmFichaRPGmeister10_svg);

return _frmFichaRPGmeister10_svg;
