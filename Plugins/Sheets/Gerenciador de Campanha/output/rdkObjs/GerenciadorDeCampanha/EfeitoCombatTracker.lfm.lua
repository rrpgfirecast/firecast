require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmEfeitoCombatTracker()
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
    obj:setName("frmEfeitoCombatTracker");
    obj:setHeight(18);
    obj:setPadding({left=1,top=1,right=1,bottom=1});


		local function createDraggerForAtor()
			return self:findControlByName("frmCombatTracker");
		end;		

		local function getTracker()
			return self:findControlByName("frmCombatTracker");
		end;
	
		function self:apagarEfeito()
			ndb.deleteNode(sheet);
		end;
		
		function self:doUsuarioAlterouDuracao()
			if sheet ~= nil then
				sheet.duracaoReal = nil;
			end;
		end;
	


    obj.imgEfeito = gui.fromHandle(_obj_newObject("image"));
    obj.imgEfeito:setParent(obj);
    obj.imgEfeito:setName("imgEfeito");
    obj.imgEfeito:setAlign("left");
    obj.imgEfeito:setSRC("/GerenciadorDeCampanha/images/effect.png");
    obj.imgEfeito:setWidth(16);
    obj.imgEfeito:setHitTest(true);
    obj.imgEfeito:setHint("Um efeito/condição do ator");

    obj.edtDescricao = gui.fromHandle(_obj_newObject("edit"));
    obj.edtDescricao:setParent(obj);
    obj.edtDescricao:setName("edtDescricao");
    obj.edtDescricao:setAlign("client");
    obj.edtDescricao:setField("descricao");
    obj.edtDescricao:setTransparent(true);
    obj.edtDescricao:setFontSize(10);
    obj.edtDescricao:setMargins({right=2});

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.edtDescricao);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setStrokeColor("black");
    obj.horzLine1:setOpacity(0.5);
    obj.horzLine1:setName("horzLine1");

    obj.layDireita = gui.fromHandle(_obj_newObject("layout"));
    obj.layDireita:setParent(obj);
    obj.layDireita:setName("layDireita");
    obj.layDireita:setAlign("right");
    obj.layDireita:setWidth(40);

    obj.edtDuracao = gui.fromHandle(_obj_newObject("edit"));
    obj.edtDuracao:setParent(obj.layDireita);
    obj.edtDuracao:setName("edtDuracao");
    obj.edtDuracao:setAlign("left");
    obj.edtDuracao:setWidth(25);
    obj.edtDuracao:setType("number");
    obj.edtDuracao:setHint("Duração do efeito/condição (medido em Rodadas)");
    obj.edtDuracao:setMargins({right=3, top=1, bottom=1});
    obj.edtDuracao:setHorzTextAlign("center");
    obj.edtDuracao:setFontSize(10);
    obj.edtDuracao:setField("duracao");
    obj.edtDuracao:setMin(0);

    obj.imgDeleteEfeito = gui.fromHandle(_obj_newObject("image"));
    obj.imgDeleteEfeito:setParent(obj.layDireita);
    obj.imgDeleteEfeito:setName("imgDeleteEfeito");
    obj.imgDeleteEfeito:setAlign("left");
    obj.imgDeleteEfeito:setSRC("/GerenciadorDeCampanha/images/deleteEffect.png");
    obj.imgDeleteEfeito:setHitTest(true);
    obj.imgDeleteEfeito:setWidth(12);
    obj.imgDeleteEfeito:setCursor("handPoint");
    obj.imgDeleteEfeito:setOpacity(0.6);


		if system.isMobile() then
			self.height = 30;
			self.imgEfeito.width = 30;
			self.imgEfeito.style = "autoFit";			
			self.edtDescricao.fontSize = 12;
			
			self.edtDuracao.width = 30;
			self.edtDuracao.fontSize = 12;
			self.imgDeleteEfeito.width = 30;
			self.imgDeleteEfeito.style = "autoFit";
			self.layDireita.width = 63;
		end;
		
		local tracker = getTracker();
		
		local function setDropRecursivo(ctrl)
			ctrl.onStartDrop = tracker.handleStartDrop;
			
			local childs = ctrl:getChildren();
			
			for i = 1, #childs, 1 do
				setDropRecursivo(childs[i]);
			end;
		end;
		
		setDropRecursivo(self);		
	


    obj._e_event0 = obj.edtDuracao:addEventListener("onUserChange",
        function (self)
            self:doUsuarioAlterouDuracao()
        end, obj);

    obj._e_event1 = obj.imgDeleteEfeito:addEventListener("onMouseUp",
        function (self, event)
            if event.button == 'left' then self:apagarEfeito(); end;
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

        if self.imgDeleteEfeito ~= nil then self.imgDeleteEfeito:destroy(); self.imgDeleteEfeito = nil; end;
        if self.imgEfeito ~= nil then self.imgEfeito:destroy(); self.imgEfeito = nil; end;
        if self.edtDescricao ~= nil then self.edtDescricao:destroy(); self.edtDescricao = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.layDireita ~= nil then self.layDireita:destroy(); self.layDireita = nil; end;
        if self.edtDuracao ~= nil then self.edtDuracao:destroy(); self.edtDuracao = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmEfeitoCombatTracker = {
    newEditor = newfrmEfeitoCombatTracker, 
    new = newfrmEfeitoCombatTracker, 
    name = "frmEfeitoCombatTracker", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmEfeitoCombatTracker = _frmEfeitoCombatTracker;
rrpg.registrarForm(_frmEfeitoCombatTracker);

return _frmEfeitoCombatTracker;
