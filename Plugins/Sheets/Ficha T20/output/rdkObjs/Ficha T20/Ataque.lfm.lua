require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAtaque()
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
    obj:setName("frmAtaque");
    obj:setWidth(423);
    obj:setHeight(57);
    obj:setMargins({left=3,right=2,top=2,bottom=10});
    obj:setTheme("dark");


        


    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setWidth(423);
    obj.image1:setHeight(57);
    obj.image1:setSRC("/imagens/Extra_Atk.png");
    obj.image1:setName("image1");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj);
    obj.imageCheckBox1:setLeft(1);
    obj.imageCheckBox1:setTop(1);
    obj.imageCheckBox1:setHeight(26);
    obj.imageCheckBox1:setWidth(26);
    obj.imageCheckBox1:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox1:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox1:setField("trained");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(31);
    obj.edit1:setTop(4);
    obj.edit1:setHeight(20);
    obj.edit1:setWidth(178);
    obj.edit1:setField("attack");
    obj.edit1:setFontColor("black");
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(217);
    obj.label1:setTop(4);
    obj.label1:setWidth(33);
    obj.label1:setHeight(20);
    obj.label1:setField("total");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontColor("black");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(217);
    obj.button1:setTop(4);
    obj.button1:setWidth(33);
    obj.button1:setHeight(20);
    obj.button1:setOpacity(0.5);
    obj.button1:setName("button1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setLeft(275);
    obj.comboBox1:setTop(4);
    obj.comboBox1:setWidth(33);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox1:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox1:setField("key");
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("black");
    obj.comboBox1:setName("comboBox1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(328);
    obj.edit2:setTop(4);
    obj.edit2:setWidth(23);
    obj.edit2:setHeight(20);
    obj.edit2:setField("other");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontColor("black");
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(370);
    obj.edit3:setTop(4);
    obj.edit3:setWidth(23);
    obj.edit3:setHeight(20);
    obj.edit3:setField("extra");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontColor("black");
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(400);
    obj.button2:setTop(4);
    obj.button2:setWidth(22);
    obj.button2:setHeight(22);
    obj.button2:setOpacity(0.5);
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'key', 'other', 'extra', 'skills_bonus', 'trained', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod','level'});
    obj.dataLink1:setName("dataLink1");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(32);
    obj.edit4:setTop(31);
    obj.edit4:setHeight(20);
    obj.edit4:setWidth(91);
    obj.edit4:setField("dmg_1");
    obj.edit4:setFontColor("black");
    obj.edit4:setTransparent(true);
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(141);
    obj.edit5:setTop(31);
    obj.edit5:setHeight(20);
    obj.edit5:setWidth(42);
    obj.edit5:setField("dmg_2");
    obj.edit5:setFontColor("black");
    obj.edit5:setTransparent(true);
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(206);
    obj.edit6:setTop(31);
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(42);
    obj.edit6:setField("dmg_3");
    obj.edit6:setFontColor("black");
    obj.edit6:setTransparent(true);
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setLeft(270);
    obj.edit7:setTop(31);
    obj.edit7:setHeight(20);
    obj.edit7:setWidth(42);
    obj.edit7:setField("dmg_4");
    obj.edit7:setFontColor("black");
    obj.edit7:setTransparent(true);
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj);
    obj.edit8:setLeft(334);
    obj.edit8:setTop(31);
    obj.edit8:setHeight(20);
    obj.edit8:setWidth(42);
    obj.edit8:setField("dmg_5");
    obj.edit8:setFontColor("black");
    obj.edit8:setTransparent(true);
    obj.edit8:setName("edit8");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.total or 0)); 
            
                        local room = Firecast.getMesaDe(sheet);
                        room.activeChat:rolarDados(roll, (sheet.attack or ""));
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse ataque?",
                                             function (confirmado)
                                                if confirmado then
                                                    sheet.trained = false
                                                    NDB.deleteNode(sheet);
                                                end;
                                             end);
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                        local atr = 0
                        if sheet.key~=nil then 
                            atr = tonumber(sheet[sheet.key.."_mod"] or 0)
                        end
            
                        local train = 0
                        if sheet.trained then
                            train = tonumber(sheet.skills_bonus or 0)
                        end
            
                        sheet.total =   atr + train + 
                                        tonumber(sheet.other or 0) + 
                                        tonumber(sheet.extra or 0) + 
                                        tonumber(sheet.level or 0)
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
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAtaque()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAtaque();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAtaque = {
    newEditor = newfrmAtaque, 
    new = newfrmAtaque, 
    name = "frmAtaque", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAtaque = _frmAtaque;
Firecast.registrarForm(_frmAtaque);

return _frmAtaque;
