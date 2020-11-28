require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLR()
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
    obj:setName("frmLR");
    obj:setHeight(57);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({bottom=2});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(4);
    obj.button1:setTop(27);
    obj.button1:setWidth(32);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setHeight(57);
    obj.rectangle1:setWidth(700);
    obj.rectangle1:setLeft(34);
    obj.rectangle1:setColor("#FDF5E6");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(15);
    obj.rectangle2:setHeight(30);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setColor("#00000000");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setAutoSize(true);
    obj.label1:setWordWrap(false);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(16);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Black");
    obj.label1:setText("Atributo:");
    obj.label1:setName("label1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setTop(27);
    obj.rectangle3:setLeft(5);
    obj.rectangle3:setHeight(30);
    obj.rectangle3:setWidth(230);
    obj.rectangle3:setName("rectangle3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle3);
    obj.edit1:setFontSize(18);
    obj.edit1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoTitulo");
    obj.edit1:setHitTest(true);
    obj.edit1:setHint("Atributo");
    obj.edit1:setName("edit1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle1);
    obj.rectangle4:setLeft(235);
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setWidth(100);
    obj.rectangle4:setColor("#00000000");
    obj.rectangle4:setName("rectangle4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle4);
    obj.label2:setAutoSize(true);
    obj.label2:setWordWrap(false);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(16);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Black");
    obj.label2:setText("Qtd. de Dados:");
    obj.label2:setName("label2");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle1);
    obj.rectangle5:setTop(27);
    obj.rectangle5:setLeft(245);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setWidth(90);
    obj.rectangle5:setName("rectangle5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle5);
    obj.edit2:setFontSize(18);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setAlign("client");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("RolP");
    obj.edit2:setHitTest(true);
    obj.edit2:setHint("Quantidade de Dados do Atributo");
    obj.edit2:setName("edit2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle1);
    obj.rectangle6:setLeft(365);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setColor("#00000000");
    obj.rectangle6:setName("rectangle6");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle6);
    obj.label3:setAutoSize(true);
    obj.label3:setWordWrap(false);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(16);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("Black");
    obj.label3:setText("Habilidade");
    obj.label3:setName("label3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle1);
    obj.rectangle7:setTop(27);
    obj.rectangle7:setLeft(355);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setWidth(230);
    obj.rectangle7:setName("rectangle7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle7);
    obj.edit3:setFontSize(18);
    obj.edit3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setAlign("client");
    obj.edit3:setField("campoTitulo2");
    obj.edit3:setHitTest(true);
    obj.edit3:setHint("Habilidade");
    obj.edit3:setName("edit3");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle1);
    obj.rectangle8:setLeft(585);
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setWidth(100);
    obj.rectangle8:setColor("#00000000");
    obj.rectangle8:setName("rectangle8");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle8);
    obj.label4:setAutoSize(true);
    obj.label4:setWordWrap(false);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(16);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("Black");
    obj.label4:setText("Qtd. de Dados:");
    obj.label4:setName("label4");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle1);
    obj.rectangle9:setTop(27);
    obj.rectangle9:setLeft(595);
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setWidth(90);
    obj.rectangle9:setName("rectangle9");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle9);
    obj.edit4:setFontSize(18);
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setAlign("client");
    obj.edit4:setField("RolS");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setHitTest(true);
    obj.edit4:setHint("Qtd. Dados Habilidade");
    obj.edit4:setName("edit4");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(735);
    obj.button2:setTop(27);
    obj.button2:setWidth(32);
    obj.button2:setText("R");
    obj.button2:setHitTest(true);
    obj.button2:setHint("Rolar teste com dif 6");
    obj.button2:setName("button2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local dado1 = tonumber(sheet.RolP)
            					    local dado2 = tonumber(sheet.RolS)
            						local nomeStr = "Teste de: " .. (sheet.campoTitulo or " ") .. "+" .. (sheet.campoTitulo2 or " ")
            						
            						local quantidade = tonumber((dado1 or 0) + (dado2 or 0))
            						
            						local teste = quantidade .. "d10" .. ">" .. "6"
            						
            						local rolagem = Firecast.interpretarRolagem(teste)
            
                                    if not rolagem.possuiAlgumDado then
                                            -- se o usuario não tiver preenchido qual dado rolar,
                                            -- vamos adicionar um 1d20 + na "fórmula da rolagem"
                                            rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem);
                                    end; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:rolarDados(rolagem, nomeStr);
                                   end;
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLR()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLR();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLR = {
    newEditor = newfrmLR, 
    new = newfrmLR, 
    name = "frmLR", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLR = _frmLR;
Firecast.registrarForm(_frmLR);

return _frmLR;
