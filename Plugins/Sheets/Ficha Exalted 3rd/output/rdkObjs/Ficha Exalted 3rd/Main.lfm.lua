require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMain()
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
    obj:setName("frmMain");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Exalted.3rd");
    obj:setTitle("Ficha Exalted 3rd");
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
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmGeral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeral:setParent(obj.tab1);
    obj.frmGeral:setName("frmGeral");
    obj.frmGeral:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(1030);
    obj.layout1:setHeight(610);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(100);
    obj.layout2:setMargins({bottom=5});
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(1030);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(50);
    obj.layout3:setName("layout3");

    obj.Name = GUI.fromHandle(_obj_newObject("layout"));
    obj.Name:setParent(obj.layout3);
    obj.Name:setAlign("left");
    obj.Name:setWidth(300);
    obj.Name:setMargins({right=5});
    obj.Name:setName("Name");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.Name);
    obj.label1:setText("Name");
    obj.label1:setWidth(300);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.Name);
    obj.edit1:setTop(20);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.Player = GUI.fromHandle(_obj_newObject("layout"));
    obj.Player:setParent(obj.layout3);
    obj.Player:setAlign("left");
    obj.Player:setWidth(300);
    obj.Player:setMargins({right=5});
    obj.Player:setName("Player");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.Player);
    obj.label2:setText("Player");
    obj.label2:setWidth(300);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.Player);
    obj.edit2:setTop(20);
    obj.edit2:setField("jogador");
    obj.edit2:setWidth(300);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.Exaltation = GUI.fromHandle(_obj_newObject("layout"));
    obj.Exaltation:setParent(obj.layout3);
    obj.Exaltation:setAlign("left");
    obj.Exaltation:setWidth(205);
    obj.Exaltation:setMargins({right=5});
    obj.Exaltation:setVisible(true);
    obj.Exaltation:setName("Exaltation");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.Exaltation);
    obj.label3:setText("Exaltation");
    obj.label3:setWidth(205);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.Exaltation);
    obj.comboBox1:setTop(20);
    obj.comboBox1:setField("exaltation");
    obj.comboBox1:setWidth(205);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setItems({'Solar','Lunar','Dragon-Blooded'});
    obj.comboBox1:setValues({'1','2','3'});
    obj.comboBox1:setFontSize(13);
    obj.comboBox1:setName("comboBox1");

    obj.SolarCaste = GUI.fromHandle(_obj_newObject("layout"));
    obj.SolarCaste:setParent(obj.layout3);
    obj.SolarCaste:setAlign("right");
    obj.SolarCaste:setWidth(205);
    obj.SolarCaste:setMargins({right=5});
    obj.SolarCaste:setVisible(false);
    obj.SolarCaste:setName("SolarCaste");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.SolarCaste);
    obj.label4:setText("Caste");
    obj.label4:setWidth(205);
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.SolarCaste);
    obj.comboBox2:setTop(20);
    obj.comboBox2:setField("solarCaste");
    obj.comboBox2:setWidth(205);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setItems({'Dawn','Zenith','Twilight','Night','Eclipse'});
    obj.comboBox2:setValues({'1','2','3','4','5'});
    obj.comboBox2:setFontSize(13);
    obj.comboBox2:setName("comboBox2");

    obj.LunarCaste = GUI.fromHandle(_obj_newObject("layout"));
    obj.LunarCaste:setParent(obj.layout3);
    obj.LunarCaste:setAlign("right");
    obj.LunarCaste:setWidth(205);
    obj.LunarCaste:setMargins({right=5});
    obj.LunarCaste:setVisible(false);
    obj.LunarCaste:setName("LunarCaste");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.LunarCaste);
    obj.label5:setText("Caste");
    obj.label5:setWidth(205);
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.LunarCaste);
    obj.comboBox3:setTop(20);
    obj.comboBox3:setField("lunarCaste");
    obj.comboBox3:setWidth(205);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setItems({'Full Moon','Wzxing Moon','No Moon','Casteless'});
    obj.comboBox3:setValues({'1','2','3','4'});
    obj.comboBox3:setFontSize(13);
    obj.comboBox3:setName("comboBox3");

    obj.DragonAspect = GUI.fromHandle(_obj_newObject("layout"));
    obj.DragonAspect:setParent(obj.layout3);
    obj.DragonAspect:setAlign("right");
    obj.DragonAspect:setWidth(205);
    obj.DragonAspect:setMargins({right=5});
    obj.DragonAspect:setVisible(false);
    obj.DragonAspect:setName("DragonAspect");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.DragonAspect);
    obj.label6:setText("Aspect");
    obj.label6:setWidth(205);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.DragonAspect);
    obj.comboBox4:setTop(20);
    obj.comboBox4:setField("dragonAspect");
    obj.comboBox4:setWidth(205);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setItems({'Fire','Water','Air','Earth','Wood'});
    obj.comboBox4:setValues({'1','2','3','4','5'});
    obj.comboBox4:setFontSize(13);
    obj.comboBox4:setName("comboBox4");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(50);
    obj.layout4:setName("layout4");

    obj.Concept = GUI.fromHandle(_obj_newObject("layout"));
    obj.Concept:setParent(obj.layout4);
    obj.Concept:setAlign("left");
    obj.Concept:setWidth(250);
    obj.Concept:setMargins({right=5});
    obj.Concept:setName("Concept");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.Concept);
    obj.label7:setText("Concept");
    obj.label7:setWidth(250);
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setFontSize(13);
    obj.label7:setName("label7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.Concept);
    obj.edit3:setTop(20);
    obj.edit3:setField("concept");
    obj.edit3:setWidth(250);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.Anima = GUI.fromHandle(_obj_newObject("layout"));
    obj.Anima:setParent(obj.layout4);
    obj.Anima:setAlign("left");
    obj.Anima:setWidth(250);
    obj.Anima:setMargins({right=5});
    obj.Anima:setName("Anima");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.Anima);
    obj.label8:setText("Anima");
    obj.label8:setWidth(250);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setFontSize(13);
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.Anima);
    obj.edit4:setTop(20);
    obj.edit4:setField("anima");
    obj.edit4:setWidth(250);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.Supernatural = GUI.fromHandle(_obj_newObject("layout"));
    obj.Supernatural:setParent(obj.layout4);
    obj.Supernatural:setAlign("left");
    obj.Supernatural:setWidth(250);
    obj.Supernatural:setMargins({right=5});
    obj.Supernatural:setName("Supernatural");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.Supernatural);
    obj.label9:setText("Supernatural Ability");
    obj.label9:setWidth(250);
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setFontSize(13);
    obj.label9:setName("label9");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.Supernatural);
    obj.edit5:setTop(20);
    obj.edit5:setField("supernatural");
    obj.edit5:setWidth(250);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.Tell = GUI.fromHandle(_obj_newObject("layout"));
    obj.Tell:setParent(obj.layout4);
    obj.Tell:setAlign("right");
    obj.Tell:setWidth(125);
    obj.Tell:setMargins({right=5});
    obj.Tell:setName("Tell");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.Tell);
    obj.label10:setText("Tell");
    obj.label10:setWidth(125);
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setFontSize(13);
    obj.label10:setName("label10");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.Tell);
    obj.edit6:setTop(20);
    obj.edit6:setField("tell");
    obj.edit6:setWidth(125);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.Spirit = GUI.fromHandle(_obj_newObject("layout"));
    obj.Spirit:setParent(obj.layout4);
    obj.Spirit:setAlign("right");
    obj.Spirit:setWidth(125);
    obj.Spirit:setMargins({right=5});
    obj.Spirit:setName("Spirit");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.Spirit);
    obj.label11:setText("Spirit Shape");
    obj.label11:setWidth(125);
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setFontSize(13);
    obj.label11:setName("label11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.Spirit);
    obj.edit7:setTop(20);
    obj.edit7:setField("Spirit");
    obj.edit7:setWidth(125);
    obj.edit7:setHeight(25);
    obj.edit7:setName("edit7");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("exaltation");
    obj.dataLink1:setName("dataLink1");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(100);
    obj.layout5:setMargins({bottom=5});
    obj.layout5:setName("layout5");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout5);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(1030);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle2);
    obj.label12:setAlign("top");
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("ATTRIBUTES");
    obj.label12:setName("label12");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle2);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(330);
    obj.layout7:setMargins({right=5,left=5});
    obj.layout7:setName("layout7");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout7);
    obj.label13:setAlign("left");
    obj.label13:setText("Strength");
    obj.label13:setWidth(100);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout7);
    obj.edit8:setAlign("left");
    obj.edit8:setField("strength");
    obj.edit8:setWidth(150);
    obj.edit8:setName("edit8");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout7);
    obj.imageCheckBox1:setAlign("right");
    obj.imageCheckBox1:setWidth(15);
    obj.imageCheckBox1:setField("strength_1");
    obj.imageCheckBox1:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox1:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout7);
    obj.imageCheckBox2:setAlign("right");
    obj.imageCheckBox2:setWidth(15);
    obj.imageCheckBox2:setField("strength_2");
    obj.imageCheckBox2:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox2:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout7);
    obj.imageCheckBox3:setAlign("right");
    obj.imageCheckBox3:setWidth(15);
    obj.imageCheckBox3:setField("strength_3");
    obj.imageCheckBox3:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox3:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout7);
    obj.imageCheckBox4:setAlign("right");
    obj.imageCheckBox4:setWidth(15);
    obj.imageCheckBox4:setField("strength_4");
    obj.imageCheckBox4:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox4:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout7);
    obj.imageCheckBox5:setAlign("right");
    obj.imageCheckBox5:setWidth(15);
    obj.imageCheckBox5:setField("strength_5");
    obj.imageCheckBox5:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox5:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout7);
    obj.dataLink2:setField("strength_1");
    obj.dataLink2:setDefaultValue("true");
    obj.dataLink2:setName("dataLink2");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout6);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(330);
    obj.layout8:setMargins({right=5,left=5});
    obj.layout8:setName("layout8");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setAlign("left");
    obj.label14:setText("Charisma");
    obj.label14:setWidth(100);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout8);
    obj.edit9:setAlign("left");
    obj.edit9:setField("charisma");
    obj.edit9:setWidth(150);
    obj.edit9:setName("edit9");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout8);
    obj.imageCheckBox6:setAlign("right");
    obj.imageCheckBox6:setWidth(15);
    obj.imageCheckBox6:setField("charisma_1");
    obj.imageCheckBox6:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox6:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout8);
    obj.imageCheckBox7:setAlign("right");
    obj.imageCheckBox7:setWidth(15);
    obj.imageCheckBox7:setField("charisma_2");
    obj.imageCheckBox7:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox7:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout8);
    obj.imageCheckBox8:setAlign("right");
    obj.imageCheckBox8:setWidth(15);
    obj.imageCheckBox8:setField("charisma_3");
    obj.imageCheckBox8:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox8:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout8);
    obj.imageCheckBox9:setAlign("right");
    obj.imageCheckBox9:setWidth(15);
    obj.imageCheckBox9:setField("charisma_4");
    obj.imageCheckBox9:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox9:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout8);
    obj.imageCheckBox10:setAlign("right");
    obj.imageCheckBox10:setWidth(15);
    obj.imageCheckBox10:setField("charisma_5");
    obj.imageCheckBox10:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox10:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout8);
    obj.dataLink3:setField("charisma_1");
    obj.dataLink3:setDefaultValue("true");
    obj.dataLink3:setName("dataLink3");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout6);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(330);
    obj.layout9:setMargins({right=5,left=5});
    obj.layout9:setName("layout9");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setAlign("left");
    obj.label15:setText("Perception");
    obj.label15:setWidth(100);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout9);
    obj.edit10:setAlign("left");
    obj.edit10:setField("perception");
    obj.edit10:setWidth(150);
    obj.edit10:setName("edit10");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout9);
    obj.imageCheckBox11:setAlign("right");
    obj.imageCheckBox11:setWidth(15);
    obj.imageCheckBox11:setField("perception_1");
    obj.imageCheckBox11:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox11:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout9);
    obj.imageCheckBox12:setAlign("right");
    obj.imageCheckBox12:setWidth(15);
    obj.imageCheckBox12:setField("perception_2");
    obj.imageCheckBox12:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox12:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout9);
    obj.imageCheckBox13:setAlign("right");
    obj.imageCheckBox13:setWidth(15);
    obj.imageCheckBox13:setField("perception_3");
    obj.imageCheckBox13:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox13:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout9);
    obj.imageCheckBox14:setAlign("right");
    obj.imageCheckBox14:setWidth(15);
    obj.imageCheckBox14:setField("perception_4");
    obj.imageCheckBox14:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox14:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout9);
    obj.imageCheckBox15:setAlign("right");
    obj.imageCheckBox15:setWidth(15);
    obj.imageCheckBox15:setField("perception_5");
    obj.imageCheckBox15:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox15:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout9);
    obj.dataLink4:setField("perception_1");
    obj.dataLink4:setDefaultValue("true");
    obj.dataLink4:setName("dataLink4");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle2);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(330);
    obj.layout11:setMargins({right=5,left=5});
    obj.layout11:setName("layout11");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout11);
    obj.label16:setAlign("left");
    obj.label16:setText("Dexterity");
    obj.label16:setWidth(100);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setAlign("left");
    obj.edit11:setField("dexterity");
    obj.edit11:setWidth(150);
    obj.edit11:setName("edit11");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout11);
    obj.imageCheckBox16:setAlign("right");
    obj.imageCheckBox16:setWidth(15);
    obj.imageCheckBox16:setField("dexterity_1");
    obj.imageCheckBox16:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox16:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout11);
    obj.imageCheckBox17:setAlign("right");
    obj.imageCheckBox17:setWidth(15);
    obj.imageCheckBox17:setField("dexterity_2");
    obj.imageCheckBox17:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox17:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout11);
    obj.imageCheckBox18:setAlign("right");
    obj.imageCheckBox18:setWidth(15);
    obj.imageCheckBox18:setField("dexterity_3");
    obj.imageCheckBox18:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox18:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout11);
    obj.imageCheckBox19:setAlign("right");
    obj.imageCheckBox19:setWidth(15);
    obj.imageCheckBox19:setField("dexterity_4");
    obj.imageCheckBox19:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox19:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout11);
    obj.imageCheckBox20:setAlign("right");
    obj.imageCheckBox20:setWidth(15);
    obj.imageCheckBox20:setField("dexterity_5");
    obj.imageCheckBox20:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox20:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout11);
    obj.dataLink5:setField("dexterity_1");
    obj.dataLink5:setDefaultValue("true");
    obj.dataLink5:setName("dataLink5");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout10);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(330);
    obj.layout12:setMargins({right=5,left=5});
    obj.layout12:setName("layout12");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout12);
    obj.label17:setAlign("left");
    obj.label17:setText("Manipulation");
    obj.label17:setWidth(100);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setAlign("left");
    obj.edit12:setField("manipulation");
    obj.edit12:setWidth(150);
    obj.edit12:setName("edit12");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout12);
    obj.imageCheckBox21:setAlign("right");
    obj.imageCheckBox21:setWidth(15);
    obj.imageCheckBox21:setField("manipulation_1");
    obj.imageCheckBox21:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox21:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout12);
    obj.imageCheckBox22:setAlign("right");
    obj.imageCheckBox22:setWidth(15);
    obj.imageCheckBox22:setField("manipulation_2");
    obj.imageCheckBox22:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox22:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout12);
    obj.imageCheckBox23:setAlign("right");
    obj.imageCheckBox23:setWidth(15);
    obj.imageCheckBox23:setField("manipulation_3");
    obj.imageCheckBox23:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox23:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout12);
    obj.imageCheckBox24:setAlign("right");
    obj.imageCheckBox24:setWidth(15);
    obj.imageCheckBox24:setField("manipulation_4");
    obj.imageCheckBox24:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox24:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout12);
    obj.imageCheckBox25:setAlign("right");
    obj.imageCheckBox25:setWidth(15);
    obj.imageCheckBox25:setField("manipulation_5");
    obj.imageCheckBox25:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox25:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout12);
    obj.dataLink6:setField("manipulation_1");
    obj.dataLink6:setDefaultValue("true");
    obj.dataLink6:setName("dataLink6");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(330);
    obj.layout13:setMargins({right=5,left=5});
    obj.layout13:setName("layout13");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18:setAlign("left");
    obj.label18:setText("Intelligence");
    obj.label18:setWidth(100);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setAlign("left");
    obj.edit13:setField("intelligence");
    obj.edit13:setWidth(150);
    obj.edit13:setName("edit13");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout13);
    obj.imageCheckBox26:setAlign("right");
    obj.imageCheckBox26:setWidth(15);
    obj.imageCheckBox26:setField("intelligence_1");
    obj.imageCheckBox26:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox26:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout13);
    obj.imageCheckBox27:setAlign("right");
    obj.imageCheckBox27:setWidth(15);
    obj.imageCheckBox27:setField("intelligence_2");
    obj.imageCheckBox27:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox27:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout13);
    obj.imageCheckBox28:setAlign("right");
    obj.imageCheckBox28:setWidth(15);
    obj.imageCheckBox28:setField("intelligence_3");
    obj.imageCheckBox28:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox28:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout13);
    obj.imageCheckBox29:setAlign("right");
    obj.imageCheckBox29:setWidth(15);
    obj.imageCheckBox29:setField("intelligence_4");
    obj.imageCheckBox29:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox29:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout13);
    obj.imageCheckBox30:setAlign("right");
    obj.imageCheckBox30:setWidth(15);
    obj.imageCheckBox30:setField("intelligence_5");
    obj.imageCheckBox30:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox30:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout13);
    obj.dataLink7:setField("intelligence_1");
    obj.dataLink7:setDefaultValue("true");
    obj.dataLink7:setName("dataLink7");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(330);
    obj.layout15:setMargins({right=5,left=5});
    obj.layout15:setName("layout15");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout15);
    obj.label19:setAlign("left");
    obj.label19:setText("Stamina");
    obj.label19:setWidth(100);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout15);
    obj.edit14:setAlign("left");
    obj.edit14:setField("stamina");
    obj.edit14:setWidth(150);
    obj.edit14:setName("edit14");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout15);
    obj.imageCheckBox31:setAlign("right");
    obj.imageCheckBox31:setWidth(15);
    obj.imageCheckBox31:setField("stamina_1");
    obj.imageCheckBox31:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox31:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout15);
    obj.imageCheckBox32:setAlign("right");
    obj.imageCheckBox32:setWidth(15);
    obj.imageCheckBox32:setField("stamina_2");
    obj.imageCheckBox32:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox32:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout15);
    obj.imageCheckBox33:setAlign("right");
    obj.imageCheckBox33:setWidth(15);
    obj.imageCheckBox33:setField("stamina_3");
    obj.imageCheckBox33:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox33:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout15);
    obj.imageCheckBox34:setAlign("right");
    obj.imageCheckBox34:setWidth(15);
    obj.imageCheckBox34:setField("stamina_4");
    obj.imageCheckBox34:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox34:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.imageCheckBox35 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout15);
    obj.imageCheckBox35:setAlign("right");
    obj.imageCheckBox35:setWidth(15);
    obj.imageCheckBox35:setField("stamina_5");
    obj.imageCheckBox35:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox35:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout15);
    obj.dataLink8:setField("stamina_1");
    obj.dataLink8:setDefaultValue("true");
    obj.dataLink8:setName("dataLink8");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(330);
    obj.layout16:setMargins({right=5,left=5});
    obj.layout16:setName("layout16");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout16);
    obj.label20:setAlign("left");
    obj.label20:setText("Appearance");
    obj.label20:setWidth(100);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout16);
    obj.edit15:setAlign("left");
    obj.edit15:setField("appearance");
    obj.edit15:setWidth(150);
    obj.edit15:setName("edit15");

    obj.imageCheckBox36 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout16);
    obj.imageCheckBox36:setAlign("right");
    obj.imageCheckBox36:setWidth(15);
    obj.imageCheckBox36:setField("appearance_1");
    obj.imageCheckBox36:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox36:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.imageCheckBox37 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout16);
    obj.imageCheckBox37:setAlign("right");
    obj.imageCheckBox37:setWidth(15);
    obj.imageCheckBox37:setField("appearance_2");
    obj.imageCheckBox37:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox37:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.imageCheckBox38 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout16);
    obj.imageCheckBox38:setAlign("right");
    obj.imageCheckBox38:setWidth(15);
    obj.imageCheckBox38:setField("appearance_3");
    obj.imageCheckBox38:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox38:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.imageCheckBox39 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout16);
    obj.imageCheckBox39:setAlign("right");
    obj.imageCheckBox39:setWidth(15);
    obj.imageCheckBox39:setField("appearance_4");
    obj.imageCheckBox39:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox39:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.imageCheckBox40 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout16);
    obj.imageCheckBox40:setAlign("right");
    obj.imageCheckBox40:setWidth(15);
    obj.imageCheckBox40:setField("appearance_5");
    obj.imageCheckBox40:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox40:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout16);
    obj.dataLink9:setField("appearance_1");
    obj.dataLink9:setDefaultValue("true");
    obj.dataLink9:setName("dataLink9");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(330);
    obj.layout17:setMargins({right=5,left=5});
    obj.layout17:setName("layout17");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout17);
    obj.label21:setAlign("left");
    obj.label21:setText("Wits");
    obj.label21:setWidth(100);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout17);
    obj.edit16:setAlign("left");
    obj.edit16:setField("wits");
    obj.edit16:setWidth(150);
    obj.edit16:setName("edit16");

    obj.imageCheckBox41 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout17);
    obj.imageCheckBox41:setAlign("right");
    obj.imageCheckBox41:setWidth(15);
    obj.imageCheckBox41:setField("wits_1");
    obj.imageCheckBox41:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox41:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.imageCheckBox42 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout17);
    obj.imageCheckBox42:setAlign("right");
    obj.imageCheckBox42:setWidth(15);
    obj.imageCheckBox42:setField("wits_2");
    obj.imageCheckBox42:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox42:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.imageCheckBox43 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout17);
    obj.imageCheckBox43:setAlign("right");
    obj.imageCheckBox43:setWidth(15);
    obj.imageCheckBox43:setField("wits_3");
    obj.imageCheckBox43:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox43:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.imageCheckBox44 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout17);
    obj.imageCheckBox44:setAlign("right");
    obj.imageCheckBox44:setWidth(15);
    obj.imageCheckBox44:setField("wits_4");
    obj.imageCheckBox44:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox44:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.imageCheckBox45 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout17);
    obj.imageCheckBox45:setAlign("right");
    obj.imageCheckBox45:setWidth(15);
    obj.imageCheckBox45:setField("wits_5");
    obj.imageCheckBox45:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox45:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout17);
    obj.dataLink10:setField("wits_1");
    obj.dataLink10:setDefaultValue("true");
    obj.dataLink10:setName("dataLink10");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox1);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(400);
    obj.layout18:setMargins({bottom=5});
    obj.layout18:setName("layout18");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout18);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(340);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setMargins({right=5});
    obj.rectangle3:setName("rectangle3");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle3);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setMargins({bottom=0});
    obj.layout19:setName("layout19");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout19);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("+");
    obj.button1:setMargins({left=5,right=5});
    obj.button1:setName("button1");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout19);
    obj.label22:setAlign("client");
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("MERITS");
    obj.label22:setName("label22");

    obj.rclMerits = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMerits:setParent(obj.rectangle3);
    obj.rclMerits:setAlign("client");
    obj.rclMerits:setMargins({left=5,right=5,bottom=5,top=0});
    obj.rclMerits:setName("rclMerits");
    obj.rclMerits:setField("listMerits");
    obj.rclMerits:setTemplateForm("frmMeritForm");
    obj.rclMerits:setLayout("vertical");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout18);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(170);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(15);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setMargins({right=5});
    obj.rectangle4:setName("rectangle4");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle4);
    obj.label23:setAlign("top");
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setText("WILLPOWER");
    obj.label23:setName("label23");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle4);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setMargins({bottom=0});
    obj.layout20:setName("layout20");

    obj.imageCheckBox46 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout20);
    obj.imageCheckBox46:setAlign("left");
    obj.imageCheckBox46:setWidth(15);
    obj.imageCheckBox46:setField("willpower_1");
    obj.imageCheckBox46:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox46:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox46:setMargins({left=10});
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.imageCheckBox47 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout20);
    obj.imageCheckBox47:setAlign("left");
    obj.imageCheckBox47:setWidth(15);
    obj.imageCheckBox47:setField("willpower_2");
    obj.imageCheckBox47:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox47:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.imageCheckBox48 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout20);
    obj.imageCheckBox48:setAlign("left");
    obj.imageCheckBox48:setWidth(15);
    obj.imageCheckBox48:setField("willpower_3");
    obj.imageCheckBox48:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox48:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.imageCheckBox49 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout20);
    obj.imageCheckBox49:setAlign("left");
    obj.imageCheckBox49:setWidth(15);
    obj.imageCheckBox49:setField("willpower_4");
    obj.imageCheckBox49:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox49:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.imageCheckBox50 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout20);
    obj.imageCheckBox50:setAlign("left");
    obj.imageCheckBox50:setWidth(15);
    obj.imageCheckBox50:setField("willpower_5");
    obj.imageCheckBox50:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox50:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.imageCheckBox51 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout20);
    obj.imageCheckBox51:setAlign("left");
    obj.imageCheckBox51:setWidth(15);
    obj.imageCheckBox51:setField("willpower_6");
    obj.imageCheckBox51:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox51:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.imageCheckBox52 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout20);
    obj.imageCheckBox52:setAlign("left");
    obj.imageCheckBox52:setWidth(15);
    obj.imageCheckBox52:setField("willpower_7");
    obj.imageCheckBox52:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox52:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.imageCheckBox53 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout20);
    obj.imageCheckBox53:setAlign("left");
    obj.imageCheckBox53:setWidth(15);
    obj.imageCheckBox53:setField("willpower_8");
    obj.imageCheckBox53:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox53:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.imageCheckBox54 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout20);
    obj.imageCheckBox54:setAlign("left");
    obj.imageCheckBox54:setWidth(15);
    obj.imageCheckBox54:setField("willpower_9");
    obj.imageCheckBox54:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox54:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.imageCheckBox55 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout20);
    obj.imageCheckBox55:setAlign("left");
    obj.imageCheckBox55:setWidth(15);
    obj.imageCheckBox55:setField("willpower_10");
    obj.imageCheckBox55:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox55:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle4);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setMargins({bottom=5});
    obj.layout21:setName("layout21");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout21);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(15);
    obj.checkBox1:setField("willpower_1_temp");
    obj.checkBox1:setText("");
    obj.checkBox1:setMargins({left=10});
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout21);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(15);
    obj.checkBox2:setField("willpower_2_temp");
    obj.checkBox2:setText("");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout21);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(15);
    obj.checkBox3:setField("willpower_3_temp");
    obj.checkBox3:setText("");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout21);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(15);
    obj.checkBox4:setField("willpower_4_temp");
    obj.checkBox4:setText("");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout21);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(15);
    obj.checkBox5:setField("willpower_5_temp");
    obj.checkBox5:setText("");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout21);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(15);
    obj.checkBox6:setField("willpower_6_temp");
    obj.checkBox6:setText("");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout21);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(15);
    obj.checkBox7:setField("willpower_7_temp");
    obj.checkBox7:setText("");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout21);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(15);
    obj.checkBox8:setField("willpower_8_temp");
    obj.checkBox8:setText("");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout21);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(15);
    obj.checkBox9:setField("willpower_9_temp");
    obj.checkBox9:setText("");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout21);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(15);
    obj.checkBox10:setField("willpower_10_temp");
    obj.checkBox10:setText("");
    obj.checkBox10:setName("checkBox10");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle4);
    obj.label24:setAlign("top");
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setText("ESSENCE");
    obj.label24:setName("label24");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle4);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setMargins({bottom=0});
    obj.layout22:setName("layout22");

    obj.imageCheckBox56 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout22);
    obj.imageCheckBox56:setAlign("left");
    obj.imageCheckBox56:setWidth(15);
    obj.imageCheckBox56:setField("essence_1");
    obj.imageCheckBox56:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox56:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox56:setMargins({left=15,right=10});
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.imageCheckBox57 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox57:setParent(obj.layout22);
    obj.imageCheckBox57:setAlign("left");
    obj.imageCheckBox57:setWidth(15);
    obj.imageCheckBox57:setField("essence_2");
    obj.imageCheckBox57:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox57:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox57:setMargins({left=5,right=10});
    obj.imageCheckBox57:setName("imageCheckBox57");

    obj.imageCheckBox58 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox58:setParent(obj.layout22);
    obj.imageCheckBox58:setAlign("left");
    obj.imageCheckBox58:setWidth(15);
    obj.imageCheckBox58:setField("essence_3");
    obj.imageCheckBox58:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox58:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox58:setMargins({left=5,right=10});
    obj.imageCheckBox58:setName("imageCheckBox58");

    obj.imageCheckBox59 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox59:setParent(obj.layout22);
    obj.imageCheckBox59:setAlign("left");
    obj.imageCheckBox59:setWidth(15);
    obj.imageCheckBox59:setField("essence_4");
    obj.imageCheckBox59:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox59:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox59:setMargins({left=5,right=10});
    obj.imageCheckBox59:setName("imageCheckBox59");

    obj.imageCheckBox60 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox60:setParent(obj.layout22);
    obj.imageCheckBox60:setAlign("left");
    obj.imageCheckBox60:setWidth(15);
    obj.imageCheckBox60:setField("essence_5");
    obj.imageCheckBox60:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox60:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox60:setMargins({left=5,right=10});
    obj.imageCheckBox60:setName("imageCheckBox60");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle4);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setMargins({bottom=0});
    obj.layout23:setName("layout23");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout23);
    obj.label25:setAlign("left");
    obj.label25:setWidth(100);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Personal");
    obj.label25:setMargins({left=5});
    obj.label25:setName("label25");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout23);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle5);
    obj.label26:setAlign("client");
    obj.label26:setField("personalMin");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setVertTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout23);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle6);
    obj.label27:setAlign("client");
    obj.label27:setField("personalMax");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("center");
    obj.label27:setName("label27");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle4);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setMargins({bottom=0});
    obj.layout24:setName("layout24");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout24);
    obj.label28:setAlign("left");
    obj.label28:setWidth(100);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("Peripheral");
    obj.label28:setMargins({left=5});
    obj.label28:setName("label28");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout24);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle7);
    obj.label29:setAlign("client");
    obj.label29:setField("peripheralMin");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setVertTextAlign("center");
    obj.label29:setName("label29");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout24);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle8);
    obj.label30:setAlign("client");
    obj.label30:setField("peripheralMax");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setVertTextAlign("center");
    obj.label30:setName("label30");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle4);
    obj.layout25:setAlign("client");
    obj.layout25:setMargins({bottom=5});
    obj.layout25:setName("layout25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setMargins({bottom=0});
    obj.layout26:setName("layout26");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout26);
    obj.button2:setAlign("left");
    obj.button2:setWidth(25);
    obj.button2:setText("+");
    obj.button2:setMargins({left=5,right=5});
    obj.button2:setName("button2");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout26);
    obj.label31:setAlign("client");
    obj.label31:setText("Commited");
    obj.label31:setName("label31");

    obj.rclCommited = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclCommited:setParent(obj.layout25);
    obj.rclCommited:setAlign("client");
    obj.rclCommited:setMargins({left=5,right=5,bottom=5,top=0});
    obj.rclCommited:setName("rclCommited");
    obj.rclCommited:setField("listCommit");
    obj.rclCommited:setTemplateForm("frmCommitForm");
    obj.rclCommited:setLayout("vertical");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle4);
    obj.dataLink11:setFields({'essence_1','essence_2','essence_3','essence_4','essence_5','exaltation'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle4);
    obj.dataLink12:setFields({'personalMax','personalSpent'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle4);
    obj.dataLink13:setFields({'peripheralMax','peripheralSpent'});
    obj.dataLink13:setName("dataLink13");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout18);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(300);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(15);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setMargins({right=5});
    obj.rectangle9:setName("rectangle9");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle9);
    obj.label32:setAlign("top");
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setText("LIMIT BREAK");
    obj.label32:setName("label32");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle9);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setMargins({bottom=5});
    obj.layout27:setName("layout27");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout27);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(15);
    obj.checkBox11:setField("limit_1");
    obj.checkBox11:setText("");
    obj.checkBox11:setMargins({left=75});
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout27);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(15);
    obj.checkBox12:setField("limit_2");
    obj.checkBox12:setText("");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout27);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(15);
    obj.checkBox13:setField("limit_3");
    obj.checkBox13:setText("");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout27);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(15);
    obj.checkBox14:setField("limit_4");
    obj.checkBox14:setText("");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout27);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(15);
    obj.checkBox15:setField("limit_5");
    obj.checkBox15:setText("");
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout27);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(15);
    obj.checkBox16:setField("limit_6");
    obj.checkBox16:setText("");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout27);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(15);
    obj.checkBox17:setField("limit_7");
    obj.checkBox17:setText("");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout27);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(15);
    obj.checkBox18:setField("limit_8");
    obj.checkBox18:setText("");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout27);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(15);
    obj.checkBox19:setField("limit_9");
    obj.checkBox19:setText("");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout27);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(15);
    obj.checkBox20:setField("limit_10");
    obj.checkBox20:setText("");
    obj.checkBox20:setName("checkBox20");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle9);
    obj.label33:setAlign("top");
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setText("LIMIT TRIGGER");
    obj.label33:setName("label33");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle9);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("limitTrigger");
    obj.textEditor1:setMargins({left=5,right=5,bottom=5});
    obj.textEditor1:setName("textEditor1");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout18);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(205);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(15);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle10);
    obj.label34:setAlign("top");
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setText("EXPERIENCE");
    obj.label34:setName("label34");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle10);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setMargins({bottom=5});
    obj.layout28:setName("layout28");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout28);
    obj.edit17:setLeft(5);
    obj.edit17:setWidth(95);
    obj.edit17:setField("xpCurr");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout28);
    obj.edit18:setLeft(105);
    obj.edit18:setWidth(95);
    obj.edit18:setField("xpTotal");
    obj.edit18:setName("edit18");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle10);
    obj.label35:setAlign("top");
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setText("SOLAR EXPERIENCE");
    obj.label35:setName("label35");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle10);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setMargins({bottom=5});
    obj.layout29:setName("layout29");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout29);
    obj.edit19:setLeft(5);
    obj.edit19:setWidth(95);
    obj.edit19:setField("xpSolarCurr");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout29);
    obj.edit20:setLeft(105);
    obj.edit20:setWidth(95);
    obj.edit20:setField("xpSolarTotal");
    obj.edit20:setName("edit20");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle10);
    obj.rectangle11:setAlign("bottom");
    obj.rectangle11:setHeight(200);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setMargins({left=5,right=5,bottom=5});
    obj.rectangle11:setName("rectangle11");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle11);
    obj.label36:setLeft(0);
    obj.label36:setTop(90);
    obj.label36:setWidth(200);
    obj.label36:setHeight(20);
    obj.label36:setText("Avatar");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle11);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Abilities");
    obj.tab2:setName("tab2");

    obj.frmAbilities = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAbilities:setParent(obj.tab2);
    obj.frmAbilities:setName("frmAbilities");
    obj.frmAbilities:setAlign("client");
    obj.frmAbilities:setTheme("dark");
    obj.frmAbilities:setMargins({top=1});


		
		local path = NDB.load("abilities.xml");

		local function Abilities()
			local nodes = NDB.getChildNodes(sheet.listAbilities); 
			for i=1, #nodes, 1 do
				NDB.deleteNode(nodes[i]);
			end

			for i=1, 26, 1 do
				local pericia = self.rclAbilities:append();
				if pericia~=nil then
					pericia.ability = path[i].nome;
				end;
			end;

			self.rclAbilities:sort();
		end;
	


    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAbilities);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rclAbilities = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAbilities:setParent(obj.scrollBox2);
    obj.rclAbilities:setAlign("left");
    obj.rclAbilities:setWidth(400);
    obj.rclAbilities:setName("rclAbilities");
    obj.rclAbilities:setField("listAbilities");
    obj.rclAbilities:setTemplateForm("frmAbilityForm");
    obj.rclAbilities:setLayout("vertical");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(400);
    obj.layout30:setMargins({right=5,left=5});
    obj.layout30:setName("layout30");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout30);
    obj.button3:setAlign("top");
    obj.button3:setHeight(25);
    obj.button3:setText("Additional Ability");
    obj.button3:setMargins({left=5,right=5});
    obj.button3:setName("button3");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout30);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("specializations");
    obj.textEditor2:setMargins({left=5,right=5,bottom=5});
    obj.textEditor2:setName("textEditor2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Combat");
    obj.tab3:setName("tab3");

    obj.frmCombat = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCombat:setParent(obj.tab3);
    obj.frmCombat:setName("frmCombat");
    obj.frmCombat:setAlign("client");
    obj.frmCombat:setTheme("dark");
    obj.frmCombat:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmCombat);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox3);
    obj.layout31:setHeight(610);
    obj.layout31:setName("layout31");

    obj.rclCombat = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclCombat:setParent(obj.scrollBox3);
    obj.rclCombat:setAlign("left");
    obj.rclCombat:setWidth(630);
    obj.rclCombat:setName("rclCombat");
    obj.rclCombat:setField("listCombat");
    obj.rclCombat:setTemplateForm("frmWeaponForm");
    obj.rclCombat:setLayout("vertical");
    obj.rclCombat:setMinQt(1);

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox3);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(400);
    obj.layout32:setMargins({right=5,left=5});
    obj.layout32:setName("layout32");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout32);
    obj.button4:setAlign("top");
    obj.button4:setHeight(25);
    obj.button4:setText("Additional Weapon");
    obj.button4:setMargins({left=5,right=5});
    obj.button4:setName("button4");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout32);
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setHeight(280);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(15);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle12);
    obj.label37:setAlign("top");
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setText("HEALTH & DEFENSE");
    obj.label37:setName("label37");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle12);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(50);
    obj.layout33:setName("layout33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(5);
    obj.layout34:setName("layout34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout33);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(120);
    obj.layout35:setMargins({right=5});
    obj.layout35:setName("layout35");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout35);
    obj.label38:setText("Armor");
    obj.label38:setWidth(120);
    obj.label38:setHorzTextAlign("leading");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout35);
    obj.edit21:setTop(20);
    obj.edit21:setField("armor_1");
    obj.edit21:setWidth(120);
    obj.edit21:setHeight(25);
    obj.edit21:setName("edit21");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout33);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(50);
    obj.layout36:setMargins({right=5});
    obj.layout36:setName("layout36");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout36);
    obj.label39:setText("Soak");
    obj.label39:setWidth(50);
    obj.label39:setHorzTextAlign("leading");
    obj.label39:setFontSize(13);
    obj.label39:setName("label39");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout36);
    obj.edit22:setTop(20);
    obj.edit22:setField("soak_1");
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setName("edit22");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout33);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(50);
    obj.layout37:setMargins({right=5});
    obj.layout37:setName("layout37");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout37);
    obj.label40:setText("Hard");
    obj.label40:setWidth(50);
    obj.label40:setHorzTextAlign("leading");
    obj.label40:setFontSize(13);
    obj.label40:setName("label40");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout37);
    obj.edit23:setTop(20);
    obj.edit23:setField("hard_1");
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setName("edit23");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout33);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(50);
    obj.layout38:setMargins({right=5});
    obj.layout38:setName("layout38");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout38);
    obj.label41:setText("MP");
    obj.label41:setWidth(50);
    obj.label41:setHorzTextAlign("leading");
    obj.label41:setFontSize(13);
    obj.label41:setName("label41");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout38);
    obj.edit24:setTop(20);
    obj.edit24:setField("mp_1");
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setName("edit24");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout33);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(100);
    obj.layout39:setMargins({right=5});
    obj.layout39:setName("layout39");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout39);
    obj.label42:setText("Tags");
    obj.label42:setWidth(100);
    obj.label42:setHorzTextAlign("leading");
    obj.label42:setFontSize(13);
    obj.label42:setName("label42");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout39);
    obj.edit25:setTop(20);
    obj.edit25:setField("tags_1");
    obj.edit25:setWidth(100);
    obj.edit25:setHeight(25);
    obj.edit25:setName("edit25");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle12);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(50);
    obj.layout40:setName("layout40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(5);
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(120);
    obj.layout42:setMargins({right=5});
    obj.layout42:setName("layout42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout42);
    obj.label43:setText("Armor");
    obj.label43:setWidth(120);
    obj.label43:setHorzTextAlign("leading");
    obj.label43:setFontSize(13);
    obj.label43:setName("label43");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout42);
    obj.edit26:setTop(20);
    obj.edit26:setField("armor_2");
    obj.edit26:setWidth(120);
    obj.edit26:setHeight(25);
    obj.edit26:setName("edit26");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(50);
    obj.layout43:setMargins({right=5});
    obj.layout43:setName("layout43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout43);
    obj.label44:setText("Soak");
    obj.label44:setWidth(50);
    obj.label44:setHorzTextAlign("leading");
    obj.label44:setFontSize(13);
    obj.label44:setName("label44");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout43);
    obj.edit27:setTop(20);
    obj.edit27:setField("soak_2");
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setName("edit27");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(50);
    obj.layout44:setMargins({right=5});
    obj.layout44:setName("layout44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout44);
    obj.label45:setText("Hard");
    obj.label45:setWidth(50);
    obj.label45:setHorzTextAlign("leading");
    obj.label45:setFontSize(13);
    obj.label45:setName("label45");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout44);
    obj.edit28:setTop(20);
    obj.edit28:setField("hard_2");
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setName("edit28");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout40);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(50);
    obj.layout45:setMargins({right=5});
    obj.layout45:setName("layout45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout45);
    obj.label46:setText("MP");
    obj.label46:setWidth(50);
    obj.label46:setHorzTextAlign("leading");
    obj.label46:setFontSize(13);
    obj.label46:setName("label46");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout45);
    obj.edit29:setTop(20);
    obj.edit29:setField("mp_2");
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setName("edit29");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout40);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(100);
    obj.layout46:setMargins({right=5});
    obj.layout46:setName("layout46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout46);
    obj.label47:setText("Tags");
    obj.label47:setWidth(100);
    obj.label47:setHorzTextAlign("leading");
    obj.label47:setFontSize(13);
    obj.label47:setName("label47");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout46);
    obj.edit30:setTop(20);
    obj.edit30:setField("tags_2");
    obj.edit30:setWidth(100);
    obj.edit30:setHeight(25);
    obj.edit30:setName("edit30");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle12);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(50);
    obj.layout47:setName("layout47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(5);
    obj.layout48:setName("layout48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout47);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(125);
    obj.layout49:setMargins({right=5});
    obj.layout49:setName("layout49");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout49);
    obj.label48:setText("Parry");
    obj.label48:setWidth(125);
    obj.label48:setHorzTextAlign("leading");
    obj.label48:setFontSize(13);
    obj.label48:setName("label48");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout49);
    obj.edit31:setTop(20);
    obj.edit31:setField("parry");
    obj.edit31:setWidth(125);
    obj.edit31:setHeight(25);
    obj.edit31:setName("edit31");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout47);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(125);
    obj.layout50:setMargins({right=5});
    obj.layout50:setName("layout50");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout50);
    obj.label49:setText("Resolve");
    obj.label49:setWidth(125);
    obj.label49:setHorzTextAlign("leading");
    obj.label49:setFontSize(13);
    obj.label49:setName("label49");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout50);
    obj.edit32:setTop(20);
    obj.edit32:setField("resolve");
    obj.edit32:setWidth(125);
    obj.edit32:setHeight(25);
    obj.edit32:setName("edit32");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout47);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(125);
    obj.layout51:setMargins({right=5});
    obj.layout51:setName("layout51");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout51);
    obj.label50:setText("Evasion");
    obj.label50:setWidth(125);
    obj.label50:setHorzTextAlign("leading");
    obj.label50:setFontSize(13);
    obj.label50:setName("label50");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout51);
    obj.edit33:setTop(20);
    obj.edit33:setField("evasion");
    obj.edit33:setWidth(125);
    obj.edit33:setHeight(25);
    obj.edit33:setName("edit33");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle12);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(50);
    obj.layout52:setName("layout52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout52);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(5);
    obj.layout53:setName("layout53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout52);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(125);
    obj.layout54:setMargins({right=5});
    obj.layout54:setName("layout54");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout54);
    obj.label51:setText("Guile");
    obj.label51:setWidth(125);
    obj.label51:setHorzTextAlign("leading");
    obj.label51:setFontSize(13);
    obj.label51:setName("label51");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout54);
    obj.edit34:setTop(20);
    obj.edit34:setField("guile");
    obj.edit34:setWidth(125);
    obj.edit34:setHeight(25);
    obj.edit34:setName("edit34");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout52);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(125);
    obj.layout55:setMargins({right=5});
    obj.layout55:setName("layout55");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout55);
    obj.label52:setText("Rush");
    obj.label52:setWidth(125);
    obj.label52:setHorzTextAlign("leading");
    obj.label52:setFontSize(13);
    obj.label52:setName("label52");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout55);
    obj.edit35:setTop(20);
    obj.edit35:setField("rush");
    obj.edit35:setWidth(125);
    obj.edit35:setHeight(25);
    obj.edit35:setName("edit35");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout52);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(125);
    obj.layout56:setMargins({right=5});
    obj.layout56:setName("layout56");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout56);
    obj.label53:setText("Disengage");
    obj.label53:setWidth(125);
    obj.label53:setHorzTextAlign("leading");
    obj.label53:setFontSize(13);
    obj.label53:setName("label53");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout56);
    obj.edit36:setTop(20);
    obj.edit36:setField("disengage");
    obj.edit36:setWidth(125);
    obj.edit36:setHeight(25);
    obj.edit36:setName("edit36");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle12);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(50);
    obj.layout57:setName("layout57");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout57);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(5);
    obj.layout58:setName("layout58");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout57);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(125);
    obj.layout59:setMargins({right=5});
    obj.layout59:setName("layout59");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout59);
    obj.label54:setText("Natural Soak");
    obj.label54:setWidth(125);
    obj.label54:setHorzTextAlign("leading");
    obj.label54:setFontSize(13);
    obj.label54:setName("label54");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout59);
    obj.edit37:setTop(20);
    obj.edit37:setField("natSoak");
    obj.edit37:setWidth(125);
    obj.edit37:setHeight(25);
    obj.edit37:setName("edit37");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout57);
    obj.layout60:setAlign("left");
    obj.layout60:setWidth(125);
    obj.layout60:setMargins({right=5});
    obj.layout60:setName("layout60");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout60);
    obj.label55:setText("Final Soak");
    obj.label55:setWidth(125);
    obj.label55:setHorzTextAlign("leading");
    obj.label55:setFontSize(13);
    obj.label55:setName("label55");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout60);
    obj.edit38:setTop(20);
    obj.edit38:setField("totalSoak");
    obj.edit38:setWidth(125);
    obj.edit38:setHeight(25);
    obj.edit38:setName("edit38");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout57);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(125);
    obj.layout61:setMargins({right=5});
    obj.layout61:setName("layout61");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout61);
    obj.label56:setText("Join Battle");
    obj.label56:setWidth(125);
    obj.label56:setHorzTextAlign("leading");
    obj.label56:setFontSize(13);
    obj.label56:setName("label56");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout61);
    obj.edit39:setTop(20);
    obj.edit39:setField("battle");
    obj.edit39:setWidth(125);
    obj.edit39:setHeight(25);
    obj.edit39:setName("edit39");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout32);
    obj.layout62:setAlign("client");
    obj.layout62:setName("layout62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(135);
    obj.layout63:setName("layout63");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout63);
    obj.button5:setAlign("top");
    obj.button5:setHeight(25);
    obj.button5:setText("HEALTH");
    obj.button5:setMargins({left=5,right=5});
    obj.button5:setName("button5");

    obj.rclHealth = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHealth:setParent(obj.layout63);
    obj.rclHealth:setAlign("client");
    obj.rclHealth:setName("rclHealth");
    obj.rclHealth:setField("listHealth");
    obj.rclHealth:setTemplateForm("frmHealthForm");
    obj.rclHealth:setLayout("vertical");
    obj.rclHealth:setMinQt(1);

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Intimacies");
    obj.tab4:setName("tab4");

    obj.frmIntimacies = GUI.fromHandle(_obj_newObject("form"));
    obj.frmIntimacies:setParent(obj.tab4);
    obj.frmIntimacies:setName("frmIntimacies");
    obj.frmIntimacies:setAlign("client");
    obj.frmIntimacies:setTheme("dark");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmIntimacies);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.scrollBox4);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(25);
    obj.layout64:setMargins({bottom=5});
    obj.layout64:setName("layout64");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout64);
    obj.button6:setAlign("left");
    obj.button6:setText("Novo");
    obj.button6:setWidth(100);
    obj.button6:setName("button6");

    obj.rclIntimacies = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclIntimacies:setParent(obj.scrollBox4);
    obj.rclIntimacies:setAlign("client");
    obj.rclIntimacies:setName("rclIntimacies");
    obj.rclIntimacies:setField("listIntimacies");
    obj.rclIntimacies:setTemplateForm("frmIntimacyForm");
    obj.rclIntimacies:setLayout("verticalTiles");
    obj.rclIntimacies:setSelectable(true);

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Charms");
    obj.tab5:setName("tab5");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.tab5);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setName("rectangle13");

    obj.popMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.rectangle13);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setWidth(250);
    obj.popMagia:setHeight(250);
    obj.popMagia:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popMagia, "autoScopeNode",  "false");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.popMagia);
    obj.edit40:setAlign("top");
    obj.edit40:setField("nome");
    obj.edit40:setTextPrompt("NOME");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popMagia);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(400);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart1);
    obj.label57:setAlign("top");
    obj.label57:setFontSize(10);
    obj.label57:setText("Type");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setWordWrap(true);
    obj.label57:setTextTrimming("none");
    obj.label57:setAutoSize(true);
    obj.label57:setName("label57");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart1);
    obj.edit41:setAlign("client");
    obj.edit41:setField("type");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(12);
    obj.edit41:setName("edit41");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(30);
    obj.flowPart2:setMaxWidth(400);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart2);
    obj.label58:setAlign("top");
    obj.label58:setFontSize(10);
    obj.label58:setText("Duration");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWordWrap(true);
    obj.label58:setTextTrimming("none");
    obj.label58:setAutoSize(true);
    obj.label58:setName("label58");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart2);
    obj.edit42:setAlign("client");
    obj.edit42:setField("duration");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(12);
    obj.edit42:setName("edit42");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(30);
    obj.flowPart3:setMaxWidth(400);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart3);
    obj.label59:setAlign("top");
    obj.label59:setFontSize(10);
    obj.label59:setText("Cost");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setWordWrap(true);
    obj.label59:setTextTrimming("none");
    obj.label59:setAutoSize(true);
    obj.label59:setName("label59");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart3);
    obj.edit43:setAlign("client");
    obj.edit43:setField("cost");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(12);
    obj.edit43:setName("edit43");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(30);
    obj.flowPart4:setMaxWidth(400);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart4);
    obj.label60:setAlign("top");
    obj.label60:setFontSize(10);
    obj.label60:setText("Book");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setWordWrap(true);
    obj.label60:setTextTrimming("none");
    obj.label60:setAutoSize(true);
    obj.label60:setName("label60");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart4);
    obj.edit44:setAlign("client");
    obj.edit44:setField("book");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setName("edit44");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popMagia);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setName("textEditor3");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle13);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox5);
    obj.flowLayout2:setWidth(1030);
    obj.flowLayout2:setHeight(600);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxColumns(3);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowLayout2);
    obj.flowLayout3:setMinWidth(300);
    obj.flowLayout3:setMaxWidth(600);
    obj.flowLayout3:setHeight(100);
    obj.flowLayout3:setAvoidScale(true);
    obj.flowLayout3:setMaxControlsPerLine(1);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout3);
    obj.flowPart5:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setAvoidScale(true);
    obj.flowPart5:setMinScaledWidth(280);
    obj.flowPart5:setMinWidth(300);
    obj.flowPart5:setMaxWidth(600);
    obj.flowPart5:setHeight(80);

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart5);
    obj.label61:setFrameRegion("RegiaoSmallTitulo");
    obj.label61:setText("");
    obj.label61:setName("label61");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setVertTextAlign("center");
    obj.label61:setFontSize(18);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart5);
    obj.label62:setFrameRegion("RegiaoConteudo");
    obj.label62:setText("Archery");
    obj.label62:setFontSize(15);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setVertTextAlign("center");
    obj.label62:setName("label62");

    obj.Archery = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Archery:setParent(obj.flowLayout3);
    obj.Archery:setMinWidth(300);
    obj.Archery:setMaxWidth(600);
    obj.Archery:setMinScaledWidth(280);
    obj.Archery:setName("Archery");


					rawset(self.Archery, "_recalcHeight", 					
						function ()
							self.Archery.height = self.rclArchery.height +
														self.layBottomArchery.height + 
														self.Archery.padding.top + self.Archery.padding.bottom + 7;
						end);
				


    obj.rclArchery = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArchery:setParent(obj.Archery);
    obj.rclArchery:setName("rclArchery");
    obj.rclArchery:setAlign("top");
    obj.rclArchery:setField("magias.magias.Archery");
    obj.rclArchery:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclArchery:setAutoHeight(true);
    obj.rclArchery:setMinHeight(5);
    obj.rclArchery:setHitTest(false);
    obj.rclArchery:setMargins({left=10, right=10});

    obj.layBottomArchery = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomArchery:setParent(obj.Archery);
    obj.layBottomArchery:setName("layBottomArchery");
    obj.layBottomArchery:setAlign("top");
    obj.layBottomArchery:setHeight(36);

    obj.btnNovoArchery = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoArchery:setParent(obj.layBottomArchery);
    obj.btnNovoArchery:setName("btnNovoArchery");
    obj.btnNovoArchery:setAlign("left");
    obj.btnNovoArchery:setText("Nova Magia");
    obj.btnNovoArchery:setWidth(160);
    obj.btnNovoArchery:setMargins({top=4, bottom=4, left=48});

