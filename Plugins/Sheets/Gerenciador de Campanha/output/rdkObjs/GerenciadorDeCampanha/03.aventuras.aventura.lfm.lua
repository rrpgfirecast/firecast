require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciador03_AVENTURA()
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
    obj:setName("frmGerenciador03_AVENTURA");
    obj:setWidth(1300);
    obj:setHeight(200);
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(810);
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(25);
    obj.label1:setHeight(25);
    obj.label1:setText("Nª");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(30);
    obj.label2:setTop(0);
    obj.label2:setWidth(200);
    obj.label2:setHeight(25);
    obj.label2:setText("Nome");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(230);
    obj.label3:setTop(0);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("Data Inicio");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(330);
    obj.label4:setTop(0);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("Data Fim");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(430);
    obj.label5:setTop(0);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("Sessao Inicio");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(530);
    obj.label6:setTop(0);
    obj.label6:setWidth(100);
    obj.label6:setHeight(25);
    obj.label6:setText("Sessao Fim");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(630);
    obj.label7:setTop(0);
    obj.label7:setWidth(150);
    obj.label7:setHeight(25);
    obj.label7:setText("Estado");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(5);
    obj.label8:setTop(50);
    obj.label8:setWidth(400);
    obj.label8:setHeight(25);
    obj.label8:setText("Descriçao");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(405);
    obj.label9:setTop(50);
    obj.label9:setWidth(400);
    obj.label9:setHeight(25);
    obj.label9:setText("Resultados");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(25);
    obj.edit1:setWidth(25);
    obj.edit1:setHeight(25);
    obj.edit1:setField("numero");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(30);
    obj.edit2:setTop(25);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("nome");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(230);
    obj.edit3:setTop(25);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setField("dataInicio");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(330);
    obj.edit4:setTop(25);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setField("dataFim");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(430);
    obj.edit5:setTop(25);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setField("sessaoInicio");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(530);
    obj.edit6:setTop(25);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("sessaoFim");
    obj.edit6:setName("edit6");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(630);
    obj.comboBox1:setTop(25);
    obj.comboBox1:setWidth(125);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("estado");
    obj.comboBox1:setItems({'Ativa', 'Pausada', 'Completa', 'Falha'});
    obj.comboBox1:setValues({'0', '1', '2', '3'});
    obj.comboBox1:setValue("0");
    obj.comboBox1:setName("comboBox1");

    obj.cbxInvisivel = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxInvisivel:setParent(obj.rectangle1);
    obj.cbxInvisivel:setName("cbxInvisivel");
    obj.cbxInvisivel:setLeft(757);
    obj.cbxInvisivel:setTop(27);
    obj.cbxInvisivel:setWidth(20);
    obj.cbxInvisivel:setHeight(20);
    obj.cbxInvisivel:setImageChecked("/GerenciadorDeCampanha/images/invisivel2.png");
    obj.cbxInvisivel:setImageUnchecked("/GerenciadorDeCampanha/images/visivel2.png");
    obj.cbxInvisivel:setAutoChange(false);
    obj.cbxInvisivel:setHint("Alterna visibilidade para Jogadores e Espectadores.");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(780);
    obj.button1:setTop(25);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(75);
    obj.textEditor1:setWidth(400);
    obj.textEditor1:setHeight(120);
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle1);
    obj.textEditor2:setLeft(405);
    obj.textEditor2:setTop(75);
    obj.textEditor2:setWidth(400);
    obj.textEditor2:setHeight(120);
    obj.textEditor2:setField("resultados");
    obj.textEditor2:setName("textEditor2");


			 function self:alternarVisibilidade()
				if self.cbxInvisivel.checked then
					 ndb.setPermission(sheet, "group", "jogadores", "read", nil);
					 ndb.setPermission(sheet, "group", "espectadores", "read", nil);
				else
					 ndb.setPermission(sheet, "group", "jogadores", "read", "deny");
					 ndb.setPermission(sheet, "group", "espectadores", "read", "deny");
				end;
			 end; 
			 function self:atualizarCbxInvisivel()		  
				self.cbxInvisivel.checked = ndb.getPermission(sheet, "group", "espectadores", "read") == "deny" or
											 ndb.getPermission(sheet, "group", "jogadores", "read") == "deny"																					
				self.cbxInvisivel.enabled = ndb.testPermission(sheet, "writePermissions");
			 end;
		


    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (self)
            if self.observer ~= nil then   
            			self.observer.enabled = false;
            			self.observer = nil;
            		end;
            		 
            		if sheet ~= nil then   
            			self.observer = ndb.newObserver(sheet);
            			self.observer.onPermissionListChanged =
            				function(node)				 
            					self:atualizarCbxInvisivel();
            				end;							   
            			self.observer.onFinalPermissionsCouldBeChanged =
            				function(node)
            					self:atualizarCbxInvisivel();
            				end;							   
            			self:atualizarCbxInvisivel();  
            		end;
        end, obj);

    obj._e_event1 = obj.cbxInvisivel:addEventListener("onClick",
        function (self)
            self:alternarVisibilidade();
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa aventura?",
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
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.cbxInvisivel ~= nil then self.cbxInvisivel:destroy(); self.cbxInvisivel = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciador03_AVENTURA = {
    newEditor = newfrmGerenciador03_AVENTURA, 
    new = newfrmGerenciador03_AVENTURA, 
    name = "frmGerenciador03_AVENTURA", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador03_AVENTURA = _frmGerenciador03_AVENTURA;
rrpg.registrarForm(_frmGerenciador03_AVENTURA);

return _frmGerenciador03_AVENTURA;
