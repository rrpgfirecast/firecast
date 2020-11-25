require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLD()
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
    obj:setName("frmLD");
    obj:setHeight(30);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({bottom=2});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(4);
    obj.button1:setWidth(32);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setHeight(30);
    obj.rectangle1:setWidth(855);
    obj.rectangle1:setLeft(34);
    obj.rectangle1:setColor("#FF6347");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(5);
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
    obj.label1:setText("Nome:");
    obj.label1:setName("label1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(60);
    obj.rectangle3:setHeight(30);
    obj.rectangle3:setWidth(230);
    obj.rectangle3:setName("rectangle3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle3);
    obj.edit1:setFontSize(18);
    obj.edit1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoDano");
    obj.edit1:setHitTest(true);
    obj.edit1:setHint("Título da Rolagem");
    obj.edit1:setName("edit1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle1);
    obj.rectangle4:setLeft(300);
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
    obj.label2:setText("Dados de Dano:");
    obj.label2:setName("label2");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle1);
    obj.rectangle5:setLeft(430);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setWidth(180);
    obj.rectangle5:setName("rectangle5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle5);
    obj.edit2:setFontSize(18);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setAlign("client");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("RolD");
    obj.edit2:setHitTest(true);
    obj.edit2:setHint("Dados de Dano");
    obj.edit2:setName("edit2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle1);
    obj.rectangle6:setLeft(615);
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
    obj.label3:setText("Multiplicador:");
    obj.label3:setName("label3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle1);
    obj.rectangle7:setLeft(735);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setWidth(120);
    obj.rectangle7:setName("rectangle7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle7);
    obj.edit3:setFontSize(18);
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setAlign("client");
    obj.edit3:setField("Mult");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setHitTest(true);
    obj.edit3:setHint("Multiplicador (Alterar de acordo com o acerto)");
    obj.edit3:setName("edit3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(895);
    obj.button2:setWidth(32);
    obj.button2:setText("RD");
    obj.button2:setName("button2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.RolD); 
            				local nomeDMG = sheet.campoDano;
             
            				if not rolagem.possuiAlgumDado then
            				rolagem = Firecast.interpretarRolagem("1d12"):concatenar(rolagem);
            				end; 
                                    
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet);
             
            				if mesaDoPersonagem ~= nil then
            				
            				mesaDoPersonagem.chat:rolarDados(rolagem, nomeDMG,
            				function (rolado) 
            				
                            local dano = math.floor(tonumber(rolado.resultado*sheet.Mult))
            				
            				setTimeout(function ()
            								
                            mesaDoPersonagem.chat:enviarMensagem("[§K14]O Multiplicador é [§K1][§B]" .. sheet.Mult .. "[§B][§K14] - " .. nomeDMG .." causou [§K1][§B]" .. dano .. "[§B][§K14] de dano");
            				
            				end, 1000)
            				
            				end);
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
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLD()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLD();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLD = {
    newEditor = newfrmLD, 
    new = newfrmLD, 
    name = "frmLD", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLD = _frmLD;
Firecast.registrarForm(_frmLD);

return _frmLD;