self.Archery._recalcHeight();


    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowLayout2);
    obj.flowLayout4:setMinWidth(300);
    obj.flowLayout4:setMaxWidth(600);
    obj.flowLayout4:setHeight(100);
    obj.flowLayout4:setAvoidScale(true);
    obj.flowLayout4:setMaxControlsPerLine(1);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout4);
    obj.flowPart6:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setAvoidScale(true);
    obj.flowPart6:setMinScaledWidth(280);
    obj.flowPart6:setMinWidth(300);
    obj.flowPart6:setMaxWidth(600);
    obj.flowPart6:setHeight(80);

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart6);
    obj.label63:setFrameRegion("RegiaoSmallTitulo");
    obj.label63:setText("");
    obj.label63:setName("label63");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setVertTextAlign("center");
    obj.label63:setFontSize(18);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart6);
    obj.label64:setFrameRegion("RegiaoConteudo");
    obj.label64:setText("Athletics");
    obj.label64:setFontSize(15);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setVertTextAlign("center");
    obj.label64:setName("label64");

    obj.Athletics = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Athletics:setParent(obj.flowLayout4);
    obj.Athletics:setMinWidth(300);
    obj.Athletics:setMaxWidth(600);
    obj.Athletics:setMinScaledWidth(280);
    obj.Athletics:setName("Athletics");


					rawset(self.Athletics, "_recalcHeight", 					
						function ()
							self.Athletics.height = self.rclAthletics.height +
														self.layBottomAthletics.height + 
														self.Athletics.padding.top + self.Athletics.padding.bottom + 7;
						end);
				


    obj.rclAthletics = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAthletics:setParent(obj.Athletics);
    obj.rclAthletics:setName("rclAthletics");
    obj.rclAthletics:setAlign("top");
    obj.rclAthletics:setField("magias.magias.Athletics");
    obj.rclAthletics:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclAthletics:setAutoHeight(true);
    obj.rclAthletics:setMinHeight(5);
    obj.rclAthletics:setHitTest(false);
    obj.rclAthletics:setMargins({left=10, right=10});

    obj.layBottomAthletics = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomAthletics:setParent(obj.Athletics);
    obj.layBottomAthletics:setName("layBottomAthletics");
    obj.layBottomAthletics:setAlign("top");
    obj.layBottomAthletics:setHeight(36);

    obj.btnNovoAthletics = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoAthletics:setParent(obj.layBottomAthletics);
    obj.btnNovoAthletics:setName("btnNovoAthletics");
    obj.btnNovoAthletics:setAlign("left");
    obj.btnNovoAthletics:setText("Nova Magia");
    obj.btnNovoAthletics:setWidth(160);
    obj.btnNovoAthletics:setMargins({top=4, bottom=4, left=48});

