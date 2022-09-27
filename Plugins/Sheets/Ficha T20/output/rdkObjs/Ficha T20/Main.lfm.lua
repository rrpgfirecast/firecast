require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmT20()
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
    obj:setName("frmT20");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.T20");
    obj:setTitle("Ficha T20");
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
        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Principal");
    obj.tab1:setName("tab1");

    obj.frmPrincipal = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPrincipal:setParent(obj.tab1);
    obj.frmPrincipal:setName("frmPrincipal");
    obj.frmPrincipal:setAlign("client");
    obj.frmPrincipal:setTheme("dark");


        


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmPrincipal);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(1000);
    obj.image1:setHeight(1000);
    obj.image1:setSRC("/imagens/1-Principal.png");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(190);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(38);
    obj.edit1:setTop(41);
    obj.edit1:setHeight(56);
    obj.edit1:setWidth(545);
    obj.edit1:setField("name_character");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontColor("black");
    obj.edit1:setFontSize(30);
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(600);
    obj.edit2:setTop(61);
    obj.edit2:setHeight(36);
    obj.edit2:setWidth(245);
    obj.edit2:setField("player");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontColor("black");
    obj.edit2:setFontSize(20);
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setLeft(188);
    obj.edit3:setTop(113);
    obj.edit3:setHeight(35);
    obj.edit3:setWidth(245);
    obj.edit3:setField("race");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontColor("black");
    obj.edit3:setFontSize(20);
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setLeft(450);
    obj.edit4:setTop(113);
    obj.edit4:setHeight(35);
    obj.edit4:setWidth(245);
    obj.edit4:setField("origin");
    obj.edit4:setTransparent(true);
    obj.edit4:setFontColor("black");
    obj.edit4:setFontSize(20);
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setLeft(711);
    obj.edit5:setTop(113);
    obj.edit5:setHeight(35);
    obj.edit5:setWidth(205);
    obj.edit5:setField("job");
    obj.edit5:setTransparent(true);
    obj.edit5:setFontColor("black");
    obj.edit5:setFontSize(20);
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setLeft(921);
    obj.edit6:setTop(113);
    obj.edit6:setHeight(35);
    obj.edit6:setWidth(35);
    obj.edit6:setField("level");
    obj.edit6:setTransparent(true);
    obj.edit6:setFontColor("black");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(175);
    obj.layout2:setMargins({top=35});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setMargins({left=48});
    obj.layout3:setName("layout3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setHeight(84);
    obj.label1:setWidth(100);
    obj.label1:setField("str_mod");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontColor("black");
    obj.label1:setFontSize(36);
    obj.label1:setName("label1");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(27);
    obj.edit7:setTop(100);
    obj.edit7:setHeight(35);
    obj.edit7:setWidth(47);
    obj.edit7:setField("str");
    obj.edit7:setTransparent(true);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontColor("black");
    obj.edit7:setName("edit7");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({left=59});
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setHeight(84);
    obj.label2:setWidth(100);
    obj.label2:setField("dex_mod");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontColor("black");
    obj.label2:setFontSize(36);
    obj.label2:setName("label2");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setLeft(27);
    obj.edit8:setTop(100);
    obj.edit8:setHeight(35);
    obj.edit8:setWidth(47);
    obj.edit8:setField("dex");
    obj.edit8:setTransparent(true);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontColor("black");
    obj.edit8:setName("edit8");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(100);
    obj.layout5:setMargins({left=59});
    obj.layout5:setName("layout5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout5);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setHeight(84);
    obj.label3:setWidth(100);
    obj.label3:setField("con_mod");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontColor("black");
    obj.label3:setFontSize(36);
    obj.label3:setName("label3");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setLeft(27);
    obj.edit9:setTop(100);
    obj.edit9:setHeight(35);
    obj.edit9:setWidth(47);
    obj.edit9:setField("con");
    obj.edit9:setTransparent(true);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontColor("black");
    obj.edit9:setName("edit9");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(100);
    obj.layout6:setMargins({left=59});
    obj.layout6:setName("layout6");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout6);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setHeight(84);
    obj.label4:setWidth(100);
    obj.label4:setField("int_mod");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontColor("black");
    obj.label4:setFontSize(36);
    obj.label4:setName("label4");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setLeft(27);
    obj.edit10:setTop(100);
    obj.edit10:setHeight(35);
    obj.edit10:setWidth(47);
    obj.edit10:setField("int");
    obj.edit10:setTransparent(true);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("black");
    obj.edit10:setName("edit10");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(100);
    obj.layout7:setMargins({left=59});
    obj.layout7:setName("layout7");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout7);
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setHeight(84);
    obj.label5:setWidth(100);
    obj.label5:setField("wis_mod");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontColor("black");
    obj.label5:setFontSize(36);
    obj.label5:setName("label5");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setLeft(27);
    obj.edit11:setTop(100);
    obj.edit11:setHeight(35);
    obj.edit11:setWidth(47);
    obj.edit11:setField("wis");
    obj.edit11:setTransparent(true);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontColor("black");
    obj.edit11:setName("edit11");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(100);
    obj.layout8:setMargins({left=59});
    obj.layout8:setName("layout8");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout8);
    obj.label6:setLeft(0);
    obj.label6:setTop(0);
    obj.label6:setHeight(84);
    obj.label6:setWidth(100);
    obj.label6:setField("cha_mod");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontColor("black");
    obj.label6:setFontSize(36);
    obj.label6:setName("label6");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout8);
    obj.edit12:setLeft(27);
    obj.edit12:setTop(100);
    obj.edit12:setHeight(35);
    obj.edit12:setWidth(47);
    obj.edit12:setField("cha");
    obj.edit12:setTransparent(true);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("black");
    obj.edit12:setName("edit12");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox1);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(190);
    obj.layout9:setMargins({top=25});
    obj.layout9:setName("layout9");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout9);
    obj.label7:setLeft(48);
    obj.label7:setTop(0);
    obj.label7:setHeight(100);
    obj.label7:setWidth(100);
    obj.label7:setField("defense");
    obj.label7:setFontSize(36);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontColor("black");
    obj.label7:setName("label7");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout9);
    obj.dataLink1:setFields({'defense_armor', 'defense_other', 'defense_extra', 'defense_optional'});
    obj.dataLink1:setName("dataLink1");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setLeft(296);
    obj.label8:setTop(5);
    obj.label8:setHeight(45);
    obj.label8:setWidth(50);
    obj.label8:setField("defense_armor");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontColor("black");
    obj.label8:setFontSize(24);
    obj.label8:setName("label8");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout9);
    obj.edit13:setLeft(374);
    obj.edit13:setTop(5);
    obj.edit13:setHeight(45);
    obj.edit13:setWidth(50);
    obj.edit13:setField("defense_other");
    obj.edit13:setTransparent(true);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("black");
    obj.edit13:setFontSize(24);
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout9);
    obj.edit14:setLeft(452);
    obj.edit14:setTop(5);
    obj.edit14:setHeight(45);
    obj.edit14:setWidth(50);
    obj.edit14:setField("defense_extra");
    obj.edit14:setTransparent(true);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontColor("black");
    obj.edit14:setFontSize(24);
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout9);
    obj.edit15:setLeft(530);
    obj.edit15:setTop(5);
    obj.edit15:setHeight(45);
    obj.edit15:setWidth(50);
    obj.edit15:setField("defense_optional");
    obj.edit15:setTransparent(true);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontColor("black");
    obj.edit15:setFontSize(24);
    obj.edit15:setName("edit15");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setLeft(207);
    obj.label9:setTop(105);
    obj.label9:setHeight(86);
    obj.label9:setWidth(117);
    obj.label9:setField("fort_total");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontColor("black");
    obj.label9:setFontSize(36);
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setLeft(342);
    obj.label10:setTop(105);
    obj.label10:setHeight(86);
    obj.label10:setWidth(117);
    obj.label10:setField("refl_total");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontColor("black");
    obj.label10:setFontSize(36);
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11:setLeft(477);
    obj.label11:setTop(105);
    obj.label11:setHeight(86);
    obj.label11:setWidth(117);
    obj.label11:setField("will_total");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontColor("black");
    obj.label11:setFontSize(36);
    obj.label11:setName("label11");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout9);
    obj.edit16:setLeft(641);
    obj.edit16:setTop(20);
    obj.edit16:setHeight(30);
    obj.edit16:setWidth(98);
    obj.edit16:setField("hp_curr");
    obj.edit16:setTransparent(true);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontColor("black");
    obj.edit16:setFontSize(16);
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout9);
    obj.edit17:setLeft(749);
    obj.edit17:setTop(20);
    obj.edit17:setHeight(30);
    obj.edit17:setWidth(98);
    obj.edit17:setField("hp_total");
    obj.edit17:setTransparent(true);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontColor("black");
    obj.edit17:setFontSize(16);
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout9);
    obj.edit18:setLeft(857);
    obj.edit18:setTop(20);
    obj.edit18:setHeight(30);
    obj.edit18:setWidth(98);
    obj.edit18:setField("hp_temp");
    obj.edit18:setTransparent(true);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontColor("black");
    obj.edit18:setFontSize(16);
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout9);
    obj.edit19:setLeft(641);
    obj.edit19:setTop(125);
    obj.edit19:setHeight(30);
    obj.edit19:setWidth(98);
    obj.edit19:setField("mp_curr");
    obj.edit19:setTransparent(true);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontColor("black");
    obj.edit19:setFontSize(16);
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout9);
    obj.edit20:setLeft(749);
    obj.edit20:setTop(125);
    obj.edit20:setHeight(30);
    obj.edit20:setWidth(98);
    obj.edit20:setField("mp_total");
    obj.edit20:setTransparent(true);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontColor("black");
    obj.edit20:setFontSize(16);
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout9);
    obj.edit21:setLeft(857);
    obj.edit21:setTop(125);
    obj.edit21:setHeight(30);
    obj.edit21:setWidth(98);
    obj.edit21:setField("mp_temp");
    obj.edit21:setTransparent(true);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontColor("black");
    obj.edit21:setFontSize(16);
    obj.edit21:setName("edit21");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(635);
    obj.image2:setTop(616);
    obj.image2:setHeight(342);
    obj.image2:setWidth(327);
    obj.image2:setField("avatar");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.scrollBox1);
    obj.textEditor1:setLeft(67);
    obj.textEditor1:setTop(718);
    obj.textEditor1:setHeight(228);
    obj.textEditor1:setWidth(512);
    obj.textEditor1:setField("notes_quick");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontColor("black");
    obj.textEditor1:setName("textEditor1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.frmPericias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPericias:setParent(obj.tab2);
    obj.frmPericias:setName("frmPericias");
    obj.frmPericias:setAlign("client");
    obj.frmPericias:setTheme("dark");


        


    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmPericias);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox2);
    obj.image3:setWidth(1000);
    obj.image3:setHeight(1000);
    obj.image3:setSRC("/imagens/2-Pericias.png");
    obj.image3:setName("image3");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox2);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(100);
    obj.layout10:setMargins({top=110});
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(440);
    obj.layout11:setMargins({left=55});
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(20);
    obj.layout12:setMargins({top=2});
    obj.layout12:setName("layout12");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout12);
    obj.imageCheckBox1:setLeft(11);
    obj.imageCheckBox1:setWidth(20);
    obj.imageCheckBox1:setHeight(20);
    obj.imageCheckBox1:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox1:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox1:setField("initiative_trained");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setLeft(258);
    obj.label12:setWidth(32);
    obj.label12:setHeight(20);
    obj.label12:setField("initiative_total");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontColor("black");
    obj.label12:setName("label12");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout12);
    obj.button1:setLeft(258);
    obj.button1:setWidth(32);
    obj.button1:setHeight(20);
    obj.button1:setOpacity(0.5);
    obj.button1:setName("button1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout12);
    obj.comboBox1:setLeft(315);
    obj.comboBox1:setWidth(33);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox1:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox1:setField("initiative_key");
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("black");
    obj.comboBox1:setName("comboBox1");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout12);
    obj.edit22:setLeft(368);
    obj.edit22:setWidth(23);
    obj.edit22:setHeight(20);
    obj.edit22:setField("initiative_other");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontColor("black");
    obj.edit22:setTransparent(true);
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout12);
    obj.edit23:setLeft(410);
    obj.edit23:setWidth(23);
    obj.edit23:setHeight(20);
    obj.edit23:setField("initiative_extra");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontColor("black");
    obj.edit23:setTransparent(true);
    obj.edit23:setName("edit23");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout12);
    obj.dataLink2:setFields({'initiative_key', 'initiative_other', 'initiative_extra', 'skills_bonus', 'initiative_trained', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink2:setName("dataLink2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(20);
    obj.layout13:setMargins({top=14});
    obj.layout13:setName("layout13");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout13);
    obj.imageCheckBox2:setLeft(11);
    obj.imageCheckBox2:setWidth(20);
    obj.imageCheckBox2:setHeight(20);
    obj.imageCheckBox2:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox2:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox2:setField("fight_trained");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout13);
    obj.label13:setLeft(258);
    obj.label13:setWidth(32);
    obj.label13:setHeight(20);
    obj.label13:setField("fight_total");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontColor("black");
    obj.label13:setName("label13");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout13);
    obj.button2:setLeft(258);
    obj.button2:setWidth(32);
    obj.button2:setHeight(20);
    obj.button2:setOpacity(0.5);
    obj.button2:setName("button2");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout13);
    obj.comboBox2:setLeft(315);
    obj.comboBox2:setWidth(33);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox2:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox2:setField("fight_key");
    obj.comboBox2:setFontSize(10);
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setFontColor("black");
    obj.comboBox2:setName("comboBox2");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout13);
    obj.edit24:setLeft(368);
    obj.edit24:setWidth(23);
    obj.edit24:setHeight(20);
    obj.edit24:setField("fight_other");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontColor("black");
    obj.edit24:setTransparent(true);
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout13);
    obj.edit25:setLeft(410);
    obj.edit25:setWidth(23);
    obj.edit25:setHeight(20);
    obj.edit25:setField("fight_extra");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontColor("black");
    obj.edit25:setTransparent(true);
    obj.edit25:setName("edit25");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout13);
    obj.dataLink3:setFields({'fight_key', 'fight_other', 'fight_extra', 'skills_bonus', 'fight_trained', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink3:setName("dataLink3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(20);
    obj.layout14:setMargins({top=14});
    obj.layout14:setName("layout14");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout14);
    obj.imageCheckBox3:setLeft(11);
    obj.imageCheckBox3:setWidth(20);
    obj.imageCheckBox3:setHeight(20);
    obj.imageCheckBox3:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox3:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox3:setField("aim_trained");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout14);
    obj.label14:setLeft(258);
    obj.label14:setWidth(32);
    obj.label14:setHeight(20);
    obj.label14:setField("aim_total");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontColor("black");
    obj.label14:setName("label14");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout14);
    obj.button3:setLeft(258);
    obj.button3:setWidth(32);
    obj.button3:setHeight(20);
    obj.button3:setOpacity(0.5);
    obj.button3:setName("button3");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout14);
    obj.comboBox3:setLeft(315);
    obj.comboBox3:setWidth(33);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox3:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox3:setField("aim_key");
    obj.comboBox3:setFontSize(10);
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setFontColor("black");
    obj.comboBox3:setName("comboBox3");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout14);
    obj.edit26:setLeft(368);
    obj.edit26:setWidth(23);
    obj.edit26:setHeight(20);
    obj.edit26:setField("aim_other");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontColor("black");
    obj.edit26:setTransparent(true);
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout14);
    obj.edit27:setLeft(410);
    obj.edit27:setWidth(23);
    obj.edit27:setHeight(20);
    obj.edit27:setField("aim_extra");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontColor("black");
    obj.edit27:setTransparent(true);
    obj.edit27:setName("edit27");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout14);
    obj.dataLink4:setFields({'aim_key', 'aim_other', 'aim_extra', 'skills_bonus', 'aim_trained', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink4:setName("dataLink4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout10);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(440);
    obj.layout15:setMargins({left=24});
    obj.layout15:setName("layout15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(20);
    obj.layout16:setMargins({top=2});
    obj.layout16:setName("layout16");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout16);
    obj.imageCheckBox4:setLeft(11);
    obj.imageCheckBox4:setWidth(20);
    obj.imageCheckBox4:setHeight(20);
    obj.imageCheckBox4:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox4:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox4:setField("fort_trained");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout16);
    obj.label15:setLeft(258);
    obj.label15:setWidth(32);
    obj.label15:setHeight(20);
    obj.label15:setField("fort_total");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontColor("black");
    obj.label15:setName("label15");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout16);
    obj.button4:setLeft(258);
    obj.button4:setWidth(32);
    obj.button4:setHeight(20);
    obj.button4:setOpacity(0.5);
    obj.button4:setName("button4");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout16);
    obj.comboBox4:setLeft(315);
    obj.comboBox4:setWidth(33);
    obj.comboBox4:setHeight(20);
    obj.comboBox4:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox4:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox4:setField("fort_key");
    obj.comboBox4:setFontSize(10);
    obj.comboBox4:setTransparent(true);
    obj.comboBox4:setFontColor("black");
    obj.comboBox4:setName("comboBox4");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout16);
    obj.edit28:setLeft(368);
    obj.edit28:setWidth(23);
    obj.edit28:setHeight(20);
    obj.edit28:setField("fort_other");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontColor("black");
    obj.edit28:setTransparent(true);
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout16);
    obj.edit29:setLeft(410);
    obj.edit29:setWidth(23);
    obj.edit29:setHeight(20);
    obj.edit29:setField("fort_extra");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontColor("black");
    obj.edit29:setTransparent(true);
    obj.edit29:setName("edit29");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout16);
    obj.dataLink5:setFields({'fort_key', 'fort_other', 'fort_extra', 'skills_bonus', 'fort_trained', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink5:setName("dataLink5");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(20);
    obj.layout17:setMargins({top=14});
    obj.layout17:setName("layout17");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout17);
    obj.imageCheckBox5:setLeft(11);
    obj.imageCheckBox5:setWidth(20);
    obj.imageCheckBox5:setHeight(20);
    obj.imageCheckBox5:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox5:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox5:setField("refl_trained");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout17);
    obj.label16:setLeft(258);
    obj.label16:setWidth(32);
    obj.label16:setHeight(20);
    obj.label16:setField("refl_total");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontColor("black");
    obj.label16:setName("label16");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout17);
    obj.button5:setLeft(258);
    obj.button5:setWidth(32);
    obj.button5:setHeight(20);
    obj.button5:setOpacity(0.5);
    obj.button5:setName("button5");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout17);
    obj.comboBox5:setLeft(315);
    obj.comboBox5:setWidth(33);
    obj.comboBox5:setHeight(20);
    obj.comboBox5:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox5:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox5:setField("refl_key");
    obj.comboBox5:setFontSize(10);
    obj.comboBox5:setTransparent(true);
    obj.comboBox5:setFontColor("black");
    obj.comboBox5:setName("comboBox5");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout17);
    obj.edit30:setLeft(368);
    obj.edit30:setWidth(23);
    obj.edit30:setHeight(20);
    obj.edit30:setField("refl_other");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontColor("black");
    obj.edit30:setTransparent(true);
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout17);
    obj.edit31:setLeft(410);
    obj.edit31:setWidth(23);
    obj.edit31:setHeight(20);
    obj.edit31:setField("refl_extra");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontColor("black");
    obj.edit31:setTransparent(true);
    obj.edit31:setName("edit31");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout17);
    obj.dataLink6:setFields({'refl_key', 'refl_other', 'refl_extra', 'skills_bonus', 'refl_trained', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink6:setName("dataLink6");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(20);
    obj.layout18:setMargins({top=14});
    obj.layout18:setName("layout18");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout18);
    obj.imageCheckBox6:setLeft(11);
    obj.imageCheckBox6:setWidth(20);
    obj.imageCheckBox6:setHeight(20);
    obj.imageCheckBox6:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox6:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox6:setField("will_trained");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout18);
    obj.label17:setLeft(258);
    obj.label17:setWidth(32);
    obj.label17:setHeight(20);
    obj.label17:setField("will_total");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontColor("black");
    obj.label17:setName("label17");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout18);
    obj.button6:setLeft(258);
    obj.button6:setWidth(32);
    obj.button6:setHeight(20);
    obj.button6:setOpacity(0.5);
    obj.button6:setName("button6");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout18);
    obj.comboBox6:setLeft(315);
    obj.comboBox6:setWidth(33);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox6:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox6:setField("will_key");
    obj.comboBox6:setFontSize(10);
    obj.comboBox6:setTransparent(true);
    obj.comboBox6:setFontColor("black");
    obj.comboBox6:setName("comboBox6");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout18);
    obj.edit32:setLeft(368);
    obj.edit32:setWidth(23);
    obj.edit32:setHeight(20);
    obj.edit32:setField("will_other");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontColor("black");
    obj.edit32:setTransparent(true);
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout18);
    obj.edit33:setLeft(410);
    obj.edit33:setWidth(23);
    obj.edit33:setHeight(20);
    obj.edit33:setField("will_extra");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontColor("black");
    obj.edit33:setTransparent(true);
    obj.edit33:setName("edit33");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout18);
    obj.dataLink7:setFields({'will_key', 'will_other', 'will_extra', 'skills_bonus', 'will_trained', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink7:setName("dataLink7");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox2);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(375);
    obj.layout19:setMargins({top=64});
    obj.layout19:setName("layout19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(440);
    obj.layout20:setMargins({left=55});
    obj.layout20:setName("layout20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(20);
    obj.layout21:setMargins({top=2});
    obj.layout21:setName("layout21");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout21);
    obj.imageCheckBox7:setLeft(11);
    obj.imageCheckBox7:setWidth(20);
    obj.imageCheckBox7:setHeight(20);
    obj.imageCheckBox7:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox7:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox7:setField("acrobatics_trained");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout21);
    obj.label18:setLeft(255);
    obj.label18:setWidth(32);
    obj.label18:setHeight(20);
    obj.label18:setField("acrobatics_total");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontColor("black");
    obj.label18:setName("label18");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout21);
    obj.button7:setLeft(255);
    obj.button7:setWidth(33);
    obj.button7:setHeight(20);
    obj.button7:setOpacity(0.5);
    obj.button7:setName("button7");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout21);
    obj.comboBox7:setLeft(312);
    obj.comboBox7:setWidth(33);
    obj.comboBox7:setHeight(20);
    obj.comboBox7:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox7:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox7:setField("acrobatics_key");
    obj.comboBox7:setFontSize(10);
    obj.comboBox7:setTransparent(true);
    obj.comboBox7:setFontColor("black");
    obj.comboBox7:setName("comboBox7");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout21);
    obj.edit34:setLeft(365);
    obj.edit34:setWidth(23);
    obj.edit34:setHeight(20);
    obj.edit34:setField("acrobatics_other");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontColor("black");
    obj.edit34:setTransparent(true);
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout21);
    obj.edit35:setLeft(407);
    obj.edit35:setWidth(23);
    obj.edit35:setHeight(20);
    obj.edit35:setField("acrobatics_extra");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontColor("black");
    obj.edit35:setTransparent(true);
    obj.edit35:setName("edit35");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout21);
    obj.dataLink8:setFields({'acrobatics_key', 'acrobatics_other', 'acrobatics_extra', 'skills_bonus', 'acrobatics_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink8:setName("dataLink8");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(20);
    obj.layout22:setMargins({top=16});
    obj.layout22:setName("layout22");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout22);
    obj.imageCheckBox8:setLeft(11);
    obj.imageCheckBox8:setWidth(20);
    obj.imageCheckBox8:setHeight(20);
    obj.imageCheckBox8:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox8:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox8:setField("training_trained");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout22);
    obj.label19:setLeft(255);
    obj.label19:setWidth(32);
    obj.label19:setHeight(20);
    obj.label19:setField("training_total");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontColor("black");
    obj.label19:setName("label19");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout22);
    obj.button8:setLeft(255);
    obj.button8:setWidth(33);
    obj.button8:setHeight(20);
    obj.button8:setOpacity(0.5);
    obj.button8:setName("button8");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout22);
    obj.comboBox8:setLeft(312);
    obj.comboBox8:setWidth(33);
    obj.comboBox8:setHeight(20);
    obj.comboBox8:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox8:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox8:setField("training_key");
    obj.comboBox8:setFontSize(10);
    obj.comboBox8:setTransparent(true);
    obj.comboBox8:setFontColor("black");
    obj.comboBox8:setName("comboBox8");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout22);
    obj.edit36:setLeft(365);
    obj.edit36:setWidth(23);
    obj.edit36:setHeight(20);
    obj.edit36:setField("training_other");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontColor("black");
    obj.edit36:setTransparent(true);
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout22);
    obj.edit37:setLeft(407);
    obj.edit37:setWidth(23);
    obj.edit37:setHeight(20);
    obj.edit37:setField("training_extra");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontColor("black");
    obj.edit37:setTransparent(true);
    obj.edit37:setName("edit37");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout22);
    obj.dataLink9:setFields({'training_key', 'training_other', 'training_extra', 'skills_bonus', 'training_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink9:setName("dataLink9");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout20);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(20);
    obj.layout23:setMargins({top=15});
    obj.layout23:setName("layout23");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout23);
    obj.imageCheckBox9:setLeft(11);
    obj.imageCheckBox9:setWidth(20);
    obj.imageCheckBox9:setHeight(20);
    obj.imageCheckBox9:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox9:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox9:setField("athletics_trained");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout23);
    obj.label20:setLeft(255);
    obj.label20:setWidth(32);
    obj.label20:setHeight(20);
    obj.label20:setField("athletics_total");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setFontColor("black");
    obj.label20:setName("label20");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout23);
    obj.button9:setLeft(255);
    obj.button9:setWidth(33);
    obj.button9:setHeight(20);
    obj.button9:setOpacity(0.5);
    obj.button9:setName("button9");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout23);
    obj.comboBox9:setLeft(312);
    obj.comboBox9:setWidth(33);
    obj.comboBox9:setHeight(20);
    obj.comboBox9:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox9:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox9:setField("athletics_key");
    obj.comboBox9:setFontSize(10);
    obj.comboBox9:setTransparent(true);
    obj.comboBox9:setFontColor("black");
    obj.comboBox9:setName("comboBox9");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout23);
    obj.edit38:setLeft(365);
    obj.edit38:setWidth(23);
    obj.edit38:setHeight(20);
    obj.edit38:setField("athletics_other");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontColor("black");
    obj.edit38:setTransparent(true);
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout23);
    obj.edit39:setLeft(407);
    obj.edit39:setWidth(23);
    obj.edit39:setHeight(20);
    obj.edit39:setField("athletics_extra");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontColor("black");
    obj.edit39:setTransparent(true);
    obj.edit39:setName("edit39");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout23);
    obj.dataLink10:setFields({'athletics_key', 'athletics_other', 'athletics_extra', 'skills_bonus', 'athletics_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink10:setName("dataLink10");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout20);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(20);
    obj.layout24:setMargins({top=14});
    obj.layout24:setName("layout24");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout24);
    obj.imageCheckBox10:setLeft(11);
    obj.imageCheckBox10:setWidth(20);
    obj.imageCheckBox10:setHeight(20);
    obj.imageCheckBox10:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox10:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox10:setField("acting_trained");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout24);
    obj.label21:setLeft(255);
    obj.label21:setWidth(32);
    obj.label21:setHeight(20);
    obj.label21:setField("acting_total");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontColor("black");
    obj.label21:setName("label21");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout24);
    obj.button10:setLeft(255);
    obj.button10:setWidth(33);
    obj.button10:setHeight(20);
    obj.button10:setOpacity(0.5);
    obj.button10:setName("button10");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout24);
    obj.comboBox10:setLeft(312);
    obj.comboBox10:setWidth(33);
    obj.comboBox10:setHeight(20);
    obj.comboBox10:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox10:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox10:setField("acting_key");
    obj.comboBox10:setFontSize(10);
    obj.comboBox10:setTransparent(true);
    obj.comboBox10:setFontColor("black");
    obj.comboBox10:setName("comboBox10");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout24);
    obj.edit40:setLeft(365);
    obj.edit40:setWidth(23);
    obj.edit40:setHeight(20);
    obj.edit40:setField("acting_other");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontColor("black");
    obj.edit40:setTransparent(true);
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout24);
    obj.edit41:setLeft(407);
    obj.edit41:setWidth(23);
    obj.edit41:setHeight(20);
    obj.edit41:setField("acting_extra");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontColor("black");
    obj.edit41:setTransparent(true);
    obj.edit41:setName("edit41");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout24);
    obj.dataLink11:setFields({'acting_key', 'acting_other', 'acting_extra', 'skills_bonus', 'acting_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink11:setName("dataLink11");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout20);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(20);
    obj.layout25:setMargins({top=16});
    obj.layout25:setName("layout25");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout25);
    obj.imageCheckBox11:setLeft(11);
    obj.imageCheckBox11:setWidth(20);
    obj.imageCheckBox11:setHeight(20);
    obj.imageCheckBox11:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox11:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox11:setField("ride_trained");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout25);
    obj.label22:setLeft(255);
    obj.label22:setWidth(32);
    obj.label22:setHeight(20);
    obj.label22:setField("ride_total");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontColor("black");
    obj.label22:setName("label22");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout25);
    obj.button11:setLeft(255);
    obj.button11:setWidth(33);
    obj.button11:setHeight(20);
    obj.button11:setOpacity(0.5);
    obj.button11:setName("button11");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout25);
    obj.comboBox11:setLeft(312);
    obj.comboBox11:setWidth(33);
    obj.comboBox11:setHeight(20);
    obj.comboBox11:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox11:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox11:setField("ride_key");
    obj.comboBox11:setFontSize(10);
    obj.comboBox11:setTransparent(true);
    obj.comboBox11:setFontColor("black");
    obj.comboBox11:setName("comboBox11");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout25);
    obj.edit42:setLeft(365);
    obj.edit42:setWidth(23);
    obj.edit42:setHeight(20);
    obj.edit42:setField("ride_other");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontColor("black");
    obj.edit42:setTransparent(true);
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout25);
    obj.edit43:setLeft(407);
    obj.edit43:setWidth(23);
    obj.edit43:setHeight(20);
    obj.edit43:setField("ride_extra");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontColor("black");
    obj.edit43:setTransparent(true);
    obj.edit43:setName("edit43");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout25);
    obj.dataLink12:setFields({'ride_key', 'ride_other', 'ride_extra', 'skills_bonus', 'ride_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink12:setName("dataLink12");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout20);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(20);
    obj.layout26:setMargins({top=15});
    obj.layout26:setName("layout26");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout26);
    obj.imageCheckBox12:setLeft(11);
    obj.imageCheckBox12:setWidth(20);
    obj.imageCheckBox12:setHeight(20);
    obj.imageCheckBox12:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox12:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox12:setField("knowledge_trained");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout26);
    obj.label23:setLeft(255);
    obj.label23:setWidth(32);
    obj.label23:setHeight(20);
    obj.label23:setField("knowledge_total");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontColor("black");
    obj.label23:setName("label23");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout26);
    obj.button12:setLeft(255);
    obj.button12:setWidth(33);
    obj.button12:setHeight(20);
    obj.button12:setOpacity(0.5);
    obj.button12:setName("button12");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout26);
    obj.comboBox12:setLeft(312);
    obj.comboBox12:setWidth(33);
    obj.comboBox12:setHeight(20);
    obj.comboBox12:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox12:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox12:setField("knowledge_key");
    obj.comboBox12:setFontSize(10);
    obj.comboBox12:setTransparent(true);
    obj.comboBox12:setFontColor("black");
    obj.comboBox12:setName("comboBox12");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout26);
    obj.edit44:setLeft(365);
    obj.edit44:setWidth(23);
    obj.edit44:setHeight(20);
    obj.edit44:setField("knowledge_other");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontColor("black");
    obj.edit44:setTransparent(true);
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout26);
    obj.edit45:setLeft(407);
    obj.edit45:setWidth(23);
    obj.edit45:setHeight(20);
    obj.edit45:setField("knowledge_extra");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontColor("black");
    obj.edit45:setTransparent(true);
    obj.edit45:setName("edit45");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout26);
    obj.dataLink13:setFields({'knowledge_key', 'knowledge_other', 'knowledge_extra', 'skills_bonus', 'knowledge_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink13:setName("dataLink13");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout20);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(20);
    obj.layout27:setMargins({top=15});
    obj.layout27:setName("layout27");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout27);
    obj.imageCheckBox13:setLeft(11);
    obj.imageCheckBox13:setWidth(20);
    obj.imageCheckBox13:setHeight(20);
    obj.imageCheckBox13:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox13:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox13:setField("cure_trained");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout27);
    obj.label24:setLeft(255);
    obj.label24:setWidth(32);
    obj.label24:setHeight(20);
    obj.label24:setField("cure_total");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontColor("black");
    obj.label24:setName("label24");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout27);
    obj.button13:setLeft(255);
    obj.button13:setWidth(33);
    obj.button13:setHeight(20);
    obj.button13:setOpacity(0.5);
    obj.button13:setName("button13");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout27);
    obj.comboBox13:setLeft(312);
    obj.comboBox13:setWidth(33);
    obj.comboBox13:setHeight(20);
    obj.comboBox13:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox13:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox13:setField("cure_key");
    obj.comboBox13:setFontSize(10);
    obj.comboBox13:setTransparent(true);
    obj.comboBox13:setFontColor("black");
    obj.comboBox13:setName("comboBox13");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout27);
    obj.edit46:setLeft(365);
    obj.edit46:setWidth(23);
    obj.edit46:setHeight(20);
    obj.edit46:setField("cure_other");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontColor("black");
    obj.edit46:setTransparent(true);
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout27);
    obj.edit47:setLeft(407);
    obj.edit47:setWidth(23);
    obj.edit47:setHeight(20);
    obj.edit47:setField("cure_extra");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontColor("black");
    obj.edit47:setTransparent(true);
    obj.edit47:setName("edit47");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout27);
    obj.dataLink14:setFields({'cure_key', 'cure_other', 'cure_extra', 'skills_bonus', 'cure_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink14:setName("dataLink14");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout20);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(20);
    obj.layout28:setMargins({top=16});
    obj.layout28:setName("layout28");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout28);
    obj.imageCheckBox14:setLeft(11);
    obj.imageCheckBox14:setWidth(20);
    obj.imageCheckBox14:setHeight(20);
    obj.imageCheckBox14:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox14:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox14:setField("diplomacy_trained");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout28);
    obj.label25:setLeft(255);
    obj.label25:setWidth(32);
    obj.label25:setHeight(20);
    obj.label25:setField("diplomacy_total");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontColor("black");
    obj.label25:setName("label25");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout28);
    obj.button14:setLeft(255);
    obj.button14:setWidth(33);
    obj.button14:setHeight(20);
    obj.button14:setOpacity(0.5);
    obj.button14:setName("button14");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout28);
    obj.comboBox14:setLeft(312);
    obj.comboBox14:setWidth(33);
    obj.comboBox14:setHeight(20);
    obj.comboBox14:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox14:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox14:setField("diplomacy_key");
    obj.comboBox14:setFontSize(10);
    obj.comboBox14:setTransparent(true);
    obj.comboBox14:setFontColor("black");
    obj.comboBox14:setName("comboBox14");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout28);
    obj.edit48:setLeft(365);
    obj.edit48:setWidth(23);
    obj.edit48:setHeight(20);
    obj.edit48:setField("diplomacy_other");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontColor("black");
    obj.edit48:setTransparent(true);
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout28);
    obj.edit49:setLeft(407);
    obj.edit49:setWidth(23);
    obj.edit49:setHeight(20);
    obj.edit49:setField("diplomacy_extra");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontColor("black");
    obj.edit49:setTransparent(true);
    obj.edit49:setName("edit49");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout28);
    obj.dataLink15:setFields({'diplomacy_key', 'diplomacy_other', 'diplomacy_extra', 'skills_bonus', 'diplomacy_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink15:setName("dataLink15");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout20);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(20);
    obj.layout29:setMargins({top=15});
    obj.layout29:setName("layout29");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout29);
    obj.imageCheckBox15:setLeft(11);
    obj.imageCheckBox15:setWidth(20);
    obj.imageCheckBox15:setHeight(20);
    obj.imageCheckBox15:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox15:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox15:setField("deception_trained");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout29);
    obj.label26:setLeft(255);
    obj.label26:setWidth(32);
    obj.label26:setHeight(20);
    obj.label26:setField("deception_total");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setFontColor("black");
    obj.label26:setName("label26");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout29);
    obj.button15:setLeft(255);
    obj.button15:setWidth(33);
    obj.button15:setHeight(20);
    obj.button15:setOpacity(0.5);
    obj.button15:setName("button15");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout29);
    obj.comboBox15:setLeft(312);
    obj.comboBox15:setWidth(33);
    obj.comboBox15:setHeight(20);
    obj.comboBox15:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox15:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox15:setField("deception_key");
    obj.comboBox15:setFontSize(10);
    obj.comboBox15:setTransparent(true);
    obj.comboBox15:setFontColor("black");
    obj.comboBox15:setName("comboBox15");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout29);
    obj.edit50:setLeft(365);
    obj.edit50:setWidth(23);
    obj.edit50:setHeight(20);
    obj.edit50:setField("deception_other");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontColor("black");
    obj.edit50:setTransparent(true);
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout29);
    obj.edit51:setLeft(407);
    obj.edit51:setWidth(23);
    obj.edit51:setHeight(20);
    obj.edit51:setField("deception_extra");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontColor("black");
    obj.edit51:setTransparent(true);
    obj.edit51:setName("edit51");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout29);
    obj.dataLink16:setFields({'deception_key', 'deception_other', 'deception_extra', 'skills_bonus', 'deception_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink16:setName("dataLink16");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout20);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(20);
    obj.layout30:setMargins({top=15});
    obj.layout30:setName("layout30");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout30);
    obj.imageCheckBox16:setLeft(11);
    obj.imageCheckBox16:setWidth(20);
    obj.imageCheckBox16:setHeight(20);
    obj.imageCheckBox16:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox16:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox16:setField("stealth_trained");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout30);
    obj.label27:setLeft(255);
    obj.label27:setWidth(32);
    obj.label27:setHeight(20);
    obj.label27:setField("stealth_total");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontColor("black");
    obj.label27:setName("label27");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout30);
    obj.button16:setLeft(255);
    obj.button16:setWidth(33);
    obj.button16:setHeight(20);
    obj.button16:setOpacity(0.5);
    obj.button16:setName("button16");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout30);
    obj.comboBox16:setLeft(312);
    obj.comboBox16:setWidth(33);
    obj.comboBox16:setHeight(20);
    obj.comboBox16:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox16:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox16:setField("stealth_key");
    obj.comboBox16:setFontSize(10);
    obj.comboBox16:setTransparent(true);
    obj.comboBox16:setFontColor("black");
    obj.comboBox16:setName("comboBox16");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout30);
    obj.edit52:setLeft(365);
    obj.edit52:setWidth(23);
    obj.edit52:setHeight(20);
    obj.edit52:setField("stealth_other");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontColor("black");
    obj.edit52:setTransparent(true);
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout30);
    obj.edit53:setLeft(407);
    obj.edit53:setWidth(23);
    obj.edit53:setHeight(20);
    obj.edit53:setField("stealth_extra");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontColor("black");
    obj.edit53:setTransparent(true);
    obj.edit53:setName("edit53");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout30);
    obj.dataLink17:setFields({'stealth_key', 'stealth_other', 'stealth_extra', 'skills_bonus', 'stealth_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink17:setName("dataLink17");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout20);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(20);
    obj.layout31:setMargins({top=15});
    obj.layout31:setName("layout31");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout31);
    obj.imageCheckBox17:setLeft(11);
    obj.imageCheckBox17:setWidth(20);
    obj.imageCheckBox17:setHeight(20);
    obj.imageCheckBox17:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox17:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox17:setField("war_trained");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout31);
    obj.label28:setLeft(255);
    obj.label28:setWidth(32);
    obj.label28:setHeight(20);
    obj.label28:setField("war_total");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontColor("black");
    obj.label28:setName("label28");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout31);
    obj.button17:setLeft(255);
    obj.button17:setWidth(33);
    obj.button17:setHeight(20);
    obj.button17:setOpacity(0.5);
    obj.button17:setName("button17");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout31);
    obj.comboBox17:setLeft(312);
    obj.comboBox17:setWidth(33);
    obj.comboBox17:setHeight(20);
    obj.comboBox17:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox17:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox17:setField("war_key");
    obj.comboBox17:setFontSize(10);
    obj.comboBox17:setTransparent(true);
    obj.comboBox17:setFontColor("black");
    obj.comboBox17:setName("comboBox17");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout31);
    obj.edit54:setLeft(365);
    obj.edit54:setWidth(23);
    obj.edit54:setHeight(20);
    obj.edit54:setField("war_other");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontColor("black");
    obj.edit54:setTransparent(true);
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout31);
    obj.edit55:setLeft(407);
    obj.edit55:setWidth(23);
    obj.edit55:setHeight(20);
    obj.edit55:setField("war_extra");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontColor("black");
    obj.edit55:setTransparent(true);
    obj.edit55:setName("edit55");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout31);
    obj.dataLink18:setFields({'war_key', 'war_other', 'war_extra', 'skills_bonus', 'war_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink18:setName("dataLink18");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout19);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(440);
    obj.layout32:setMargins({left=24});
    obj.layout32:setName("layout32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(20);
    obj.layout33:setMargins({top=2});
    obj.layout33:setName("layout33");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout33);
    obj.imageCheckBox18:setLeft(11);
    obj.imageCheckBox18:setWidth(20);
    obj.imageCheckBox18:setHeight(20);
    obj.imageCheckBox18:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox18:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox18:setField("intimidation_trained");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout33);
    obj.label29:setLeft(255);
    obj.label29:setWidth(32);
    obj.label29:setHeight(20);
    obj.label29:setField("intimidation_total");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontColor("black");
    obj.label29:setName("label29");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout33);
    obj.button18:setLeft(255);
    obj.button18:setWidth(33);
    obj.button18:setHeight(20);
    obj.button18:setOpacity(0.5);
    obj.button18:setName("button18");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout33);
    obj.comboBox18:setLeft(312);
    obj.comboBox18:setWidth(33);
    obj.comboBox18:setHeight(20);
    obj.comboBox18:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox18:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox18:setField("intimidation_key");
    obj.comboBox18:setFontSize(10);
    obj.comboBox18:setTransparent(true);
    obj.comboBox18:setFontColor("black");
    obj.comboBox18:setName("comboBox18");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout33);
    obj.edit56:setLeft(365);
    obj.edit56:setWidth(23);
    obj.edit56:setHeight(20);
    obj.edit56:setField("intimidation_other");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontColor("black");
    obj.edit56:setTransparent(true);
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout33);
    obj.edit57:setLeft(407);
    obj.edit57:setWidth(23);
    obj.edit57:setHeight(20);
    obj.edit57:setField("intimidation_extra");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontColor("black");
    obj.edit57:setTransparent(true);
    obj.edit57:setName("edit57");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout33);
    obj.dataLink19:setFields({'intimidation_key', 'intimidation_other', 'intimidation_extra', 'skills_bonus', 'intimidation_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink19:setName("dataLink19");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout32);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(20);
    obj.layout34:setMargins({top=16});
    obj.layout34:setName("layout34");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout34);
    obj.imageCheckBox19:setLeft(11);
    obj.imageCheckBox19:setWidth(20);
    obj.imageCheckBox19:setHeight(20);
    obj.imageCheckBox19:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox19:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox19:setField("intuition_trained");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout34);
    obj.label30:setLeft(255);
    obj.label30:setWidth(32);
    obj.label30:setHeight(20);
    obj.label30:setField("intuition_total");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontColor("black");
    obj.label30:setName("label30");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout34);
    obj.button19:setLeft(255);
    obj.button19:setWidth(33);
    obj.button19:setHeight(20);
    obj.button19:setOpacity(0.5);
    obj.button19:setName("button19");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout34);
    obj.comboBox19:setLeft(312);
    obj.comboBox19:setWidth(33);
    obj.comboBox19:setHeight(20);
    obj.comboBox19:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox19:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox19:setField("intuition_key");
    obj.comboBox19:setFontSize(10);
    obj.comboBox19:setTransparent(true);
    obj.comboBox19:setFontColor("black");
    obj.comboBox19:setName("comboBox19");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout34);
    obj.edit58:setLeft(365);
    obj.edit58:setWidth(23);
    obj.edit58:setHeight(20);
    obj.edit58:setField("intuition_other");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontColor("black");
    obj.edit58:setTransparent(true);
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout34);
    obj.edit59:setLeft(407);
    obj.edit59:setWidth(23);
    obj.edit59:setHeight(20);
    obj.edit59:setField("intuition_extra");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontColor("black");
    obj.edit59:setTransparent(true);
    obj.edit59:setName("edit59");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout34);
    obj.dataLink20:setFields({'intuition_key', 'intuition_other', 'intuition_extra', 'skills_bonus', 'intuition_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink20:setName("dataLink20");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout32);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(20);
    obj.layout35:setMargins({top=15});
    obj.layout35:setName("layout35");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout35);
    obj.imageCheckBox20:setLeft(11);
    obj.imageCheckBox20:setWidth(20);
    obj.imageCheckBox20:setHeight(20);
    obj.imageCheckBox20:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox20:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox20:setField("investigation_trained");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout35);
    obj.label31:setLeft(255);
    obj.label31:setWidth(32);
    obj.label31:setHeight(20);
    obj.label31:setField("investigation_total");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setFontColor("black");
    obj.label31:setName("label31");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout35);
    obj.button20:setLeft(255);
    obj.button20:setWidth(33);
    obj.button20:setHeight(20);
    obj.button20:setOpacity(0.5);
    obj.button20:setName("button20");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout35);
    obj.comboBox20:setLeft(312);
    obj.comboBox20:setWidth(33);
    obj.comboBox20:setHeight(20);
    obj.comboBox20:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox20:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox20:setField("investigation_key");
    obj.comboBox20:setFontSize(10);
    obj.comboBox20:setTransparent(true);
    obj.comboBox20:setFontColor("black");
    obj.comboBox20:setName("comboBox20");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout35);
    obj.edit60:setLeft(365);
    obj.edit60:setWidth(23);
    obj.edit60:setHeight(20);
    obj.edit60:setField("investigation_other");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontColor("black");
    obj.edit60:setTransparent(true);
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout35);
    obj.edit61:setLeft(407);
    obj.edit61:setWidth(23);
    obj.edit61:setHeight(20);
    obj.edit61:setField("investigation_extra");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontColor("black");
    obj.edit61:setTransparent(true);
    obj.edit61:setName("edit61");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout35);
    obj.dataLink21:setFields({'investigation_key', 'investigation_other', 'investigation_extra', 'skills_bonus', 'investigation_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink21:setName("dataLink21");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout32);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(20);
    obj.layout36:setMargins({top=14});
    obj.layout36:setName("layout36");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout36);
    obj.imageCheckBox21:setLeft(11);
    obj.imageCheckBox21:setWidth(20);
    obj.imageCheckBox21:setHeight(20);
    obj.imageCheckBox21:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox21:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox21:setField("gambling_trained");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout36);
    obj.label32:setLeft(255);
    obj.label32:setWidth(32);
    obj.label32:setHeight(20);
    obj.label32:setField("gambling_total");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontColor("black");
    obj.label32:setName("label32");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout36);
    obj.button21:setLeft(255);
    obj.button21:setWidth(33);
    obj.button21:setHeight(20);
    obj.button21:setOpacity(0.5);
    obj.button21:setName("button21");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout36);
    obj.comboBox21:setLeft(312);
    obj.comboBox21:setWidth(33);
    obj.comboBox21:setHeight(20);
    obj.comboBox21:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox21:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox21:setField("gambling_key");
    obj.comboBox21:setFontSize(10);
    obj.comboBox21:setTransparent(true);
    obj.comboBox21:setFontColor("black");
    obj.comboBox21:setName("comboBox21");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout36);
    obj.edit62:setLeft(365);
    obj.edit62:setWidth(23);
    obj.edit62:setHeight(20);
    obj.edit62:setField("gambling_other");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontColor("black");
    obj.edit62:setTransparent(true);
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout36);
    obj.edit63:setLeft(407);
    obj.edit63:setWidth(23);
    obj.edit63:setHeight(20);
    obj.edit63:setField("gambling_extra");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontColor("black");
    obj.edit63:setTransparent(true);
    obj.edit63:setName("edit63");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout36);
    obj.dataLink22:setFields({'gambling_key', 'gambling_other', 'gambling_extra', 'skills_bonus', 'gambling_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink22:setName("dataLink22");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout32);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(20);
    obj.layout37:setMargins({top=16});
    obj.layout37:setName("layout37");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout37);
    obj.imageCheckBox22:setLeft(11);
    obj.imageCheckBox22:setWidth(20);
    obj.imageCheckBox22:setHeight(20);
    obj.imageCheckBox22:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox22:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox22:setField("thievery_trained");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout37);
    obj.label33:setLeft(255);
    obj.label33:setWidth(32);
    obj.label33:setHeight(20);
    obj.label33:setField("thievery_total");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setFontColor("black");
    obj.label33:setName("label33");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout37);
    obj.button22:setLeft(255);
    obj.button22:setWidth(33);
    obj.button22:setHeight(20);
    obj.button22:setOpacity(0.5);
    obj.button22:setName("button22");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout37);
    obj.comboBox22:setLeft(312);
    obj.comboBox22:setWidth(33);
    obj.comboBox22:setHeight(20);
    obj.comboBox22:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox22:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox22:setField("thievery_key");
    obj.comboBox22:setFontSize(10);
    obj.comboBox22:setTransparent(true);
    obj.comboBox22:setFontColor("black");
    obj.comboBox22:setName("comboBox22");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout37);
    obj.edit64:setLeft(365);
    obj.edit64:setWidth(23);
    obj.edit64:setHeight(20);
    obj.edit64:setField("thievery_other");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontColor("black");
    obj.edit64:setTransparent(true);
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout37);
    obj.edit65:setLeft(407);
    obj.edit65:setWidth(23);
    obj.edit65:setHeight(20);
    obj.edit65:setField("thievery_extra");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontColor("black");
    obj.edit65:setTransparent(true);
    obj.edit65:setName("edit65");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout37);
    obj.dataLink23:setFields({'thievery_key', 'thievery_other', 'thievery_extra', 'skills_bonus', 'thievery_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink23:setName("dataLink23");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout32);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(20);
    obj.layout38:setMargins({top=15});
    obj.layout38:setName("layout38");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout38);
    obj.imageCheckBox23:setLeft(11);
    obj.imageCheckBox23:setWidth(20);
    obj.imageCheckBox23:setHeight(20);
    obj.imageCheckBox23:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox23:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox23:setField("mysticism_trained");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout38);
    obj.label34:setLeft(255);
    obj.label34:setWidth(32);
    obj.label34:setHeight(20);
    obj.label34:setField("mysticism_total");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setFontColor("black");
    obj.label34:setName("label34");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout38);
    obj.button23:setLeft(255);
    obj.button23:setWidth(33);
    obj.button23:setHeight(20);
    obj.button23:setOpacity(0.5);
    obj.button23:setName("button23");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout38);
    obj.comboBox23:setLeft(312);
    obj.comboBox23:setWidth(33);
    obj.comboBox23:setHeight(20);
    obj.comboBox23:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox23:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox23:setField("mysticism_key");
    obj.comboBox23:setFontSize(10);
    obj.comboBox23:setTransparent(true);
    obj.comboBox23:setFontColor("black");
    obj.comboBox23:setName("comboBox23");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout38);
    obj.edit66:setLeft(365);
    obj.edit66:setWidth(23);
    obj.edit66:setHeight(20);
    obj.edit66:setField("mysticism_other");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontColor("black");
    obj.edit66:setTransparent(true);
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout38);
    obj.edit67:setLeft(407);
    obj.edit67:setWidth(23);
    obj.edit67:setHeight(20);
    obj.edit67:setField("mysticism_extra");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontColor("black");
    obj.edit67:setTransparent(true);
    obj.edit67:setName("edit67");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout38);
    obj.dataLink24:setFields({'mysticism_key', 'mysticism_other', 'mysticism_extra', 'skills_bonus', 'mysticism_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink24:setName("dataLink24");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout32);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(20);
    obj.layout39:setMargins({top=15});
    obj.layout39:setName("layout39");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout39);
    obj.imageCheckBox24:setLeft(11);
    obj.imageCheckBox24:setWidth(20);
    obj.imageCheckBox24:setHeight(20);
    obj.imageCheckBox24:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox24:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox24:setField("nobility_trained");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout39);
    obj.label35:setLeft(255);
    obj.label35:setWidth(32);
    obj.label35:setHeight(20);
    obj.label35:setField("nobility_total");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setFontColor("black");
    obj.label35:setName("label35");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout39);
    obj.button24:setLeft(255);
    obj.button24:setWidth(33);
    obj.button24:setHeight(20);
    obj.button24:setOpacity(0.5);
    obj.button24:setName("button24");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout39);
    obj.comboBox24:setLeft(312);
    obj.comboBox24:setWidth(33);
    obj.comboBox24:setHeight(20);
    obj.comboBox24:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox24:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox24:setField("nobility_key");
    obj.comboBox24:setFontSize(10);
    obj.comboBox24:setTransparent(true);
    obj.comboBox24:setFontColor("black");
    obj.comboBox24:setName("comboBox24");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout39);
    obj.edit68:setLeft(365);
    obj.edit68:setWidth(23);
    obj.edit68:setHeight(20);
    obj.edit68:setField("nobility_other");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontColor("black");
    obj.edit68:setTransparent(true);
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout39);
    obj.edit69:setLeft(407);
    obj.edit69:setWidth(23);
    obj.edit69:setHeight(20);
    obj.edit69:setField("nobility_extra");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontColor("black");
    obj.edit69:setTransparent(true);
    obj.edit69:setName("edit69");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout39);
    obj.dataLink25:setFields({'nobility_key', 'nobility_other', 'nobility_extra', 'skills_bonus', 'nobility_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink25:setName("dataLink25");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout32);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(20);
    obj.layout40:setMargins({top=16});
    obj.layout40:setName("layout40");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout40);
    obj.imageCheckBox25:setLeft(11);
    obj.imageCheckBox25:setWidth(20);
    obj.imageCheckBox25:setHeight(20);
    obj.imageCheckBox25:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox25:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox25:setField("perception_trained");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout40);
    obj.label36:setLeft(255);
    obj.label36:setWidth(32);
    obj.label36:setHeight(20);
    obj.label36:setField("perception_total");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setFontColor("black");
    obj.label36:setName("label36");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout40);
    obj.button25:setLeft(255);
    obj.button25:setWidth(33);
    obj.button25:setHeight(20);
    obj.button25:setOpacity(0.5);
    obj.button25:setName("button25");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout40);
    obj.comboBox25:setLeft(312);
    obj.comboBox25:setWidth(33);
    obj.comboBox25:setHeight(20);
    obj.comboBox25:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox25:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox25:setField("perception_key");
    obj.comboBox25:setFontSize(10);
    obj.comboBox25:setTransparent(true);
    obj.comboBox25:setFontColor("black");
    obj.comboBox25:setName("comboBox25");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout40);
    obj.edit70:setLeft(365);
    obj.edit70:setWidth(23);
    obj.edit70:setHeight(20);
    obj.edit70:setField("perception_other");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontColor("black");
    obj.edit70:setTransparent(true);
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout40);
    obj.edit71:setLeft(407);
    obj.edit71:setWidth(23);
    obj.edit71:setHeight(20);
    obj.edit71:setField("perception_extra");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontColor("black");
    obj.edit71:setTransparent(true);
    obj.edit71:setName("edit71");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout40);
    obj.dataLink26:setFields({'perception_key', 'perception_other', 'perception_extra', 'skills_bonus', 'perception_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink26:setName("dataLink26");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout32);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(20);
    obj.layout41:setMargins({top=15});
    obj.layout41:setName("layout41");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout41);
    obj.imageCheckBox26:setLeft(11);
    obj.imageCheckBox26:setWidth(20);
    obj.imageCheckBox26:setHeight(20);
    obj.imageCheckBox26:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox26:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox26:setField("piloting_trained");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout41);
    obj.label37:setLeft(255);
    obj.label37:setWidth(32);
    obj.label37:setHeight(20);
    obj.label37:setField("piloting_total");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setFontColor("black");
    obj.label37:setName("label37");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout41);
    obj.button26:setLeft(255);
    obj.button26:setWidth(33);
    obj.button26:setHeight(20);
    obj.button26:setOpacity(0.5);
    obj.button26:setName("button26");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout41);
    obj.comboBox26:setLeft(312);
    obj.comboBox26:setWidth(33);
    obj.comboBox26:setHeight(20);
    obj.comboBox26:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox26:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox26:setField("piloting_key");
    obj.comboBox26:setFontSize(10);
    obj.comboBox26:setTransparent(true);
    obj.comboBox26:setFontColor("black");
    obj.comboBox26:setName("comboBox26");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout41);
    obj.edit72:setLeft(365);
    obj.edit72:setWidth(23);
    obj.edit72:setHeight(20);
    obj.edit72:setField("piloting_other");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontColor("black");
    obj.edit72:setTransparent(true);
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout41);
    obj.edit73:setLeft(407);
    obj.edit73:setWidth(23);
    obj.edit73:setHeight(20);
    obj.edit73:setField("piloting_extra");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontColor("black");
    obj.edit73:setTransparent(true);
    obj.edit73:setName("edit73");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout41);
    obj.dataLink27:setFields({'piloting_key', 'piloting_other', 'piloting_extra', 'skills_bonus', 'piloting_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink27:setName("dataLink27");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout32);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(20);
    obj.layout42:setMargins({top=15});
    obj.layout42:setName("layout42");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout42);
    obj.imageCheckBox27:setLeft(11);
    obj.imageCheckBox27:setWidth(20);
    obj.imageCheckBox27:setHeight(20);
    obj.imageCheckBox27:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox27:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox27:setField("religion_trained");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout42);
    obj.label38:setLeft(255);
    obj.label38:setWidth(32);
    obj.label38:setHeight(20);
    obj.label38:setField("religion_total");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setFontColor("black");
    obj.label38:setName("label38");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout42);
    obj.button27:setLeft(255);
    obj.button27:setWidth(33);
    obj.button27:setHeight(20);
    obj.button27:setOpacity(0.5);
    obj.button27:setName("button27");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout42);
    obj.comboBox27:setLeft(312);
    obj.comboBox27:setWidth(33);
    obj.comboBox27:setHeight(20);
    obj.comboBox27:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox27:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox27:setField("religion_key");
    obj.comboBox27:setFontSize(10);
    obj.comboBox27:setTransparent(true);
    obj.comboBox27:setFontColor("black");
    obj.comboBox27:setName("comboBox27");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout42);
    obj.edit74:setLeft(365);
    obj.edit74:setWidth(23);
    obj.edit74:setHeight(20);
    obj.edit74:setField("religion_other");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontColor("black");
    obj.edit74:setTransparent(true);
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout42);
    obj.edit75:setLeft(407);
    obj.edit75:setWidth(23);
    obj.edit75:setHeight(20);
    obj.edit75:setField("religion_extra");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontColor("black");
    obj.edit75:setTransparent(true);
    obj.edit75:setName("edit75");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout42);
    obj.dataLink28:setFields({'religion_key', 'religion_other', 'religion_extra', 'skills_bonus', 'religion_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink28:setName("dataLink28");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout32);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(20);
    obj.layout43:setMargins({top=15});
    obj.layout43:setName("layout43");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout43);
    obj.imageCheckBox28:setLeft(11);
    obj.imageCheckBox28:setWidth(20);
    obj.imageCheckBox28:setHeight(20);
    obj.imageCheckBox28:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox28:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox28:setField("survival_trained");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout43);
    obj.label39:setLeft(255);
    obj.label39:setWidth(32);
    obj.label39:setHeight(20);
    obj.label39:setField("survival_total");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontColor("black");
    obj.label39:setName("label39");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout43);
    obj.button28:setLeft(255);
    obj.button28:setWidth(33);
    obj.button28:setHeight(20);
    obj.button28:setOpacity(0.5);
    obj.button28:setName("button28");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout43);
    obj.comboBox28:setLeft(312);
    obj.comboBox28:setWidth(33);
    obj.comboBox28:setHeight(20);
    obj.comboBox28:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox28:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox28:setField("survival_key");
    obj.comboBox28:setFontSize(10);
    obj.comboBox28:setTransparent(true);
    obj.comboBox28:setFontColor("black");
    obj.comboBox28:setName("comboBox28");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout43);
    obj.edit76:setLeft(365);
    obj.edit76:setWidth(23);
    obj.edit76:setHeight(20);
    obj.edit76:setField("survival_other");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontColor("black");
    obj.edit76:setTransparent(true);
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout43);
    obj.edit77:setLeft(407);
    obj.edit77:setWidth(23);
    obj.edit77:setHeight(20);
    obj.edit77:setField("survival_extra");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setFontColor("black");
    obj.edit77:setTransparent(true);
    obj.edit77:setName("edit77");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout43);
    obj.dataLink29:setFields({'survival_key', 'survival_other', 'survival_extra', 'skills_bonus', 'survival_trained', 'skills_penalty', 'str_mod', 'dex_mod', 'con_mod', 'int_mod', 'wis_mod', 'cha_mod', 'magic_lvl'});
    obj.dataLink29:setName("dataLink29");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox2);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(200);
    obj.layout44:setMargins({top=37});
    obj.layout44:setName("layout44");

    obj.rcl_custom_skills = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rcl_custom_skills:setParent(obj.layout44);
    obj.rcl_custom_skills:setLeft(55);
    obj.rcl_custom_skills:setWidth(907);
    obj.rcl_custom_skills:setHeight(200);
    obj.rcl_custom_skills:setName("rcl_custom_skills");
    obj.rcl_custom_skills:setField("rcl_custom_skills");
    obj.rcl_custom_skills:setTemplateForm("frmPericia");
    obj.rcl_custom_skills:setLayout("verticalTiles");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox2);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(67);
    obj.layout45:setMargins({top=20});
    obj.layout45:setName("layout45");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout45);
    obj.label40:setLeft(178);
    obj.label40:setTop(13);
    obj.label40:setWidth(56);
    obj.label40:setHeight(42);
    obj.label40:setFontColor("black");
    obj.label40:setField("skills_trained");
    obj.label40:setFontSize(24);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout45);
    obj.dataLink30:setFields({'initiative_trained', 'fight_trained', 'aim_trained', 'fort_trained', 'refl_trained', 'will_trained', 'acrobatics_trained', 'training_trained', 'athletics_trained', 'acting_trained', 'ride_trained', 'knowledge_trained', 'cure_trained', 'diplomacy_trained', 'deception_trained', 'stealth_trained', 'war_trained', 'intimidation_trained', 'intuition_trained', 'investigation_trained', 'gambling_trained', 'thievery_trained', 'mysticism_trained', 'nobility_trained', 'perception_trained', 'piloting_trained', 'religion_trained', 'survival_trained', 'custom_trained'});
    obj.dataLink30:setName("dataLink30");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout45);
    obj.label41:setLeft(388);
    obj.label41:setTop(13);
    obj.label41:setWidth(56);
    obj.label41:setHeight(42);
    obj.label41:setFontColor("black");
    obj.label41:setField("skills_bonus");
    obj.label41:setFontSize(24);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout45);
    obj.label42:setLeft(648);
    obj.label42:setTop(13);
    obj.label42:setWidth(56);
    obj.label42:setHeight(42);
    obj.label42:setFontColor("black");
    obj.label42:setField("skills_penalty");
    obj.label42:setFontSize(24);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout45);
    obj.button29:setLeft(739);
    obj.button29:setTop(3);
    obj.button29:setWidth(227);
    obj.button29:setHeight(67);
    obj.button29:setOpacity(0.25);
    obj.button29:setName("button29");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Poderes");
    obj.tab3:setName("tab3");

    obj.frmPoderes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPoderes:setParent(obj.tab3);
    obj.frmPoderes:setName("frmPoderes");
    obj.frmPoderes:setAlign("client");
    obj.frmPoderes:setTheme("dark");


        


    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmPoderes);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox3);
    obj.image4:setWidth(1000);
    obj.image4:setHeight(1000);
    obj.image4:setSRC("/imagens/3-Poderes.png");
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox3);
    obj.image5:setLeft(313);
    obj.image5:setTop(31);
    obj.image5:setWidth(61);
    obj.image5:setHeight(61);
    obj.image5:setSRC("/imagens/botao_add.png");
    obj.image5:setHitTest(true);
    obj.image5:setCursor("handPoint");
    obj.image5:setName("image5");

    obj.rcl_power = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rcl_power:setParent(obj.scrollBox3);
    obj.rcl_power:setLeft(55);
    obj.rcl_power:setTop(93);
    obj.rcl_power:setWidth(286);
    obj.rcl_power:setHeight(855);
    obj.rcl_power:setName("rcl_power");
    obj.rcl_power:setField("rcl_power");
    obj.rcl_power:setTemplateForm("frmDbsSelector");
    obj.rcl_power:setLayout("vertical");
    obj.rcl_power:setSelectable(true);

    obj.dsb_power = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dsb_power:setParent(obj.scrollBox3);
    obj.dsb_power:setLeft(385);
    obj.dsb_power:setTop(59);
    obj.dsb_power:setWidth(593);
    obj.dsb_power:setHeight(591);
    obj.dsb_power:setName("dsb_power");
    obj.dsb_power:setVisible(false);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.dsb_power);
    obj.image6:setWidth(593);
    obj.image6:setHeight(591);
    obj.image6:setSRC("/imagens/Extra_Poder.png");
    obj.image6:setName("image6");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.dsb_power);
    obj.edit78:setLeft(49);
    obj.edit78:setTop(49);
    obj.edit78:setWidth(496);
    obj.edit78:setHeight(32);
    obj.edit78:setField("nome");
    obj.edit78:setFontColor("black");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setFontSize(20);
    obj.edit78:setTransparent(true);
    obj.edit78:setName("edit78");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.dsb_power);
    obj.textEditor2:setLeft(49);
    obj.textEditor2:setTop(128);
    obj.textEditor2:setWidth(496);
    obj.textEditor2:setHeight(343);
    obj.textEditor2:setField("details");
    obj.textEditor2:setFontColor("black");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.dsb_power);
    obj.edit79:setLeft(49);
    obj.edit79:setTop(516);
    obj.edit79:setWidth(244);
    obj.edit79:setHeight(32);
    obj.edit79:setField("type");
    obj.edit79:setFontColor("black");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setFontSize(20);
    obj.edit79:setTransparent(true);
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.dsb_power);
    obj.edit80:setLeft(313);
    obj.edit80:setTop(516);
    obj.edit80:setWidth(158);
    obj.edit80:setHeight(32);
    obj.edit80:setField("source");
    obj.edit80:setFontColor("black");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setFontSize(20);
    obj.edit80:setTransparent(true);
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.dsb_power);
    obj.edit81:setLeft(493);
    obj.edit81:setTop(516);
    obj.edit81:setWidth(52);
    obj.edit81:setHeight(32);
    obj.edit81:setField("level");
    obj.edit81:setFontColor("black");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(20);
    obj.edit81:setTransparent(true);
    obj.edit81:setName("edit81");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Magias");
    obj.tab4:setName("tab4");

    obj.frmMagias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMagias:setParent(obj.tab4);
    obj.frmMagias:setName("frmMagias");
    obj.frmMagias:setAlign("client");
    obj.frmMagias:setTheme("dark");


        


    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmMagias);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox4);
    obj.image7:setWidth(1000);
    obj.image7:setHeight(1000);
    obj.image7:setSRC("/imagens/4-Magias.png");
    obj.image7:setName("image7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox4);
    obj.image8:setLeft(313);
    obj.image8:setTop(31);
    obj.image8:setWidth(61);
    obj.image8:setHeight(61);
    obj.image8:setSRC("/imagens/botao_add.png");
    obj.image8:setHitTest(true);
    obj.image8:setCursor("handPoint");
    obj.image8:setName("image8");

    obj.rcl_magic = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rcl_magic:setParent(obj.scrollBox4);
    obj.rcl_magic:setLeft(55);
    obj.rcl_magic:setTop(93);
    obj.rcl_magic:setWidth(286);
    obj.rcl_magic:setHeight(855);
    obj.rcl_magic:setName("rcl_magic");
    obj.rcl_magic:setField("rcl_magic");
    obj.rcl_magic:setTemplateForm("frmDbsSelector");
    obj.rcl_magic:setLayout("vertical");
    obj.rcl_magic:setSelectable(true);

    obj.dsb_magic = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dsb_magic:setParent(obj.scrollBox4);
    obj.dsb_magic:setLeft(385);
    obj.dsb_magic:setTop(59);
    obj.dsb_magic:setWidth(593);
    obj.dsb_magic:setHeight(791);
    obj.dsb_magic:setName("dsb_magic");
    obj.dsb_magic:setVisible(false);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.dsb_magic);
    obj.image9:setWidth(593);
    obj.image9:setHeight(791);
    obj.image9:setSRC("/imagens/Extra_Magia.png");
    obj.image9:setName("image9");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.dsb_magic);
    obj.edit82:setLeft(49);
    obj.edit82:setTop(55);
    obj.edit82:setWidth(361);
    obj.edit82:setHeight(33);
    obj.edit82:setField("nome");
    obj.edit82:setFontColor("black");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setFontSize(20);
    obj.edit82:setTransparent(true);
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.dsb_magic);
    obj.edit83:setLeft(432);
    obj.edit83:setTop(55);
    obj.edit83:setWidth(114);
    obj.edit83:setHeight(33);
    obj.edit83:setField("casting");
    obj.edit83:setFontColor("black");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setFontSize(20);
    obj.edit83:setTransparent(true);
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.dsb_magic);
    obj.edit84:setLeft(48);
    obj.edit84:setTop(128);
    obj.edit84:setWidth(52);
    obj.edit84:setHeight(33);
    obj.edit84:setField("level");
    obj.edit84:setFontColor("black");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setFontSize(20);
    obj.edit84:setTransparent(true);
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.dsb_magic);
    obj.edit85:setLeft(124);
    obj.edit85:setTop(128);
    obj.edit85:setWidth(114);
    obj.edit85:setHeight(33);
    obj.edit85:setField("reach");
    obj.edit85:setFontColor("black");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setFontSize(20);
    obj.edit85:setTransparent(true);
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.dsb_magic);
    obj.edit86:setLeft(259);
    obj.edit86:setTop(128);
    obj.edit86:setWidth(116);
    obj.edit86:setHeight(33);
    obj.edit86:setField("target");
    obj.edit86:setFontColor("black");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setFontSize(20);
    obj.edit86:setTransparent(true);
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.dsb_magic);
    obj.edit87:setLeft(395);
    obj.edit87:setTop(128);
    obj.edit87:setWidth(151);
    obj.edit87:setHeight(33);
    obj.edit87:setField("resistance");
    obj.edit87:setFontColor("black");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setFontSize(20);
    obj.edit87:setTransparent(true);
    obj.edit87:setName("edit87");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.dsb_magic);
    obj.textEditor3:setLeft(49);
    obj.textEditor3:setTop(206);
    obj.textEditor3:setWidth(496);
    obj.textEditor3:setHeight(495);
    obj.textEditor3:setField("details");
    obj.textEditor3:setFontColor("black");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.scrollBox4);
    obj.label43:setLeft(451);
    obj.label43:setTop(890);
    obj.label43:setWidth(57);
    obj.label43:setHeight(35);
    obj.label43:setFontSize(20);
    obj.label43:setFontColor("black");
    obj.label43:setField("magic_cd");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.scrollBox4);
    obj.label44:setLeft(665);
    obj.label44:setTop(892);
    obj.label44:setWidth(47);
    obj.label44:setHeight(35);
    obj.label44:setFontSize(20);
    obj.label44:setFontColor("black");
    obj.label44:setField("magic_lvl");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.scrollBox4);
    obj.comboBox29:setLeft(743);
    obj.comboBox29:setTop(892);
    obj.comboBox29:setWidth(47);
    obj.comboBox29:setHeight(35);
    obj.comboBox29:setItems({'for', 'des', 'con', 'int', 'sab', 'car'});
    obj.comboBox29:setValues({'str', 'dex', 'con', 'int', 'wis', 'cha'});
    obj.comboBox29:setField("magic_key");
    obj.comboBox29:setFontSize(20);
    obj.comboBox29:setTransparent(true);
    obj.comboBox29:setFontColor("black");
    obj.comboBox29:setName("comboBox29");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.scrollBox4);
    obj.edit88:setLeft(818);
    obj.edit88:setTop(890);
    obj.edit88:setWidth(51);
    obj.edit88:setHeight(35);
    obj.edit88:setFontSize(20);
    obj.edit88:setField("magic_other");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontColor("black");
    obj.edit88:setTransparent(true);
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.scrollBox4);
    obj.edit89:setLeft(896);
    obj.edit89:setTop(890);
    obj.edit89:setWidth(51);
    obj.edit89:setHeight(35);
    obj.edit89:setFontSize(20);
    obj.edit89:setField("magic_extra");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setFontColor("black");
    obj.edit89:setTransparent(true);
    obj.edit89:setName("edit89");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.scrollBox4);
    obj.dataLink31:setFields({'magic_lvl', 'magic_key', 'magic_other', 'magic_extra'});
    obj.dataLink31:setName("dataLink31");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Equipamento");
    obj.tab5:setName("tab5");

    obj.frmEquipamento = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEquipamento:setParent(obj.tab5);
    obj.frmEquipamento:setName("frmEquipamento");
    obj.frmEquipamento:setAlign("client");
    obj.frmEquipamento:setTheme("dark");


        


    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmEquipamento);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox5);
    obj.image10:setWidth(1000);
    obj.image10:setHeight(1000);
    obj.image10:setSRC("/imagens/5-Equipamento.png");
    obj.image10:setName("image10");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.scrollBox5);
    obj.edit90:setLeft(69);
    obj.edit90:setTop(114);
    obj.edit90:setHeight(33);
    obj.edit90:setWidth(221);
    obj.edit90:setField("armor");
    obj.edit90:setTransparent(true);
    obj.edit90:setFontColor("black");
    obj.edit90:setFontSize(20);
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.scrollBox5);
    obj.edit91:setLeft(308);
    obj.edit91:setTop(114);
    obj.edit91:setHeight(33);
    obj.edit91:setWidth(79);
    obj.edit91:setField("armor_bonus");
    obj.edit91:setTransparent(true);
    obj.edit91:setFontColor("black");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setFontSize(20);
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.scrollBox5);
    obj.edit92:setLeft(405);
    obj.edit92:setTop(114);
    obj.edit92:setHeight(33);
    obj.edit92:setWidth(79);
    obj.edit92:setField("armor_pen");
    obj.edit92:setTransparent(true);
    obj.edit92:setFontColor("black");
    obj.edit92:setType("number");
    obj.edit92:setMax(0);
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setFontSize(20);
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.scrollBox5);
    obj.edit93:setLeft(69);
    obj.edit93:setTop(165);
    obj.edit93:setHeight(33);
    obj.edit93:setWidth(221);
    obj.edit93:setField("shield");
    obj.edit93:setTransparent(true);
    obj.edit93:setFontColor("black");
    obj.edit93:setFontSize(20);
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.scrollBox5);
    obj.edit94:setLeft(308);
    obj.edit94:setTop(165);
    obj.edit94:setHeight(33);
    obj.edit94:setWidth(79);
    obj.edit94:setField("shield_bonus");
    obj.edit94:setTransparent(true);
    obj.edit94:setFontColor("black");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setFontSize(20);
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.scrollBox5);
    obj.edit95:setLeft(405);
    obj.edit95:setTop(165);
    obj.edit95:setHeight(33);
    obj.edit95:setWidth(79);
    obj.edit95:setField("shield_pen");
    obj.edit95:setTransparent(true);
    obj.edit95:setFontColor("black");
    obj.edit95:setType("number");
    obj.edit95:setMax(0);
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setFontSize(20);
    obj.edit95:setName("edit95");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.scrollBox5);
    obj.dataLink32:setFields({'armor_bonus','shield_bonus'});
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.scrollBox5);
    obj.dataLink33:setFields({'armor_pen','shield_pen'});
    obj.dataLink33:setName("dataLink33");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.scrollBox5);
    obj.label45:setLeft(69);
    obj.label45:setTop(294);
    obj.label45:setHeight(33);
    obj.label45:setWidth(171);
    obj.label45:setField("cash_total");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setFontColor("black");
    obj.label45:setFontSize(20);
    obj.label45:setName("label45");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.scrollBox5);
    obj.edit96:setLeft(278);
    obj.edit96:setTop(294);
    obj.edit96:setHeight(33);
    obj.edit96:setWidth(83);
    obj.edit96:setField("cash_to");
    obj.edit96:setTransparent(true);
    obj.edit96:setFontColor("black");
    obj.edit96:setType("number");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setFontSize(20);
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.scrollBox5);
    obj.edit97:setLeft(401);
    obj.edit97:setTop(294);
    obj.edit97:setHeight(33);
    obj.edit97:setWidth(83);
    obj.edit97:setField("cash_ts");
    obj.edit97:setTransparent(true);
    obj.edit97:setFontColor("black");
    obj.edit97:setType("number");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setFontSize(20);
    obj.edit97:setName("edit97");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.scrollBox5);
    obj.dataLink34:setFields({'cash_to','cash_ts'});
    obj.dataLink34:setName("dataLink34");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.scrollBox5);
    obj.textEditor4:setLeft(69);
    obj.textEditor4:setTop(398);
    obj.textEditor4:setHeight(467);
    obj.textEditor4:setWidth(415);
    obj.textEditor4:setField("itens");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setFontColor("black");
    obj.textEditor4:setName("textEditor4");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.scrollBox5);
    obj.edit98:setLeft(176);
    obj.edit98:setTop(917);
    obj.edit98:setHeight(34);
    obj.edit98:setWidth(111);
    obj.edit98:setField("weight_curr");
    obj.edit98:setTransparent(true);
    obj.edit98:setFontColor("black");
    obj.edit98:setType("number");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setFontSize(20);
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.scrollBox5);
    obj.edit99:setLeft(300);
    obj.edit99:setTop(917);
    obj.edit99:setHeight(34);
    obj.edit99:setWidth(111);
    obj.edit99:setField("weight_total");
    obj.edit99:setTransparent(true);
    obj.edit99:setFontColor("black");
    obj.edit99:setType("number");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setFontSize(20);
    obj.edit99:setName("edit99");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.scrollBox5);
    obj.button30:setLeft(738);
    obj.button30:setTop(907);
    obj.button30:setHeight(67);
    obj.button30:setWidth(228);
    obj.button30:setOpacity(0.5);
    obj.button30:setName("button30");

    obj.rcl_attack = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rcl_attack:setParent(obj.scrollBox5);
    obj.rcl_attack:setLeft(519);
    obj.rcl_attack:setTop(98);
    obj.rcl_attack:setHeight(782);
    obj.rcl_attack:setWidth(443);
    obj.rcl_attack:setName("rcl_attack");
    obj.rcl_attack:setField("rcl_attack");
    obj.rcl_attack:setTemplateForm("frmAtaque");
    obj.rcl_attack:setLayout("vertical");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Detalhes");
    obj.tab6:setName("tab6");

    obj.frmDetalhes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDetalhes:setParent(obj.tab6);
    obj.frmDetalhes:setName("frmDetalhes");
    obj.frmDetalhes:setAlign("client");
    obj.frmDetalhes:setTheme("dark");


        


    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmDetalhes);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.scrollBox6);
    obj.image11:setWidth(1000);
    obj.image11:setHeight(1000);
    obj.image11:setSRC("/imagens/6-Detalhes.png");
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.scrollBox6);
    obj.image12:setLeft(23);
    obj.image12:setTop(31);
    obj.image12:setWidth(61);
    obj.image12:setHeight(61);
    obj.image12:setSRC("/imagens/botao_add.png");
    obj.image12:setHitTest(true);
    obj.image12:setCursor("handPoint");
    obj.image12:setName("image12");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.scrollBox6);
    obj.image13:setLeft(934);
    obj.image13:setTop(31);
    obj.image13:setWidth(61);
    obj.image13:setHeight(61);
    obj.image13:setSRC("/imagens/botao_add.png");
    obj.image13:setHitTest(true);
    obj.image13:setCursor("handPoint");
    obj.image13:setName("image13");

    obj.rcl_connection1 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rcl_connection1:setParent(obj.scrollBox6);
    obj.rcl_connection1:setLeft(55);
    obj.rcl_connection1:setTop(91);
    obj.rcl_connection1:setWidth(443);
    obj.rcl_connection1:setHeight(545);
    obj.rcl_connection1:setName("rcl_connection1");
    obj.rcl_connection1:setField("rcl_connection1");
    obj.rcl_connection1:setTemplateForm("frmConexao");
    obj.rcl_connection1:setLayout("vertical");

    obj.rcl_connection2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rcl_connection2:setParent(obj.scrollBox6);
    obj.rcl_connection2:setLeft(519);
    obj.rcl_connection2:setTop(91);
    obj.rcl_connection2:setWidth(443);
    obj.rcl_connection2:setHeight(545);
    obj.rcl_connection2:setName("rcl_connection2");
    obj.rcl_connection2:setField("rcl_connection2");
    obj.rcl_connection2:setTemplateForm("frmConexao");
    obj.rcl_connection2:setLayout("vertical");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.scrollBox6);
    obj.edit100:setLeft(69);
    obj.edit100:setTop(752);
    obj.edit100:setWidth(196);
    obj.edit100:setHeight(36);
    obj.edit100:setField("height");
    obj.edit100:setTransparent(true);
    obj.edit100:setFontColor("black");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setFontSize(20);
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.scrollBox6);
    obj.edit101:setLeft(277);
    obj.edit101:setTop(752);
    obj.edit101:setWidth(196);
    obj.edit101:setHeight(36);
    obj.edit101:setField("hair");
    obj.edit101:setTransparent(true);
    obj.edit101:setFontColor("black");
    obj.edit101:setFontSize(20);
    obj.edit101:setName("edit101");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.scrollBox6);
    obj.textEditor5:setLeft(490);
    obj.textEditor5:setTop(752);
    obj.textEditor5:setWidth(456);
    obj.textEditor5:setHeight(186);
    obj.textEditor5:setField("details");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setFontColor("black");
    obj.textEditor5:setName("textEditor5");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.scrollBox6);
    obj.edit102:setLeft(69);
    obj.edit102:setTop(827);
    obj.edit102:setWidth(196);
    obj.edit102:setHeight(36);
    obj.edit102:setField("eyes");
    obj.edit102:setTransparent(true);
    obj.edit102:setFontColor("black");
    obj.edit102:setFontSize(20);
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.scrollBox6);
    obj.edit103:setLeft(277);
    obj.edit103:setTop(827);
    obj.edit103:setWidth(196);
    obj.edit103:setHeight(36);
    obj.edit103:setField("skin");
    obj.edit103:setTransparent(true);
    obj.edit103:setFontColor("black");
    obj.edit103:setFontSize(20);
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.scrollBox6);
    obj.edit104:setLeft(69);
    obj.edit104:setTop(902);
    obj.edit104:setWidth(404);
    obj.edit104:setHeight(36);
    obj.edit104:setField("body");
    obj.edit104:setTransparent(true);
    obj.edit104:setFontColor("black");
    obj.edit104:setFontSize(20);
    obj.edit104:setName("edit104");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Historia");
    obj.tab7:setName("tab7");

    obj.frmHistoria = GUI.fromHandle(_obj_newObject("form"));
    obj.frmHistoria:setParent(obj.tab7);
    obj.frmHistoria:setName("frmHistoria");
    obj.frmHistoria:setAlign("client");
    obj.frmHistoria:setTheme("dark");


        


    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmHistoria);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.scrollBox7);
    obj.image14:setWidth(1000);
    obj.image14:setHeight(1000);
    obj.image14:setSRC("/imagens/7-Historia.png");
    obj.image14:setName("image14");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.scrollBox7);
    obj.richEdit1:setLeft(76);
    obj.richEdit1:setTop(117);
    obj.richEdit1:setWidth(865);
    obj.richEdit1:setHeight(752);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Anotações");
    obj.tab8:setName("tab8");

    obj.frmNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmNotes:setParent(obj.tab8);
    obj.frmNotes:setName("frmNotes");
    obj.frmNotes:setAlign("client");
    obj.frmNotes:setTheme("dark");


        


    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmNotes);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.scrollBox8);
    obj.image15:setWidth(1000);
    obj.image15:setHeight(1000);
    obj.image15:setSRC("/imagens/8-Anotacoes.png");
    obj.image15:setName("image15");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.scrollBox8);
    obj.richEdit2:setLeft(76);
    obj.richEdit2:setTop(117);
    obj.richEdit2:setWidth(865);
    obj.richEdit2:setHeight(752);
    obj.richEdit2:setField("notes");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit2, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setName("richEdit2");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Creditos");
    obj.tab9:setName("tab9");

    obj.frmCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCreditos:setParent(obj.tab9);
    obj.frmCreditos:setName("frmCreditos");
    obj.frmCreditos:setAlign("client");
    obj.frmCreditos:setTheme("dark");


        


    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmCreditos);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.scrollBox9);
    obj.image16:setWidth(1000);
    obj.image16:setHeight(1000);
    obj.image16:setSRC("/imagens/9-Creditos.png");
    obj.image16:setName("image16");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.scrollBox9);
    obj.label46:setLeft(245);
    obj.label46:setTop(439);
    obj.label46:setWidth(75);
    obj.label46:setHeight(20);
    obj.label46:setField("versionInstalled");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setFontColor("black");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.scrollBox9);
    obj.label47:setLeft(245);
    obj.label47:setTop(467);
    obj.label47:setWidth(75);
    obj.label47:setHeight(20);
    obj.label47:setField("versionDownloaded");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontColor("black");
    obj.label47:setName("label47");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.scrollBox9);
    obj.imageCheckBox29:setLeft(78);
    obj.imageCheckBox29:setTop(514);
    obj.imageCheckBox29:setWidth(27);
    obj.imageCheckBox29:setHeight(27);
    obj.imageCheckBox29:setImageChecked("imagens/Marcado.png");
    obj.imageCheckBox29:setImageUnchecked("imagens/Nao_Marcado.png");
    obj.imageCheckBox29:setField("noUpdate");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.scrollBox9);
    obj.button31:setLeft(78);
    obj.button31:setTop(551);
    obj.button31:setWidth(119);
    obj.button31:setHeight(40);
    obj.button31:setOpacity(0.5);
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.scrollBox9);
    obj.button32:setLeft(208);
    obj.button32:setTop(551);
    obj.button32:setWidth(119);
    obj.button32:setHeight(40);
    obj.button32:setOpacity(0.5);
    obj.button32:setName("button32");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.scrollBox9);
    obj.button33:setLeft(78);
    obj.button33:setTop(804);
    obj.button33:setWidth(172);
    obj.button33:setHeight(57);
    obj.button33:setOpacity(0.5);
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.scrollBox9);
    obj.button34:setLeft(78);
    obj.button34:setTop(872);
    obj.button34:setWidth(359);
    obj.button34:setHeight(57);
    obj.button34:setOpacity(0.5);
    obj.button34:setName("button34");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20T20/output/Ficha%20T20.rpk?raw=true",
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
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20T20/output/Ficha%20T20.rpk?raw=true');
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

    obj._e_event1 = obj.edit6:addEventListener("onChange",
        function (_)
            if sheet==nil then return end
            
                                local lvl = tonumber(sheet.level) or 1
            
                                if lvl <= 6 then
                                    sheet.skills_bonus = 2
                                elseif lvl <= 15 then
                                    sheet.skills_bonus = 4
                                else
                                    sheet.skills_bonus = 6
                                end
            
                                sheet.magic_lvl = math.floor(lvl/2)
            
                                -- Update custom skills bonus
                                local nodes = NDB.getChildNodes(sheet.rcl_custom_skills); 
                                for i=1, #nodes, 1 do
                                    nodes[i].skills_bonus = sheet.skills_bonus
                                    nodes[i].level = sheet.magic_lvl
                                end
            
                                -- Update custom attacks bonus
                                local nodes = NDB.getChildNodes(sheet.rcl_attack); 
                                for i=1, #nodes, 1 do
                                    nodes[i].skills_bonus = sheet.skills_bonus
                                    nodes[i].level = sheet.magic_lvl
                                end
        end, obj);

    obj._e_event2 = obj.edit7:addEventListener("onChange",
        function (_)
            if sheet==nil then return end
            
                            local mod = math.floor((tonumber(sheet.str or 0)-10)/2)
                            if mod>0 then mod = "+" .. mod end
            
                            sheet.str_mod = mod
            
                            -- Update custom skills atr
                            local nodes = NDB.getChildNodes(sheet.rcl_custom_skills); 
                            for i=1, #nodes, 1 do
                                nodes[i].str_mod = sheet.str_mod
                            end
            
                            -- Update custom attacks atr
                            local nodes = NDB.getChildNodes(sheet.rcl_attack); 
                            for i=1, #nodes, 1 do
                                nodes[i].str_mod = sheet.str_mod
                            end
        end, obj);

    obj._e_event3 = obj.edit8:addEventListener("onChange",
        function (_)
            if sheet==nil then return end
            
                            local mod = math.floor((tonumber(sheet.dex or 0)-10)/2)
                            if mod>0 then mod = "+" .. mod end
            
                            sheet.dex_mod = mod
            
                            -- Update custom skills atr
                            local nodes = NDB.getChildNodes(sheet.rcl_custom_skills); 
                            for i=1, #nodes, 1 do
                                nodes[i].dex_mod = sheet.dex_mod
                            end
            
                            -- Update custom attacks atr
                            local nodes = NDB.getChildNodes(sheet.rcl_attack); 
                            for i=1, #nodes, 1 do
                                nodes[i].dex_mod = sheet.dex_mod
                            end
        end, obj);

    obj._e_event4 = obj.edit9:addEventListener("onChange",
        function (_)
            if sheet==nil then return end
            
                            local mod = math.floor((tonumber(sheet.con or 0)-10)/2)
                            if mod>0 then mod = "+" .. mod end
            
                            sheet.con_mod = mod
            
                            -- Update custom skills atr
                            local nodes = NDB.getChildNodes(sheet.rcl_custom_skills); 
                            for i=1, #nodes, 1 do
                                nodes[i].con_mod = sheet.con_mod
                            end
            
                            -- Update custom attacks atr
                            local nodes = NDB.getChildNodes(sheet.rcl_attack); 
                            for i=1, #nodes, 1 do
                                nodes[i].con_mod = sheet.con_mod
                            end
        end, obj);

    obj._e_event5 = obj.edit10:addEventListener("onChange",
        function (_)
            if sheet==nil then return end
            
                            local mod = math.floor((tonumber(sheet.int or 0)-10)/2)
                            if mod>0 then mod = "+" .. mod end
            
                            sheet.int_mod = mod
            
                            -- Update custom skills atr
                            local nodes = NDB.getChildNodes(sheet.rcl_custom_skills); 
                            for i=1, #nodes, 1 do
                                nodes[i].int_mod = sheet.int_mod
                            end
            
                            -- Update custom attacks atr
                            local nodes = NDB.getChildNodes(sheet.rcl_attack); 
                            for i=1, #nodes, 1 do
                                nodes[i].int_mod = sheet.int_mod
                            end
        end, obj);

    obj._e_event6 = obj.edit11:addEventListener("onChange",
        function (_)
            if sheet==nil then return end
            
                            local mod = math.floor((tonumber(sheet.wis or 0)-10)/2)
                            if mod>0 then mod = "+" .. mod end
            
                            sheet.wis_mod = mod
            
                            -- Update custom skills atr
                            local nodes = NDB.getChildNodes(sheet.rcl_custom_skills); 
                            for i=1, #nodes, 1 do
                                nodes[i].wis_mod = sheet.wis_mod
                            end
            
                            -- Update custom attacks atr
                            local nodes = NDB.getChildNodes(sheet.rcl_attack); 
                            for i=1, #nodes, 1 do
                                nodes[i].wis_mod = sheet.wis_mod
                            end
        end, obj);

    obj._e_event7 = obj.edit12:addEventListener("onChange",
        function (_)
            if sheet==nil then return end
            
                            local mod = math.floor((tonumber(sheet.cha or 0)-10)/2)
                            if mod>0 then mod = "+" .. mod end
            
                            sheet.cha_mod = mod
            
                            -- Update custom skills atr
                            local nodes = NDB.getChildNodes(sheet.rcl_custom_skills); 
                            for i=1, #nodes, 1 do
                                nodes[i].cha_mod = sheet.cha_mod
                            end
            
                            -- Update custom attacks atr
                            local nodes = NDB.getChildNodes(sheet.rcl_attack); 
                            for i=1, #nodes, 1 do
                                nodes[i].cha_mod = sheet.cha_mod
                            end
        end, obj);

    obj._e_event8 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.defense = tonumber(sheet.defense_armor or 0) +
                                                tonumber(sheet.defense_other or 0) +
                                                tonumber(sheet.defense_extra or 0) +
                                                tonumber(sheet.defense_optional or 0) + 10
        end, obj);

    obj._e_event9 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event10 = obj.button1:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.initiative_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Iniciativa");
        end, obj);

    obj._e_event11 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            if sheet.initiative_key==nil or sheet.initiative_key=="" then 
                                sheet.initiative_key="dex" 
                            end
            
                            local train = 0
                            if sheet.initiative_trained then
                                train = tonumber(sheet.skills_bonus or 0)
                            end
            
                            sheet.initiative_total =  tonumber(sheet[sheet.initiative_key.."_mod"] or 0) + 
                                                    train + 
                                                    tonumber(sheet.initiative_other or 0) + 
                                                    tonumber(sheet.initiative_extra or 0) + 
                                                    tonumber(sheet.magic_lvl or 0)
        end, obj);

    obj._e_event12 = obj.button2:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.fight_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Luta");
        end, obj);

    obj._e_event13 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            if sheet.fight_key==nil or sheet.fight_key=="" then 
                                sheet.fight_key="str" 
                            end
            
                            local train = 0
                            if sheet.fight_trained then
                                train = tonumber(sheet.skills_bonus or 0)
                            end
            
                            sheet.fight_total =  tonumber(sheet[sheet.fight_key.."_mod"] or 0) + 
                                                    train + 
                                                    tonumber(sheet.fight_other or 0) + 
                                                    tonumber(sheet.fight_extra or 0) + 
                                                    tonumber(sheet.magic_lvl or 0)
        end, obj);

    obj._e_event14 = obj.button3:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.aim_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Pontaria");
        end, obj);

    obj._e_event15 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            if sheet.aim_key==nil or sheet.aim_key=="" then 
                                sheet.aim_key="dex" 
                            end
            
                            local train = 0
                            if sheet.aim_trained then
                                train = tonumber(sheet.skills_bonus or 0)
                            end
            
                            sheet.aim_total =  tonumber(sheet[sheet.aim_key.."_mod"] or 0) + 
                                                    train + 
                                                    tonumber(sheet.aim_other or 0) + 
                                                    tonumber(sheet.aim_extra or 0) + 
                                                    tonumber(sheet.magic_lvl or 0)
        end, obj);

    obj._e_event16 = obj.button4:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.fort_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Fortitude");
        end, obj);

    obj._e_event17 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            if sheet.fort_key==nil or sheet.fort_key=="" then 
                                sheet.fort_key="con" 
                            end
            
                            local train = 0
                            if sheet.fort_trained then
                                train = tonumber(sheet.skills_bonus or 0)
                            end
            
                            sheet.fort_total =  tonumber(sheet[sheet.fort_key.."_mod"] or 0) + 
                                                    train + 
                                                    tonumber(sheet.fort_other or 0) + 
                                                    tonumber(sheet.fort_extra or 0) + 
                                                    tonumber(sheet.magic_lvl or 0)
        end, obj);

    obj._e_event18 = obj.button5:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.refl_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Reflexos");
        end, obj);

    obj._e_event19 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            if sheet.refl_key==nil or sheet.refl_key=="" then 
                                sheet.refl_key="dex" 
                            end
            
                            local train = 0
                            if sheet.refl_trained then
                                train = tonumber(sheet.skills_bonus or 0)
                            end
            
                            sheet.refl_total =  tonumber(sheet[sheet.refl_key.."_mod"] or 0) + 
                                                    train + 
                                                    tonumber(sheet.refl_other or 0) + 
                                                    tonumber(sheet.refl_extra or 0) + 
                                                    tonumber(sheet.magic_lvl or 0)
        end, obj);

    obj._e_event20 = obj.button6:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.will_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Vontade");
        end, obj);

    obj._e_event21 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            if sheet.will_key==nil or sheet.will_key=="" then 
                                sheet.will_key="wis" 
                            end
            
                            local train = 0
                            if sheet.will_trained then
                                train = tonumber(sheet.skills_bonus or 0)
                            end
            
                            sheet.will_total =  tonumber(sheet[sheet.will_key.."_mod"] or 0) + 
                                                    train + 
                                                    tonumber(sheet.will_other or 0) + 
                                                    tonumber(sheet.will_extra or 0) + 
                                                    tonumber(sheet.magic_lvl or 0)
        end, obj);

    obj._e_event22 = obj.button7:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.acrobatics_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Acrobacia");
        end, obj);

    obj._e_event23 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.acrobatics_key)
                            if sheet.acrobatics_key==nil or sheet.acrobatics_key=="" then 
                                sheet.acrobatics_key="dex" 
                            end
            
                            if false and not sheet.acrobatics_trained then
                                sheet.acrobatics_total = ""
                            else
            
                                local pen = 0
                                if true then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.acrobatics_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.acrobatics_total =  tonumber(sheet[sheet.acrobatics_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.acrobatics_other or 0) + 
                                                        tonumber(sheet.acrobatics_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event24 = obj.button8:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.training_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Adestramento");
        end, obj);

    obj._e_event25 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.training_key)
                            if sheet.training_key==nil or sheet.training_key=="" then 
                                sheet.training_key="cha" 
                            end
            
                            if true and not sheet.training_trained then
                                sheet.training_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.training_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.training_total =  tonumber(sheet[sheet.training_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.training_other or 0) + 
                                                        tonumber(sheet.training_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event26 = obj.button9:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.athletics_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Atletismo");
        end, obj);

    obj._e_event27 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.athletics_key)
                            if sheet.athletics_key==nil or sheet.athletics_key=="" then 
                                sheet.athletics_key="str" 
                            end
            
                            if false and not sheet.athletics_trained then
                                sheet.athletics_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.athletics_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.athletics_total =  tonumber(sheet[sheet.athletics_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.athletics_other or 0) + 
                                                        tonumber(sheet.athletics_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event28 = obj.button10:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.acting_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Atuação");
        end, obj);

    obj._e_event29 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.acting_key)
                            if sheet.acting_key==nil or sheet.acting_key=="" then 
                                sheet.acting_key="cha" 
                            end
            
                            if false and not sheet.acting_trained then
                                sheet.acting_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.acting_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.acting_total =  tonumber(sheet[sheet.acting_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.acting_other or 0) + 
                                                        tonumber(sheet.acting_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event30 = obj.button11:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.ride_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Cavalgar");
        end, obj);

    obj._e_event31 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.ride_key)
                            if sheet.ride_key==nil or sheet.ride_key=="" then 
                                sheet.ride_key="dex" 
                            end
            
                            if false and not sheet.ride_trained then
                                sheet.ride_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.ride_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.ride_total =  tonumber(sheet[sheet.ride_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.ride_other or 0) + 
                                                        tonumber(sheet.ride_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event32 = obj.button12:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.knowledge_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Conhecimento");
        end, obj);

    obj._e_event33 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.knowledge_key)
                            if sheet.knowledge_key==nil or sheet.knowledge_key=="" then 
                                sheet.knowledge_key="int" 
                            end
            
                            if true and not sheet.knowledge_trained then
                                sheet.knowledge_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.knowledge_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.knowledge_total =  tonumber(sheet[sheet.knowledge_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.knowledge_other or 0) + 
                                                        tonumber(sheet.knowledge_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event34 = obj.button13:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.cure_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Cura");
        end, obj);

    obj._e_event35 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.cure_key)
                            if sheet.cure_key==nil or sheet.cure_key=="" then 
                                sheet.cure_key="wis" 
                            end
            
                            if false and not sheet.cure_trained then
                                sheet.cure_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.cure_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.cure_total =  tonumber(sheet[sheet.cure_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.cure_other or 0) + 
                                                        tonumber(sheet.cure_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event36 = obj.button14:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.diplomacy_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Diplomacia");
        end, obj);

    obj._e_event37 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.diplomacy_key)
                            if sheet.diplomacy_key==nil or sheet.diplomacy_key=="" then 
                                sheet.diplomacy_key="cha" 
                            end
            
                            if false and not sheet.diplomacy_trained then
                                sheet.diplomacy_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.diplomacy_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.diplomacy_total =  tonumber(sheet[sheet.diplomacy_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.diplomacy_other or 0) + 
                                                        tonumber(sheet.diplomacy_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event38 = obj.button15:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.deception_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Enganação");
        end, obj);

    obj._e_event39 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.deception_key)
                            if sheet.deception_key==nil or sheet.deception_key=="" then 
                                sheet.deception_key="cha" 
                            end
            
                            if false and not sheet.deception_trained then
                                sheet.deception_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.deception_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.deception_total =  tonumber(sheet[sheet.deception_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.deception_other or 0) + 
                                                        tonumber(sheet.deception_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event40 = obj.button16:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.stealth_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Furtividade");
        end, obj);

    obj._e_event41 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.stealth_key)
                            if sheet.stealth_key==nil or sheet.stealth_key=="" then 
                                sheet.stealth_key="dex" 
                            end
            
                            if false and not sheet.stealth_trained then
                                sheet.stealth_total = ""
                            else
            
                                local pen = 0
                                if true then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.stealth_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.stealth_total =  tonumber(sheet[sheet.stealth_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.stealth_other or 0) + 
                                                        tonumber(sheet.stealth_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event42 = obj.button17:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.war_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Guerra");
        end, obj);

    obj._e_event43 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.war_key)
                            if sheet.war_key==nil or sheet.war_key=="" then 
                                sheet.war_key="int" 
                            end
            
                            if true and not sheet.war_trained then
                                sheet.war_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.war_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.war_total =  tonumber(sheet[sheet.war_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.war_other or 0) + 
                                                        tonumber(sheet.war_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event44 = obj.button18:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.intimidation_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Intimidação");
        end, obj);

    obj._e_event45 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.intimidation_key)
                            if sheet.intimidation_key==nil or sheet.intimidation_key=="" then 
                                sheet.intimidation_key="cha" 
                            end
            
                            if false and not sheet.intimidation_trained then
                                sheet.intimidation_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.intimidation_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.intimidation_total =  tonumber(sheet[sheet.intimidation_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.intimidation_other or 0) + 
                                                        tonumber(sheet.intimidation_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event46 = obj.button19:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.intuition_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Intuição");
        end, obj);

    obj._e_event47 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.intuition_key)
                            if sheet.intuition_key==nil or sheet.intuition_key=="" then 
                                sheet.intuition_key="wis" 
                            end
            
                            if false and not sheet.intuition_trained then
                                sheet.intuition_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.intuition_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.intuition_total =  tonumber(sheet[sheet.intuition_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.intuition_other or 0) + 
                                                        tonumber(sheet.intuition_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event48 = obj.button20:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.investigation_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Investigação");
        end, obj);

    obj._e_event49 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.investigation_key)
                            if sheet.investigation_key==nil or sheet.investigation_key=="" then 
                                sheet.investigation_key="int" 
                            end
            
                            if false and not sheet.investigation_trained then
                                sheet.investigation_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.investigation_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.investigation_total =  tonumber(sheet[sheet.investigation_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.investigation_other or 0) + 
                                                        tonumber(sheet.investigation_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event50 = obj.button21:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.gambling_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Jogatina");
        end, obj);

    obj._e_event51 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.gambling_key)
                            if sheet.gambling_key==nil or sheet.gambling_key=="" then 
                                sheet.gambling_key="cha" 
                            end
            
                            if true and not sheet.gambling_trained then
                                sheet.gambling_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.gambling_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.gambling_total =  tonumber(sheet[sheet.gambling_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.gambling_other or 0) + 
                                                        tonumber(sheet.gambling_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event52 = obj.button22:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.thievery_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Ladinagem");
        end, obj);

    obj._e_event53 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.thievery_key)
                            if sheet.thievery_key==nil or sheet.thievery_key=="" then 
                                sheet.thievery_key="dex" 
                            end
            
                            if true and not sheet.thievery_trained then
                                sheet.thievery_total = ""
                            else
            
                                local pen = 0
                                if true then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.thievery_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.thievery_total =  tonumber(sheet[sheet.thievery_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.thievery_other or 0) + 
                                                        tonumber(sheet.thievery_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event54 = obj.button23:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.mysticism_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Misticismo");
        end, obj);

    obj._e_event55 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.mysticism_key)
                            if sheet.mysticism_key==nil or sheet.mysticism_key=="" then 
                                sheet.mysticism_key="int" 
                            end
            
                            if true and not sheet.mysticism_trained then
                                sheet.mysticism_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.mysticism_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.mysticism_total =  tonumber(sheet[sheet.mysticism_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.mysticism_other or 0) + 
                                                        tonumber(sheet.mysticism_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event56 = obj.button24:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.nobility_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Nobreza");
        end, obj);

    obj._e_event57 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.nobility_key)
                            if sheet.nobility_key==nil or sheet.nobility_key=="" then 
                                sheet.nobility_key="int" 
                            end
            
                            if true and not sheet.nobility_trained then
                                sheet.nobility_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.nobility_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.nobility_total =  tonumber(sheet[sheet.nobility_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.nobility_other or 0) + 
                                                        tonumber(sheet.nobility_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event58 = obj.button25:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.perception_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Percepção");
        end, obj);

    obj._e_event59 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.perception_key)
                            if sheet.perception_key==nil or sheet.perception_key=="" then 
                                sheet.perception_key="wis" 
                            end
            
                            if false and not sheet.perception_trained then
                                sheet.perception_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.perception_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.perception_total =  tonumber(sheet[sheet.perception_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.perception_other or 0) + 
                                                        tonumber(sheet.perception_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event60 = obj.button26:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.piloting_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Pilotagem");
        end, obj);

    obj._e_event61 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.piloting_key)
                            if sheet.piloting_key==nil or sheet.piloting_key=="" then 
                                sheet.piloting_key="dex" 
                            end
            
                            if true and not sheet.piloting_trained then
                                sheet.piloting_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.piloting_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.piloting_total =  tonumber(sheet[sheet.piloting_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.piloting_other or 0) + 
                                                        tonumber(sheet.piloting_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event62 = obj.button27:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.religion_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Religião");
        end, obj);

    obj._e_event63 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.religion_key)
                            if sheet.religion_key==nil or sheet.religion_key=="" then 
                                sheet.religion_key="wis" 
                            end
            
                            if true and not sheet.religion_trained then
                                sheet.religion_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.religion_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.religion_total =  tonumber(sheet[sheet.religion_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.religion_other or 0) + 
                                                        tonumber(sheet.religion_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event64 = obj.button28:addEventListener("onClick",
        function (_)
            local roll = Firecast.interpretarRolagem("1d20+" .. (sheet.survival_total or 0)); 
            
                            local room = Firecast.getMesaDe(sheet);
                            room.activeChat:rolarDados(roll, "Sobrevivência");
        end, obj);

    obj._e_event65 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            --showMessage(sheet.survival_key)
                            if sheet.survival_key==nil or sheet.survival_key=="" then 
                                sheet.survival_key="wis" 
                            end
            
                            if false and not sheet.survival_trained then
                                sheet.survival_total = ""
                            else
            
                                local pen = 0
                                if false then
                                    pen = tonumber(sheet.skills_penalty or 0)
                                end
                                local train = 0
                                if sheet.survival_trained then
                                    train = tonumber(sheet.skills_bonus or 0)
                                end
            
                                sheet.survival_total =  tonumber(sheet[sheet.survival_key.."_mod"] or 0) + 
                                                        train + 
                                                        tonumber(sheet.survival_other or 0) + 
                                                        tonumber(sheet.survival_extra or 0) + 
                                                        pen + 
                                                        tonumber(sheet.magic_lvl or 0)
                            end
        end, obj);

    obj._e_event66 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                local trained = 0
            
                                if sheet.initiative_trained then trained = trained + 1 end
                                if sheet.fight_trained then trained = trained + 1 end
                                if sheet.aim_trained then trained = trained + 1 end
                                if sheet.fort_trained then trained = trained + 1 end
                                if sheet.refl_trained then trained = trained + 1 end
                                if sheet.will_trained then trained = trained + 1 end
                                if sheet.acrobatics_trained then trained = trained + 1 end
                                if sheet.training_trained then trained = trained + 1 end
                                if sheet.athletics_trained then trained = trained + 1 end
                                if sheet.acting_trained then trained = trained + 1 end
                                if sheet.ride_trained then trained = trained + 1 end
                                if sheet.knowledge_trained then trained = trained + 1 end
                                if sheet.cure_trained then trained = trained + 1 end
                                if sheet.diplomacy_trained then trained = trained + 1 end
                                if sheet.deception_trained then trained = trained + 1 end
                                if sheet.stealth_trained then trained = trained + 1 end
                                if sheet.war_trained then trained = trained + 1 end
                                if sheet.intimidation_trained then trained = trained + 1 end
                                if sheet.intuition_trained then trained = trained + 1 end
                                if sheet.investigation_trained then trained = trained + 1 end
                                if sheet.gambling_trained then trained = trained + 1 end
                                if sheet.thievery_trained then trained = trained + 1 end
                                if sheet.mysticism_trained then trained = trained + 1 end
                                if sheet.nobility_trained then trained = trained + 1 end
                                if sheet.perception_trained then trained = trained + 1 end
                                if sheet.piloting_trained then trained = trained + 1 end
                                if sheet.religion_trained then trained = trained + 1 end
                                if sheet.survival_trained then trained = trained + 1 end
                                
                                trained = trained + tonumber(sheet.custom_trained or 0)
            
                                sheet.skills_trained = trained
        end, obj);

    obj._e_event67 = obj.button29:addEventListener("onClick",
        function (_)
            local node = self.rcl_custom_skills:append()
            
                                if node~=nil then
                                    node.skills_bonus = sheet.skills_bonus
                                    node.str_mod = sheet.str_mod
                                    node.dex_mod = sheet.dex_mod
                                    node.con_mod = sheet.con_mod
                                    node.int_mod = sheet.int_mod
                                    node.wis_mod = sheet.wis_mod
                                    node.cha_mod = sheet.cha_mod
                                end
        end, obj);

    obj._e_event68 = obj.image5:addEventListener("onClick",
        function (_)
            self.rcl_power:append()
        end, obj);

    obj._e_event69 = obj.rcl_power:addEventListener("onSelect",
        function (_)
            local node = self.rcl_power.selectedNode; 
                            self.dsb_power.node = node;                       
                            self.dsb_power.visible = (node ~= nil);
        end, obj);

    obj._e_event70 = obj.image8:addEventListener("onClick",
        function (_)
            self.rcl_magic:append()
        end, obj);

    obj._e_event71 = obj.rcl_magic:addEventListener("onSelect",
        function (_)
            local node = self.rcl_magic.selectedNode; 
                            self.dsb_magic.node = node;                       
                            self.dsb_magic.visible = (node ~= nil);
        end, obj);

    obj._e_event72 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            
                            if sheet.magic_key==nil or sheet.magic_key=="" then 
                                sheet.magic_key="-" 
                            end
            
                            sheet.magic_cd =    tonumber(sheet[sheet.magic_key.."_mod"] or 0) + 
                                                tonumber(sheet.magic_lvl or 0) + 
                                                tonumber(sheet.magic_other or 0) + 
                                                tonumber(sheet.magic_extra or 0) + 10
        end, obj);

    obj._e_event73 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            sheet.defense_armor = tonumber(sheet.armor_bonus or 0) + tonumber(sheet.shield_bonus or 0)
        end, obj);

    obj._e_event74 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            sheet.skills_penalty = tonumber(sheet.armor_pen or 0) + tonumber(sheet.shield_pen or 0)
        end, obj);

    obj._e_event75 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            sheet.cash_total = tonumber(sheet.cash_to or 0)*10 + tonumber(sheet.cash_ts or 0)
        end, obj);

    obj._e_event76 = obj.button30:addEventListener("onClick",
        function (_)
            local node = self.rcl_attack:append()
            
                                if node~=nil then
                                    node.skills_bonus = sheet.skills_bonus
                                    node.str_mod = sheet.str_mod
                                    node.dex_mod = sheet.dex_mod
                                    node.con_mod = sheet.con_mod
                                    node.int_mod = sheet.int_mod
                                    node.wis_mod = sheet.wis_mod
                                    node.cha_mod = sheet.cha_mod
                                end
        end, obj);

    obj._e_event77 = obj.image12:addEventListener("onClick",
        function (_)
            self.rcl_connection1:append()
        end, obj);

    obj._e_event78 = obj.image13:addEventListener("onClick",
        function (_)
            self.rcl_connection2:append()
        end, obj);

    obj._e_event79 = obj.button31:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20T20/README.md')
        end, obj);

    obj._e_event80 = obj.button32:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20T20/output/Ficha%20T20.rpk?raw=true')
        end, obj);

    obj._e_event81 = obj.button33:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event82 = obj.button34:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=164636');
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.frmNotes ~= nil then self.frmNotes:destroy(); self.frmNotes = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rcl_connection1 ~= nil then self.rcl_connection1:destroy(); self.rcl_connection1 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.dsb_power ~= nil then self.dsb_power:destroy(); self.dsb_power = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.rcl_magic ~= nil then self.rcl_magic:destroy(); self.rcl_magic = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rcl_power ~= nil then self.rcl_power:destroy(); self.rcl_power = nil; end;
        if self.frmMagias ~= nil then self.frmMagias:destroy(); self.frmMagias = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.rcl_attack ~= nil then self.rcl_attack:destroy(); self.rcl_attack = nil; end;
        if self.frmDetalhes ~= nil then self.frmDetalhes:destroy(); self.frmDetalhes = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.frmCreditos ~= nil then self.frmCreditos:destroy(); self.frmCreditos = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.frmPrincipal ~= nil then self.frmPrincipal:destroy(); self.frmPrincipal = nil; end;
        if self.rcl_custom_skills ~= nil then self.rcl_custom_skills:destroy(); self.rcl_custom_skills = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.frmPericias ~= nil then self.frmPericias:destroy(); self.frmPericias = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.frmPoderes ~= nil then self.frmPoderes:destroy(); self.frmPoderes = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.frmHistoria ~= nil then self.frmHistoria:destroy(); self.frmHistoria = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rcl_connection2 ~= nil then self.rcl_connection2:destroy(); self.rcl_connection2 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.dsb_magic ~= nil then self.dsb_magic:destroy(); self.dsb_magic = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.frmEquipamento ~= nil then self.frmEquipamento:destroy(); self.frmEquipamento = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmT20()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmT20();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmT20 = {
    newEditor = newfrmT20, 
    new = newfrmT20, 
    name = "frmT20", 
    dataType = "Ambesek.T20", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha T20", 
    description=""};

frmT20 = _frmT20;
Firecast.registrarForm(_frmT20);
Firecast.registrarDataType(_frmT20);

return _frmT20;
