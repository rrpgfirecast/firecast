require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaNave()
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
    obj:setName("frmFichaNave");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Starfinder.Nave");
    obj:setTitle("Ficha Starfinder (Nave)");
    obj:setAlign("client");
    obj:setTheme("dark");



        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;
        local function findPopup(myPop)
            local pop = self:findControlByName(myPop);
                
            if pop ~= nil and sheet ~= nil then
                pop:setNodeObject(sheet);
                pop:showPopupEx("center", self);
            elseif pop == nil then
                showMessage("Ops, bug.. nao encontrei o popup para exibir");
            end;                
        end;
        


    obj.addPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.addPop:setParent(obj);
    obj.addPop:setName("addPop");
    obj.addPop:setWidth(455);
    obj.addPop:setHeight(310);
    obj.addPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.addPop, "autoScopeNode",  "false");
    obj.addPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.addPop);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("Estrutura (PV)");
    obj.label1:setWidth(210);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setText("CAE");
    obj.label2:setWidth(70);
    obj.label2:setMargins({right=10});
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setAlign("left");
    obj.label3:setText("CAC");
    obj.label3:setWidth(70);
    obj.label3:setMargins({right=10});
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setAlign("left");
    obj.label4:setText("Proteção");
    obj.label4:setWidth(70);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.addPop);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(50);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setText("+%");
    obj.label5:setWidth(100);
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setTop(20);
    obj.edit1:setField("pvMult");
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setText("Fixo");
    obj.label6:setWidth(100);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setTop(20);
    obj.edit2:setField("pvAdd");
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(35);
    obj.layout5:setMargins({right=5});
    obj.layout5:setName("layout5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setText("+%");
    obj.label7:setWidth(35);
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setFontSize(11);
    obj.label7:setName("label7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setTop(20);
    obj.edit3:setField("caeMult");
    obj.edit3:setWidth(35);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(35);
    obj.layout6:setMargins({right=5});
    obj.layout6:setName("layout6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout6);
    obj.label8:setText("Fixo");
    obj.label8:setWidth(35);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setFontSize(11);
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setTop(20);
    obj.edit4:setField("caeAdd");
    obj.edit4:setWidth(35);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(35);
    obj.layout7:setMargins({right=5});
    obj.layout7:setName("layout7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setText("+%");
    obj.label9:setWidth(35);
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setFontSize(11);
    obj.label9:setName("label9");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setTop(20);
    obj.edit5:setField("cacMult");
    obj.edit5:setWidth(35);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(35);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setText("Fixo");
    obj.label10:setWidth(35);
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTop(20);
    obj.edit6:setField("cacAdd");
    obj.edit6:setWidth(35);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(35);
    obj.layout9:setMargins({right=5});
    obj.layout9:setName("layout9");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11:setText("+%");
    obj.label11:setWidth(35);
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setFontSize(11);
    obj.label11:setName("label11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTop(20);
    obj.edit7:setField("protMult");
    obj.edit7:setWidth(35);
    obj.edit7:setHeight(25);
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(35);
    obj.layout10:setMargins({right=5});
    obj.layout10:setName("layout10");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setText("Fixo");
    obj.label12:setWidth(35);
    obj.label12:setHorzTextAlign("leading");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTop(20);
    obj.edit8:setField("protAdd");
    obj.edit8:setWidth(35);
    obj.edit8:setHeight(25);
    obj.edit8:setName("edit8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.addPop);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout11);
    obj.label13:setAlign("left");
    obj.label13:setText("Modificadores");
    obj.label13:setWidth(210);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setAlign("left");
    obj.label14:setText("Deslocamento");
    obj.label14:setHeight(210);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.addPop);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(50);
    obj.layout12:setName("layout12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(100);
    obj.layout13:setMargins({right=5});
    obj.layout13:setName("layout13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setText("Pilotar");
    obj.label15:setWidth(100);
    obj.label15:setHorzTextAlign("leading");
    obj.label15:setFontSize(13);
    obj.label15:setName("label15");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout13);
    obj.edit9:setTop(20);
    obj.edit9:setField("pilotarAdd");
    obj.edit9:setWidth(100);
    obj.edit9:setHeight(25);
    obj.edit9:setName("edit9");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout12);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(100);
    obj.layout14:setMargins({right=5});
    obj.layout14:setName("layout14");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout14);
    obj.label16:setText("Ataque");
    obj.label16:setWidth(100);
    obj.label16:setHorzTextAlign("leading");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout14);
    obj.edit10:setTop(20);
    obj.edit10:setField("ataqueAdd");
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(25);
    obj.edit10:setName("edit10");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout12);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(100);
    obj.layout15:setMargins({right=5});
    obj.layout15:setName("layout15");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout15);
    obj.label17:setText("+%");
    obj.label17:setWidth(100);
    obj.label17:setHorzTextAlign("leading");
    obj.label17:setFontSize(13);
    obj.label17:setName("label17");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout15);
    obj.edit11:setTop(20);
    obj.edit11:setField("deslMult");
    obj.edit11:setWidth(100);
    obj.edit11:setHeight(25);
    obj.edit11:setName("edit11");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout12);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(100);
    obj.layout16:setMargins({right=5});
    obj.layout16:setName("layout16");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout16);
    obj.label18:setText("Fixo (q)");
    obj.label18:setWidth(100);
    obj.label18:setHorzTextAlign("leading");
    obj.label18:setFontSize(13);
    obj.label18:setName("label18");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout16);
    obj.edit12:setTop(20);
    obj.edit12:setField("deslAdd");
    obj.edit12:setWidth(100);
    obj.edit12:setHeight(25);
    obj.edit12:setName("edit12");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.addPop);
    obj.label19:setAlign("top");
    obj.label19:setText("Preço");
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.addPop);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(50);
    obj.layout17:setName("layout17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(60);
    obj.layout18:setMargins({right=5});
    obj.layout18:setName("layout18");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout18);
    obj.label20:setText("Total");
    obj.label20:setWidth(60);
    obj.label20:setHorzTextAlign("leading");
    obj.label20:setFontSize(11);
    obj.label20:setName("label20");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout18);
    obj.rectangle1:setTop(20);
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setWidth(60);
    obj.rectangle1:setColor("#F0FFFF");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle1);
    obj.label21:setAlign("client");
    obj.label21:setField("precoTotal");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setVertTextAlign("center");
    lfm_setPropAsString(obj.label21, "format",  "%d C");
    lfm_setPropAsString(obj.label21, "formatFloat",  "");
    obj.label21:setName("label21");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout17);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(60);
    obj.layout19:setMargins({right=5});
    obj.layout19:setName("layout19");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout19);
    obj.label22:setText("Level");
    obj.label22:setWidth(60);
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setFontSize(11);
    obj.label22:setName("label22");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout19);
    obj.edit13:setTop(20);
    obj.edit13:setField("precoPorLevel");
    obj.edit13:setWidth(60);
    obj.edit13:setHeight(25);
    obj.edit13:setName("edit13");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout17);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(60);
    obj.layout20:setMargins({right=5});
    obj.layout20:setName("layout20");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout20);
    obj.label23:setText("");
    obj.label23:setWidth(60);
    obj.label23:setHorzTextAlign("leading");
    obj.label23:setFontSize(11);
    obj.label23:setName("label23");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout20);
    obj.rectangle2:setTop(20);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setWidth(60);
    obj.rectangle2:setColor("#F0FFFF");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle2);
    obj.label24:setAlign("client");
    obj.label24:setField("precoLevel");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setVertTextAlign("center");
    lfm_setPropAsString(obj.label24, "format",  "%d C");
    lfm_setPropAsString(obj.label24, "formatFloat",  "");
    obj.label24:setName("label24");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout17);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(60);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout21);
    obj.label25:setText("Tam");
    obj.label25:setWidth(60);
    obj.label25:setHorzTextAlign("leading");
    obj.label25:setFontSize(11);
    obj.label25:setName("label25");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout21);
    obj.edit14:setTop(20);
    obj.edit14:setField("precoPorTam");
    obj.edit14:setWidth(60);
    obj.edit14:setHeight(25);
    obj.edit14:setName("edit14");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout17);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(60);
    obj.layout22:setMargins({right=5});
    obj.layout22:setName("layout22");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout22);
    obj.label26:setText("");
    obj.label26:setWidth(60);
    obj.label26:setHorzTextAlign("leading");
    obj.label26:setFontSize(11);
    obj.label26:setName("label26");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout22);
    obj.rectangle3:setTop(20);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setWidth(60);
    obj.rectangle3:setColor("#F0FFFF");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle3);
    obj.label27:setAlign("client");
    obj.label27:setField("precoTam");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("center");
    lfm_setPropAsString(obj.label27, "format",  "%d C");
    lfm_setPropAsString(obj.label27, "formatFloat",  "");
    obj.label27:setName("label27");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout17);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(60);
    obj.layout23:setMargins({right=5});
    obj.layout23:setName("layout23");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout23);
    obj.label28:setText("Fixo");
    obj.label28:setWidth(60);
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setFontSize(11);
    obj.label28:setName("label28");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout23);
    obj.edit15:setTop(20);
    obj.edit15:setField("precoAdd");
    obj.edit15:setWidth(60);
    obj.edit15:setHeight(25);
    obj.edit15:setName("edit15");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout17);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(60);
    obj.layout24:setMargins({right=5});
    obj.layout24:setName("layout24");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout24);
    obj.label29:setText("+%");
    obj.label29:setWidth(60);
    obj.label29:setHorzTextAlign("leading");
    obj.label29:setFontSize(11);
    obj.label29:setName("label29");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout24);
    obj.edit16:setTop(20);
    obj.edit16:setField("precoMult");
    obj.edit16:setWidth(60);
    obj.edit16:setHeight(25);
    obj.edit16:setName("edit16");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.addPop);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("detalhes");
    obj.textEditor1:setName("textEditor1");

    obj.costPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.costPop:setParent(obj);
    obj.costPop:setName("costPop");
    obj.costPop:setWidth(325);
    obj.costPop:setHeight(60);
    obj.costPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.costPop, "autoScopeNode",  "false");
    obj.costPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.costPop);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(50);
    obj.layout25:setName("layout25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(75);
    obj.layout26:setMargins({right=5});
    obj.layout26:setName("layout26");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout26);
    obj.label30:setText("Base");
    obj.label30:setWidth(75);
    obj.label30:setHorzTextAlign("leading");
    obj.label30:setFontSize(11);
    obj.label30:setName("label30");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout26);
    obj.edit17:setTop(20);
    obj.edit17:setField("precoBase");
    obj.edit17:setWidth(75);
    obj.edit17:setHeight(25);
    obj.edit17:setName("edit17");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout25);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(75);
    obj.layout27:setMargins({right=5});
    obj.layout27:setName("layout27");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout27);
    obj.label31:setText("Multiplicador");
    obj.label31:setWidth(75);
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setFontSize(9);
    obj.label31:setName("label31");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout27);
    obj.rectangle4:setTop(20);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setWidth(75);
    obj.rectangle4:setColor("#F0FFFF");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle4);
    obj.label32:setAlign("client");
    obj.label32:setField("precoMult");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setVertTextAlign("center");
    lfm_setPropAsString(obj.label32, "format",  "%.2f");
    lfm_setPropAsString(obj.label32, "formatFloat",  "");
    obj.label32:setName("label32");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout25);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(75);
    obj.layout28:setMargins({right=5});
    obj.layout28:setName("layout28");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout28);
    obj.label33:setText("Adicionais");
    obj.label33:setWidth(75);
    obj.label33:setHorzTextAlign("leading");
    obj.label33:setFontSize(11);
    obj.label33:setName("label33");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout28);
    obj.rectangle5:setTop(20);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setWidth(75);
    obj.rectangle5:setColor("#F0FFFF");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle5);
    obj.label34:setAlign("client");
    obj.label34:setField("precoMod");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("center");
    lfm_setPropAsString(obj.label34, "format",  "%d C");
    lfm_setPropAsString(obj.label34, "formatFloat",  "");
    obj.label34:setName("label34");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout25);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(75);
    obj.layout29:setMargins({right=5});
    obj.layout29:setName("layout29");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout29);
    obj.label35:setText("Outros");
    obj.label35:setWidth(75);
    obj.label35:setHorzTextAlign("leading");
    obj.label35:setFontSize(11);
    obj.label35:setName("label35");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout29);
    obj.edit18:setTop(20);
    obj.edit18:setField("precoOutros");
    obj.edit18:setWidth(75);
    obj.edit18:setHeight(25);
    obj.edit18:setName("edit18");

    obj.deslPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.deslPop:setParent(obj);
    obj.deslPop:setName("deslPop");
    obj.deslPop:setWidth(395);
    obj.deslPop:setHeight(60);
    obj.deslPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.deslPop, "autoScopeNode",  "false");
    obj.deslPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.deslPop);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(50);
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(60);
    obj.layout31:setMargins({right=5});
    obj.layout31:setName("layout31");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout31);
    obj.label36:setText("Base (q)");
    obj.label36:setWidth(60);
    obj.label36:setHorzTextAlign("leading");
    obj.label36:setFontSize(11);
    obj.label36:setName("label36");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout31);
    obj.edit19:setTop(20);
    obj.edit19:setField("deslBase");
    obj.edit19:setWidth(60);
    obj.edit19:setHeight(25);
    obj.edit19:setName("edit19");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(60);
    obj.layout32:setMargins({right=5});
    obj.layout32:setName("layout32");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout32);
    obj.label37:setText("Viagem (Km/h)");
    obj.label37:setWidth(60);
    obj.label37:setHorzTextAlign("leading");
    obj.label37:setFontSize(9);
    obj.label37:setName("label37");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout32);
    obj.edit20:setTop(20);
    obj.edit20:setField("deslBaseViagem");
    obj.edit20:setWidth(60);
    obj.edit20:setHeight(25);
    obj.edit20:setName("edit20");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(60);
    obj.layout33:setMargins({right=5});
    obj.layout33:setName("layout33");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout33);
    obj.label38:setText("Multiplicador");
    obj.label38:setWidth(60);
    obj.label38:setHorzTextAlign("leading");
    obj.label38:setFontSize(9);
    obj.label38:setName("label38");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout33);
    obj.rectangle6:setTop(20);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setWidth(60);
    obj.rectangle6:setColor("#F0FFFF");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle6);
    obj.label39:setAlign("client");
    obj.label39:setField("deslMult");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setVertTextAlign("center");
    lfm_setPropAsString(obj.label39, "format",  "%.2f");
    lfm_setPropAsString(obj.label39, "formatFloat",  "");
    obj.label39:setName("label39");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout30);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(60);
    obj.layout34:setMargins({right=5});
    obj.layout34:setName("layout34");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout34);
    obj.label40:setText("Adicionais (q)");
    obj.label40:setWidth(60);
    obj.label40:setHorzTextAlign("leading");
    obj.label40:setFontSize(9);
    obj.label40:setName("label40");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout34);
    obj.rectangle7:setTop(20);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setWidth(60);
    obj.rectangle7:setColor("#F0FFFF");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle7);
    obj.label41:setAlign("client");
    obj.label41:setField("deslAdd");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("center");
    lfm_setPropAsString(obj.label41, "format",  "");
    lfm_setPropAsString(obj.label41, "formatFloat",  "");
    obj.label41:setName("label41");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout30);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(60);
    obj.layout35:setMargins({right=5});
    obj.layout35:setName("layout35");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout35);
    obj.label42:setText("Outros (q)");
    obj.label42:setWidth(60);
    obj.label42:setHorzTextAlign("leading");
    obj.label42:setFontSize(11);
    obj.label42:setName("label42");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout35);
    obj.edit21:setTop(20);
    obj.edit21:setField("deslOutros");
    obj.edit21:setWidth(60);
    obj.edit21:setHeight(25);
    obj.edit21:setName("edit21");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout30);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(60);
    obj.layout36:setMargins({right=5});
    obj.layout36:setName("layout36");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout36);
    obj.label43:setText("Outros (Km/h)");
    obj.label43:setWidth(60);
    obj.label43:setHorzTextAlign("leading");
    obj.label43:setFontSize(9);
    obj.label43:setName("label43");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout36);
    obj.edit22:setTop(20);
    obj.edit22:setField("deslOutrosViagem");
    obj.edit22:setWidth(60);
    obj.edit22:setHeight(25);
    obj.edit22:setName("edit22");

    obj.modPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.modPop:setParent(obj);
    obj.modPop:setName("modPop");
    obj.modPop:setWidth(200);
    obj.modPop:setHeight(160);
    obj.modPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.modPop, "autoScopeNode",  "false");
    obj.modPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.modPop);
    obj.label44:setAlign("top");
    obj.label44:setText("Pilotagem");
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.modPop);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(50);
    obj.layout37:setName("layout37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(60);
    obj.layout38:setMargins({right=5});
    obj.layout38:setName("layout38");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout38);
    obj.label45:setText("Base");
    obj.label45:setWidth(60);
    obj.label45:setHorzTextAlign("leading");
    obj.label45:setFontSize(11);
    obj.label45:setName("label45");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout38);
    obj.edit23:setTop(20);
    obj.edit23:setField("pilBase");
    obj.edit23:setWidth(60);
    obj.edit23:setHeight(25);
    obj.edit23:setName("edit23");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout37);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(60);
    obj.layout39:setMargins({right=5});
    obj.layout39:setName("layout39");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout39);
    obj.label46:setText("Adicional");
    obj.label46:setWidth(60);
    obj.label46:setHorzTextAlign("leading");
    obj.label46:setFontSize(9);
    obj.label46:setName("label46");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout39);
    obj.rectangle8:setTop(20);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setWidth(60);
    obj.rectangle8:setColor("#F0FFFF");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle8);
    obj.label47:setAlign("client");
    obj.label47:setField("pilotarAdd");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    lfm_setPropAsString(obj.label47, "format",  "");
    lfm_setPropAsString(obj.label47, "formatFloat",  "");
    obj.label47:setName("label47");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout37);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(60);
    obj.layout40:setMargins({right=5});
    obj.layout40:setName("layout40");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout40);
    obj.label48:setText("Outros");
    obj.label48:setWidth(60);
    obj.label48:setHorzTextAlign("leading");
    obj.label48:setFontSize(11);
    obj.label48:setName("label48");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout40);
    obj.edit24:setTop(20);
    obj.edit24:setField("pilOutros");
    obj.edit24:setWidth(60);
    obj.edit24:setHeight(25);
    obj.edit24:setName("edit24");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.modPop);
    obj.label49:setAlign("top");
    obj.label49:setText("Ataque");
    obj.label49:setHeight(25);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.modPop);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(50);
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(60);
    obj.layout42:setMargins({right=5});
    obj.layout42:setName("layout42");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout42);
    obj.label50:setText("Base");
    obj.label50:setWidth(60);
    obj.label50:setHorzTextAlign("leading");
    obj.label50:setFontSize(11);
    obj.label50:setName("label50");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout42);
    obj.edit25:setTop(20);
    obj.edit25:setField("atkBase");
    obj.edit25:setWidth(60);
    obj.edit25:setHeight(25);
    obj.edit25:setName("edit25");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(60);
    obj.layout43:setMargins({right=5});
    obj.layout43:setName("layout43");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout43);
    obj.label51:setText("Adicional");
    obj.label51:setWidth(60);
    obj.label51:setHorzTextAlign("leading");
    obj.label51:setFontSize(9);
    obj.label51:setName("label51");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout43);
    obj.rectangle9:setTop(20);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setWidth(60);
    obj.rectangle9:setColor("#F0FFFF");
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle9);
    obj.label52:setAlign("client");
    obj.label52:setField("ataqueAdd");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setVertTextAlign("center");
    lfm_setPropAsString(obj.label52, "format",  "");
    lfm_setPropAsString(obj.label52, "formatFloat",  "");
    obj.label52:setName("label52");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout41);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(60);
    obj.layout44:setMargins({right=5});
    obj.layout44:setName("layout44");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout44);
    obj.label53:setText("Outros");
    obj.label53:setWidth(60);
    obj.label53:setHorzTextAlign("leading");
    obj.label53:setFontSize(11);
    obj.label53:setName("label53");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout44);
    obj.edit26:setTop(20);
    obj.edit26:setField("atkOutros");
    obj.edit26:setWidth(60);
    obj.edit26:setHeight(25);
    obj.edit26:setName("edit26");

    obj.caPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.caPop:setParent(obj);
    obj.caPop:setName("caPop");
    obj.caPop:setWidth(265);
    obj.caPop:setHeight(235);
    obj.caPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.caPop, "autoScopeNode",  "false");
    obj.caPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.caPop);
    obj.label54:setAlign("top");
    obj.label54:setText("CAE");
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.caPop);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(50);
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(60);
    obj.layout46:setMargins({right=5});
    obj.layout46:setName("layout46");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout46);
    obj.label55:setText("Base");
    obj.label55:setWidth(60);
    obj.label55:setHorzTextAlign("leading");
    obj.label55:setFontSize(11);
    obj.label55:setName("label55");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout46);
    obj.edit27:setTop(20);
    obj.edit27:setField("caeBase");
    obj.edit27:setWidth(60);
    obj.edit27:setHeight(25);
    obj.edit27:setName("edit27");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout45);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(60);
    obj.layout47:setMargins({right=5});
    obj.layout47:setName("layout47");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout47);
    obj.label56:setText("Adicional");
    obj.label56:setWidth(60);
    obj.label56:setHorzTextAlign("leading");
    obj.label56:setFontSize(9);
    obj.label56:setName("label56");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout47);
    obj.rectangle10:setTop(20);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setWidth(60);
    obj.rectangle10:setColor("#F0FFFF");
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle10);
    obj.label57:setAlign("client");
    obj.label57:setField("caeAdd");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setVertTextAlign("center");
    lfm_setPropAsString(obj.label57, "format",  "");
    lfm_setPropAsString(obj.label57, "formatFloat",  "");
    obj.label57:setName("label57");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout45);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(60);
    obj.layout48:setMargins({right=5});
    obj.layout48:setName("layout48");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout48);
    obj.label58:setText("Multiplicador");
    obj.label58:setWidth(60);
    obj.label58:setHorzTextAlign("leading");
    obj.label58:setFontSize(9);
    obj.label58:setName("label58");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout48);
    obj.rectangle11:setTop(20);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setWidth(60);
    obj.rectangle11:setColor("#F0FFFF");
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle11);
    obj.label59:setAlign("client");
    obj.label59:setField("caeMult");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setVertTextAlign("center");
    lfm_setPropAsString(obj.label59, "format",  "");
    lfm_setPropAsString(obj.label59, "formatFloat",  "");
    obj.label59:setName("label59");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout45);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(60);
    obj.layout49:setMargins({right=5});
    obj.layout49:setName("layout49");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout49);
    obj.label60:setText("Outros");
    obj.label60:setWidth(60);
    obj.label60:setHorzTextAlign("leading");
    obj.label60:setFontSize(11);
    obj.label60:setName("label60");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout49);
    obj.edit28:setTop(20);
    obj.edit28:setField("caeOutros");
    obj.edit28:setWidth(60);
    obj.edit28:setHeight(25);
    obj.edit28:setName("edit28");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.caPop);
    obj.label61:setAlign("top");
    obj.label61:setText("CAC");
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.caPop);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(50);
    obj.layout50:setName("layout50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(60);
    obj.layout51:setMargins({right=5});
    obj.layout51:setName("layout51");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout51);
    obj.label62:setText("Base");
    obj.label62:setWidth(60);
    obj.label62:setHorzTextAlign("leading");
    obj.label62:setFontSize(11);
    obj.label62:setName("label62");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout51);
    obj.edit29:setTop(20);
    obj.edit29:setField("cacBase");
    obj.edit29:setWidth(60);
    obj.edit29:setHeight(25);
    obj.edit29:setName("edit29");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(60);
    obj.layout52:setMargins({right=5});
    obj.layout52:setName("layout52");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout52);
    obj.label63:setText("Adicional");
    obj.label63:setWidth(60);
    obj.label63:setHorzTextAlign("leading");
    obj.label63:setFontSize(9);
    obj.label63:setName("label63");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout52);
    obj.rectangle12:setTop(20);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setWidth(60);
    obj.rectangle12:setColor("#F0FFFF");
    obj.rectangle12:setStrokeColor("black");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle12);
    obj.label64:setAlign("client");
    obj.label64:setField("cacAdd");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setVertTextAlign("center");
    lfm_setPropAsString(obj.label64, "format",  "");
    lfm_setPropAsString(obj.label64, "formatFloat",  "");
    obj.label64:setName("label64");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(60);
    obj.layout53:setMargins({right=5});
    obj.layout53:setName("layout53");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout53);
    obj.label65:setText("Multiplicador");
    obj.label65:setWidth(60);
    obj.label65:setHorzTextAlign("leading");
    obj.label65:setFontSize(9);
    obj.label65:setName("label65");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout53);
    obj.rectangle13:setTop(20);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setWidth(60);
    obj.rectangle13:setColor("#F0FFFF");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle13);
    obj.label66:setAlign("client");
    obj.label66:setField("cacMult");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setVertTextAlign("center");
    lfm_setPropAsString(obj.label66, "format",  "");
    lfm_setPropAsString(obj.label66, "formatFloat",  "");
    obj.label66:setName("label66");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout50);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(60);
    obj.layout54:setMargins({right=5});
    obj.layout54:setName("layout54");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout54);
    obj.label67:setText("Outros");
    obj.label67:setWidth(60);
    obj.label67:setHorzTextAlign("leading");
    obj.label67:setFontSize(11);
    obj.label67:setName("label67");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout54);
    obj.edit30:setTop(20);
    obj.edit30:setField("cacOutros");
    obj.edit30:setWidth(60);
    obj.edit30:setHeight(25);
    obj.edit30:setName("edit30");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.caPop);
    obj.label68:setAlign("top");
    obj.label68:setText("Proteção");
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.caPop);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(50);
    obj.layout55:setName("layout55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(60);
    obj.layout56:setMargins({right=5});
    obj.layout56:setName("layout56");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout56);
    obj.label69:setText("Base");
    obj.label69:setWidth(60);
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setFontSize(11);
    obj.label69:setName("label69");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout56);
    obj.edit31:setTop(20);
    obj.edit31:setField("protBase");
    obj.edit31:setWidth(60);
    obj.edit31:setHeight(25);
    obj.edit31:setName("edit31");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout55);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(60);
    obj.layout57:setMargins({right=5});
    obj.layout57:setName("layout57");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout57);
    obj.label70:setText("Adicional");
    obj.label70:setWidth(60);
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setFontSize(9);
    obj.label70:setName("label70");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout57);
    obj.rectangle14:setTop(20);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setWidth(60);
    obj.rectangle14:setColor("#F0FFFF");
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle14);
    obj.label71:setAlign("client");
    obj.label71:setField("protAdd");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setVertTextAlign("center");
    lfm_setPropAsString(obj.label71, "format",  "");
    lfm_setPropAsString(obj.label71, "formatFloat",  "");
    obj.label71:setName("label71");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout55);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(60);
    obj.layout58:setMargins({right=5});
    obj.layout58:setName("layout58");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout58);
    obj.label72:setText("Multiplicador");
    obj.label72:setWidth(60);
    obj.label72:setHorzTextAlign("leading");
    obj.label72:setFontSize(9);
    obj.label72:setName("label72");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout58);
    obj.rectangle15:setTop(20);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setWidth(60);
    obj.rectangle15:setColor("#F0FFFF");
    obj.rectangle15:setStrokeColor("black");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle15);
    obj.label73:setAlign("client");
    obj.label73:setField("protMult");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setVertTextAlign("center");
    lfm_setPropAsString(obj.label73, "format",  "");
    lfm_setPropAsString(obj.label73, "formatFloat",  "");
    obj.label73:setName("label73");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout55);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(60);
    obj.layout59:setMargins({right=5});
    obj.layout59:setName("layout59");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout59);
    obj.label74:setText("Outros");
    obj.label74:setWidth(60);
    obj.label74:setHorzTextAlign("leading");
    obj.label74:setFontSize(11);
    obj.label74:setName("label74");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout59);
    obj.edit32:setTop(20);
    obj.edit32:setField("protOutros");
    obj.edit32:setWidth(60);
    obj.edit32:setHeight(25);
    obj.edit32:setName("edit32");

    obj.healthPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.healthPop:setParent(obj);
    obj.healthPop:setName("healthPop");
    obj.healthPop:setWidth(370);
    obj.healthPop:setHeight(85);
    obj.healthPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.healthPop, "autoScopeNode",  "false");
    obj.healthPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.healthPop);
    obj.label75:setAlign("top");
    obj.label75:setText("Estrutura");
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.healthPop);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(50);
    obj.layout60:setName("layout60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(60);
    obj.layout61:setMargins({right=5});
    obj.layout61:setName("layout61");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout61);
    obj.label76:setText("Base");
    obj.label76:setWidth(60);
    obj.label76:setHorzTextAlign("leading");
    obj.label76:setFontSize(11);
    obj.label76:setName("label76");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout61);
    obj.edit33:setTop(20);
    obj.edit33:setField("pvBase");
    obj.edit33:setWidth(60);
    obj.edit33:setHeight(25);
    obj.edit33:setName("edit33");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout60);
    obj.layout62:setAlign("left");
    obj.layout62:setWidth(60);
    obj.layout62:setMargins({right=5});
    obj.layout62:setName("layout62");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout62);
    obj.label77:setText("Adicional");
    obj.label77:setWidth(60);
    obj.label77:setHorzTextAlign("leading");
    obj.label77:setFontSize(9);
    obj.label77:setName("label77");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout62);
    obj.rectangle16:setTop(20);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setWidth(60);
    obj.rectangle16:setColor("#F0FFFF");
    obj.rectangle16:setStrokeColor("black");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle16);
    obj.label78:setAlign("client");
    obj.label78:setField("pvAdd");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("center");
    lfm_setPropAsString(obj.label78, "format",  "");
    lfm_setPropAsString(obj.label78, "formatFloat",  "");
    obj.label78:setName("label78");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout60);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(60);
    obj.layout63:setMargins({right=5});
    obj.layout63:setName("layout63");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout63);
    obj.label79:setText("Multiplicador");
    obj.label79:setWidth(60);
    obj.label79:setHorzTextAlign("leading");
    obj.label79:setFontSize(9);
    obj.label79:setName("label79");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout63);
    obj.rectangle17:setTop(20);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setWidth(60);
    obj.rectangle17:setColor("#F0FFFF");
    obj.rectangle17:setStrokeColor("black");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle17);
    obj.label80:setAlign("client");
    obj.label80:setField("pvMult");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setVertTextAlign("center");
    lfm_setPropAsString(obj.label80, "format",  "");
    lfm_setPropAsString(obj.label80, "formatFloat",  "");
    obj.label80:setName("label80");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout60);
    obj.layout64:setAlign("left");
    obj.layout64:setWidth(60);
    obj.layout64:setMargins({right=5});
    obj.layout64:setName("layout64");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout64);
    obj.label81:setText("Outros");
    obj.label81:setWidth(60);
    obj.label81:setHorzTextAlign("leading");
    obj.label81:setFontSize(11);
    obj.label81:setName("label81");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout64);
    obj.edit34:setTop(20);
    obj.edit34:setField("pvOutros");
    obj.edit34:setWidth(60);
    obj.edit34:setHeight(25);
    obj.edit34:setName("edit34");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout60);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(100);
    obj.layout65:setMargins({right=5});
    obj.layout65:setName("layout65");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout65);
    obj.label82:setText("Cobertura");
    obj.label82:setWidth(100);
    obj.label82:setHorzTextAlign("leading");
    obj.label82:setFontSize(13);
    obj.label82:setName("label82");

    obj.cobertura = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cobertura:setParent(obj.layout65);
    obj.cobertura:setTop(20);
    obj.cobertura:setField("cobertura");
    obj.cobertura:setName("cobertura");
    obj.cobertura:setWidth(100);
    obj.cobertura:setHeight(25);
    obj.cobertura:setItems({'Nenhuma', 'Parcial', 'Completa'});
    obj.cobertura:setValues({'25','50','75'});
    obj.cobertura:setFontSize(13);

    obj.popEquip = GUI.fromHandle(_obj_newObject("popup"));
    obj.popEquip:setParent(obj);
    obj.popEquip:setName("popEquip");
    obj.popEquip:setWidth(200);
    obj.popEquip:setHeight(250);
    obj.popEquip:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popEquip, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popEquip);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(90);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart1);
    obj.label83:setAlign("top");
    obj.label83:setFontSize(10);
    obj.label83:setText("NOME");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setWordWrap(true);
    obj.label83:setTextTrimming("none");
    obj.label83:setAutoSize(true);
    obj.label83:setHint("");
    obj.label83:setHitTest(true);
    obj.label83:setName("label83");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart1);
    obj.edit35:setAlign("client");
    obj.edit35:setField("nome");
    obj.edit35:setFontSize(12);
    obj.edit35:setName("edit35");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(90);
    obj.flowPart2:setMaxWidth(100);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart2);
    obj.label84:setAlign("top");
    obj.label84:setFontSize(10);
    obj.label84:setText("Nível");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setWordWrap(true);
    obj.label84:setTextTrimming("none");
    obj.label84:setAutoSize(true);
    obj.label84:setHint("");
    obj.label84:setHitTest(true);
    obj.label84:setName("label84");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart2);
    obj.edit36:setAlign("client");
    obj.edit36:setField("nivel");
    obj.edit36:setFontSize(12);
    obj.edit36:setName("edit36");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart3);
    obj.label85:setAlign("top");
    obj.label85:setFontSize(10);
    obj.label85:setText("Vol");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setWordWrap(true);
    obj.label85:setTextTrimming("none");
    obj.label85:setAutoSize(true);
    obj.label85:setHint("");
    obj.label85:setHitTest(true);
    obj.label85:setName("label85");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart3);
    obj.edit37:setAlign("client");
    obj.edit37:setField("peso");
    obj.edit37:setFontSize(12);
    obj.edit37:setName("edit37");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(90);
    obj.flowPart4:setMaxWidth(100);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart4);
    obj.label86:setAlign("top");
    obj.label86:setFontSize(10);
    obj.label86:setText("$");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setWordWrap(true);
    obj.label86:setTextTrimming("none");
    obj.label86:setAutoSize(true);
    obj.label86:setHint("");
    obj.label86:setHitTest(true);
    obj.label86:setName("label86");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart4);
    obj.edit38:setAlign("client");
    obj.edit38:setField("preco");
    obj.edit38:setFontSize(12);
    obj.edit38:setName("edit38");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popEquip);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.shipPartPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.shipPartPop:setParent(obj);
    obj.shipPartPop:setName("shipPartPop");
    obj.shipPartPop:setWidth(245);
    obj.shipPartPop:setHeight(135);
    obj.shipPartPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.shipPartPop, "autoScopeNode",  "false");
    obj.shipPartPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.shipPartPop);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(50);
    obj.layout66:setName("layout66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout66);
    obj.layout67:setAlign("left");
    obj.layout67:setWidth(75);
    obj.layout67:setMargins({right=5});
    obj.layout67:setName("layout67");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout67);
    obj.label87:setText("PF");
    obj.label87:setWidth(75);
    obj.label87:setHorzTextAlign("leading");
    obj.label87:setFontSize(13);
    obj.label87:setName("label87");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout67);
    obj.edit39:setTop(20);
    obj.edit39:setField("pf");
    obj.edit39:setWidth(75);
    obj.edit39:setHeight(25);
    obj.edit39:setName("edit39");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout66);
    obj.layout68:setAlign("left");
    obj.layout68:setWidth(75);
    obj.layout68:setMargins({right=5});
    obj.layout68:setName("layout68");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout68);
    obj.label88:setText("UNE");
    obj.label88:setWidth(75);
    obj.label88:setHorzTextAlign("leading");
    obj.label88:setFontSize(13);
    obj.label88:setName("label88");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout68);
    obj.edit40:setTop(20);
    obj.edit40:setField("une");
    obj.edit40:setWidth(75);
    obj.edit40:setHeight(25);
    obj.edit40:setName("edit40");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout66);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(75);
    obj.layout69:setMargins({right=5});
    obj.layout69:setName("layout69");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout69);
    obj.label89:setText("Blocos");
    obj.label89:setWidth(75);
    obj.label89:setHorzTextAlign("leading");
    obj.label89:setFontSize(13);
    obj.label89:setName("label89");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout69);
    obj.edit41:setTop(20);
    obj.edit41:setField("blocos");
    obj.edit41:setWidth(75);
    obj.edit41:setHeight(25);
    obj.edit41:setName("edit41");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.shipPartPop);
    obj.label90:setAlign("top");
    obj.label90:setText("Tripulação");
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.shipPartPop);
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(50);
    obj.layout70:setName("layout70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout70);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(75);
    obj.layout71:setMargins({right=5});
    obj.layout71:setName("layout71");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout71);
    obj.label91:setText("Mínima");
    obj.label91:setWidth(75);
    obj.label91:setHorzTextAlign("leading");
    obj.label91:setFontSize(13);
    obj.label91:setName("label91");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout71);
    obj.edit42:setTop(20);
    obj.edit42:setField("tripMin");
    obj.edit42:setWidth(75);
    obj.edit42:setHeight(25);
    obj.edit42:setName("edit42");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout70);
    obj.layout72:setAlign("left");
    obj.layout72:setWidth(75);
    obj.layout72:setMargins({right=5});
    obj.layout72:setName("layout72");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout72);
    obj.label92:setText("Máxima");
    obj.label92:setWidth(75);
    obj.label92:setHorzTextAlign("leading");
    obj.label92:setFontSize(13);
    obj.label92:setName("label92");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout72);
    obj.edit43:setTop(20);
    obj.edit43:setField("tripMax");
    obj.edit43:setWidth(75);
    obj.edit43:setHeight(25);
    obj.edit43:setName("edit43");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout70);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(75);
    obj.layout73:setMargins({right=5});
    obj.layout73:setName("layout73");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout73);
    obj.label93:setText("Tipo");
    obj.label93:setWidth(75);
    obj.label93:setHorzTextAlign("leading");
    obj.label93:setFontSize(13);
    obj.label93:setName("label93");

    obj.tripTipo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.tripTipo:setParent(obj.layout73);
    obj.tripTipo:setTop(20);
    obj.tripTipo:setField("tripTipo");
    obj.tripTipo:setName("tripTipo");
    obj.tripTipo:setWidth(75);
    obj.tripTipo:setHeight(25);
    obj.tripTipo:setItems({'Capitão','Artilheiro','Engenheiro','Oficial','Piloto','Médico','Outro'});
    obj.tripTipo:setValues({'1','2','3','4','5','6','7'});
    obj.tripTipo:setFontSize(13);

    obj.reactorPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.reactorPop:setParent(obj);
    obj.reactorPop:setName("reactorPop");
    obj.reactorPop:setWidth(245);
    obj.reactorPop:setHeight(135);
    obj.reactorPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.reactorPop, "autoScopeNode",  "false");
    obj.reactorPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.reactorPop);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(50);
    obj.layout74:setName("layout74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout74);
    obj.layout75:setAlign("left");
    obj.layout75:setWidth(75);
    obj.layout75:setMargins({right=5});
    obj.layout75:setName("layout75");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout75);
    obj.label94:setText("PF");
    obj.label94:setWidth(75);
    obj.label94:setHorzTextAlign("leading");
    obj.label94:setFontSize(13);
    obj.label94:setName("label94");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout75);
    obj.rectangle18:setTop(20);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setWidth(75);
    obj.rectangle18:setColor("#F0FFFF");
    obj.rectangle18:setStrokeColor("black");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle18);
    obj.label95:setAlign("client");
    obj.label95:setField("pf");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setVertTextAlign("center");
    lfm_setPropAsString(obj.label95, "format",  "");
    lfm_setPropAsString(obj.label95, "formatFloat",  "");
    obj.label95:setName("label95");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout74);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(75);
    obj.layout76:setMargins({right=5});
    obj.layout76:setName("layout76");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout76);
    obj.label96:setText("UNE");
    obj.label96:setWidth(75);
    obj.label96:setHorzTextAlign("leading");
    obj.label96:setFontSize(13);
    obj.label96:setName("label96");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout76);
    obj.rectangle19:setTop(20);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setWidth(75);
    obj.rectangle19:setColor("#F0FFFF");
    obj.rectangle19:setStrokeColor("black");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle19);
    obj.label97:setAlign("client");
    obj.label97:setField("une");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setVertTextAlign("center");
    lfm_setPropAsString(obj.label97, "format",  "");
    lfm_setPropAsString(obj.label97, "formatFloat",  "");
    obj.label97:setName("label97");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout74);
    obj.layout77:setAlign("left");
    obj.layout77:setWidth(75);
    obj.layout77:setMargins({right=5});
    obj.layout77:setName("layout77");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout77);
    obj.label98:setText("Blocos");
    obj.label98:setWidth(75);
    obj.label98:setHorzTextAlign("leading");
    obj.label98:setFontSize(13);
    obj.label98:setName("label98");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout77);
    obj.rectangle20:setTop(20);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setWidth(75);
    obj.rectangle20:setColor("#F0FFFF");
    obj.rectangle20:setStrokeColor("black");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle20);
    obj.label99:setAlign("client");
    obj.label99:setField("blocos");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setVertTextAlign("center");
    lfm_setPropAsString(obj.label99, "format",  "");
    lfm_setPropAsString(obj.label99, "formatFloat",  ",0");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.reactorPop);
    obj.label100:setAlign("top");
    obj.label100:setText("Tripulação");
    obj.label100:setHeight(25);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.reactorPop);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(50);
    obj.layout78:setName("layout78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout78);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(75);
    obj.layout79:setMargins({right=5});
    obj.layout79:setName("layout79");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout79);
    obj.label101:setText("Mínima");
    obj.label101:setWidth(75);
    obj.label101:setHorzTextAlign("leading");
    obj.label101:setFontSize(13);
    obj.label101:setName("label101");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout79);
    obj.rectangle21:setTop(20);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setWidth(75);
    obj.rectangle21:setColor("#F0FFFF");
    obj.rectangle21:setStrokeColor("black");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.rectangle21);
    obj.label102:setAlign("client");
    obj.label102:setField("tripMin");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setVertTextAlign("center");
    lfm_setPropAsString(obj.label102, "format",  "");
    lfm_setPropAsString(obj.label102, "formatFloat",  "");
    obj.label102:setName("label102");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout78);
    obj.layout80:setAlign("left");
    obj.layout80:setWidth(75);
    obj.layout80:setMargins({right=5});
    obj.layout80:setName("layout80");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout80);
    obj.label103:setText("Máxima");
    obj.label103:setWidth(75);
    obj.label103:setHorzTextAlign("leading");
    obj.label103:setFontSize(13);
    obj.label103:setName("label103");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout80);
    obj.rectangle22:setTop(20);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setWidth(75);
    obj.rectangle22:setColor("#F0FFFF");
    obj.rectangle22:setStrokeColor("black");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.rectangle22);
    obj.label104:setAlign("client");
    obj.label104:setField("tripMax");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setVertTextAlign("center");
    lfm_setPropAsString(obj.label104, "format",  "");
    lfm_setPropAsString(obj.label104, "formatFloat",  "");
    obj.label104:setName("label104");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout78);
    obj.layout81:setAlign("left");
    obj.layout81:setWidth(75);
    obj.layout81:setMargins({right=5});
    obj.layout81:setName("layout81");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout81);
    obj.label105:setText("Tipo");
    obj.label105:setWidth(75);
    obj.label105:setHorzTextAlign("leading");
    obj.label105:setFontSize(13);
    obj.label105:setName("label105");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout81);
    obj.rectangle23:setTop(20);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setWidth(75);
    obj.rectangle23:setColor("#F0FFFF");
    obj.rectangle23:setStrokeColor("black");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.rectangle23);
    obj.label106:setAlign("client");
    obj.label106:setField("tripTipo");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setVertTextAlign("center");
    lfm_setPropAsString(obj.label106, "format",  "");
    lfm_setPropAsString(obj.label106, "formatFloat",  "");
    obj.label106:setName("label106");

    obj.weaponPop = GUI.fromHandle(_obj_newObject("popup"));
    obj.weaponPop:setParent(obj);
    obj.weaponPop:setName("weaponPop");
    obj.weaponPop:setWidth(245);
    obj.weaponPop:setHeight(235);
    obj.weaponPop:setBackOpacity(0.4);
    lfm_setPropAsString(obj.weaponPop, "autoScopeNode",  "false");
    obj.weaponPop:setPadding({left=5,right=0,top=5,bottom=5});

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.weaponPop);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(50);
    obj.layout82:setName("layout82");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout82);
    obj.layout83:setAlign("left");
    obj.layout83:setWidth(75);
    obj.layout83:setMargins({right=5});
    obj.layout83:setName("layout83");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout83);
    obj.label107:setText("PF");
    obj.label107:setWidth(75);
    obj.label107:setHorzTextAlign("leading");
    obj.label107:setFontSize(13);
    obj.label107:setName("label107");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout83);
    obj.edit44:setTop(20);
    obj.edit44:setField("pf");
    obj.edit44:setWidth(75);
    obj.edit44:setHeight(25);
    obj.edit44:setName("edit44");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout82);
    obj.layout84:setAlign("left");
    obj.layout84:setWidth(75);
    obj.layout84:setMargins({right=5});
    obj.layout84:setName("layout84");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout84);
    obj.label108:setText("UNE");
    obj.label108:setWidth(75);
    obj.label108:setHorzTextAlign("leading");
    obj.label108:setFontSize(13);
    obj.label108:setName("label108");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout84);
    obj.edit45:setTop(20);
    obj.edit45:setField("une");
    obj.edit45:setWidth(75);
    obj.edit45:setHeight(25);
    obj.edit45:setName("edit45");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout82);
    obj.layout85:setAlign("left");
    obj.layout85:setWidth(75);
    obj.layout85:setMargins({right=5});
    obj.layout85:setName("layout85");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout85);
    obj.label109:setText("Blocos");
    obj.label109:setWidth(75);
    obj.label109:setHorzTextAlign("leading");
    obj.label109:setFontSize(13);
    obj.label109:setName("label109");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout85);
    obj.edit46:setTop(20);
    obj.edit46:setField("blocos");
    obj.edit46:setWidth(75);
    obj.edit46:setHeight(25);
    obj.edit46:setName("edit46");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.weaponPop);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(50);
    obj.layout86:setName("layout86");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setAlign("left");
    obj.layout87:setWidth(75);
    obj.layout87:setMargins({right=5});
    obj.layout87:setName("layout87");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout87);
    obj.label110:setText("Dano");
    obj.label110:setWidth(75);
    obj.label110:setHorzTextAlign("leading");
    obj.label110:setFontSize(13);
    obj.label110:setName("label110");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout87);
    obj.edit47:setTop(20);
    obj.edit47:setField("dano");
    obj.edit47:setWidth(75);
    obj.edit47:setHeight(25);
    obj.edit47:setName("edit47");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout86);
    obj.layout88:setAlign("left");
    obj.layout88:setWidth(75);
    obj.layout88:setMargins({right=5});
    obj.layout88:setName("layout88");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout88);
    obj.label111:setText("Tipo");
    obj.label111:setWidth(75);
    obj.label111:setHorzTextAlign("leading");
    obj.label111:setFontSize(13);
    obj.label111:setName("label111");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout88);
    obj.edit48:setTop(20);
    obj.edit48:setField("tipo");
    obj.edit48:setWidth(75);
    obj.edit48:setHeight(25);
    obj.edit48:setName("edit48");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout86);
    obj.layout89:setAlign("left");
    obj.layout89:setWidth(75);
    obj.layout89:setMargins({right=5});
    obj.layout89:setName("layout89");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout89);
    obj.label112:setText("Tamanho");
    obj.label112:setWidth(75);
    obj.label112:setHorzTextAlign("leading");
    obj.label112:setFontSize(13);
    obj.label112:setName("label112");

    obj.categoria = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.categoria:setParent(obj.layout89);
    obj.categoria:setTop(20);
    obj.categoria:setField("categoria");
    obj.categoria:setName("categoria");
    obj.categoria:setWidth(75);
    obj.categoria:setHeight(25);
    obj.categoria:setItems({'Pessoal','Leve','Pesada','Capital'});
    obj.categoria:setValues({'0','1','2','3'});
    obj.categoria:setFontSize(13);

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.weaponPop);
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(50);
    obj.layout90:setName("layout90");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout90);
    obj.layout91:setAlign("left");
    obj.layout91:setWidth(75);
    obj.layout91:setMargins({right=5});
    obj.layout91:setName("layout91");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout91);
    obj.label113:setText("Alcance");
    obj.label113:setWidth(75);
    obj.label113:setHorzTextAlign("leading");
    obj.label113:setFontSize(13);
    obj.label113:setName("label113");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout91);
    obj.edit49:setTop(20);
    obj.edit49:setField("alcance");
    obj.edit49:setWidth(75);
    obj.edit49:setHeight(25);
    obj.edit49:setName("edit49");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout90);
    obj.layout92:setAlign("left");
    obj.layout92:setWidth(75);
    obj.layout92:setMargins({right=5});
    obj.layout92:setName("layout92");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout92);
    obj.label114:setText("Velocidade");
    obj.label114:setWidth(75);
    obj.label114:setHorzTextAlign("leading");
    obj.label114:setFontSize(13);
    obj.label114:setName("label114");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout92);
    obj.edit50:setTop(20);
    obj.edit50:setField("velocidade");
    obj.edit50:setWidth(75);
    obj.edit50:setHeight(25);
    obj.edit50:setName("edit50");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout90);
    obj.layout93:setAlign("left");
    obj.layout93:setWidth(75);
    obj.layout93:setMargins({right=5});
    obj.layout93:setName("layout93");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout93);
    obj.label115:setText("Especial");
    obj.label115:setWidth(75);
    obj.label115:setHorzTextAlign("leading");
    obj.label115:setFontSize(13);
    obj.label115:setName("label115");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout93);
    obj.edit51:setTop(20);
    obj.edit51:setField("especial");
    obj.edit51:setWidth(75);
    obj.edit51:setHeight(25);
    obj.edit51:setName("edit51");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.weaponPop);
    obj.label116:setAlign("top");
    obj.label116:setText("Tripulação");
    obj.label116:setHeight(25);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.weaponPop);
    obj.layout94:setAlign("top");
    obj.layout94:setHeight(50);
    obj.layout94:setName("layout94");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout94);
    obj.layout95:setAlign("left");
    obj.layout95:setWidth(75);
    obj.layout95:setMargins({right=5});
    obj.layout95:setName("layout95");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout95);
    obj.label117:setText("Mínima");
    obj.label117:setWidth(75);
    obj.label117:setHorzTextAlign("leading");
    obj.label117:setFontSize(13);
    obj.label117:setName("label117");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout95);
    obj.edit52:setTop(20);
    obj.edit52:setField("tripMin");
    obj.edit52:setWidth(75);
    obj.edit52:setHeight(25);
    obj.edit52:setName("edit52");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout94);
    obj.layout96:setAlign("left");
    obj.layout96:setWidth(75);
    obj.layout96:setMargins({right=5});
    obj.layout96:setName("layout96");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout96);
    obj.label118:setText("Máxima");
    obj.label118:setWidth(75);
    obj.label118:setHorzTextAlign("leading");
    obj.label118:setFontSize(13);
    obj.label118:setName("label118");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout96);
    obj.edit53:setTop(20);
    obj.edit53:setField("tripMax");
    obj.edit53:setWidth(75);
    obj.edit53:setHeight(25);
    obj.edit53:setName("edit53");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout94);
    obj.layout97:setAlign("left");
    obj.layout97:setWidth(75);
    obj.layout97:setMargins({right=5});
    obj.layout97:setName("layout97");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout97);
    obj.label119:setText("Tipo");
    obj.label119:setWidth(75);
    obj.label119:setHorzTextAlign("leading");
    obj.label119:setFontSize(13);
    obj.label119:setName("label119");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout97);
    obj.rectangle24:setTop(20);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setWidth(75);
    obj.rectangle24:setColor("#F0FFFF");
    obj.rectangle24:setStrokeColor("black");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle24);
    obj.label120:setAlign("client");
    obj.label120:setField("tripTipo");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setVertTextAlign("center");
    lfm_setPropAsString(obj.label120, "format",  "");
    lfm_setPropAsString(obj.label120, "formatFloat",  "");
    obj.label120:setName("label120");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmNaveGeneral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmNaveGeneral:setParent(obj.tab1);
    obj.frmNaveGeneral:setName("frmNaveGeneral");
    obj.frmNaveGeneral:setAlign("client");
    obj.frmNaveGeneral:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmNaveGeneral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.scrollBox1);
    obj.layout98:setHeight(610);
    obj.layout98:setName("layout98");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.scrollBox1);
    obj.layout99:setAlign("left");
    obj.layout99:setWidth(765);
    obj.layout99:setMargins({bottom=5});
    obj.layout99:setName("layout99");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout99);
    obj.layout100:setAlign("top");
    obj.layout100:setHeight(200);
    obj.layout100:setMargins({bottom=5});
    obj.layout100:setName("layout100");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout100);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(200);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setMargins({right=5});
    obj.rectangle25:setName("rectangle25");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle25);
    obj.image1:setAlign("client");
    obj.image1:setField("avatarComp");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout100);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(210);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setMargins({right=5});
    obj.rectangle26:setName("rectangle26");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle26);
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(50);
    obj.layout101:setName("layout101");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout101);
    obj.layout102:setAlign("left");
    obj.layout102:setWidth(5);
    obj.layout102:setName("layout102");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout101);
    obj.layout103:setAlign("left");
    obj.layout103:setWidth(95);
    obj.layout103:setMargins({right=5});
    obj.layout103:setName("layout103");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout103);
    obj.label121:setText("Nome");
    obj.label121:setWidth(95);
    obj.label121:setHorzTextAlign("leading");
    obj.label121:setFontSize(13);
    obj.label121:setName("label121");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout103);
    obj.edit54:setTop(20);
    obj.edit54:setField("nome");
    obj.edit54:setWidth(95);
    obj.edit54:setHeight(25);
    obj.edit54:setName("edit54");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout101);
    obj.layout104:setAlign("left");
    obj.layout104:setWidth(95);
    obj.layout104:setMargins({right=5});
    obj.layout104:setName("layout104");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout104);
    obj.label122:setText("Modelo");
    obj.label122:setWidth(95);
    obj.label122:setHorzTextAlign("leading");
    obj.label122:setFontSize(13);
    obj.label122:setName("label122");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout104);
    obj.edit55:setTop(20);
    obj.edit55:setField("modelo");
    obj.edit55:setWidth(95);
    obj.edit55:setHeight(25);
    obj.edit55:setName("edit55");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle26);
    obj.layout105:setAlign("top");
    obj.layout105:setHeight(50);
    obj.layout105:setName("layout105");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setAlign("left");
    obj.layout106:setWidth(5);
    obj.layout106:setName("layout106");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout105);
    obj.layout107:setAlign("left");
    obj.layout107:setWidth(95);
    obj.layout107:setMargins({right=5});
    obj.layout107:setName("layout107");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout107);
    obj.label123:setText("Ranque");
    obj.label123:setWidth(95);
    obj.label123:setHorzTextAlign("leading");
    obj.label123:setFontSize(13);
    obj.label123:setName("label123");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout107);
    obj.edit56:setTop(20);
    obj.edit56:setField("ranque");
    obj.edit56:setWidth(95);
    obj.edit56:setHeight(25);
    obj.edit56:setName("edit56");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout105);
    obj.layout108:setAlign("left");
    obj.layout108:setWidth(95);
    obj.layout108:setMargins({right=5});
    obj.layout108:setName("layout108");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout108);
    obj.label124:setText("Class. Deriva");
    obj.label124:setWidth(95);
    obj.label124:setHorzTextAlign("leading");
    obj.label124:setFontSize(13);
    obj.label124:setName("label124");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout108);
    obj.rectangle27:setTop(20);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setWidth(95);
    obj.rectangle27:setColor("#F0FFFF");
    obj.rectangle27:setStrokeColor("black");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle27);
    obj.label125:setAlign("client");
    obj.label125:setField("deriva_class");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setVertTextAlign("center");
    lfm_setPropAsString(obj.label125, "format",  "");
    lfm_setPropAsString(obj.label125, "formatFloat",  "");
    obj.label125:setName("label125");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle26);
    obj.layout109:setAlign("top");
    obj.layout109:setHeight(50);
    obj.layout109:setName("layout109");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout109);
    obj.layout110:setAlign("left");
    obj.layout110:setWidth(5);
    obj.layout110:setName("layout110");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout109);
    obj.layout111:setAlign("left");
    obj.layout111:setWidth(145);
    obj.layout111:setMargins({right=5});
    obj.layout111:setName("layout111");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout111);
    obj.label126:setText("Manobra");
    obj.label126:setWidth(145);
    obj.label126:setHorzTextAlign("leading");
    obj.label126:setFontSize(13);
    obj.label126:setName("label126");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout111);
    obj.rectangle28:setTop(20);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setWidth(145);
    obj.rectangle28:setColor("#F0FFFF");
    obj.rectangle28:setStrokeColor("black");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle28);
    obj.label127:setAlign("client");
    obj.label127:setField("manobra");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setVertTextAlign("center");
    lfm_setPropAsString(obj.label127, "format",  "");
    lfm_setPropAsString(obj.label127, "formatFloat",  "");
    obj.label127:setName("label127");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout109);
    obj.layout112:setAlign("left");
    obj.layout112:setWidth(45);
    obj.layout112:setMargins({right=5});
    obj.layout112:setName("layout112");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout112);
    obj.label128:setText("Velocidade");
    obj.label128:setWidth(45);
    obj.label128:setHorzTextAlign("leading");
    obj.label128:setFontSize(9);
    obj.label128:setName("label128");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout112);
    obj.rectangle29:setTop(20);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setWidth(45);
    obj.rectangle29:setColor("#F0FFFF");
    obj.rectangle29:setStrokeColor("black");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle29);
    obj.label129:setAlign("client");
    obj.label129:setField("velocidade");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setVertTextAlign("center");
    lfm_setPropAsString(obj.label129, "format",  "");
    lfm_setPropAsString(obj.label129, "formatFloat",  "");
    obj.label129:setName("label129");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle26);
    obj.layout113:setAlign("top");
    obj.layout113:setHeight(50);
    obj.layout113:setName("layout113");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout113);
    obj.layout114:setAlign("left");
    obj.layout114:setWidth(5);
    obj.layout114:setName("layout114");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout113);
    obj.layout115:setAlign("left");
    obj.layout115:setWidth(95);
    obj.layout115:setMargins({right=5});
    obj.layout115:setName("layout115");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout115);
    obj.label130:setText("Tamanho");
    obj.label130:setWidth(95);
    obj.label130:setHorzTextAlign("leading");
    obj.label130:setFontSize(13);
    obj.label130:setName("label130");

    obj.tamanho = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.tamanho:setParent(obj.layout115);
    obj.tamanho:setTop(20);
    obj.tamanho:setField("tamanho");
    obj.tamanho:setName("tamanho");
    obj.tamanho:setWidth(95);
    obj.tamanho:setHeight(25);
    obj.tamanho:setItems({'Minúsculo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso', 'Colossal'});
    obj.tamanho:setValues({'1','2','3','4','5','6','7'});
    obj.tamanho:setFontSize(13);

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout113);
    obj.layout116:setAlign("left");
    obj.layout116:setWidth(95);
    obj.layout116:setMargins({right=5});
    obj.layout116:setName("layout116");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout116);
    obj.label131:setText("Plataforma");
    obj.label131:setWidth(95);
    obj.label131:setHorzTextAlign("leading");
    obj.label131:setFontSize(13);
    obj.label131:setName("label131");

    obj.plataforma = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.plataforma:setParent(obj.layout116);
    obj.plataforma:setTop(20);
    obj.plataforma:setField("plataforma");
    obj.plataforma:setName("plataforma");
    obj.plataforma:setWidth(95);
    obj.plataforma:setHeight(25);
    obj.plataforma:setItems({});
    obj.plataforma:setValues({});
    obj.plataforma:setFontSize(13);

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout100);
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(340);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setMargins({right=5});
    obj.rectangle30:setName("rectangle30");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle30);
    obj.layout117:setAlign("top");
    obj.layout117:setHeight(50);
    obj.layout117:setName("layout117");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout117);
    obj.layout118:setAlign("left");
    obj.layout118:setWidth(5);
    obj.layout118:setName("layout118");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout117);
    obj.layout119:setAlign("left");
    obj.layout119:setWidth(60);
    obj.layout119:setMargins({right=5});
    obj.layout119:setName("layout119");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout119);
    obj.label132:setText("CA");
    obj.label132:setWidth(60);
    obj.label132:setHorzTextAlign("leading");
    obj.label132:setFontSize(13);
    obj.label132:setName("label132");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout119);
    obj.rectangle31:setTop(20);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setWidth(60);
    obj.rectangle31:setColor("#F0FFFF");
    obj.rectangle31:setStrokeColor("black");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle31);
    obj.label133:setAlign("client");
    obj.label133:setField("ca");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setVertTextAlign("center");
    lfm_setPropAsString(obj.label133, "format",  "");
    lfm_setPropAsString(obj.label133, "formatFloat",  "");
    obj.label133:setName("label133");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout117);
    obj.layout120:setAlign("left");
    obj.layout120:setWidth(60);
    obj.layout120:setMargins({right=5});
    obj.layout120:setName("layout120");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout120);
    obj.label134:setText("Piloto");
    obj.label134:setWidth(60);
    obj.label134:setHorzTextAlign("leading");
    obj.label134:setFontSize(13);
    obj.label134:setName("label134");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout120);
    obj.edit57:setTop(20);
    obj.edit57:setField("ca_piloto");
    obj.edit57:setWidth(60);
    obj.edit57:setHeight(25);
    obj.edit57:setName("edit57");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout117);
    obj.layout121:setAlign("left");
    obj.layout121:setWidth(60);
    obj.layout121:setMargins({right=5});
    obj.layout121:setName("layout121");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout121);
    obj.label135:setText("Armadura");
    obj.label135:setWidth(60);
    obj.label135:setHorzTextAlign("leading");
    obj.label135:setFontSize(13);
    obj.label135:setName("label135");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout121);
    obj.rectangle32:setTop(20);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setWidth(60);
    obj.rectangle32:setColor("#F0FFFF");
    obj.rectangle32:setStrokeColor("black");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.rectangle32);
    obj.label136:setAlign("client");
    obj.label136:setField("ca_armadura");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setVertTextAlign("center");
    lfm_setPropAsString(obj.label136, "format",  "");
    lfm_setPropAsString(obj.label136, "formatFloat",  "");
    obj.label136:setName("label136");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout117);
    obj.layout122:setAlign("left");
    obj.layout122:setWidth(60);
    obj.layout122:setMargins({right=5});
    obj.layout122:setName("layout122");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout122);
    obj.label137:setText("Tamanho");
    obj.label137:setWidth(60);
    obj.label137:setHorzTextAlign("leading");
    obj.label137:setFontSize(13);
    obj.label137:setName("label137");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout122);
    obj.rectangle33:setTop(20);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setWidth(60);
    obj.rectangle33:setColor("#F0FFFF");
    obj.rectangle33:setStrokeColor("black");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.rectangle33);
    obj.label138:setAlign("client");
    obj.label138:setField("ca_tamanho");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setVertTextAlign("center");
    lfm_setPropAsString(obj.label138, "format",  "");
    lfm_setPropAsString(obj.label138, "formatFloat",  "");
    obj.label138:setName("label138");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout117);
    obj.layout123:setAlign("left");
    obj.layout123:setWidth(60);
    obj.layout123:setMargins({right=5});
    obj.layout123:setName("layout123");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout123);
    obj.label139:setText("Outros");
    obj.label139:setWidth(60);
    obj.label139:setHorzTextAlign("leading");
    obj.label139:setFontSize(13);
    obj.label139:setName("label139");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout123);
    obj.edit58:setTop(20);
    obj.edit58:setField("ca_outros");
    obj.edit58:setWidth(60);
    obj.edit58:setHeight(25);
    obj.edit58:setName("edit58");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle30);
    obj.layout124:setAlign("top");
    obj.layout124:setHeight(50);
    obj.layout124:setName("layout124");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout124);
    obj.layout125:setAlign("left");
    obj.layout125:setWidth(5);
    obj.layout125:setName("layout125");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout124);
    obj.layout126:setAlign("left");
    obj.layout126:setWidth(60);
    obj.layout126:setMargins({right=5});
    obj.layout126:setName("layout126");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout126);
    obj.label140:setText("TM");
    obj.label140:setWidth(60);
    obj.label140:setHorzTextAlign("leading");
    obj.label140:setFontSize(13);
    obj.label140:setName("label140");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout126);
    obj.rectangle34:setTop(20);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setWidth(60);
    obj.rectangle34:setColor("#F0FFFF");
    obj.rectangle34:setStrokeColor("black");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.rectangle34);
    obj.label141:setAlign("client");
    obj.label141:setField("tm");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setVertTextAlign("center");
    lfm_setPropAsString(obj.label141, "format",  "");
    lfm_setPropAsString(obj.label141, "formatFloat",  "");
    obj.label141:setName("label141");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout124);
    obj.layout127:setAlign("left");
    obj.layout127:setWidth(60);
    obj.layout127:setMargins({right=5});
    obj.layout127:setName("layout127");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout127);
    obj.label142:setText("Piloto");
    obj.label142:setWidth(60);
    obj.label142:setHorzTextAlign("leading");
    obj.label142:setFontSize(13);
    obj.label142:setName("label142");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout127);
    obj.edit59:setTop(20);
    obj.edit59:setField("ca_piloto");
    obj.edit59:setWidth(60);
    obj.edit59:setHeight(25);
    obj.edit59:setName("edit59");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout124);
    obj.layout128:setAlign("left");
    obj.layout128:setWidth(60);
    obj.layout128:setMargins({right=5});
    obj.layout128:setName("layout128");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout128);
    obj.label143:setText("Contramedidas");
    obj.label143:setWidth(60);
    obj.label143:setHorzTextAlign("leading");
    obj.label143:setFontSize(8);
    obj.label143:setName("label143");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout128);
    obj.rectangle35:setTop(20);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setWidth(60);
    obj.rectangle35:setColor("#F0FFFF");
    obj.rectangle35:setStrokeColor("black");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.rectangle35);
    obj.label144:setAlign("client");
    obj.label144:setField("tm_contramedidas");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setVertTextAlign("center");
    lfm_setPropAsString(obj.label144, "format",  "");
    lfm_setPropAsString(obj.label144, "formatFloat",  "");
    obj.label144:setName("label144");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout124);
    obj.layout129:setAlign("left");
    obj.layout129:setWidth(60);
    obj.layout129:setMargins({right=5});
    obj.layout129:setName("layout129");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout129);
    obj.label145:setText("Tamanho");
    obj.label145:setWidth(60);
    obj.label145:setHorzTextAlign("leading");
    obj.label145:setFontSize(13);
    obj.label145:setName("label145");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout129);
    obj.rectangle36:setTop(20);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setWidth(60);
    obj.rectangle36:setColor("#F0FFFF");
    obj.rectangle36:setStrokeColor("black");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.rectangle36);
    obj.label146:setAlign("client");
    obj.label146:setField("ca_tamanho");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setVertTextAlign("center");
    lfm_setPropAsString(obj.label146, "format",  "");
    lfm_setPropAsString(obj.label146, "formatFloat",  "");
    obj.label146:setName("label146");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout124);
    obj.layout130:setAlign("left");
    obj.layout130:setWidth(60);
    obj.layout130:setMargins({right=5});
    obj.layout130:setName("layout130");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout130);
    obj.label147:setText("Outros");
    obj.label147:setWidth(60);
    obj.label147:setHorzTextAlign("leading");
    obj.label147:setFontSize(13);
    obj.label147:setName("label147");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout130);
    obj.edit60:setTop(20);
    obj.edit60:setField("tm_outros");
    obj.edit60:setWidth(60);
    obj.edit60:setHeight(25);
    obj.edit60:setName("edit60");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle30);
    obj.layout131:setAlign("top");
    obj.layout131:setHeight(50);
    obj.layout131:setName("layout131");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout131);
    obj.layout132:setAlign("left");
    obj.layout132:setWidth(5);
    obj.layout132:setName("layout132");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout131);
    obj.layout133:setAlign("left");
    obj.layout133:setWidth(60);
    obj.layout133:setMargins({right=5});
    obj.layout133:setName("layout133");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout133);
    obj.label148:setText("Casco");
    obj.label148:setWidth(60);
    obj.label148:setHorzTextAlign("leading");
    obj.label148:setFontSize(13);
    obj.label148:setName("label148");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout133);
    obj.rectangle37:setTop(20);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setWidth(60);
    obj.rectangle37:setColor("#F0FFFF");
    obj.rectangle37:setStrokeColor("black");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.rectangle37);
    obj.label149:setAlign("client");
    obj.label149:setField("casco");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setVertTextAlign("center");
    lfm_setPropAsString(obj.label149, "format",  "");
    lfm_setPropAsString(obj.label149, "formatFloat",  "");
    obj.label149:setName("label149");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout131);
    obj.layout134:setAlign("left");
    obj.layout134:setWidth(60);
    obj.layout134:setMargins({right=5});
    obj.layout134:setName("layout134");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout134);
    obj.label150:setText("LD");
    obj.label150:setWidth(60);
    obj.label150:setHorzTextAlign("leading");
    obj.label150:setFontSize(13);
    obj.label150:setName("label150");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout134);
    obj.rectangle38:setTop(20);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setWidth(60);
    obj.rectangle38:setColor("#F0FFFF");
    obj.rectangle38:setStrokeColor("black");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.rectangle38);
    obj.label151:setAlign("client");
    obj.label151:setField("casco_ld");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setVertTextAlign("center");
    lfm_setPropAsString(obj.label151, "format",  "");
    lfm_setPropAsString(obj.label151, "formatFloat",  "");
    obj.label151:setName("label151");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout131);
    obj.layout135:setAlign("left");
    obj.layout135:setWidth(60);
    obj.layout135:setMargins({right=5});
    obj.layout135:setName("layout135");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout135);
    obj.label152:setText("LC");
    obj.label152:setWidth(60);
    obj.label152:setHorzTextAlign("leading");
    obj.label152:setFontSize(13);
    obj.label152:setName("label152");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout135);
    obj.rectangle39:setTop(20);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setWidth(60);
    obj.rectangle39:setColor("#F0FFFF");
    obj.rectangle39:setStrokeColor("black");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.rectangle39);
    obj.label153:setAlign("client");
    obj.label153:setField("casco_lc");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setVertTextAlign("center");
    lfm_setPropAsString(obj.label153, "format",  "");
    lfm_setPropAsString(obj.label153, "formatFloat",  "");
    obj.label153:setName("label153");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle30);
    obj.layout136:setAlign("top");
    obj.layout136:setHeight(50);
    obj.layout136:setName("layout136");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout136);
    obj.layout137:setAlign("left");
    obj.layout137:setWidth(5);
    obj.layout137:setName("layout137");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout136);
    obj.layout138:setAlign("left");
    obj.layout138:setWidth(60);
    obj.layout138:setMargins({right=5});
    obj.layout138:setName("layout138");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout138);
    obj.label154:setText("Escudo");
    obj.label154:setWidth(60);
    obj.label154:setHorzTextAlign("leading");
    obj.label154:setFontSize(13);
    obj.label154:setName("label154");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout138);
    obj.rectangle40:setTop(20);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setWidth(60);
    obj.rectangle40:setColor("#F0FFFF");
    obj.rectangle40:setStrokeColor("black");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.rectangle40);
    obj.label155:setAlign("client");
    obj.label155:setField("escudo_total");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setVertTextAlign("center");
    lfm_setPropAsString(obj.label155, "format",  "");
    lfm_setPropAsString(obj.label155, "formatFloat",  "");
    obj.label155:setName("label155");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout136);
    obj.layout139:setAlign("left");
    obj.layout139:setWidth(60);
    obj.layout139:setMargins({right=5});
    obj.layout139:setName("layout139");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout139);
    obj.label156:setText("Proa");
    obj.label156:setWidth(60);
    obj.label156:setHorzTextAlign("leading");
    obj.label156:setFontSize(13);
    obj.label156:setName("label156");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout139);
    obj.edit61:setTop(20);
    obj.edit61:setField("escudo_proa");
    obj.edit61:setWidth(60);
    obj.edit61:setHeight(25);
    obj.edit61:setName("edit61");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout136);
    obj.layout140:setAlign("left");
    obj.layout140:setWidth(60);
    obj.layout140:setMargins({right=5});
    obj.layout140:setName("layout140");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout140);
    obj.label157:setText("Popa");
    obj.label157:setWidth(60);
    obj.label157:setHorzTextAlign("leading");
    obj.label157:setFontSize(13);
    obj.label157:setName("label157");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout140);
    obj.edit62:setTop(20);
    obj.edit62:setField("escudo_popa");
    obj.edit62:setWidth(60);
    obj.edit62:setHeight(25);
    obj.edit62:setName("edit62");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.layout136);
    obj.layout141:setAlign("left");
    obj.layout141:setWidth(60);
    obj.layout141:setMargins({right=5});
    obj.layout141:setName("layout141");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout141);
    obj.label158:setText("Bombordo");
    obj.label158:setWidth(60);
    obj.label158:setHorzTextAlign("leading");
    obj.label158:setFontSize(11);
    obj.label158:setName("label158");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout141);
    obj.edit63:setTop(20);
    obj.edit63:setField("escudo_bombordo");
    obj.edit63:setWidth(60);
    obj.edit63:setHeight(25);
    obj.edit63:setName("edit63");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout136);
    obj.layout142:setAlign("left");
    obj.layout142:setWidth(60);
    obj.layout142:setMargins({right=5});
    obj.layout142:setName("layout142");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout142);
    obj.label159:setText("Estibordo");
    obj.label159:setWidth(60);
    obj.label159:setHorzTextAlign("leading");
    obj.label159:setFontSize(11);
    obj.label159:setName("label159");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout142);
    obj.edit64:setTop(20);
    obj.edit64:setField("escudo_estibordo");
    obj.edit64:setWidth(60);
    obj.edit64:setHeight(25);
    obj.edit64:setName("edit64");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout99);
    obj.layout143:setAlign("top");
    obj.layout143:setHeight(200);
    obj.layout143:setMargins({bottom=5});
    obj.layout143:setName("layout143");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout143);
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setWidth(380);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setMargins({right=5});
    obj.rectangle41:setPadding({top=5,bottom=5});
    obj.rectangle41:setName("rectangle41");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle41);
    obj.layout144:setAlign("top");
    obj.layout144:setHeight(20);
    obj.layout144:setName("layout144");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout144);
    obj.button1:setAlign("left");
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("+");
    obj.button1:setMargins({left=5});
    obj.button1:setName("button1");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout144);
    obj.label160:setAlign("left");
    obj.label160:setText("Núcleos de Energia");
    obj.label160:setWidth(200);
    obj.label160:setMargins({left=5});
    obj.label160:setName("label160");

    obj.rclReatores = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclReatores:setParent(obj.rectangle41);
    obj.rclReatores:setName("rclReatores");
    obj.rclReatores:setField("listaReatores");
    obj.rclReatores:setTemplateForm("frmReactorPart");
    obj.rclReatores:setAlign("client");
    obj.rclReatores:setWidth(465);
    obj.rclReatores:setMargins({left=5,right=5});
    obj.rclReatores:setLayout("vertical");
    obj.rclReatores:setMinQt(1);

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout143);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(375);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setMargins({right=5});
    obj.rectangle42:setPadding({top=5,bottom=5});
    obj.rectangle42:setName("rectangle42");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle42);
    obj.layout145:setAlign("top");
    obj.layout145:setHeight(20);
    obj.layout145:setName("layout145");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout145);
    obj.button2:setAlign("left");
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("+");
    obj.button2:setMargins({left=5});
    obj.button2:setName("button2");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout145);
    obj.label161:setAlign("left");
    obj.label161:setText("Compatimentos de Expansão");
    obj.label161:setWidth(200);
    obj.label161:setMargins({left=5});
    obj.label161:setName("label161");

    obj.rclExpansao = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclExpansao:setParent(obj.rectangle42);
    obj.rclExpansao:setName("rclExpansao");
    obj.rclExpansao:setField("listaExpansao");
    obj.rclExpansao:setTemplateForm("frmShipPart");
    obj.rclExpansao:setAlign("client");
    obj.rclExpansao:setWidth(465);
    obj.rclExpansao:setMargins({left=5,right=5});
    obj.rclExpansao:setLayout("vertical");
    obj.rclExpansao:setMinQt(1);

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout99);
    obj.layout146:setAlign("top");
    obj.layout146:setHeight(200);
    obj.layout146:setMargins({bottom=5});
    obj.layout146:setName("layout146");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout146);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setWidth(340);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setMargins({right=5});
    obj.rectangle43:setPadding({top=5,bottom=5});
    obj.rectangle43:setName("rectangle43");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle43);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("detalhes");
    obj.textEditor3:setMargins({left=5,right=5,top=0});
    obj.textEditor3:setName("textEditor3");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.scrollBox1);
    obj.layout147:setAlign("left");
    obj.layout147:setWidth(500);
    obj.layout147:setMargins({bottom=5});
    obj.layout147:setName("layout147");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout147);
    obj.layout148:setAlign("top");
    obj.layout148:setHeight(405);
    obj.layout148:setMargins({bottom=5});
    obj.layout148:setName("layout148");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout148);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setWidth(500);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setMargins({right=5});
    obj.rectangle44:setPadding({top=5,bottom=5});
    obj.rectangle44:setName("rectangle44");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle44);
    obj.layout149:setAlign("top");
    obj.layout149:setHeight(50);
    obj.layout149:setName("layout149");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.layout149);
    obj.layout150:setAlign("left");
    obj.layout150:setWidth(5);
    obj.layout150:setName("layout150");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout149);
    obj.layout151:setAlign("left");
    obj.layout151:setWidth(115);
    obj.layout151:setMargins({right=5});
    obj.layout151:setName("layout151");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout151);
    obj.label162:setText("PF");
    obj.label162:setWidth(115);
    obj.label162:setHorzTextAlign("leading");
    obj.label162:setFontSize(13);
    obj.label162:setName("label162");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout151);
    obj.rectangle45:setTop(20);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setWidth(57.5);
    obj.rectangle45:setColor("#F0FFFF");
    obj.rectangle45:setStrokeColor("black");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.rectangle45);
    obj.label163:setAlign("client");
    obj.label163:setField("fabricacaoMin");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setVertTextAlign("center");
    lfm_setPropAsString(obj.label163, "format",  "");
    lfm_setPropAsString(obj.label163, "formatFloat",  "");
    obj.label163:setName("label163");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout151);
    obj.rectangle46:setLeft(57.5);
    obj.rectangle46:setTop(20);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setWidth(57.5);
    obj.rectangle46:setColor("#F0FFFF");
    obj.rectangle46:setStrokeColor("black");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.rectangle46);
    obj.label164:setAlign("client");
    obj.label164:setField("fabricacaoMax");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setVertTextAlign("center");
    lfm_setPropAsString(obj.label164, "format",  "");
    lfm_setPropAsString(obj.label164, "formatFloat",  "");
    obj.label164:setName("label164");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout149);
    obj.layout152:setAlign("left");
    obj.layout152:setWidth(115);
    obj.layout152:setMargins({right=5});
    obj.layout152:setName("layout152");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout152);
    obj.label165:setText("UNE");
    obj.label165:setWidth(115);
    obj.label165:setHorzTextAlign("leading");
    obj.label165:setFontSize(13);
    obj.label165:setName("label165");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout152);
    obj.rectangle47:setTop(20);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setWidth(57.5);
    obj.rectangle47:setColor("#F0FFFF");
    obj.rectangle47:setStrokeColor("black");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.rectangle47);
    obj.label166:setAlign("client");
    obj.label166:setField("energiaMin");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setVertTextAlign("center");
    lfm_setPropAsString(obj.label166, "format",  "");
    lfm_setPropAsString(obj.label166, "formatFloat",  "");
    obj.label166:setName("label166");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout152);
    obj.rectangle48:setLeft(57.5);
    obj.rectangle48:setTop(20);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setWidth(57.5);
    obj.rectangle48:setColor("#F0FFFF");
    obj.rectangle48:setStrokeColor("black");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.rectangle48);
    obj.label167:setAlign("client");
    obj.label167:setField("energiaMax");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setVertTextAlign("center");
    lfm_setPropAsString(obj.label167, "format",  "");
    lfm_setPropAsString(obj.label167, "formatFloat",  "");
    obj.label167:setName("label167");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout149);
    obj.layout153:setAlign("left");
    obj.layout153:setWidth(115);
    obj.layout153:setMargins({right=5});
    obj.layout153:setName("layout153");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout153);
    obj.label168:setText("Comp. Expansão");
    obj.label168:setWidth(115);
    obj.label168:setHorzTextAlign("leading");
    obj.label168:setFontSize(11);
    obj.label168:setName("label168");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout153);
    obj.rectangle49:setTop(20);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setWidth(57.5);
    obj.rectangle49:setColor("#F0FFFF");
    obj.rectangle49:setStrokeColor("black");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.rectangle49);
    obj.label169:setAlign("client");
    obj.label169:setField("expansaoMin");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setVertTextAlign("center");
    lfm_setPropAsString(obj.label169, "format",  "");
    lfm_setPropAsString(obj.label169, "formatFloat",  "");
    obj.label169:setName("label169");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout153);
    obj.rectangle50:setLeft(57.5);
    obj.rectangle50:setTop(20);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setWidth(57.5);
    obj.rectangle50:setColor("#F0FFFF");
    obj.rectangle50:setStrokeColor("black");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.rectangle50);
    obj.label170:setAlign("client");
    obj.label170:setField("expansaoMax");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setVertTextAlign("center");
    lfm_setPropAsString(obj.label170, "format",  "");
    lfm_setPropAsString(obj.label170, "formatFloat",  "");
    obj.label170:setName("label170");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout149);
    obj.layout154:setAlign("left");
    obj.layout154:setWidth(115);
    obj.layout154:setMargins({right=5});
    obj.layout154:setName("layout154");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout154);
    obj.label171:setText("Tripulação");
    obj.label171:setWidth(115);
    obj.label171:setHorzTextAlign("leading");
    obj.label171:setFontSize(13);
    obj.label171:setName("label171");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout154);
    obj.rectangle51:setTop(20);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setWidth(57.5);
    obj.rectangle51:setColor("#F0FFFF");
    obj.rectangle51:setStrokeColor("black");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.rectangle51);
    obj.label172:setAlign("client");
    obj.label172:setField("tripulacaoMin");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setVertTextAlign("center");
    lfm_setPropAsString(obj.label172, "format",  "");
    lfm_setPropAsString(obj.label172, "formatFloat",  "");
    obj.label172:setName("label172");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout154);
    obj.rectangle52:setLeft(57.5);
    obj.rectangle52:setTop(20);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setWidth(57.5);
    obj.rectangle52:setColor("#F0FFFF");
    obj.rectangle52:setStrokeColor("black");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.rectangle52);
    obj.label173:setAlign("client");
    obj.label173:setField("tripulacaoMax");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setVertTextAlign("center");
    lfm_setPropAsString(obj.label173, "format",  "");
    lfm_setPropAsString(obj.label173, "formatFloat",  "");
    obj.label173:setName("label173");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle44);
    obj.layout155:setAlign("top");
    obj.layout155:setHeight(50);
    obj.layout155:setName("layout155");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout155);
    obj.layout156:setAlign("left");
    obj.layout156:setWidth(5);
    obj.layout156:setName("layout156");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout155);
    obj.layout157:setAlign("left");
    obj.layout157:setWidth(300);
    obj.layout157:setMargins({right=5});
    obj.layout157:setName("layout157");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout157);
    obj.label174:setText("Blocos");
    obj.label174:setWidth(300);
    obj.label174:setHorzTextAlign("leading");
    obj.label174:setFontSize(13);
    obj.label174:setName("label174");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout157);
    obj.rectangle53:setTop(20);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setWidth(150);
    obj.rectangle53:setColor("#F0FFFF");
    obj.rectangle53:setStrokeColor("black");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.rectangle53);
    obj.label175:setAlign("client");
    obj.label175:setField("blocosMin");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setVertTextAlign("center");
    lfm_setPropAsString(obj.label175, "format",  "");
    lfm_setPropAsString(obj.label175, "formatFloat",  ",0");
    obj.label175:setName("label175");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout157);
    obj.rectangle54:setLeft(150);
    obj.rectangle54:setTop(20);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setWidth(150);
    obj.rectangle54:setColor("#F0FFFF");
    obj.rectangle54:setStrokeColor("black");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.rectangle54);
    obj.label176:setAlign("client");
    obj.label176:setField("blocosMax");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setVertTextAlign("center");
    lfm_setPropAsString(obj.label176, "format",  "");
    lfm_setPropAsString(obj.label176, "formatFloat",  ",0");
    obj.label176:setName("label176");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout155);
    obj.layout158:setAlign("left");
    obj.layout158:setWidth(180);
    obj.layout158:setMargins({right=5});
    obj.layout158:setName("layout158");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout158);
    obj.label177:setText("Dimensões (q)");
    obj.label177:setAlign("top");
    obj.label177:setHeight(20);
    obj.label177:setHorzTextAlign("leading");
    obj.label177:setFontSize(13);
    obj.label177:setName("label177");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout158);
    obj.layout159:setAlign("top");
    obj.layout159:setHeight(30);
    obj.layout159:setName("layout159");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout159);
    obj.edit65:setAlign("left");
    obj.edit65:setField("dimensoes_a");
    obj.edit65:setWidth(60);
    obj.edit65:setMargins({bottom=5});
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout159);
    obj.edit66:setAlign("left");
    obj.edit66:setField("dimensoes_b");
    obj.edit66:setWidth(60);
    obj.edit66:setMargins({bottom=5});
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout159);
    obj.edit67:setAlign("left");
    obj.edit67:setField("dimensoes_c");
    obj.edit67:setWidth(60);
    obj.edit67:setMargins({bottom=5});
    obj.edit67:setName("edit67");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle44);
    obj.layout160:setAlign("top");
    obj.layout160:setHeight(50);
    obj.layout160:setName("layout160");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout160);
    obj.layout161:setAlign("left");
    obj.layout161:setWidth(5);
    obj.layout161:setName("layout161");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout160);
    obj.layout162:setAlign("left");
    obj.layout162:setWidth(115);
    obj.layout162:setMargins({right=5});
    obj.layout162:setName("layout162");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout162);
    obj.label178:setText("Escudo");
    obj.label178:setWidth(115);
    obj.label178:setHorzTextAlign("leading");
    obj.label178:setFontSize(13);
    obj.label178:setName("label178");

    obj.escudo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.escudo:setParent(obj.layout162);
    obj.escudo:setTop(20);
    obj.escudo:setField("escudo");
    obj.escudo:setName("escudo");
    obj.escudo:setWidth(115);
    obj.escudo:setHeight(25);
    obj.escudo:setItems({'-', 'Básico 10', 'Básico 20', 'Básico 30', 'Básico 40', 'Leve 50', 'Leve 60', 'Leve 70', 'Leve 80', 'Médio 90', 'Médio 100', 'Médio 120', 'Médio 140', 'Médio 160', 'Médio 200', 'Pesado 240', 'Pesado 280', 'Pesado 320', 'Pesado 360', 'Pesado 420', 'Pesado 480', 'Superior 540', 'Superior 600'});
    obj.escudo:setValues({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'});
    obj.escudo:setFontSize(13);

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout160);
    obj.layout163:setAlign("left");
    obj.layout163:setWidth(115);
    obj.layout163:setMargins({right=5});
    obj.layout163:setName("layout163");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout163);
    obj.label179:setText("Armadura");
    obj.label179:setWidth(115);
    obj.label179:setHorzTextAlign("leading");
    obj.label179:setFontSize(13);
    obj.label179:setName("label179");

    obj.armadura = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.armadura:setParent(obj.layout163);
    obj.armadura:setTop(20);
    obj.armadura:setField("armadura");
    obj.armadura:setName("armadura");
    obj.armadura:setWidth(115);
    obj.armadura:setHeight(25);
    obj.armadura:setItems({'-','md 1','md 2','md 3','md 4','md 5','md 6','md 7','md 8','md 9','md 10','md 11','md 12','md 13','md 14','md 15'});
    obj.armadura:setValues({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'});
    obj.armadura:setFontSize(13);

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout160);
    obj.layout164:setAlign("left");
    obj.layout164:setWidth(115);
    obj.layout164:setMargins({right=5});
    obj.layout164:setName("layout164");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout164);
    obj.label180:setText("Contramedidas");
    obj.label180:setWidth(115);
    obj.label180:setHorzTextAlign("leading");
    obj.label180:setFontSize(13);
    obj.label180:setName("label180");

    obj.contramedidas = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.contramedidas:setParent(obj.layout164);
    obj.contramedidas:setTop(20);
    obj.contramedidas:setField("contramedidas");
    obj.contramedidas:setName("contramedidas");
    obj.contramedidas:setWidth(115);
    obj.contramedidas:setHeight(25);
    obj.contramedidas:setItems({'-','md 1','md 2','md 3','md 4','md 5','md 6','md 7','md 8','md 9','md 10','md 11','md 12','md 13','md 14','md 15'});
    obj.contramedidas:setValues({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'});
    obj.contramedidas:setFontSize(13);

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout160);
    obj.layout165:setAlign("left");
    obj.layout165:setWidth(115);
    obj.layout165:setMargins({right=5});
    obj.layout165:setName("layout165");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout165);
    obj.label181:setText("Computador");
    obj.label181:setWidth(115);
    obj.label181:setHorzTextAlign("leading");
    obj.label181:setFontSize(13);
    obj.label181:setName("label181");

    obj.computador = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.computador:setParent(obj.layout165);
    obj.computador:setTop(20);
    obj.computador:setField("computador");
    obj.computador:setName("computador");
    obj.computador:setWidth(115);
    obj.computador:setHeight(25);
    obj.computador:setItems({'Básico', 'Mono md 1', 'Duo md 1', 'Tri md 1', 'Tetra md 1', 'Mono md 2', 'Duo md 2', 'Tri md 2', 'Tetra md 2', 'Mono md 3', 'Duo md 3', 'Tri md 3', 'Tetra md 3', 'Mono md 4', 'Duo md 4', 'Tri md 4', 'Mono md 5', 'Duo md 5', 'Tri md 5', 'Mono md 6', 'Duo md 6', 'Mono md 7', 'Duo md 7', 'Mono md 8', 'Duo md8 +8', 'Mono md 9', 'Duo md 9', 'Mono md 10', 'Duo md 10'});
    obj.computador:setValues({'0_0', '1_1', '2_1', '3_1', '4_1', '1_2', '2_2', '3_2', '4_2', '1_3', '2_3', '3_3', '4_3', '1_4', '2_4', '3_4', '1_5', '2_5', '3_5', '1_6', '2_6', '1_7', '2_7', '1_8', '2_8', '1_9', '2_9', '1_10', '2_10'});
    obj.computador:setFontSize(13);

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle44);
    obj.layout166:setAlign("top");
    obj.layout166:setHeight(50);
    obj.layout166:setName("layout166");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout166);
    obj.layout167:setAlign("left");
    obj.layout167:setWidth(5);
    obj.layout167:setName("layout167");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout166);
    obj.layout168:setAlign("left");
    obj.layout168:setWidth(115);
    obj.layout168:setMargins({right=5});
    obj.layout168:setName("layout168");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout168);
    obj.label182:setText("Propulsor");
    obj.label182:setWidth(115);
    obj.label182:setHorzTextAlign("leading");
    obj.label182:setFontSize(13);
    obj.label182:setName("label182");

    obj.propulsor = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.propulsor:setParent(obj.layout168);
    obj.propulsor:setTop(20);
    obj.propulsor:setField("propulsor");
    obj.propulsor:setName("propulsor");
    obj.propulsor:setWidth(115);
    obj.propulsor:setHeight(25);
    obj.propulsor:setItems({});
    obj.propulsor:setValues({});
    obj.propulsor:setFontSize(13);

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout166);
    obj.layout169:setAlign("left");
    obj.layout169:setWidth(115);
    obj.layout169:setMargins({right=5});
    obj.layout169:setName("layout169");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout169);
    obj.label183:setText("Deriva");
    obj.label183:setWidth(115);
    obj.label183:setHorzTextAlign("leading");
    obj.label183:setFontSize(13);
    obj.label183:setName("label183");

    obj.deriva = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.deriva:setParent(obj.layout169);
    obj.deriva:setTop(20);
    obj.deriva:setField("deriva");
    obj.deriva:setName("deriva");
    obj.deriva:setWidth(115);
    obj.deriva:setHeight(25);
    obj.deriva:setItems({});
    obj.deriva:setValues({});
    obj.deriva:setFontSize(13);

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout166);
    obj.layout170:setAlign("left");
    obj.layout170:setWidth(115);
    obj.layout170:setMargins({right=5});
    obj.layout170:setName("layout170");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout170);
    obj.label184:setText("Sensor");
    obj.label184:setWidth(115);
    obj.label184:setHorzTextAlign("leading");
    obj.label184:setFontSize(13);
    obj.label184:setName("label184");

    obj.sensor = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.sensor:setParent(obj.layout170);
    obj.sensor:setTop(20);
    obj.sensor:setField("sensor");
    obj.sensor:setName("sensor");
    obj.sensor:setWidth(115);
    obj.sensor:setHeight(25);
    obj.sensor:setItems({'Mixaria', 'Barato Curto', 'Básico Curto', 'Avançado Curto', 'Barato Médio', 'Básico Médio', 'Avançado Médio', 'Barato Longo', 'Básico Longo', 'Avançado Longo'});
    obj.sensor:setValues({'0','1','2','3','4','5','6','7','8','9'});
    obj.sensor:setFontSize(13);

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout166);
    obj.layout171:setAlign("left");
    obj.layout171:setWidth(115);
    obj.layout171:setName("layout171");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout171);
    obj.checkBox1:setAlign("top");
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setText("PC Extra");
    obj.checkBox1:setField("opt_pc");
    obj.checkBox1:setMargins({right=5});
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout171);
    obj.checkBox2:setAlign("top");
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setText("Tripulação Extra");
    obj.checkBox2:setField("opt_trip");
    obj.checkBox2:setMargins({right=5});
    obj.checkBox2:setName("checkBox2");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle44);
    obj.layout172:setAlign("top");
    obj.layout172:setHeight(50);
    obj.layout172:setName("layout172");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.layout172);
    obj.layout173:setAlign("left");
    obj.layout173:setWidth(5);
    obj.layout173:setName("layout173");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout172);
    obj.layout174:setAlign("left");
    obj.layout174:setWidth(115);
    obj.layout174:setMargins({right=5});
    obj.layout174:setName("layout174");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout174);
    obj.label185:setText("Anti-Hack");
    obj.label185:setWidth(115);
    obj.label185:setHorzTextAlign("leading");
    obj.label185:setFontSize(13);
    obj.label185:setName("label185");

    obj.sec_hack = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.sec_hack:setParent(obj.layout174);
    obj.sec_hack:setTop(20);
    obj.sec_hack:setField("sec_hack");
    obj.sec_hack:setName("sec_hack");
    obj.sec_hack:setWidth(115);
    obj.sec_hack:setHeight(25);
    obj.sec_hack:setItems({'-','x1','x2','x3','x4'});
    obj.sec_hack:setValues({'0','1','2','3','4'});
    obj.sec_hack:setFontSize(13);

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout172);
    obj.layout175:setAlign("left");
    obj.layout175:setWidth(115);
    obj.layout175:setMargins({right=5});
    obj.layout175:setName("layout175");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout175);
    obj.label186:setText("Grade de Choque");
    obj.label186:setWidth(115);
    obj.label186:setHorzTextAlign("leading");
    obj.label186:setFontSize(13);
    obj.label186:setName("label186");

    obj.sec_choque = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.sec_choque:setParent(obj.layout175);
    obj.sec_choque:setTop(20);
    obj.sec_choque:setField("sec_choque");
    obj.sec_choque:setName("sec_choque");
    obj.sec_choque:setWidth(115);
    obj.sec_choque:setHeight(25);
    obj.sec_choque:setItems({'-','x1','x2','x3','x4'});
    obj.sec_choque:setValues({'0','1','2','3','4'});
    obj.sec_choque:setFontSize(13);

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.rectangle44);
    obj.layout176:setAlign("top");
    obj.layout176:setHeight(25);
    obj.layout176:setName("layout176");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.layout176);
    obj.layout177:setAlign("left");
    obj.layout177:setWidth(5);
    obj.layout177:setName("layout177");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout176);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(115);
    obj.checkBox3:setText("Tranca Biométrica");
    obj.checkBox3:setField("sec_tranca");
    obj.checkBox3:setMargins({right=5});
    obj.checkBox3:setFontSize(11);
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout176);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(115);
    obj.checkBox4:setText("Autodestruição");
    obj.checkBox4:setField("sec_autodest");
    obj.checkBox4:setMargins({right=5});
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout176);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(115);
    obj.checkBox5:setText("Alarme");
    obj.checkBox5:setField("sec_alarm");
    obj.checkBox5:setMargins({right=5});
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout176);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(115);
    obj.checkBox6:setText("Bloqueio");
    obj.checkBox6:setField("sec_lockout");
    obj.checkBox6:setMargins({right=5});
    obj.checkBox6:setName("checkBox6");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.rectangle44);
    obj.layout178:setAlign("top");
    obj.layout178:setHeight(25);
    obj.layout178:setName("layout178");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.layout178);
    obj.layout179:setAlign("left");
    obj.layout179:setWidth(5);
    obj.layout179:setName("layout179");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout178);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(115);
    obj.checkBox7:setText("Interface Falsa");
    obj.checkBox7:setField("sec_shell");
    obj.checkBox7:setMargins({right=5});
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout178);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(115);
    obj.checkBox8:setText("Formatar Dados");
    obj.checkBox8:setField("sec_wipe");
    obj.checkBox8:setMargins({right=5});
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout178);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(115);
    obj.checkBox9:setText("Contravírus");
    obj.checkBox9:setField("sec_feedback");
    obj.checkBox9:setMargins({right=5});
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout178);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(115);
    obj.checkBox10:setText("Firewall");
    obj.checkBox10:setField("sec_firewall");
    obj.checkBox10:setMargins({right=5});
    obj.checkBox10:setName("checkBox10");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle44);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setHeight(1);
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setName("horzLine1");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle44);
    obj.layout180:setAlign("top");
    obj.layout180:setHeight(50);
    obj.layout180:setName("layout180");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.layout180);
    obj.layout181:setAlign("left");
    obj.layout181:setWidth(5);
    obj.layout181:setName("layout181");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.layout180);
    obj.layout182:setAlign("left");
    obj.layout182:setWidth(115);
    obj.layout182:setMargins({right=5});
    obj.layout182:setName("layout182");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout182);
    obj.label187:setText("Suporte de Vida");
    obj.label187:setWidth(115);
    obj.label187:setHorzTextAlign("leading");
    obj.label187:setFontSize(13);
    obj.label187:setName("label187");

    obj.status_vida = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_vida:setParent(obj.layout182);
    obj.status_vida:setTop(20);
    obj.status_vida:setField("status_vida");
    obj.status_vida:setName("status_vida");
    obj.status_vida:setWidth(115);
    obj.status_vida:setHeight(25);
    obj.status_vida:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_vida:setValues({'0','1','2','3'});
    obj.status_vida:setFontSize(13);

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.layout180);
    obj.layout183:setAlign("left");
    obj.layout183:setWidth(115);
    obj.layout183:setMargins({right=5});
    obj.layout183:setName("layout183");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout183);
    obj.label188:setText("Sensores");
    obj.label188:setWidth(115);
    obj.label188:setHorzTextAlign("leading");
    obj.label188:setFontSize(13);
    obj.label188:setName("label188");

    obj.status_sensores = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_sensores:setParent(obj.layout183);
    obj.status_sensores:setTop(20);
    obj.status_sensores:setField("status_sensores");
    obj.status_sensores:setName("status_sensores");
    obj.status_sensores:setWidth(115);
    obj.status_sensores:setHeight(25);
    obj.status_sensores:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_sensores:setValues({'0','1','2','3'});
    obj.status_sensores:setFontSize(13);

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.layout180);
    obj.layout184:setAlign("left");
    obj.layout184:setWidth(115);
    obj.layout184:setMargins({right=5});
    obj.layout184:setName("layout184");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout184);
    obj.label189:setText("Motores");
    obj.label189:setWidth(115);
    obj.label189:setHorzTextAlign("leading");
    obj.label189:setFontSize(13);
    obj.label189:setName("label189");

    obj.status_motores = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_motores:setParent(obj.layout184);
    obj.status_motores:setTop(20);
    obj.status_motores:setField("status_motores");
    obj.status_motores:setName("status_motores");
    obj.status_motores:setWidth(115);
    obj.status_motores:setHeight(25);
    obj.status_motores:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_motores:setValues({'0','1','2','3'});
    obj.status_motores:setFontSize(13);

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.layout180);
    obj.layout185:setAlign("left");
    obj.layout185:setWidth(115);
    obj.layout185:setMargins({right=5});
    obj.layout185:setName("layout185");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout185);
    obj.label190:setText("Núcleo de Energia");
    obj.label190:setWidth(115);
    obj.label190:setHorzTextAlign("leading");
    obj.label190:setFontSize(13);
    obj.label190:setName("label190");

    obj.status_reator = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_reator:setParent(obj.layout185);
    obj.status_reator:setTop(20);
    obj.status_reator:setField("status_reator");
    obj.status_reator:setName("status_reator");
    obj.status_reator:setWidth(115);
    obj.status_reator:setHeight(25);
    obj.status_reator:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_reator:setValues({'0','1','2','3'});
    obj.status_reator:setFontSize(13);

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.rectangle44);
    obj.layout186:setAlign("top");
    obj.layout186:setHeight(50);
    obj.layout186:setName("layout186");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.layout186);
    obj.layout187:setAlign("left");
    obj.layout187:setWidth(5);
    obj.layout187:setName("layout187");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.layout186);
    obj.layout188:setAlign("left");
    obj.layout188:setWidth(115);
    obj.layout188:setMargins({right=5});
    obj.layout188:setName("layout188");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout188);
    obj.label191:setText("Armas Proa");
    obj.label191:setWidth(115);
    obj.label191:setHorzTextAlign("leading");
    obj.label191:setFontSize(13);
    obj.label191:setName("label191");

    obj.status_proa = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_proa:setParent(obj.layout188);
    obj.status_proa:setTop(20);
    obj.status_proa:setField("status_proa");
    obj.status_proa:setName("status_proa");
    obj.status_proa:setWidth(115);
    obj.status_proa:setHeight(25);
    obj.status_proa:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_proa:setValues({'0','1','2','3'});
    obj.status_proa:setFontSize(13);

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.layout186);
    obj.layout189:setAlign("left");
    obj.layout189:setWidth(115);
    obj.layout189:setMargins({right=5});
    obj.layout189:setName("layout189");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout189);
    obj.label192:setText("Armas Popa");
    obj.label192:setWidth(115);
    obj.label192:setHorzTextAlign("leading");
    obj.label192:setFontSize(13);
    obj.label192:setName("label192");

    obj.status_popa = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_popa:setParent(obj.layout189);
    obj.status_popa:setTop(20);
    obj.status_popa:setField("status_popa");
    obj.status_popa:setName("status_popa");
    obj.status_popa:setWidth(115);
    obj.status_popa:setHeight(25);
    obj.status_popa:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_popa:setValues({'0','1','2','3'});
    obj.status_popa:setFontSize(13);

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.layout186);
    obj.layout190:setAlign("left");
    obj.layout190:setWidth(115);
    obj.layout190:setMargins({right=5});
    obj.layout190:setName("layout190");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout190);
    obj.label193:setText("Armas Bombordo");
    obj.label193:setWidth(115);
    obj.label193:setHorzTextAlign("leading");
    obj.label193:setFontSize(13);
    obj.label193:setName("label193");

    obj.status_bombordo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_bombordo:setParent(obj.layout190);
    obj.status_bombordo:setTop(20);
    obj.status_bombordo:setField("status_bombordo");
    obj.status_bombordo:setName("status_bombordo");
    obj.status_bombordo:setWidth(115);
    obj.status_bombordo:setHeight(25);
    obj.status_bombordo:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_bombordo:setValues({'0','1','2','3'});
    obj.status_bombordo:setFontSize(13);

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.layout186);
    obj.layout191:setAlign("left");
    obj.layout191:setWidth(115);
    obj.layout191:setMargins({right=5});
    obj.layout191:setName("layout191");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout191);
    obj.label194:setText("Armas Estibordo");
    obj.label194:setWidth(115);
    obj.label194:setHorzTextAlign("leading");
    obj.label194:setFontSize(13);
    obj.label194:setName("label194");

    obj.status_estibordo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.status_estibordo:setParent(obj.layout191);
    obj.status_estibordo:setTop(20);
    obj.status_estibordo:setField("status_estibordo");
    obj.status_estibordo:setName("status_estibordo");
    obj.status_estibordo:setWidth(115);
    obj.status_estibordo:setHeight(25);
    obj.status_estibordo:setItems({'Nominal','Falhando','Mal Funcionamento', 'Avariado'});
    obj.status_estibordo:setValues({'0','1','2','3'});
    obj.status_estibordo:setFontSize(13);

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.layout147);
    obj.layout192:setAlign("top");
    obj.layout192:setHeight(200);
    obj.layout192:setMargins({bottom=5});
    obj.layout192:setName("layout192");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout192);
    obj.rectangle55:setAlign("client");
    obj.rectangle55:setWidth(340);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setMargins({right=5});
    obj.rectangle55:setPadding({top=5,bottom=5});
    obj.rectangle55:setName("rectangle55");

    obj.layout193 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.rectangle55);
    obj.layout193:setAlign("top");
    obj.layout193:setHeight(20);
    obj.layout193:setName("layout193");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout193);
    obj.button3:setAlign("left");
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setText("+");
    obj.button3:setMargins({left=5});
    obj.button3:setName("button3");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout193);
    obj.label195:setAlign("left");
    obj.label195:setText("Inventario");
    obj.label195:setWidth(100);
    obj.label195:setMargins({left=5});
    obj.label195:setName("label195");

    obj.layout194 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.rectangle55);
    obj.layout194:setAlign("bottom");
    obj.layout194:setHeight(20);
    obj.layout194:setMargins({top=5});
    obj.layout194:setName("layout194");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout194);
    obj.label196:setLeft(5);
    obj.label196:setTop(0);
    obj.label196:setWidth(50);
    obj.label196:setHeight(20);
    obj.label196:setText("Vol");
    obj.label196:setName("label196");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout194);
    obj.rectangle56:setLeft(25);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(70);
    obj.rectangle56:setHeight(20);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout194);
    obj.label197:setVertTextAlign("center");
    obj.label197:setHorzTextAlign("center");
    obj.label197:setLeft(25);
    obj.label197:setTop(0);
    obj.label197:setWidth(70);
    obj.label197:setHeight(20);
    obj.label197:setField("pesoInv");
    lfm_setPropAsString(obj.label197, "formatFloat",  ",0.##");
    obj.label197:setName("label197");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout194);
    obj.label198:setLeft(105);
    obj.label198:setTop(0);
    obj.label198:setWidth(50);
    obj.label198:setHeight(20);
    obj.label198:setText("$");
    obj.label198:setName("label198");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout194);
    obj.rectangle57:setLeft(120);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(91);
    obj.rectangle57:setHeight(20);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout194);
    obj.label199:setVertTextAlign("center");
    obj.label199:setHorzTextAlign("center");
    obj.label199:setLeft(120);
    obj.label199:setTop(0);
    obj.label199:setWidth(91);
    obj.label199:setHeight(20);
    obj.label199:setField("precoInv");
    lfm_setPropAsString(obj.label199, "formatFloat",  ",0.## C");
    obj.label199:setName("label199");

    obj.rclInv = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInv:setParent(obj.rectangle55);
    obj.rclInv:setName("rclInv");
    obj.rclInv:setField("listaInv");
    obj.rclInv:setTemplateForm("frmVehicleItem");
    obj.rclInv:setAlign("client");
    obj.rclInv:setWidth(465);
    obj.rclInv:setMargins({left=5,right=5});
    obj.rclInv:setLayout("vertical");
    obj.rclInv:setMinQt(1);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.frmNaveGeneral);
    obj.dataLink1:setField("tamanho");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.frmNaveGeneral);
    obj.dataLink2:setFields({'tamanho','plataforma', 'armadura_curva'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.frmNaveGeneral);
    obj.dataLink3:setFields({'propulsor'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.frmNaveGeneral);
    obj.dataLink4:setFields({'armadura','tamanho'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.frmNaveGeneral);
    obj.dataLink5:setFields({'computador','tamanho'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.frmNaveGeneral);
    obj.dataLink6:setFields({'contramedidas','tamanho','tm_armadura'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.frmNaveGeneral);
    obj.dataLink7:setFields({'escudo','escudo_proa','escudo_popa','escudo_bombordo','escudo_estibordo','tamanho'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.frmNaveGeneral);
    obj.dataLink8:setFields({'deriva','tamanho'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.frmNaveGeneral);
    obj.dataLink9:setFields({'sensor'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.frmNaveGeneral);
    obj.dataLink10:setFields({'opt_pc','casco_base','casco_incremento','armadura','ranque'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.frmNaveGeneral);
    obj.dataLink11:setFields({'ca_piloto','ca_armadura','ca_tamanho','ca_outros','tm_contramedidas','tm_outros'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.frmNaveGeneral);
    obj.dataLink12:setFields({'ranque'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.frmNaveGeneral);
    obj.dataLink13:setFields({'plataforma_pf','propulsor_pf','armadura_pf','computador_pf','contramedidas_pf','escudo_pf','deriva_pf','sensor_pf','expansao_pf','reator_pf','sec_hack','sec_choque','sec_tranca','sec_autodest','sec_alarm','sec_lockout','sec_shell','sec_wipe','sec_feedback','sec_firewall','ranque','tamanho','weapon_pf'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.frmNaveGeneral);
    obj.dataLink14:setFields({'propulsor_une','computador_une','contramedidas_une','escudo_une','deriva_une','expansao_une','weapon_une'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.frmNaveGeneral);
    obj.dataLink15:setFields({'dimensoes_a','dimensoes_b','dimensoes_c'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.frmNaveGeneral);
    obj.dataLink16:setFields({'propulsor_blocos','armadura_blocos','computador_blocos','contramedidas_blocos','escudo_blocos','deriva_blocos','reator_blocos','expansao_blocos','weapon_blocos'});
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.frmNaveGeneral);
    obj.dataLink17:setFields({'plataforma_tripMin','opt_trip','propulsor_tripMin','escudo_tripMin','deriva_tripMin','reator_tripMin','expansao_tripMin','weapon_tripMin'});
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.frmNaveGeneral);
    obj.dataLink18:setFields({'plataforma_tripMax','opt_trip','propulsor_tripMax','escudo_tripMax','deriva_tripMax','reator_tripMax','expansao_tripMax','weapon_tripMax'});
    obj.dataLink18:setName("dataLink18");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Armas");
    obj.tab2:setName("tab2");

    obj.frmWeapons = GUI.fromHandle(_obj_newObject("form"));
    obj.frmWeapons:setParent(obj.tab2);
    obj.frmWeapons:setName("frmWeapons");
    obj.frmWeapons:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmWeapons);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox2);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxColumns(4);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.campoProaPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoProaPart:setParent(obj.flowLayout2);
    obj.campoProaPart:setMinWidth(300);
    obj.campoProaPart:setMaxWidth(600);
    obj.campoProaPart:setHeight(25);
    obj.campoProaPart:setMinScaledWidth(280);
    obj.campoProaPart:setName("campoProaPart");
    obj.campoProaPart:setAdjustHeightToLine(false);
    obj.campoProaPart:setMargins({left=5});


					rawset(self.campoProaPart, "_recalcHeight", 					
						function ()
							self.campoProaPart.height = self.campoProa.height + 25;
						end);
				


    obj.layout195 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.campoProaPart);
    obj.layout195:setAlign("top");
    obj.layout195:setHeight(25);
    obj.layout195:setName("layout195");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout195);
    obj.button4:setText("+");
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setName("button4");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout195);
    obj.label200:setText("Proa");
    obj.label200:setAlign("left");
    obj.label200:setWidth(225);
    obj.label200:setMargins({left=5});
    obj.label200:setName("label200");

    obj.campoProa = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoProa:setParent(obj.campoProaPart);
    obj.campoProa:setName("campoProa");
    obj.campoProa:setField("campoProa");
    obj.campoProa:setTemplateForm("frmWeaponPart");
    obj.campoProa:setAlign("top");
    obj.campoProa:setLayout("vertical");
    obj.campoProa:setAutoHeight(true);
    obj.campoProa:setHitTest(false);
    obj.campoProa:setMinQt(1);

    obj.campoPopaPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoPopaPart:setParent(obj.flowLayout2);
    obj.campoPopaPart:setMinWidth(300);
    obj.campoPopaPart:setMaxWidth(600);
    obj.campoPopaPart:setHeight(25);
    obj.campoPopaPart:setMinScaledWidth(280);
    obj.campoPopaPart:setName("campoPopaPart");
    obj.campoPopaPart:setAdjustHeightToLine(false);
    obj.campoPopaPart:setMargins({left=5});


					rawset(self.campoPopaPart, "_recalcHeight", 					
						function ()
							self.campoPopaPart.height = self.campoPopa.height + 25;
						end);
				


    obj.layout196 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.campoPopaPart);
    obj.layout196:setAlign("top");
    obj.layout196:setHeight(25);
    obj.layout196:setName("layout196");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout196);
    obj.button5:setText("+");
    obj.button5:setAlign("left");
    obj.button5:setWidth(30);
    obj.button5:setName("button5");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout196);
    obj.label201:setText("Popa");
    obj.label201:setAlign("left");
    obj.label201:setWidth(225);
    obj.label201:setMargins({left=5});
    obj.label201:setName("label201");

    obj.campoPopa = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoPopa:setParent(obj.campoPopaPart);
    obj.campoPopa:setName("campoPopa");
    obj.campoPopa:setField("campoPopa");
    obj.campoPopa:setTemplateForm("frmWeaponPart");
    obj.campoPopa:setAlign("top");
    obj.campoPopa:setLayout("vertical");
    obj.campoPopa:setAutoHeight(true);
    obj.campoPopa:setHitTest(false);
    obj.campoPopa:setMinQt(1);

    obj.campoBombordoPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoBombordoPart:setParent(obj.flowLayout2);
    obj.campoBombordoPart:setMinWidth(300);
    obj.campoBombordoPart:setMaxWidth(600);
    obj.campoBombordoPart:setHeight(25);
    obj.campoBombordoPart:setMinScaledWidth(280);
    obj.campoBombordoPart:setName("campoBombordoPart");
    obj.campoBombordoPart:setAdjustHeightToLine(false);
    obj.campoBombordoPart:setMargins({left=5});


					rawset(self.campoBombordoPart, "_recalcHeight", 					
						function ()
							self.campoBombordoPart.height = self.campoBombordo.height + 25;
						end);
				


    obj.layout197 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.campoBombordoPart);
    obj.layout197:setAlign("top");
    obj.layout197:setHeight(25);
    obj.layout197:setName("layout197");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout197);
    obj.button6:setText("+");
    obj.button6:setAlign("left");
    obj.button6:setWidth(30);
    obj.button6:setName("button6");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout197);
    obj.label202:setText("Bombordo");
    obj.label202:setAlign("left");
    obj.label202:setWidth(225);
    obj.label202:setMargins({left=5});
    obj.label202:setName("label202");

    obj.campoBombordo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoBombordo:setParent(obj.campoBombordoPart);
    obj.campoBombordo:setName("campoBombordo");
    obj.campoBombordo:setField("campoBombordo");
    obj.campoBombordo:setTemplateForm("frmWeaponPart");
    obj.campoBombordo:setAlign("top");
    obj.campoBombordo:setLayout("vertical");
    obj.campoBombordo:setAutoHeight(true);
    obj.campoBombordo:setHitTest(false);
    obj.campoBombordo:setMinQt(1);

    obj.campoEstibordoPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoEstibordoPart:setParent(obj.flowLayout2);
    obj.campoEstibordoPart:setMinWidth(300);
    obj.campoEstibordoPart:setMaxWidth(600);
    obj.campoEstibordoPart:setHeight(25);
    obj.campoEstibordoPart:setMinScaledWidth(280);
    obj.campoEstibordoPart:setName("campoEstibordoPart");
    obj.campoEstibordoPart:setAdjustHeightToLine(false);
    obj.campoEstibordoPart:setMargins({left=5});


					rawset(self.campoEstibordoPart, "_recalcHeight", 					
						function ()
							self.campoEstibordoPart.height = self.campoEstibordo.height + 25;
						end);
				


    obj.layout198 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.campoEstibordoPart);
    obj.layout198:setAlign("top");
    obj.layout198:setHeight(25);
    obj.layout198:setName("layout198");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout198);
    obj.button7:setText("+");
    obj.button7:setAlign("left");
    obj.button7:setWidth(30);
    obj.button7:setName("button7");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout198);
    obj.label203:setText("Estibordo");
    obj.label203:setAlign("left");
    obj.label203:setWidth(225);
    obj.label203:setMargins({left=5});
    obj.label203:setName("label203");

    obj.campoEstibordo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoEstibordo:setParent(obj.campoEstibordoPart);
    obj.campoEstibordo:setName("campoEstibordo");
    obj.campoEstibordo:setField("campoEstibordo");
    obj.campoEstibordo:setTemplateForm("frmWeaponPart");
    obj.campoEstibordo:setAlign("top");
    obj.campoEstibordo:setLayout("vertical");
    obj.campoEstibordo:setAutoHeight(true);
    obj.campoEstibordo:setHitTest(false);
    obj.campoEstibordo:setMinQt(1);

    obj.campoTorretaPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoTorretaPart:setParent(obj.flowLayout2);
    obj.campoTorretaPart:setMinWidth(300);
    obj.campoTorretaPart:setMaxWidth(600);
    obj.campoTorretaPart:setHeight(25);
    obj.campoTorretaPart:setMinScaledWidth(280);
    obj.campoTorretaPart:setName("campoTorretaPart");
    obj.campoTorretaPart:setAdjustHeightToLine(false);
    obj.campoTorretaPart:setMargins({left=5});


					rawset(self.campoTorretaPart, "_recalcHeight", 					
						function ()
							self.campoTorretaPart.height = self.campoTorreta.height + 25;
						end);
				


    obj.layout199 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.campoTorretaPart);
    obj.layout199:setAlign("top");
    obj.layout199:setHeight(25);
    obj.layout199:setName("layout199");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout199);
    obj.button8:setText("+");
    obj.button8:setAlign("left");
    obj.button8:setWidth(30);
    obj.button8:setName("button8");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout199);
    obj.label204:setText("Torreta");
    obj.label204:setAlign("left");
    obj.label204:setWidth(225);
    obj.label204:setMargins({left=5});
    obj.label204:setName("label204");

    obj.campoTorreta = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoTorreta:setParent(obj.campoTorretaPart);
    obj.campoTorreta:setName("campoTorreta");
    obj.campoTorreta:setField("campoTorreta");
    obj.campoTorreta:setTemplateForm("frmWeaponPart");
    obj.campoTorreta:setAlign("top");
    obj.campoTorreta:setLayout("vertical");
    obj.campoTorreta:setAutoHeight(true);
    obj.campoTorreta:setHitTest(false);
    obj.campoTorreta:setMinQt(1);

    obj.campoAntipessoalPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoAntipessoalPart:setParent(obj.flowLayout2);
    obj.campoAntipessoalPart:setMinWidth(300);
    obj.campoAntipessoalPart:setMaxWidth(600);
    obj.campoAntipessoalPart:setHeight(25);
    obj.campoAntipessoalPart:setMinScaledWidth(280);
    obj.campoAntipessoalPart:setName("campoAntipessoalPart");
    obj.campoAntipessoalPart:setAdjustHeightToLine(false);
    obj.campoAntipessoalPart:setMargins({left=5});


					rawset(self.campoAntipessoalPart, "_recalcHeight", 					
						function ()
							self.campoAntipessoalPart.height = self.campoAntipessoal.height + 25;
						end);
				


    obj.layout200 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.campoAntipessoalPart);
    obj.layout200:setAlign("top");
    obj.layout200:setHeight(25);
    obj.layout200:setName("layout200");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout200);
    obj.button9:setText("+");
    obj.button9:setAlign("left");
    obj.button9:setWidth(30);
    obj.button9:setName("button9");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout200);
    obj.label205:setText("Antipessoal");
    obj.label205:setAlign("left");
    obj.label205:setWidth(225);
    obj.label205:setMargins({left=5});
    obj.label205:setName("label205");

    obj.campoAntipessoal = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoAntipessoal:setParent(obj.campoAntipessoalPart);
    obj.campoAntipessoal:setName("campoAntipessoal");
    obj.campoAntipessoal:setField("campoAntipessoal");
    obj.campoAntipessoal:setTemplateForm("frmWeaponPart");
    obj.campoAntipessoal:setAlign("top");
    obj.campoAntipessoal:setLayout("vertical");
    obj.campoAntipessoal:setAutoHeight(true);
    obj.campoAntipessoal:setHitTest(false);
    obj.campoAntipessoal:setMinQt(1);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Tripulação");
    obj.tab3:setName("tab3");

    obj.frmCrew = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCrew:setParent(obj.tab3);
    obj.frmCrew:setName("frmCrew");
    obj.frmCrew:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmCrew);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout201 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.scrollBox3);
    obj.layout201:setAlign("left");
    obj.layout201:setWidth(255);
    obj.layout201:setMargins({right=5});
    obj.layout201:setName("layout201");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout201);
    obj.rectangle58:setAlign("client");
    obj.rectangle58:setColor("black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.layout202 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.rectangle58);
    obj.layout202:setAlign("top");
    obj.layout202:setHeight(50);
    obj.layout202:setName("layout202");

    obj.layout203 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.layout202);
    obj.layout203:setAlign("left");
    obj.layout203:setWidth(5);
    obj.layout203:setName("layout203");

    obj.layout204 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.layout202);
    obj.layout204:setAlign("left");
    obj.layout204:setWidth(95);
    obj.layout204:setMargins({right=5});
    obj.layout204:setName("layout204");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout204);
    obj.label206:setText("Tipo");
    obj.label206:setWidth(95);
    obj.label206:setHorzTextAlign("leading");
    obj.label206:setFontSize(13);
    obj.label206:setName("label206");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout204);
    obj.rectangle59:setTop(20);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setWidth(95);
    obj.rectangle59:setColor("#F0FFFF");
    obj.rectangle59:setStrokeColor("black");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.rectangle59);
    obj.label207:setAlign("client");
    obj.label207:setField("trip_tipo1");
    obj.label207:setHorzTextAlign("center");
    obj.label207:setVertTextAlign("center");
    lfm_setPropAsString(obj.label207, "format",  "");
    lfm_setPropAsString(obj.label207, "formatFloat",  "");
    obj.label207:setName("label207");

    obj.layout205 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.layout202);
    obj.layout205:setAlign("left");
    obj.layout205:setWidth(45);
    obj.layout205:setMargins({right=5});
    obj.layout205:setName("layout205");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout205);
    obj.label208:setText("Min");
    obj.label208:setWidth(45);
    obj.label208:setHorzTextAlign("leading");
    obj.label208:setFontSize(13);
    obj.label208:setName("label208");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout205);
    obj.edit68:setTop(20);
    obj.edit68:setField("trip_min1");
    obj.edit68:setWidth(45);
    obj.edit68:setHeight(25);
    obj.edit68:setName("edit68");

    obj.layout206 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.layout202);
    obj.layout206:setAlign("left");
    obj.layout206:setWidth(45);
    obj.layout206:setMargins({right=5});
    obj.layout206:setName("layout206");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout206);
    obj.label209:setText("Max");
    obj.label209:setWidth(45);
    obj.label209:setHorzTextAlign("leading");
    obj.label209:setFontSize(13);
    obj.label209:setName("label209");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout206);
    obj.edit69:setTop(20);
    obj.edit69:setField("trip_max1");
    obj.edit69:setWidth(45);
    obj.edit69:setHeight(25);
    obj.edit69:setName("edit69");

    obj.layout207 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.layout202);
    obj.layout207:setAlign("left");
    obj.layout207:setWidth(45);
    obj.layout207:setMargins({right=5});
    obj.layout207:setName("layout207");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout207);
    obj.label210:setText("Atual");
    obj.label210:setWidth(45);
    obj.label210:setHorzTextAlign("leading");
    obj.label210:setFontSize(13);
    obj.label210:setName("label210");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout207);
    obj.rectangle60:setTop(20);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setWidth(45);
    obj.rectangle60:setColor("#F0FFFF");
    obj.rectangle60:setStrokeColor("black");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.rectangle60);
    obj.label211:setAlign("client");
    obj.label211:setField("trip_atual1");
    obj.label211:setHorzTextAlign("center");
    obj.label211:setVertTextAlign("center");
    lfm_setPropAsString(obj.label211, "format",  "");
    lfm_setPropAsString(obj.label211, "formatFloat",  "");
    obj.label211:setName("label211");

    obj.layout208 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.rectangle58);
    obj.layout208:setAlign("top");
    obj.layout208:setHeight(25);
    obj.layout208:setName("layout208");

    obj.layout209 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.layout208);
    obj.layout209:setAlign("left");
    obj.layout209:setWidth(5);
    obj.layout209:setName("layout209");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout208);
    obj.rectangle61:setAlign("left");
    obj.rectangle61:setWidth(95);
    obj.rectangle61:setColor("#F0FFFF");
    obj.rectangle61:setStrokeColor("black");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setMargins({right=5});
    obj.rectangle61:setName("rectangle61");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.rectangle61);
    obj.label212:setAlign("client");
    obj.label212:setField("trip_tipo2");
    obj.label212:setHorzTextAlign("center");
    obj.label212:setVertTextAlign("center");
    obj.label212:setName("label212");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout208);
    obj.edit70:setAlign("left");
    obj.edit70:setWidth(45);
    obj.edit70:setField("trip_min2");
    obj.edit70:setMargins({right=5});
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout208);
    obj.edit71:setAlign("left");
    obj.edit71:setWidth(45);
    obj.edit71:setField("trip_max2");
    obj.edit71:setMargins({right=5});
    obj.edit71:setName("edit71");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout208);
    obj.rectangle62:setAlign("left");
    obj.rectangle62:setWidth(45);
    obj.rectangle62:setColor("#F0FFFF");
    obj.rectangle62:setStrokeColor("black");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setMargins({right=5});
    obj.rectangle62:setName("rectangle62");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.rectangle62);
    obj.label213:setAlign("client");
    obj.label213:setField("trip_atual2");
    obj.label213:setHorzTextAlign("center");
    obj.label213:setVertTextAlign("center");
    obj.label213:setName("label213");

    obj.layout210 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.rectangle58);
    obj.layout210:setAlign("top");
    obj.layout210:setHeight(25);
    obj.layout210:setName("layout210");

    obj.layout211 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.layout210);
    obj.layout211:setAlign("left");
    obj.layout211:setWidth(5);
    obj.layout211:setName("layout211");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout210);
    obj.rectangle63:setAlign("left");
    obj.rectangle63:setWidth(95);
    obj.rectangle63:setColor("#F0FFFF");
    obj.rectangle63:setStrokeColor("black");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setMargins({right=5});
    obj.rectangle63:setName("rectangle63");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.rectangle63);
    obj.label214:setAlign("client");
    obj.label214:setField("trip_tipo3");
    obj.label214:setHorzTextAlign("center");
    obj.label214:setVertTextAlign("center");
    obj.label214:setName("label214");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout210);
    obj.edit72:setAlign("left");
    obj.edit72:setWidth(45);
    obj.edit72:setField("trip_min3");
    obj.edit72:setMargins({right=5});
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout210);
    obj.edit73:setAlign("left");
    obj.edit73:setWidth(45);
    obj.edit73:setField("trip_max3");
    obj.edit73:setMargins({right=5});
    obj.edit73:setName("edit73");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout210);
    obj.rectangle64:setAlign("left");
    obj.rectangle64:setWidth(45);
    obj.rectangle64:setColor("#F0FFFF");
    obj.rectangle64:setStrokeColor("black");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setMargins({right=5});
    obj.rectangle64:setName("rectangle64");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.rectangle64);
    obj.label215:setAlign("client");
    obj.label215:setField("trip_atual3");
    obj.label215:setHorzTextAlign("center");
    obj.label215:setVertTextAlign("center");
    obj.label215:setName("label215");

    obj.layout212 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.rectangle58);
    obj.layout212:setAlign("top");
    obj.layout212:setHeight(25);
    obj.layout212:setName("layout212");

    obj.layout213 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.layout212);
    obj.layout213:setAlign("left");
    obj.layout213:setWidth(5);
    obj.layout213:setName("layout213");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout212);
    obj.rectangle65:setAlign("left");
    obj.rectangle65:setWidth(95);
    obj.rectangle65:setColor("#F0FFFF");
    obj.rectangle65:setStrokeColor("black");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setMargins({right=5});
    obj.rectangle65:setName("rectangle65");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.rectangle65);
    obj.label216:setAlign("client");
    obj.label216:setField("trip_tipo4");
    obj.label216:setHorzTextAlign("center");
    obj.label216:setVertTextAlign("center");
    obj.label216:setName("label216");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout212);
    obj.edit74:setAlign("left");
    obj.edit74:setWidth(45);
    obj.edit74:setField("trip_min4");
    obj.edit74:setMargins({right=5});
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout212);
    obj.edit75:setAlign("left");
    obj.edit75:setWidth(45);
    obj.edit75:setField("trip_max4");
    obj.edit75:setMargins({right=5});
    obj.edit75:setName("edit75");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout212);
    obj.rectangle66:setAlign("left");
    obj.rectangle66:setWidth(45);
    obj.rectangle66:setColor("#F0FFFF");
    obj.rectangle66:setStrokeColor("black");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setMargins({right=5});
    obj.rectangle66:setName("rectangle66");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.rectangle66);
    obj.label217:setAlign("client");
    obj.label217:setField("trip_atual4");
    obj.label217:setHorzTextAlign("center");
    obj.label217:setVertTextAlign("center");
    obj.label217:setName("label217");

    obj.layout214 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.rectangle58);
    obj.layout214:setAlign("top");
    obj.layout214:setHeight(25);
    obj.layout214:setName("layout214");

    obj.layout215 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.layout214);
    obj.layout215:setAlign("left");
    obj.layout215:setWidth(5);
    obj.layout215:setName("layout215");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout214);
    obj.rectangle67:setAlign("left");
    obj.rectangle67:setWidth(95);
    obj.rectangle67:setColor("#F0FFFF");
    obj.rectangle67:setStrokeColor("black");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setMargins({right=5});
    obj.rectangle67:setName("rectangle67");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.rectangle67);
    obj.label218:setAlign("client");
    obj.label218:setField("trip_tipo5");
    obj.label218:setHorzTextAlign("center");
    obj.label218:setVertTextAlign("center");
    obj.label218:setName("label218");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout214);
    obj.edit76:setAlign("left");
    obj.edit76:setWidth(45);
    obj.edit76:setField("trip_min5");
    obj.edit76:setMargins({right=5});
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout214);
    obj.edit77:setAlign("left");
    obj.edit77:setWidth(45);
    obj.edit77:setField("trip_max5");
    obj.edit77:setMargins({right=5});
    obj.edit77:setName("edit77");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout214);
    obj.rectangle68:setAlign("left");
    obj.rectangle68:setWidth(45);
    obj.rectangle68:setColor("#F0FFFF");
    obj.rectangle68:setStrokeColor("black");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setMargins({right=5});
    obj.rectangle68:setName("rectangle68");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.rectangle68);
    obj.label219:setAlign("client");
    obj.label219:setField("trip_atual5");
    obj.label219:setHorzTextAlign("center");
    obj.label219:setVertTextAlign("center");
    obj.label219:setName("label219");

    obj.layout216 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.rectangle58);
    obj.layout216:setAlign("top");
    obj.layout216:setHeight(25);
    obj.layout216:setName("layout216");

    obj.layout217 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.layout216);
    obj.layout217:setAlign("left");
    obj.layout217:setWidth(5);
    obj.layout217:setName("layout217");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout216);
    obj.rectangle69:setAlign("left");
    obj.rectangle69:setWidth(95);
    obj.rectangle69:setColor("#F0FFFF");
    obj.rectangle69:setStrokeColor("black");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setMargins({right=5});
    obj.rectangle69:setName("rectangle69");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.rectangle69);
    obj.label220:setAlign("client");
    obj.label220:setField("trip_tipo6");
    obj.label220:setHorzTextAlign("center");
    obj.label220:setVertTextAlign("center");
    obj.label220:setName("label220");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout216);
    obj.edit78:setAlign("left");
    obj.edit78:setWidth(45);
    obj.edit78:setField("trip_min6");
    obj.edit78:setMargins({right=5});
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout216);
    obj.edit79:setAlign("left");
    obj.edit79:setWidth(45);
    obj.edit79:setField("trip_max6");
    obj.edit79:setMargins({right=5});
    obj.edit79:setName("edit79");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout216);
    obj.rectangle70:setAlign("left");
    obj.rectangle70:setWidth(45);
    obj.rectangle70:setColor("#F0FFFF");
    obj.rectangle70:setStrokeColor("black");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setMargins({right=5});
    obj.rectangle70:setName("rectangle70");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.rectangle70);
    obj.label221:setAlign("client");
    obj.label221:setField("trip_atual6");
    obj.label221:setHorzTextAlign("center");
    obj.label221:setVertTextAlign("center");
    obj.label221:setName("label221");

    obj.layout218 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.rectangle58);
    obj.layout218:setAlign("top");
    obj.layout218:setHeight(25);
    obj.layout218:setName("layout218");

    obj.layout219 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.layout218);
    obj.layout219:setAlign("left");
    obj.layout219:setWidth(5);
    obj.layout219:setName("layout219");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout218);
    obj.rectangle71:setAlign("left");
    obj.rectangle71:setWidth(95);
    obj.rectangle71:setColor("#F0FFFF");
    obj.rectangle71:setStrokeColor("black");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setMargins({right=5});
    obj.rectangle71:setName("rectangle71");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.rectangle71);
    obj.label222:setAlign("client");
    obj.label222:setField("trip_tipo7");
    obj.label222:setHorzTextAlign("center");
    obj.label222:setVertTextAlign("center");
    obj.label222:setName("label222");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout218);
    obj.edit80:setAlign("left");
    obj.edit80:setWidth(45);
    obj.edit80:setField("trip_min7");
    obj.edit80:setMargins({right=5});
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout218);
    obj.edit81:setAlign("left");
    obj.edit81:setWidth(45);
    obj.edit81:setField("trip_max7");
    obj.edit81:setMargins({right=5});
    obj.edit81:setName("edit81");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout218);
    obj.rectangle72:setAlign("left");
    obj.rectangle72:setWidth(45);
    obj.rectangle72:setColor("#F0FFFF");
    obj.rectangle72:setStrokeColor("black");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setMargins({right=5});
    obj.rectangle72:setName("rectangle72");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.rectangle72);
    obj.label223:setAlign("client");
    obj.label223:setField("trip_atual7");
    obj.label223:setHorzTextAlign("center");
    obj.label223:setVertTextAlign("center");
    obj.label223:setName("label223");

    obj.layout220 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.rectangle58);
    obj.layout220:setAlign("top");
    obj.layout220:setHeight(25);
    obj.layout220:setName("layout220");

    obj.layout221 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.layout220);
    obj.layout221:setAlign("left");
    obj.layout221:setWidth(5);
    obj.layout221:setName("layout221");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout220);
    obj.button10:setAlign("left");
    obj.button10:setWidth(95);
    obj.button10:setText("+");
    obj.button10:setMargins({right=5});
    obj.button10:setName("button10");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout220);
    obj.rectangle73:setAlign("left");
    obj.rectangle73:setWidth(45);
    obj.rectangle73:setColor("#F0FFFF");
    obj.rectangle73:setStrokeColor("black");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setMargins({right=5});
    obj.rectangle73:setName("rectangle73");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.rectangle73);
    obj.label224:setAlign("client");
    obj.label224:setField("trip_minTotal");
    obj.label224:setHorzTextAlign("center");
    obj.label224:setVertTextAlign("center");
    obj.label224:setName("label224");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout220);
    obj.rectangle74:setAlign("left");
    obj.rectangle74:setWidth(45);
    obj.rectangle74:setColor("#F0FFFF");
    obj.rectangle74:setStrokeColor("black");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setMargins({right=5});
    obj.rectangle74:setName("rectangle74");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.rectangle74);
    obj.label225:setAlign("client");
    obj.label225:setField("trip_maxTotal");
    obj.label225:setHorzTextAlign("center");
    obj.label225:setVertTextAlign("center");
    obj.label225:setName("label225");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout220);
    obj.rectangle75:setAlign("left");
    obj.rectangle75:setWidth(45);
    obj.rectangle75:setColor("#F0FFFF");
    obj.rectangle75:setStrokeColor("black");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setMargins({right=5});
    obj.rectangle75:setName("rectangle75");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.rectangle75);
    obj.label226:setAlign("client");
    obj.label226:setField("trip_atualTotal");
    obj.label226:setHorzTextAlign("center");
    obj.label226:setVertTextAlign("center");
    obj.label226:setName("label226");

    obj.layout222 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.scrollBox3);
    obj.layout222:setAlign("client");
    obj.layout222:setName("layout222");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout222);
    obj.rectangle76:setAlign("client");
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.rclTripulantes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTripulantes:setParent(obj.rectangle76);
    obj.rclTripulantes:setName("rclTripulantes");
    obj.rclTripulantes:setField("listaTripulantes");
    obj.rclTripulantes:setTemplateForm("frmCrewPart");
    obj.rclTripulantes:setAlign("client");
    obj.rclTripulantes:setWidth(465);
    obj.rclTripulantes:setMargins({left=5,right=5});
    obj.rclTripulantes:setLayout("verticalTiles");
    obj.rclTripulantes:setMinQt(1);

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.frmCrew);
    obj.dataLink19:setFields({'trip_tipo1','trip_tipo2','trip_tipo3','trip_tipo4','trip_tipo5','trip_tipo6','trip_tipo7'});
    obj.dataLink19:setDefaultValues({'Capitão','Artilheiro','Engenheiro','Oficial','Piloto','Médico','Outro'});
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.frmCrew);
    obj.dataLink20:setFields({'trip_min1','trip_min2','trip_min3','trip_min4','trip_min5','trip_min6','trip_min7'});
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.frmCrew);
    obj.dataLink21:setFields({'trip_max1','trip_max2','trip_max3','trip_max4','trip_max5','trip_max6','trip_max7'});
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.frmCrew);
    obj.dataLink22:setFields({'trip_atual1','trip_atual2','trip_atual3','trip_atual4','trip_atual5','trip_atual6','trip_atual7'});
    obj.dataLink22:setName("dataLink22");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.frmFichaRPGmeister10_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab4);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");

		
		local function fullResize()
			local height = self.notes.height / 3;
			
			self.anotacoes1.height = height-25;
			self.anotacoes1Part.height = height;
			self.anotacoes2.height = height-25;
			self.anotacoes2Part.height = height;
			self.anotacoes3.height = height-25;
			self.anotacoes3Part.height = height;
			self.anotacoes4.height = height-25;
			self.anotacoes4Part.height = height;
			self.anotacoes5.height = height-25;
			self.anotacoes5Part.height = height;
			self.anotacoes6.height = height-25;
			self.anotacoes6Part.height = height;
			self.anotacoes7.height = height-25;
			self.anotacoes7Part.height = height;
			self.anotacoes8.height = height-25;
			self.anotacoes8Part.height = height;
			self.anotacoes9.height = height-25;
			self.anotacoes9Part.height = height;
		end;
	


    obj.notes = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.notes:setParent(obj.frmFichaRPGmeister10_svg);
    obj.notes:setAlign("client");
    obj.notes:setName("notes");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.notes);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxColumns(3);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setAvoidScale(true);
    obj.flowLayout3:setName("flowLayout3");

    obj.anotacoes1Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes1Part:setParent(obj.flowLayout3);
    obj.anotacoes1Part:setMinWidth(300);
    obj.anotacoes1Part:setMaxWidth(600);
    obj.anotacoes1Part:setMinScaledWidth(280);
    obj.anotacoes1Part:setName("anotacoes1Part");
    obj.anotacoes1Part:setAdjustHeightToLine(false);
    obj.anotacoes1Part:setMargins({left=5});

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.anotacoes1Part);
    obj.label227:setAlign("top");
    obj.label227:setHeight(25);
    obj.label227:setText("ANOTAÇÕES");
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.anotacoes1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes1:setParent(obj.anotacoes1Part);
    obj.anotacoes1:setAlign("top");
    obj.anotacoes1:setField("anotacoes1");
    obj.anotacoes1:setHeight(52);
    obj.anotacoes1:setName("anotacoes1");

    obj.anotacoes2Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes2Part:setParent(obj.flowLayout3);
    obj.anotacoes2Part:setMinWidth(300);
    obj.anotacoes2Part:setMaxWidth(600);
    obj.anotacoes2Part:setMinScaledWidth(280);
    obj.anotacoes2Part:setName("anotacoes2Part");
    obj.anotacoes2Part:setAdjustHeightToLine(false);
    obj.anotacoes2Part:setMargins({left=5});

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.anotacoes2Part);
    obj.label228:setAlign("top");
    obj.label228:setHeight(25);
    obj.label228:setText("ANOTAÇÕES");
    obj.label228:setHorzTextAlign("center");
    obj.label228:setName("label228");

    obj.anotacoes2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes2:setParent(obj.anotacoes2Part);
    obj.anotacoes2:setAlign("top");
    obj.anotacoes2:setField("anotacoes2");
    obj.anotacoes2:setHeight(52);
    obj.anotacoes2:setName("anotacoes2");

    obj.anotacoes3Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes3Part:setParent(obj.flowLayout3);
    obj.anotacoes3Part:setMinWidth(300);
    obj.anotacoes3Part:setMaxWidth(600);
    obj.anotacoes3Part:setMinScaledWidth(280);
    obj.anotacoes3Part:setName("anotacoes3Part");
    obj.anotacoes3Part:setAdjustHeightToLine(false);
    obj.anotacoes3Part:setMargins({left=5});

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.anotacoes3Part);
    obj.label229:setAlign("top");
    obj.label229:setHeight(25);
    obj.label229:setText("ANOTAÇÕES");
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.anotacoes3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes3:setParent(obj.anotacoes3Part);
    obj.anotacoes3:setAlign("top");
    obj.anotacoes3:setField("anotacoes3");
    obj.anotacoes3:setHeight(52);
    obj.anotacoes3:setName("anotacoes3");

    obj.anotacoes4Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes4Part:setParent(obj.flowLayout3);
    obj.anotacoes4Part:setMinWidth(300);
    obj.anotacoes4Part:setMaxWidth(600);
    obj.anotacoes4Part:setMinScaledWidth(280);
    obj.anotacoes4Part:setName("anotacoes4Part");
    obj.anotacoes4Part:setAdjustHeightToLine(false);
    obj.anotacoes4Part:setMargins({left=5});

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.anotacoes4Part);
    obj.label230:setAlign("top");
    obj.label230:setHeight(25);
    obj.label230:setText("ANOTAÇÕES");
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.anotacoes4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes4:setParent(obj.anotacoes4Part);
    obj.anotacoes4:setAlign("top");
    obj.anotacoes4:setField("anotacoes4");
    obj.anotacoes4:setHeight(52);
    obj.anotacoes4:setName("anotacoes4");

    obj.anotacoes5Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes5Part:setParent(obj.flowLayout3);
    obj.anotacoes5Part:setMinWidth(300);
    obj.anotacoes5Part:setMaxWidth(600);
    obj.anotacoes5Part:setMinScaledWidth(280);
    obj.anotacoes5Part:setName("anotacoes5Part");
    obj.anotacoes5Part:setAdjustHeightToLine(false);
    obj.anotacoes5Part:setMargins({left=5});

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.anotacoes5Part);
    obj.label231:setAlign("top");
    obj.label231:setHeight(25);
    obj.label231:setText("ANOTAÇÕES");
    obj.label231:setHorzTextAlign("center");
    obj.label231:setName("label231");

    obj.anotacoes5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes5:setParent(obj.anotacoes5Part);
    obj.anotacoes5:setAlign("top");
    obj.anotacoes5:setField("anotacoes5");
    obj.anotacoes5:setHeight(52);
    obj.anotacoes5:setName("anotacoes5");

    obj.anotacoes6Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes6Part:setParent(obj.flowLayout3);
    obj.anotacoes6Part:setMinWidth(300);
    obj.anotacoes6Part:setMaxWidth(600);
    obj.anotacoes6Part:setMinScaledWidth(280);
    obj.anotacoes6Part:setName("anotacoes6Part");
    obj.anotacoes6Part:setAdjustHeightToLine(false);
    obj.anotacoes6Part:setMargins({left=5});

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.anotacoes6Part);
    obj.label232:setAlign("top");
    obj.label232:setHeight(25);
    obj.label232:setText("ANOTAÇÕES");
    obj.label232:setHorzTextAlign("center");
    obj.label232:setName("label232");

    obj.anotacoes6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes6:setParent(obj.anotacoes6Part);
    obj.anotacoes6:setAlign("top");
    obj.anotacoes6:setField("anotacoes6");
    obj.anotacoes6:setHeight(52);
    obj.anotacoes6:setName("anotacoes6");

    obj.anotacoes7Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes7Part:setParent(obj.flowLayout3);
    obj.anotacoes7Part:setMinWidth(300);
    obj.anotacoes7Part:setMaxWidth(600);
    obj.anotacoes7Part:setMinScaledWidth(280);
    obj.anotacoes7Part:setName("anotacoes7Part");
    obj.anotacoes7Part:setAdjustHeightToLine(false);
    obj.anotacoes7Part:setMargins({left=5});

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.anotacoes7Part);
    obj.label233:setAlign("top");
    obj.label233:setHeight(25);
    obj.label233:setText("ANOTAÇÕES");
    obj.label233:setHorzTextAlign("center");
    obj.label233:setName("label233");

    obj.anotacoes7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes7:setParent(obj.anotacoes7Part);
    obj.anotacoes7:setAlign("top");
    obj.anotacoes7:setField("anotacoes7");
    obj.anotacoes7:setHeight(52);
    obj.anotacoes7:setName("anotacoes7");

    obj.anotacoes8Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes8Part:setParent(obj.flowLayout3);
    obj.anotacoes8Part:setMinWidth(300);
    obj.anotacoes8Part:setMaxWidth(600);
    obj.anotacoes8Part:setMinScaledWidth(280);
    obj.anotacoes8Part:setName("anotacoes8Part");
    obj.anotacoes8Part:setAdjustHeightToLine(false);
    obj.anotacoes8Part:setMargins({left=5});

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.anotacoes8Part);
    obj.label234:setAlign("top");
    obj.label234:setHeight(25);
    obj.label234:setText("ANOTAÇÕES");
    obj.label234:setHorzTextAlign("center");
    obj.label234:setName("label234");

    obj.anotacoes8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes8:setParent(obj.anotacoes8Part);
    obj.anotacoes8:setAlign("top");
    obj.anotacoes8:setField("anotacoes8");
    obj.anotacoes8:setHeight(52);
    obj.anotacoes8:setName("anotacoes8");

    obj.anotacoes9Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes9Part:setParent(obj.flowLayout3);
    obj.anotacoes9Part:setMinWidth(300);
    obj.anotacoes9Part:setMaxWidth(600);
    obj.anotacoes9Part:setMinScaledWidth(280);
    obj.anotacoes9Part:setName("anotacoes9Part");
    obj.anotacoes9Part:setAdjustHeightToLine(false);
    obj.anotacoes9Part:setMargins({left=5});

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.anotacoes9Part);
    obj.label235:setAlign("top");
    obj.label235:setHeight(25);
    obj.label235:setText("ANOTAÇÕES");
    obj.label235:setHorzTextAlign("center");
    obj.label235:setName("label235");

    obj.anotacoes9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes9:setParent(obj.anotacoes9Part);
    obj.anotacoes9:setAlign("top");
    obj.anotacoes9:setField("anotacoes9");
    obj.anotacoes9:setHeight(52);
    obj.anotacoes9:setName("anotacoes9");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Creditos");
    obj.tab5:setName("tab5");

    obj.frmFichaRPGmeister11_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab5);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			local function findAllControls()
				local controlsList = {self};
				recursiveFindControls(self, controlsList);
				
				return controlsList;
			end;

			local function filterByClass(className, controls)
				local controlsFromClass = {};

				for i=1, #controls, 1 do
					if controls[i]:getClassName() == className then
						controlsFromClass[#controlsFromClass + 1] = controls[i];
					end;
				end;

				return controlsFromClass;
			end;

			local function findClass(className)
				local controls = findAllControls();
				return filterByClass(className, controls);
			end;

		


    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox4);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(600);
    obj.image2:setHeight(600);
    obj.image2:setSRC("/FichaNave/images/RPGmeister.jpg");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout223 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.scrollBox4);
    obj.layout223:setLeft(620);
    obj.layout223:setTop(10);
    obj.layout223:setWidth(200);
    obj.layout223:setHeight(220);
    obj.layout223:setName("layout223");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout223);
    obj.rectangle77:setAlign("client");
    obj.rectangle77:setColor("black");
    obj.rectangle77:setXradius(15);
    obj.rectangle77:setYradius(15);
    obj.rectangle77:setCornerType("round");
    obj.rectangle77:setName("rectangle77");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout223);
    obj.label236:setLeft(0);
    obj.label236:setTop(10);
    obj.label236:setWidth(200);
    obj.label236:setHeight(20);
    obj.label236:setText("Programador: Vinny (Ambesek)");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setName("label236");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout223);
    obj.label237:setLeft(0);
    obj.label237:setTop(170);
    obj.label237:setWidth(200);
    obj.label237:setHeight(20);
    obj.label237:setText("Ficha feita para a mesa: ");
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout223);
    obj.label238:setLeft(0);
    obj.label238:setTop(195);
    obj.label238:setWidth(200);
    obj.label238:setHeight(20);
    obj.label238:setText("StarTech");
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.layout224 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout224:setParent(obj.scrollBox4);
    obj.layout224:setLeft(620);
    obj.layout224:setTop(240);
    obj.layout224:setWidth(200);
    obj.layout224:setHeight(150);
    obj.layout224:setName("layout224");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout224);
    obj.rectangle78:setLeft(0);
    obj.rectangle78:setTop(0);
    obj.rectangle78:setWidth(200);
    obj.rectangle78:setHeight(150);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout224);
    obj.label239:setLeft(0);
    obj.label239:setTop(10);
    obj.label239:setWidth(80);
    obj.label239:setHeight(20);
    obj.label239:setText("Tema:");
    obj.label239:setHorzTextAlign("center");
    obj.label239:setName("label239");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout224);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout224);
    obj.dataLink23:setField("theme");
    obj.dataLink23:setDefaultValue("Escuro");
    obj.dataLink23:setName("dataLink23");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout224);
    obj.label240:setLeft(0);
    obj.label240:setTop(35);
    obj.label240:setWidth(90);
    obj.label240:setHeight(20);
    obj.label240:setText("Cores: ");
    obj.label240:setHorzTextAlign("center");
    obj.label240:setName("label240");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout224);
    obj.label241:setLeft(0);
    obj.label241:setTop(60);
    obj.label241:setWidth(90);
    obj.label241:setHeight(20);
    obj.label241:setText("Fundo ");
    obj.label241:setHorzTextAlign("center");
    obj.label241:setName("label241");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout224);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout224);
    obj.dataLink24:setField("colorBackground");
    obj.dataLink24:setDefaultValue("#000000");
    obj.dataLink24:setName("dataLink24");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout224);
    obj.label242:setLeft(0);
    obj.label242:setTop(85);
    obj.label242:setWidth(90);
    obj.label242:setHeight(20);
    obj.label242:setText("Linhas ");
    obj.label242:setHorzTextAlign("center");
    obj.label242:setName("label242");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout224);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout224);
    obj.dataLink25:setField("colorStroke");
    obj.dataLink25:setDefaultValue("#FFFFFF");
    obj.dataLink25:setName("dataLink25");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout224);
    obj.label243:setLeft(0);
    obj.label243:setTop(110);
    obj.label243:setWidth(90);
    obj.label243:setHeight(20);
    obj.label243:setText("Fonte ");
    obj.label243:setHorzTextAlign("center");
    obj.label243:setName("label243");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout224);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout224);
    obj.dataLink26:setField("colorFont");
    obj.dataLink26:setDefaultValue("#FFFFFF");
    obj.dataLink26:setName("dataLink26");

    obj.layout225 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout225:setParent(obj.scrollBox4);
    obj.layout225:setLeft(830);
    obj.layout225:setTop(0);
    obj.layout225:setWidth(400);
    obj.layout225:setHeight(350);
    obj.layout225:setName("layout225");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout225);
    obj.rectangle79:setAlign("client");
    obj.rectangle79:setColor("black");
    obj.rectangle79:setName("rectangle79");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout225);
    obj.label244:setLeft(0);
    obj.label244:setTop(0);
    obj.label244:setWidth(400);
    obj.label244:setHeight(20);
    obj.label244:setText("ANOTAÇÕES DO MESTRE");
    obj.label244:setHorzTextAlign("center");
    obj.label244:setName("label244");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout225);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(320);
    obj.textEditor4:setField("anotacoes_do_mestre");
    obj.textEditor4:setName("textEditor4");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.scrollBox4);
    obj.label245:setLeft(630);
    obj.label245:setTop(400);
    obj.label245:setWidth(200);
    obj.label245:setHeight(20);
    obj.label245:setText("SUA VERSÃO:");
    obj.label245:setField("versionInstalled");
    obj.label245:setName("label245");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.scrollBox4);
    obj.label246:setLeft(630);
    obj.label246:setTop(420);
    obj.label246:setWidth(200);
    obj.label246:setHeight(20);
    obj.label246:setText("VERSÃO ATUAL:");
    obj.label246:setField("versionDownloaded");
    obj.label246:setName("label246");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.scrollBox4);
    obj.checkBox11:setLeft(620);
    obj.checkBox11:setTop(440);
    obj.checkBox11:setWidth(200);
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setField("noUpdate");
    obj.checkBox11:setText("Não pedir para atualizar.");
    obj.checkBox11:setName("checkBox11");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox4);
    obj.button11:setLeft(620);
    obj.button11:setTop(475);
    obj.button11:setWidth(100);
    obj.button11:setText("Change Log");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox4);
    obj.button12:setLeft(730);
    obj.button12:setTop(475);
    obj.button12:setWidth(100);
    obj.button12:setText("Atualizar");
    obj.button12:setName("button12");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.scrollBox4);
    obj.label247:setLeft(620);
    obj.label247:setTop(525);
    obj.label247:setWidth(120);
    obj.label247:setHeight(20);
    obj.label247:setText("CONHEÇA A MESA:");
    obj.label247:setFontSize(11);
    obj.label247:setName("label247");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox4);
    obj.button13:setLeft(730);
    obj.button13:setTop(525);
    obj.button13:setWidth(100);
    obj.button13:setText("RPGmeister");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox4);
    obj.button14:setLeft(840);
    obj.button14:setTop(525);
    obj.button14:setWidth(100);
    obj.button14:setText("StarTech");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox4);
    obj.button15:setLeft(730);
    obj.button15:setTop(550);
    obj.button15:setWidth(100);
    obj.button15:setHeight(20);
    obj.button15:setText("Exportar Ficha");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox4);
    obj.button16:setLeft(840);
    obj.button16:setTop(550);
    obj.button16:setWidth(100);
    obj.button16:setHeight(20);
    obj.button16:setText("Importar Ficha");
    obj.button16:setName("button16");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão(" .. info.version .. ") da Ficha Starfinder. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end,
                        "checkForModification");
        end, obj);

    obj._e_event1 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatarComp);
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclReatores:append();
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclExpansao:append();
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclInv:append();
        end, obj);

    obj._e_event5 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local tamanho = tonumber(sheet.tamanho) or 1;
            
            			-- Bonus CA e TL
            			local ca_tl = {2, 1, 0, -1, -2, -4, -8};
            			sheet.ca_tamanho = ca_tl[tamanho];
            
            			-- Núcleos de Energia disponiveis
            			local reatores = NDB.getChildNodes(sheet.listaReatores);
            			for i=1, #reatores, 1 do
            				reatores[i].tamanho = tamanho;
            			end;
            
            			-- Propulsores disponiveis
            
            			local items = {n1_6="Mn6",n1_8="Mn8",n1_10="Mn10",n1_12="Mn12",n1_14="Mn14",n2_6="P6",n2_8="P8",n2_10="P10",n2_12="P12",n3_4="M4",n3_6="M6",n3_8="M8",n3_10="M10",n3_12="M12",n4_4="G4",n4_6="G6",n4_8="G8",n4_10="G10",n5_4="E4",n5_6="E6",n5_8="E8",n5_10="E10",n6_4="I4",n6_6="I6",n6_8="I8",n7_4="C4",n7_6="C6",n7_8="C8"};
            			local values = {};
            			local current = items["n"..(sheet.propulsor or "")];
            
            			if tamanho == 1 then
            				-- Mn
            				items = {'Mn6','Mn8','Mn10','Mn12','Mn14'};
            				values = {'1_6','1_8','1_10','1_12','1_14'};
            			elseif tamanho == 2 then
            				-- P
            				items = {'P6','P8','P10','P12'};
            				values = {'2_6','2_8','2_10','2_12'};
            			elseif tamanho == 3 then
            				-- M
            				items = {'M4','M6','M8','M10','M12'};
            				values = {'3_4','3_6','3_8','3_10','3_12'};
            
            			elseif tamanho == 4 then
            				-- G
            				items = {'G4','G6','G8','G10'};
            				values = {'4_4','4_6','4_8','4_10'};
            			elseif tamanho == 5 then
            				-- E
            				items = {'E4','E6','E8','E10'};
            				values = {'5_4','5_6','5_8','5_10'};
            			elseif tamanho == 6 then
            				-- I
            				items = {'I4','I6','I8'};
            				values = {'6_4','6_6','6_8'};
            			elseif tamanho == 7 then
            				-- C
            				items = {'C4','C6','C8'};
            				values = {'7_4','7_6','7_8'};
            			end;
            
            			self.propulsor.items = items;
            			self.propulsor.values = values;
            
            			self.propulsor.text = current;
            
            			-- FTL drive
            
            			local drive = tonumber(sheet.deriva) or 0;
            			items = {'-','Básico','Intenso','Maior','Superior','Ultra','KF'};
            			values = {};
            			current = items[drive+1];
            
            			if tamanho >= 1 and tamanho <=3 then
            				-- Mn, P, M
            				items = {'-','Básico','Intenso','Maior','Superior','Ultra'};
            				values = {'0','1','2','3','4','5'};
            			elseif tamanho == 4 then
            				-- G
            				items = {'-','Básico','Intenso','Maior','Superior'};
            				values = {'0','1','2','3','4'};
            			elseif tamanho == 5 then
            				-- E
            				items = {'-','Básico','Intenso','KF'};
            				values = {'0','1','2','6'};
            			elseif tamanho >= 6 then
            				-- I, C
            				items = {'-','Básico','KF'};
            				values = {'0','1','6'};
            			end;
            
            			self.deriva.items = items;
            			self.deriva.values = values;
            
            			self.deriva.text = current;
            
            			-- Plataforma
            
            			local plataforma = tonumber(sheet.deriva) or 0;
            			items = {'Generica', 'Corredora', 'Interceptadora', 'Caça', 'Ônibus', 'Cargueira Leve', 'Exploradora', 'Transporte', 'Contratorpedeira', 'Cargueira Pesada', 'Cargueira Massiva', 'Cruzadora', 'Transportadora', 'Nave de Batalha', 'Couraçada'};
            			values = {'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14'};
            			current = items[plataforma+1];
            
            			if tamanho == 1 then
            				-- Mn
            				items = {'Generica', 'Corredora', 'Interceptadora', 'Caça'};
            				values = {'0','1','2','3'};
            			elseif tamanho == 2 then
            				-- P
            				items = {'Generica', 'Ônibus', 'Cargueira Leve'};
            				values = {'0','4','5'};
            			elseif tamanho == 3 then
            				-- M
            				items = {'Generica','Exploradora', 'Transporte'};
            				values = {'0','6','7'};
            			elseif tamanho == 4 then
            				-- G
            				items = {'Generica', 'Contratorpedeira', 'Cargueira Pesada'};
            				values = {'0','8','9'};
            			elseif tamanho == 5 then
            				-- E
            				items = {'Generica', 'Cargueira Massiva', 'Cruzadora'};
            				values = {'0','10','11'};
            			elseif tamanho == 6 then
            				-- I
            				items = {'Generica', 'Transportadora', 'Nave de Batalha'};
            				values = {'0','12','13'};
            			elseif tamanho == 7 then
            				-- C
            				items = {'Generica','Couraçada'};
            				values = {'0','14'};
            			end;
            
            			self.plataforma.items = items;
            			self.plataforma.values = values;
            
            			self.plataforma.text = current;
        end, obj);

    obj._e_event6 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local tamanho = tonumber(sheet.tamanho) or 1;
            			local plataforma = tonumber(sheet.plataforma) or 0;
            			local armadura_curva = tonumber(sheet.armadura_curva) or 0;
            
            			if plataforma == 0 then
            				local manobra = {"Perfeita (Curva ", "Boa (Curva ", "Mediana (Curva ", "Mediana (Curva ", "Ruim (Curva ", "Ruim (Curva ", "Desajeitada (Curva "};
            				local curva = {0,1,2,2,3,3,4};
            				local pilotagem = {2,1,0,0,-1,-1,-2};
            				local pc = {30,40,70,150,180,280,400};
            				local incremento = {5,10,15,20,25,40,50};
            				local ld = {0,0,0,0,5,10,15};
            
            				sheet.manobra = manobra[tamanho] .. (curva[tamanho]+armadura_curva) .. ")";
            				sheet.plataforma_pilotagem = pilotagem[tamanho];
            				sheet.casco_base = pc[tamanho];
            				sheet.casco_incremento = incremento[tamanho];
            				sheet.casco_ld = ld[tamanho];
            				sheet.expansaoMax = 0;
            				sheet.plataforma_tripMin = 1;
            				sheet.plataforma_tripMax = 1;
            				sheet.plataforma_pf = 0;
            			else
            				local manobra = {"Perfeita (Curva ", "Perfeita (Curva ", "Boa (Curva ", "Perfeita (Curva ", "Boa (Curva ", "Boa (Curva ", "Mediana (Curva ", "Mediana (Curva ", "Mediana (Curva ", "Ruim (Curva ", "Mediana (Curva ", "Ruim (Curva ", "Mediana (Curva ", "Desajeitada (Curva "};
            				local curva = {0,0,1,0,1,1,2,2,2,3,2,3,2,4}
            				local pilotagem = {2, 2, 1, 2, 1, 1, 0, 0, 0, -1, 0, -1, 0, -2};
            				local pc = {20,30,35,35,40,55,70,150,120,160,180,240,280,400};
            				local incremento = {5,5,5,5,10,10,15,20,20,20,25,30,40,50};
            				local ld = {0,0,0,0,0,0,0,0,0,5,5,10,10,15};
            				local expansao = {0,0,0,3,6,4,5,4,8,10,6,10,8,20};
            				local tripMin = {1,1,1,1,1,1,1,6,6,20,20,75,100,125};
            				local tripMax = {1,1,2,4,6,6,6,20,20,50,100,200,300,500};
            				local pf = {4,6,8,6,10,12,15,30,40,55,60,120,150,200};
            
            				sheet.manobra = manobra[plataforma] .. (curva[tamanho]+armadura_curva) .. ")";
            				sheet.plataforma_pilotagem = pilotagem[plataforma];
            				sheet.casco_base = pc[plataforma];
            				sheet.casco_incremento = incremento[plataforma];
            				sheet.casco_ld = ld[plataforma];
            				sheet.expansaoMax = expansao[plataforma];
            				sheet.plataforma_tripMin = tripMin[plataforma];
            				sheet.plataforma_tripMax = tripMax[plataforma];
            				sheet.plataforma_pf = pf[plataforma];
            
            			end;
        end, obj);

    obj._e_event7 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local propulsor = sheet.propulsor or "";
            
            			local velocidade = {n1_6="6",n1_8="8",n1_10="10",n1_12="12",n1_14="14",n2_6="6",n2_8="8",n2_10="10",n2_12="12",n3_4="4",n3_6="6",n3_8="8",n3_10="10",n3_12="12",n4_4="4",n4_6="6",n4_8="8",n4_10="10",n5_4="4",n5_6="6",n5_8="8",n5_10="10",n6_4="4",n6_6="6",n6_8="8",n7_4="4",n7_6="6",n7_8="8"};
            			local pilotagem = {n1_6="1",n1_8="0",n1_10="0",n1_12="-1",n1_14="-2",n2_6="1",n2_8="0",n2_10="0",n2_12="-1",n3_4="2",n3_6="1",n3_8="0",n3_10="0",n3_12="-1",n4_4="2",n4_6="1",n4_8="0",n4_10="0",n5_4="2",n5_6="1",n5_8="0",n5_10="0",n6_4="2",n6_6="1",n6_8="0",n7_4="2",n7_6="1",n7_8="0"};
            			local une = {n1_6="20",n1_8="25",n1_10="30",n1_12="35",n1_14="40",n2_6="30",n2_8="40",n2_10="50",n2_12="60",n3_4="40",n3_6="50",n3_8="60",n3_10="70",n3_12="80",n4_4="60",n4_6="80",n4_8="100",n4_10="120",n5_4="80",n5_6="120",n5_8="140",n5_10="160",n6_4="120",n6_6="180",n6_8="240",n7_4="200",n7_6="300",n7_8="400"};
            			local pf = {n1_6="3",n1_8="4",n1_10="5",n1_12="6",n1_14="7",n2_6="3",n2_8="4",n2_10="5",n2_12="6",n3_4="2",n3_6="3",n3_8="4",n3_10="5",n3_12="6",n4_4="4",n4_6="6",n4_8="8",n4_10="10",n5_4="4",n5_6="6",n5_8="8",n5_10="10",n6_4="8",n6_6="12",n6_8="16",n7_4="8",n7_6="12",n7_8="16"};
            			local blocos = {n1_6="4",n1_8="8",n1_10="12",n1_12="16",n1_14="20",n2_6="54",n2_8="108",n2_10="162",n2_12="216",n3_4="540",n3_6="1080",n3_8="1620",n3_10="2160",n3_12="2700",n4_4="10240",n4_6="20480",n4_8="30720",n4_10="40960",n5_4="160000",n5_6="320000",n5_8="480000",n5_10="640000",n6_4="6750000",n6_6="13500000",n6_8="20250000",n7_4="540000000",n7_6="1080000000",n7_8="1620000000"};
            			local tripMin = {n1_6="0",n1_8="0",n1_10="0",n1_12="0",n1_14="0",n2_6="0",n2_8="0",n2_10="0",n2_12="0",n3_4="1",n3_6="2",n3_8="3",n3_10="4",n3_12="5",n4_4="3",n4_6="6",n4_8="9",n4_10="12",n5_4="40",n5_6="60",n5_8="80",n5_10="100",n6_4="75",n6_6="125",n6_8="175",n7_4="100",n7_6="150",n7_8="200"};
            			local tripMax = {n1_6="0",n1_8="0",n1_10="0",n1_12="0",n1_14="0",n2_6="1",n2_8="1",n2_10="1",n2_12="1",n3_4="5",n3_6="10",n3_8="15",n3_10="20",n3_12="25",n4_4="15",n4_6="30",n4_8="45",n4_10="60",n5_4="200",n5_6="300",n5_8="400",n5_10="500",n6_4="375",n6_6="625",n6_8="875",n7_4="500",n7_6="750",n7_8="1000"};
            
            			sheet.velocidade = velocidade["n"..propulsor];
            			sheet.propulsor_pilotagem = pilotagem["n"..propulsor];
            			sheet.propulsor_une = une["n"..propulsor];
            			sheet.propulsor_pf = pf["n"..propulsor];
            			sheet.propulsor_blocos = blocos["n"..propulsor];
            			sheet.propulsor_tripMin = tripMin["n"..propulsor];
            			sheet.propulsor_tripMax = tripMax["n"..propulsor];
        end, obj);

    obj._e_event8 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local armadura = tonumber(sheet.armadura) or 0;
            			local tamanho = tonumber(sheet.tamanho) or 1;
            
            			local tm = {0,0,0,0,0,-1,-1,-1,-1,-2,-2,-2,-3,-3,-3,-4};
            			local curva = {0,0,0,0,0,0,0,0,0,1,1,1,2,2,2,3};
            			local pf = {0,1,2,3,5,7,9,12,15,18,21,25,30,35,40,45};
            			local blocos = {{0,1,2,3,5,7,9,12,15,18,21,25,30,35,40,45},{0,8,16,24,40,56,72,96,120,144,168,200,240,280,320,360},{0,27,54,81,135,189,243,324,405,486,567,675,810,945,1080,1215},{0,64,128,192,320,448,576,768,960,1152,1344,1600,1920,2240,2560,2880},{0,125,250,375,625,875,1125,1500,1875,2250,2625,3125,3750,4375,5000,5625},{0,216,432,648,1080,1512,1944,2592,3240,3888,4536,5400,6480,7560,8640,9720},{0,343,686,1029,1715,2401,3087,4116,5145,6174,7203,8575,10290,12005,13720,15435}}
            
            			sheet.ca_armadura = armadura;
            
            			sheet.tm_armadura = tm[armadura+1];
            			sheet.armadura_curva = curva[armadura+1];
            			sheet.armadura_pf = pf[armadura+1] * tamanho;
            			sheet.armadura_blocos = blocos[tamanho][armadura+1];
        end, obj);

    obj._e_event9 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local computador = sheet.computador or "0_0";
            			local tamanho = tonumber(sheet.tamanho) or 1;
            
            			local nodulos = {n0_0="0",n1_1="1",n2_1="2",n3_1="3",n4_1="4",n1_2="1",n2_2="2",n3_2="3",n4_2="4",n1_3="1",n2_3="2",n3_3="3",n4_3="4",n1_4="1",n2_4="2",n3_4="3",n1_5="1",n2_5="2",n3_5="3",n1_6="1",n2_6="2",n1_7="1",n2_7="2",n1_8="1",n2_8="2",n1_9="1",n2_9="2",n1_10="1",n2_10="2"};
            			local bonus = {n0_0="0",n1_1="1",n2_1="1",n3_1="1",n4_1="1",n1_2="2",n2_2="2",n3_2="2",n4_2="2",n1_3="3",n2_3="3",n3_3="3",n4_3="3",n1_4="4",n2_4="4",n3_4="4",n1_5="5",n2_5="5",n3_5="5",n1_6="6",n2_6="6",n1_7="7",n2_7="7",n1_8="8",n2_8="8",n1_9="9",n2_9="9",n1_10="10",n2_10="10"};
            
            			local nodulo = (tonumber(nodulos["n"..computador]) or 0);
            			local mod = (tonumber(bonus["n"..computador]) or 0)
            			local une = 0;
            			if mod > 0 then 
            				une = (mod+1)*5;
            			end;
            
            			sheet.computador_nodulos = nodulo;
            			sheet.computador_bonus = mod;
            			sheet.computador_une = une;
            			sheet.computador_pf = nodulo*mod*mod;
            			sheet.computador_blocos = tamanho*tamanho*tamanho*nodulo;
        end, obj);

    obj._e_event10 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local contramedidas = tonumber(sheet.contramedidas) or 0;
            			local tamanho = tonumber(sheet.tamanho) or 1;
            			local tm_armadura = tonumber(sheet.tm_armadura) or 0;
            
            			local une = {0,1,1,2,3,4,5,7,9,11,13,16,20,25,32,45};
            			local pf = {0,2,3,4,6,8,11,14,18,22,27,33,40,50,65,90};
            			local blocos = {{0,1,2,3,5,7,9,12,15,18,21,25,30,35,40,45},{0,8,16,24,40,56,72,96,120,144,168,200,240,280,320,360},{0,27,54,81,135,189,243,324,405,486,567,675,810,945,1080,1215},{0,64,128,192,320,448,576,768,960,1152,1344,1600,1920,2240,2560,2880},{0,125,250,375,625,875,1125,1500,1875,2250,2625,3125,3750,4375,5000,5625},{0,216,432,648,1080,1512,1944,2592,3240,3888,4536,5400,6480,7560,8640,9720},{0,343,686,1029,1715,2401,3087,4116,5145,6174,7203,8575,10290,12005,13720,15435}}
            
            			sheet.tm_contramedidas = contramedidas + tm_armadura;
            
            			sheet.contramedidas_une = une[contramedidas+1];
            			sheet.contramedidas_pf = pf[contramedidas+1];
            			sheet.contramedidas_blocos = blocos[tamanho][contramedidas+1];
        end, obj);

    obj._e_event11 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local escudo_total = (tonumber(sheet.escudo_proa) or 0) + 
            								 (tonumber(sheet.escudo_popa) or 0) + 
            								 (tonumber(sheet.escudo_bombordo) or 0) + 
            								 (tonumber(sheet.escudo_estibordo) or 0);
            			local escudo = tonumber(sheet.escudo) or 0;
            			local tamanho = tonumber(sheet.tamanho) or 1;
            
            			local pe = {0,10,20,30,40,50,60,70,80,90,100,120,140,160,200,240,280,320,360,420,480,540,600};
            			local regen = {0,1,1,1,1,1,2,2,2,4,4,4,8,8,8,16,16,16,32,32,32,64,64};
            			local une = {0,5,10,15,15,20,20,25,30,30,30,35,40,45,50,55,60,70,80,90,110,130,160};
            			local pf = {0,2,3,4,5,6,8,10,12,13,15,17,18,20,22,23,25,27,28,30,32,35,40};
            			local blocos = {{0,2,3,4,5,6,8,10,12,13,15,17,18,20,22,23,25,27,28,30,32,35,40},{0,16,24,32,40,48,64,80,96,104,120,136,144,160,176,184,200,216,224,240,256,280,320},{0,54,81,108,135,162,216,270,324,351,405,459,486,540,594,621,675,729,756,810,864,945,1080},{0,128,192,256,320,384,512,640,768,832,960,1088,1152,1280,1408,1472,1600,1728,1792,1920,2048,2240,2560},{0,250,375,500,625,750,1000,1250,1500,1625,1875,2125,2250,2500,2750,2875,3125,3375,3500,3750,4000,4375,5000},{0,432,648,864,1080,1296,1728,2160,2592,2808,3240,3672,3888,4320,4752,4968,5400,5832,6048,6480,6912,7560,8640},{0,686,1029,1372,1715,2058,2744,3430,4116,4459,5145,5831,6174,6860,7546,7889,8575,9261,9604,10290,10976,12005,13720}};
            			local tripMin = {0,1,4,16,32,64,128};
            			local tripMax = {1,4,8,32,64,128,256};
            
            			if escudo == 0 then
            				sheet.escudo_total = escudo_total .. " (0)";
            				sheet.escudo_une = 0;
            				sheet.escudo_pf = 0;
            				sheet.escudo_blocos = 0;
            				sheet.escudo_tripMin = 0;
            				sheet.escudo_tripMax = 0;
            			else
            				sheet.escudo_total = escudo_total .. " (" .. regen[escudo+1] .. ")";
            				sheet.escudo_une = une[escudo+1];
            				sheet.escudo_pf = pf[escudo+1];
            				sheet.escudo_blocos = blocos[tamanho][escudo+1];
            				sheet.escudo_tripMin = tripMin[tamanho];
            				sheet.escudo_tripMax = tripMax[tamanho];
            			end;
        end, obj);

    obj._e_event12 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local deriva = tonumber(sheet.deriva) or 0;
            			local tamanho = tonumber(sheet.tamanho) or 1;
            
            			local une = {75,100,150,175,200};
            			local pf = {2,5,10,15,20}
            
            			if deriva == 0 then
            				sheet.deriva_class = 0;
            				sheet.deriva_une = 0;
            				sheet.deriva_pf = 0;
            				sheet.deriva_blocos = 0;
            				sheet.deriva_tripMin = 0;
            				sheet.deriva_tripMax = 0;
            			elseif deriva < 6 then
            				sheet.deriva_class = deriva;
            				sheet.deriva_une = une[deriva];
            				sheet.deriva_pf = (tonumber(pf[deriva]) or 0) * tamanho;
            				sheet.deriva_blocos = 0;
            				sheet.deriva_tripMin = 0;
            				sheet.deriva_tripMax = 0;
            			else
            				local blocos = {0,0,0,0,100000,10000000,100000000};
            				local tripMin = {0,0,0,0,50,120,250};
            				local tripMax = {0,0,0,0,250,600,1250};
            				sheet.deriva_class = "30 a.l.";
            				sheet.deriva_une = 0;
            				sheet.deriva_pf = 20 * tamanho;
            				sheet.deriva_blocos = blocos[tamanho];
            				sheet.deriva_tripMin = tripMin[tamanho];
            				sheet.deriva_tripMax = tripMax[tamanho];
            			end;
        end, obj);

    obj._e_event13 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local sensor = tonumber(sheet.sensor) or 0;
            
            			local mod = {0,2,4,0,2,4,0,2,4};
            			local pf = {2,3,4,3,5,8,6,10,14}
            
            			if sensor == 0 then
            				sheet.sensor_mod = -2;
            				sheet.sensor_pf = 1;
            			else
            				sheet.sensor_mod = mod[sensor];
            				sheet.sensor_pf = pf[sensor];
            			end;
            
            			self.sensor.hint = (self.sensor.text or "") .. ", modificador: " .. (sheet.sensor_mod or "");
        end, obj);

    obj._e_event14 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local base = tonumber(sheet.casco_base) or 0;
            			local incremento = tonumber(sheet.casco_incremento) or 0;
            			local armadura = tonumber(sheet.armadura) or 0;
            			local ranque = tonumber(sheet.ranque) or 0;
            
            			local casco = base + math.floor(ranque/4) * incremento;
            			if sheet.opt_pc then
            				casco = math.floor(casco * (armadura+10)*10/100);
            			end;
            
            			sheet.casco = casco;
            			sheet.casco_lc = math.floor(casco/5);
        end, obj);

    obj._e_event15 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local piloto = tonumber(sheet.ca_piloto) or 0;
            			local armadura = tonumber(sheet.ca_armadura) or 0;
            			local tamanho = tonumber(sheet.ca_tamanho) or 0;
            			local outros = tonumber(sheet.ca_outros) or 0;
            			local contramedidas = tonumber(sheet.tm_contramedidas) or 0;
            			local extra = tonumber(sheet.tm_outros) or 0;
            
            			sheet.ca = 10 + piloto + armadura + tamanho + outros;
            			sheet.tm = 10 + piloto + contramedidas + tamanho + extra;
        end, obj);

    obj._e_event16 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local ranque = tonumber(sheet.ranque) or 0;
            
            			if ranque < 0.26 then
            				sheet.fabricacaoMax = 25;
            			elseif ranque < 0.35 then
            				sheet.fabricacaoMax = 30;
            			elseif ranque < 0.51 then
            				sheet.fabricacaoMax = 40;
            			elseif ranque > 20 then
            				sheet.fabricacaoMax = 1000 + (ranque-20) * 100;
            			else
            				local pf = {55,75,95,115,135,155,180,205,230,270,310,350,400,450,500,600,700,800,900,1000};
            				sheet.fabricacaoMax = pf[ranque];
            			end;
        end, obj);

    obj._e_event17 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local pc = math.max( math.floor((tonumber(sheet.ranque) or 1)/2), 1);
            			local tamanho = (tonumber(sheet.tamanho) or 1);
            			local fabricacaoMin =   (tonumber(sheet.plataforma_pf) or 0) +
            									(tonumber(sheet.propulsor_pf) or 0) +
            									(tonumber(sheet.armadura_pf) or 0) +
            									(tonumber(sheet.computador_pf) or 0) +
            									(tonumber(sheet.contramedidas_pf) or 0) +
            									(tonumber(sheet.escudo_pf) or 0) +
            									(tonumber(sheet.deriva_pf) or 0) +
            									(tonumber(sheet.sensor_pf) or 0) +
            									(tonumber(sheet.reator_pf) or 0) +
            									(tonumber(sheet.weapon_pf) or 0) +
            									(tonumber(sheet.expansao_pf) or 0) +
            									(tonumber(sheet.sec_hack) or 0)*3 + 
            									(tonumber(sheet.sec_choque) or 0)*pc;
            
            			if sheet.sec_tranca then
            				fabricacaoMin = fabricacaoMin + 5;
            			end;
            			if sheet.sec_autodest then
            				fabricacaoMin = fabricacaoMin + 5*tamanho;
            			end;
            			if sheet.sec_alarm then
            				fabricacaoMin = fabricacaoMin + pc;
            			end;
            			if sheet.sec_lockout then
            				fabricacaoMin = fabricacaoMin + pc;
            			end;
            			if sheet.sec_shell then
            				fabricacaoMin = fabricacaoMin + pc;
            			end;
            			if sheet.sec_wipe then
            				fabricacaoMin = fabricacaoMin + pc;
            			end;
            			if sheet.sec_feedback then
            				fabricacaoMin = fabricacaoMin + pc;
            			end;
            			if sheet.sec_firewall then
            				fabricacaoMin = fabricacaoMin + pc;
            			end;
            
            			sheet.fabricacaoMin = fabricacaoMin;
        end, obj);

    obj._e_event18 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			sheet.energiaMin =   (tonumber(sheet.propulsor_une) or 0) +
            									(tonumber(sheet.computador_une) or 0) +
            									(tonumber(sheet.contramedidas_une) or 0) +
            									(tonumber(sheet.escudo_une) or 0) +
            									(tonumber(sheet.deriva_une) or 0) +
            									(tonumber(sheet.weapon_une) or 0) +
            									(tonumber(sheet.expansao_une) or 0);
        end, obj);

    obj._e_event19 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			sheet.blocosMax =   (tonumber(sheet.dimensoes_a) or 0) *
            									(tonumber(sheet.dimensoes_b) or 0) *
            									(tonumber(sheet.dimensoes_c) or 0);
        end, obj);

    obj._e_event20 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local blocosMin =  (tonumber(sheet.propulsor_blocos) or 0) +
            								(tonumber(sheet.armadura_blocos) or 0) +
            								(tonumber(sheet.computador_blocos) or 0) +
            								(tonumber(sheet.contramedidas_blocos) or 0) +
            								(tonumber(sheet.escudo_blocos) or 0) +
            								(tonumber(sheet.deriva_blocos) or 0) +
            								(tonumber(sheet.reator_blocos) or 0) +
            								(tonumber(sheet.weapon_blocos) or 0) +
            								(tonumber(sheet.expansao_blocos) or 0);
            
            			-- showMessage(blocosMin .. " (" .. (blocosMin*2) .. ")";);
            			-- blocosMin .. " (" .. (blocosMin*2) .. ")";
            			sheet.blocosMin = blocosMin*2;
        end, obj);

    obj._e_event21 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local tripMin = (tonumber(sheet.plataforma_tripMin) or 0);
            
            			if sheet.opt_trip then
            				tripMin =   (tonumber(sheet.propulsor_tripMin) or 0) +
            							(tonumber(sheet.escudo_tripMin) or 0) +
            							(tonumber(sheet.deriva_tripMin) or 0) +
            							(tonumber(sheet.reator_tripMin) or 0) +
            							(tonumber(sheet.weapon_tripMin) or 0) +
            							(tonumber(sheet.expansao_tripMin) or 0) + tripMin
            			end;
            
            			sheet.tripulacaoMin = tripMin;
        end, obj);

    obj._e_event22 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local tripMax = (tonumber(sheet.plataforma_tripMax) or 0);
            
            			if sheet.opt_trip then
            				tripMax =   (tonumber(sheet.propulsor_tripMax) or 0) +
            							(tonumber(sheet.escudo_tripMax) or 0) +
            							(tonumber(sheet.deriva_tripMax) or 0) +
            							(tonumber(sheet.reator_tripMax) or 0) +
            							(tonumber(sheet.weapon_tripMax) or 0) +
            							(tonumber(sheet.expansao_tripMax) or 0) + tripMax
            			end;
            
            			sheet.tripulacaoMax = tripMax;
        end, obj);

    obj._e_event23 = obj.button4:addEventListener("onClick",
        function (_)
            self.campoProa:append();
        end, obj);

    obj._e_event24 = obj.campoProa:addEventListener("onResize",
        function (_)
            self.campoProaPart._recalcHeight();
        end, obj);

    obj._e_event25 = obj.campoProa:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelWeapon) or 0) - (tonumber(nodeB.nivelWeapon) or 0));
        end, obj);

    obj._e_event26 = obj.button5:addEventListener("onClick",
        function (_)
            self.campoPopa:append();
        end, obj);

    obj._e_event27 = obj.campoPopa:addEventListener("onResize",
        function (_)
            self.campoPopaPart._recalcHeight();
        end, obj);

    obj._e_event28 = obj.campoPopa:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelWeapon) or 0) - (tonumber(nodeB.nivelWeapon) or 0));
        end, obj);

    obj._e_event29 = obj.button6:addEventListener("onClick",
        function (_)
            self.campoBombordo:append();
        end, obj);

    obj._e_event30 = obj.campoBombordo:addEventListener("onResize",
        function (_)
            self.campoBombordoPart._recalcHeight();
        end, obj);

    obj._e_event31 = obj.campoBombordo:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelWeapon) or 0) - (tonumber(nodeB.nivelWeapon) or 0));
        end, obj);

    obj._e_event32 = obj.button7:addEventListener("onClick",
        function (_)
            self.campoEstibordo:append();
        end, obj);

    obj._e_event33 = obj.campoEstibordo:addEventListener("onResize",
        function (_)
            self.campoEstibordoPart._recalcHeight();
        end, obj);

    obj._e_event34 = obj.campoEstibordo:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelWeapon) or 0) - (tonumber(nodeB.nivelWeapon) or 0));
        end, obj);

    obj._e_event35 = obj.button8:addEventListener("onClick",
        function (_)
            self.campoTorreta:append();
        end, obj);

    obj._e_event36 = obj.campoTorreta:addEventListener("onResize",
        function (_)
            self.campoTorretaPart._recalcHeight();
        end, obj);

    obj._e_event37 = obj.campoTorreta:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelWeapon) or 0) - (tonumber(nodeB.nivelWeapon) or 0));
        end, obj);

    obj._e_event38 = obj.button9:addEventListener("onClick",
        function (_)
            self.campoAntipessoal:append();
        end, obj);

    obj._e_event39 = obj.campoAntipessoal:addEventListener("onResize",
        function (_)
            self.campoAntipessoalPart._recalcHeight();
        end, obj);

    obj._e_event40 = obj.campoAntipessoal:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelWeapon) or 0) - (tonumber(nodeB.nivelWeapon) or 0));
        end, obj);

    obj._e_event41 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclTripulantes:append();
        end, obj);

    obj._e_event42 = obj.rclTripulantes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.funcao) or 0) - (tonumber(nodeB.funcao) or 0));
        end, obj);

    obj._e_event43 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			sheet.trip_minTotal =  (tonumber(sheet.trip_min1) or 0) +
            									(tonumber(sheet.trip_min2) or 0) +
            									(tonumber(sheet.trip_min3) or 0) +
            									(tonumber(sheet.trip_min4) or 0) +
            									(tonumber(sheet.trip_min5) or 0) +
            									(tonumber(sheet.trip_min6) or 0) +
            									(tonumber(sheet.trip_min7) or 0);
        end, obj);

    obj._e_event44 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			sheet.trip_maxTotal =  (tonumber(sheet.trip_max1) or 0) +
            									(tonumber(sheet.trip_max2) or 0) +
            									(tonumber(sheet.trip_max3) or 0) +
            									(tonumber(sheet.trip_max4) or 0) +
            									(tonumber(sheet.trip_max5) or 0) +
            									(tonumber(sheet.trip_max6) or 0) +
            									(tonumber(sheet.trip_max7) or 0);
        end, obj);

    obj._e_event45 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			sheet.trip_atualTotal =  (tonumber(sheet.trip_atual1) or 0) +
            									(tonumber(sheet.trip_atual2) or 0) +
            									(tonumber(sheet.trip_atual3) or 0) +
            									(tonumber(sheet.trip_atual4) or 0) +
            									(tonumber(sheet.trip_atual5) or 0) +
            									(tonumber(sheet.trip_atual6) or 0) +
            									(tonumber(sheet.trip_atual7) or 0);
        end, obj);

    obj._e_event46 = obj.notes:addEventListener("onResize",
        function (_)
            fullResize()
        end, obj);

    obj._e_event47 = obj.anotacoes1:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event48 = obj.anotacoes1:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event49 = obj.anotacoes1:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event50 = obj.anotacoes1:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event51 = obj.anotacoes2:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event52 = obj.anotacoes2:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event53 = obj.anotacoes2:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event54 = obj.anotacoes2:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event55 = obj.anotacoes3:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event56 = obj.anotacoes3:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event57 = obj.anotacoes3:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event58 = obj.anotacoes3:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event59 = obj.anotacoes4:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event60 = obj.anotacoes4:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event61 = obj.anotacoes4:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event62 = obj.anotacoes4:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event63 = obj.anotacoes5:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event64 = obj.anotacoes5:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event65 = obj.anotacoes5:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event66 = obj.anotacoes5:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event67 = obj.anotacoes6:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event68 = obj.anotacoes6:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event69 = obj.anotacoes6:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event70 = obj.anotacoes6:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event71 = obj.anotacoes7:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event72 = obj.anotacoes7:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event73 = obj.anotacoes7:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event74 = obj.anotacoes7:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event75 = obj.anotacoes8:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event76 = obj.anotacoes8:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event77 = obj.anotacoes8:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event78 = obj.anotacoes8:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event79 = obj.anotacoes9:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event80 = obj.anotacoes9:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event81 = obj.anotacoes9:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event82 = obj.anotacoes9:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event83 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Claro" then
            						theme = "light";
            					else
            						theme = "dark";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event84 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event85 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            		            local horzLines = findClass("horzLine");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
            					for i=1, #horzLines, 1 do 
            						horzLines[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event86 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fontColor = sheet.colorFont or "#FFFFFF";
            
            					local controls = findAllControls();
            					
            					local edits = filterByClass("edit", controls);
            					for i=1, #edits, 1 do 
            						edits[i].fontColor = fontColor;
            					end;
            
            					local labels = filterByClass("label", controls);
            					for i=1, #labels, 1 do 
            						labels[i].fontColor = fontColor;
            					end;
            
            					local comboBoxs = filterByClass("comboBox", controls);
            					for i=1, #comboBoxs, 1 do 
            						comboBoxs[i].fontColor = fontColor;
            					end;
            
            					local textEditors = filterByClass("textEditor", controls);
            					for i=1, #textEditors, 1 do 
            						textEditors[i].fontColor = fontColor;
            					end;
            
            					local checkBoxs = filterByClass("checkBox", controls);
            					for i=1, #checkBoxs, 1 do 
            						checkBoxs[i].fontColor = fontColor;
            					end;
            
            					local buttons = filterByClass("button", controls);
            					for i=1, #buttons, 1 do 
            						buttons[i].fontColor = fontColor;
            					end;
        end, obj);

    obj._e_event87 = obj.button11:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/README.md')
        end, obj);

    obj._e_event88 = obj.button12:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true')
        end, obj);

    obj._e_event89 = obj.button13:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event90 = obj.button14:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=195975');
        end, obj);

    obj._e_event91 = obj.button15:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(sheet);
            
            				local export = {};
            				local bytes = Utils.binaryEncode(export, "utf8", xml);
            
            				local stream = Utils.newMemoryStream();
            				local bytes = stream:write(export);
            
            				Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            					function()
            						stream:close();
            						showMessage("Ficha Exportada.");
            					end);
        end, obj);

    obj._e_event92 = obj.button16:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            
            						local import = {};
            						local bytes = arq.stream:read(import, arq.stream.size);
            
            						local xml = Utils.binaryDecode(import, "utf8");
            
            						NDB.importXML(sheet, xml);
            					end);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
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

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.anotacoes2 ~= nil then self.anotacoes2:destroy(); self.anotacoes2 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.anotacoes8Part ~= nil then self.anotacoes8Part:destroy(); self.anotacoes8Part = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.campoEstibordo ~= nil then self.campoEstibordo:destroy(); self.campoEstibordo = nil; end;
        if self.campoTorreta ~= nil then self.campoTorreta:destroy(); self.campoTorreta = nil; end;
        if self.frmCrew ~= nil then self.frmCrew:destroy(); self.frmCrew = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.shipPartPop ~= nil then self.shipPartPop:destroy(); self.shipPartPop = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.layout225 ~= nil then self.layout225:destroy(); self.layout225 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.rclReatores ~= nil then self.rclReatores:destroy(); self.rclReatores = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.anotacoes1 ~= nil then self.anotacoes1:destroy(); self.anotacoes1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.rclTripulantes ~= nil then self.rclTripulantes:destroy(); self.rclTripulantes = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.campoProaPart ~= nil then self.campoProaPart:destroy(); self.campoProaPart = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.status_reator ~= nil then self.status_reator:destroy(); self.status_reator = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.healthPop ~= nil then self.healthPop:destroy(); self.healthPop = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.frmWeapons ~= nil then self.frmWeapons:destroy(); self.frmWeapons = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.costPop ~= nil then self.costPop:destroy(); self.costPop = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.anotacoes4Part ~= nil then self.anotacoes4Part:destroy(); self.anotacoes4Part = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.deslPop ~= nil then self.deslPop:destroy(); self.deslPop = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.deriva ~= nil then self.deriva:destroy(); self.deriva = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.anotacoes6 ~= nil then self.anotacoes6:destroy(); self.anotacoes6 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.campoBombordo ~= nil then self.campoBombordo:destroy(); self.campoBombordo = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.status_motores ~= nil then self.status_motores:destroy(); self.status_motores = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.escudo ~= nil then self.escudo:destroy(); self.escudo = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.tripTipo ~= nil then self.tripTipo:destroy(); self.tripTipo = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.campoTorretaPart ~= nil then self.campoTorretaPart:destroy(); self.campoTorretaPart = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.anotacoes5 ~= nil then self.anotacoes5:destroy(); self.anotacoes5 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.campoAntipessoal ~= nil then self.campoAntipessoal:destroy(); self.campoAntipessoal = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.campoProa ~= nil then self.campoProa:destroy(); self.campoProa = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.caPop ~= nil then self.caPop:destroy(); self.caPop = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.campoEstibordoPart ~= nil then self.campoEstibordoPart:destroy(); self.campoEstibordoPart = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.status_sensores ~= nil then self.status_sensores:destroy(); self.status_sensores = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.anotacoes6Part ~= nil then self.anotacoes6Part:destroy(); self.anotacoes6Part = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.campoBombordoPart ~= nil then self.campoBombordoPart:destroy(); self.campoBombordoPart = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.campoAntipessoalPart ~= nil then self.campoAntipessoalPart:destroy(); self.campoAntipessoalPart = nil; end;
        if self.anotacoes2Part ~= nil then self.anotacoes2Part:destroy(); self.anotacoes2Part = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.anotacoes3 ~= nil then self.anotacoes3:destroy(); self.anotacoes3 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.reactorPop ~= nil then self.reactorPop:destroy(); self.reactorPop = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.cobertura ~= nil then self.cobertura:destroy(); self.cobertura = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.propulsor ~= nil then self.propulsor:destroy(); self.propulsor = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.anotacoes9Part ~= nil then self.anotacoes9Part:destroy(); self.anotacoes9Part = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.sec_hack ~= nil then self.sec_hack:destroy(); self.sec_hack = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rclInv ~= nil then self.rclInv:destroy(); self.rclInv = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.anotacoes4 ~= nil then self.anotacoes4:destroy(); self.anotacoes4 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.contramedidas ~= nil then self.contramedidas:destroy(); self.contramedidas = nil; end;
        if self.layout224 ~= nil then self.layout224:destroy(); self.layout224 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.status_estibordo ~= nil then self.status_estibordo:destroy(); self.status_estibordo = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.modPop ~= nil then self.modPop:destroy(); self.modPop = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.sec_choque ~= nil then self.sec_choque:destroy(); self.sec_choque = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.campoPopa ~= nil then self.campoPopa:destroy(); self.campoPopa = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.status_vida ~= nil then self.status_vida:destroy(); self.status_vida = nil; end;
        if self.popEquip ~= nil then self.popEquip:destroy(); self.popEquip = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.sensor ~= nil then self.sensor:destroy(); self.sensor = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.anotacoes7Part ~= nil then self.anotacoes7Part:destroy(); self.anotacoes7Part = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.anotacoes3Part ~= nil then self.anotacoes3Part:destroy(); self.anotacoes3Part = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tamanho ~= nil then self.tamanho:destroy(); self.tamanho = nil; end;
        if self.anotacoes9 ~= nil then self.anotacoes9:destroy(); self.anotacoes9 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.rclExpansao ~= nil then self.rclExpansao:destroy(); self.rclExpansao = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.anotacoes1Part ~= nil then self.anotacoes1Part:destroy(); self.anotacoes1Part = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.anotacoes8 ~= nil then self.anotacoes8:destroy(); self.anotacoes8 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.weaponPop ~= nil then self.weaponPop:destroy(); self.weaponPop = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.computador ~= nil then self.computador:destroy(); self.computador = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.frmNaveGeneral ~= nil then self.frmNaveGeneral:destroy(); self.frmNaveGeneral = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.anotacoes7 ~= nil then self.anotacoes7:destroy(); self.anotacoes7 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.armadura ~= nil then self.armadura:destroy(); self.armadura = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.status_bombordo ~= nil then self.status_bombordo:destroy(); self.status_bombordo = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.addPop ~= nil then self.addPop:destroy(); self.addPop = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.status_popa ~= nil then self.status_popa:destroy(); self.status_popa = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.campoPopaPart ~= nil then self.campoPopaPart:destroy(); self.campoPopaPart = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.anotacoes5Part ~= nil then self.anotacoes5Part:destroy(); self.anotacoes5Part = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.categoria ~= nil then self.categoria:destroy(); self.categoria = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.status_proa ~= nil then self.status_proa:destroy(); self.status_proa = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.plataforma ~= nil then self.plataforma:destroy(); self.plataforma = nil; end;
        if self.notes ~= nil then self.notes:destroy(); self.notes = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaNave()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaNave();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaNave = {
    newEditor = newfrmFichaNave, 
    new = newfrmFichaNave, 
    name = "frmFichaNave", 
    dataType = "Ambesek.Starfinder.Nave", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Starfinder (Nave)", 
    description=""};

frmFichaNave = _frmFichaNave;
Firecast.registrarForm(_frmFichaNave);
Firecast.registrarDataType(_frmFichaNave);

return _frmFichaNave;