self.Athletics._recalcHeight();


    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowLayout2);
    obj.flowLayout5:setMinWidth(300);
    obj.flowLayout5:setMaxWidth(600);
    obj.flowLayout5:setHeight(100);
    obj.flowLayout5:setAvoidScale(true);
    obj.flowLayout5:setMaxControlsPerLine(1);
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout5);
    obj.flowPart7:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setAvoidScale(true);
    obj.flowPart7:setMinScaledWidth(280);
    obj.flowPart7:setMinWidth(300);
    obj.flowPart7:setMaxWidth(600);
    obj.flowPart7:setHeight(80);

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart7);
    obj.label65:setFrameRegion("RegiaoSmallTitulo");
    obj.label65:setText("");
    obj.label65:setName("label65");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setVertTextAlign("center");
    obj.label65:setFontSize(18);

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart7);
    obj.label66:setFrameRegion("RegiaoConteudo");
    obj.label66:setText("Awareness");
    obj.label66:setFontSize(15);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setVertTextAlign("center");
    obj.label66:setName("label66");

    obj.Awareness = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Awareness:setParent(obj.flowLayout5);
    obj.Awareness:setMinWidth(300);
    obj.Awareness:setMaxWidth(600);
    obj.Awareness:setMinScaledWidth(280);
    obj.Awareness:setName("Awareness");


					rawset(self.Awareness, "_recalcHeight", 					
						function ()
							self.Awareness.height = self.rclAwareness.height +
														self.layBottomAwareness.height + 
														self.Awareness.padding.top + self.Awareness.padding.bottom + 7;
						end);
				


    obj.rclAwareness = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAwareness:setParent(obj.Awareness);
    obj.rclAwareness:setName("rclAwareness");
    obj.rclAwareness:setAlign("top");
    obj.rclAwareness:setField("magias.magias.Awareness");
    obj.rclAwareness:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclAwareness:setAutoHeight(true);
    obj.rclAwareness:setMinHeight(5);
    obj.rclAwareness:setHitTest(false);
    obj.rclAwareness:setMargins({left=10, right=10});

    obj.layBottomAwareness = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomAwareness:setParent(obj.Awareness);
    obj.layBottomAwareness:setName("layBottomAwareness");
    obj.layBottomAwareness:setAlign("top");
    obj.layBottomAwareness:setHeight(36);

    obj.btnNovoAwareness = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoAwareness:setParent(obj.layBottomAwareness);
    obj.btnNovoAwareness:setName("btnNovoAwareness");
    obj.btnNovoAwareness:setAlign("left");
    obj.btnNovoAwareness:setText("Nova Magia");
    obj.btnNovoAwareness:setWidth(160);
    obj.btnNovoAwareness:setMargins({top=4, bottom=4, left=48});

self.Awareness._recalcHeight();


    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowLayout2);
    obj.flowLayout6:setMinWidth(300);
    obj.flowLayout6:setMaxWidth(600);
    obj.flowLayout6:setHeight(100);
    obj.flowLayout6:setAvoidScale(true);
    obj.flowLayout6:setMaxControlsPerLine(1);
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout6);
    obj.flowPart8:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setAvoidScale(true);
    obj.flowPart8:setMinScaledWidth(280);
    obj.flowPart8:setMinWidth(300);
    obj.flowPart8:setMaxWidth(600);
    obj.flowPart8:setHeight(80);

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart8);
    obj.label67:setFrameRegion("RegiaoSmallTitulo");
    obj.label67:setText("");
    obj.label67:setName("label67");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setVertTextAlign("center");
    obj.label67:setFontSize(18);

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart8);
    obj.label68:setFrameRegion("RegiaoConteudo");
    obj.label68:setText("Brawl");
    obj.label68:setFontSize(15);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setVertTextAlign("center");
    obj.label68:setName("label68");

    obj.Brawl = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Brawl:setParent(obj.flowLayout6);
    obj.Brawl:setMinWidth(300);
    obj.Brawl:setMaxWidth(600);
    obj.Brawl:setMinScaledWidth(280);
    obj.Brawl:setName("Brawl");


					rawset(self.Brawl, "_recalcHeight", 					
						function ()
							self.Brawl.height = self.rclBrawl.height +
														self.layBottomBrawl.height + 
														self.Brawl.padding.top + self.Brawl.padding.bottom + 7;
						end);
				


    obj.rclBrawl = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclBrawl:setParent(obj.Brawl);
    obj.rclBrawl:setName("rclBrawl");
    obj.rclBrawl:setAlign("top");
    obj.rclBrawl:setField("magias.magias.Brawl");
    obj.rclBrawl:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclBrawl:setAutoHeight(true);
    obj.rclBrawl:setMinHeight(5);
    obj.rclBrawl:setHitTest(false);
    obj.rclBrawl:setMargins({left=10, right=10});

    obj.layBottomBrawl = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomBrawl:setParent(obj.Brawl);
    obj.layBottomBrawl:setName("layBottomBrawl");
    obj.layBottomBrawl:setAlign("top");
    obj.layBottomBrawl:setHeight(36);

    obj.btnNovoBrawl = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoBrawl:setParent(obj.layBottomBrawl);
    obj.btnNovoBrawl:setName("btnNovoBrawl");
    obj.btnNovoBrawl:setAlign("left");
    obj.btnNovoBrawl:setText("Nova Magia");
    obj.btnNovoBrawl:setWidth(160);
    obj.btnNovoBrawl:setMargins({top=4, bottom=4, left=48});

self.Brawl._recalcHeight();


    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowLayout2);
    obj.flowLayout7:setMinWidth(300);
    obj.flowLayout7:setMaxWidth(600);
    obj.flowLayout7:setHeight(100);
    obj.flowLayout7:setAvoidScale(true);
    obj.flowLayout7:setMaxControlsPerLine(1);
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout7);
    obj.flowPart9:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setAvoidScale(true);
    obj.flowPart9:setMinScaledWidth(280);
    obj.flowPart9:setMinWidth(300);
    obj.flowPart9:setMaxWidth(600);
    obj.flowPart9:setHeight(80);

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart9);
    obj.label69:setFrameRegion("RegiaoSmallTitulo");
    obj.label69:setText("");
    obj.label69:setName("label69");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setVertTextAlign("center");
    obj.label69:setFontSize(18);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart9);
    obj.label70:setFrameRegion("RegiaoConteudo");
    obj.label70:setText("Bureaucracy");
    obj.label70:setFontSize(15);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setVertTextAlign("center");
    obj.label70:setName("label70");

    obj.Bureaucracy = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Bureaucracy:setParent(obj.flowLayout7);
    obj.Bureaucracy:setMinWidth(300);
    obj.Bureaucracy:setMaxWidth(600);
    obj.Bureaucracy:setMinScaledWidth(280);
    obj.Bureaucracy:setName("Bureaucracy");


					rawset(self.Bureaucracy, "_recalcHeight", 					
						function ()
							self.Bureaucracy.height = self.rclBureaucracy.height +
														self.layBottomBureaucracy.height + 
														self.Bureaucracy.padding.top + self.Bureaucracy.padding.bottom + 7;
						end);
				


    obj.rclBureaucracy = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclBureaucracy:setParent(obj.Bureaucracy);
    obj.rclBureaucracy:setName("rclBureaucracy");
    obj.rclBureaucracy:setAlign("top");
    obj.rclBureaucracy:setField("magias.magias.Bureaucracy");
    obj.rclBureaucracy:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclBureaucracy:setAutoHeight(true);
    obj.rclBureaucracy:setMinHeight(5);
    obj.rclBureaucracy:setHitTest(false);
    obj.rclBureaucracy:setMargins({left=10, right=10});

    obj.layBottomBureaucracy = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomBureaucracy:setParent(obj.Bureaucracy);
    obj.layBottomBureaucracy:setName("layBottomBureaucracy");
    obj.layBottomBureaucracy:setAlign("top");
    obj.layBottomBureaucracy:setHeight(36);

    obj.btnNovoBureaucracy = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoBureaucracy:setParent(obj.layBottomBureaucracy);
    obj.btnNovoBureaucracy:setName("btnNovoBureaucracy");
    obj.btnNovoBureaucracy:setAlign("left");
    obj.btnNovoBureaucracy:setText("Nova Magia");
    obj.btnNovoBureaucracy:setWidth(160);
    obj.btnNovoBureaucracy:setMargins({top=4, bottom=4, left=48});

self.Bureaucracy._recalcHeight();


    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowLayout2);
    obj.flowLayout8:setMinWidth(300);
    obj.flowLayout8:setMaxWidth(600);
    obj.flowLayout8:setHeight(100);
    obj.flowLayout8:setAvoidScale(true);
    obj.flowLayout8:setMaxControlsPerLine(1);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout8);
    obj.flowPart10:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setAvoidScale(true);
    obj.flowPart10:setMinScaledWidth(280);
    obj.flowPart10:setMinWidth(300);
    obj.flowPart10:setMaxWidth(600);
    obj.flowPart10:setHeight(80);

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart10);
    obj.label71:setFrameRegion("RegiaoSmallTitulo");
    obj.label71:setText("");
    obj.label71:setName("label71");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setVertTextAlign("center");
    obj.label71:setFontSize(18);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart10);
    obj.label72:setFrameRegion("RegiaoConteudo");
    obj.label72:setText("Craft");
    obj.label72:setFontSize(15);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setVertTextAlign("center");
    obj.label72:setName("label72");

    obj.Craft = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Craft:setParent(obj.flowLayout8);
    obj.Craft:setMinWidth(300);
    obj.Craft:setMaxWidth(600);
    obj.Craft:setMinScaledWidth(280);
    obj.Craft:setName("Craft");


					rawset(self.Craft, "_recalcHeight", 					
						function ()
							self.Craft.height = self.rclCraft.height +
														self.layBottomCraft.height + 
														self.Craft.padding.top + self.Craft.padding.bottom + 7;
						end);
				


    obj.rclCraft = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclCraft:setParent(obj.Craft);
    obj.rclCraft:setName("rclCraft");
    obj.rclCraft:setAlign("top");
    obj.rclCraft:setField("magias.magias.Craft");
    obj.rclCraft:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclCraft:setAutoHeight(true);
    obj.rclCraft:setMinHeight(5);
    obj.rclCraft:setHitTest(false);
    obj.rclCraft:setMargins({left=10, right=10});

    obj.layBottomCraft = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomCraft:setParent(obj.Craft);
    obj.layBottomCraft:setName("layBottomCraft");
    obj.layBottomCraft:setAlign("top");
    obj.layBottomCraft:setHeight(36);

    obj.btnNovoCraft = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoCraft:setParent(obj.layBottomCraft);
    obj.btnNovoCraft:setName("btnNovoCraft");
    obj.btnNovoCraft:setAlign("left");
    obj.btnNovoCraft:setText("Nova Magia");
    obj.btnNovoCraft:setWidth(160);
    obj.btnNovoCraft:setMargins({top=4, bottom=4, left=48});

self.Craft._recalcHeight();


    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowLayout2);
    obj.flowLayout9:setMinWidth(300);
    obj.flowLayout9:setMaxWidth(600);
    obj.flowLayout9:setHeight(100);
    obj.flowLayout9:setAvoidScale(true);
    obj.flowLayout9:setMaxControlsPerLine(1);
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout9);
    obj.flowPart11:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setAvoidScale(true);
    obj.flowPart11:setMinScaledWidth(280);
    obj.flowPart11:setMinWidth(300);
    obj.flowPart11:setMaxWidth(600);
    obj.flowPart11:setHeight(80);

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart11);
    obj.label73:setFrameRegion("RegiaoSmallTitulo");
    obj.label73:setText("");
    obj.label73:setName("label73");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setVertTextAlign("center");
    obj.label73:setFontSize(18);

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowPart11);
    obj.label74:setFrameRegion("RegiaoConteudo");
    obj.label74:setText("Dodge");
    obj.label74:setFontSize(15);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setVertTextAlign("center");
    obj.label74:setName("label74");

    obj.Dodge = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Dodge:setParent(obj.flowLayout9);
    obj.Dodge:setMinWidth(300);
    obj.Dodge:setMaxWidth(600);
    obj.Dodge:setMinScaledWidth(280);
    obj.Dodge:setName("Dodge");


					rawset(self.Dodge, "_recalcHeight", 					
						function ()
							self.Dodge.height = self.rclDodge.height +
														self.layBottomDodge.height + 
														self.Dodge.padding.top + self.Dodge.padding.bottom + 7;
						end);
				


    obj.rclDodge = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDodge:setParent(obj.Dodge);
    obj.rclDodge:setName("rclDodge");
    obj.rclDodge:setAlign("top");
    obj.rclDodge:setField("magias.magias.Dodge");
    obj.rclDodge:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclDodge:setAutoHeight(true);
    obj.rclDodge:setMinHeight(5);
    obj.rclDodge:setHitTest(false);
    obj.rclDodge:setMargins({left=10, right=10});

    obj.layBottomDodge = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomDodge:setParent(obj.Dodge);
    obj.layBottomDodge:setName("layBottomDodge");
    obj.layBottomDodge:setAlign("top");
    obj.layBottomDodge:setHeight(36);

    obj.btnNovoDodge = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoDodge:setParent(obj.layBottomDodge);
    obj.btnNovoDodge:setName("btnNovoDodge");
    obj.btnNovoDodge:setAlign("left");
    obj.btnNovoDodge:setText("Nova Magia");
    obj.btnNovoDodge:setWidth(160);
    obj.btnNovoDodge:setMargins({top=4, bottom=4, left=48});

self.Dodge._recalcHeight();


    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowLayout2);
    obj.flowLayout10:setMinWidth(300);
    obj.flowLayout10:setMaxWidth(600);
    obj.flowLayout10:setHeight(100);
    obj.flowLayout10:setAvoidScale(true);
    obj.flowLayout10:setMaxControlsPerLine(1);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout10);
    obj.flowPart12:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setAvoidScale(true);
    obj.flowPart12:setMinScaledWidth(280);
    obj.flowPart12:setMinWidth(300);
    obj.flowPart12:setMaxWidth(600);
    obj.flowPart12:setHeight(80);

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart12);
    obj.label75:setFrameRegion("RegiaoSmallTitulo");
    obj.label75:setText("");
    obj.label75:setName("label75");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setVertTextAlign("center");
    obj.label75:setFontSize(18);

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart12);
    obj.label76:setFrameRegion("RegiaoConteudo");
    obj.label76:setText("Integrity");
    obj.label76:setFontSize(15);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setVertTextAlign("center");
    obj.label76:setName("label76");

    obj.Integrity = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Integrity:setParent(obj.flowLayout10);
    obj.Integrity:setMinWidth(300);
    obj.Integrity:setMaxWidth(600);
    obj.Integrity:setMinScaledWidth(280);
    obj.Integrity:setName("Integrity");


					rawset(self.Integrity, "_recalcHeight", 					
						function ()
							self.Integrity.height = self.rclIntegrity.height +
														self.layBottomIntegrity.height + 
														self.Integrity.padding.top + self.Integrity.padding.bottom + 7;
						end);
				


    obj.rclIntegrity = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclIntegrity:setParent(obj.Integrity);
    obj.rclIntegrity:setName("rclIntegrity");
    obj.rclIntegrity:setAlign("top");
    obj.rclIntegrity:setField("magias.magias.Integrity");
    obj.rclIntegrity:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclIntegrity:setAutoHeight(true);
    obj.rclIntegrity:setMinHeight(5);
    obj.rclIntegrity:setHitTest(false);
    obj.rclIntegrity:setMargins({left=10, right=10});

    obj.layBottomIntegrity = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomIntegrity:setParent(obj.Integrity);
    obj.layBottomIntegrity:setName("layBottomIntegrity");
    obj.layBottomIntegrity:setAlign("top");
    obj.layBottomIntegrity:setHeight(36);

    obj.btnNovoIntegrity = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoIntegrity:setParent(obj.layBottomIntegrity);
    obj.btnNovoIntegrity:setName("btnNovoIntegrity");
    obj.btnNovoIntegrity:setAlign("left");
    obj.btnNovoIntegrity:setText("Nova Magia");
    obj.btnNovoIntegrity:setWidth(160);
    obj.btnNovoIntegrity:setMargins({top=4, bottom=4, left=48});

self.Integrity._recalcHeight();


    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowLayout2);
    obj.flowLayout11:setMinWidth(300);
    obj.flowLayout11:setMaxWidth(600);
    obj.flowLayout11:setHeight(100);
    obj.flowLayout11:setAvoidScale(true);
    obj.flowLayout11:setMaxControlsPerLine(1);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout11);
    obj.flowPart13:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setAvoidScale(true);
    obj.flowPart13:setMinScaledWidth(280);
    obj.flowPart13:setMinWidth(300);
    obj.flowPart13:setMaxWidth(600);
    obj.flowPart13:setHeight(80);

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart13);
    obj.label77:setFrameRegion("RegiaoSmallTitulo");
    obj.label77:setText("");
    obj.label77:setName("label77");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setVertTextAlign("center");
    obj.label77:setFontSize(18);

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowPart13);
    obj.label78:setFrameRegion("RegiaoConteudo");
    obj.label78:setText("Investigation");
    obj.label78:setFontSize(15);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("center");
    obj.label78:setName("label78");

    obj.Investigation = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Investigation:setParent(obj.flowLayout11);
    obj.Investigation:setMinWidth(300);
    obj.Investigation:setMaxWidth(600);
    obj.Investigation:setMinScaledWidth(280);
    obj.Investigation:setName("Investigation");


					rawset(self.Investigation, "_recalcHeight", 					
						function ()
							self.Investigation.height = self.rclInvestigation.height +
														self.layBottomInvestigation.height + 
														self.Investigation.padding.top + self.Investigation.padding.bottom + 7;
						end);
				


    obj.rclInvestigation = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInvestigation:setParent(obj.Investigation);
    obj.rclInvestigation:setName("rclInvestigation");
    obj.rclInvestigation:setAlign("top");
    obj.rclInvestigation:setField("magias.magias.Investigation");
    obj.rclInvestigation:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclInvestigation:setAutoHeight(true);
    obj.rclInvestigation:setMinHeight(5);
    obj.rclInvestigation:setHitTest(false);
    obj.rclInvestigation:setMargins({left=10, right=10});

    obj.layBottomInvestigation = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomInvestigation:setParent(obj.Investigation);
    obj.layBottomInvestigation:setName("layBottomInvestigation");
    obj.layBottomInvestigation:setAlign("top");
    obj.layBottomInvestigation:setHeight(36);

    obj.btnNovoInvestigation = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoInvestigation:setParent(obj.layBottomInvestigation);
    obj.btnNovoInvestigation:setName("btnNovoInvestigation");
    obj.btnNovoInvestigation:setAlign("left");
    obj.btnNovoInvestigation:setText("Nova Magia");
    obj.btnNovoInvestigation:setWidth(160);
    obj.btnNovoInvestigation:setMargins({top=4, bottom=4, left=48});

self.Investigation._recalcHeight();


    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowLayout2);
    obj.flowLayout12:setMinWidth(300);
    obj.flowLayout12:setMaxWidth(600);
    obj.flowLayout12:setHeight(100);
    obj.flowLayout12:setAvoidScale(true);
    obj.flowLayout12:setMaxControlsPerLine(1);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout12);
    obj.flowPart14:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setAvoidScale(true);
    obj.flowPart14:setMinScaledWidth(280);
    obj.flowPart14:setMinWidth(300);
    obj.flowPart14:setMaxWidth(600);
    obj.flowPart14:setHeight(80);

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart14);
    obj.label79:setFrameRegion("RegiaoSmallTitulo");
    obj.label79:setText("");
    obj.label79:setName("label79");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setVertTextAlign("center");
    obj.label79:setFontSize(18);

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowPart14);
    obj.label80:setFrameRegion("RegiaoConteudo");
    obj.label80:setText("Larceny");
    obj.label80:setFontSize(15);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setVertTextAlign("center");
    obj.label80:setName("label80");

    obj.Larceny = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Larceny:setParent(obj.flowLayout12);
    obj.Larceny:setMinWidth(300);
    obj.Larceny:setMaxWidth(600);
    obj.Larceny:setMinScaledWidth(280);
    obj.Larceny:setName("Larceny");


					rawset(self.Larceny, "_recalcHeight", 					
						function ()
							self.Larceny.height = self.rclLarceny.height +
														self.layBottomLarceny.height + 
														self.Larceny.padding.top + self.Larceny.padding.bottom + 7;
						end);
				


    obj.rclLarceny = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLarceny:setParent(obj.Larceny);
    obj.rclLarceny:setName("rclLarceny");
    obj.rclLarceny:setAlign("top");
    obj.rclLarceny:setField("magias.magias.Larceny");
    obj.rclLarceny:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclLarceny:setAutoHeight(true);
    obj.rclLarceny:setMinHeight(5);
    obj.rclLarceny:setHitTest(false);
    obj.rclLarceny:setMargins({left=10, right=10});

    obj.layBottomLarceny = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomLarceny:setParent(obj.Larceny);
    obj.layBottomLarceny:setName("layBottomLarceny");
    obj.layBottomLarceny:setAlign("top");
    obj.layBottomLarceny:setHeight(36);

    obj.btnNovoLarceny = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoLarceny:setParent(obj.layBottomLarceny);
    obj.btnNovoLarceny:setName("btnNovoLarceny");
    obj.btnNovoLarceny:setAlign("left");
    obj.btnNovoLarceny:setText("Nova Magia");
    obj.btnNovoLarceny:setWidth(160);
    obj.btnNovoLarceny:setMargins({top=4, bottom=4, left=48});

self.Larceny._recalcHeight();


    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowLayout2);
    obj.flowLayout13:setMinWidth(300);
    obj.flowLayout13:setMaxWidth(600);
    obj.flowLayout13:setHeight(100);
    obj.flowLayout13:setAvoidScale(true);
    obj.flowLayout13:setMaxControlsPerLine(1);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout13);
    obj.flowPart15:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setAvoidScale(true);
    obj.flowPart15:setMinScaledWidth(280);
    obj.flowPart15:setMinWidth(300);
    obj.flowPart15:setMaxWidth(600);
    obj.flowPart15:setHeight(80);

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart15);
    obj.label81:setFrameRegion("RegiaoSmallTitulo");
    obj.label81:setText("");
    obj.label81:setName("label81");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setVertTextAlign("center");
    obj.label81:setFontSize(18);

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowPart15);
    obj.label82:setFrameRegion("RegiaoConteudo");
    obj.label82:setText("Linguistics");
    obj.label82:setFontSize(15);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setVertTextAlign("center");
    obj.label82:setName("label82");

    obj.Linguistics = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Linguistics:setParent(obj.flowLayout13);
    obj.Linguistics:setMinWidth(300);
    obj.Linguistics:setMaxWidth(600);
    obj.Linguistics:setMinScaledWidth(280);
    obj.Linguistics:setName("Linguistics");


					rawset(self.Linguistics, "_recalcHeight", 					
						function ()
							self.Linguistics.height = self.rclLinguistics.height +
														self.layBottomLinguistics.height + 
														self.Linguistics.padding.top + self.Linguistics.padding.bottom + 7;
						end);
				


    obj.rclLinguistics = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLinguistics:setParent(obj.Linguistics);
    obj.rclLinguistics:setName("rclLinguistics");
    obj.rclLinguistics:setAlign("top");
    obj.rclLinguistics:setField("magias.magias.Linguistics");
    obj.rclLinguistics:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclLinguistics:setAutoHeight(true);
    obj.rclLinguistics:setMinHeight(5);
    obj.rclLinguistics:setHitTest(false);
    obj.rclLinguistics:setMargins({left=10, right=10});

    obj.layBottomLinguistics = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomLinguistics:setParent(obj.Linguistics);
    obj.layBottomLinguistics:setName("layBottomLinguistics");
    obj.layBottomLinguistics:setAlign("top");
    obj.layBottomLinguistics:setHeight(36);

    obj.btnNovoLinguistics = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoLinguistics:setParent(obj.layBottomLinguistics);
    obj.btnNovoLinguistics:setName("btnNovoLinguistics");
    obj.btnNovoLinguistics:setAlign("left");
    obj.btnNovoLinguistics:setText("Nova Magia");
    obj.btnNovoLinguistics:setWidth(160);
    obj.btnNovoLinguistics:setMargins({top=4, bottom=4, left=48});

self.Linguistics._recalcHeight();


    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowLayout2);
    obj.flowLayout14:setMinWidth(300);
    obj.flowLayout14:setMaxWidth(600);
    obj.flowLayout14:setHeight(100);
    obj.flowLayout14:setAvoidScale(true);
    obj.flowLayout14:setMaxControlsPerLine(1);
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout14);
    obj.flowPart16:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setAvoidScale(true);
    obj.flowPart16:setMinScaledWidth(280);
    obj.flowPart16:setMinWidth(300);
    obj.flowPart16:setMaxWidth(600);
    obj.flowPart16:setHeight(80);

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart16);
    obj.label83:setFrameRegion("RegiaoSmallTitulo");
    obj.label83:setText("");
    obj.label83:setName("label83");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setVertTextAlign("center");
    obj.label83:setFontSize(18);

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart16);
    obj.label84:setFrameRegion("RegiaoConteudo");
    obj.label84:setText("Lore");
    obj.label84:setFontSize(15);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setVertTextAlign("center");
    obj.label84:setName("label84");

    obj.Lore = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Lore:setParent(obj.flowLayout14);
    obj.Lore:setMinWidth(300);
    obj.Lore:setMaxWidth(600);
    obj.Lore:setMinScaledWidth(280);
    obj.Lore:setName("Lore");


					rawset(self.Lore, "_recalcHeight", 					
						function ()
							self.Lore.height = self.rclLore.height +
														self.layBottomLore.height + 
														self.Lore.padding.top + self.Lore.padding.bottom + 7;
						end);
				


    obj.rclLore = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLore:setParent(obj.Lore);
    obj.rclLore:setName("rclLore");
    obj.rclLore:setAlign("top");
    obj.rclLore:setField("magias.magias.Lore");
    obj.rclLore:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclLore:setAutoHeight(true);
    obj.rclLore:setMinHeight(5);
    obj.rclLore:setHitTest(false);
    obj.rclLore:setMargins({left=10, right=10});

    obj.layBottomLore = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomLore:setParent(obj.Lore);
    obj.layBottomLore:setName("layBottomLore");
    obj.layBottomLore:setAlign("top");
    obj.layBottomLore:setHeight(36);

    obj.btnNovoLore = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoLore:setParent(obj.layBottomLore);
    obj.btnNovoLore:setName("btnNovoLore");
    obj.btnNovoLore:setAlign("left");
    obj.btnNovoLore:setText("Nova Magia");
    obj.btnNovoLore:setWidth(160);
    obj.btnNovoLore:setMargins({top=4, bottom=4, left=48});

self.Lore._recalcHeight();


    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.flowLayout2);
    obj.flowLayout15:setMinWidth(300);
    obj.flowLayout15:setMaxWidth(600);
    obj.flowLayout15:setHeight(100);
    obj.flowLayout15:setAvoidScale(true);
    obj.flowLayout15:setMaxControlsPerLine(1);
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setName("flowLayout15");
    obj.flowLayout15:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout15);
    obj.flowPart17:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setAvoidScale(true);
    obj.flowPart17:setMinScaledWidth(280);
    obj.flowPart17:setMinWidth(300);
    obj.flowPart17:setMaxWidth(600);
    obj.flowPart17:setHeight(80);

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart17);
    obj.label85:setFrameRegion("RegiaoSmallTitulo");
    obj.label85:setText("");
    obj.label85:setName("label85");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setVertTextAlign("center");
    obj.label85:setFontSize(18);

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart17);
    obj.label86:setFrameRegion("RegiaoConteudo");
    obj.label86:setText("Martial Arts");
    obj.label86:setFontSize(15);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setVertTextAlign("center");
    obj.label86:setName("label86");

    obj.Martial = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Martial:setParent(obj.flowLayout15);
    obj.Martial:setMinWidth(300);
    obj.Martial:setMaxWidth(600);
    obj.Martial:setMinScaledWidth(280);
    obj.Martial:setName("Martial");


					rawset(self.Martial, "_recalcHeight", 					
						function ()
							self.Martial.height = self.rclMartial.height +
														self.layBottomMartial.height + 
														self.Martial.padding.top + self.Martial.padding.bottom + 7;
						end);
				


    obj.rclMartial = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMartial:setParent(obj.Martial);
    obj.rclMartial:setName("rclMartial");
    obj.rclMartial:setAlign("top");
    obj.rclMartial:setField("magias.magias.Martial");
    obj.rclMartial:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclMartial:setAutoHeight(true);
    obj.rclMartial:setMinHeight(5);
    obj.rclMartial:setHitTest(false);
    obj.rclMartial:setMargins({left=10, right=10});

    obj.layBottomMartial = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomMartial:setParent(obj.Martial);
    obj.layBottomMartial:setName("layBottomMartial");
    obj.layBottomMartial:setAlign("top");
    obj.layBottomMartial:setHeight(36);

    obj.btnNovoMartial = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoMartial:setParent(obj.layBottomMartial);
    obj.btnNovoMartial:setName("btnNovoMartial");
    obj.btnNovoMartial:setAlign("left");
    obj.btnNovoMartial:setText("Nova Magia");
    obj.btnNovoMartial:setWidth(160);
    obj.btnNovoMartial:setMargins({top=4, bottom=4, left=48});

self.Martial._recalcHeight();


    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowLayout2);
    obj.flowLayout16:setMinWidth(300);
    obj.flowLayout16:setMaxWidth(600);
    obj.flowLayout16:setHeight(100);
    obj.flowLayout16:setAvoidScale(true);
    obj.flowLayout16:setMaxControlsPerLine(1);
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setName("flowLayout16");
    obj.flowLayout16:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout16);
    obj.flowPart18:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setAvoidScale(true);
    obj.flowPart18:setMinScaledWidth(280);
    obj.flowPart18:setMinWidth(300);
    obj.flowPart18:setMaxWidth(600);
    obj.flowPart18:setHeight(80);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart18);
    obj.label87:setFrameRegion("RegiaoSmallTitulo");
    obj.label87:setText("");
    obj.label87:setName("label87");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setVertTextAlign("center");
    obj.label87:setFontSize(18);

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowPart18);
    obj.label88:setFrameRegion("RegiaoConteudo");
    obj.label88:setText("Medicine");
    obj.label88:setFontSize(15);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setVertTextAlign("center");
    obj.label88:setName("label88");

    obj.Medicine = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Medicine:setParent(obj.flowLayout16);
    obj.Medicine:setMinWidth(300);
    obj.Medicine:setMaxWidth(600);
    obj.Medicine:setMinScaledWidth(280);
    obj.Medicine:setName("Medicine");


					rawset(self.Medicine, "_recalcHeight", 					
						function ()
							self.Medicine.height = self.rclMedicine.height +
														self.layBottomMedicine.height + 
														self.Medicine.padding.top + self.Medicine.padding.bottom + 7;
						end);
				


    obj.rclMedicine = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMedicine:setParent(obj.Medicine);
    obj.rclMedicine:setName("rclMedicine");
    obj.rclMedicine:setAlign("top");
    obj.rclMedicine:setField("magias.magias.Medicine");
    obj.rclMedicine:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclMedicine:setAutoHeight(true);
    obj.rclMedicine:setMinHeight(5);
    obj.rclMedicine:setHitTest(false);
    obj.rclMedicine:setMargins({left=10, right=10});

    obj.layBottomMedicine = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomMedicine:setParent(obj.Medicine);
    obj.layBottomMedicine:setName("layBottomMedicine");
    obj.layBottomMedicine:setAlign("top");
    obj.layBottomMedicine:setHeight(36);

    obj.btnNovoMedicine = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoMedicine:setParent(obj.layBottomMedicine);
    obj.btnNovoMedicine:setName("btnNovoMedicine");
    obj.btnNovoMedicine:setAlign("left");
    obj.btnNovoMedicine:setText("Nova Magia");
    obj.btnNovoMedicine:setWidth(160);
    obj.btnNovoMedicine:setMargins({top=4, bottom=4, left=48});

self.Medicine._recalcHeight();


    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowLayout2);
    obj.flowLayout17:setMinWidth(300);
    obj.flowLayout17:setMaxWidth(600);
    obj.flowLayout17:setHeight(100);
    obj.flowLayout17:setAvoidScale(true);
    obj.flowLayout17:setMaxControlsPerLine(1);
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setName("flowLayout17");
    obj.flowLayout17:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout17);
    obj.flowPart19:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setAvoidScale(true);
    obj.flowPart19:setMinScaledWidth(280);
    obj.flowPart19:setMinWidth(300);
    obj.flowPart19:setMaxWidth(600);
    obj.flowPart19:setHeight(80);

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowPart19);
    obj.label89:setFrameRegion("RegiaoSmallTitulo");
    obj.label89:setText("");
    obj.label89:setName("label89");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setVertTextAlign("center");
    obj.label89:setFontSize(18);

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowPart19);
    obj.label90:setFrameRegion("RegiaoConteudo");
    obj.label90:setText("Melee");
    obj.label90:setFontSize(15);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setVertTextAlign("center");
    obj.label90:setName("label90");

    obj.Melee = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Melee:setParent(obj.flowLayout17);
    obj.Melee:setMinWidth(300);
    obj.Melee:setMaxWidth(600);
    obj.Melee:setMinScaledWidth(280);
    obj.Melee:setName("Melee");


					rawset(self.Melee, "_recalcHeight", 					
						function ()
							self.Melee.height = self.rclMelee.height +
														self.layBottomMelee.height + 
														self.Melee.padding.top + self.Melee.padding.bottom + 7;
						end);
				


    obj.rclMelee = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMelee:setParent(obj.Melee);
    obj.rclMelee:setName("rclMelee");
    obj.rclMelee:setAlign("top");
    obj.rclMelee:setField("magias.magias.Melee");
    obj.rclMelee:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclMelee:setAutoHeight(true);
    obj.rclMelee:setMinHeight(5);
    obj.rclMelee:setHitTest(false);
    obj.rclMelee:setMargins({left=10, right=10});

    obj.layBottomMelee = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomMelee:setParent(obj.Melee);
    obj.layBottomMelee:setName("layBottomMelee");
    obj.layBottomMelee:setAlign("top");
    obj.layBottomMelee:setHeight(36);

    obj.btnNovoMelee = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoMelee:setParent(obj.layBottomMelee);
    obj.btnNovoMelee:setName("btnNovoMelee");
    obj.btnNovoMelee:setAlign("left");
    obj.btnNovoMelee:setText("Nova Magia");
    obj.btnNovoMelee:setWidth(160);
    obj.btnNovoMelee:setMargins({top=4, bottom=4, left=48});

self.Melee._recalcHeight();


    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowLayout2);
    obj.flowLayout18:setMinWidth(300);
    obj.flowLayout18:setMaxWidth(600);
    obj.flowLayout18:setHeight(100);
    obj.flowLayout18:setAvoidScale(true);
    obj.flowLayout18:setMaxControlsPerLine(1);
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setName("flowLayout18");
    obj.flowLayout18:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout18);
    obj.flowPart20:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setAvoidScale(true);
    obj.flowPart20:setMinScaledWidth(280);
    obj.flowPart20:setMinWidth(300);
    obj.flowPart20:setMaxWidth(600);
    obj.flowPart20:setHeight(80);

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowPart20);
    obj.label91:setFrameRegion("RegiaoSmallTitulo");
    obj.label91:setText("");
    obj.label91:setName("label91");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setVertTextAlign("center");
    obj.label91:setFontSize(18);

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.flowPart20);
    obj.label92:setFrameRegion("RegiaoConteudo");
    obj.label92:setText("Occult");
    obj.label92:setFontSize(15);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setVertTextAlign("center");
    obj.label92:setName("label92");

    obj.Occult = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Occult:setParent(obj.flowLayout18);
    obj.Occult:setMinWidth(300);
    obj.Occult:setMaxWidth(600);
    obj.Occult:setMinScaledWidth(280);
    obj.Occult:setName("Occult");


					rawset(self.Occult, "_recalcHeight", 					
						function ()
							self.Occult.height = self.rclOccult.height +
														self.layBottomOccult.height + 
														self.Occult.padding.top + self.Occult.padding.bottom + 7;
						end);
				


    obj.rclOccult = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclOccult:setParent(obj.Occult);
    obj.rclOccult:setName("rclOccult");
    obj.rclOccult:setAlign("top");
    obj.rclOccult:setField("magias.magias.Occult");
    obj.rclOccult:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclOccult:setAutoHeight(true);
    obj.rclOccult:setMinHeight(5);
    obj.rclOccult:setHitTest(false);
    obj.rclOccult:setMargins({left=10, right=10});

    obj.layBottomOccult = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomOccult:setParent(obj.Occult);
    obj.layBottomOccult:setName("layBottomOccult");
    obj.layBottomOccult:setAlign("top");
    obj.layBottomOccult:setHeight(36);

    obj.btnNovoOccult = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoOccult:setParent(obj.layBottomOccult);
    obj.btnNovoOccult:setName("btnNovoOccult");
    obj.btnNovoOccult:setAlign("left");
    obj.btnNovoOccult:setText("Nova Magia");
    obj.btnNovoOccult:setWidth(160);
    obj.btnNovoOccult:setMargins({top=4, bottom=4, left=48});

self.Occult._recalcHeight();


    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.flowLayout2);
    obj.flowLayout19:setMinWidth(300);
    obj.flowLayout19:setMaxWidth(600);
    obj.flowLayout19:setHeight(100);
    obj.flowLayout19:setAvoidScale(true);
    obj.flowLayout19:setMaxControlsPerLine(1);
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setName("flowLayout19");
    obj.flowLayout19:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout19);
    obj.flowPart21:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setAvoidScale(true);
    obj.flowPart21:setMinScaledWidth(280);
    obj.flowPart21:setMinWidth(300);
    obj.flowPart21:setMaxWidth(600);
    obj.flowPart21:setHeight(80);

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowPart21);
    obj.label93:setFrameRegion("RegiaoSmallTitulo");
    obj.label93:setText("");
    obj.label93:setName("label93");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setVertTextAlign("center");
    obj.label93:setFontSize(18);

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.flowPart21);
    obj.label94:setFrameRegion("RegiaoConteudo");
    obj.label94:setText("Performance");
    obj.label94:setFontSize(15);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setVertTextAlign("center");
    obj.label94:setName("label94");

    obj.Performance = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Performance:setParent(obj.flowLayout19);
    obj.Performance:setMinWidth(300);
    obj.Performance:setMaxWidth(600);
    obj.Performance:setMinScaledWidth(280);
    obj.Performance:setName("Performance");


					rawset(self.Performance, "_recalcHeight", 					
						function ()
							self.Performance.height = self.rclPerformance.height +
														self.layBottomPerformance.height + 
														self.Performance.padding.top + self.Performance.padding.bottom + 7;
						end);
				


    obj.rclPerformance = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPerformance:setParent(obj.Performance);
    obj.rclPerformance:setName("rclPerformance");
    obj.rclPerformance:setAlign("top");
    obj.rclPerformance:setField("magias.magias.Performance");
    obj.rclPerformance:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclPerformance:setAutoHeight(true);
    obj.rclPerformance:setMinHeight(5);
    obj.rclPerformance:setHitTest(false);
    obj.rclPerformance:setMargins({left=10, right=10});

    obj.layBottomPerformance = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomPerformance:setParent(obj.Performance);
    obj.layBottomPerformance:setName("layBottomPerformance");
    obj.layBottomPerformance:setAlign("top");
    obj.layBottomPerformance:setHeight(36);

    obj.btnNovoPerformance = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoPerformance:setParent(obj.layBottomPerformance);
    obj.btnNovoPerformance:setName("btnNovoPerformance");
    obj.btnNovoPerformance:setAlign("left");
    obj.btnNovoPerformance:setText("Nova Magia");
    obj.btnNovoPerformance:setWidth(160);
    obj.btnNovoPerformance:setMargins({top=4, bottom=4, left=48});

self.Performance._recalcHeight();


    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowLayout2);
    obj.flowLayout20:setMinWidth(300);
    obj.flowLayout20:setMaxWidth(600);
    obj.flowLayout20:setHeight(100);
    obj.flowLayout20:setAvoidScale(true);
    obj.flowLayout20:setMaxControlsPerLine(1);
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setName("flowLayout20");
    obj.flowLayout20:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout20);
    obj.flowPart22:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setAvoidScale(true);
    obj.flowPart22:setMinScaledWidth(280);
    obj.flowPart22:setMinWidth(300);
    obj.flowPart22:setMaxWidth(600);
    obj.flowPart22:setHeight(80);

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowPart22);
    obj.label95:setFrameRegion("RegiaoSmallTitulo");
    obj.label95:setText("");
    obj.label95:setName("label95");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setVertTextAlign("center");
    obj.label95:setFontSize(18);

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.flowPart22);
    obj.label96:setFrameRegion("RegiaoConteudo");
    obj.label96:setText("Presence");
    obj.label96:setFontSize(15);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setVertTextAlign("center");
    obj.label96:setName("label96");

    obj.Presence = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Presence:setParent(obj.flowLayout20);
    obj.Presence:setMinWidth(300);
    obj.Presence:setMaxWidth(600);
    obj.Presence:setMinScaledWidth(280);
    obj.Presence:setName("Presence");


					rawset(self.Presence, "_recalcHeight", 					
						function ()
							self.Presence.height = self.rclPresence.height +
														self.layBottomPresence.height + 
														self.Presence.padding.top + self.Presence.padding.bottom + 7;
						end);
				


    obj.rclPresence = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPresence:setParent(obj.Presence);
    obj.rclPresence:setName("rclPresence");
    obj.rclPresence:setAlign("top");
    obj.rclPresence:setField("magias.magias.Presence");
    obj.rclPresence:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclPresence:setAutoHeight(true);
    obj.rclPresence:setMinHeight(5);
    obj.rclPresence:setHitTest(false);
    obj.rclPresence:setMargins({left=10, right=10});

    obj.layBottomPresence = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomPresence:setParent(obj.Presence);
    obj.layBottomPresence:setName("layBottomPresence");
    obj.layBottomPresence:setAlign("top");
    obj.layBottomPresence:setHeight(36);

    obj.btnNovoPresence = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoPresence:setParent(obj.layBottomPresence);
    obj.btnNovoPresence:setName("btnNovoPresence");
    obj.btnNovoPresence:setAlign("left");
    obj.btnNovoPresence:setText("Nova Magia");
    obj.btnNovoPresence:setWidth(160);
    obj.btnNovoPresence:setMargins({top=4, bottom=4, left=48});

self.Presence._recalcHeight();


    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.flowLayout2);
    obj.flowLayout21:setMinWidth(300);
    obj.flowLayout21:setMaxWidth(600);
    obj.flowLayout21:setHeight(100);
    obj.flowLayout21:setAvoidScale(true);
    obj.flowLayout21:setMaxControlsPerLine(1);
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setName("flowLayout21");
    obj.flowLayout21:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout21);
    obj.flowPart23:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setAvoidScale(true);
    obj.flowPart23:setMinScaledWidth(280);
    obj.flowPart23:setMinWidth(300);
    obj.flowPart23:setMaxWidth(600);
    obj.flowPart23:setHeight(80);

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.flowPart23);
    obj.label97:setFrameRegion("RegiaoSmallTitulo");
    obj.label97:setText("");
    obj.label97:setName("label97");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setVertTextAlign("center");
    obj.label97:setFontSize(18);

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.flowPart23);
    obj.label98:setFrameRegion("RegiaoConteudo");
    obj.label98:setText("Resistance");
    obj.label98:setFontSize(15);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setVertTextAlign("center");
    obj.label98:setName("label98");

    obj.Resistance = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Resistance:setParent(obj.flowLayout21);
    obj.Resistance:setMinWidth(300);
    obj.Resistance:setMaxWidth(600);
    obj.Resistance:setMinScaledWidth(280);
    obj.Resistance:setName("Resistance");


					rawset(self.Resistance, "_recalcHeight", 					
						function ()
							self.Resistance.height = self.rclResistance.height +
														self.layBottomResistance.height + 
														self.Resistance.padding.top + self.Resistance.padding.bottom + 7;
						end);
				


    obj.rclResistance = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclResistance:setParent(obj.Resistance);
    obj.rclResistance:setName("rclResistance");
    obj.rclResistance:setAlign("top");
    obj.rclResistance:setField("magias.magias.Resistance");
    obj.rclResistance:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclResistance:setAutoHeight(true);
    obj.rclResistance:setMinHeight(5);
    obj.rclResistance:setHitTest(false);
    obj.rclResistance:setMargins({left=10, right=10});

    obj.layBottomResistance = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomResistance:setParent(obj.Resistance);
    obj.layBottomResistance:setName("layBottomResistance");
    obj.layBottomResistance:setAlign("top");
    obj.layBottomResistance:setHeight(36);

    obj.btnNovoResistance = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoResistance:setParent(obj.layBottomResistance);
    obj.btnNovoResistance:setName("btnNovoResistance");
    obj.btnNovoResistance:setAlign("left");
    obj.btnNovoResistance:setText("Nova Magia");
    obj.btnNovoResistance:setWidth(160);
    obj.btnNovoResistance:setMargins({top=4, bottom=4, left=48});

self.Resistance._recalcHeight();


    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowLayout2);
    obj.flowLayout22:setMinWidth(300);
    obj.flowLayout22:setMaxWidth(600);
    obj.flowLayout22:setHeight(100);
    obj.flowLayout22:setAvoidScale(true);
    obj.flowLayout22:setMaxControlsPerLine(1);
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setName("flowLayout22");
    obj.flowLayout22:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout22);
    obj.flowPart24:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setAvoidScale(true);
    obj.flowPart24:setMinScaledWidth(280);
    obj.flowPart24:setMinWidth(300);
    obj.flowPart24:setMaxWidth(600);
    obj.flowPart24:setHeight(80);

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.flowPart24);
    obj.label99:setFrameRegion("RegiaoSmallTitulo");
    obj.label99:setText("");
    obj.label99:setName("label99");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setVertTextAlign("center");
    obj.label99:setFontSize(18);

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.flowPart24);
    obj.label100:setFrameRegion("RegiaoConteudo");
    obj.label100:setText("Ride");
    obj.label100:setFontSize(15);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setVertTextAlign("center");
    obj.label100:setName("label100");

    obj.Ride = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Ride:setParent(obj.flowLayout22);
    obj.Ride:setMinWidth(300);
    obj.Ride:setMaxWidth(600);
    obj.Ride:setMinScaledWidth(280);
    obj.Ride:setName("Ride");


					rawset(self.Ride, "_recalcHeight", 					
						function ()
							self.Ride.height = self.rclRide.height +
														self.layBottomRide.height + 
														self.Ride.padding.top + self.Ride.padding.bottom + 7;
						end);
				


    obj.rclRide = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclRide:setParent(obj.Ride);
    obj.rclRide:setName("rclRide");
    obj.rclRide:setAlign("top");
    obj.rclRide:setField("magias.magias.Ride");
    obj.rclRide:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclRide:setAutoHeight(true);
    obj.rclRide:setMinHeight(5);
    obj.rclRide:setHitTest(false);
    obj.rclRide:setMargins({left=10, right=10});

    obj.layBottomRide = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomRide:setParent(obj.Ride);
    obj.layBottomRide:setName("layBottomRide");
    obj.layBottomRide:setAlign("top");
    obj.layBottomRide:setHeight(36);

    obj.btnNovoRide = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoRide:setParent(obj.layBottomRide);
    obj.btnNovoRide:setName("btnNovoRide");
    obj.btnNovoRide:setAlign("left");
    obj.btnNovoRide:setText("Nova Magia");
    obj.btnNovoRide:setWidth(160);
    obj.btnNovoRide:setMargins({top=4, bottom=4, left=48});

self.Ride._recalcHeight();


    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.flowLayout2);
    obj.flowLayout23:setMinWidth(300);
    obj.flowLayout23:setMaxWidth(600);
    obj.flowLayout23:setHeight(100);
    obj.flowLayout23:setAvoidScale(true);
    obj.flowLayout23:setMaxControlsPerLine(1);
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setName("flowLayout23");
    obj.flowLayout23:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout23);
    obj.flowPart25:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setAvoidScale(true);
    obj.flowPart25:setMinScaledWidth(280);
    obj.flowPart25:setMinWidth(300);
    obj.flowPart25:setMaxWidth(600);
    obj.flowPart25:setHeight(80);

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.flowPart25);
    obj.label101:setFrameRegion("RegiaoSmallTitulo");
    obj.label101:setText("");
    obj.label101:setName("label101");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setVertTextAlign("center");
    obj.label101:setFontSize(18);

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.flowPart25);
    obj.label102:setFrameRegion("RegiaoConteudo");
    obj.label102:setText("Sail");
    obj.label102:setFontSize(15);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setVertTextAlign("center");
    obj.label102:setName("label102");

    obj.Sail = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Sail:setParent(obj.flowLayout23);
    obj.Sail:setMinWidth(300);
    obj.Sail:setMaxWidth(600);
    obj.Sail:setMinScaledWidth(280);
    obj.Sail:setName("Sail");


					rawset(self.Sail, "_recalcHeight", 					
						function ()
							self.Sail.height = self.rclSail.height +
														self.layBottomSail.height + 
														self.Sail.padding.top + self.Sail.padding.bottom + 7;
						end);
				


    obj.rclSail = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSail:setParent(obj.Sail);
    obj.rclSail:setName("rclSail");
    obj.rclSail:setAlign("top");
    obj.rclSail:setField("magias.magias.Sail");
    obj.rclSail:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclSail:setAutoHeight(true);
    obj.rclSail:setMinHeight(5);
    obj.rclSail:setHitTest(false);
    obj.rclSail:setMargins({left=10, right=10});

    obj.layBottomSail = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomSail:setParent(obj.Sail);
    obj.layBottomSail:setName("layBottomSail");
    obj.layBottomSail:setAlign("top");
    obj.layBottomSail:setHeight(36);

    obj.btnNovoSail = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoSail:setParent(obj.layBottomSail);
    obj.btnNovoSail:setName("btnNovoSail");
    obj.btnNovoSail:setAlign("left");
    obj.btnNovoSail:setText("Nova Magia");
    obj.btnNovoSail:setWidth(160);
    obj.btnNovoSail:setMargins({top=4, bottom=4, left=48});

self.Sail._recalcHeight();


    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowLayout2);
    obj.flowLayout24:setMinWidth(300);
    obj.flowLayout24:setMaxWidth(600);
    obj.flowLayout24:setHeight(100);
    obj.flowLayout24:setAvoidScale(true);
    obj.flowLayout24:setMaxControlsPerLine(1);
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setName("flowLayout24");
    obj.flowLayout24:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout24);
    obj.flowPart26:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setAvoidScale(true);
    obj.flowPart26:setMinScaledWidth(280);
    obj.flowPart26:setMinWidth(300);
    obj.flowPart26:setMaxWidth(600);
    obj.flowPart26:setHeight(80);

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.flowPart26);
    obj.label103:setFrameRegion("RegiaoSmallTitulo");
    obj.label103:setText("");
    obj.label103:setName("label103");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setVertTextAlign("center");
    obj.label103:setFontSize(18);

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.flowPart26);
    obj.label104:setFrameRegion("RegiaoConteudo");
    obj.label104:setText("Socialize");
    obj.label104:setFontSize(15);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setVertTextAlign("center");
    obj.label104:setName("label104");

    obj.Socialize = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Socialize:setParent(obj.flowLayout24);
    obj.Socialize:setMinWidth(300);
    obj.Socialize:setMaxWidth(600);
    obj.Socialize:setMinScaledWidth(280);
    obj.Socialize:setName("Socialize");


					rawset(self.Socialize, "_recalcHeight", 					
						function ()
							self.Socialize.height = self.rclSocialize.height +
														self.layBottomSocialize.height + 
														self.Socialize.padding.top + self.Socialize.padding.bottom + 7;
						end);
				


    obj.rclSocialize = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSocialize:setParent(obj.Socialize);
    obj.rclSocialize:setName("rclSocialize");
    obj.rclSocialize:setAlign("top");
    obj.rclSocialize:setField("magias.magias.Socialize");
    obj.rclSocialize:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclSocialize:setAutoHeight(true);
    obj.rclSocialize:setMinHeight(5);
    obj.rclSocialize:setHitTest(false);
    obj.rclSocialize:setMargins({left=10, right=10});

    obj.layBottomSocialize = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomSocialize:setParent(obj.Socialize);
    obj.layBottomSocialize:setName("layBottomSocialize");
    obj.layBottomSocialize:setAlign("top");
    obj.layBottomSocialize:setHeight(36);

    obj.btnNovoSocialize = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoSocialize:setParent(obj.layBottomSocialize);
    obj.btnNovoSocialize:setName("btnNovoSocialize");
    obj.btnNovoSocialize:setAlign("left");
    obj.btnNovoSocialize:setText("Nova Magia");
    obj.btnNovoSocialize:setWidth(160);
    obj.btnNovoSocialize:setMargins({top=4, bottom=4, left=48});

self.Socialize._recalcHeight();


    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.flowLayout2);
    obj.flowLayout25:setMinWidth(300);
    obj.flowLayout25:setMaxWidth(600);
    obj.flowLayout25:setHeight(100);
    obj.flowLayout25:setAvoidScale(true);
    obj.flowLayout25:setMaxControlsPerLine(1);
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setName("flowLayout25");
    obj.flowLayout25:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout25);
    obj.flowPart27:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setAvoidScale(true);
    obj.flowPart27:setMinScaledWidth(280);
    obj.flowPart27:setMinWidth(300);
    obj.flowPart27:setMaxWidth(600);
    obj.flowPart27:setHeight(80);

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.flowPart27);
    obj.label105:setFrameRegion("RegiaoSmallTitulo");
    obj.label105:setText("");
    obj.label105:setName("label105");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setVertTextAlign("center");
    obj.label105:setFontSize(18);

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.flowPart27);
    obj.label106:setFrameRegion("RegiaoConteudo");
    obj.label106:setText("Stealth");
    obj.label106:setFontSize(15);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setVertTextAlign("center");
    obj.label106:setName("label106");

    obj.Stealth = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Stealth:setParent(obj.flowLayout25);
    obj.Stealth:setMinWidth(300);
    obj.Stealth:setMaxWidth(600);
    obj.Stealth:setMinScaledWidth(280);
    obj.Stealth:setName("Stealth");


					rawset(self.Stealth, "_recalcHeight", 					
						function ()
							self.Stealth.height = self.rclStealth.height +
														self.layBottomStealth.height + 
														self.Stealth.padding.top + self.Stealth.padding.bottom + 7;
						end);
				


    obj.rclStealth = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclStealth:setParent(obj.Stealth);
    obj.rclStealth:setName("rclStealth");
    obj.rclStealth:setAlign("top");
    obj.rclStealth:setField("magias.magias.Stealth");
    obj.rclStealth:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclStealth:setAutoHeight(true);
    obj.rclStealth:setMinHeight(5);
    obj.rclStealth:setHitTest(false);
    obj.rclStealth:setMargins({left=10, right=10});

    obj.layBottomStealth = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomStealth:setParent(obj.Stealth);
    obj.layBottomStealth:setName("layBottomStealth");
    obj.layBottomStealth:setAlign("top");
    obj.layBottomStealth:setHeight(36);

    obj.btnNovoStealth = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoStealth:setParent(obj.layBottomStealth);
    obj.btnNovoStealth:setName("btnNovoStealth");
    obj.btnNovoStealth:setAlign("left");
    obj.btnNovoStealth:setText("Nova Magia");
    obj.btnNovoStealth:setWidth(160);
    obj.btnNovoStealth:setMargins({top=4, bottom=4, left=48});

self.Stealth._recalcHeight();


    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.flowLayout2);
    obj.flowLayout26:setMinWidth(300);
    obj.flowLayout26:setMaxWidth(600);
    obj.flowLayout26:setHeight(100);
    obj.flowLayout26:setAvoidScale(true);
    obj.flowLayout26:setMaxControlsPerLine(1);
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setName("flowLayout26");
    obj.flowLayout26:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout26);
    obj.flowPart28:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setAvoidScale(true);
    obj.flowPart28:setMinScaledWidth(280);
    obj.flowPart28:setMinWidth(300);
    obj.flowPart28:setMaxWidth(600);
    obj.flowPart28:setHeight(80);

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.flowPart28);
    obj.label107:setFrameRegion("RegiaoSmallTitulo");
    obj.label107:setText("");
    obj.label107:setName("label107");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setVertTextAlign("center");
    obj.label107:setFontSize(18);

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.flowPart28);
    obj.label108:setFrameRegion("RegiaoConteudo");
    obj.label108:setText("Survival");
    obj.label108:setFontSize(15);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setVertTextAlign("center");
    obj.label108:setName("label108");

    obj.Survival = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Survival:setParent(obj.flowLayout26);
    obj.Survival:setMinWidth(300);
    obj.Survival:setMaxWidth(600);
    obj.Survival:setMinScaledWidth(280);
    obj.Survival:setName("Survival");


					rawset(self.Survival, "_recalcHeight", 					
						function ()
							self.Survival.height = self.rclSurvival.height +
														self.layBottomSurvival.height + 
														self.Survival.padding.top + self.Survival.padding.bottom + 7;
						end);
				


    obj.rclSurvival = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSurvival:setParent(obj.Survival);
    obj.rclSurvival:setName("rclSurvival");
    obj.rclSurvival:setAlign("top");
    obj.rclSurvival:setField("magias.magias.Survival");
    obj.rclSurvival:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclSurvival:setAutoHeight(true);
    obj.rclSurvival:setMinHeight(5);
    obj.rclSurvival:setHitTest(false);
    obj.rclSurvival:setMargins({left=10, right=10});

    obj.layBottomSurvival = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomSurvival:setParent(obj.Survival);
    obj.layBottomSurvival:setName("layBottomSurvival");
    obj.layBottomSurvival:setAlign("top");
    obj.layBottomSurvival:setHeight(36);

    obj.btnNovoSurvival = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoSurvival:setParent(obj.layBottomSurvival);
    obj.btnNovoSurvival:setName("btnNovoSurvival");
    obj.btnNovoSurvival:setAlign("left");
    obj.btnNovoSurvival:setText("Nova Magia");
    obj.btnNovoSurvival:setWidth(160);
    obj.btnNovoSurvival:setMargins({top=4, bottom=4, left=48});

self.Survival._recalcHeight();


    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.flowLayout2);
    obj.flowLayout27:setMinWidth(300);
    obj.flowLayout27:setMaxWidth(600);
    obj.flowLayout27:setHeight(100);
    obj.flowLayout27:setAvoidScale(true);
    obj.flowLayout27:setMaxControlsPerLine(1);
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setName("flowLayout27");
    obj.flowLayout27:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout27);
    obj.flowPart29:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setAvoidScale(true);
    obj.flowPart29:setMinScaledWidth(280);
    obj.flowPart29:setMinWidth(300);
    obj.flowPart29:setMaxWidth(600);
    obj.flowPart29:setHeight(80);

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.flowPart29);
    obj.label109:setFrameRegion("RegiaoSmallTitulo");
    obj.label109:setText("");
    obj.label109:setName("label109");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setVertTextAlign("center");
    obj.label109:setFontSize(18);

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.flowPart29);
    obj.label110:setFrameRegion("RegiaoConteudo");
    obj.label110:setText("Thrown");
    obj.label110:setFontSize(15);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setVertTextAlign("center");
    obj.label110:setName("label110");

    obj.Thrown = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Thrown:setParent(obj.flowLayout27);
    obj.Thrown:setMinWidth(300);
    obj.Thrown:setMaxWidth(600);
    obj.Thrown:setMinScaledWidth(280);
    obj.Thrown:setName("Thrown");


					rawset(self.Thrown, "_recalcHeight", 					
						function ()
							self.Thrown.height = self.rclThrown.height +
														self.layBottomThrown.height + 
														self.Thrown.padding.top + self.Thrown.padding.bottom + 7;
						end);
				


    obj.rclThrown = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclThrown:setParent(obj.Thrown);
    obj.rclThrown:setName("rclThrown");
    obj.rclThrown:setAlign("top");
    obj.rclThrown:setField("magias.magias.Thrown");
    obj.rclThrown:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclThrown:setAutoHeight(true);
    obj.rclThrown:setMinHeight(5);
    obj.rclThrown:setHitTest(false);
    obj.rclThrown:setMargins({left=10, right=10});

    obj.layBottomThrown = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomThrown:setParent(obj.Thrown);
    obj.layBottomThrown:setName("layBottomThrown");
    obj.layBottomThrown:setAlign("top");
    obj.layBottomThrown:setHeight(36);

    obj.btnNovoThrown = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoThrown:setParent(obj.layBottomThrown);
    obj.btnNovoThrown:setName("btnNovoThrown");
    obj.btnNovoThrown:setAlign("left");
    obj.btnNovoThrown:setText("Nova Magia");
    obj.btnNovoThrown:setWidth(160);
    obj.btnNovoThrown:setMargins({top=4, bottom=4, left=48});

self.Thrown._recalcHeight();


    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.flowLayout2);
    obj.flowLayout28:setMinWidth(300);
    obj.flowLayout28:setMaxWidth(600);
    obj.flowLayout28:setHeight(100);
    obj.flowLayout28:setAvoidScale(true);
    obj.flowLayout28:setMaxControlsPerLine(1);
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setName("flowLayout28");
    obj.flowLayout28:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout28);
    obj.flowPart30:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setAvoidScale(true);
    obj.flowPart30:setMinScaledWidth(280);
    obj.flowPart30:setMinWidth(300);
    obj.flowPart30:setMaxWidth(600);
    obj.flowPart30:setHeight(80);

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.flowPart30);
    obj.label111:setFrameRegion("RegiaoSmallTitulo");
    obj.label111:setText("");
    obj.label111:setName("label111");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setVertTextAlign("center");
    obj.label111:setFontSize(18);

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.flowPart30);
    obj.label112:setFrameRegion("RegiaoConteudo");
    obj.label112:setText("War");
    obj.label112:setFontSize(15);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setVertTextAlign("center");
    obj.label112:setName("label112");

    obj.War = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.War:setParent(obj.flowLayout28);
    obj.War:setMinWidth(300);
    obj.War:setMaxWidth(600);
    obj.War:setMinScaledWidth(280);
    obj.War:setName("War");


					rawset(self.War, "_recalcHeight", 					
						function ()
							self.War.height = self.rclWar.height +
														self.layBottomWar.height + 
														self.War.padding.top + self.War.padding.bottom + 7;
						end);
				


    obj.rclWar = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclWar:setParent(obj.War);
    obj.rclWar:setName("rclWar");
    obj.rclWar:setAlign("top");
    obj.rclWar:setField("magias.magias.War");
    obj.rclWar:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclWar:setAutoHeight(true);
    obj.rclWar:setMinHeight(5);
    obj.rclWar:setHitTest(false);
    obj.rclWar:setMargins({left=10, right=10});

    obj.layBottomWar = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomWar:setParent(obj.War);
    obj.layBottomWar:setName("layBottomWar");
    obj.layBottomWar:setAlign("top");
    obj.layBottomWar:setHeight(36);

    obj.btnNovoWar = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoWar:setParent(obj.layBottomWar);
    obj.btnNovoWar:setName("btnNovoWar");
    obj.btnNovoWar:setAlign("left");
    obj.btnNovoWar:setText("Nova Magia");
    obj.btnNovoWar:setWidth(160);
    obj.btnNovoWar:setMargins({top=4, bottom=4, left=48});

self.War._recalcHeight();


    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.flowLayout2);
    obj.flowLayout29:setMinWidth(300);
    obj.flowLayout29:setMaxWidth(600);
    obj.flowLayout29:setHeight(100);
    obj.flowLayout29:setAvoidScale(true);
    obj.flowLayout29:setMaxControlsPerLine(1);
    obj.flowLayout29:setAutoHeight(true);
    obj.flowLayout29:setName("flowLayout29");
    obj.flowLayout29:setMargins({left=10, right=10, top=4, bottom=4});

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout29);
    obj.flowPart31:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setAvoidScale(true);
    obj.flowPart31:setMinScaledWidth(280);
    obj.flowPart31:setMinWidth(300);
    obj.flowPart31:setMaxWidth(600);
    obj.flowPart31:setHeight(80);

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.flowPart31);
    obj.label113:setFrameRegion("RegiaoSmallTitulo");
    obj.label113:setText("");
    obj.label113:setName("label113");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setVertTextAlign("center");
    obj.label113:setFontSize(18);

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.flowPart31);
    obj.label114:setFrameRegion("RegiaoConteudo");
    obj.label114:setText("Evocation");
    obj.label114:setFontSize(15);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setVertTextAlign("center");
    obj.label114:setName("label114");

    obj.Evocation = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.Evocation:setParent(obj.flowLayout29);
    obj.Evocation:setMinWidth(300);
    obj.Evocation:setMaxWidth(600);
    obj.Evocation:setMinScaledWidth(280);
    obj.Evocation:setName("Evocation");


					rawset(self.Evocation, "_recalcHeight", 					
						function ()
							self.Evocation.height = self.rclEvocation.height +
														self.layBottomEvocation.height + 
														self.Evocation.padding.top + self.Evocation.padding.bottom + 7;
						end);
				


    obj.rclEvocation = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEvocation:setParent(obj.Evocation);
    obj.rclEvocation:setName("rclEvocation");
    obj.rclEvocation:setAlign("top");
    obj.rclEvocation:setField("magias.magias.Evocation");
    obj.rclEvocation:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclEvocation:setAutoHeight(true);
    obj.rclEvocation:setMinHeight(5);
    obj.rclEvocation:setHitTest(false);
    obj.rclEvocation:setMargins({left=10, right=10});

    obj.layBottomEvocation = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomEvocation:setParent(obj.Evocation);
    obj.layBottomEvocation:setName("layBottomEvocation");
    obj.layBottomEvocation:setAlign("top");
    obj.layBottomEvocation:setHeight(36);

    obj.btnNovoEvocation = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoEvocation:setParent(obj.layBottomEvocation);
    obj.btnNovoEvocation:setName("btnNovoEvocation");
    obj.btnNovoEvocation:setAlign("left");
    obj.btnNovoEvocation:setText("Nova Magia");
    obj.btnNovoEvocation:setWidth(160);
    obj.btnNovoEvocation:setMargins({top=4, bottom=4, left=48});

self.Evocation._recalcHeight();


    obj.LunarShapes = GUI.fromHandle(_obj_newObject("tab"));
    obj.LunarShapes:setParent(obj.tabControl1);
    obj.LunarShapes:setTitle("Lunar Shapes");
    obj.LunarShapes:setName("LunarShapes");

    obj.frmLunarForm = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLunarForm:setParent(obj.LunarShapes);
    obj.frmLunarForm:setName("frmLunarForm");
    obj.frmLunarForm:setAlign("client");
    obj.frmLunarForm:setTheme("dark");
    obj.frmLunarForm:setMargins({top=1});


		local function findPopup(myPop)
			local pop = self:findControlByName(myPop);
			local node = self.boxLunar.node;
				
			if pop ~= nil and node ~= nil then
				pop:setNodeObject(node);
				pop:showPopupEx("center", self);
			elseif pop == nil then
				showMessage("Ops, bug.. nao encontrei o popup para exibir");
			end;				
		end;

		


    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.frmLunarForm);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(50);
    obj.layout65:setName("layout65");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout65);
    obj.button7:setText("+");
    obj.button7:setAlign("left");
    obj.button7:setWidth(40);
    obj.button7:setMargins({bottom=5,top=5});
    obj.button7:setName("button7");

    obj.rclLunar = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLunar:setParent(obj.layout65);
    obj.rclLunar:setName("rclLunar");
    obj.rclLunar:setField("campoLunar");
    obj.rclLunar:setTemplateForm("frmLunarSelect");
    obj.rclLunar:setAlign("client");
    obj.rclLunar:setSelectable(true);
    obj.rclLunar:setLayout("horizontal");
    obj.rclLunar:setMargins({left=0});
    obj.rclLunar:setMinQt(0);

    obj.boxLunar = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxLunar:setParent(obj.frmLunarForm);
    obj.boxLunar:setName("boxLunar");
    obj.boxLunar:setVisible(false);
    obj.boxLunar:setAlign("client");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.boxLunar);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.scrollBox6);
    obj.layout66:setHeight(610);
    obj.layout66:setName("layout66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.scrollBox6);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(200);
    obj.layout67:setMargins({bottom=5});
    obj.layout67:setName("layout67");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout67);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(200);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setMargins({right=5});
    obj.rectangle14:setName("rectangle14");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle14);
    obj.image2:setAlign("client");
    obj.image2:setField("avatarLunar");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout67);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(210);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setMargins({right=5});
    obj.rectangle15:setName("rectangle15");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle15);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(50);
    obj.layout68:setName("layout68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout68);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(5);
    obj.layout69:setName("layout69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout68);
    obj.layout70:setAlign("left");
    obj.layout70:setWidth(200);
    obj.layout70:setMargins({right=5});
    obj.layout70:setName("layout70");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout70);
    obj.label115:setText("Nome");
    obj.label115:setWidth(200);
    obj.label115:setHorzTextAlign("leading");
    obj.label115:setFontSize(13);
    obj.label115:setName("label115");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout70);
    obj.edit45:setTop(20);
    obj.edit45:setField("nome");
    obj.edit45:setWidth(200);
    obj.edit45:setHeight(25);
    obj.edit45:setName("edit45");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle15);
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(50);
    obj.layout71:setName("layout71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setAlign("left");
    obj.layout72:setWidth(5);
    obj.layout72:setName("layout72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout71);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(200);
    obj.layout73:setMargins({right=5});
    obj.layout73:setName("layout73");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout73);
    obj.label116:setText("Combat Movement");
    obj.label116:setWidth(200);
    obj.label116:setHorzTextAlign("leading");
    obj.label116:setFontSize(13);
    obj.label116:setName("label116");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout73);
    obj.edit46:setTop(20);
    obj.edit46:setField("movement");
    obj.edit46:setWidth(200);
    obj.edit46:setHeight(25);
    obj.edit46:setName("edit46");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle15);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(50);
    obj.layout74:setName("layout74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout74);
    obj.layout75:setAlign("left");
    obj.layout75:setWidth(5);
    obj.layout75:setName("layout75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout74);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(95);
    obj.layout76:setMargins({right=5});
    obj.layout76:setName("layout76");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout76);
    obj.label117:setText("Evasion");
    obj.label117:setWidth(95);
    obj.label117:setHorzTextAlign("leading");
    obj.label117:setFontSize(13);
    obj.label117:setName("label117");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout76);
    obj.edit47:setTop(20);
    obj.edit47:setField("evasion");
    obj.edit47:setWidth(95);
    obj.edit47:setHeight(25);
    obj.edit47:setName("edit47");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout74);
    obj.layout77:setAlign("left");
    obj.layout77:setWidth(95);
    obj.layout77:setMargins({right=5});
    obj.layout77:setName("layout77");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout77);
    obj.label118:setText("Parry");
    obj.label118:setWidth(95);
    obj.label118:setHorzTextAlign("leading");
    obj.label118:setFontSize(13);
    obj.label118:setName("label118");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout77);
    obj.edit48:setTop(20);
    obj.edit48:setField("parry");
    obj.edit48:setWidth(95);
    obj.edit48:setHeight(25);
    obj.edit48:setName("edit48");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle15);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(50);
    obj.layout78:setName("layout78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout78);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(5);
    obj.layout79:setName("layout79");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout78);
    obj.layout80:setAlign("left");
    obj.layout80:setWidth(95);
    obj.layout80:setMargins({right=5});
    obj.layout80:setName("layout80");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout80);
    obj.label119:setText("Soak");
    obj.label119:setWidth(95);
    obj.label119:setHorzTextAlign("leading");
    obj.label119:setFontSize(13);
    obj.label119:setName("label119");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout80);
    obj.edit49:setTop(20);
    obj.edit49:setField("soak");
    obj.edit49:setWidth(95);
    obj.edit49:setHeight(25);
    obj.edit49:setName("edit49");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout78);
    obj.layout81:setAlign("left");
    obj.layout81:setWidth(95);
    obj.layout81:setMargins({right=5});
    obj.layout81:setName("layout81");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout81);
    obj.label120:setText("Hardness");
    obj.label120:setWidth(95);
    obj.label120:setHorzTextAlign("leading");
    obj.label120:setFontSize(13);
    obj.label120:setName("label120");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout81);
    obj.edit50:setTop(20);
    obj.edit50:setField("hardness");
    obj.edit50:setWidth(95);
    obj.edit50:setHeight(25);
    obj.edit50:setName("edit50");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout67);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(410);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setMargins({right=5});
    obj.rectangle16:setName("rectangle16");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle16);
    obj.label121:setAlign("top");
    obj.label121:setHeight(25);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setText("Special Abilities");
    obj.label121:setName("label121");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle16);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("abilitiesForm");
    obj.textEditor4:setMargins({left=5,right=5,bottom=5});
    obj.textEditor4:setName("textEditor4");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox6);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(300);
    obj.layout82:setMargins({bottom=5});
    obj.layout82:setName("layout82");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout82);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(410);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setMargins({right=5});
    obj.rectangle17:setName("rectangle17");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle17);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(25);
    obj.layout83:setMargins({top=5});
    obj.layout83:setName("layout83");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout83);
    obj.button8:setAlign("left");
    obj.button8:setWidth(25);
    obj.button8:setText("+");
    obj.button8:setMargins({left=5,right=5});
    obj.button8:setName("button8");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout83);
    obj.label122:setAlign("client");
    obj.label122:setHeight(25);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setText("Actions");
    obj.label122:setName("label122");

    obj.rclActions = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclActions:setParent(obj.rectangle17);
    obj.rclActions:setAlign("client");
    obj.rclActions:setMargins({left=5,right=5,bottom=5,top=0});
    obj.rclActions:setName("rclActions");
    obj.rclActions:setField("listActions");
    obj.rclActions:setTemplateForm("frmActionForm");
    obj.rclActions:setLayout("vertical");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout82);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(410);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setMargins({right=5});
    obj.rectangle18:setName("rectangle18");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle18);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(25);
    obj.layout84:setMargins({top=5});
    obj.layout84:setName("layout84");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout84);
    obj.button9:setAlign("left");
    obj.button9:setWidth(25);
    obj.button9:setText("+");
    obj.button9:setMargins({left=5,right=5});
    obj.button9:setName("button9");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout84);
    obj.label123:setAlign("client");
    obj.label123:setHeight(25);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setText("Attacks");
    obj.label123:setName("label123");

    obj.rclAttacks = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAttacks:setParent(obj.rectangle18);
    obj.rclAttacks:setAlign("client");
    obj.rclAttacks:setMargins({left=5,right=5,bottom=5,top=0});
    obj.rclAttacks:setName("rclAttacks");
    obj.rclAttacks:setField("listAttacks");
    obj.rclAttacks:setTemplateForm("frmAttackForm");
    obj.rclAttacks:setLayout("vertical");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Descrição");
    obj.tab6:setName("tab6");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab6);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmTemplateDescription);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.scrollBox7);
    obj.rectangle19:setLeft(0);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(1205);
    obj.rectangle19:setHeight(105);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setName("rectangle19");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle19);
    obj.label124:setLeft(3);
    obj.label124:setTop(1);
    obj.label124:setWidth(100);
    obj.label124:setHeight(20);
    obj.label124:setText("DESCRIÇÃO");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle19);
    obj.label125:setLeft(10);
    obj.label125:setTop(25);
    obj.label125:setWidth(90);
    obj.label125:setHeight(20);
    obj.label125:setText("TAMANHO");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.rectangle19);
    obj.edit51:setLeft(100);
    obj.edit51:setTop(25);
    obj.edit51:setWidth(200);
    obj.edit51:setHeight(25);
    obj.edit51:setField("tamanho");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setName("edit51");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle19);
    obj.label126:setLeft(10);
    obj.label126:setTop(50);
    obj.label126:setWidth(90);
    obj.label126:setHeight(20);
    obj.label126:setText("ALTURA");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.rectangle19);
    obj.edit52:setLeft(100);
    obj.edit52:setTop(50);
    obj.edit52:setWidth(200);
    obj.edit52:setHeight(25);
    obj.edit52:setField("altura");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setName("edit52");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle19);
    obj.label127:setLeft(10);
    obj.label127:setTop(75);
    obj.label127:setWidth(90);
    obj.label127:setHeight(20);
    obj.label127:setText("PESO");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.rectangle19);
    obj.edit53:setLeft(100);
    obj.edit53:setTop(75);
    obj.edit53:setWidth(200);
    obj.edit53:setHeight(25);
    obj.edit53:setField("peso");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setName("edit53");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.rectangle19);
    obj.label128:setLeft(310);
    obj.label128:setTop(25);
    obj.label128:setWidth(90);
    obj.label128:setHeight(20);
    obj.label128:setText("IDADE");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.rectangle19);
    obj.edit54:setLeft(400);
    obj.edit54:setTop(25);
    obj.edit54:setWidth(200);
    obj.edit54:setHeight(25);
    obj.edit54:setField("idade");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setName("edit54");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle19);
    obj.label129:setLeft(310);
    obj.label129:setTop(50);
    obj.label129:setWidth(90);
    obj.label129:setHeight(20);
    obj.label129:setText("SEXO");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.rectangle19);
    obj.edit55:setLeft(400);
    obj.edit55:setTop(50);
    obj.edit55:setWidth(200);
    obj.edit55:setHeight(25);
    obj.edit55:setField("sexo");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setName("edit55");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.rectangle19);
    obj.label130:setLeft(310);
    obj.label130:setTop(75);
    obj.label130:setWidth(90);
    obj.label130:setHeight(20);
    obj.label130:setText("OUTROS");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.rectangle19);
    obj.edit56:setLeft(400);
    obj.edit56:setTop(75);
    obj.edit56:setWidth(200);
    obj.edit56:setHeight(25);
    obj.edit56:setField("aparenciaOutros");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setName("edit56");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.rectangle19);
    obj.label131:setLeft(610);
    obj.label131:setTop(25);
    obj.label131:setWidth(90);
    obj.label131:setHeight(20);
    obj.label131:setText("OLHOS");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.rectangle19);
    obj.edit57:setLeft(700);
    obj.edit57:setTop(25);
    obj.edit57:setWidth(200);
    obj.edit57:setHeight(25);
    obj.edit57:setField("aparenciaOlhos");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setName("edit57");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.rectangle19);
    obj.label132:setLeft(610);
    obj.label132:setTop(50);
    obj.label132:setWidth(90);
    obj.label132:setHeight(20);
    obj.label132:setText("PELE");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.rectangle19);
    obj.edit58:setLeft(700);
    obj.edit58:setTop(50);
    obj.edit58:setWidth(200);
    obj.edit58:setHeight(25);
    obj.edit58:setField("pele");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setName("edit58");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle19);
    obj.label133:setLeft(610);
    obj.label133:setTop(75);
    obj.label133:setWidth(90);
    obj.label133:setHeight(20);
    obj.label133:setText("CABELO");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.rectangle19);
    obj.edit59:setLeft(700);
    obj.edit59:setTop(75);
    obj.edit59:setWidth(200);
    obj.edit59:setHeight(25);
    obj.edit59:setField("cabelo");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setName("edit59");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.rectangle19);
    obj.label134:setLeft(910);
    obj.label134:setTop(25);
    obj.label134:setWidth(90);
    obj.label134:setHeight(20);
    obj.label134:setText("PLANO");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.rectangle19);
    obj.edit60:setLeft(1000);
    obj.edit60:setTop(25);
    obj.edit60:setWidth(200);
    obj.edit60:setHeight(25);
    obj.edit60:setField("plano");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setName("edit60");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle19);
    obj.label135:setLeft(910);
    obj.label135:setTop(50);
    obj.label135:setWidth(90);
    obj.label135:setHeight(20);
    obj.label135:setText("REGIÃO");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.rectangle19);
    obj.edit61:setLeft(1000);
    obj.edit61:setTop(50);
    obj.edit61:setWidth(200);
    obj.edit61:setHeight(25);
    obj.edit61:setField("regiao");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setName("edit61");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.rectangle19);
    obj.label136:setLeft(910);
    obj.label136:setTop(75);
    obj.label136:setWidth(90);
    obj.label136:setHeight(20);
    obj.label136:setText("REINO");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.rectangle19);
    obj.edit62:setLeft(1000);
    obj.edit62:setTop(75);
    obj.edit62:setWidth(200);
    obj.edit62:setHeight(25);
    obj.edit62:setField("reino");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setName("edit62");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.scrollBox7);
    obj.layout85:setLeft(0);
    obj.layout85:setTop(110);
    obj.layout85:setWidth(375);
    obj.layout85:setHeight(240);
    obj.layout85:setName("layout85");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout85);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setName("rectangle20");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout85);
    obj.label137:setLeft(5);
    obj.label137:setTop(1);
    obj.label137:setWidth(100);
    obj.label137:setHeight(20);
    obj.label137:setText("APARÊNCIA");
    obj.label137:setName("label137");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout85);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(365);
    obj.textEditor5:setHeight(210);
    obj.textEditor5:setField("aparencia");
    obj.textEditor5:setName("textEditor5");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.scrollBox7);
    obj.layout86:setLeft(0);
    obj.layout86:setTop(355);
    obj.layout86:setWidth(375);
    obj.layout86:setHeight(250);
    obj.layout86:setName("layout86");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout86);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("black");
    obj.rectangle21:setName("rectangle21");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout86);
    obj.label138:setLeft(5);
    obj.label138:setTop(1);
    obj.label138:setWidth(100);
    obj.label138:setHeight(20);
    obj.label138:setText("PERSONALIDADE");
    obj.label138:setName("label138");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout86);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(365);
    obj.textEditor6:setHeight(220);
    obj.textEditor6:setField("personalidade");
    obj.textEditor6:setName("textEditor6");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.scrollBox7);
    obj.layout87:setLeft(380);
    obj.layout87:setTop(110);
    obj.layout87:setWidth(825);
    obj.layout87:setHeight(495);
    obj.layout87:setName("layout87");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout87);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setName("rectangle22");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout87);
    obj.label139:setLeft(5);
    obj.label139:setTop(1);
    obj.label139:setWidth(100);
    obj.label139:setHeight(20);
    obj.label139:setText("HISTORIA");
    obj.label139:setName("label139");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout87);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Anotações");
    obj.tab7:setName("tab7");

    obj.frmNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmNotes:setParent(obj.tab7);
    obj.frmNotes:setName("frmNotes");
    obj.frmNotes:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmNotes);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox8);
    obj.layout88:setAlign("left");
    obj.layout88:setWidth(400);
    obj.layout88:setMargins({right=5});
    obj.layout88:setName("layout88");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout88);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setXradius(5);
    obj.rectangle23:setYradius(15);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setName("rectangle23");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.rectangle23);
    obj.label140:setAlign("top");
    obj.label140:setHeight(20);
    obj.label140:setText("Anotações");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle23);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("anotacoes1");
    obj.textEditor7:setMargins({left=5,right=5,bottom=5});
    obj.textEditor7:setName("textEditor7");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.scrollBox8);
    obj.layout89:setAlign("left");
    obj.layout89:setWidth(400);
    obj.layout89:setMargins({right=5});
    obj.layout89:setName("layout89");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout89);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setXradius(5);
    obj.rectangle24:setYradius(15);
    obj.rectangle24:setCornerType("round");
    obj.rectangle24:setName("rectangle24");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.rectangle24);
    obj.label141:setAlign("top");
    obj.label141:setHeight(20);
    obj.label141:setText("Anotações");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle24);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("anotacoes2");
    obj.textEditor8:setMargins({left=5,right=5,bottom=5});
    obj.textEditor8:setName("textEditor8");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.scrollBox8);
    obj.layout90:setAlign("left");
    obj.layout90:setWidth(400);
    obj.layout90:setMargins({right=5});
    obj.layout90:setName("layout90");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout90);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(15);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setName("rectangle25");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.rectangle25);
    obj.label142:setAlign("top");
    obj.label142:setHeight(20);
    obj.label142:setText("Anotações");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle25);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("anotacoes3");
    obj.textEditor9:setMargins({left=5,right=5,bottom=5});
    obj.textEditor9:setName("textEditor9");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Creditos");
    obj.tab8:setName("tab8");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab8);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");


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

		


    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmTemplateCreditos);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox9);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(500);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("logo_mesa");
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox9);
    obj.image4:setLeft(550);
    obj.image4:setTop(0);
    obj.image4:setWidth(250);
    obj.image4:setHeight(250);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/Ficha Exalted 3rd/images/RPGmeister.jpg");
    obj.image4:setName("image4");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.scrollBox9);
    obj.layout91:setLeft(850);
    obj.layout91:setTop(0);
    obj.layout91:setWidth(200);
    obj.layout91:setHeight(160);
    obj.layout91:setName("layout91");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout91);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(15);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setName("rectangle26");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout91);
    obj.label143:setLeft(0);
    obj.label143:setTop(10);
    obj.label143:setWidth(200);
    obj.label143:setHeight(20);
    obj.label143:setText("Plugin feito por: ");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout91);
    obj.label144:setLeft(0);
    obj.label144:setTop(35);
    obj.label144:setWidth(200);
    obj.label144:setHeight(20);
    obj.label144:setText("Vinny (Ambesek)");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.scrollBox9);
    obj.layout92:setLeft(850);
    obj.layout92:setTop(170);
    obj.layout92:setWidth(200);
    obj.layout92:setHeight(150);
    obj.layout92:setName("layout92");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout92);
    obj.rectangle27:setLeft(0);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(200);
    obj.rectangle27:setHeight(150);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout92);
    obj.label145:setLeft(0);
    obj.label145:setTop(10);
    obj.label145:setWidth(80);
    obj.label145:setHeight(20);
    obj.label145:setText("Tema:");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout92);
    obj.comboBox5:setLeft(95);
    obj.comboBox5:setTop(10);
    obj.comboBox5:setWidth(90);
    obj.comboBox5:setField("theme");
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setItems({'Escuro', 'Claro'});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout92);
    obj.dataLink14:setField("theme");
    obj.dataLink14:setDefaultValue("Escuro");
    obj.dataLink14:setName("dataLink14");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout92);
    obj.label146:setLeft(0);
    obj.label146:setTop(35);
    obj.label146:setWidth(90);
    obj.label146:setHeight(20);
    obj.label146:setText("Cores: ");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout92);
    obj.label147:setLeft(0);
    obj.label147:setTop(60);
    obj.label147:setWidth(90);
    obj.label147:setHeight(20);
    obj.label147:setText("Fundo ");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout92);
    obj.comboBox6:setLeft(95);
    obj.comboBox6:setTop(60);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setField("colorBackground");
    obj.comboBox6:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox6:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout92);
    obj.dataLink15:setField("colorBackground");
    obj.dataLink15:setDefaultValue("#000000");
    obj.dataLink15:setName("dataLink15");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout92);
    obj.label148:setLeft(0);
    obj.label148:setTop(85);
    obj.label148:setWidth(90);
    obj.label148:setHeight(20);
    obj.label148:setText("Linhas ");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout92);
    obj.comboBox7:setLeft(95);
    obj.comboBox7:setTop(85);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setField("colorStroke");
    obj.comboBox7:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox7:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout92);
    obj.dataLink16:setField("colorStroke");
    obj.dataLink16:setDefaultValue("#FFFFFF");
    obj.dataLink16:setName("dataLink16");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout92);
    obj.label149:setLeft(0);
    obj.label149:setTop(110);
    obj.label149:setWidth(90);
    obj.label149:setHeight(20);
    obj.label149:setText("Fonte ");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setName("label149");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout92);
    obj.comboBox8:setLeft(95);
    obj.comboBox8:setTop(110);
    obj.comboBox8:setWidth(90);
    obj.comboBox8:setField("colorFont");
    obj.comboBox8:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox8:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout92);
    obj.dataLink17:setField("colorFont");
    obj.dataLink17:setDefaultValue("#FFFFFF");
    obj.dataLink17:setName("dataLink17");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox9);
    obj.button10:setLeft(850);
    obj.button10:setTop(330);
    obj.button10:setWidth(100);
    obj.button10:setHeight(20);
    obj.button10:setText("Exportar Ficha");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox9);
    obj.button11:setLeft(850);
    obj.button11:setTop(355);
    obj.button11:setWidth(100);
    obj.button11:setHeight(20);
    obj.button11:setText("Importar Ficha");
    obj.button11:setName("button11");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.scrollBox9);
    obj.label150:setLeft(555);
    obj.label150:setTop(275);
    obj.label150:setWidth(200);
    obj.label150:setHeight(20);
    obj.label150:setText("Versão Atual: ");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setField("versionInstalled");
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.scrollBox9);
    obj.label151:setLeft(555);
    obj.label151:setTop(300);
    obj.label151:setWidth(200);
    obj.label151:setHeight(20);
    obj.label151:setText("Sua Versão: ");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setField("versionDownloaded");
    obj.label151:setName("label151");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.scrollBox9);
    obj.checkBox21:setLeft(555);
    obj.checkBox21:setTop(325);
    obj.checkBox21:setWidth(200);
    obj.checkBox21:setHeight(20);
    obj.checkBox21:setField("noUpdate");
    obj.checkBox21:setText("Não pedir para atualizar.");
    obj.checkBox21:setName("checkBox21");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox9);
    obj.button12:setLeft(555);
    obj.button12:setTop(350);
    obj.button12:setWidth(100);
    obj.button12:setText("Change Log");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox9);
    obj.button13:setLeft(667);
    obj.button13:setTop(350);
    obj.button13:setWidth(100);
    obj.button13:setText("Atualizar");
    obj.button13:setName("button13");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.scrollBox9);
    obj.label152:setLeft(555);
    obj.label152:setTop(400);
    obj.label152:setWidth(200);
    obj.label152:setHeight(20);
    obj.label152:setText("Conheça as Mesas:");
    obj.label152:setName("label152");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox9);
    obj.button14:setLeft(555);
    obj.button14:setTop(425);
    obj.button14:setWidth(100);
    obj.button14:setText("RPGmeister");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox9);
    obj.button15:setLeft(667);
    obj.button15:setTop(425);
    obj.button15:setWidth(125);
    obj.button15:setText("Nome Mesa");
    obj.button15:setName("button15");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Exalted%203rd/output/Ficha%20Exalted%203rd.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Exalted%203rd/output/Ficha%20Exalted%203rd.rpk?raw=true');
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

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					self.SolarCaste.visible = false;
            					self.LunarCaste.visible = false;
            					self.DragonAspect.visible = false;
            					self.LunarShapes.visible = false;
            
            					self.Spirit.visible = false;
            					self.Tell.visible = false;
            
            					local exaltation = tonumber(sheet.exaltation) or 0;
            
            					if exaltation == 1 then
            						self.SolarCaste.visible = true;
            						self.Supernatural.text = "Supernatural Ability";
            					elseif exaltation == 2 then
            						self.LunarCaste.visible = true;
            						self.Supernatural.text = "Supernatural Ability";
            						self.Spirit.visible = true;
            						self.Tell.visible = true;
            						self.LunarShapes.visible = true;
            					elseif exaltation == 3 then
            						self.DragonAspect.visible = true;
            						self.Supernatural.text = "Origin";
            					end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclMerits:append();
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclCommited:append();
        end, obj);

    obj._e_event4 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            						local essence = 0;
            						if sheet.essence_1 then essence = essence +1 end;
            						if sheet.essence_2 then essence = essence +1 end;
            						if sheet.essence_3 then essence = essence +1 end;
            						if sheet.essence_4 then essence = essence +1 end;
            						if sheet.essence_5 then essence = essence +1 end;
            
            						local exaltation = tonumber(sheet.exaltation) or 0;
            
            						if exaltation == 1 then
            							sheet.personalMax = (essence*3) + 10;
            							sheet.peripheralMax = (essence*7) + 26;
            						elseif exaltation == 2 then
            							sheet.personalMax = essence + 15;
            							sheet.peripheralMax = (essence*4) + 34;
            						elseif exaltation == 3 then
            							sheet.personalMax = essence + 11;
            							sheet.peripheralMax = (essence*4) + 23;
            						end;
        end, obj);

    obj._e_event5 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						sheet.personalMin = (tonumber(sheet.personalMax) or 0) - (tonumber(sheet.personalSpent) or 0);
        end, obj);

    obj._e_event6 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						sheet.peripheralMin = (tonumber(sheet.peripheralMax) or 0) - (tonumber(sheet.peripheralSpent) or 0);
        end, obj);

    obj._e_event7 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event8 = obj.rclAbilities:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.ability, nodeB.ability);
        end, obj);

    obj._e_event9 = obj.rclAbilities:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            				local nodes = NDB.getChildNodes(sheet.listAbilities);               
            				if #nodes == 0 then
            					Abilities();
            				end;
        end, obj);

    obj._e_event10 = obj.rclAbilities:addEventListener("onBeginEnumeration",
        function (_)
            if sheet==nil then return end;
            				local nodes = NDB.getChildNodes(sheet.listAbilities);               
            				if #nodes == 0 then
            					Abilities();
            				end;
        end, obj);

    obj._e_event11 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclAbilities:append();
        end, obj);

    obj._e_event12 = obj.rclCombat:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.ability, nodeB.ability);
        end, obj);

    obj._e_event13 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclCombat:append();
        end, obj);

    obj._e_event14 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclHealth:append();
        end, obj);

    obj._e_event15 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclIntimacies:append();
        end, obj);

    obj._e_event16 = obj.rclIntimacies:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            		        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event17 = obj.rclArchery:addEventListener("onResize",
        function (_)
            self.Archery._recalcHeight();
        end, obj);

    obj._e_event18 = obj.btnNovoArchery:addEventListener("onClick",
        function (_)
            self.rclArchery:append();
        end, obj);

    obj._e_event19 = obj.rclAthletics:addEventListener("onResize",
        function (_)
            self.Athletics._recalcHeight();
        end, obj);

    obj._e_event20 = obj.btnNovoAthletics:addEventListener("onClick",
        function (_)
            self.rclAthletics:append();
        end, obj);

    obj._e_event21 = obj.rclAwareness:addEventListener("onResize",
        function (_)
            self.Awareness._recalcHeight();
        end, obj);

    obj._e_event22 = obj.btnNovoAwareness:addEventListener("onClick",
        function (_)
            self.rclAwareness:append();
        end, obj);

    obj._e_event23 = obj.rclBrawl:addEventListener("onResize",
        function (_)
            self.Brawl._recalcHeight();
        end, obj);

    obj._e_event24 = obj.btnNovoBrawl:addEventListener("onClick",
        function (_)
            self.rclBrawl:append();
        end, obj);

    obj._e_event25 = obj.rclBureaucracy:addEventListener("onResize",
        function (_)
            self.Bureaucracy._recalcHeight();
        end, obj);

    obj._e_event26 = obj.btnNovoBureaucracy:addEventListener("onClick",
        function (_)
            self.rclBureaucracy:append();
        end, obj);

    obj._e_event27 = obj.rclCraft:addEventListener("onResize",
        function (_)
            self.Craft._recalcHeight();
        end, obj);

    obj._e_event28 = obj.btnNovoCraft:addEventListener("onClick",
        function (_)
            self.rclCraft:append();
        end, obj);

    obj._e_event29 = obj.rclDodge:addEventListener("onResize",
        function (_)
            self.Dodge._recalcHeight();
        end, obj);

    obj._e_event30 = obj.btnNovoDodge:addEventListener("onClick",
        function (_)
            self.rclDodge:append();
        end, obj);

    obj._e_event31 = obj.rclIntegrity:addEventListener("onResize",
        function (_)
            self.Integrity._recalcHeight();
        end, obj);

    obj._e_event32 = obj.btnNovoIntegrity:addEventListener("onClick",
        function (_)
            self.rclIntegrity:append();
        end, obj);

    obj._e_event33 = obj.rclInvestigation:addEventListener("onResize",
        function (_)
            self.Investigation._recalcHeight();
        end, obj);

    obj._e_event34 = obj.btnNovoInvestigation:addEventListener("onClick",
        function (_)
            self.rclInvestigation:append();
        end, obj);

    obj._e_event35 = obj.rclLarceny:addEventListener("onResize",
        function (_)
            self.Larceny._recalcHeight();
        end, obj);

    obj._e_event36 = obj.btnNovoLarceny:addEventListener("onClick",
        function (_)
            self.rclLarceny:append();
        end, obj);

    obj._e_event37 = obj.rclLinguistics:addEventListener("onResize",
        function (_)
            self.Linguistics._recalcHeight();
        end, obj);

    obj._e_event38 = obj.btnNovoLinguistics:addEventListener("onClick",
        function (_)
            self.rclLinguistics:append();
        end, obj);

    obj._e_event39 = obj.rclLore:addEventListener("onResize",
        function (_)
            self.Lore._recalcHeight();
        end, obj);

    obj._e_event40 = obj.btnNovoLore:addEventListener("onClick",
        function (_)
            self.rclLore:append();
        end, obj);

    obj._e_event41 = obj.rclMartial:addEventListener("onResize",
        function (_)
            self.Martial._recalcHeight();
        end, obj);

    obj._e_event42 = obj.btnNovoMartial:addEventListener("onClick",
        function (_)
            self.rclMartial:append();
        end, obj);

    obj._e_event43 = obj.rclMedicine:addEventListener("onResize",
        function (_)
            self.Medicine._recalcHeight();
        end, obj);

    obj._e_event44 = obj.btnNovoMedicine:addEventListener("onClick",
        function (_)
            self.rclMedicine:append();
        end, obj);

    obj._e_event45 = obj.rclMelee:addEventListener("onResize",
        function (_)
            self.Melee._recalcHeight();
        end, obj);

    obj._e_event46 = obj.btnNovoMelee:addEventListener("onClick",
        function (_)
            self.rclMelee:append();
        end, obj);

    obj._e_event47 = obj.rclOccult:addEventListener("onResize",
        function (_)
            self.Occult._recalcHeight();
        end, obj);

    obj._e_event48 = obj.btnNovoOccult:addEventListener("onClick",
        function (_)
            self.rclOccult:append();
        end, obj);

    obj._e_event49 = obj.rclPerformance:addEventListener("onResize",
        function (_)
            self.Performance._recalcHeight();
        end, obj);

    obj._e_event50 = obj.btnNovoPerformance:addEventListener("onClick",
        function (_)
            self.rclPerformance:append();
        end, obj);

    obj._e_event51 = obj.rclPresence:addEventListener("onResize",
        function (_)
            self.Presence._recalcHeight();
        end, obj);

    obj._e_event52 = obj.btnNovoPresence:addEventListener("onClick",
        function (_)
            self.rclPresence:append();
        end, obj);

    obj._e_event53 = obj.rclResistance:addEventListener("onResize",
        function (_)
            self.Resistance._recalcHeight();
        end, obj);

    obj._e_event54 = obj.btnNovoResistance:addEventListener("onClick",
        function (_)
            self.rclResistance:append();
        end, obj);

    obj._e_event55 = obj.rclRide:addEventListener("onResize",
        function (_)
            self.Ride._recalcHeight();
        end, obj);

    obj._e_event56 = obj.btnNovoRide:addEventListener("onClick",
        function (_)
            self.rclRide:append();
        end, obj);

    obj._e_event57 = obj.rclSail:addEventListener("onResize",
        function (_)
            self.Sail._recalcHeight();
        end, obj);

    obj._e_event58 = obj.btnNovoSail:addEventListener("onClick",
        function (_)
            self.rclSail:append();
        end, obj);

    obj._e_event59 = obj.rclSocialize:addEventListener("onResize",
        function (_)
            self.Socialize._recalcHeight();
        end, obj);

    obj._e_event60 = obj.btnNovoSocialize:addEventListener("onClick",
        function (_)
            self.rclSocialize:append();
        end, obj);

    obj._e_event61 = obj.rclStealth:addEventListener("onResize",
        function (_)
            self.Stealth._recalcHeight();
        end, obj);

    obj._e_event62 = obj.btnNovoStealth:addEventListener("onClick",
        function (_)
            self.rclStealth:append();
        end, obj);

    obj._e_event63 = obj.rclSurvival:addEventListener("onResize",
        function (_)
            self.Survival._recalcHeight();
        end, obj);

    obj._e_event64 = obj.btnNovoSurvival:addEventListener("onClick",
        function (_)
            self.rclSurvival:append();
        end, obj);

    obj._e_event65 = obj.rclThrown:addEventListener("onResize",
        function (_)
            self.Thrown._recalcHeight();
        end, obj);

    obj._e_event66 = obj.btnNovoThrown:addEventListener("onClick",
        function (_)
            self.rclThrown:append();
        end, obj);

    obj._e_event67 = obj.rclWar:addEventListener("onResize",
        function (_)
            self.War._recalcHeight();
        end, obj);

    obj._e_event68 = obj.btnNovoWar:addEventListener("onClick",
        function (_)
            self.rclWar:append();
        end, obj);

    obj._e_event69 = obj.rclEvocation:addEventListener("onResize",
        function (_)
            self.Evocation._recalcHeight();
        end, obj);

    obj._e_event70 = obj.btnNovoEvocation:addEventListener("onClick",
        function (_)
            self.rclEvocation:append();
        end, obj);

    obj._e_event71 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclLunar:append();
        end, obj);

    obj._e_event72 = obj.rclLunar:addEventListener("onSelect",
        function (_)
            local node = self.rclLunar.selectedNode;
            				self.boxLunar.node = node;
            				self.boxLunar.visible = (node ~= nil);
        end, obj);

    obj._e_event73 = obj.rclLunar:addEventListener("onEndEnumeration",
        function (_)
            if self.rclLunar.selectedNode == nil and sheet ~= nil then
            					local nodes = NDB.getChildNodes(sheet.campoLunar);               
            					if #nodes > 0 then
            						self.rclLunar.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    obj._e_event74 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", self.rclVeiculos.selectedNode.avatarComp);
        end, obj);

    obj._e_event75 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclActions:append();
        end, obj);

    obj._e_event76 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclAttacks:append();
        end, obj);

    obj._e_event77 = obj.comboBox5:addEventListener("onChange",
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

    obj._e_event78 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event79 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event80 = obj.dataLink17:addEventListener("onChange",
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

    obj._e_event81 = obj.button10:addEventListener("onClick",
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

    obj._e_event82 = obj.button11:addEventListener("onClick",
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

    obj._e_event83 = obj.button12:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('link_change_log')
        end, obj);

    obj._e_event84 = obj.button13:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Exalted%203rd/output/Ficha%20Exalted%203rd.rpk?raw=true')
        end, obj);

    obj._e_event85 = obj.button14:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event86 = obj.button15:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('link_mesa');
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.frmNotes ~= nil then self.frmNotes:destroy(); self.frmNotes = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rclResistance ~= nil then self.rclResistance:destroy(); self.rclResistance = nil; end;
        if self.rclCombat ~= nil then self.rclCombat:destroy(); self.rclCombat = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rclAthletics ~= nil then self.rclAthletics:destroy(); self.rclAthletics = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layBottomResistance ~= nil then self.layBottomResistance:destroy(); self.layBottomResistance = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.imageCheckBox58 ~= nil then self.imageCheckBox58:destroy(); self.imageCheckBox58 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.btnNovoInvestigation ~= nil then self.btnNovoInvestigation:destroy(); self.btnNovoInvestigation = nil; end;
        if self.btnNovoSurvival ~= nil then self.btnNovoSurvival:destroy(); self.btnNovoSurvival = nil; end;
        if self.rclLunar ~= nil then self.rclLunar:destroy(); self.rclLunar = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.frmCombat ~= nil then self.frmCombat:destroy(); self.frmCombat = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layBottomRide ~= nil then self.layBottomRide:destroy(); self.layBottomRide = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rclAwareness ~= nil then self.rclAwareness:destroy(); self.rclAwareness = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.rclSail ~= nil then self.rclSail:destroy(); self.rclSail = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.btnNovoSocialize ~= nil then self.btnNovoSocialize:destroy(); self.btnNovoSocialize = nil; end;
        if self.rclStealth ~= nil then self.rclStealth:destroy(); self.rclStealth = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.Socialize ~= nil then self.Socialize:destroy(); self.Socialize = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.rclArchery ~= nil then self.rclArchery:destroy(); self.rclArchery = nil; end;
        if self.Bureaucracy ~= nil then self.Bureaucracy:destroy(); self.Bureaucracy = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layBottomDodge ~= nil then self.layBottomDodge:destroy(); self.layBottomDodge = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.btnNovoStealth ~= nil then self.btnNovoStealth:destroy(); self.btnNovoStealth = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.layBottomLore ~= nil then self.layBottomLore:destroy(); self.layBottomLore = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.Survival ~= nil then self.Survival:destroy(); self.Survival = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.Brawl ~= nil then self.Brawl:destroy(); self.Brawl = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.Sail ~= nil then self.Sail:destroy(); self.Sail = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.Concept ~= nil then self.Concept:destroy(); self.Concept = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.btnNovoIntegrity ~= nil then self.btnNovoIntegrity:destroy(); self.btnNovoIntegrity = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.LunarShapes ~= nil then self.LunarShapes:destroy(); self.LunarShapes = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.btnNovoLarceny ~= nil then self.btnNovoLarceny:destroy(); self.btnNovoLarceny = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.layBottomLinguistics ~= nil then self.layBottomLinguistics:destroy(); self.layBottomLinguistics = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.btnNovoMedicine ~= nil then self.btnNovoMedicine:destroy(); self.btnNovoMedicine = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.rclCraft ~= nil then self.rclCraft:destroy(); self.rclCraft = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rclRide ~= nil then self.rclRide:destroy(); self.rclRide = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.Ride ~= nil then self.Ride:destroy(); self.Ride = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.rclActions ~= nil then self.rclActions:destroy(); self.rclActions = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.imageCheckBox59 ~= nil then self.imageCheckBox59:destroy(); self.imageCheckBox59 = nil; end;
        if self.btnNovoWar ~= nil then self.btnNovoWar:destroy(); self.btnNovoWar = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.rclCommited ~= nil then self.rclCommited:destroy(); self.rclCommited = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.Awareness ~= nil then self.Awareness:destroy(); self.Awareness = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.Anima ~= nil then self.Anima:destroy(); self.Anima = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.Athletics ~= nil then self.Athletics:destroy(); self.Athletics = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.Occult ~= nil then self.Occult:destroy(); self.Occult = nil; end;
        if self.btnNovoLinguistics ~= nil then self.btnNovoLinguistics:destroy(); self.btnNovoLinguistics = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rclLarceny ~= nil then self.rclLarceny:destroy(); self.rclLarceny = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.Performance ~= nil then self.Performance:destroy(); self.Performance = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.Stealth ~= nil then self.Stealth:destroy(); self.Stealth = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rclThrown ~= nil then self.rclThrown:destroy(); self.rclThrown = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.rclHealth ~= nil then self.rclHealth:destroy(); self.rclHealth = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rclIntimacies ~= nil then self.rclIntimacies:destroy(); self.rclIntimacies = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layBottomStealth ~= nil then self.layBottomStealth:destroy(); self.layBottomStealth = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.Resistance ~= nil then self.Resistance:destroy(); self.Resistance = nil; end;
        if self.frmLunarForm ~= nil then self.frmLunarForm:destroy(); self.frmLunarForm = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.layBottomMedicine ~= nil then self.layBottomMedicine:destroy(); self.layBottomMedicine = nil; end;
        if self.Archery ~= nil then self.Archery:destroy(); self.Archery = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.btnNovoArchery ~= nil then self.btnNovoArchery:destroy(); self.btnNovoArchery = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.layBottomSail ~= nil then self.layBottomSail:destroy(); self.layBottomSail = nil; end;
        if self.btnNovoResistance ~= nil then self.btnNovoResistance:destroy(); self.btnNovoResistance = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.Larceny ~= nil then self.Larceny:destroy(); self.Larceny = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.Name ~= nil then self.Name:destroy(); self.Name = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.DragonAspect ~= nil then self.DragonAspect:destroy(); self.DragonAspect = nil; end;
        if self.btnNovoSail ~= nil then self.btnNovoSail:destroy(); self.btnNovoSail = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rclInvestigation ~= nil then self.rclInvestigation:destroy(); self.rclInvestigation = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.layBottomThrown ~= nil then self.layBottomThrown:destroy(); self.layBottomThrown = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layBottomInvestigation ~= nil then self.layBottomInvestigation:destroy(); self.layBottomInvestigation = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.btnNovoBureaucracy ~= nil then self.btnNovoBureaucracy:destroy(); self.btnNovoBureaucracy = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.btnNovoMartial ~= nil then self.btnNovoMartial:destroy(); self.btnNovoMartial = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.btnNovoBrawl ~= nil then self.btnNovoBrawl:destroy(); self.btnNovoBrawl = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.Presence ~= nil then self.Presence:destroy(); self.Presence = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.Spirit ~= nil then self.Spirit:destroy(); self.Spirit = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.rclWar ~= nil then self.rclWar:destroy(); self.rclWar = nil; end;
        if self.rclMerits ~= nil then self.rclMerits:destroy(); self.rclMerits = nil; end;
        if self.btnNovoThrown ~= nil then self.btnNovoThrown:destroy(); self.btnNovoThrown = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rclAttacks ~= nil then self.rclAttacks:destroy(); self.rclAttacks = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.boxLunar ~= nil then self.boxLunar:destroy(); self.boxLunar = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.frmGeral ~= nil then self.frmGeral:destroy(); self.frmGeral = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.Craft ~= nil then self.Craft:destroy(); self.Craft = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.layBottomEvocation ~= nil then self.layBottomEvocation:destroy(); self.layBottomEvocation = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.rclEvocation ~= nil then self.rclEvocation:destroy(); self.rclEvocation = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.rclPerformance ~= nil then self.rclPerformance:destroy(); self.rclPerformance = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.layBottomIntegrity ~= nil then self.layBottomIntegrity:destroy(); self.layBottomIntegrity = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.layBottomSurvival ~= nil then self.layBottomSurvival:destroy(); self.layBottomSurvival = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rclOccult ~= nil then self.rclOccult:destroy(); self.rclOccult = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layBottomAwareness ~= nil then self.layBottomAwareness:destroy(); self.layBottomAwareness = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.Thrown ~= nil then self.Thrown:destroy(); self.Thrown = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layBottomCraft ~= nil then self.layBottomCraft:destroy(); self.layBottomCraft = nil; end;
        if self.rclSurvival ~= nil then self.rclSurvival:destroy(); self.rclSurvival = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.Dodge ~= nil then self.Dodge:destroy(); self.Dodge = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclSocialize ~= nil then self.rclSocialize:destroy(); self.rclSocialize = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rclBureaucracy ~= nil then self.rclBureaucracy:destroy(); self.rclBureaucracy = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.btnNovoEvocation ~= nil then self.btnNovoEvocation:destroy(); self.btnNovoEvocation = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.Linguistics ~= nil then self.Linguistics:destroy(); self.Linguistics = nil; end;
        if self.layBottomBrawl ~= nil then self.layBottomBrawl:destroy(); self.layBottomBrawl = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.layBottomPerformance ~= nil then self.layBottomPerformance:destroy(); self.layBottomPerformance = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.Martial ~= nil then self.Martial:destroy(); self.Martial = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.Exaltation ~= nil then self.Exaltation:destroy(); self.Exaltation = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.Supernatural ~= nil then self.Supernatural:destroy(); self.Supernatural = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layBottomBureaucracy ~= nil then self.layBottomBureaucracy:destroy(); self.layBottomBureaucracy = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.LunarCaste ~= nil then self.LunarCaste:destroy(); self.LunarCaste = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.Investigation ~= nil then self.Investigation:destroy(); self.Investigation = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.layBottomSocialize ~= nil then self.layBottomSocialize:destroy(); self.layBottomSocialize = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layBottomOccult ~= nil then self.layBottomOccult:destroy(); self.layBottomOccult = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.rclMedicine ~= nil then self.rclMedicine:destroy(); self.rclMedicine = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.SolarCaste ~= nil then self.SolarCaste:destroy(); self.SolarCaste = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.btnNovoAwareness ~= nil then self.btnNovoAwareness:destroy(); self.btnNovoAwareness = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.War ~= nil then self.War:destroy(); self.War = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.btnNovoAthletics ~= nil then self.btnNovoAthletics:destroy(); self.btnNovoAthletics = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.btnNovoLore ~= nil then self.btnNovoLore:destroy(); self.btnNovoLore = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.Lore ~= nil then self.Lore:destroy(); self.Lore = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rclIntegrity ~= nil then self.rclIntegrity:destroy(); self.rclIntegrity = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.rclMartial ~= nil then self.rclMartial:destroy(); self.rclMartial = nil; end;
        if self.btnNovoMelee ~= nil then self.btnNovoMelee:destroy(); self.btnNovoMelee = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layBottomPresence ~= nil then self.layBottomPresence:destroy(); self.layBottomPresence = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.Integrity ~= nil then self.Integrity:destroy(); self.Integrity = nil; end;
        if self.layBottomWar ~= nil then self.layBottomWar:destroy(); self.layBottomWar = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layBottomAthletics ~= nil then self.layBottomAthletics:destroy(); self.layBottomAthletics = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rclBrawl ~= nil then self.rclBrawl:destroy(); self.rclBrawl = nil; end;
        if self.imageCheckBox60 ~= nil then self.imageCheckBox60:destroy(); self.imageCheckBox60 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.layBottomMartial ~= nil then self.layBottomMartial:destroy(); self.layBottomMartial = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.btnNovoPerformance ~= nil then self.btnNovoPerformance:destroy(); self.btnNovoPerformance = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.btnNovoDodge ~= nil then self.btnNovoDodge:destroy(); self.btnNovoDodge = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.rclDodge ~= nil then self.rclDodge:destroy(); self.rclDodge = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.layBottomMelee ~= nil then self.layBottomMelee:destroy(); self.layBottomMelee = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.Melee ~= nil then self.Melee:destroy(); self.Melee = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.frmIntimacies ~= nil then self.frmIntimacies:destroy(); self.frmIntimacies = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.Evocation ~= nil then self.Evocation:destroy(); self.Evocation = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.frmAbilities ~= nil then self.frmAbilities:destroy(); self.frmAbilities = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.rclAbilities ~= nil then self.rclAbilities:destroy(); self.rclAbilities = nil; end;
        if self.layBottomArchery ~= nil then self.layBottomArchery:destroy(); self.layBottomArchery = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.rclLinguistics ~= nil then self.rclLinguistics:destroy(); self.rclLinguistics = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.btnNovoCraft ~= nil then self.btnNovoCraft:destroy(); self.btnNovoCraft = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.Player ~= nil then self.Player:destroy(); self.Player = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.btnNovoOccult ~= nil then self.btnNovoOccult:destroy(); self.btnNovoOccult = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.imageCheckBox57 ~= nil then self.imageCheckBox57:destroy(); self.imageCheckBox57 = nil; end;
        if self.rclPresence ~= nil then self.rclPresence:destroy(); self.rclPresence = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.rclMelee ~= nil then self.rclMelee:destroy(); self.rclMelee = nil; end;
        if self.layBottomLarceny ~= nil then self.layBottomLarceny:destroy(); self.layBottomLarceny = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.btnNovoPresence ~= nil then self.btnNovoPresence:destroy(); self.btnNovoPresence = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.Tell ~= nil then self.Tell:destroy(); self.Tell = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rclLore ~= nil then self.rclLore:destroy(); self.rclLore = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.btnNovoRide ~= nil then self.btnNovoRide:destroy(); self.btnNovoRide = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.Medicine ~= nil then self.Medicine:destroy(); self.Medicine = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMain()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMain();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "Ambesek.Exalted.3rd", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Exalted 3rd", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
