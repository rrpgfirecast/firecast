require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMageDarkAges()
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
    obj:setName("frmMageDarkAges");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Mage.DarkAges");
    obj:setTitle("Mage Dark Ages");
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
    obj.tab1:setTitle("Main");
    obj.tab1:setName("tab1");

    obj.frmMDA20_1 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMDA20_1:setParent(obj.tab1);
    obj.frmMDA20_1:setName("frmMDA20_1");
    obj.frmMDA20_1:setAlign("client");
    obj.frmMDA20_1:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmMDA20_1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(900);
    obj.layout1:setHeight(100);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(290);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(80);
    obj.label1:setHeight(20);
    obj.label1:setText("Name");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(90);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("name");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(290);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(290);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(80);
    obj.label2:setHeight(20);
    obj.label2:setText("Nature");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(90);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("nature");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(580);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(290);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(80);
    obj.label3:setHeight(20);
    obj.label3:setText("Fellowship");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(90);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("fellowship");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(290);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(80);
    obj.label4:setHeight(20);
    obj.label4:setText("Player");
    obj.label4:setHorzTextAlign("trailing");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(90);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("player");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(290);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(290);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(80);
    obj.label5:setHeight(20);
    obj.label5:setText("Demeanor");
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(90);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("demeanor");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(580);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(290);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(80);
    obj.label6:setHeight(20);
    obj.label6:setText("Rank");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(90);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("rank");
    obj.edit6:setName("edit6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(65);
    obj.layout8:setWidth(290);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(80);
    obj.label7:setHeight(20);
    obj.label7:setText("Chronicle");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setLeft(90);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("chronicle");
    obj.edit7:setName("edit7");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(290);
    obj.layout9:setTop(65);
    obj.layout9:setWidth(290);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(80);
    obj.label8:setHeight(20);
    obj.label8:setText("Concept");
    obj.label8:setHorzTextAlign("trailing");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(90);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("concept");
    obj.edit8:setName("edit8");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(580);
    obj.layout10:setTop(65);
    obj.layout10:setWidth(290);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout10);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(80);
    obj.label9:setHeight(20);
    obj.label9:setText("Cabal");
    obj.label9:setHorzTextAlign("trailing");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setLeft(90);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("cabal");
    obj.edit9:setName("edit9");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setLeft(910);
    obj.layout11:setTop(0);
    obj.layout11:setWidth(100);
    obj.layout11:setHeight(100);
    obj.layout11:setName("layout11");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout11);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setName("rectangle2");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setText("EXPERIENCE");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setLeft(20);
    obj.edit10:setTop(25);
    obj.edit10:setWidth(60);
    obj.edit10:setHeight(60);
    obj.edit10:setFontSize(20);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setField("experience");
    obj.edit10:setName("edit10");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox1);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(110);
    obj.layout12:setWidth(270);
    obj.layout12:setHeight(285);
    obj.layout12:setName("layout12");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout12);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setName("rectangle3");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout12);
    obj.label11:setLeft(5);
    obj.label11:setTop(0);
    obj.label11:setWidth(270);
    obj.label11:setHeight(20);
    obj.label11:setText("ATTRIBUTES");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setLeft(-35);
    obj.label12:setTop(60);
    obj.label12:setWidth(100);
    obj.label12:setHeight(20);
    obj.label12:setText("Physical");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setRotationAngle(270);
    obj.label12:setName("label12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setLeft(50);
    obj.layout13:setTop(25);
    obj.layout13:setWidth(205);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout13);
    obj.label13:setLeft(0);
    obj.label13:setTop(5);
    obj.label13:setWidth(80);
    obj.label13:setHeight(20);
    obj.label13:setText("Strength");
    obj.label13:setName("label13");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout13);
    obj.image1:setLeft(80);
    obj.image1:setTop(0);
    obj.image1:setWidth(25);
    obj.image1:setHeight(25);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image1:setName("image1");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout13);
    obj.imageCheckBox1:setLeft(105);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(25);
    obj.imageCheckBox1:setHeight(25);
    obj.imageCheckBox1:setField("strength_2");
    obj.imageCheckBox1:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox1:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout13);
    obj.imageCheckBox2:setLeft(130);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(25);
    obj.imageCheckBox2:setHeight(25);
    obj.imageCheckBox2:setField("strength_3");
    obj.imageCheckBox2:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox2:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout13);
    obj.imageCheckBox3:setLeft(155);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(25);
    obj.imageCheckBox3:setHeight(25);
    obj.imageCheckBox3:setField("strength_4");
    obj.imageCheckBox3:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox3:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout13);
    obj.imageCheckBox4:setLeft(180);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(25);
    obj.imageCheckBox4:setHeight(25);
    obj.imageCheckBox4:setField("strength_5");
    obj.imageCheckBox4:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox4:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout12);
    obj.layout14:setLeft(50);
    obj.layout14:setTop(50);
    obj.layout14:setWidth(205);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout14);
    obj.label14:setLeft(0);
    obj.label14:setTop(5);
    obj.label14:setWidth(80);
    obj.label14:setHeight(20);
    obj.label14:setText("Dexterity");
    obj.label14:setName("label14");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout14);
    obj.image2:setLeft(80);
    obj.image2:setTop(0);
    obj.image2:setWidth(25);
    obj.image2:setHeight(25);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image2:setName("image2");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout14);
    obj.imageCheckBox5:setLeft(105);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(25);
    obj.imageCheckBox5:setHeight(25);
    obj.imageCheckBox5:setField("dexterity_2");
    obj.imageCheckBox5:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox5:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout14);
    obj.imageCheckBox6:setLeft(130);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(25);
    obj.imageCheckBox6:setHeight(25);
    obj.imageCheckBox6:setField("dexterity_3");
    obj.imageCheckBox6:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox6:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout14);
    obj.imageCheckBox7:setLeft(155);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(25);
    obj.imageCheckBox7:setHeight(25);
    obj.imageCheckBox7:setField("dexterity_4");
    obj.imageCheckBox7:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox7:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout14);
    obj.imageCheckBox8:setLeft(180);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(25);
    obj.imageCheckBox8:setHeight(25);
    obj.imageCheckBox8:setField("dexterity_5");
    obj.imageCheckBox8:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox8:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout12);
    obj.layout15:setLeft(50);
    obj.layout15:setTop(75);
    obj.layout15:setWidth(205);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout15);
    obj.label15:setLeft(0);
    obj.label15:setTop(5);
    obj.label15:setWidth(80);
    obj.label15:setHeight(20);
    obj.label15:setText("Stamina");
    obj.label15:setName("label15");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout15);
    obj.image3:setLeft(80);
    obj.image3:setTop(0);
    obj.image3:setWidth(25);
    obj.image3:setHeight(25);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image3:setName("image3");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout15);
    obj.imageCheckBox9:setLeft(105);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(25);
    obj.imageCheckBox9:setHeight(25);
    obj.imageCheckBox9:setField("stamina_2");
    obj.imageCheckBox9:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox9:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout15);
    obj.imageCheckBox10:setLeft(130);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(25);
    obj.imageCheckBox10:setHeight(25);
    obj.imageCheckBox10:setField("stamina_3");
    obj.imageCheckBox10:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox10:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout15);
    obj.imageCheckBox11:setLeft(155);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(25);
    obj.imageCheckBox11:setHeight(25);
    obj.imageCheckBox11:setField("stamina_4");
    obj.imageCheckBox11:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox11:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout15);
    obj.imageCheckBox12:setLeft(180);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(25);
    obj.imageCheckBox12:setHeight(25);
    obj.imageCheckBox12:setField("stamina_5");
    obj.imageCheckBox12:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox12:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout12);
    obj.horzLine1:setLeft(5);
    obj.horzLine1:setTop(105);
    obj.horzLine1:setWidth(255);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16:setLeft(-35);
    obj.label16:setTop(145);
    obj.label16:setWidth(100);
    obj.label16:setHeight(20);
    obj.label16:setText("Social");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setRotationAngle(270);
    obj.label16:setName("label16");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout12);
    obj.layout16:setLeft(50);
    obj.layout16:setTop(110);
    obj.layout16:setWidth(205);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout16);
    obj.label17:setLeft(0);
    obj.label17:setTop(5);
    obj.label17:setWidth(80);
    obj.label17:setHeight(20);
    obj.label17:setText("Charisma");
    obj.label17:setName("label17");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout16);
    obj.image4:setLeft(80);
    obj.image4:setTop(0);
    obj.image4:setWidth(25);
    obj.image4:setHeight(25);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image4:setName("image4");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout16);
    obj.imageCheckBox13:setLeft(105);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(25);
    obj.imageCheckBox13:setHeight(25);
    obj.imageCheckBox13:setField("charisma_2");
    obj.imageCheckBox13:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox13:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout16);
    obj.imageCheckBox14:setLeft(130);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(25);
    obj.imageCheckBox14:setHeight(25);
    obj.imageCheckBox14:setField("charisma_3");
    obj.imageCheckBox14:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox14:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout16);
    obj.imageCheckBox15:setLeft(155);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(25);
    obj.imageCheckBox15:setHeight(25);
    obj.imageCheckBox15:setField("charisma_4");
    obj.imageCheckBox15:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox15:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout16);
    obj.imageCheckBox16:setLeft(180);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(25);
    obj.imageCheckBox16:setHeight(25);
    obj.imageCheckBox16:setField("charisma_5");
    obj.imageCheckBox16:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox16:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout12);
    obj.layout17:setLeft(50);
    obj.layout17:setTop(135);
    obj.layout17:setWidth(205);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout17);
    obj.label18:setLeft(0);
    obj.label18:setTop(5);
    obj.label18:setWidth(80);
    obj.label18:setHeight(20);
    obj.label18:setText("Manipulation");
    obj.label18:setName("label18");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout17);
    obj.image5:setLeft(80);
    obj.image5:setTop(0);
    obj.image5:setWidth(25);
    obj.image5:setHeight(25);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image5:setName("image5");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout17);
    obj.imageCheckBox17:setLeft(105);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(25);
    obj.imageCheckBox17:setHeight(25);
    obj.imageCheckBox17:setField("manipulation_2");
    obj.imageCheckBox17:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox17:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout17);
    obj.imageCheckBox18:setLeft(130);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(25);
    obj.imageCheckBox18:setHeight(25);
    obj.imageCheckBox18:setField("manipulation_3");
    obj.imageCheckBox18:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox18:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout17);
    obj.imageCheckBox19:setLeft(155);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(25);
    obj.imageCheckBox19:setHeight(25);
    obj.imageCheckBox19:setField("manipulation_4");
    obj.imageCheckBox19:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox19:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout17);
    obj.imageCheckBox20:setLeft(180);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(25);
    obj.imageCheckBox20:setHeight(25);
    obj.imageCheckBox20:setField("manipulation_5");
    obj.imageCheckBox20:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox20:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout12);
    obj.layout18:setLeft(50);
    obj.layout18:setTop(160);
    obj.layout18:setWidth(205);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout18);
    obj.label19:setLeft(0);
    obj.label19:setTop(5);
    obj.label19:setWidth(80);
    obj.label19:setHeight(20);
    obj.label19:setText("Appearance");
    obj.label19:setName("label19");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout18);
    obj.image6:setLeft(80);
    obj.image6:setTop(0);
    obj.image6:setWidth(25);
    obj.image6:setHeight(25);
    obj.image6:setStyle("autoFit");
    obj.image6:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image6:setName("image6");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout18);
    obj.imageCheckBox21:setLeft(105);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(25);
    obj.imageCheckBox21:setHeight(25);
    obj.imageCheckBox21:setField("appearance_2");
    obj.imageCheckBox21:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox21:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout18);
    obj.imageCheckBox22:setLeft(130);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(25);
    obj.imageCheckBox22:setHeight(25);
    obj.imageCheckBox22:setField("appearance_3");
    obj.imageCheckBox22:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox22:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout18);
    obj.imageCheckBox23:setLeft(155);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(25);
    obj.imageCheckBox23:setHeight(25);
    obj.imageCheckBox23:setField("appearance_4");
    obj.imageCheckBox23:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox23:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout18);
    obj.imageCheckBox24:setLeft(180);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(25);
    obj.imageCheckBox24:setHeight(25);
    obj.imageCheckBox24:setField("appearance_5");
    obj.imageCheckBox24:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox24:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout12);
    obj.horzLine2:setLeft(5);
    obj.horzLine2:setTop(190);
    obj.horzLine2:setWidth(255);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout12);
    obj.label20:setLeft(-35);
    obj.label20:setTop(230);
    obj.label20:setWidth(100);
    obj.label20:setHeight(20);
    obj.label20:setText("Mental");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setRotationAngle(270);
    obj.label20:setName("label20");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout12);
    obj.layout19:setLeft(50);
    obj.layout19:setTop(195);
    obj.layout19:setWidth(205);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout19);
    obj.label21:setLeft(0);
    obj.label21:setTop(5);
    obj.label21:setWidth(80);
    obj.label21:setHeight(20);
    obj.label21:setText("Perception");
    obj.label21:setName("label21");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout19);
    obj.image7:setLeft(80);
    obj.image7:setTop(0);
    obj.image7:setWidth(25);
    obj.image7:setHeight(25);
    obj.image7:setStyle("autoFit");
    obj.image7:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image7:setName("image7");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout19);
    obj.imageCheckBox25:setLeft(105);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(25);
    obj.imageCheckBox25:setHeight(25);
    obj.imageCheckBox25:setField("perception_2");
    obj.imageCheckBox25:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox25:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout19);
    obj.imageCheckBox26:setLeft(130);
    obj.imageCheckBox26:setTop(0);
    obj.imageCheckBox26:setWidth(25);
    obj.imageCheckBox26:setHeight(25);
    obj.imageCheckBox26:setField("perception_3");
    obj.imageCheckBox26:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox26:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout19);
    obj.imageCheckBox27:setLeft(155);
    obj.imageCheckBox27:setTop(0);
    obj.imageCheckBox27:setWidth(25);
    obj.imageCheckBox27:setHeight(25);
    obj.imageCheckBox27:setField("perception_4");
    obj.imageCheckBox27:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox27:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout19);
    obj.imageCheckBox28:setLeft(180);
    obj.imageCheckBox28:setTop(0);
    obj.imageCheckBox28:setWidth(25);
    obj.imageCheckBox28:setHeight(25);
    obj.imageCheckBox28:setField("perception_5");
    obj.imageCheckBox28:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox28:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout12);
    obj.layout20:setLeft(50);
    obj.layout20:setTop(220);
    obj.layout20:setWidth(205);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout20);
    obj.label22:setLeft(0);
    obj.label22:setTop(5);
    obj.label22:setWidth(80);
    obj.label22:setHeight(20);
    obj.label22:setText("Inteligence");
    obj.label22:setName("label22");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout20);
    obj.image8:setLeft(80);
    obj.image8:setTop(0);
    obj.image8:setWidth(25);
    obj.image8:setHeight(25);
    obj.image8:setStyle("autoFit");
    obj.image8:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image8:setName("image8");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout20);
    obj.imageCheckBox29:setLeft(105);
    obj.imageCheckBox29:setTop(0);
    obj.imageCheckBox29:setWidth(25);
    obj.imageCheckBox29:setHeight(25);
    obj.imageCheckBox29:setField("inteligence_2");
    obj.imageCheckBox29:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox29:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout20);
    obj.imageCheckBox30:setLeft(130);
    obj.imageCheckBox30:setTop(0);
    obj.imageCheckBox30:setWidth(25);
    obj.imageCheckBox30:setHeight(25);
    obj.imageCheckBox30:setField("inteligence_3");
    obj.imageCheckBox30:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox30:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout20);
    obj.imageCheckBox31:setLeft(155);
    obj.imageCheckBox31:setTop(0);
    obj.imageCheckBox31:setWidth(25);
    obj.imageCheckBox31:setHeight(25);
    obj.imageCheckBox31:setField("inteligence_4");
    obj.imageCheckBox31:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox31:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout20);
    obj.imageCheckBox32:setLeft(180);
    obj.imageCheckBox32:setTop(0);
    obj.imageCheckBox32:setWidth(25);
    obj.imageCheckBox32:setHeight(25);
    obj.imageCheckBox32:setField("inteligence_5");
    obj.imageCheckBox32:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox32:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout12);
    obj.layout21:setLeft(50);
    obj.layout21:setTop(245);
    obj.layout21:setWidth(205);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout21);
    obj.label23:setLeft(0);
    obj.label23:setTop(5);
    obj.label23:setWidth(80);
    obj.label23:setHeight(20);
    obj.label23:setText("Wits");
    obj.label23:setName("label23");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout21);
    obj.image9:setLeft(80);
    obj.image9:setTop(0);
    obj.image9:setWidth(25);
    obj.image9:setHeight(25);
    obj.image9:setStyle("autoFit");
    obj.image9:setSRC("/MageDarkAges/images/prime_on.png");
    obj.image9:setName("image9");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout21);
    obj.imageCheckBox33:setLeft(105);
    obj.imageCheckBox33:setTop(0);
    obj.imageCheckBox33:setWidth(25);
    obj.imageCheckBox33:setHeight(25);
    obj.imageCheckBox33:setField("wits_2");
    obj.imageCheckBox33:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox33:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout21);
    obj.imageCheckBox34:setLeft(130);
    obj.imageCheckBox34:setTop(0);
    obj.imageCheckBox34:setWidth(25);
    obj.imageCheckBox34:setHeight(25);
    obj.imageCheckBox34:setField("wits_3");
    obj.imageCheckBox34:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox34:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.imageCheckBox35 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout21);
    obj.imageCheckBox35:setLeft(155);
    obj.imageCheckBox35:setTop(0);
    obj.imageCheckBox35:setWidth(25);
    obj.imageCheckBox35:setHeight(25);
    obj.imageCheckBox35:setField("wits_4");
    obj.imageCheckBox35:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox35:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.imageCheckBox36 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout21);
    obj.imageCheckBox36:setLeft(180);
    obj.imageCheckBox36:setTop(0);
    obj.imageCheckBox36:setWidth(25);
    obj.imageCheckBox36:setHeight(25);
    obj.imageCheckBox36:setField("wits_5");
    obj.imageCheckBox36:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox36:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(405);
    obj.rectangle4:setWidth(270);
    obj.rectangle4:setHeight(270);
    obj.rectangle4:setColor("DimGray");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setName("rectangle4");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox1);
    obj.image10:setLeft(0);
    obj.image10:setTop(405);
    obj.image10:setWidth(270);
    obj.image10:setHeight(270);
    obj.image10:setField("avatar");
    obj.image10:setEditable(true);
    obj.image10:setStyle("autoFit");
    obj.image10:setName("image10");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox1);
    obj.layout22:setLeft(280);
    obj.layout22:setTop(110);
    obj.layout22:setWidth(760);
    obj.layout22:setHeight(380);
    obj.layout22:setName("layout22");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout22);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#FFFFFF00");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("innerLine");
    obj.rectangle5:setName("rectangle5");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout22);
    obj.label24:setLeft(5);
    obj.label24:setTop(1);
    obj.label24:setWidth(760);
    obj.label24:setHeight(20);
    obj.label24:setText("ABILITIES");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setLeft(10);
    obj.layout23:setTop(30);
    obj.layout23:setWidth(240);
    obj.layout23:setHeight(340);
    obj.layout23:setName("layout23");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout23);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("innerLine");
    obj.rectangle6:setName("rectangle6");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout23);
    obj.label25:setLeft(5);
    obj.label25:setTop(0);
    obj.label25:setWidth(240);
    obj.label25:setHeight(20);
    obj.label25:setText("TALENTS");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setLeft(15);
    obj.layout24:setTop(25);
    obj.layout24:setWidth(205);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout24);
    obj.label26:setLeft(0);
    obj.label26:setTop(5);
    obj.label26:setWidth(80);
    obj.label26:setHeight(20);
    obj.label26:setText("Alertness");
    obj.label26:setName("label26");

    obj.imageCheckBox37 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout24);
    obj.imageCheckBox37:setLeft(80);
    obj.imageCheckBox37:setTop(0);
    obj.imageCheckBox37:setWidth(25);
    obj.imageCheckBox37:setHeight(25);
    obj.imageCheckBox37:setField("alertness_1");
    obj.imageCheckBox37:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox37:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.imageCheckBox38 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout24);
    obj.imageCheckBox38:setLeft(105);
    obj.imageCheckBox38:setTop(0);
    obj.imageCheckBox38:setWidth(25);
    obj.imageCheckBox38:setHeight(25);
    obj.imageCheckBox38:setField("alertness_2");
    obj.imageCheckBox38:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox38:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.imageCheckBox39 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout24);
    obj.imageCheckBox39:setLeft(130);
    obj.imageCheckBox39:setTop(0);
    obj.imageCheckBox39:setWidth(25);
    obj.imageCheckBox39:setHeight(25);
    obj.imageCheckBox39:setField("alertness_3");
    obj.imageCheckBox39:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox39:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.imageCheckBox40 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout24);
    obj.imageCheckBox40:setLeft(155);
    obj.imageCheckBox40:setTop(0);
    obj.imageCheckBox40:setWidth(25);
    obj.imageCheckBox40:setHeight(25);
    obj.imageCheckBox40:setField("alertness_4");
    obj.imageCheckBox40:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox40:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.imageCheckBox41 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout24);
    obj.imageCheckBox41:setLeft(180);
    obj.imageCheckBox41:setTop(0);
    obj.imageCheckBox41:setWidth(25);
    obj.imageCheckBox41:setHeight(25);
    obj.imageCheckBox41:setField("alertness_5");
    obj.imageCheckBox41:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox41:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout23);
    obj.layout25:setLeft(15);
    obj.layout25:setTop(50);
    obj.layout25:setWidth(205);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout25);
    obj.label27:setLeft(0);
    obj.label27:setTop(5);
    obj.label27:setWidth(80);
    obj.label27:setHeight(20);
    obj.label27:setText("Athetics");
    obj.label27:setName("label27");

    obj.imageCheckBox42 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout25);
    obj.imageCheckBox42:setLeft(80);
    obj.imageCheckBox42:setTop(0);
    obj.imageCheckBox42:setWidth(25);
    obj.imageCheckBox42:setHeight(25);
    obj.imageCheckBox42:setField("athetics_1");
    obj.imageCheckBox42:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox42:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.imageCheckBox43 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout25);
    obj.imageCheckBox43:setLeft(105);
    obj.imageCheckBox43:setTop(0);
    obj.imageCheckBox43:setWidth(25);
    obj.imageCheckBox43:setHeight(25);
    obj.imageCheckBox43:setField("athetics_2");
    obj.imageCheckBox43:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox43:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.imageCheckBox44 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout25);
    obj.imageCheckBox44:setLeft(130);
    obj.imageCheckBox44:setTop(0);
    obj.imageCheckBox44:setWidth(25);
    obj.imageCheckBox44:setHeight(25);
    obj.imageCheckBox44:setField("athetics_3");
    obj.imageCheckBox44:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox44:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.imageCheckBox45 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout25);
    obj.imageCheckBox45:setLeft(155);
    obj.imageCheckBox45:setTop(0);
    obj.imageCheckBox45:setWidth(25);
    obj.imageCheckBox45:setHeight(25);
    obj.imageCheckBox45:setField("athetics_4");
    obj.imageCheckBox45:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox45:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.imageCheckBox46 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout25);
    obj.imageCheckBox46:setLeft(180);
    obj.imageCheckBox46:setTop(0);
    obj.imageCheckBox46:setWidth(25);
    obj.imageCheckBox46:setHeight(25);
    obj.imageCheckBox46:setField("athetics_5");
    obj.imageCheckBox46:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox46:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout23);
    obj.layout26:setLeft(15);
    obj.layout26:setTop(75);
    obj.layout26:setWidth(205);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout26);
    obj.label28:setLeft(0);
    obj.label28:setTop(5);
    obj.label28:setWidth(80);
    obj.label28:setHeight(20);
    obj.label28:setText("Awareness");
    obj.label28:setName("label28");

    obj.imageCheckBox47 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout26);
    obj.imageCheckBox47:setLeft(80);
    obj.imageCheckBox47:setTop(0);
    obj.imageCheckBox47:setWidth(25);
    obj.imageCheckBox47:setHeight(25);
    obj.imageCheckBox47:setField("awareness_1");
    obj.imageCheckBox47:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox47:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.imageCheckBox48 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout26);
    obj.imageCheckBox48:setLeft(105);
    obj.imageCheckBox48:setTop(0);
    obj.imageCheckBox48:setWidth(25);
    obj.imageCheckBox48:setHeight(25);
    obj.imageCheckBox48:setField("awareness_2");
    obj.imageCheckBox48:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox48:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.imageCheckBox49 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout26);
    obj.imageCheckBox49:setLeft(130);
    obj.imageCheckBox49:setTop(0);
    obj.imageCheckBox49:setWidth(25);
    obj.imageCheckBox49:setHeight(25);
    obj.imageCheckBox49:setField("awareness_3");
    obj.imageCheckBox49:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox49:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.imageCheckBox50 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout26);
    obj.imageCheckBox50:setLeft(155);
    obj.imageCheckBox50:setTop(0);
    obj.imageCheckBox50:setWidth(25);
    obj.imageCheckBox50:setHeight(25);
    obj.imageCheckBox50:setField("awareness_4");
    obj.imageCheckBox50:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox50:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.imageCheckBox51 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout26);
    obj.imageCheckBox51:setLeft(180);
    obj.imageCheckBox51:setTop(0);
    obj.imageCheckBox51:setWidth(25);
    obj.imageCheckBox51:setHeight(25);
    obj.imageCheckBox51:setField("awareness_5");
    obj.imageCheckBox51:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox51:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout23);
    obj.layout27:setLeft(15);
    obj.layout27:setTop(100);
    obj.layout27:setWidth(205);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout27);
    obj.label29:setLeft(0);
    obj.label29:setTop(5);
    obj.label29:setWidth(80);
    obj.label29:setHeight(20);
    obj.label29:setText("Brawl");
    obj.label29:setName("label29");

    obj.imageCheckBox52 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout27);
    obj.imageCheckBox52:setLeft(80);
    obj.imageCheckBox52:setTop(0);
    obj.imageCheckBox52:setWidth(25);
    obj.imageCheckBox52:setHeight(25);
    obj.imageCheckBox52:setField("brawl_1");
    obj.imageCheckBox52:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox52:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.imageCheckBox53 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout27);
    obj.imageCheckBox53:setLeft(105);
    obj.imageCheckBox53:setTop(0);
    obj.imageCheckBox53:setWidth(25);
    obj.imageCheckBox53:setHeight(25);
    obj.imageCheckBox53:setField("brawl_2");
    obj.imageCheckBox53:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox53:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.imageCheckBox54 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout27);
    obj.imageCheckBox54:setLeft(130);
    obj.imageCheckBox54:setTop(0);
    obj.imageCheckBox54:setWidth(25);
    obj.imageCheckBox54:setHeight(25);
    obj.imageCheckBox54:setField("brawl_3");
    obj.imageCheckBox54:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox54:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.imageCheckBox55 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout27);
    obj.imageCheckBox55:setLeft(155);
    obj.imageCheckBox55:setTop(0);
    obj.imageCheckBox55:setWidth(25);
    obj.imageCheckBox55:setHeight(25);
    obj.imageCheckBox55:setField("brawl_4");
    obj.imageCheckBox55:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox55:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.imageCheckBox56 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout27);
    obj.imageCheckBox56:setLeft(180);
    obj.imageCheckBox56:setTop(0);
    obj.imageCheckBox56:setWidth(25);
    obj.imageCheckBox56:setHeight(25);
    obj.imageCheckBox56:setField("brawl_5");
    obj.imageCheckBox56:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox56:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout23);
    obj.layout28:setLeft(15);
    obj.layout28:setTop(125);
    obj.layout28:setWidth(205);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout28);
    obj.label30:setLeft(0);
    obj.label30:setTop(5);
    obj.label30:setWidth(80);
    obj.label30:setHeight(20);
    obj.label30:setText("Dodge");
    obj.label30:setName("label30");

    obj.imageCheckBox57 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox57:setParent(obj.layout28);
    obj.imageCheckBox57:setLeft(80);
    obj.imageCheckBox57:setTop(0);
    obj.imageCheckBox57:setWidth(25);
    obj.imageCheckBox57:setHeight(25);
    obj.imageCheckBox57:setField("dodge_1");
    obj.imageCheckBox57:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox57:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox57:setName("imageCheckBox57");

    obj.imageCheckBox58 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox58:setParent(obj.layout28);
    obj.imageCheckBox58:setLeft(105);
    obj.imageCheckBox58:setTop(0);
    obj.imageCheckBox58:setWidth(25);
    obj.imageCheckBox58:setHeight(25);
    obj.imageCheckBox58:setField("dodge_2");
    obj.imageCheckBox58:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox58:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox58:setName("imageCheckBox58");

    obj.imageCheckBox59 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox59:setParent(obj.layout28);
    obj.imageCheckBox59:setLeft(130);
    obj.imageCheckBox59:setTop(0);
    obj.imageCheckBox59:setWidth(25);
    obj.imageCheckBox59:setHeight(25);
    obj.imageCheckBox59:setField("dodge_3");
    obj.imageCheckBox59:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox59:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox59:setName("imageCheckBox59");

    obj.imageCheckBox60 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox60:setParent(obj.layout28);
    obj.imageCheckBox60:setLeft(155);
    obj.imageCheckBox60:setTop(0);
    obj.imageCheckBox60:setWidth(25);
    obj.imageCheckBox60:setHeight(25);
    obj.imageCheckBox60:setField("dodge_4");
    obj.imageCheckBox60:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox60:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox60:setName("imageCheckBox60");

    obj.imageCheckBox61 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox61:setParent(obj.layout28);
    obj.imageCheckBox61:setLeft(180);
    obj.imageCheckBox61:setTop(0);
    obj.imageCheckBox61:setWidth(25);
    obj.imageCheckBox61:setHeight(25);
    obj.imageCheckBox61:setField("dodge_5");
    obj.imageCheckBox61:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox61:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox61:setName("imageCheckBox61");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout23);
    obj.layout29:setLeft(15);
    obj.layout29:setTop(150);
    obj.layout29:setWidth(205);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout29);
    obj.label31:setLeft(0);
    obj.label31:setTop(5);
    obj.label31:setWidth(80);
    obj.label31:setHeight(20);
    obj.label31:setText("Empathy");
    obj.label31:setName("label31");

    obj.imageCheckBox62 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox62:setParent(obj.layout29);
    obj.imageCheckBox62:setLeft(80);
    obj.imageCheckBox62:setTop(0);
    obj.imageCheckBox62:setWidth(25);
    obj.imageCheckBox62:setHeight(25);
    obj.imageCheckBox62:setField("empathy_1");
    obj.imageCheckBox62:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox62:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox62:setName("imageCheckBox62");

    obj.imageCheckBox63 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox63:setParent(obj.layout29);
    obj.imageCheckBox63:setLeft(105);
    obj.imageCheckBox63:setTop(0);
    obj.imageCheckBox63:setWidth(25);
    obj.imageCheckBox63:setHeight(25);
    obj.imageCheckBox63:setField("empathy_2");
    obj.imageCheckBox63:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox63:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox63:setName("imageCheckBox63");

    obj.imageCheckBox64 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox64:setParent(obj.layout29);
    obj.imageCheckBox64:setLeft(130);
    obj.imageCheckBox64:setTop(0);
    obj.imageCheckBox64:setWidth(25);
    obj.imageCheckBox64:setHeight(25);
    obj.imageCheckBox64:setField("empathy_3");
    obj.imageCheckBox64:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox64:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox64:setName("imageCheckBox64");

    obj.imageCheckBox65 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox65:setParent(obj.layout29);
    obj.imageCheckBox65:setLeft(155);
    obj.imageCheckBox65:setTop(0);
    obj.imageCheckBox65:setWidth(25);
    obj.imageCheckBox65:setHeight(25);
    obj.imageCheckBox65:setField("empathy_4");
    obj.imageCheckBox65:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox65:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox65:setName("imageCheckBox65");

    obj.imageCheckBox66 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox66:setParent(obj.layout29);
    obj.imageCheckBox66:setLeft(180);
    obj.imageCheckBox66:setTop(0);
    obj.imageCheckBox66:setWidth(25);
    obj.imageCheckBox66:setHeight(25);
    obj.imageCheckBox66:setField("empathy_5");
    obj.imageCheckBox66:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox66:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox66:setName("imageCheckBox66");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout23);
    obj.layout30:setLeft(15);
    obj.layout30:setTop(175);
    obj.layout30:setWidth(205);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout30);
    obj.label32:setLeft(0);
    obj.label32:setTop(5);
    obj.label32:setWidth(80);
    obj.label32:setHeight(20);
    obj.label32:setText("Expression");
    obj.label32:setName("label32");

    obj.imageCheckBox67 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox67:setParent(obj.layout30);
    obj.imageCheckBox67:setLeft(80);
    obj.imageCheckBox67:setTop(0);
    obj.imageCheckBox67:setWidth(25);
    obj.imageCheckBox67:setHeight(25);
    obj.imageCheckBox67:setField("expression_1");
    obj.imageCheckBox67:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox67:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox67:setName("imageCheckBox67");

    obj.imageCheckBox68 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox68:setParent(obj.layout30);
    obj.imageCheckBox68:setLeft(105);
    obj.imageCheckBox68:setTop(0);
    obj.imageCheckBox68:setWidth(25);
    obj.imageCheckBox68:setHeight(25);
    obj.imageCheckBox68:setField("expression_2");
    obj.imageCheckBox68:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox68:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox68:setName("imageCheckBox68");

    obj.imageCheckBox69 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox69:setParent(obj.layout30);
    obj.imageCheckBox69:setLeft(130);
    obj.imageCheckBox69:setTop(0);
    obj.imageCheckBox69:setWidth(25);
    obj.imageCheckBox69:setHeight(25);
    obj.imageCheckBox69:setField("expression_3");
    obj.imageCheckBox69:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox69:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox69:setName("imageCheckBox69");

    obj.imageCheckBox70 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox70:setParent(obj.layout30);
    obj.imageCheckBox70:setLeft(155);
    obj.imageCheckBox70:setTop(0);
    obj.imageCheckBox70:setWidth(25);
    obj.imageCheckBox70:setHeight(25);
    obj.imageCheckBox70:setField("expression_4");
    obj.imageCheckBox70:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox70:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox70:setName("imageCheckBox70");

    obj.imageCheckBox71 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox71:setParent(obj.layout30);
    obj.imageCheckBox71:setLeft(180);
    obj.imageCheckBox71:setTop(0);
    obj.imageCheckBox71:setWidth(25);
    obj.imageCheckBox71:setHeight(25);
    obj.imageCheckBox71:setField("expression_5");
    obj.imageCheckBox71:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox71:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox71:setName("imageCheckBox71");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout23);
    obj.layout31:setLeft(15);
    obj.layout31:setTop(200);
    obj.layout31:setWidth(205);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout31);
    obj.label33:setLeft(0);
    obj.label33:setTop(5);
    obj.label33:setWidth(80);
    obj.label33:setHeight(20);
    obj.label33:setText("Intimidation");
    obj.label33:setName("label33");

    obj.imageCheckBox72 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox72:setParent(obj.layout31);
    obj.imageCheckBox72:setLeft(80);
    obj.imageCheckBox72:setTop(0);
    obj.imageCheckBox72:setWidth(25);
    obj.imageCheckBox72:setHeight(25);
    obj.imageCheckBox72:setField("intimidation_1");
    obj.imageCheckBox72:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox72:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox72:setName("imageCheckBox72");

    obj.imageCheckBox73 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox73:setParent(obj.layout31);
    obj.imageCheckBox73:setLeft(105);
    obj.imageCheckBox73:setTop(0);
    obj.imageCheckBox73:setWidth(25);
    obj.imageCheckBox73:setHeight(25);
    obj.imageCheckBox73:setField("intimidation_2");
    obj.imageCheckBox73:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox73:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox73:setName("imageCheckBox73");

    obj.imageCheckBox74 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox74:setParent(obj.layout31);
    obj.imageCheckBox74:setLeft(130);
    obj.imageCheckBox74:setTop(0);
    obj.imageCheckBox74:setWidth(25);
    obj.imageCheckBox74:setHeight(25);
    obj.imageCheckBox74:setField("intimidation_3");
    obj.imageCheckBox74:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox74:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox74:setName("imageCheckBox74");

    obj.imageCheckBox75 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox75:setParent(obj.layout31);
    obj.imageCheckBox75:setLeft(155);
    obj.imageCheckBox75:setTop(0);
    obj.imageCheckBox75:setWidth(25);
    obj.imageCheckBox75:setHeight(25);
    obj.imageCheckBox75:setField("intimidation_4");
    obj.imageCheckBox75:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox75:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox75:setName("imageCheckBox75");

    obj.imageCheckBox76 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox76:setParent(obj.layout31);
    obj.imageCheckBox76:setLeft(180);
    obj.imageCheckBox76:setTop(0);
    obj.imageCheckBox76:setWidth(25);
    obj.imageCheckBox76:setHeight(25);
    obj.imageCheckBox76:setField("intimidation_5");
    obj.imageCheckBox76:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox76:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox76:setName("imageCheckBox76");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout23);
    obj.layout32:setLeft(15);
    obj.layout32:setTop(225);
    obj.layout32:setWidth(205);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout32);
    obj.label34:setLeft(0);
    obj.label34:setTop(5);
    obj.label34:setWidth(80);
    obj.label34:setHeight(20);
    obj.label34:setText("Leadership");
    obj.label34:setName("label34");

    obj.imageCheckBox77 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox77:setParent(obj.layout32);
    obj.imageCheckBox77:setLeft(80);
    obj.imageCheckBox77:setTop(0);
    obj.imageCheckBox77:setWidth(25);
    obj.imageCheckBox77:setHeight(25);
    obj.imageCheckBox77:setField("leadership_1");
    obj.imageCheckBox77:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox77:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox77:setName("imageCheckBox77");

    obj.imageCheckBox78 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox78:setParent(obj.layout32);
    obj.imageCheckBox78:setLeft(105);
    obj.imageCheckBox78:setTop(0);
    obj.imageCheckBox78:setWidth(25);
    obj.imageCheckBox78:setHeight(25);
    obj.imageCheckBox78:setField("leadership_2");
    obj.imageCheckBox78:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox78:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox78:setName("imageCheckBox78");

    obj.imageCheckBox79 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox79:setParent(obj.layout32);
    obj.imageCheckBox79:setLeft(130);
    obj.imageCheckBox79:setTop(0);
    obj.imageCheckBox79:setWidth(25);
    obj.imageCheckBox79:setHeight(25);
    obj.imageCheckBox79:setField("leadership_3");
    obj.imageCheckBox79:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox79:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox79:setName("imageCheckBox79");

    obj.imageCheckBox80 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox80:setParent(obj.layout32);
    obj.imageCheckBox80:setLeft(155);
    obj.imageCheckBox80:setTop(0);
    obj.imageCheckBox80:setWidth(25);
    obj.imageCheckBox80:setHeight(25);
    obj.imageCheckBox80:setField("leadership_4");
    obj.imageCheckBox80:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox80:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox80:setName("imageCheckBox80");

    obj.imageCheckBox81 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox81:setParent(obj.layout32);
    obj.imageCheckBox81:setLeft(180);
    obj.imageCheckBox81:setTop(0);
    obj.imageCheckBox81:setWidth(25);
    obj.imageCheckBox81:setHeight(25);
    obj.imageCheckBox81:setField("leadership_5");
    obj.imageCheckBox81:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox81:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox81:setName("imageCheckBox81");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout23);
    obj.layout33:setLeft(15);
    obj.layout33:setTop(250);
    obj.layout33:setWidth(205);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout33);
    obj.label35:setLeft(0);
    obj.label35:setTop(5);
    obj.label35:setWidth(80);
    obj.label35:setHeight(20);
    obj.label35:setText("Subterfuge");
    obj.label35:setName("label35");

    obj.imageCheckBox82 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox82:setParent(obj.layout33);
    obj.imageCheckBox82:setLeft(80);
    obj.imageCheckBox82:setTop(0);
    obj.imageCheckBox82:setWidth(25);
    obj.imageCheckBox82:setHeight(25);
    obj.imageCheckBox82:setField("subterfuge_1");
    obj.imageCheckBox82:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox82:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox82:setName("imageCheckBox82");

    obj.imageCheckBox83 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox83:setParent(obj.layout33);
    obj.imageCheckBox83:setLeft(105);
    obj.imageCheckBox83:setTop(0);
    obj.imageCheckBox83:setWidth(25);
    obj.imageCheckBox83:setHeight(25);
    obj.imageCheckBox83:setField("subterfuge_2");
    obj.imageCheckBox83:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox83:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox83:setName("imageCheckBox83");

    obj.imageCheckBox84 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox84:setParent(obj.layout33);
    obj.imageCheckBox84:setLeft(130);
    obj.imageCheckBox84:setTop(0);
    obj.imageCheckBox84:setWidth(25);
    obj.imageCheckBox84:setHeight(25);
    obj.imageCheckBox84:setField("subterfuge_3");
    obj.imageCheckBox84:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox84:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox84:setName("imageCheckBox84");

    obj.imageCheckBox85 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox85:setParent(obj.layout33);
    obj.imageCheckBox85:setLeft(155);
    obj.imageCheckBox85:setTop(0);
    obj.imageCheckBox85:setWidth(25);
    obj.imageCheckBox85:setHeight(25);
    obj.imageCheckBox85:setField("subterfuge_4");
    obj.imageCheckBox85:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox85:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox85:setName("imageCheckBox85");

    obj.imageCheckBox86 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox86:setParent(obj.layout33);
    obj.imageCheckBox86:setLeft(180);
    obj.imageCheckBox86:setTop(0);
    obj.imageCheckBox86:setWidth(25);
    obj.imageCheckBox86:setHeight(25);
    obj.imageCheckBox86:setField("subterfuge_5");
    obj.imageCheckBox86:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox86:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox86:setName("imageCheckBox86");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout23);
    obj.layout34:setLeft(15);
    obj.layout34:setTop(275);
    obj.layout34:setWidth(205);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout34);
    obj.edit11:setLeft(0);
    obj.edit11:setTop(5);
    obj.edit11:setWidth(75);
    obj.edit11:setHeight(20);
    obj.edit11:setField("talent_11");
    obj.edit11:setFontSize(12);
    obj.edit11:setName("edit11");

    obj.imageCheckBox87 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox87:setParent(obj.layout34);
    obj.imageCheckBox87:setLeft(80);
    obj.imageCheckBox87:setTop(0);
    obj.imageCheckBox87:setWidth(25);
    obj.imageCheckBox87:setHeight(25);
    obj.imageCheckBox87:setField("talent_11_1");
    obj.imageCheckBox87:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox87:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox87:setName("imageCheckBox87");

    obj.imageCheckBox88 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox88:setParent(obj.layout34);
    obj.imageCheckBox88:setLeft(105);
    obj.imageCheckBox88:setTop(0);
    obj.imageCheckBox88:setWidth(25);
    obj.imageCheckBox88:setHeight(25);
    obj.imageCheckBox88:setField("talent_11_2");
    obj.imageCheckBox88:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox88:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox88:setName("imageCheckBox88");

    obj.imageCheckBox89 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox89:setParent(obj.layout34);
    obj.imageCheckBox89:setLeft(130);
    obj.imageCheckBox89:setTop(0);
    obj.imageCheckBox89:setWidth(25);
    obj.imageCheckBox89:setHeight(25);
    obj.imageCheckBox89:setField("talent_11_3");
    obj.imageCheckBox89:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox89:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox89:setName("imageCheckBox89");

    obj.imageCheckBox90 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox90:setParent(obj.layout34);
    obj.imageCheckBox90:setLeft(155);
    obj.imageCheckBox90:setTop(0);
    obj.imageCheckBox90:setWidth(25);
    obj.imageCheckBox90:setHeight(25);
    obj.imageCheckBox90:setField("talent_11_4");
    obj.imageCheckBox90:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox90:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox90:setName("imageCheckBox90");

    obj.imageCheckBox91 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox91:setParent(obj.layout34);
    obj.imageCheckBox91:setLeft(180);
    obj.imageCheckBox91:setTop(0);
    obj.imageCheckBox91:setWidth(25);
    obj.imageCheckBox91:setHeight(25);
    obj.imageCheckBox91:setField("talent_11_5");
    obj.imageCheckBox91:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox91:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox91:setName("imageCheckBox91");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout23);
    obj.layout35:setLeft(15);
    obj.layout35:setTop(300);
    obj.layout35:setWidth(205);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout35);
    obj.edit12:setLeft(0);
    obj.edit12:setTop(5);
    obj.edit12:setWidth(75);
    obj.edit12:setHeight(20);
    obj.edit12:setField("talent_12");
    obj.edit12:setFontSize(12);
    obj.edit12:setName("edit12");

    obj.imageCheckBox92 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox92:setParent(obj.layout35);
    obj.imageCheckBox92:setLeft(80);
    obj.imageCheckBox92:setTop(0);
    obj.imageCheckBox92:setWidth(25);
    obj.imageCheckBox92:setHeight(25);
    obj.imageCheckBox92:setField("talent_12_1");
    obj.imageCheckBox92:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox92:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox92:setName("imageCheckBox92");

    obj.imageCheckBox93 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox93:setParent(obj.layout35);
    obj.imageCheckBox93:setLeft(105);
    obj.imageCheckBox93:setTop(0);
    obj.imageCheckBox93:setWidth(25);
    obj.imageCheckBox93:setHeight(25);
    obj.imageCheckBox93:setField("talent_12_2");
    obj.imageCheckBox93:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox93:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox93:setName("imageCheckBox93");

    obj.imageCheckBox94 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox94:setParent(obj.layout35);
    obj.imageCheckBox94:setLeft(130);
    obj.imageCheckBox94:setTop(0);
    obj.imageCheckBox94:setWidth(25);
    obj.imageCheckBox94:setHeight(25);
    obj.imageCheckBox94:setField("talent_12_3");
    obj.imageCheckBox94:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox94:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox94:setName("imageCheckBox94");

    obj.imageCheckBox95 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox95:setParent(obj.layout35);
    obj.imageCheckBox95:setLeft(155);
    obj.imageCheckBox95:setTop(0);
    obj.imageCheckBox95:setWidth(25);
    obj.imageCheckBox95:setHeight(25);
    obj.imageCheckBox95:setField("talent_12_4");
    obj.imageCheckBox95:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox95:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox95:setName("imageCheckBox95");

    obj.imageCheckBox96 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox96:setParent(obj.layout35);
    obj.imageCheckBox96:setLeft(180);
    obj.imageCheckBox96:setTop(0);
    obj.imageCheckBox96:setWidth(25);
    obj.imageCheckBox96:setHeight(25);
    obj.imageCheckBox96:setField("talent_12_5");
    obj.imageCheckBox96:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox96:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox96:setName("imageCheckBox96");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout22);
    obj.layout36:setLeft(260);
    obj.layout36:setTop(30);
    obj.layout36:setWidth(240);
    obj.layout36:setHeight(340);
    obj.layout36:setName("layout36");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout36);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setName("rectangle7");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout36);
    obj.label36:setLeft(5);
    obj.label36:setTop(0);
    obj.label36:setWidth(240);
    obj.label36:setHeight(20);
    obj.label36:setText("SKILLS");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setLeft(15);
    obj.layout37:setTop(25);
    obj.layout37:setWidth(205);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout37);
    obj.label37:setLeft(0);
    obj.label37:setTop(5);
    obj.label37:setWidth(80);
    obj.label37:setHeight(20);
    obj.label37:setText("Animal Ken");
    obj.label37:setName("label37");

    obj.imageCheckBox97 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox97:setParent(obj.layout37);
    obj.imageCheckBox97:setLeft(80);
    obj.imageCheckBox97:setTop(0);
    obj.imageCheckBox97:setWidth(25);
    obj.imageCheckBox97:setHeight(25);
    obj.imageCheckBox97:setField("animalKen_1");
    obj.imageCheckBox97:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox97:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox97:setName("imageCheckBox97");

    obj.imageCheckBox98 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox98:setParent(obj.layout37);
    obj.imageCheckBox98:setLeft(105);
    obj.imageCheckBox98:setTop(0);
    obj.imageCheckBox98:setWidth(25);
    obj.imageCheckBox98:setHeight(25);
    obj.imageCheckBox98:setField("animalKen_2");
    obj.imageCheckBox98:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox98:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox98:setName("imageCheckBox98");

    obj.imageCheckBox99 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox99:setParent(obj.layout37);
    obj.imageCheckBox99:setLeft(130);
    obj.imageCheckBox99:setTop(0);
    obj.imageCheckBox99:setWidth(25);
    obj.imageCheckBox99:setHeight(25);
    obj.imageCheckBox99:setField("animalKen_3");
    obj.imageCheckBox99:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox99:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox99:setName("imageCheckBox99");

    obj.imageCheckBox100 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox100:setParent(obj.layout37);
    obj.imageCheckBox100:setLeft(155);
    obj.imageCheckBox100:setTop(0);
    obj.imageCheckBox100:setWidth(25);
    obj.imageCheckBox100:setHeight(25);
    obj.imageCheckBox100:setField("animalKen_4");
    obj.imageCheckBox100:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox100:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox100:setName("imageCheckBox100");

    obj.imageCheckBox101 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox101:setParent(obj.layout37);
    obj.imageCheckBox101:setLeft(180);
    obj.imageCheckBox101:setTop(0);
    obj.imageCheckBox101:setWidth(25);
    obj.imageCheckBox101:setHeight(25);
    obj.imageCheckBox101:setField("animalKen_5");
    obj.imageCheckBox101:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox101:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox101:setName("imageCheckBox101");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout36);
    obj.layout38:setLeft(15);
    obj.layout38:setTop(50);
    obj.layout38:setWidth(205);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout38);
    obj.label38:setLeft(0);
    obj.label38:setTop(5);
    obj.label38:setWidth(80);
    obj.label38:setHeight(20);
    obj.label38:setText("Archery");
    obj.label38:setName("label38");

    obj.imageCheckBox102 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox102:setParent(obj.layout38);
    obj.imageCheckBox102:setLeft(80);
    obj.imageCheckBox102:setTop(0);
    obj.imageCheckBox102:setWidth(25);
    obj.imageCheckBox102:setHeight(25);
    obj.imageCheckBox102:setField("archery_1");
    obj.imageCheckBox102:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox102:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox102:setName("imageCheckBox102");

    obj.imageCheckBox103 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox103:setParent(obj.layout38);
    obj.imageCheckBox103:setLeft(105);
    obj.imageCheckBox103:setTop(0);
    obj.imageCheckBox103:setWidth(25);
    obj.imageCheckBox103:setHeight(25);
    obj.imageCheckBox103:setField("archery_2");
    obj.imageCheckBox103:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox103:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox103:setName("imageCheckBox103");

    obj.imageCheckBox104 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox104:setParent(obj.layout38);
    obj.imageCheckBox104:setLeft(130);
    obj.imageCheckBox104:setTop(0);
    obj.imageCheckBox104:setWidth(25);
    obj.imageCheckBox104:setHeight(25);
    obj.imageCheckBox104:setField("archery_3");
    obj.imageCheckBox104:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox104:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox104:setName("imageCheckBox104");

    obj.imageCheckBox105 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox105:setParent(obj.layout38);
    obj.imageCheckBox105:setLeft(155);
    obj.imageCheckBox105:setTop(0);
    obj.imageCheckBox105:setWidth(25);
    obj.imageCheckBox105:setHeight(25);
    obj.imageCheckBox105:setField("archery_4");
    obj.imageCheckBox105:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox105:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox105:setName("imageCheckBox105");

    obj.imageCheckBox106 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox106:setParent(obj.layout38);
    obj.imageCheckBox106:setLeft(180);
    obj.imageCheckBox106:setTop(0);
    obj.imageCheckBox106:setWidth(25);
    obj.imageCheckBox106:setHeight(25);
    obj.imageCheckBox106:setField("archery_5");
    obj.imageCheckBox106:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox106:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox106:setName("imageCheckBox106");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout36);
    obj.layout39:setLeft(15);
    obj.layout39:setTop(75);
    obj.layout39:setWidth(205);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout39);
    obj.label39:setLeft(0);
    obj.label39:setTop(5);
    obj.label39:setWidth(80);
    obj.label39:setHeight(20);
    obj.label39:setText("Crafts");
    obj.label39:setName("label39");

    obj.imageCheckBox107 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox107:setParent(obj.layout39);
    obj.imageCheckBox107:setLeft(80);
    obj.imageCheckBox107:setTop(0);
    obj.imageCheckBox107:setWidth(25);
    obj.imageCheckBox107:setHeight(25);
    obj.imageCheckBox107:setField("crafts_1");
    obj.imageCheckBox107:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox107:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox107:setName("imageCheckBox107");

    obj.imageCheckBox108 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox108:setParent(obj.layout39);
    obj.imageCheckBox108:setLeft(105);
    obj.imageCheckBox108:setTop(0);
    obj.imageCheckBox108:setWidth(25);
    obj.imageCheckBox108:setHeight(25);
    obj.imageCheckBox108:setField("crafts_2");
    obj.imageCheckBox108:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox108:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox108:setName("imageCheckBox108");

    obj.imageCheckBox109 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox109:setParent(obj.layout39);
    obj.imageCheckBox109:setLeft(130);
    obj.imageCheckBox109:setTop(0);
    obj.imageCheckBox109:setWidth(25);
    obj.imageCheckBox109:setHeight(25);
    obj.imageCheckBox109:setField("crafts_3");
    obj.imageCheckBox109:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox109:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox109:setName("imageCheckBox109");

    obj.imageCheckBox110 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox110:setParent(obj.layout39);
    obj.imageCheckBox110:setLeft(155);
    obj.imageCheckBox110:setTop(0);
    obj.imageCheckBox110:setWidth(25);
    obj.imageCheckBox110:setHeight(25);
    obj.imageCheckBox110:setField("crafts_4");
    obj.imageCheckBox110:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox110:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox110:setName("imageCheckBox110");

    obj.imageCheckBox111 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox111:setParent(obj.layout39);
    obj.imageCheckBox111:setLeft(180);
    obj.imageCheckBox111:setTop(0);
    obj.imageCheckBox111:setWidth(25);
    obj.imageCheckBox111:setHeight(25);
    obj.imageCheckBox111:setField("crafts_5");
    obj.imageCheckBox111:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox111:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox111:setName("imageCheckBox111");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout36);
    obj.layout40:setLeft(15);
    obj.layout40:setTop(100);
    obj.layout40:setWidth(205);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout40);
    obj.label40:setLeft(0);
    obj.label40:setTop(5);
    obj.label40:setWidth(80);
    obj.label40:setHeight(20);
    obj.label40:setText("Etiquette");
    obj.label40:setName("label40");

    obj.imageCheckBox112 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox112:setParent(obj.layout40);
    obj.imageCheckBox112:setLeft(80);
    obj.imageCheckBox112:setTop(0);
    obj.imageCheckBox112:setWidth(25);
    obj.imageCheckBox112:setHeight(25);
    obj.imageCheckBox112:setField("etiquette_1");
    obj.imageCheckBox112:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox112:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox112:setName("imageCheckBox112");

    obj.imageCheckBox113 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox113:setParent(obj.layout40);
    obj.imageCheckBox113:setLeft(105);
    obj.imageCheckBox113:setTop(0);
    obj.imageCheckBox113:setWidth(25);
    obj.imageCheckBox113:setHeight(25);
    obj.imageCheckBox113:setField("etiquette_2");
    obj.imageCheckBox113:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox113:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox113:setName("imageCheckBox113");

    obj.imageCheckBox114 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox114:setParent(obj.layout40);
    obj.imageCheckBox114:setLeft(130);
    obj.imageCheckBox114:setTop(0);
    obj.imageCheckBox114:setWidth(25);
    obj.imageCheckBox114:setHeight(25);
    obj.imageCheckBox114:setField("etiquette_3");
    obj.imageCheckBox114:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox114:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox114:setName("imageCheckBox114");

    obj.imageCheckBox115 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox115:setParent(obj.layout40);
    obj.imageCheckBox115:setLeft(155);
    obj.imageCheckBox115:setTop(0);
    obj.imageCheckBox115:setWidth(25);
    obj.imageCheckBox115:setHeight(25);
    obj.imageCheckBox115:setField("etiquette_4");
    obj.imageCheckBox115:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox115:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox115:setName("imageCheckBox115");

    obj.imageCheckBox116 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox116:setParent(obj.layout40);
    obj.imageCheckBox116:setLeft(180);
    obj.imageCheckBox116:setTop(0);
    obj.imageCheckBox116:setWidth(25);
    obj.imageCheckBox116:setHeight(25);
    obj.imageCheckBox116:setField("etiquette_5");
    obj.imageCheckBox116:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox116:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox116:setName("imageCheckBox116");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout36);
    obj.layout41:setLeft(15);
    obj.layout41:setTop(125);
    obj.layout41:setWidth(205);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout41);
    obj.label41:setLeft(0);
    obj.label41:setTop(5);
    obj.label41:setWidth(80);
    obj.label41:setHeight(20);
    obj.label41:setText("Herbalism");
    obj.label41:setName("label41");

    obj.imageCheckBox117 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox117:setParent(obj.layout41);
    obj.imageCheckBox117:setLeft(80);
    obj.imageCheckBox117:setTop(0);
    obj.imageCheckBox117:setWidth(25);
    obj.imageCheckBox117:setHeight(25);
    obj.imageCheckBox117:setField("herbalism_1");
    obj.imageCheckBox117:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox117:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox117:setName("imageCheckBox117");

    obj.imageCheckBox118 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox118:setParent(obj.layout41);
    obj.imageCheckBox118:setLeft(105);
    obj.imageCheckBox118:setTop(0);
    obj.imageCheckBox118:setWidth(25);
    obj.imageCheckBox118:setHeight(25);
    obj.imageCheckBox118:setField("herbalism_2");
    obj.imageCheckBox118:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox118:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox118:setName("imageCheckBox118");

    obj.imageCheckBox119 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox119:setParent(obj.layout41);
    obj.imageCheckBox119:setLeft(130);
    obj.imageCheckBox119:setTop(0);
    obj.imageCheckBox119:setWidth(25);
    obj.imageCheckBox119:setHeight(25);
    obj.imageCheckBox119:setField("herbalism_3");
    obj.imageCheckBox119:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox119:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox119:setName("imageCheckBox119");

    obj.imageCheckBox120 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox120:setParent(obj.layout41);
    obj.imageCheckBox120:setLeft(155);
    obj.imageCheckBox120:setTop(0);
    obj.imageCheckBox120:setWidth(25);
    obj.imageCheckBox120:setHeight(25);
    obj.imageCheckBox120:setField("herbalism_4");
    obj.imageCheckBox120:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox120:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox120:setName("imageCheckBox120");

    obj.imageCheckBox121 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox121:setParent(obj.layout41);
    obj.imageCheckBox121:setLeft(180);
    obj.imageCheckBox121:setTop(0);
    obj.imageCheckBox121:setWidth(25);
    obj.imageCheckBox121:setHeight(25);
    obj.imageCheckBox121:setField("herbalism_5");
    obj.imageCheckBox121:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox121:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox121:setName("imageCheckBox121");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout36);
    obj.layout42:setLeft(15);
    obj.layout42:setTop(150);
    obj.layout42:setWidth(205);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout42);
    obj.label42:setLeft(0);
    obj.label42:setTop(5);
    obj.label42:setWidth(80);
    obj.label42:setHeight(20);
    obj.label42:setText("Melee");
    obj.label42:setName("label42");

    obj.imageCheckBox122 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox122:setParent(obj.layout42);
    obj.imageCheckBox122:setLeft(80);
    obj.imageCheckBox122:setTop(0);
    obj.imageCheckBox122:setWidth(25);
    obj.imageCheckBox122:setHeight(25);
    obj.imageCheckBox122:setField("melee_1");
    obj.imageCheckBox122:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox122:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox122:setName("imageCheckBox122");

    obj.imageCheckBox123 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox123:setParent(obj.layout42);
    obj.imageCheckBox123:setLeft(105);
    obj.imageCheckBox123:setTop(0);
    obj.imageCheckBox123:setWidth(25);
    obj.imageCheckBox123:setHeight(25);
    obj.imageCheckBox123:setField("melee_2");
    obj.imageCheckBox123:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox123:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox123:setName("imageCheckBox123");

    obj.imageCheckBox124 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox124:setParent(obj.layout42);
    obj.imageCheckBox124:setLeft(130);
    obj.imageCheckBox124:setTop(0);
    obj.imageCheckBox124:setWidth(25);
    obj.imageCheckBox124:setHeight(25);
    obj.imageCheckBox124:setField("melee_3");
    obj.imageCheckBox124:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox124:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox124:setName("imageCheckBox124");

    obj.imageCheckBox125 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox125:setParent(obj.layout42);
    obj.imageCheckBox125:setLeft(155);
    obj.imageCheckBox125:setTop(0);
    obj.imageCheckBox125:setWidth(25);
    obj.imageCheckBox125:setHeight(25);
    obj.imageCheckBox125:setField("melee_4");
    obj.imageCheckBox125:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox125:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox125:setName("imageCheckBox125");

    obj.imageCheckBox126 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox126:setParent(obj.layout42);
    obj.imageCheckBox126:setLeft(180);
    obj.imageCheckBox126:setTop(0);
    obj.imageCheckBox126:setWidth(25);
    obj.imageCheckBox126:setHeight(25);
    obj.imageCheckBox126:setField("melee_5");
    obj.imageCheckBox126:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox126:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox126:setName("imageCheckBox126");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout36);
    obj.layout43:setLeft(15);
    obj.layout43:setTop(175);
    obj.layout43:setWidth(205);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout43);
    obj.label43:setLeft(0);
    obj.label43:setTop(5);
    obj.label43:setWidth(80);
    obj.label43:setHeight(20);
    obj.label43:setText("Performance");
    obj.label43:setName("label43");

    obj.imageCheckBox127 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox127:setParent(obj.layout43);
    obj.imageCheckBox127:setLeft(80);
    obj.imageCheckBox127:setTop(0);
    obj.imageCheckBox127:setWidth(25);
    obj.imageCheckBox127:setHeight(25);
    obj.imageCheckBox127:setField("performance_1");
    obj.imageCheckBox127:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox127:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox127:setName("imageCheckBox127");

    obj.imageCheckBox128 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox128:setParent(obj.layout43);
    obj.imageCheckBox128:setLeft(105);
    obj.imageCheckBox128:setTop(0);
    obj.imageCheckBox128:setWidth(25);
    obj.imageCheckBox128:setHeight(25);
    obj.imageCheckBox128:setField("performance_2");
    obj.imageCheckBox128:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox128:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox128:setName("imageCheckBox128");

    obj.imageCheckBox129 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox129:setParent(obj.layout43);
    obj.imageCheckBox129:setLeft(130);
    obj.imageCheckBox129:setTop(0);
    obj.imageCheckBox129:setWidth(25);
    obj.imageCheckBox129:setHeight(25);
    obj.imageCheckBox129:setField("performance_3");
    obj.imageCheckBox129:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox129:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox129:setName("imageCheckBox129");

    obj.imageCheckBox130 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox130:setParent(obj.layout43);
    obj.imageCheckBox130:setLeft(155);
    obj.imageCheckBox130:setTop(0);
    obj.imageCheckBox130:setWidth(25);
    obj.imageCheckBox130:setHeight(25);
    obj.imageCheckBox130:setField("performance_4");
    obj.imageCheckBox130:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox130:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox130:setName("imageCheckBox130");

    obj.imageCheckBox131 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox131:setParent(obj.layout43);
    obj.imageCheckBox131:setLeft(180);
    obj.imageCheckBox131:setTop(0);
    obj.imageCheckBox131:setWidth(25);
    obj.imageCheckBox131:setHeight(25);
    obj.imageCheckBox131:setField("performance_5");
    obj.imageCheckBox131:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox131:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox131:setName("imageCheckBox131");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout36);
    obj.layout44:setLeft(15);
    obj.layout44:setTop(200);
    obj.layout44:setWidth(205);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout44);
    obj.label44:setLeft(0);
    obj.label44:setTop(5);
    obj.label44:setWidth(80);
    obj.label44:setHeight(20);
    obj.label44:setText("Ride");
    obj.label44:setName("label44");

    obj.imageCheckBox132 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox132:setParent(obj.layout44);
    obj.imageCheckBox132:setLeft(80);
    obj.imageCheckBox132:setTop(0);
    obj.imageCheckBox132:setWidth(25);
    obj.imageCheckBox132:setHeight(25);
    obj.imageCheckBox132:setField("ride_1");
    obj.imageCheckBox132:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox132:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox132:setName("imageCheckBox132");

    obj.imageCheckBox133 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox133:setParent(obj.layout44);
    obj.imageCheckBox133:setLeft(105);
    obj.imageCheckBox133:setTop(0);
    obj.imageCheckBox133:setWidth(25);
    obj.imageCheckBox133:setHeight(25);
    obj.imageCheckBox133:setField("ride_2");
    obj.imageCheckBox133:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox133:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox133:setName("imageCheckBox133");

    obj.imageCheckBox134 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox134:setParent(obj.layout44);
    obj.imageCheckBox134:setLeft(130);
    obj.imageCheckBox134:setTop(0);
    obj.imageCheckBox134:setWidth(25);
    obj.imageCheckBox134:setHeight(25);
    obj.imageCheckBox134:setField("ride_3");
    obj.imageCheckBox134:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox134:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox134:setName("imageCheckBox134");

    obj.imageCheckBox135 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox135:setParent(obj.layout44);
    obj.imageCheckBox135:setLeft(155);
    obj.imageCheckBox135:setTop(0);
    obj.imageCheckBox135:setWidth(25);
    obj.imageCheckBox135:setHeight(25);
    obj.imageCheckBox135:setField("ride_4");
    obj.imageCheckBox135:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox135:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox135:setName("imageCheckBox135");

    obj.imageCheckBox136 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox136:setParent(obj.layout44);
    obj.imageCheckBox136:setLeft(180);
    obj.imageCheckBox136:setTop(0);
    obj.imageCheckBox136:setWidth(25);
    obj.imageCheckBox136:setHeight(25);
    obj.imageCheckBox136:setField("ride_5");
    obj.imageCheckBox136:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox136:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox136:setName("imageCheckBox136");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout36);
    obj.layout45:setLeft(15);
    obj.layout45:setTop(225);
    obj.layout45:setWidth(205);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout45);
    obj.label45:setLeft(0);
    obj.label45:setTop(5);
    obj.label45:setWidth(80);
    obj.label45:setHeight(20);
    obj.label45:setText("Stealth");
    obj.label45:setName("label45");

    obj.imageCheckBox137 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox137:setParent(obj.layout45);
    obj.imageCheckBox137:setLeft(80);
    obj.imageCheckBox137:setTop(0);
    obj.imageCheckBox137:setWidth(25);
    obj.imageCheckBox137:setHeight(25);
    obj.imageCheckBox137:setField("stealth_1");
    obj.imageCheckBox137:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox137:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox137:setName("imageCheckBox137");

    obj.imageCheckBox138 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox138:setParent(obj.layout45);
    obj.imageCheckBox138:setLeft(105);
    obj.imageCheckBox138:setTop(0);
    obj.imageCheckBox138:setWidth(25);
    obj.imageCheckBox138:setHeight(25);
    obj.imageCheckBox138:setField("stealth_2");
    obj.imageCheckBox138:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox138:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox138:setName("imageCheckBox138");

    obj.imageCheckBox139 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox139:setParent(obj.layout45);
    obj.imageCheckBox139:setLeft(130);
    obj.imageCheckBox139:setTop(0);
    obj.imageCheckBox139:setWidth(25);
    obj.imageCheckBox139:setHeight(25);
    obj.imageCheckBox139:setField("stealth_3");
    obj.imageCheckBox139:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox139:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox139:setName("imageCheckBox139");

    obj.imageCheckBox140 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox140:setParent(obj.layout45);
    obj.imageCheckBox140:setLeft(155);
    obj.imageCheckBox140:setTop(0);
    obj.imageCheckBox140:setWidth(25);
    obj.imageCheckBox140:setHeight(25);
    obj.imageCheckBox140:setField("stealth_4");
    obj.imageCheckBox140:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox140:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox140:setName("imageCheckBox140");

    obj.imageCheckBox141 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox141:setParent(obj.layout45);
    obj.imageCheckBox141:setLeft(180);
    obj.imageCheckBox141:setTop(0);
    obj.imageCheckBox141:setWidth(25);
    obj.imageCheckBox141:setHeight(25);
    obj.imageCheckBox141:setField("stealth_5");
    obj.imageCheckBox141:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox141:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox141:setName("imageCheckBox141");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout36);
    obj.layout46:setLeft(15);
    obj.layout46:setTop(250);
    obj.layout46:setWidth(205);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout46);
    obj.label46:setLeft(0);
    obj.label46:setTop(5);
    obj.label46:setWidth(80);
    obj.label46:setHeight(20);
    obj.label46:setText("Survival");
    obj.label46:setName("label46");

    obj.imageCheckBox142 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox142:setParent(obj.layout46);
    obj.imageCheckBox142:setLeft(80);
    obj.imageCheckBox142:setTop(0);
    obj.imageCheckBox142:setWidth(25);
    obj.imageCheckBox142:setHeight(25);
    obj.imageCheckBox142:setField("survival_1");
    obj.imageCheckBox142:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox142:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox142:setName("imageCheckBox142");

    obj.imageCheckBox143 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox143:setParent(obj.layout46);
    obj.imageCheckBox143:setLeft(105);
    obj.imageCheckBox143:setTop(0);
    obj.imageCheckBox143:setWidth(25);
    obj.imageCheckBox143:setHeight(25);
    obj.imageCheckBox143:setField("survival_2");
    obj.imageCheckBox143:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox143:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox143:setName("imageCheckBox143");

    obj.imageCheckBox144 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox144:setParent(obj.layout46);
    obj.imageCheckBox144:setLeft(130);
    obj.imageCheckBox144:setTop(0);
    obj.imageCheckBox144:setWidth(25);
    obj.imageCheckBox144:setHeight(25);
    obj.imageCheckBox144:setField("survival_3");
    obj.imageCheckBox144:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox144:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox144:setName("imageCheckBox144");

    obj.imageCheckBox145 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox145:setParent(obj.layout46);
    obj.imageCheckBox145:setLeft(155);
    obj.imageCheckBox145:setTop(0);
    obj.imageCheckBox145:setWidth(25);
    obj.imageCheckBox145:setHeight(25);
    obj.imageCheckBox145:setField("survival_4");
    obj.imageCheckBox145:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox145:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox145:setName("imageCheckBox145");

    obj.imageCheckBox146 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox146:setParent(obj.layout46);
    obj.imageCheckBox146:setLeft(180);
    obj.imageCheckBox146:setTop(0);
    obj.imageCheckBox146:setWidth(25);
    obj.imageCheckBox146:setHeight(25);
    obj.imageCheckBox146:setField("survival_5");
    obj.imageCheckBox146:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox146:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox146:setName("imageCheckBox146");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout36);
    obj.layout47:setLeft(15);
    obj.layout47:setTop(275);
    obj.layout47:setWidth(205);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout47);
    obj.edit13:setLeft(0);
    obj.edit13:setTop(5);
    obj.edit13:setWidth(75);
    obj.edit13:setHeight(20);
    obj.edit13:setField("skill_11");
    obj.edit13:setFontSize(12);
    obj.edit13:setName("edit13");

    obj.imageCheckBox147 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox147:setParent(obj.layout47);
    obj.imageCheckBox147:setLeft(80);
    obj.imageCheckBox147:setTop(0);
    obj.imageCheckBox147:setWidth(25);
    obj.imageCheckBox147:setHeight(25);
    obj.imageCheckBox147:setField("skill_11_1");
    obj.imageCheckBox147:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox147:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox147:setName("imageCheckBox147");

    obj.imageCheckBox148 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox148:setParent(obj.layout47);
    obj.imageCheckBox148:setLeft(105);
    obj.imageCheckBox148:setTop(0);
    obj.imageCheckBox148:setWidth(25);
    obj.imageCheckBox148:setHeight(25);
    obj.imageCheckBox148:setField("skill_11_2");
    obj.imageCheckBox148:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox148:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox148:setName("imageCheckBox148");

    obj.imageCheckBox149 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox149:setParent(obj.layout47);
    obj.imageCheckBox149:setLeft(130);
    obj.imageCheckBox149:setTop(0);
    obj.imageCheckBox149:setWidth(25);
    obj.imageCheckBox149:setHeight(25);
    obj.imageCheckBox149:setField("skill_11_3");
    obj.imageCheckBox149:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox149:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox149:setName("imageCheckBox149");

    obj.imageCheckBox150 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox150:setParent(obj.layout47);
    obj.imageCheckBox150:setLeft(155);
    obj.imageCheckBox150:setTop(0);
    obj.imageCheckBox150:setWidth(25);
    obj.imageCheckBox150:setHeight(25);
    obj.imageCheckBox150:setField("skill_11_4");
    obj.imageCheckBox150:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox150:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox150:setName("imageCheckBox150");

    obj.imageCheckBox151 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox151:setParent(obj.layout47);
    obj.imageCheckBox151:setLeft(180);
    obj.imageCheckBox151:setTop(0);
    obj.imageCheckBox151:setWidth(25);
    obj.imageCheckBox151:setHeight(25);
    obj.imageCheckBox151:setField("skill_11_5");
    obj.imageCheckBox151:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox151:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox151:setName("imageCheckBox151");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout36);
    obj.layout48:setLeft(15);
    obj.layout48:setTop(300);
    obj.layout48:setWidth(205);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout48);
    obj.edit14:setLeft(0);
    obj.edit14:setTop(5);
    obj.edit14:setWidth(75);
    obj.edit14:setHeight(20);
    obj.edit14:setField("skill_12");
    obj.edit14:setFontSize(12);
    obj.edit14:setName("edit14");

    obj.imageCheckBox152 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox152:setParent(obj.layout48);
    obj.imageCheckBox152:setLeft(80);
    obj.imageCheckBox152:setTop(0);
    obj.imageCheckBox152:setWidth(25);
    obj.imageCheckBox152:setHeight(25);
    obj.imageCheckBox152:setField("skill_12_1");
    obj.imageCheckBox152:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox152:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox152:setName("imageCheckBox152");

    obj.imageCheckBox153 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox153:setParent(obj.layout48);
    obj.imageCheckBox153:setLeft(105);
    obj.imageCheckBox153:setTop(0);
    obj.imageCheckBox153:setWidth(25);
    obj.imageCheckBox153:setHeight(25);
    obj.imageCheckBox153:setField("skill_12_2");
    obj.imageCheckBox153:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox153:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox153:setName("imageCheckBox153");

    obj.imageCheckBox154 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox154:setParent(obj.layout48);
    obj.imageCheckBox154:setLeft(130);
    obj.imageCheckBox154:setTop(0);
    obj.imageCheckBox154:setWidth(25);
    obj.imageCheckBox154:setHeight(25);
    obj.imageCheckBox154:setField("skill_12_3");
    obj.imageCheckBox154:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox154:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox154:setName("imageCheckBox154");

    obj.imageCheckBox155 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox155:setParent(obj.layout48);
    obj.imageCheckBox155:setLeft(155);
    obj.imageCheckBox155:setTop(0);
    obj.imageCheckBox155:setWidth(25);
    obj.imageCheckBox155:setHeight(25);
    obj.imageCheckBox155:setField("skill_12_4");
    obj.imageCheckBox155:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox155:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox155:setName("imageCheckBox155");

    obj.imageCheckBox156 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox156:setParent(obj.layout48);
    obj.imageCheckBox156:setLeft(180);
    obj.imageCheckBox156:setTop(0);
    obj.imageCheckBox156:setWidth(25);
    obj.imageCheckBox156:setHeight(25);
    obj.imageCheckBox156:setField("skill_12_5");
    obj.imageCheckBox156:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox156:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox156:setName("imageCheckBox156");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout22);
    obj.layout49:setLeft(510);
    obj.layout49:setTop(30);
    obj.layout49:setWidth(240);
    obj.layout49:setHeight(340);
    obj.layout49:setName("layout49");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout49);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setCornerType("innerLine");
    obj.rectangle8:setName("rectangle8");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout49);
    obj.label47:setLeft(5);
    obj.label47:setTop(0);
    obj.label47:setWidth(240);
    obj.label47:setHeight(20);
    obj.label47:setText("KNOWLEDGES");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setLeft(15);
    obj.layout50:setTop(25);
    obj.layout50:setWidth(205);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout50);
    obj.label48:setLeft(0);
    obj.label48:setTop(5);
    obj.label48:setWidth(80);
    obj.label48:setHeight(20);
    obj.label48:setText("Academics");
    obj.label48:setName("label48");

    obj.imageCheckBox157 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox157:setParent(obj.layout50);
    obj.imageCheckBox157:setLeft(80);
    obj.imageCheckBox157:setTop(0);
    obj.imageCheckBox157:setWidth(25);
    obj.imageCheckBox157:setHeight(25);
    obj.imageCheckBox157:setField("academics_1");
    obj.imageCheckBox157:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox157:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox157:setName("imageCheckBox157");

    obj.imageCheckBox158 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox158:setParent(obj.layout50);
    obj.imageCheckBox158:setLeft(105);
    obj.imageCheckBox158:setTop(0);
    obj.imageCheckBox158:setWidth(25);
    obj.imageCheckBox158:setHeight(25);
    obj.imageCheckBox158:setField("academics_2");
    obj.imageCheckBox158:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox158:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox158:setName("imageCheckBox158");

    obj.imageCheckBox159 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox159:setParent(obj.layout50);
    obj.imageCheckBox159:setLeft(130);
    obj.imageCheckBox159:setTop(0);
    obj.imageCheckBox159:setWidth(25);
    obj.imageCheckBox159:setHeight(25);
    obj.imageCheckBox159:setField("academics_3");
    obj.imageCheckBox159:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox159:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox159:setName("imageCheckBox159");

    obj.imageCheckBox160 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox160:setParent(obj.layout50);
    obj.imageCheckBox160:setLeft(155);
    obj.imageCheckBox160:setTop(0);
    obj.imageCheckBox160:setWidth(25);
    obj.imageCheckBox160:setHeight(25);
    obj.imageCheckBox160:setField("academics_4");
    obj.imageCheckBox160:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox160:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox160:setName("imageCheckBox160");

    obj.imageCheckBox161 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox161:setParent(obj.layout50);
    obj.imageCheckBox161:setLeft(180);
    obj.imageCheckBox161:setTop(0);
    obj.imageCheckBox161:setWidth(25);
    obj.imageCheckBox161:setHeight(25);
    obj.imageCheckBox161:setField("academics_5");
    obj.imageCheckBox161:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox161:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox161:setName("imageCheckBox161");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setLeft(15);
    obj.layout51:setTop(50);
    obj.layout51:setWidth(205);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout51);
    obj.label49:setLeft(0);
    obj.label49:setTop(5);
    obj.label49:setWidth(80);
    obj.label49:setHeight(20);
    obj.label49:setText("Cosmology");
    obj.label49:setName("label49");

    obj.imageCheckBox162 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox162:setParent(obj.layout51);
    obj.imageCheckBox162:setLeft(80);
    obj.imageCheckBox162:setTop(0);
    obj.imageCheckBox162:setWidth(25);
    obj.imageCheckBox162:setHeight(25);
    obj.imageCheckBox162:setField("cosmology_1");
    obj.imageCheckBox162:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox162:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox162:setName("imageCheckBox162");

    obj.imageCheckBox163 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox163:setParent(obj.layout51);
    obj.imageCheckBox163:setLeft(105);
    obj.imageCheckBox163:setTop(0);
    obj.imageCheckBox163:setWidth(25);
    obj.imageCheckBox163:setHeight(25);
    obj.imageCheckBox163:setField("cosmology_2");
    obj.imageCheckBox163:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox163:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox163:setName("imageCheckBox163");

    obj.imageCheckBox164 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox164:setParent(obj.layout51);
    obj.imageCheckBox164:setLeft(130);
    obj.imageCheckBox164:setTop(0);
    obj.imageCheckBox164:setWidth(25);
    obj.imageCheckBox164:setHeight(25);
    obj.imageCheckBox164:setField("cosmology_3");
    obj.imageCheckBox164:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox164:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox164:setName("imageCheckBox164");

    obj.imageCheckBox165 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox165:setParent(obj.layout51);
    obj.imageCheckBox165:setLeft(155);
    obj.imageCheckBox165:setTop(0);
    obj.imageCheckBox165:setWidth(25);
    obj.imageCheckBox165:setHeight(25);
    obj.imageCheckBox165:setField("cosmology_4");
    obj.imageCheckBox165:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox165:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox165:setName("imageCheckBox165");

    obj.imageCheckBox166 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox166:setParent(obj.layout51);
    obj.imageCheckBox166:setLeft(180);
    obj.imageCheckBox166:setTop(0);
    obj.imageCheckBox166:setWidth(25);
    obj.imageCheckBox166:setHeight(25);
    obj.imageCheckBox166:setField("cosmology_5");
    obj.imageCheckBox166:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox166:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox166:setName("imageCheckBox166");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setLeft(15);
    obj.layout52:setTop(75);
    obj.layout52:setWidth(205);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout52);
    obj.label50:setLeft(0);
    obj.label50:setTop(5);
    obj.label50:setWidth(80);
    obj.label50:setHeight(20);
    obj.label50:setText("Enigmas");
    obj.label50:setName("label50");

    obj.imageCheckBox167 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox167:setParent(obj.layout52);
    obj.imageCheckBox167:setLeft(80);
    obj.imageCheckBox167:setTop(0);
    obj.imageCheckBox167:setWidth(25);
    obj.imageCheckBox167:setHeight(25);
    obj.imageCheckBox167:setField("enigmas_1");
    obj.imageCheckBox167:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox167:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox167:setName("imageCheckBox167");

    obj.imageCheckBox168 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox168:setParent(obj.layout52);
    obj.imageCheckBox168:setLeft(105);
    obj.imageCheckBox168:setTop(0);
    obj.imageCheckBox168:setWidth(25);
    obj.imageCheckBox168:setHeight(25);
    obj.imageCheckBox168:setField("enigmas_2");
    obj.imageCheckBox168:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox168:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox168:setName("imageCheckBox168");

    obj.imageCheckBox169 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox169:setParent(obj.layout52);
    obj.imageCheckBox169:setLeft(130);
    obj.imageCheckBox169:setTop(0);
    obj.imageCheckBox169:setWidth(25);
    obj.imageCheckBox169:setHeight(25);
    obj.imageCheckBox169:setField("enigmas_3");
    obj.imageCheckBox169:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox169:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox169:setName("imageCheckBox169");

    obj.imageCheckBox170 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox170:setParent(obj.layout52);
    obj.imageCheckBox170:setLeft(155);
    obj.imageCheckBox170:setTop(0);
    obj.imageCheckBox170:setWidth(25);
    obj.imageCheckBox170:setHeight(25);
    obj.imageCheckBox170:setField("enigmas_4");
    obj.imageCheckBox170:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox170:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox170:setName("imageCheckBox170");

    obj.imageCheckBox171 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox171:setParent(obj.layout52);
    obj.imageCheckBox171:setLeft(180);
    obj.imageCheckBox171:setTop(0);
    obj.imageCheckBox171:setWidth(25);
    obj.imageCheckBox171:setHeight(25);
    obj.imageCheckBox171:setField("enigmas_5");
    obj.imageCheckBox171:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox171:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox171:setName("imageCheckBox171");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout49);
    obj.layout53:setLeft(15);
    obj.layout53:setTop(100);
    obj.layout53:setWidth(205);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout53);
    obj.label51:setLeft(0);
    obj.label51:setTop(5);
    obj.label51:setWidth(80);
    obj.label51:setHeight(20);
    obj.label51:setText("Hearth Wisdom");
    obj.label51:setName("label51");

    obj.imageCheckBox172 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox172:setParent(obj.layout53);
    obj.imageCheckBox172:setLeft(80);
    obj.imageCheckBox172:setTop(0);
    obj.imageCheckBox172:setWidth(25);
    obj.imageCheckBox172:setHeight(25);
    obj.imageCheckBox172:setField("hearthWisdom_1");
    obj.imageCheckBox172:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox172:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox172:setName("imageCheckBox172");

    obj.imageCheckBox173 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox173:setParent(obj.layout53);
    obj.imageCheckBox173:setLeft(105);
    obj.imageCheckBox173:setTop(0);
    obj.imageCheckBox173:setWidth(25);
    obj.imageCheckBox173:setHeight(25);
    obj.imageCheckBox173:setField("hearthWisdom_2");
    obj.imageCheckBox173:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox173:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox173:setName("imageCheckBox173");

    obj.imageCheckBox174 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox174:setParent(obj.layout53);
    obj.imageCheckBox174:setLeft(130);
    obj.imageCheckBox174:setTop(0);
    obj.imageCheckBox174:setWidth(25);
    obj.imageCheckBox174:setHeight(25);
    obj.imageCheckBox174:setField("hearthWisdom_3");
    obj.imageCheckBox174:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox174:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox174:setName("imageCheckBox174");

    obj.imageCheckBox175 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox175:setParent(obj.layout53);
    obj.imageCheckBox175:setLeft(155);
    obj.imageCheckBox175:setTop(0);
    obj.imageCheckBox175:setWidth(25);
    obj.imageCheckBox175:setHeight(25);
    obj.imageCheckBox175:setField("hearthWisdom_4");
    obj.imageCheckBox175:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox175:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox175:setName("imageCheckBox175");

    obj.imageCheckBox176 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox176:setParent(obj.layout53);
    obj.imageCheckBox176:setLeft(180);
    obj.imageCheckBox176:setTop(0);
    obj.imageCheckBox176:setWidth(25);
    obj.imageCheckBox176:setHeight(25);
    obj.imageCheckBox176:setField("hearthWisdom_5");
    obj.imageCheckBox176:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox176:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox176:setName("imageCheckBox176");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout49);
    obj.layout54:setLeft(15);
    obj.layout54:setTop(125);
    obj.layout54:setWidth(205);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout54);
    obj.label52:setLeft(0);
    obj.label52:setTop(5);
    obj.label52:setWidth(80);
    obj.label52:setHeight(20);
    obj.label52:setText("Investigation");
    obj.label52:setName("label52");

    obj.imageCheckBox177 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox177:setParent(obj.layout54);
    obj.imageCheckBox177:setLeft(80);
    obj.imageCheckBox177:setTop(0);
    obj.imageCheckBox177:setWidth(25);
    obj.imageCheckBox177:setHeight(25);
    obj.imageCheckBox177:setField("investigation_1");
    obj.imageCheckBox177:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox177:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox177:setName("imageCheckBox177");

    obj.imageCheckBox178 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox178:setParent(obj.layout54);
    obj.imageCheckBox178:setLeft(105);
    obj.imageCheckBox178:setTop(0);
    obj.imageCheckBox178:setWidth(25);
    obj.imageCheckBox178:setHeight(25);
    obj.imageCheckBox178:setField("investigation_2");
    obj.imageCheckBox178:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox178:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox178:setName("imageCheckBox178");

    obj.imageCheckBox179 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox179:setParent(obj.layout54);
    obj.imageCheckBox179:setLeft(130);
    obj.imageCheckBox179:setTop(0);
    obj.imageCheckBox179:setWidth(25);
    obj.imageCheckBox179:setHeight(25);
    obj.imageCheckBox179:setField("investigation_3");
    obj.imageCheckBox179:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox179:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox179:setName("imageCheckBox179");

    obj.imageCheckBox180 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox180:setParent(obj.layout54);
    obj.imageCheckBox180:setLeft(155);
    obj.imageCheckBox180:setTop(0);
    obj.imageCheckBox180:setWidth(25);
    obj.imageCheckBox180:setHeight(25);
    obj.imageCheckBox180:setField("investigation_4");
    obj.imageCheckBox180:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox180:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox180:setName("imageCheckBox180");

    obj.imageCheckBox181 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox181:setParent(obj.layout54);
    obj.imageCheckBox181:setLeft(180);
    obj.imageCheckBox181:setTop(0);
    obj.imageCheckBox181:setWidth(25);
    obj.imageCheckBox181:setHeight(25);
    obj.imageCheckBox181:setField("investigation_5");
    obj.imageCheckBox181:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox181:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox181:setName("imageCheckBox181");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout49);
    obj.layout55:setLeft(15);
    obj.layout55:setTop(150);
    obj.layout55:setWidth(205);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout55);
    obj.label53:setLeft(0);
    obj.label53:setTop(5);
    obj.label53:setWidth(80);
    obj.label53:setHeight(20);
    obj.label53:setText("Linguistics");
    obj.label53:setName("label53");

    obj.imageCheckBox182 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox182:setParent(obj.layout55);
    obj.imageCheckBox182:setLeft(80);
    obj.imageCheckBox182:setTop(0);
    obj.imageCheckBox182:setWidth(25);
    obj.imageCheckBox182:setHeight(25);
    obj.imageCheckBox182:setField("linguistics_1");
    obj.imageCheckBox182:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox182:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox182:setName("imageCheckBox182");

    obj.imageCheckBox183 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox183:setParent(obj.layout55);
    obj.imageCheckBox183:setLeft(105);
    obj.imageCheckBox183:setTop(0);
    obj.imageCheckBox183:setWidth(25);
    obj.imageCheckBox183:setHeight(25);
    obj.imageCheckBox183:setField("linguistics_2");
    obj.imageCheckBox183:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox183:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox183:setName("imageCheckBox183");

    obj.imageCheckBox184 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox184:setParent(obj.layout55);
    obj.imageCheckBox184:setLeft(130);
    obj.imageCheckBox184:setTop(0);
    obj.imageCheckBox184:setWidth(25);
    obj.imageCheckBox184:setHeight(25);
    obj.imageCheckBox184:setField("linguistics_3");
    obj.imageCheckBox184:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox184:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox184:setName("imageCheckBox184");

    obj.imageCheckBox185 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox185:setParent(obj.layout55);
    obj.imageCheckBox185:setLeft(155);
    obj.imageCheckBox185:setTop(0);
    obj.imageCheckBox185:setWidth(25);
    obj.imageCheckBox185:setHeight(25);
    obj.imageCheckBox185:setField("linguistics_4");
    obj.imageCheckBox185:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox185:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox185:setName("imageCheckBox185");

    obj.imageCheckBox186 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox186:setParent(obj.layout55);
    obj.imageCheckBox186:setLeft(180);
    obj.imageCheckBox186:setTop(0);
    obj.imageCheckBox186:setWidth(25);
    obj.imageCheckBox186:setHeight(25);
    obj.imageCheckBox186:setField("linguistics_5");
    obj.imageCheckBox186:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox186:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox186:setName("imageCheckBox186");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout49);
    obj.layout56:setLeft(15);
    obj.layout56:setTop(175);
    obj.layout56:setWidth(205);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout56);
    obj.label54:setLeft(0);
    obj.label54:setTop(5);
    obj.label54:setWidth(80);
    obj.label54:setHeight(20);
    obj.label54:setText("Medicine");
    obj.label54:setName("label54");

    obj.imageCheckBox187 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox187:setParent(obj.layout56);
    obj.imageCheckBox187:setLeft(80);
    obj.imageCheckBox187:setTop(0);
    obj.imageCheckBox187:setWidth(25);
    obj.imageCheckBox187:setHeight(25);
    obj.imageCheckBox187:setField("medicine_1");
    obj.imageCheckBox187:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox187:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox187:setName("imageCheckBox187");

    obj.imageCheckBox188 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox188:setParent(obj.layout56);
    obj.imageCheckBox188:setLeft(105);
    obj.imageCheckBox188:setTop(0);
    obj.imageCheckBox188:setWidth(25);
    obj.imageCheckBox188:setHeight(25);
    obj.imageCheckBox188:setField("medicine_2");
    obj.imageCheckBox188:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox188:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox188:setName("imageCheckBox188");

    obj.imageCheckBox189 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox189:setParent(obj.layout56);
    obj.imageCheckBox189:setLeft(130);
    obj.imageCheckBox189:setTop(0);
    obj.imageCheckBox189:setWidth(25);
    obj.imageCheckBox189:setHeight(25);
    obj.imageCheckBox189:setField("medicine_3");
    obj.imageCheckBox189:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox189:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox189:setName("imageCheckBox189");

    obj.imageCheckBox190 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox190:setParent(obj.layout56);
    obj.imageCheckBox190:setLeft(155);
    obj.imageCheckBox190:setTop(0);
    obj.imageCheckBox190:setWidth(25);
    obj.imageCheckBox190:setHeight(25);
    obj.imageCheckBox190:setField("medicine_4");
    obj.imageCheckBox190:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox190:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox190:setName("imageCheckBox190");

    obj.imageCheckBox191 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox191:setParent(obj.layout56);
    obj.imageCheckBox191:setLeft(180);
    obj.imageCheckBox191:setTop(0);
    obj.imageCheckBox191:setWidth(25);
    obj.imageCheckBox191:setHeight(25);
    obj.imageCheckBox191:setField("medicine_5");
    obj.imageCheckBox191:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox191:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox191:setName("imageCheckBox191");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout49);
    obj.layout57:setLeft(15);
    obj.layout57:setTop(200);
    obj.layout57:setWidth(205);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout57);
    obj.label55:setLeft(0);
    obj.label55:setTop(5);
    obj.label55:setWidth(80);
    obj.label55:setHeight(20);
    obj.label55:setText("Occult");
    obj.label55:setName("label55");

    obj.imageCheckBox192 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox192:setParent(obj.layout57);
    obj.imageCheckBox192:setLeft(80);
    obj.imageCheckBox192:setTop(0);
    obj.imageCheckBox192:setWidth(25);
    obj.imageCheckBox192:setHeight(25);
    obj.imageCheckBox192:setField("occult_1");
    obj.imageCheckBox192:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox192:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox192:setName("imageCheckBox192");

    obj.imageCheckBox193 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox193:setParent(obj.layout57);
    obj.imageCheckBox193:setLeft(105);
    obj.imageCheckBox193:setTop(0);
    obj.imageCheckBox193:setWidth(25);
    obj.imageCheckBox193:setHeight(25);
    obj.imageCheckBox193:setField("occult_2");
    obj.imageCheckBox193:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox193:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox193:setName("imageCheckBox193");

    obj.imageCheckBox194 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox194:setParent(obj.layout57);
    obj.imageCheckBox194:setLeft(130);
    obj.imageCheckBox194:setTop(0);
    obj.imageCheckBox194:setWidth(25);
    obj.imageCheckBox194:setHeight(25);
    obj.imageCheckBox194:setField("occult_3");
    obj.imageCheckBox194:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox194:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox194:setName("imageCheckBox194");

    obj.imageCheckBox195 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox195:setParent(obj.layout57);
    obj.imageCheckBox195:setLeft(155);
    obj.imageCheckBox195:setTop(0);
    obj.imageCheckBox195:setWidth(25);
    obj.imageCheckBox195:setHeight(25);
    obj.imageCheckBox195:setField("occult_4");
    obj.imageCheckBox195:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox195:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox195:setName("imageCheckBox195");

    obj.imageCheckBox196 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox196:setParent(obj.layout57);
    obj.imageCheckBox196:setLeft(180);
    obj.imageCheckBox196:setTop(0);
    obj.imageCheckBox196:setWidth(25);
    obj.imageCheckBox196:setHeight(25);
    obj.imageCheckBox196:setField("occult_5");
    obj.imageCheckBox196:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox196:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox196:setName("imageCheckBox196");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout49);
    obj.layout58:setLeft(15);
    obj.layout58:setTop(225);
    obj.layout58:setWidth(205);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout58);
    obj.label56:setLeft(0);
    obj.label56:setTop(5);
    obj.label56:setWidth(80);
    obj.label56:setHeight(20);
    obj.label56:setText("Politics");
    obj.label56:setName("label56");

    obj.imageCheckBox197 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox197:setParent(obj.layout58);
    obj.imageCheckBox197:setLeft(80);
    obj.imageCheckBox197:setTop(0);
    obj.imageCheckBox197:setWidth(25);
    obj.imageCheckBox197:setHeight(25);
    obj.imageCheckBox197:setField("politics_1");
    obj.imageCheckBox197:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox197:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox197:setName("imageCheckBox197");

    obj.imageCheckBox198 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox198:setParent(obj.layout58);
    obj.imageCheckBox198:setLeft(105);
    obj.imageCheckBox198:setTop(0);
    obj.imageCheckBox198:setWidth(25);
    obj.imageCheckBox198:setHeight(25);
    obj.imageCheckBox198:setField("politics_2");
    obj.imageCheckBox198:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox198:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox198:setName("imageCheckBox198");

    obj.imageCheckBox199 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox199:setParent(obj.layout58);
    obj.imageCheckBox199:setLeft(130);
    obj.imageCheckBox199:setTop(0);
    obj.imageCheckBox199:setWidth(25);
    obj.imageCheckBox199:setHeight(25);
    obj.imageCheckBox199:setField("politics_3");
    obj.imageCheckBox199:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox199:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox199:setName("imageCheckBox199");

    obj.imageCheckBox200 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox200:setParent(obj.layout58);
    obj.imageCheckBox200:setLeft(155);
    obj.imageCheckBox200:setTop(0);
    obj.imageCheckBox200:setWidth(25);
    obj.imageCheckBox200:setHeight(25);
    obj.imageCheckBox200:setField("politics_4");
    obj.imageCheckBox200:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox200:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox200:setName("imageCheckBox200");

    obj.imageCheckBox201 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox201:setParent(obj.layout58);
    obj.imageCheckBox201:setLeft(180);
    obj.imageCheckBox201:setTop(0);
    obj.imageCheckBox201:setWidth(25);
    obj.imageCheckBox201:setHeight(25);
    obj.imageCheckBox201:setField("politics_5");
    obj.imageCheckBox201:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox201:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox201:setName("imageCheckBox201");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout49);
    obj.layout59:setLeft(15);
    obj.layout59:setTop(250);
    obj.layout59:setWidth(205);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout59);
    obj.label57:setLeft(0);
    obj.label57:setTop(5);
    obj.label57:setWidth(80);
    obj.label57:setHeight(20);
    obj.label57:setText("Theology");
    obj.label57:setName("label57");

    obj.imageCheckBox202 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox202:setParent(obj.layout59);
    obj.imageCheckBox202:setLeft(80);
    obj.imageCheckBox202:setTop(0);
    obj.imageCheckBox202:setWidth(25);
    obj.imageCheckBox202:setHeight(25);
    obj.imageCheckBox202:setField("theology_1");
    obj.imageCheckBox202:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox202:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox202:setName("imageCheckBox202");

    obj.imageCheckBox203 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox203:setParent(obj.layout59);
    obj.imageCheckBox203:setLeft(105);
    obj.imageCheckBox203:setTop(0);
    obj.imageCheckBox203:setWidth(25);
    obj.imageCheckBox203:setHeight(25);
    obj.imageCheckBox203:setField("theology_2");
    obj.imageCheckBox203:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox203:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox203:setName("imageCheckBox203");

    obj.imageCheckBox204 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox204:setParent(obj.layout59);
    obj.imageCheckBox204:setLeft(130);
    obj.imageCheckBox204:setTop(0);
    obj.imageCheckBox204:setWidth(25);
    obj.imageCheckBox204:setHeight(25);
    obj.imageCheckBox204:setField("theology_3");
    obj.imageCheckBox204:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox204:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox204:setName("imageCheckBox204");

    obj.imageCheckBox205 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox205:setParent(obj.layout59);
    obj.imageCheckBox205:setLeft(155);
    obj.imageCheckBox205:setTop(0);
    obj.imageCheckBox205:setWidth(25);
    obj.imageCheckBox205:setHeight(25);
    obj.imageCheckBox205:setField("theology_4");
    obj.imageCheckBox205:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox205:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox205:setName("imageCheckBox205");

    obj.imageCheckBox206 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox206:setParent(obj.layout59);
    obj.imageCheckBox206:setLeft(180);
    obj.imageCheckBox206:setTop(0);
    obj.imageCheckBox206:setWidth(25);
    obj.imageCheckBox206:setHeight(25);
    obj.imageCheckBox206:setField("theology_5");
    obj.imageCheckBox206:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox206:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox206:setName("imageCheckBox206");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout49);
    obj.layout60:setLeft(15);
    obj.layout60:setTop(275);
    obj.layout60:setWidth(205);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout60);
    obj.edit15:setLeft(0);
    obj.edit15:setTop(5);
    obj.edit15:setWidth(75);
    obj.edit15:setHeight(20);
    obj.edit15:setField("knowledge_11");
    obj.edit15:setFontSize(12);
    obj.edit15:setName("edit15");

    obj.imageCheckBox207 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox207:setParent(obj.layout60);
    obj.imageCheckBox207:setLeft(80);
    obj.imageCheckBox207:setTop(0);
    obj.imageCheckBox207:setWidth(25);
    obj.imageCheckBox207:setHeight(25);
    obj.imageCheckBox207:setField("knowledge_11_1");
    obj.imageCheckBox207:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox207:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox207:setName("imageCheckBox207");

    obj.imageCheckBox208 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox208:setParent(obj.layout60);
    obj.imageCheckBox208:setLeft(105);
    obj.imageCheckBox208:setTop(0);
    obj.imageCheckBox208:setWidth(25);
    obj.imageCheckBox208:setHeight(25);
    obj.imageCheckBox208:setField("knowledge_11_2");
    obj.imageCheckBox208:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox208:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox208:setName("imageCheckBox208");

    obj.imageCheckBox209 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox209:setParent(obj.layout60);
    obj.imageCheckBox209:setLeft(130);
    obj.imageCheckBox209:setTop(0);
    obj.imageCheckBox209:setWidth(25);
    obj.imageCheckBox209:setHeight(25);
    obj.imageCheckBox209:setField("knowledge_11_3");
    obj.imageCheckBox209:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox209:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox209:setName("imageCheckBox209");

    obj.imageCheckBox210 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox210:setParent(obj.layout60);
    obj.imageCheckBox210:setLeft(155);
    obj.imageCheckBox210:setTop(0);
    obj.imageCheckBox210:setWidth(25);
    obj.imageCheckBox210:setHeight(25);
    obj.imageCheckBox210:setField("knowledge_11_4");
    obj.imageCheckBox210:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox210:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox210:setName("imageCheckBox210");

    obj.imageCheckBox211 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox211:setParent(obj.layout60);
    obj.imageCheckBox211:setLeft(180);
    obj.imageCheckBox211:setTop(0);
    obj.imageCheckBox211:setWidth(25);
    obj.imageCheckBox211:setHeight(25);
    obj.imageCheckBox211:setField("knowledge_11_5");
    obj.imageCheckBox211:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox211:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox211:setName("imageCheckBox211");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout49);
    obj.layout61:setLeft(15);
    obj.layout61:setTop(300);
    obj.layout61:setWidth(205);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout61);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(5);
    obj.edit16:setWidth(75);
    obj.edit16:setHeight(20);
    obj.edit16:setField("knowledge_12");
    obj.edit16:setFontSize(12);
    obj.edit16:setName("edit16");

    obj.imageCheckBox212 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox212:setParent(obj.layout61);
    obj.imageCheckBox212:setLeft(80);
    obj.imageCheckBox212:setTop(0);
    obj.imageCheckBox212:setWidth(25);
    obj.imageCheckBox212:setHeight(25);
    obj.imageCheckBox212:setField("knowledge_12_1");
    obj.imageCheckBox212:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox212:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox212:setName("imageCheckBox212");

    obj.imageCheckBox213 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox213:setParent(obj.layout61);
    obj.imageCheckBox213:setLeft(105);
    obj.imageCheckBox213:setTop(0);
    obj.imageCheckBox213:setWidth(25);
    obj.imageCheckBox213:setHeight(25);
    obj.imageCheckBox213:setField("knowledge_12_2");
    obj.imageCheckBox213:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox213:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox213:setName("imageCheckBox213");

    obj.imageCheckBox214 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox214:setParent(obj.layout61);
    obj.imageCheckBox214:setLeft(130);
    obj.imageCheckBox214:setTop(0);
    obj.imageCheckBox214:setWidth(25);
    obj.imageCheckBox214:setHeight(25);
    obj.imageCheckBox214:setField("knowledge_12_3");
    obj.imageCheckBox214:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox214:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox214:setName("imageCheckBox214");

    obj.imageCheckBox215 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox215:setParent(obj.layout61);
    obj.imageCheckBox215:setLeft(155);
    obj.imageCheckBox215:setTop(0);
    obj.imageCheckBox215:setWidth(25);
    obj.imageCheckBox215:setHeight(25);
    obj.imageCheckBox215:setField("knowledge_12_4");
    obj.imageCheckBox215:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox215:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox215:setName("imageCheckBox215");

    obj.imageCheckBox216 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox216:setParent(obj.layout61);
    obj.imageCheckBox216:setLeft(180);
    obj.imageCheckBox216:setTop(0);
    obj.imageCheckBox216:setWidth(25);
    obj.imageCheckBox216:setHeight(25);
    obj.imageCheckBox216:setField("knowledge_12_5");
    obj.imageCheckBox216:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox216:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox216:setName("imageCheckBox216");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox1);
    obj.layout62:setLeft(280);
    obj.layout62:setTop(500);
    obj.layout62:setWidth(350);
    obj.layout62:setHeight(175);
    obj.layout62:setName("layout62");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout62);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setCornerType("innerLine");
    obj.rectangle9:setName("rectangle9");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setLeft(15);
    obj.layout63:setTop(5);
    obj.layout63:setWidth(305);
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout63);
    obj.label58:setLeft(0);
    obj.label58:setTop(5);
    obj.label58:setWidth(60);
    obj.label58:setHeight(20);
    obj.label58:setText("FOUNDATION");
    obj.label58:setFontSize(9);
    obj.label58:setName("label58");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout63);
    obj.edit17:setLeft(60);
    obj.edit17:setTop(5);
    obj.edit17:setWidth(125);
    obj.edit17:setHeight(20);
    obj.edit17:setField("foundation");
    obj.edit17:setFontSize(12);
    obj.edit17:setName("edit17");

    obj.imageCheckBox217 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox217:setParent(obj.layout63);
    obj.imageCheckBox217:setLeft(185);
    obj.imageCheckBox217:setTop(0);
    obj.imageCheckBox217:setWidth(25);
    obj.imageCheckBox217:setHeight(25);
    obj.imageCheckBox217:setField("foundation_1");
    obj.imageCheckBox217:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox217:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox217:setName("imageCheckBox217");

    obj.imageCheckBox218 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox218:setParent(obj.layout63);
    obj.imageCheckBox218:setLeft(210);
    obj.imageCheckBox218:setTop(0);
    obj.imageCheckBox218:setWidth(25);
    obj.imageCheckBox218:setHeight(25);
    obj.imageCheckBox218:setField("foundation_2");
    obj.imageCheckBox218:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox218:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox218:setName("imageCheckBox218");

    obj.imageCheckBox219 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox219:setParent(obj.layout63);
    obj.imageCheckBox219:setLeft(235);
    obj.imageCheckBox219:setTop(0);
    obj.imageCheckBox219:setWidth(25);
    obj.imageCheckBox219:setHeight(25);
    obj.imageCheckBox219:setField("foundation_3");
    obj.imageCheckBox219:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox219:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox219:setName("imageCheckBox219");

    obj.imageCheckBox220 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox220:setParent(obj.layout63);
    obj.imageCheckBox220:setLeft(260);
    obj.imageCheckBox220:setTop(0);
    obj.imageCheckBox220:setWidth(25);
    obj.imageCheckBox220:setHeight(25);
    obj.imageCheckBox220:setField("foundation_4");
    obj.imageCheckBox220:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox220:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox220:setName("imageCheckBox220");

    obj.imageCheckBox221 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox221:setParent(obj.layout63);
    obj.imageCheckBox221:setLeft(285);
    obj.imageCheckBox221:setTop(0);
    obj.imageCheckBox221:setWidth(25);
    obj.imageCheckBox221:setHeight(25);
    obj.imageCheckBox221:setField("foundation_5");
    obj.imageCheckBox221:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox221:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox221:setName("imageCheckBox221");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout62);
    obj.layout64:setLeft(15);
    obj.layout64:setTop(30);
    obj.layout64:setWidth(305);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout64);
    obj.label59:setLeft(0);
    obj.label59:setTop(5);
    obj.label59:setWidth(60);
    obj.label59:setHeight(20);
    obj.label59:setText("AURA");
    obj.label59:setFontSize(11);
    obj.label59:setName("label59");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout64);
    obj.edit18:setLeft(60);
    obj.edit18:setTop(5);
    obj.edit18:setWidth(125);
    obj.edit18:setHeight(20);
    obj.edit18:setField("auraNome");
    obj.edit18:setFontSize(12);
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout64);
    obj.edit19:setLeft(190);
    obj.edit19:setTop(5);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(20);
    obj.edit19:setField("aura");
    obj.edit19:setFontSize(12);
    obj.edit19:setName("edit19");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout62);
    obj.layout65:setLeft(15);
    obj.layout65:setTop(55);
    obj.layout65:setWidth(305);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout65);
    obj.label60:setLeft(0);
    obj.label60:setTop(5);
    obj.label60:setWidth(60);
    obj.label60:setHeight(20);
    obj.label60:setText("BACKSLASH");
    obj.label60:setFontSize(11);
    obj.label60:setName("label60");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout65);
    obj.edit20:setLeft(60);
    obj.edit20:setTop(5);
    obj.edit20:setWidth(125);
    obj.edit20:setHeight(20);
    obj.edit20:setField("backslash");
    obj.edit20:setFontSize(12);
    obj.edit20:setName("edit20");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout62);
    obj.layout66:setLeft(15);
    obj.layout66:setTop(77);
    obj.layout66:setWidth(305);
    obj.layout66:setHeight(45);
    obj.layout66:setName("layout66");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout66);
    obj.label61:setLeft(0);
    obj.label61:setTop(0);
    obj.label61:setWidth(60);
    obj.label61:setHeight(20);
    obj.label61:setText("QUINTESSENCE");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setFontSize(8);
    obj.label61:setName("label61");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout66);
    obj.edit21:setLeft(15);
    obj.edit21:setTop(20);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(20);
    obj.edit21:setField("quintessence");
    obj.edit21:setFontSize(12);
    obj.edit21:setName("edit21");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout66);
    obj.checkBox1:setLeft(62);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(25);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setField("quintessence_1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout66);
    obj.checkBox2:setLeft(87);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(25);
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setField("quintessence_2");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout66);
    obj.checkBox3:setLeft(112);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(25);
    obj.checkBox3:setHeight(25);
    obj.checkBox3:setField("quintessence_3");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout66);
    obj.checkBox4:setLeft(137);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(25);
    obj.checkBox4:setHeight(25);
    obj.checkBox4:setField("quintessence_4");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout66);
    obj.checkBox5:setLeft(162);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(25);
    obj.checkBox5:setHeight(25);
    obj.checkBox5:setField("quintessence_5");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout66);
    obj.checkBox6:setLeft(187);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(25);
    obj.checkBox6:setHeight(25);
    obj.checkBox6:setField("quintessence_6");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout66);
    obj.checkBox7:setLeft(212);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(25);
    obj.checkBox7:setHeight(25);
    obj.checkBox7:setField("quintessence_7");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout66);
    obj.checkBox8:setLeft(237);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(25);
    obj.checkBox8:setHeight(25);
    obj.checkBox8:setField("quintessence_8");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout66);
    obj.checkBox9:setLeft(262);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(25);
    obj.checkBox9:setHeight(25);
    obj.checkBox9:setField("quintessence_9");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout66);
    obj.checkBox10:setLeft(287);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(25);
    obj.checkBox10:setHeight(25);
    obj.checkBox10:setField("quintessence_10");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout66);
    obj.checkBox11:setLeft(62);
    obj.checkBox11:setTop(20);
    obj.checkBox11:setWidth(25);
    obj.checkBox11:setHeight(25);
    obj.checkBox11:setField("quintessence_c1");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout66);
    obj.checkBox12:setLeft(87);
    obj.checkBox12:setTop(20);
    obj.checkBox12:setWidth(25);
    obj.checkBox12:setHeight(25);
    obj.checkBox12:setField("quintessence_c2");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout66);
    obj.checkBox13:setLeft(112);
    obj.checkBox13:setTop(20);
    obj.checkBox13:setWidth(25);
    obj.checkBox13:setHeight(25);
    obj.checkBox13:setField("quintessence_c3");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout66);
    obj.checkBox14:setLeft(137);
    obj.checkBox14:setTop(20);
    obj.checkBox14:setWidth(25);
    obj.checkBox14:setHeight(25);
    obj.checkBox14:setField("quintessence_c4");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout66);
    obj.checkBox15:setLeft(162);
    obj.checkBox15:setTop(20);
    obj.checkBox15:setWidth(25);
    obj.checkBox15:setHeight(25);
    obj.checkBox15:setField("quintessence_c5");
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout66);
    obj.checkBox16:setLeft(187);
    obj.checkBox16:setTop(20);
    obj.checkBox16:setWidth(25);
    obj.checkBox16:setHeight(25);
    obj.checkBox16:setField("quintessence_c6");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout66);
    obj.checkBox17:setLeft(212);
    obj.checkBox17:setTop(20);
    obj.checkBox17:setWidth(25);
    obj.checkBox17:setHeight(25);
    obj.checkBox17:setField("quintessence_c7");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout66);
    obj.checkBox18:setLeft(237);
    obj.checkBox18:setTop(20);
    obj.checkBox18:setWidth(25);
    obj.checkBox18:setHeight(25);
    obj.checkBox18:setField("quintessence_c8");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout66);
    obj.checkBox19:setLeft(262);
    obj.checkBox19:setTop(20);
    obj.checkBox19:setWidth(25);
    obj.checkBox19:setHeight(25);
    obj.checkBox19:setField("quintessence_c9");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout66);
    obj.checkBox20:setLeft(287);
    obj.checkBox20:setTop(20);
    obj.checkBox20:setWidth(25);
    obj.checkBox20:setHeight(25);
    obj.checkBox20:setField("quintessence_c10");
    obj.checkBox20:setName("checkBox20");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout62);
    obj.layout67:setLeft(15);
    obj.layout67:setTop(120);
    obj.layout67:setWidth(350);
    obj.layout67:setHeight(45);
    obj.layout67:setName("layout67");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout67);
    obj.label62:setLeft(0);
    obj.label62:setTop(15);
    obj.label62:setWidth(60);
    obj.label62:setHeight(20);
    obj.label62:setText("WILLPOWER");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setFontSize(10);
    obj.label62:setName("label62");

    obj.imageCheckBox222 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox222:setParent(obj.layout67);
    obj.imageCheckBox222:setLeft(60);
    obj.imageCheckBox222:setTop(0);
    obj.imageCheckBox222:setWidth(25);
    obj.imageCheckBox222:setHeight(25);
    obj.imageCheckBox222:setField("willpower_1");
    obj.imageCheckBox222:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox222:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox222:setName("imageCheckBox222");

    obj.imageCheckBox223 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox223:setParent(obj.layout67);
    obj.imageCheckBox223:setLeft(85);
    obj.imageCheckBox223:setTop(0);
    obj.imageCheckBox223:setWidth(25);
    obj.imageCheckBox223:setHeight(25);
    obj.imageCheckBox223:setField("willpower_2");
    obj.imageCheckBox223:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox223:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox223:setName("imageCheckBox223");

    obj.imageCheckBox224 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox224:setParent(obj.layout67);
    obj.imageCheckBox224:setLeft(110);
    obj.imageCheckBox224:setTop(0);
    obj.imageCheckBox224:setWidth(25);
    obj.imageCheckBox224:setHeight(25);
    obj.imageCheckBox224:setField("willpower_3");
    obj.imageCheckBox224:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox224:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox224:setName("imageCheckBox224");

    obj.imageCheckBox225 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox225:setParent(obj.layout67);
    obj.imageCheckBox225:setLeft(135);
    obj.imageCheckBox225:setTop(0);
    obj.imageCheckBox225:setWidth(25);
    obj.imageCheckBox225:setHeight(25);
    obj.imageCheckBox225:setField("willpower_4");
    obj.imageCheckBox225:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox225:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox225:setName("imageCheckBox225");

    obj.imageCheckBox226 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox226:setParent(obj.layout67);
    obj.imageCheckBox226:setLeft(160);
    obj.imageCheckBox226:setTop(0);
    obj.imageCheckBox226:setWidth(25);
    obj.imageCheckBox226:setHeight(25);
    obj.imageCheckBox226:setField("willpower_5");
    obj.imageCheckBox226:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox226:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox226:setName("imageCheckBox226");

    obj.imageCheckBox227 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox227:setParent(obj.layout67);
    obj.imageCheckBox227:setLeft(185);
    obj.imageCheckBox227:setTop(0);
    obj.imageCheckBox227:setWidth(25);
    obj.imageCheckBox227:setHeight(25);
    obj.imageCheckBox227:setField("willpower_6");
    obj.imageCheckBox227:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox227:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox227:setName("imageCheckBox227");

    obj.imageCheckBox228 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox228:setParent(obj.layout67);
    obj.imageCheckBox228:setLeft(210);
    obj.imageCheckBox228:setTop(0);
    obj.imageCheckBox228:setWidth(25);
    obj.imageCheckBox228:setHeight(25);
    obj.imageCheckBox228:setField("willpower_7");
    obj.imageCheckBox228:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox228:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox228:setName("imageCheckBox228");

    obj.imageCheckBox229 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox229:setParent(obj.layout67);
    obj.imageCheckBox229:setLeft(235);
    obj.imageCheckBox229:setTop(0);
    obj.imageCheckBox229:setWidth(25);
    obj.imageCheckBox229:setHeight(25);
    obj.imageCheckBox229:setField("willpower_8");
    obj.imageCheckBox229:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox229:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox229:setName("imageCheckBox229");

    obj.imageCheckBox230 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox230:setParent(obj.layout67);
    obj.imageCheckBox230:setLeft(260);
    obj.imageCheckBox230:setTop(0);
    obj.imageCheckBox230:setWidth(25);
    obj.imageCheckBox230:setHeight(25);
    obj.imageCheckBox230:setField("willpower_9");
    obj.imageCheckBox230:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox230:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox230:setName("imageCheckBox230");

    obj.imageCheckBox231 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox231:setParent(obj.layout67);
    obj.imageCheckBox231:setLeft(285);
    obj.imageCheckBox231:setTop(0);
    obj.imageCheckBox231:setWidth(25);
    obj.imageCheckBox231:setHeight(25);
    obj.imageCheckBox231:setField("willpower_10");
    obj.imageCheckBox231:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox231:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox231:setName("imageCheckBox231");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout67);
    obj.checkBox21:setLeft(62);
    obj.checkBox21:setTop(20);
    obj.checkBox21:setWidth(25);
    obj.checkBox21:setHeight(25);
    obj.checkBox21:setField("willpower_c1");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout67);
    obj.checkBox22:setLeft(87);
    obj.checkBox22:setTop(20);
    obj.checkBox22:setWidth(25);
    obj.checkBox22:setHeight(25);
    obj.checkBox22:setField("willpower_c2");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout67);
    obj.checkBox23:setLeft(112);
    obj.checkBox23:setTop(20);
    obj.checkBox23:setWidth(25);
    obj.checkBox23:setHeight(25);
    obj.checkBox23:setField("willpower_c3");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout67);
    obj.checkBox24:setLeft(137);
    obj.checkBox24:setTop(20);
    obj.checkBox24:setWidth(25);
    obj.checkBox24:setHeight(25);
    obj.checkBox24:setField("willpower_c4");
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout67);
    obj.checkBox25:setLeft(162);
    obj.checkBox25:setTop(20);
    obj.checkBox25:setWidth(25);
    obj.checkBox25:setHeight(25);
    obj.checkBox25:setField("willpower_c5");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout67);
    obj.checkBox26:setLeft(187);
    obj.checkBox26:setTop(20);
    obj.checkBox26:setWidth(25);
    obj.checkBox26:setHeight(25);
    obj.checkBox26:setField("willpower_c6");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout67);
    obj.checkBox27:setLeft(212);
    obj.checkBox27:setTop(20);
    obj.checkBox27:setWidth(25);
    obj.checkBox27:setHeight(25);
    obj.checkBox27:setField("willpower_c7");
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout67);
    obj.checkBox28:setLeft(237);
    obj.checkBox28:setTop(20);
    obj.checkBox28:setWidth(25);
    obj.checkBox28:setHeight(25);
    obj.checkBox28:setField("willpower_c8");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout67);
    obj.checkBox29:setLeft(262);
    obj.checkBox29:setTop(20);
    obj.checkBox29:setWidth(25);
    obj.checkBox29:setHeight(25);
    obj.checkBox29:setField("willpower_c9");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout67);
    obj.checkBox30:setLeft(287);
    obj.checkBox30:setTop(20);
    obj.checkBox30:setWidth(25);
    obj.checkBox30:setHeight(25);
    obj.checkBox30:setField("willpower_c10");
    obj.checkBox30:setName("checkBox30");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.scrollBox1);
    obj.layout68:setLeft(640);
    obj.layout68:setTop(500);
    obj.layout68:setWidth(150);
    obj.layout68:setHeight(175);
    obj.layout68:setName("layout68");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout68);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("innerLine");
    obj.rectangle10:setName("rectangle10");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout68);
    obj.label63:setLeft(0);
    obj.label63:setTop(0);
    obj.label63:setWidth(150);
    obj.label63:setHeight(20);
    obj.label63:setText("HEALTH");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout68);
    obj.checkBox31:setLeft(20);
    obj.checkBox31:setTop(25);
    obj.checkBox31:setWidth(125);
    obj.checkBox31:setHeight(20);
    obj.checkBox31:setField("bruised");
    obj.checkBox31:setText("Bruised");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout68);
    obj.checkBox32:setLeft(20);
    obj.checkBox32:setTop(45);
    obj.checkBox32:setWidth(125);
    obj.checkBox32:setHeight(20);
    obj.checkBox32:setField("hurt");
    obj.checkBox32:setText("Hurt (-1)");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout68);
    obj.checkBox33:setLeft(20);
    obj.checkBox33:setTop(65);
    obj.checkBox33:setWidth(125);
    obj.checkBox33:setHeight(20);
    obj.checkBox33:setField("injured");
    obj.checkBox33:setText("Injured (-1)");
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout68);
    obj.checkBox34:setLeft(20);
    obj.checkBox34:setTop(85);
    obj.checkBox34:setWidth(125);
    obj.checkBox34:setHeight(20);
    obj.checkBox34:setField("wounded");
    obj.checkBox34:setText("Wounded (-2)");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout68);
    obj.checkBox35:setLeft(20);
    obj.checkBox35:setTop(105);
    obj.checkBox35:setWidth(125);
    obj.checkBox35:setHeight(20);
    obj.checkBox35:setField("mauled");
    obj.checkBox35:setText("Mauled (-2)");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout68);
    obj.checkBox36:setLeft(20);
    obj.checkBox36:setTop(125);
    obj.checkBox36:setWidth(125);
    obj.checkBox36:setHeight(20);
    obj.checkBox36:setField("crippled");
    obj.checkBox36:setText("Crippled (-5)");
    obj.checkBox36:setName("checkBox36");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout68);
    obj.checkBox37:setLeft(20);
    obj.checkBox37:setTop(145);
    obj.checkBox37:setWidth(125);
    obj.checkBox37:setHeight(20);
    obj.checkBox37:setField("incapacitated");
    obj.checkBox37:setText("Incapacitated");
    obj.checkBox37:setName("checkBox37");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox1);
    obj.layout69:setLeft(800);
    obj.layout69:setTop(500);
    obj.layout69:setWidth(255);
    obj.layout69:setHeight(205);
    obj.layout69:setName("layout69");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout69);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setCornerType("innerLine");
    obj.rectangle11:setName("rectangle11");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout69);
    obj.label64:setLeft(5);
    obj.label64:setTop(0);
    obj.label64:setWidth(240);
    obj.label64:setHeight(20);
    obj.label64:setText("BACKGROUNDS");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setLeft(15);
    obj.layout70:setTop(25);
    obj.layout70:setWidth(225);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout70);
    obj.edit22:setLeft(0);
    obj.edit22:setTop(5);
    obj.edit22:setWidth(75);
    obj.edit22:setHeight(20);
    obj.edit22:setField("background_1");
    obj.edit22:setFontSize(12);
    obj.edit22:setName("edit22");

    obj.imageCheckBox232 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox232:setParent(obj.layout70);
    obj.imageCheckBox232:setLeft(80);
    obj.imageCheckBox232:setTop(0);
    obj.imageCheckBox232:setWidth(25);
    obj.imageCheckBox232:setHeight(25);
    obj.imageCheckBox232:setField("background_1_1");
    obj.imageCheckBox232:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox232:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox232:setName("imageCheckBox232");

    obj.imageCheckBox233 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox233:setParent(obj.layout70);
    obj.imageCheckBox233:setLeft(105);
    obj.imageCheckBox233:setTop(0);
    obj.imageCheckBox233:setWidth(25);
    obj.imageCheckBox233:setHeight(25);
    obj.imageCheckBox233:setField("background_1_2");
    obj.imageCheckBox233:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox233:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox233:setName("imageCheckBox233");

    obj.imageCheckBox234 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox234:setParent(obj.layout70);
    obj.imageCheckBox234:setLeft(130);
    obj.imageCheckBox234:setTop(0);
    obj.imageCheckBox234:setWidth(25);
    obj.imageCheckBox234:setHeight(25);
    obj.imageCheckBox234:setField("background_1_3");
    obj.imageCheckBox234:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox234:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox234:setName("imageCheckBox234");

    obj.imageCheckBox235 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox235:setParent(obj.layout70);
    obj.imageCheckBox235:setLeft(155);
    obj.imageCheckBox235:setTop(0);
    obj.imageCheckBox235:setWidth(25);
    obj.imageCheckBox235:setHeight(25);
    obj.imageCheckBox235:setField("background_1_4");
    obj.imageCheckBox235:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox235:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox235:setName("imageCheckBox235");

    obj.imageCheckBox236 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox236:setParent(obj.layout70);
    obj.imageCheckBox236:setLeft(180);
    obj.imageCheckBox236:setTop(0);
    obj.imageCheckBox236:setWidth(25);
    obj.imageCheckBox236:setHeight(25);
    obj.imageCheckBox236:setField("background_1_5");
    obj.imageCheckBox236:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox236:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox236:setName("imageCheckBox236");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout69);
    obj.layout71:setLeft(15);
    obj.layout71:setTop(50);
    obj.layout71:setWidth(225);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout71);
    obj.edit23:setLeft(0);
    obj.edit23:setTop(5);
    obj.edit23:setWidth(75);
    obj.edit23:setHeight(20);
    obj.edit23:setField("background_2");
    obj.edit23:setFontSize(12);
    obj.edit23:setName("edit23");

    obj.imageCheckBox237 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox237:setParent(obj.layout71);
    obj.imageCheckBox237:setLeft(80);
    obj.imageCheckBox237:setTop(0);
    obj.imageCheckBox237:setWidth(25);
    obj.imageCheckBox237:setHeight(25);
    obj.imageCheckBox237:setField("background_2_1");
    obj.imageCheckBox237:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox237:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox237:setName("imageCheckBox237");

    obj.imageCheckBox238 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox238:setParent(obj.layout71);
    obj.imageCheckBox238:setLeft(105);
    obj.imageCheckBox238:setTop(0);
    obj.imageCheckBox238:setWidth(25);
    obj.imageCheckBox238:setHeight(25);
    obj.imageCheckBox238:setField("background_2_2");
    obj.imageCheckBox238:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox238:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox238:setName("imageCheckBox238");

    obj.imageCheckBox239 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox239:setParent(obj.layout71);
    obj.imageCheckBox239:setLeft(130);
    obj.imageCheckBox239:setTop(0);
    obj.imageCheckBox239:setWidth(25);
    obj.imageCheckBox239:setHeight(25);
    obj.imageCheckBox239:setField("background_2_3");
    obj.imageCheckBox239:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox239:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox239:setName("imageCheckBox239");

    obj.imageCheckBox240 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox240:setParent(obj.layout71);
    obj.imageCheckBox240:setLeft(155);
    obj.imageCheckBox240:setTop(0);
    obj.imageCheckBox240:setWidth(25);
    obj.imageCheckBox240:setHeight(25);
    obj.imageCheckBox240:setField("background_2_4");
    obj.imageCheckBox240:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox240:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox240:setName("imageCheckBox240");

    obj.imageCheckBox241 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox241:setParent(obj.layout71);
    obj.imageCheckBox241:setLeft(180);
    obj.imageCheckBox241:setTop(0);
    obj.imageCheckBox241:setWidth(25);
    obj.imageCheckBox241:setHeight(25);
    obj.imageCheckBox241:setField("background_2_5");
    obj.imageCheckBox241:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox241:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox241:setName("imageCheckBox241");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout69);
    obj.layout72:setLeft(15);
    obj.layout72:setTop(75);
    obj.layout72:setWidth(225);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout72);
    obj.edit24:setLeft(0);
    obj.edit24:setTop(5);
    obj.edit24:setWidth(75);
    obj.edit24:setHeight(20);
    obj.edit24:setField("background_3");
    obj.edit24:setFontSize(12);
    obj.edit24:setName("edit24");

    obj.imageCheckBox242 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox242:setParent(obj.layout72);
    obj.imageCheckBox242:setLeft(80);
    obj.imageCheckBox242:setTop(0);
    obj.imageCheckBox242:setWidth(25);
    obj.imageCheckBox242:setHeight(25);
    obj.imageCheckBox242:setField("background_3_1");
    obj.imageCheckBox242:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox242:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox242:setName("imageCheckBox242");

    obj.imageCheckBox243 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox243:setParent(obj.layout72);
    obj.imageCheckBox243:setLeft(105);
    obj.imageCheckBox243:setTop(0);
    obj.imageCheckBox243:setWidth(25);
    obj.imageCheckBox243:setHeight(25);
    obj.imageCheckBox243:setField("background_3_2");
    obj.imageCheckBox243:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox243:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox243:setName("imageCheckBox243");

    obj.imageCheckBox244 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox244:setParent(obj.layout72);
    obj.imageCheckBox244:setLeft(130);
    obj.imageCheckBox244:setTop(0);
    obj.imageCheckBox244:setWidth(25);
    obj.imageCheckBox244:setHeight(25);
    obj.imageCheckBox244:setField("background_3_3");
    obj.imageCheckBox244:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox244:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox244:setName("imageCheckBox244");

    obj.imageCheckBox245 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox245:setParent(obj.layout72);
    obj.imageCheckBox245:setLeft(155);
    obj.imageCheckBox245:setTop(0);
    obj.imageCheckBox245:setWidth(25);
    obj.imageCheckBox245:setHeight(25);
    obj.imageCheckBox245:setField("background_3_4");
    obj.imageCheckBox245:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox245:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox245:setName("imageCheckBox245");

    obj.imageCheckBox246 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox246:setParent(obj.layout72);
    obj.imageCheckBox246:setLeft(180);
    obj.imageCheckBox246:setTop(0);
    obj.imageCheckBox246:setWidth(25);
    obj.imageCheckBox246:setHeight(25);
    obj.imageCheckBox246:setField("background_3_5");
    obj.imageCheckBox246:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox246:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox246:setName("imageCheckBox246");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout69);
    obj.layout73:setLeft(15);
    obj.layout73:setTop(100);
    obj.layout73:setWidth(225);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout73);
    obj.edit25:setLeft(0);
    obj.edit25:setTop(5);
    obj.edit25:setWidth(75);
    obj.edit25:setHeight(20);
    obj.edit25:setField("background_4");
    obj.edit25:setFontSize(12);
    obj.edit25:setName("edit25");

    obj.imageCheckBox247 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox247:setParent(obj.layout73);
    obj.imageCheckBox247:setLeft(80);
    obj.imageCheckBox247:setTop(0);
    obj.imageCheckBox247:setWidth(25);
    obj.imageCheckBox247:setHeight(25);
    obj.imageCheckBox247:setField("background_4_1");
    obj.imageCheckBox247:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox247:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox247:setName("imageCheckBox247");

    obj.imageCheckBox248 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox248:setParent(obj.layout73);
    obj.imageCheckBox248:setLeft(105);
    obj.imageCheckBox248:setTop(0);
    obj.imageCheckBox248:setWidth(25);
    obj.imageCheckBox248:setHeight(25);
    obj.imageCheckBox248:setField("background_4_2");
    obj.imageCheckBox248:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox248:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox248:setName("imageCheckBox248");

    obj.imageCheckBox249 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox249:setParent(obj.layout73);
    obj.imageCheckBox249:setLeft(130);
    obj.imageCheckBox249:setTop(0);
    obj.imageCheckBox249:setWidth(25);
    obj.imageCheckBox249:setHeight(25);
    obj.imageCheckBox249:setField("background_4_3");
    obj.imageCheckBox249:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox249:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox249:setName("imageCheckBox249");

    obj.imageCheckBox250 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox250:setParent(obj.layout73);
    obj.imageCheckBox250:setLeft(155);
    obj.imageCheckBox250:setTop(0);
    obj.imageCheckBox250:setWidth(25);
    obj.imageCheckBox250:setHeight(25);
    obj.imageCheckBox250:setField("background_4_4");
    obj.imageCheckBox250:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox250:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox250:setName("imageCheckBox250");

    obj.imageCheckBox251 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox251:setParent(obj.layout73);
    obj.imageCheckBox251:setLeft(180);
    obj.imageCheckBox251:setTop(0);
    obj.imageCheckBox251:setWidth(25);
    obj.imageCheckBox251:setHeight(25);
    obj.imageCheckBox251:setField("background_4_5");
    obj.imageCheckBox251:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox251:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox251:setName("imageCheckBox251");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout69);
    obj.layout74:setLeft(15);
    obj.layout74:setTop(125);
    obj.layout74:setWidth(225);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout74);
    obj.edit26:setLeft(0);
    obj.edit26:setTop(5);
    obj.edit26:setWidth(75);
    obj.edit26:setHeight(20);
    obj.edit26:setField("background_5");
    obj.edit26:setFontSize(12);
    obj.edit26:setName("edit26");

    obj.imageCheckBox252 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox252:setParent(obj.layout74);
    obj.imageCheckBox252:setLeft(80);
    obj.imageCheckBox252:setTop(0);
    obj.imageCheckBox252:setWidth(25);
    obj.imageCheckBox252:setHeight(25);
    obj.imageCheckBox252:setField("background_5_1");
    obj.imageCheckBox252:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox252:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox252:setName("imageCheckBox252");

    obj.imageCheckBox253 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox253:setParent(obj.layout74);
    obj.imageCheckBox253:setLeft(105);
    obj.imageCheckBox253:setTop(0);
    obj.imageCheckBox253:setWidth(25);
    obj.imageCheckBox253:setHeight(25);
    obj.imageCheckBox253:setField("background_5_2");
    obj.imageCheckBox253:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox253:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox253:setName("imageCheckBox253");

    obj.imageCheckBox254 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox254:setParent(obj.layout74);
    obj.imageCheckBox254:setLeft(130);
    obj.imageCheckBox254:setTop(0);
    obj.imageCheckBox254:setWidth(25);
    obj.imageCheckBox254:setHeight(25);
    obj.imageCheckBox254:setField("background_5_3");
    obj.imageCheckBox254:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox254:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox254:setName("imageCheckBox254");

    obj.imageCheckBox255 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox255:setParent(obj.layout74);
    obj.imageCheckBox255:setLeft(155);
    obj.imageCheckBox255:setTop(0);
    obj.imageCheckBox255:setWidth(25);
    obj.imageCheckBox255:setHeight(25);
    obj.imageCheckBox255:setField("background_5_4");
    obj.imageCheckBox255:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox255:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox255:setName("imageCheckBox255");

    obj.imageCheckBox256 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox256:setParent(obj.layout74);
    obj.imageCheckBox256:setLeft(180);
    obj.imageCheckBox256:setTop(0);
    obj.imageCheckBox256:setWidth(25);
    obj.imageCheckBox256:setHeight(25);
    obj.imageCheckBox256:setField("background_5_5");
    obj.imageCheckBox256:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox256:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox256:setName("imageCheckBox256");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout69);
    obj.layout75:setLeft(15);
    obj.layout75:setTop(150);
    obj.layout75:setWidth(225);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout75);
    obj.edit27:setLeft(0);
    obj.edit27:setTop(5);
    obj.edit27:setWidth(75);
    obj.edit27:setHeight(20);
    obj.edit27:setField("background_6");
    obj.edit27:setFontSize(12);
    obj.edit27:setName("edit27");

    obj.imageCheckBox257 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox257:setParent(obj.layout75);
    obj.imageCheckBox257:setLeft(80);
    obj.imageCheckBox257:setTop(0);
    obj.imageCheckBox257:setWidth(25);
    obj.imageCheckBox257:setHeight(25);
    obj.imageCheckBox257:setField("background_6_1");
    obj.imageCheckBox257:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox257:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox257:setName("imageCheckBox257");

    obj.imageCheckBox258 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox258:setParent(obj.layout75);
    obj.imageCheckBox258:setLeft(105);
    obj.imageCheckBox258:setTop(0);
    obj.imageCheckBox258:setWidth(25);
    obj.imageCheckBox258:setHeight(25);
    obj.imageCheckBox258:setField("background_6_2");
    obj.imageCheckBox258:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox258:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox258:setName("imageCheckBox258");

    obj.imageCheckBox259 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox259:setParent(obj.layout75);
    obj.imageCheckBox259:setLeft(130);
    obj.imageCheckBox259:setTop(0);
    obj.imageCheckBox259:setWidth(25);
    obj.imageCheckBox259:setHeight(25);
    obj.imageCheckBox259:setField("background_6_3");
    obj.imageCheckBox259:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox259:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox259:setName("imageCheckBox259");

    obj.imageCheckBox260 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox260:setParent(obj.layout75);
    obj.imageCheckBox260:setLeft(155);
    obj.imageCheckBox260:setTop(0);
    obj.imageCheckBox260:setWidth(25);
    obj.imageCheckBox260:setHeight(25);
    obj.imageCheckBox260:setField("background_6_4");
    obj.imageCheckBox260:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox260:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox260:setName("imageCheckBox260");

    obj.imageCheckBox261 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox261:setParent(obj.layout75);
    obj.imageCheckBox261:setLeft(180);
    obj.imageCheckBox261:setTop(0);
    obj.imageCheckBox261:setWidth(25);
    obj.imageCheckBox261:setHeight(25);
    obj.imageCheckBox261:setField("background_6_5");
    obj.imageCheckBox261:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox261:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox261:setName("imageCheckBox261");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Traits");
    obj.tab2:setName("tab2");

    obj.frmMDA20_2 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMDA20_2:setParent(obj.tab2);
    obj.frmMDA20_2:setName("frmMDA20_2");
    obj.frmMDA20_2:setAlign("client");
    obj.frmMDA20_2:setTheme("dark");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmMDA20_2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.scrollBox2);
    obj.layout76:setLeft(0);
    obj.layout76:setTop(0);
    obj.layout76:setWidth(255);
    obj.layout76:setHeight(355);
    obj.layout76:setName("layout76");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout76);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(10);
    obj.rectangle12:setYradius(10);
    obj.rectangle12:setCornerType("innerLine");
    obj.rectangle12:setName("rectangle12");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout76);
    obj.label65:setLeft(5);
    obj.label65:setTop(0);
    obj.label65:setWidth(240);
    obj.label65:setHeight(20);
    obj.label65:setText("OTHER TRAITS");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout76);
    obj.layout77:setLeft(15);
    obj.layout77:setTop(25);
    obj.layout77:setWidth(225);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout77);
    obj.edit28:setLeft(0);
    obj.edit28:setTop(5);
    obj.edit28:setWidth(95);
    obj.edit28:setHeight(20);
    obj.edit28:setField("trait_1");
    obj.edit28:setFontSize(12);
    obj.edit28:setName("edit28");

    obj.imageCheckBox262 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox262:setParent(obj.layout77);
    obj.imageCheckBox262:setLeft(100);
    obj.imageCheckBox262:setTop(0);
    obj.imageCheckBox262:setWidth(25);
    obj.imageCheckBox262:setHeight(25);
    obj.imageCheckBox262:setField("trait_1_1");
    obj.imageCheckBox262:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox262:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox262:setName("imageCheckBox262");

    obj.imageCheckBox263 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox263:setParent(obj.layout77);
    obj.imageCheckBox263:setLeft(125);
    obj.imageCheckBox263:setTop(0);
    obj.imageCheckBox263:setWidth(25);
    obj.imageCheckBox263:setHeight(25);
    obj.imageCheckBox263:setField("trait_1_2");
    obj.imageCheckBox263:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox263:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox263:setName("imageCheckBox263");

    obj.imageCheckBox264 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox264:setParent(obj.layout77);
    obj.imageCheckBox264:setLeft(150);
    obj.imageCheckBox264:setTop(0);
    obj.imageCheckBox264:setWidth(25);
    obj.imageCheckBox264:setHeight(25);
    obj.imageCheckBox264:setField("trait_1_3");
    obj.imageCheckBox264:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox264:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox264:setName("imageCheckBox264");

    obj.imageCheckBox265 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox265:setParent(obj.layout77);
    obj.imageCheckBox265:setLeft(175);
    obj.imageCheckBox265:setTop(0);
    obj.imageCheckBox265:setWidth(25);
    obj.imageCheckBox265:setHeight(25);
    obj.imageCheckBox265:setField("trait_1_4");
    obj.imageCheckBox265:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox265:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox265:setName("imageCheckBox265");

    obj.imageCheckBox266 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox266:setParent(obj.layout77);
    obj.imageCheckBox266:setLeft(200);
    obj.imageCheckBox266:setTop(0);
    obj.imageCheckBox266:setWidth(25);
    obj.imageCheckBox266:setHeight(25);
    obj.imageCheckBox266:setField("trait_1_5");
    obj.imageCheckBox266:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox266:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox266:setName("imageCheckBox266");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout76);
    obj.layout78:setLeft(15);
    obj.layout78:setTop(50);
    obj.layout78:setWidth(225);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout78);
    obj.edit29:setLeft(0);
    obj.edit29:setTop(5);
    obj.edit29:setWidth(95);
    obj.edit29:setHeight(20);
    obj.edit29:setField("trait_2");
    obj.edit29:setFontSize(12);
    obj.edit29:setName("edit29");

    obj.imageCheckBox267 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox267:setParent(obj.layout78);
    obj.imageCheckBox267:setLeft(100);
    obj.imageCheckBox267:setTop(0);
    obj.imageCheckBox267:setWidth(25);
    obj.imageCheckBox267:setHeight(25);
    obj.imageCheckBox267:setField("trait_2_1");
    obj.imageCheckBox267:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox267:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox267:setName("imageCheckBox267");

    obj.imageCheckBox268 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox268:setParent(obj.layout78);
    obj.imageCheckBox268:setLeft(125);
    obj.imageCheckBox268:setTop(0);
    obj.imageCheckBox268:setWidth(25);
    obj.imageCheckBox268:setHeight(25);
    obj.imageCheckBox268:setField("trait_2_2");
    obj.imageCheckBox268:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox268:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox268:setName("imageCheckBox268");

    obj.imageCheckBox269 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox269:setParent(obj.layout78);
    obj.imageCheckBox269:setLeft(150);
    obj.imageCheckBox269:setTop(0);
    obj.imageCheckBox269:setWidth(25);
    obj.imageCheckBox269:setHeight(25);
    obj.imageCheckBox269:setField("trait_2_3");
    obj.imageCheckBox269:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox269:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox269:setName("imageCheckBox269");

    obj.imageCheckBox270 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox270:setParent(obj.layout78);
    obj.imageCheckBox270:setLeft(175);
    obj.imageCheckBox270:setTop(0);
    obj.imageCheckBox270:setWidth(25);
    obj.imageCheckBox270:setHeight(25);
    obj.imageCheckBox270:setField("trait_2_4");
    obj.imageCheckBox270:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox270:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox270:setName("imageCheckBox270");

    obj.imageCheckBox271 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox271:setParent(obj.layout78);
    obj.imageCheckBox271:setLeft(200);
    obj.imageCheckBox271:setTop(0);
    obj.imageCheckBox271:setWidth(25);
    obj.imageCheckBox271:setHeight(25);
    obj.imageCheckBox271:setField("trait_2_5");
    obj.imageCheckBox271:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox271:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox271:setName("imageCheckBox271");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout76);
    obj.layout79:setLeft(15);
    obj.layout79:setTop(75);
    obj.layout79:setWidth(225);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout79);
    obj.edit30:setLeft(0);
    obj.edit30:setTop(5);
    obj.edit30:setWidth(95);
    obj.edit30:setHeight(20);
    obj.edit30:setField("trait_3");
    obj.edit30:setFontSize(12);
    obj.edit30:setName("edit30");

    obj.imageCheckBox272 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox272:setParent(obj.layout79);
    obj.imageCheckBox272:setLeft(100);
    obj.imageCheckBox272:setTop(0);
    obj.imageCheckBox272:setWidth(25);
    obj.imageCheckBox272:setHeight(25);
    obj.imageCheckBox272:setField("trait_3_1");
    obj.imageCheckBox272:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox272:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox272:setName("imageCheckBox272");

    obj.imageCheckBox273 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox273:setParent(obj.layout79);
    obj.imageCheckBox273:setLeft(125);
    obj.imageCheckBox273:setTop(0);
    obj.imageCheckBox273:setWidth(25);
    obj.imageCheckBox273:setHeight(25);
    obj.imageCheckBox273:setField("trait_3_2");
    obj.imageCheckBox273:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox273:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox273:setName("imageCheckBox273");

    obj.imageCheckBox274 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox274:setParent(obj.layout79);
    obj.imageCheckBox274:setLeft(150);
    obj.imageCheckBox274:setTop(0);
    obj.imageCheckBox274:setWidth(25);
    obj.imageCheckBox274:setHeight(25);
    obj.imageCheckBox274:setField("trait_3_3");
    obj.imageCheckBox274:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox274:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox274:setName("imageCheckBox274");

    obj.imageCheckBox275 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox275:setParent(obj.layout79);
    obj.imageCheckBox275:setLeft(175);
    obj.imageCheckBox275:setTop(0);
    obj.imageCheckBox275:setWidth(25);
    obj.imageCheckBox275:setHeight(25);
    obj.imageCheckBox275:setField("trait_3_4");
    obj.imageCheckBox275:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox275:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox275:setName("imageCheckBox275");

    obj.imageCheckBox276 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox276:setParent(obj.layout79);
    obj.imageCheckBox276:setLeft(200);
    obj.imageCheckBox276:setTop(0);
    obj.imageCheckBox276:setWidth(25);
    obj.imageCheckBox276:setHeight(25);
    obj.imageCheckBox276:setField("trait_3_5");
    obj.imageCheckBox276:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox276:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox276:setName("imageCheckBox276");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout76);
    obj.layout80:setLeft(15);
    obj.layout80:setTop(100);
    obj.layout80:setWidth(225);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout80);
    obj.edit31:setLeft(0);
    obj.edit31:setTop(5);
    obj.edit31:setWidth(95);
    obj.edit31:setHeight(20);
    obj.edit31:setField("trait_4");
    obj.edit31:setFontSize(12);
    obj.edit31:setName("edit31");

    obj.imageCheckBox277 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox277:setParent(obj.layout80);
    obj.imageCheckBox277:setLeft(100);
    obj.imageCheckBox277:setTop(0);
    obj.imageCheckBox277:setWidth(25);
    obj.imageCheckBox277:setHeight(25);
    obj.imageCheckBox277:setField("trait_4_1");
    obj.imageCheckBox277:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox277:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox277:setName("imageCheckBox277");

    obj.imageCheckBox278 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox278:setParent(obj.layout80);
    obj.imageCheckBox278:setLeft(125);
    obj.imageCheckBox278:setTop(0);
    obj.imageCheckBox278:setWidth(25);
    obj.imageCheckBox278:setHeight(25);
    obj.imageCheckBox278:setField("trait_4_2");
    obj.imageCheckBox278:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox278:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox278:setName("imageCheckBox278");

    obj.imageCheckBox279 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox279:setParent(obj.layout80);
    obj.imageCheckBox279:setLeft(150);
    obj.imageCheckBox279:setTop(0);
    obj.imageCheckBox279:setWidth(25);
    obj.imageCheckBox279:setHeight(25);
    obj.imageCheckBox279:setField("trait_4_3");
    obj.imageCheckBox279:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox279:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox279:setName("imageCheckBox279");

    obj.imageCheckBox280 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox280:setParent(obj.layout80);
    obj.imageCheckBox280:setLeft(175);
    obj.imageCheckBox280:setTop(0);
    obj.imageCheckBox280:setWidth(25);
    obj.imageCheckBox280:setHeight(25);
    obj.imageCheckBox280:setField("trait_4_4");
    obj.imageCheckBox280:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox280:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox280:setName("imageCheckBox280");

    obj.imageCheckBox281 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox281:setParent(obj.layout80);
    obj.imageCheckBox281:setLeft(200);
    obj.imageCheckBox281:setTop(0);
    obj.imageCheckBox281:setWidth(25);
    obj.imageCheckBox281:setHeight(25);
    obj.imageCheckBox281:setField("trait_4_5");
    obj.imageCheckBox281:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox281:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox281:setName("imageCheckBox281");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout76);
    obj.layout81:setLeft(15);
    obj.layout81:setTop(125);
    obj.layout81:setWidth(225);
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout81);
    obj.edit32:setLeft(0);
    obj.edit32:setTop(5);
    obj.edit32:setWidth(95);
    obj.edit32:setHeight(20);
    obj.edit32:setField("trait_5");
    obj.edit32:setFontSize(12);
    obj.edit32:setName("edit32");

    obj.imageCheckBox282 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox282:setParent(obj.layout81);
    obj.imageCheckBox282:setLeft(100);
    obj.imageCheckBox282:setTop(0);
    obj.imageCheckBox282:setWidth(25);
    obj.imageCheckBox282:setHeight(25);
    obj.imageCheckBox282:setField("trait_5_1");
    obj.imageCheckBox282:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox282:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox282:setName("imageCheckBox282");

    obj.imageCheckBox283 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox283:setParent(obj.layout81);
    obj.imageCheckBox283:setLeft(125);
    obj.imageCheckBox283:setTop(0);
    obj.imageCheckBox283:setWidth(25);
    obj.imageCheckBox283:setHeight(25);
    obj.imageCheckBox283:setField("trait_5_2");
    obj.imageCheckBox283:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox283:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox283:setName("imageCheckBox283");

    obj.imageCheckBox284 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox284:setParent(obj.layout81);
    obj.imageCheckBox284:setLeft(150);
    obj.imageCheckBox284:setTop(0);
    obj.imageCheckBox284:setWidth(25);
    obj.imageCheckBox284:setHeight(25);
    obj.imageCheckBox284:setField("trait_5_3");
    obj.imageCheckBox284:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox284:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox284:setName("imageCheckBox284");

    obj.imageCheckBox285 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox285:setParent(obj.layout81);
    obj.imageCheckBox285:setLeft(175);
    obj.imageCheckBox285:setTop(0);
    obj.imageCheckBox285:setWidth(25);
    obj.imageCheckBox285:setHeight(25);
    obj.imageCheckBox285:setField("trait_5_4");
    obj.imageCheckBox285:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox285:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox285:setName("imageCheckBox285");

    obj.imageCheckBox286 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox286:setParent(obj.layout81);
    obj.imageCheckBox286:setLeft(200);
    obj.imageCheckBox286:setTop(0);
    obj.imageCheckBox286:setWidth(25);
    obj.imageCheckBox286:setHeight(25);
    obj.imageCheckBox286:setField("trait_5_5");
    obj.imageCheckBox286:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox286:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox286:setName("imageCheckBox286");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout76);
    obj.layout82:setLeft(15);
    obj.layout82:setTop(150);
    obj.layout82:setWidth(225);
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout82);
    obj.edit33:setLeft(0);
    obj.edit33:setTop(5);
    obj.edit33:setWidth(95);
    obj.edit33:setHeight(20);
    obj.edit33:setField("trait_6");
    obj.edit33:setFontSize(12);
    obj.edit33:setName("edit33");

    obj.imageCheckBox287 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox287:setParent(obj.layout82);
    obj.imageCheckBox287:setLeft(100);
    obj.imageCheckBox287:setTop(0);
    obj.imageCheckBox287:setWidth(25);
    obj.imageCheckBox287:setHeight(25);
    obj.imageCheckBox287:setField("trait_6_1");
    obj.imageCheckBox287:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox287:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox287:setName("imageCheckBox287");

    obj.imageCheckBox288 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox288:setParent(obj.layout82);
    obj.imageCheckBox288:setLeft(125);
    obj.imageCheckBox288:setTop(0);
    obj.imageCheckBox288:setWidth(25);
    obj.imageCheckBox288:setHeight(25);
    obj.imageCheckBox288:setField("trait_6_2");
    obj.imageCheckBox288:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox288:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox288:setName("imageCheckBox288");

    obj.imageCheckBox289 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox289:setParent(obj.layout82);
    obj.imageCheckBox289:setLeft(150);
    obj.imageCheckBox289:setTop(0);
    obj.imageCheckBox289:setWidth(25);
    obj.imageCheckBox289:setHeight(25);
    obj.imageCheckBox289:setField("trait_6_3");
    obj.imageCheckBox289:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox289:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox289:setName("imageCheckBox289");

    obj.imageCheckBox290 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox290:setParent(obj.layout82);
    obj.imageCheckBox290:setLeft(175);
    obj.imageCheckBox290:setTop(0);
    obj.imageCheckBox290:setWidth(25);
    obj.imageCheckBox290:setHeight(25);
    obj.imageCheckBox290:setField("trait_6_4");
    obj.imageCheckBox290:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox290:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox290:setName("imageCheckBox290");

    obj.imageCheckBox291 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox291:setParent(obj.layout82);
    obj.imageCheckBox291:setLeft(200);
    obj.imageCheckBox291:setTop(0);
    obj.imageCheckBox291:setWidth(25);
    obj.imageCheckBox291:setHeight(25);
    obj.imageCheckBox291:setField("trait_6_5");
    obj.imageCheckBox291:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox291:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox291:setName("imageCheckBox291");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout76);
    obj.layout83:setLeft(15);
    obj.layout83:setTop(175);
    obj.layout83:setWidth(225);
    obj.layout83:setHeight(25);
    obj.layout83:setName("layout83");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout83);
    obj.edit34:setLeft(0);
    obj.edit34:setTop(5);
    obj.edit34:setWidth(95);
    obj.edit34:setHeight(20);
    obj.edit34:setField("trait_7");
    obj.edit34:setFontSize(12);
    obj.edit34:setName("edit34");

    obj.imageCheckBox292 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox292:setParent(obj.layout83);
    obj.imageCheckBox292:setLeft(100);
    obj.imageCheckBox292:setTop(0);
    obj.imageCheckBox292:setWidth(25);
    obj.imageCheckBox292:setHeight(25);
    obj.imageCheckBox292:setField("trait_7_1");
    obj.imageCheckBox292:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox292:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox292:setName("imageCheckBox292");

    obj.imageCheckBox293 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox293:setParent(obj.layout83);
    obj.imageCheckBox293:setLeft(125);
    obj.imageCheckBox293:setTop(0);
    obj.imageCheckBox293:setWidth(25);
    obj.imageCheckBox293:setHeight(25);
    obj.imageCheckBox293:setField("trait_7_2");
    obj.imageCheckBox293:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox293:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox293:setName("imageCheckBox293");

    obj.imageCheckBox294 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox294:setParent(obj.layout83);
    obj.imageCheckBox294:setLeft(150);
    obj.imageCheckBox294:setTop(0);
    obj.imageCheckBox294:setWidth(25);
    obj.imageCheckBox294:setHeight(25);
    obj.imageCheckBox294:setField("trait_7_3");
    obj.imageCheckBox294:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox294:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox294:setName("imageCheckBox294");

    obj.imageCheckBox295 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox295:setParent(obj.layout83);
    obj.imageCheckBox295:setLeft(175);
    obj.imageCheckBox295:setTop(0);
    obj.imageCheckBox295:setWidth(25);
    obj.imageCheckBox295:setHeight(25);
    obj.imageCheckBox295:setField("trait_7_4");
    obj.imageCheckBox295:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox295:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox295:setName("imageCheckBox295");

    obj.imageCheckBox296 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox296:setParent(obj.layout83);
    obj.imageCheckBox296:setLeft(200);
    obj.imageCheckBox296:setTop(0);
    obj.imageCheckBox296:setWidth(25);
    obj.imageCheckBox296:setHeight(25);
    obj.imageCheckBox296:setField("trait_7_5");
    obj.imageCheckBox296:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox296:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox296:setName("imageCheckBox296");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout76);
    obj.layout84:setLeft(15);
    obj.layout84:setTop(200);
    obj.layout84:setWidth(225);
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout84);
    obj.edit35:setLeft(0);
    obj.edit35:setTop(5);
    obj.edit35:setWidth(95);
    obj.edit35:setHeight(20);
    obj.edit35:setField("trait_8");
    obj.edit35:setFontSize(12);
    obj.edit35:setName("edit35");

    obj.imageCheckBox297 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox297:setParent(obj.layout84);
    obj.imageCheckBox297:setLeft(100);
    obj.imageCheckBox297:setTop(0);
    obj.imageCheckBox297:setWidth(25);
    obj.imageCheckBox297:setHeight(25);
    obj.imageCheckBox297:setField("trait_8_1");
    obj.imageCheckBox297:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox297:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox297:setName("imageCheckBox297");

    obj.imageCheckBox298 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox298:setParent(obj.layout84);
    obj.imageCheckBox298:setLeft(125);
    obj.imageCheckBox298:setTop(0);
    obj.imageCheckBox298:setWidth(25);
    obj.imageCheckBox298:setHeight(25);
    obj.imageCheckBox298:setField("trait_8_2");
    obj.imageCheckBox298:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox298:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox298:setName("imageCheckBox298");

    obj.imageCheckBox299 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox299:setParent(obj.layout84);
    obj.imageCheckBox299:setLeft(150);
    obj.imageCheckBox299:setTop(0);
    obj.imageCheckBox299:setWidth(25);
    obj.imageCheckBox299:setHeight(25);
    obj.imageCheckBox299:setField("trait_8_3");
    obj.imageCheckBox299:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox299:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox299:setName("imageCheckBox299");

    obj.imageCheckBox300 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox300:setParent(obj.layout84);
    obj.imageCheckBox300:setLeft(175);
    obj.imageCheckBox300:setTop(0);
    obj.imageCheckBox300:setWidth(25);
    obj.imageCheckBox300:setHeight(25);
    obj.imageCheckBox300:setField("trait_8_4");
    obj.imageCheckBox300:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox300:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox300:setName("imageCheckBox300");

    obj.imageCheckBox301 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox301:setParent(obj.layout84);
    obj.imageCheckBox301:setLeft(200);
    obj.imageCheckBox301:setTop(0);
    obj.imageCheckBox301:setWidth(25);
    obj.imageCheckBox301:setHeight(25);
    obj.imageCheckBox301:setField("trait_8_5");
    obj.imageCheckBox301:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox301:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox301:setName("imageCheckBox301");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout76);
    obj.layout85:setLeft(15);
    obj.layout85:setTop(225);
    obj.layout85:setWidth(225);
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout85);
    obj.edit36:setLeft(0);
    obj.edit36:setTop(5);
    obj.edit36:setWidth(95);
    obj.edit36:setHeight(20);
    obj.edit36:setField("trait_9");
    obj.edit36:setFontSize(12);
    obj.edit36:setName("edit36");

    obj.imageCheckBox302 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox302:setParent(obj.layout85);
    obj.imageCheckBox302:setLeft(100);
    obj.imageCheckBox302:setTop(0);
    obj.imageCheckBox302:setWidth(25);
    obj.imageCheckBox302:setHeight(25);
    obj.imageCheckBox302:setField("trait_9_1");
    obj.imageCheckBox302:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox302:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox302:setName("imageCheckBox302");

    obj.imageCheckBox303 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox303:setParent(obj.layout85);
    obj.imageCheckBox303:setLeft(125);
    obj.imageCheckBox303:setTop(0);
    obj.imageCheckBox303:setWidth(25);
    obj.imageCheckBox303:setHeight(25);
    obj.imageCheckBox303:setField("trait_9_2");
    obj.imageCheckBox303:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox303:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox303:setName("imageCheckBox303");

    obj.imageCheckBox304 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox304:setParent(obj.layout85);
    obj.imageCheckBox304:setLeft(150);
    obj.imageCheckBox304:setTop(0);
    obj.imageCheckBox304:setWidth(25);
    obj.imageCheckBox304:setHeight(25);
    obj.imageCheckBox304:setField("trait_9_3");
    obj.imageCheckBox304:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox304:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox304:setName("imageCheckBox304");

    obj.imageCheckBox305 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox305:setParent(obj.layout85);
    obj.imageCheckBox305:setLeft(175);
    obj.imageCheckBox305:setTop(0);
    obj.imageCheckBox305:setWidth(25);
    obj.imageCheckBox305:setHeight(25);
    obj.imageCheckBox305:setField("trait_9_4");
    obj.imageCheckBox305:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox305:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox305:setName("imageCheckBox305");

    obj.imageCheckBox306 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox306:setParent(obj.layout85);
    obj.imageCheckBox306:setLeft(200);
    obj.imageCheckBox306:setTop(0);
    obj.imageCheckBox306:setWidth(25);
    obj.imageCheckBox306:setHeight(25);
    obj.imageCheckBox306:setField("trait_9_5");
    obj.imageCheckBox306:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox306:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox306:setName("imageCheckBox306");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout76);
    obj.layout86:setLeft(15);
    obj.layout86:setTop(250);
    obj.layout86:setWidth(225);
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout86);
    obj.edit37:setLeft(0);
    obj.edit37:setTop(5);
    obj.edit37:setWidth(95);
    obj.edit37:setHeight(20);
    obj.edit37:setField("trait_10");
    obj.edit37:setFontSize(12);
    obj.edit37:setName("edit37");

    obj.imageCheckBox307 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox307:setParent(obj.layout86);
    obj.imageCheckBox307:setLeft(100);
    obj.imageCheckBox307:setTop(0);
    obj.imageCheckBox307:setWidth(25);
    obj.imageCheckBox307:setHeight(25);
    obj.imageCheckBox307:setField("trait_10_1");
    obj.imageCheckBox307:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox307:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox307:setName("imageCheckBox307");

    obj.imageCheckBox308 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox308:setParent(obj.layout86);
    obj.imageCheckBox308:setLeft(125);
    obj.imageCheckBox308:setTop(0);
    obj.imageCheckBox308:setWidth(25);
    obj.imageCheckBox308:setHeight(25);
    obj.imageCheckBox308:setField("trait_10_2");
    obj.imageCheckBox308:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox308:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox308:setName("imageCheckBox308");

    obj.imageCheckBox309 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox309:setParent(obj.layout86);
    obj.imageCheckBox309:setLeft(150);
    obj.imageCheckBox309:setTop(0);
    obj.imageCheckBox309:setWidth(25);
    obj.imageCheckBox309:setHeight(25);
    obj.imageCheckBox309:setField("trait_10_3");
    obj.imageCheckBox309:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox309:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox309:setName("imageCheckBox309");

    obj.imageCheckBox310 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox310:setParent(obj.layout86);
    obj.imageCheckBox310:setLeft(175);
    obj.imageCheckBox310:setTop(0);
    obj.imageCheckBox310:setWidth(25);
    obj.imageCheckBox310:setHeight(25);
    obj.imageCheckBox310:setField("trait_10_4");
    obj.imageCheckBox310:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox310:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox310:setName("imageCheckBox310");

    obj.imageCheckBox311 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox311:setParent(obj.layout86);
    obj.imageCheckBox311:setLeft(200);
    obj.imageCheckBox311:setTop(0);
    obj.imageCheckBox311:setWidth(25);
    obj.imageCheckBox311:setHeight(25);
    obj.imageCheckBox311:setField("trait_10_5");
    obj.imageCheckBox311:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox311:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox311:setName("imageCheckBox311");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout76);
    obj.layout87:setLeft(15);
    obj.layout87:setTop(275);
    obj.layout87:setWidth(225);
    obj.layout87:setHeight(25);
    obj.layout87:setName("layout87");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout87);
    obj.edit38:setLeft(0);
    obj.edit38:setTop(5);
    obj.edit38:setWidth(95);
    obj.edit38:setHeight(20);
    obj.edit38:setField("trait_11");
    obj.edit38:setFontSize(12);
    obj.edit38:setName("edit38");

    obj.imageCheckBox312 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox312:setParent(obj.layout87);
    obj.imageCheckBox312:setLeft(100);
    obj.imageCheckBox312:setTop(0);
    obj.imageCheckBox312:setWidth(25);
    obj.imageCheckBox312:setHeight(25);
    obj.imageCheckBox312:setField("trait_11_1");
    obj.imageCheckBox312:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox312:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox312:setName("imageCheckBox312");

    obj.imageCheckBox313 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox313:setParent(obj.layout87);
    obj.imageCheckBox313:setLeft(125);
    obj.imageCheckBox313:setTop(0);
    obj.imageCheckBox313:setWidth(25);
    obj.imageCheckBox313:setHeight(25);
    obj.imageCheckBox313:setField("trait_11_2");
    obj.imageCheckBox313:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox313:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox313:setName("imageCheckBox313");

    obj.imageCheckBox314 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox314:setParent(obj.layout87);
    obj.imageCheckBox314:setLeft(150);
    obj.imageCheckBox314:setTop(0);
    obj.imageCheckBox314:setWidth(25);
    obj.imageCheckBox314:setHeight(25);
    obj.imageCheckBox314:setField("trait_11_3");
    obj.imageCheckBox314:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox314:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox314:setName("imageCheckBox314");

    obj.imageCheckBox315 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox315:setParent(obj.layout87);
    obj.imageCheckBox315:setLeft(175);
    obj.imageCheckBox315:setTop(0);
    obj.imageCheckBox315:setWidth(25);
    obj.imageCheckBox315:setHeight(25);
    obj.imageCheckBox315:setField("trait_11_4");
    obj.imageCheckBox315:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox315:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox315:setName("imageCheckBox315");

    obj.imageCheckBox316 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox316:setParent(obj.layout87);
    obj.imageCheckBox316:setLeft(200);
    obj.imageCheckBox316:setTop(0);
    obj.imageCheckBox316:setWidth(25);
    obj.imageCheckBox316:setHeight(25);
    obj.imageCheckBox316:setField("trait_11_5");
    obj.imageCheckBox316:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox316:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox316:setName("imageCheckBox316");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout76);
    obj.layout88:setLeft(15);
    obj.layout88:setTop(300);
    obj.layout88:setWidth(225);
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout88);
    obj.edit39:setLeft(0);
    obj.edit39:setTop(5);
    obj.edit39:setWidth(95);
    obj.edit39:setHeight(20);
    obj.edit39:setField("trait_12");
    obj.edit39:setFontSize(12);
    obj.edit39:setName("edit39");

    obj.imageCheckBox317 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox317:setParent(obj.layout88);
    obj.imageCheckBox317:setLeft(100);
    obj.imageCheckBox317:setTop(0);
    obj.imageCheckBox317:setWidth(25);
    obj.imageCheckBox317:setHeight(25);
    obj.imageCheckBox317:setField("trait_12_1");
    obj.imageCheckBox317:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox317:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox317:setName("imageCheckBox317");

    obj.imageCheckBox318 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox318:setParent(obj.layout88);
    obj.imageCheckBox318:setLeft(125);
    obj.imageCheckBox318:setTop(0);
    obj.imageCheckBox318:setWidth(25);
    obj.imageCheckBox318:setHeight(25);
    obj.imageCheckBox318:setField("trait_12_2");
    obj.imageCheckBox318:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox318:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox318:setName("imageCheckBox318");

    obj.imageCheckBox319 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox319:setParent(obj.layout88);
    obj.imageCheckBox319:setLeft(150);
    obj.imageCheckBox319:setTop(0);
    obj.imageCheckBox319:setWidth(25);
    obj.imageCheckBox319:setHeight(25);
    obj.imageCheckBox319:setField("trait_12_3");
    obj.imageCheckBox319:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox319:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox319:setName("imageCheckBox319");

    obj.imageCheckBox320 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox320:setParent(obj.layout88);
    obj.imageCheckBox320:setLeft(175);
    obj.imageCheckBox320:setTop(0);
    obj.imageCheckBox320:setWidth(25);
    obj.imageCheckBox320:setHeight(25);
    obj.imageCheckBox320:setField("trait_12_4");
    obj.imageCheckBox320:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox320:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox320:setName("imageCheckBox320");

    obj.imageCheckBox321 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox321:setParent(obj.layout88);
    obj.imageCheckBox321:setLeft(200);
    obj.imageCheckBox321:setTop(0);
    obj.imageCheckBox321:setWidth(25);
    obj.imageCheckBox321:setHeight(25);
    obj.imageCheckBox321:setField("trait_12_5");
    obj.imageCheckBox321:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox321:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox321:setName("imageCheckBox321");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.scrollBox2);
    obj.layout89:setLeft(265);
    obj.layout89:setTop(0);
    obj.layout89:setWidth(255);
    obj.layout89:setHeight(355);
    obj.layout89:setName("layout89");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout89);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setXradius(10);
    obj.rectangle13:setYradius(10);
    obj.rectangle13:setCornerType("innerLine");
    obj.rectangle13:setName("rectangle13");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout89);
    obj.label66:setLeft(5);
    obj.label66:setTop(0);
    obj.label66:setWidth(240);
    obj.label66:setHeight(20);
    obj.label66:setText("ROTES");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout89);
    obj.layout90:setLeft(15);
    obj.layout90:setTop(25);
    obj.layout90:setWidth(225);
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout90);
    obj.edit40:setLeft(0);
    obj.edit40:setTop(5);
    obj.edit40:setWidth(255);
    obj.edit40:setHeight(20);
    obj.edit40:setField("rotes_1");
    obj.edit40:setName("edit40");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout89);
    obj.layout91:setLeft(15);
    obj.layout91:setTop(50);
    obj.layout91:setWidth(225);
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout91);
    obj.edit41:setLeft(0);
    obj.edit41:setTop(5);
    obj.edit41:setWidth(255);
    obj.edit41:setHeight(20);
    obj.edit41:setField("rotes_2");
    obj.edit41:setName("edit41");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout89);
    obj.layout92:setLeft(15);
    obj.layout92:setTop(75);
    obj.layout92:setWidth(225);
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout92);
    obj.edit42:setLeft(0);
    obj.edit42:setTop(5);
    obj.edit42:setWidth(255);
    obj.edit42:setHeight(20);
    obj.edit42:setField("rotes_3");
    obj.edit42:setName("edit42");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout89);
    obj.layout93:setLeft(15);
    obj.layout93:setTop(100);
    obj.layout93:setWidth(225);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout93);
    obj.edit43:setLeft(0);
    obj.edit43:setTop(5);
    obj.edit43:setWidth(255);
    obj.edit43:setHeight(20);
    obj.edit43:setField("rotes_4");
    obj.edit43:setName("edit43");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout89);
    obj.layout94:setLeft(15);
    obj.layout94:setTop(125);
    obj.layout94:setWidth(225);
    obj.layout94:setHeight(25);
    obj.layout94:setName("layout94");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout94);
    obj.edit44:setLeft(0);
    obj.edit44:setTop(5);
    obj.edit44:setWidth(255);
    obj.edit44:setHeight(20);
    obj.edit44:setField("rotes_5");
    obj.edit44:setName("edit44");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout89);
    obj.layout95:setLeft(15);
    obj.layout95:setTop(150);
    obj.layout95:setWidth(225);
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout95);
    obj.edit45:setLeft(0);
    obj.edit45:setTop(5);
    obj.edit45:setWidth(255);
    obj.edit45:setHeight(20);
    obj.edit45:setField("rotes_6");
    obj.edit45:setName("edit45");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout89);
    obj.layout96:setLeft(15);
    obj.layout96:setTop(175);
    obj.layout96:setWidth(225);
    obj.layout96:setHeight(25);
    obj.layout96:setName("layout96");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout96);
    obj.edit46:setLeft(0);
    obj.edit46:setTop(5);
    obj.edit46:setWidth(255);
    obj.edit46:setHeight(20);
    obj.edit46:setField("rotes_7");
    obj.edit46:setName("edit46");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout89);
    obj.layout97:setLeft(15);
    obj.layout97:setTop(200);
    obj.layout97:setWidth(225);
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout97);
    obj.edit47:setLeft(0);
    obj.edit47:setTop(5);
    obj.edit47:setWidth(255);
    obj.edit47:setHeight(20);
    obj.edit47:setField("rotes_8");
    obj.edit47:setName("edit47");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout89);
    obj.layout98:setLeft(15);
    obj.layout98:setTop(225);
    obj.layout98:setWidth(225);
    obj.layout98:setHeight(25);
    obj.layout98:setName("layout98");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout98);
    obj.edit48:setLeft(0);
    obj.edit48:setTop(5);
    obj.edit48:setWidth(255);
    obj.edit48:setHeight(20);
    obj.edit48:setField("rotes_9");
    obj.edit48:setName("edit48");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout89);
    obj.layout99:setLeft(15);
    obj.layout99:setTop(250);
    obj.layout99:setWidth(225);
    obj.layout99:setHeight(25);
    obj.layout99:setName("layout99");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout99);
    obj.edit49:setLeft(0);
    obj.edit49:setTop(5);
    obj.edit49:setWidth(255);
    obj.edit49:setHeight(20);
    obj.edit49:setField("rotes_10");
    obj.edit49:setName("edit49");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout89);
    obj.layout100:setLeft(15);
    obj.layout100:setTop(275);
    obj.layout100:setWidth(225);
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout100);
    obj.edit50:setLeft(0);
    obj.edit50:setTop(5);
    obj.edit50:setWidth(255);
    obj.edit50:setHeight(20);
    obj.edit50:setField("rotes_11");
    obj.edit50:setName("edit50");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout89);
    obj.layout101:setLeft(15);
    obj.layout101:setTop(300);
    obj.layout101:setWidth(225);
    obj.layout101:setHeight(25);
    obj.layout101:setName("layout101");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout101);
    obj.edit51:setLeft(0);
    obj.edit51:setTop(5);
    obj.edit51:setWidth(255);
    obj.edit51:setHeight(20);
    obj.edit51:setField("rotes_12");
    obj.edit51:setName("edit51");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.scrollBox2);
    obj.layout102:setLeft(530);
    obj.layout102:setTop(0);
    obj.layout102:setWidth(300);
    obj.layout102:setHeight(355);
    obj.layout102:setName("layout102");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout102);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(10);
    obj.rectangle14:setYradius(10);
    obj.rectangle14:setCornerType("innerLine");
    obj.rectangle14:setName("rectangle14");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout102);
    obj.label67:setLeft(0);
    obj.label67:setTop(0);
    obj.label67:setWidth(300);
    obj.label67:setHeight(20);
    obj.label67:setText("TALISMANS");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout102);
    obj.button1:setLeft(185);
    obj.button1:setTop(0);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout102);
    obj.rectangle15:setLeft(5);
    obj.rectangle15:setTop(25);
    obj.rectangle15:setWidth(290);
    obj.rectangle15:setHeight(320);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.rclTalismans = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTalismans:setParent(obj.layout102);
    obj.rclTalismans:setLeft(5);
    obj.rclTalismans:setTop(25);
    obj.rclTalismans:setWidth(290);
    obj.rclTalismans:setHeight(320);
    obj.rclTalismans:setName("rclTalismans");
    obj.rclTalismans:setField("listaDeTalismans");
    obj.rclTalismans:setTemplateForm("frmM20_2_1");
    obj.rclTalismans:setLayout("vertical");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.scrollBox2);
    obj.layout103:setLeft(840);
    obj.layout103:setTop(0);
    obj.layout103:setWidth(300);
    obj.layout103:setHeight(355);
    obj.layout103:setName("layout103");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout103);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setXradius(10);
    obj.rectangle16:setYradius(10);
    obj.rectangle16:setCornerType("innerLine");
    obj.rectangle16:setName("rectangle16");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout103);
    obj.label68:setLeft(0);
    obj.label68:setTop(0);
    obj.label68:setWidth(300);
    obj.label68:setHeight(20);
    obj.label68:setText("MAGIC AIDES");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout103);
    obj.button2:setLeft(195);
    obj.button2:setTop(0);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout103);
    obj.rectangle17:setLeft(5);
    obj.rectangle17:setTop(25);
    obj.rectangle17:setWidth(290);
    obj.rectangle17:setHeight(320);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.rclAides = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAides:setParent(obj.layout103);
    obj.rclAides:setLeft(5);
    obj.rclAides:setTop(25);
    obj.rclAides:setWidth(290);
    obj.rclAides:setHeight(320);
    obj.rclAides:setName("rclAides");
    obj.rclAides:setField("listaDeAides");
    obj.rclAides:setTemplateForm("frmM20_2_1");
    obj.rclAides:setLayout("vertical");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.scrollBox2);
    obj.layout104:setLeft(0);
    obj.layout104:setTop(365);
    obj.layout104:setWidth(800);
    obj.layout104:setHeight(270);
    obj.layout104:setName("layout104");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout104);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("#FFFFFF00");
    obj.rectangle18:setStrokeColor("black");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setXradius(10);
    obj.rectangle18:setYradius(10);
    obj.rectangle18:setCornerType("innerLine");
    obj.rectangle18:setName("rectangle18");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout104);
    obj.label69:setLeft(0);
    obj.label69:setTop(0);
    obj.label69:setWidth(800);
    obj.label69:setHeight(20);
    obj.label69:setText("MERITS AND FLAWS");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout104);
    obj.layout105:setLeft(15);
    obj.layout105:setTop(25);
    obj.layout105:setWidth(380);
    obj.layout105:setHeight(240);
    obj.layout105:setName("layout105");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout105);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setXradius(10);
    obj.rectangle19:setYradius(10);
    obj.rectangle19:setCornerType("innerLine");
    obj.rectangle19:setName("rectangle19");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout105);
    obj.label70:setLeft(15);
    obj.label70:setTop(0);
    obj.label70:setWidth(200);
    obj.label70:setHeight(20);
    obj.label70:setText("Merit");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout105);
    obj.label71:setLeft(215);
    obj.label71:setTop(0);
    obj.label71:setWidth(100);
    obj.label71:setHeight(20);
    obj.label71:setText("Type");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout105);
    obj.label72:setLeft(315);
    obj.label72:setTop(0);
    obj.label72:setWidth(50);
    obj.label72:setHeight(20);
    obj.label72:setText("Cost");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setLeft(15);
    obj.layout106:setTop(25);
    obj.layout106:setWidth(350);
    obj.layout106:setHeight(25);
    obj.layout106:setName("layout106");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout106);
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(200);
    obj.edit52:setHeight(24);
    obj.edit52:setField("merit_m1");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout106);
    obj.edit53:setLeft(200);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(100);
    obj.edit53:setHeight(24);
    obj.edit53:setField("type_m1");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout106);
    obj.edit54:setLeft(300);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(24);
    obj.edit54:setField("costy_m1");
    obj.edit54:setName("edit54");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout105);
    obj.layout107:setLeft(15);
    obj.layout107:setTop(50);
    obj.layout107:setWidth(350);
    obj.layout107:setHeight(25);
    obj.layout107:setName("layout107");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout107);
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(200);
    obj.edit55:setHeight(24);
    obj.edit55:setField("merit_m2");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout107);
    obj.edit56:setLeft(200);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(100);
    obj.edit56:setHeight(24);
    obj.edit56:setField("type_m2");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout107);
    obj.edit57:setLeft(300);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(24);
    obj.edit57:setField("costy_m2");
    obj.edit57:setName("edit57");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout105);
    obj.layout108:setLeft(15);
    obj.layout108:setTop(75);
    obj.layout108:setWidth(350);
    obj.layout108:setHeight(25);
    obj.layout108:setName("layout108");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout108);
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(200);
    obj.edit58:setHeight(24);
    obj.edit58:setField("merit_m3");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout108);
    obj.edit59:setLeft(200);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(100);
    obj.edit59:setHeight(24);
    obj.edit59:setField("type_m3");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout108);
    obj.edit60:setLeft(300);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(50);
    obj.edit60:setHeight(24);
    obj.edit60:setField("costy_m3");
    obj.edit60:setName("edit60");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout105);
    obj.layout109:setLeft(15);
    obj.layout109:setTop(100);
    obj.layout109:setWidth(350);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout109);
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(200);
    obj.edit61:setHeight(24);
    obj.edit61:setField("merit_m4");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout109);
    obj.edit62:setLeft(200);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(100);
    obj.edit62:setHeight(24);
    obj.edit62:setField("type_m4");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout109);
    obj.edit63:setLeft(300);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(24);
    obj.edit63:setField("costy_m4");
    obj.edit63:setName("edit63");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout105);
    obj.layout110:setLeft(15);
    obj.layout110:setTop(125);
    obj.layout110:setWidth(350);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout110);
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(200);
    obj.edit64:setHeight(24);
    obj.edit64:setField("merit_m5");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout110);
    obj.edit65:setLeft(200);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(100);
    obj.edit65:setHeight(24);
    obj.edit65:setField("type_m5");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout110);
    obj.edit66:setLeft(300);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(50);
    obj.edit66:setHeight(24);
    obj.edit66:setField("costy_m5");
    obj.edit66:setName("edit66");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout105);
    obj.layout111:setLeft(15);
    obj.layout111:setTop(150);
    obj.layout111:setWidth(350);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout111);
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(200);
    obj.edit67:setHeight(24);
    obj.edit67:setField("merit_m6");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout111);
    obj.edit68:setLeft(200);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(100);
    obj.edit68:setHeight(24);
    obj.edit68:setField("type_m6");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout111);
    obj.edit69:setLeft(300);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(50);
    obj.edit69:setHeight(24);
    obj.edit69:setField("costy_m6");
    obj.edit69:setName("edit69");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout105);
    obj.layout112:setLeft(15);
    obj.layout112:setTop(175);
    obj.layout112:setWidth(350);
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout112);
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(200);
    obj.edit70:setHeight(24);
    obj.edit70:setField("merit_m7");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout112);
    obj.edit71:setLeft(200);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(100);
    obj.edit71:setHeight(24);
    obj.edit71:setField("type_m7");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout112);
    obj.edit72:setLeft(300);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(50);
    obj.edit72:setHeight(24);
    obj.edit72:setField("costy_m7");
    obj.edit72:setName("edit72");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout105);
    obj.layout113:setLeft(15);
    obj.layout113:setTop(200);
    obj.layout113:setWidth(350);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout113);
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(200);
    obj.edit73:setHeight(24);
    obj.edit73:setField("merit_m8");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout113);
    obj.edit74:setLeft(200);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(100);
    obj.edit74:setHeight(24);
    obj.edit74:setField("type_m8");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout113);
    obj.edit75:setLeft(300);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(50);
    obj.edit75:setHeight(24);
    obj.edit75:setField("costy_m8");
    obj.edit75:setName("edit75");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout104);
    obj.layout114:setLeft(405);
    obj.layout114:setTop(25);
    obj.layout114:setWidth(380);
    obj.layout114:setHeight(240);
    obj.layout114:setName("layout114");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout114);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setXradius(10);
    obj.rectangle20:setYradius(10);
    obj.rectangle20:setCornerType("innerLine");
    obj.rectangle20:setName("rectangle20");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout114);
    obj.label73:setLeft(15);
    obj.label73:setTop(0);
    obj.label73:setWidth(200);
    obj.label73:setHeight(20);
    obj.label73:setText("Flaw");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout114);
    obj.label74:setLeft(215);
    obj.label74:setTop(0);
    obj.label74:setWidth(100);
    obj.label74:setHeight(20);
    obj.label74:setText("Type");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout114);
    obj.label75:setLeft(315);
    obj.label75:setTop(0);
    obj.label75:setWidth(50);
    obj.label75:setHeight(20);
    obj.label75:setText("Cost");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout114);
    obj.layout115:setLeft(15);
    obj.layout115:setTop(25);
    obj.layout115:setWidth(350);
    obj.layout115:setHeight(25);
    obj.layout115:setName("layout115");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout115);
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(200);
    obj.edit76:setHeight(24);
    obj.edit76:setField("merit_f1");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout115);
    obj.edit77:setLeft(200);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(100);
    obj.edit77:setHeight(24);
    obj.edit77:setField("type_f1");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout115);
    obj.edit78:setLeft(300);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(50);
    obj.edit78:setHeight(24);
    obj.edit78:setField("costy_f1");
    obj.edit78:setName("edit78");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout114);
    obj.layout116:setLeft(15);
    obj.layout116:setTop(50);
    obj.layout116:setWidth(350);
    obj.layout116:setHeight(25);
    obj.layout116:setName("layout116");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout116);
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(200);
    obj.edit79:setHeight(24);
    obj.edit79:setField("merit_f2");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout116);
    obj.edit80:setLeft(200);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(100);
    obj.edit80:setHeight(24);
    obj.edit80:setField("type_f2");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout116);
    obj.edit81:setLeft(300);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(50);
    obj.edit81:setHeight(24);
    obj.edit81:setField("costy_f2");
    obj.edit81:setName("edit81");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout114);
    obj.layout117:setLeft(15);
    obj.layout117:setTop(75);
    obj.layout117:setWidth(350);
    obj.layout117:setHeight(25);
    obj.layout117:setName("layout117");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout117);
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(200);
    obj.edit82:setHeight(24);
    obj.edit82:setField("merit_f3");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout117);
    obj.edit83:setLeft(200);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(100);
    obj.edit83:setHeight(24);
    obj.edit83:setField("type_f3");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout117);
    obj.edit84:setLeft(300);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(50);
    obj.edit84:setHeight(24);
    obj.edit84:setField("costy_f3");
    obj.edit84:setName("edit84");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout114);
    obj.layout118:setLeft(15);
    obj.layout118:setTop(100);
    obj.layout118:setWidth(350);
    obj.layout118:setHeight(25);
    obj.layout118:setName("layout118");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout118);
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(200);
    obj.edit85:setHeight(24);
    obj.edit85:setField("merit_f4");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout118);
    obj.edit86:setLeft(200);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(100);
    obj.edit86:setHeight(24);
    obj.edit86:setField("type_f4");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout118);
    obj.edit87:setLeft(300);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(24);
    obj.edit87:setField("costy_f4");
    obj.edit87:setName("edit87");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout114);
    obj.layout119:setLeft(15);
    obj.layout119:setTop(125);
    obj.layout119:setWidth(350);
    obj.layout119:setHeight(25);
    obj.layout119:setName("layout119");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout119);
    obj.edit88:setLeft(0);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(200);
    obj.edit88:setHeight(24);
    obj.edit88:setField("merit_f5");
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout119);
    obj.edit89:setLeft(200);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(100);
    obj.edit89:setHeight(24);
    obj.edit89:setField("type_f5");
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout119);
    obj.edit90:setLeft(300);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(50);
    obj.edit90:setHeight(24);
    obj.edit90:setField("costy_f5");
    obj.edit90:setName("edit90");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout114);
    obj.layout120:setLeft(15);
    obj.layout120:setTop(150);
    obj.layout120:setWidth(350);
    obj.layout120:setHeight(25);
    obj.layout120:setName("layout120");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout120);
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(200);
    obj.edit91:setHeight(24);
    obj.edit91:setField("merit_f6");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout120);
    obj.edit92:setLeft(200);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(100);
    obj.edit92:setHeight(24);
    obj.edit92:setField("type_f6");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout120);
    obj.edit93:setLeft(300);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(50);
    obj.edit93:setHeight(24);
    obj.edit93:setField("costy_f6");
    obj.edit93:setName("edit93");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout114);
    obj.layout121:setLeft(15);
    obj.layout121:setTop(175);
    obj.layout121:setWidth(350);
    obj.layout121:setHeight(25);
    obj.layout121:setName("layout121");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout121);
    obj.edit94:setLeft(0);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(200);
    obj.edit94:setHeight(24);
    obj.edit94:setField("merit_f7");
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout121);
    obj.edit95:setLeft(200);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(100);
    obj.edit95:setHeight(24);
    obj.edit95:setField("type_f7");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout121);
    obj.edit96:setLeft(300);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(50);
    obj.edit96:setHeight(24);
    obj.edit96:setField("costy_f7");
    obj.edit96:setName("edit96");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout114);
    obj.layout122:setLeft(15);
    obj.layout122:setTop(200);
    obj.layout122:setWidth(350);
    obj.layout122:setHeight(25);
    obj.layout122:setName("layout122");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout122);
    obj.edit97:setLeft(0);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(200);
    obj.edit97:setHeight(24);
    obj.edit97:setField("merit_f8");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout122);
    obj.edit98:setLeft(200);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(100);
    obj.edit98:setHeight(24);
    obj.edit98:setField("type_f8");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout122);
    obj.edit99:setLeft(300);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(50);
    obj.edit99:setHeight(24);
    obj.edit99:setField("costy_f8");
    obj.edit99:setName("edit99");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox2);
    obj.layout123:setLeft(810);
    obj.layout123:setTop(365);
    obj.layout123:setWidth(255);
    obj.layout123:setHeight(135);
    obj.layout123:setName("layout123");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout123);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("black");
    obj.rectangle21:setXradius(10);
    obj.rectangle21:setYradius(10);
    obj.rectangle21:setCornerType("innerLine");
    obj.rectangle21:setName("rectangle21");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout123);
    obj.label76:setLeft(5);
    obj.label76:setTop(0);
    obj.label76:setWidth(255);
    obj.label76:setHeight(20);
    obj.label76:setText("PILARS");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout123);
    obj.layout124:setLeft(15);
    obj.layout124:setTop(25);
    obj.layout124:setWidth(240);
    obj.layout124:setHeight(25);
    obj.layout124:setName("layout124");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout124);
    obj.edit100:setLeft(0);
    obj.edit100:setTop(5);
    obj.edit100:setWidth(95);
    obj.edit100:setHeight(20);
    obj.edit100:setField("pilar_1");
    obj.edit100:setFontSize(12);
    obj.edit100:setName("edit100");

    obj.imageCheckBox322 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox322:setParent(obj.layout124);
    obj.imageCheckBox322:setLeft(100);
    obj.imageCheckBox322:setTop(0);
    obj.imageCheckBox322:setWidth(25);
    obj.imageCheckBox322:setHeight(25);
    obj.imageCheckBox322:setField("pilar_1_1");
    obj.imageCheckBox322:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox322:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox322:setName("imageCheckBox322");

    obj.imageCheckBox323 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox323:setParent(obj.layout124);
    obj.imageCheckBox323:setLeft(125);
    obj.imageCheckBox323:setTop(0);
    obj.imageCheckBox323:setWidth(25);
    obj.imageCheckBox323:setHeight(25);
    obj.imageCheckBox323:setField("pilar_1_2");
    obj.imageCheckBox323:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox323:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox323:setName("imageCheckBox323");

    obj.imageCheckBox324 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox324:setParent(obj.layout124);
    obj.imageCheckBox324:setLeft(150);
    obj.imageCheckBox324:setTop(0);
    obj.imageCheckBox324:setWidth(25);
    obj.imageCheckBox324:setHeight(25);
    obj.imageCheckBox324:setField("pilar_1_3");
    obj.imageCheckBox324:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox324:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox324:setName("imageCheckBox324");

    obj.imageCheckBox325 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox325:setParent(obj.layout124);
    obj.imageCheckBox325:setLeft(175);
    obj.imageCheckBox325:setTop(0);
    obj.imageCheckBox325:setWidth(25);
    obj.imageCheckBox325:setHeight(25);
    obj.imageCheckBox325:setField("pilar_1_4");
    obj.imageCheckBox325:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox325:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox325:setName("imageCheckBox325");

    obj.imageCheckBox326 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox326:setParent(obj.layout124);
    obj.imageCheckBox326:setLeft(200);
    obj.imageCheckBox326:setTop(0);
    obj.imageCheckBox326:setWidth(25);
    obj.imageCheckBox326:setHeight(25);
    obj.imageCheckBox326:setField("pilar_1_5");
    obj.imageCheckBox326:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox326:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox326:setName("imageCheckBox326");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout123);
    obj.layout125:setLeft(15);
    obj.layout125:setTop(50);
    obj.layout125:setWidth(240);
    obj.layout125:setHeight(25);
    obj.layout125:setName("layout125");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout125);
    obj.edit101:setLeft(0);
    obj.edit101:setTop(5);
    obj.edit101:setWidth(95);
    obj.edit101:setHeight(20);
    obj.edit101:setField("pilar_2");
    obj.edit101:setFontSize(12);
    obj.edit101:setName("edit101");

    obj.imageCheckBox327 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox327:setParent(obj.layout125);
    obj.imageCheckBox327:setLeft(100);
    obj.imageCheckBox327:setTop(0);
    obj.imageCheckBox327:setWidth(25);
    obj.imageCheckBox327:setHeight(25);
    obj.imageCheckBox327:setField("pilar_2_1");
    obj.imageCheckBox327:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox327:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox327:setName("imageCheckBox327");

    obj.imageCheckBox328 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox328:setParent(obj.layout125);
    obj.imageCheckBox328:setLeft(125);
    obj.imageCheckBox328:setTop(0);
    obj.imageCheckBox328:setWidth(25);
    obj.imageCheckBox328:setHeight(25);
    obj.imageCheckBox328:setField("pilar_2_2");
    obj.imageCheckBox328:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox328:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox328:setName("imageCheckBox328");

    obj.imageCheckBox329 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox329:setParent(obj.layout125);
    obj.imageCheckBox329:setLeft(150);
    obj.imageCheckBox329:setTop(0);
    obj.imageCheckBox329:setWidth(25);
    obj.imageCheckBox329:setHeight(25);
    obj.imageCheckBox329:setField("pilar_2_3");
    obj.imageCheckBox329:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox329:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox329:setName("imageCheckBox329");

    obj.imageCheckBox330 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox330:setParent(obj.layout125);
    obj.imageCheckBox330:setLeft(175);
    obj.imageCheckBox330:setTop(0);
    obj.imageCheckBox330:setWidth(25);
    obj.imageCheckBox330:setHeight(25);
    obj.imageCheckBox330:setField("pilar_2_4");
    obj.imageCheckBox330:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox330:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox330:setName("imageCheckBox330");

    obj.imageCheckBox331 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox331:setParent(obj.layout125);
    obj.imageCheckBox331:setLeft(200);
    obj.imageCheckBox331:setTop(0);
    obj.imageCheckBox331:setWidth(25);
    obj.imageCheckBox331:setHeight(25);
    obj.imageCheckBox331:setField("pilar_2_5");
    obj.imageCheckBox331:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox331:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox331:setName("imageCheckBox331");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout123);
    obj.layout126:setLeft(15);
    obj.layout126:setTop(75);
    obj.layout126:setWidth(240);
    obj.layout126:setHeight(25);
    obj.layout126:setName("layout126");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout126);
    obj.edit102:setLeft(0);
    obj.edit102:setTop(5);
    obj.edit102:setWidth(95);
    obj.edit102:setHeight(20);
    obj.edit102:setField("pilar_3");
    obj.edit102:setFontSize(12);
    obj.edit102:setName("edit102");

    obj.imageCheckBox332 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox332:setParent(obj.layout126);
    obj.imageCheckBox332:setLeft(100);
    obj.imageCheckBox332:setTop(0);
    obj.imageCheckBox332:setWidth(25);
    obj.imageCheckBox332:setHeight(25);
    obj.imageCheckBox332:setField("pilar_3_1");
    obj.imageCheckBox332:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox332:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox332:setName("imageCheckBox332");

    obj.imageCheckBox333 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox333:setParent(obj.layout126);
    obj.imageCheckBox333:setLeft(125);
    obj.imageCheckBox333:setTop(0);
    obj.imageCheckBox333:setWidth(25);
    obj.imageCheckBox333:setHeight(25);
    obj.imageCheckBox333:setField("pilar_3_2");
    obj.imageCheckBox333:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox333:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox333:setName("imageCheckBox333");

    obj.imageCheckBox334 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox334:setParent(obj.layout126);
    obj.imageCheckBox334:setLeft(150);
    obj.imageCheckBox334:setTop(0);
    obj.imageCheckBox334:setWidth(25);
    obj.imageCheckBox334:setHeight(25);
    obj.imageCheckBox334:setField("pilar_3_3");
    obj.imageCheckBox334:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox334:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox334:setName("imageCheckBox334");

    obj.imageCheckBox335 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox335:setParent(obj.layout126);
    obj.imageCheckBox335:setLeft(175);
    obj.imageCheckBox335:setTop(0);
    obj.imageCheckBox335:setWidth(25);
    obj.imageCheckBox335:setHeight(25);
    obj.imageCheckBox335:setField("pilar_3_4");
    obj.imageCheckBox335:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox335:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox335:setName("imageCheckBox335");

    obj.imageCheckBox336 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox336:setParent(obj.layout126);
    obj.imageCheckBox336:setLeft(200);
    obj.imageCheckBox336:setTop(0);
    obj.imageCheckBox336:setWidth(25);
    obj.imageCheckBox336:setHeight(25);
    obj.imageCheckBox336:setField("pilar_3_5");
    obj.imageCheckBox336:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox336:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox336:setName("imageCheckBox336");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout123);
    obj.layout127:setLeft(15);
    obj.layout127:setTop(100);
    obj.layout127:setWidth(240);
    obj.layout127:setHeight(25);
    obj.layout127:setName("layout127");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout127);
    obj.edit103:setLeft(0);
    obj.edit103:setTop(5);
    obj.edit103:setWidth(95);
    obj.edit103:setHeight(20);
    obj.edit103:setField("pilar_4");
    obj.edit103:setFontSize(12);
    obj.edit103:setName("edit103");

    obj.imageCheckBox337 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox337:setParent(obj.layout127);
    obj.imageCheckBox337:setLeft(100);
    obj.imageCheckBox337:setTop(0);
    obj.imageCheckBox337:setWidth(25);
    obj.imageCheckBox337:setHeight(25);
    obj.imageCheckBox337:setField("pilar_4_1");
    obj.imageCheckBox337:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox337:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox337:setName("imageCheckBox337");

    obj.imageCheckBox338 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox338:setParent(obj.layout127);
    obj.imageCheckBox338:setLeft(125);
    obj.imageCheckBox338:setTop(0);
    obj.imageCheckBox338:setWidth(25);
    obj.imageCheckBox338:setHeight(25);
    obj.imageCheckBox338:setField("pilar_4_2");
    obj.imageCheckBox338:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox338:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox338:setName("imageCheckBox338");

    obj.imageCheckBox339 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox339:setParent(obj.layout127);
    obj.imageCheckBox339:setLeft(150);
    obj.imageCheckBox339:setTop(0);
    obj.imageCheckBox339:setWidth(25);
    obj.imageCheckBox339:setHeight(25);
    obj.imageCheckBox339:setField("pilar_4_3");
    obj.imageCheckBox339:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox339:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox339:setName("imageCheckBox339");

    obj.imageCheckBox340 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox340:setParent(obj.layout127);
    obj.imageCheckBox340:setLeft(175);
    obj.imageCheckBox340:setTop(0);
    obj.imageCheckBox340:setWidth(25);
    obj.imageCheckBox340:setHeight(25);
    obj.imageCheckBox340:setField("pilar_4_4");
    obj.imageCheckBox340:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox340:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox340:setName("imageCheckBox340");

    obj.imageCheckBox341 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox341:setParent(obj.layout127);
    obj.imageCheckBox341:setLeft(200);
    obj.imageCheckBox341:setTop(0);
    obj.imageCheckBox341:setWidth(25);
    obj.imageCheckBox341:setHeight(25);
    obj.imageCheckBox341:setField("pilar_4_5");
    obj.imageCheckBox341:setImageChecked("/MageDarkAges/images/prime_on.png");
    obj.imageCheckBox341:setImageUnchecked("/MageDarkAges/images/prime_off.png");
    obj.imageCheckBox341:setName("imageCheckBox341");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventory");
    obj.tab3:setName("tab3");

    obj.frmMDA20_3 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMDA20_3:setParent(obj.tab3);
    obj.frmMDA20_3:setName("frmMDA20_3");
    obj.frmMDA20_3:setAlign("client");
    obj.frmMDA20_3:setTheme("dark");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmMDA20_3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.scrollBox3);
    obj.layout128:setLeft(0);
    obj.layout128:setTop(0);
    obj.layout128:setWidth(630);
    obj.layout128:setHeight(330);
    obj.layout128:setName("layout128");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout128);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setXradius(10);
    obj.rectangle22:setYradius(10);
    obj.rectangle22:setCornerType("innerLine");
    obj.rectangle22:setName("rectangle22");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout128);
    obj.label77:setLeft(0);
    obj.label77:setTop(0);
    obj.label77:setWidth(630);
    obj.label77:setHeight(20);
    obj.label77:setText("COMBAT");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout128);
    obj.label78:setLeft(15);
    obj.label78:setTop(25);
    obj.label78:setWidth(630);
    obj.label78:setHeight(20);
    obj.label78:setText("Weapon/Attack                                          Roll              Diff.    Damage   Range     Rate        Clip    Conceal");
    obj.label78:setName("label78");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout128);
    obj.layout129:setLeft(15);
    obj.layout129:setTop(50);
    obj.layout129:setWidth(600);
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout129);
    obj.edit104:setLeft(0);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(200);
    obj.edit104:setHeight(24);
    obj.edit104:setField("attack_1");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout129);
    obj.edit105:setLeft(200);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(100);
    obj.edit105:setHeight(24);
    obj.edit105:setField("roll_1");
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout129);
    obj.edit106:setLeft(300);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(50);
    obj.edit106:setHeight(24);
    obj.edit106:setField("difficulty_1");
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout129);
    obj.edit107:setLeft(350);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(50);
    obj.edit107:setHeight(24);
    obj.edit107:setField("damage_1");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout129);
    obj.edit108:setLeft(400);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(50);
    obj.edit108:setHeight(24);
    obj.edit108:setField("range_1");
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout129);
    obj.edit109:setLeft(450);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(50);
    obj.edit109:setHeight(24);
    obj.edit109:setField("rate_1");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout129);
    obj.edit110:setLeft(500);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(24);
    obj.edit110:setField("clip_1");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout129);
    obj.edit111:setLeft(550);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(50);
    obj.edit111:setHeight(24);
    obj.edit111:setField("conceal_1");
    obj.edit111:setName("edit111");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout128);
    obj.layout130:setLeft(15);
    obj.layout130:setTop(75);
    obj.layout130:setWidth(600);
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout130);
    obj.edit112:setLeft(0);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(200);
    obj.edit112:setHeight(24);
    obj.edit112:setField("attack_2");
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout130);
    obj.edit113:setLeft(200);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(100);
    obj.edit113:setHeight(24);
    obj.edit113:setField("roll_2");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout130);
    obj.edit114:setLeft(300);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(50);
    obj.edit114:setHeight(24);
    obj.edit114:setField("difficulty_2");
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout130);
    obj.edit115:setLeft(350);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(50);
    obj.edit115:setHeight(24);
    obj.edit115:setField("damage_2");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout130);
    obj.edit116:setLeft(400);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(50);
    obj.edit116:setHeight(24);
    obj.edit116:setField("range_2");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout130);
    obj.edit117:setLeft(450);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(50);
    obj.edit117:setHeight(24);
    obj.edit117:setField("rate_2");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout130);
    obj.edit118:setLeft(500);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(50);
    obj.edit118:setHeight(24);
    obj.edit118:setField("clip_2");
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout130);
    obj.edit119:setLeft(550);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(50);
    obj.edit119:setHeight(24);
    obj.edit119:setField("conceal_2");
    obj.edit119:setName("edit119");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout128);
    obj.layout131:setLeft(15);
    obj.layout131:setTop(100);
    obj.layout131:setWidth(600);
    obj.layout131:setHeight(25);
    obj.layout131:setName("layout131");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout131);
    obj.edit120:setLeft(0);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(200);
    obj.edit120:setHeight(24);
    obj.edit120:setField("attack_3");
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout131);
    obj.edit121:setLeft(200);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(100);
    obj.edit121:setHeight(24);
    obj.edit121:setField("roll_3");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout131);
    obj.edit122:setLeft(300);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(50);
    obj.edit122:setHeight(24);
    obj.edit122:setField("difficulty_3");
    obj.edit122:setName("edit122");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout131);
    obj.edit123:setLeft(350);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(50);
    obj.edit123:setHeight(24);
    obj.edit123:setField("damage_3");
    obj.edit123:setName("edit123");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout131);
    obj.edit124:setLeft(400);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(50);
    obj.edit124:setHeight(24);
    obj.edit124:setField("range_3");
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout131);
    obj.edit125:setLeft(450);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(50);
    obj.edit125:setHeight(24);
    obj.edit125:setField("rate_3");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout131);
    obj.edit126:setLeft(500);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(50);
    obj.edit126:setHeight(24);
    obj.edit126:setField("clip_3");
    obj.edit126:setName("edit126");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout131);
    obj.edit127:setLeft(550);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(50);
    obj.edit127:setHeight(24);
    obj.edit127:setField("conceal_3");
    obj.edit127:setName("edit127");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout128);
    obj.layout132:setLeft(15);
    obj.layout132:setTop(125);
    obj.layout132:setWidth(600);
    obj.layout132:setHeight(25);
    obj.layout132:setName("layout132");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout132);
    obj.edit128:setLeft(0);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(200);
    obj.edit128:setHeight(24);
    obj.edit128:setField("attack_4");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout132);
    obj.edit129:setLeft(200);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(100);
    obj.edit129:setHeight(24);
    obj.edit129:setField("roll_4");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout132);
    obj.edit130:setLeft(300);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(50);
    obj.edit130:setHeight(24);
    obj.edit130:setField("difficulty_4");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout132);
    obj.edit131:setLeft(350);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(50);
    obj.edit131:setHeight(24);
    obj.edit131:setField("damage_4");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout132);
    obj.edit132:setLeft(400);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(50);
    obj.edit132:setHeight(24);
    obj.edit132:setField("range_4");
    obj.edit132:setName("edit132");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout132);
    obj.edit133:setLeft(450);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(50);
    obj.edit133:setHeight(24);
    obj.edit133:setField("rate_4");
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout132);
    obj.edit134:setLeft(500);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(50);
    obj.edit134:setHeight(24);
    obj.edit134:setField("clip_4");
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout132);
    obj.edit135:setLeft(550);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(50);
    obj.edit135:setHeight(24);
    obj.edit135:setField("conceal_4");
    obj.edit135:setName("edit135");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout128);
    obj.layout133:setLeft(15);
    obj.layout133:setTop(150);
    obj.layout133:setWidth(600);
    obj.layout133:setHeight(25);
    obj.layout133:setName("layout133");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout133);
    obj.edit136:setLeft(0);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(200);
    obj.edit136:setHeight(24);
    obj.edit136:setField("attack_5");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout133);
    obj.edit137:setLeft(200);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(100);
    obj.edit137:setHeight(24);
    obj.edit137:setField("roll_5");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout133);
    obj.edit138:setLeft(300);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(50);
    obj.edit138:setHeight(24);
    obj.edit138:setField("difficulty_5");
    obj.edit138:setName("edit138");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout133);
    obj.edit139:setLeft(350);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(50);
    obj.edit139:setHeight(24);
    obj.edit139:setField("damage_5");
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout133);
    obj.edit140:setLeft(400);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(50);
    obj.edit140:setHeight(24);
    obj.edit140:setField("range_5");
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout133);
    obj.edit141:setLeft(450);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(50);
    obj.edit141:setHeight(24);
    obj.edit141:setField("rate_5");
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout133);
    obj.edit142:setLeft(500);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(50);
    obj.edit142:setHeight(24);
    obj.edit142:setField("clip_5");
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout133);
    obj.edit143:setLeft(550);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(50);
    obj.edit143:setHeight(24);
    obj.edit143:setField("conceal_5");
    obj.edit143:setName("edit143");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout128);
    obj.layout134:setLeft(15);
    obj.layout134:setTop(175);
    obj.layout134:setWidth(600);
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout134);
    obj.edit144:setLeft(0);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(200);
    obj.edit144:setHeight(24);
    obj.edit144:setField("attack_6");
    obj.edit144:setName("edit144");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout134);
    obj.edit145:setLeft(200);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(100);
    obj.edit145:setHeight(24);
    obj.edit145:setField("roll_6");
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout134);
    obj.edit146:setLeft(300);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(50);
    obj.edit146:setHeight(24);
    obj.edit146:setField("difficulty_6");
    obj.edit146:setName("edit146");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout134);
    obj.edit147:setLeft(350);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(50);
    obj.edit147:setHeight(24);
    obj.edit147:setField("damage_6");
    obj.edit147:setName("edit147");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout134);
    obj.edit148:setLeft(400);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(50);
    obj.edit148:setHeight(24);
    obj.edit148:setField("range_6");
    obj.edit148:setName("edit148");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout134);
    obj.edit149:setLeft(450);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(50);
    obj.edit149:setHeight(24);
    obj.edit149:setField("rate_6");
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout134);
    obj.edit150:setLeft(500);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(50);
    obj.edit150:setHeight(24);
    obj.edit150:setField("clip_6");
    obj.edit150:setName("edit150");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout134);
    obj.edit151:setLeft(550);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(50);
    obj.edit151:setHeight(24);
    obj.edit151:setField("conceal_6");
    obj.edit151:setName("edit151");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout128);
    obj.layout135:setLeft(15);
    obj.layout135:setTop(200);
    obj.layout135:setWidth(600);
    obj.layout135:setHeight(25);
    obj.layout135:setName("layout135");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout135);
    obj.edit152:setLeft(0);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(200);
    obj.edit152:setHeight(24);
    obj.edit152:setField("attack_7");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout135);
    obj.edit153:setLeft(200);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(100);
    obj.edit153:setHeight(24);
    obj.edit153:setField("roll_7");
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout135);
    obj.edit154:setLeft(300);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(50);
    obj.edit154:setHeight(24);
    obj.edit154:setField("difficulty_7");
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout135);
    obj.edit155:setLeft(350);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(50);
    obj.edit155:setHeight(24);
    obj.edit155:setField("damage_7");
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout135);
    obj.edit156:setLeft(400);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(50);
    obj.edit156:setHeight(24);
    obj.edit156:setField("range_7");
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout135);
    obj.edit157:setLeft(450);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(50);
    obj.edit157:setHeight(24);
    obj.edit157:setField("rate_7");
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout135);
    obj.edit158:setLeft(500);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(50);
    obj.edit158:setHeight(24);
    obj.edit158:setField("clip_7");
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout135);
    obj.edit159:setLeft(550);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(50);
    obj.edit159:setHeight(24);
    obj.edit159:setField("conceal_7");
    obj.edit159:setName("edit159");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout128);
    obj.layout136:setLeft(15);
    obj.layout136:setTop(225);
    obj.layout136:setWidth(600);
    obj.layout136:setHeight(25);
    obj.layout136:setName("layout136");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout136);
    obj.edit160:setLeft(0);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(200);
    obj.edit160:setHeight(24);
    obj.edit160:setField("attack_8");
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout136);
    obj.edit161:setLeft(200);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(100);
    obj.edit161:setHeight(24);
    obj.edit161:setField("roll_8");
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout136);
    obj.edit162:setLeft(300);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(50);
    obj.edit162:setHeight(24);
    obj.edit162:setField("difficulty_8");
    obj.edit162:setName("edit162");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout136);
    obj.edit163:setLeft(350);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(50);
    obj.edit163:setHeight(24);
    obj.edit163:setField("damage_8");
    obj.edit163:setName("edit163");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout136);
    obj.edit164:setLeft(400);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(50);
    obj.edit164:setHeight(24);
    obj.edit164:setField("range_8");
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout136);
    obj.edit165:setLeft(450);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(50);
    obj.edit165:setHeight(24);
    obj.edit165:setField("rate_8");
    obj.edit165:setName("edit165");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout136);
    obj.edit166:setLeft(500);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(50);
    obj.edit166:setHeight(24);
    obj.edit166:setField("clip_8");
    obj.edit166:setName("edit166");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout136);
    obj.edit167:setLeft(550);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(50);
    obj.edit167:setHeight(24);
    obj.edit167:setField("conceal_8");
    obj.edit167:setName("edit167");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout128);
    obj.layout137:setLeft(15);
    obj.layout137:setTop(250);
    obj.layout137:setWidth(600);
    obj.layout137:setHeight(25);
    obj.layout137:setName("layout137");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout137);
    obj.edit168:setLeft(0);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(200);
    obj.edit168:setHeight(24);
    obj.edit168:setField("attack_9");
    obj.edit168:setName("edit168");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout137);
    obj.edit169:setLeft(200);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(100);
    obj.edit169:setHeight(24);
    obj.edit169:setField("roll_9");
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout137);
    obj.edit170:setLeft(300);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(50);
    obj.edit170:setHeight(24);
    obj.edit170:setField("difficulty_9");
    obj.edit170:setName("edit170");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout137);
    obj.edit171:setLeft(350);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(50);
    obj.edit171:setHeight(24);
    obj.edit171:setField("damage_9");
    obj.edit171:setName("edit171");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout137);
    obj.edit172:setLeft(400);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(50);
    obj.edit172:setHeight(24);
    obj.edit172:setField("range_9");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout137);
    obj.edit173:setLeft(450);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(50);
    obj.edit173:setHeight(24);
    obj.edit173:setField("rate_9");
    obj.edit173:setName("edit173");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout137);
    obj.edit174:setLeft(500);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(50);
    obj.edit174:setHeight(24);
    obj.edit174:setField("clip_9");
    obj.edit174:setName("edit174");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout137);
    obj.edit175:setLeft(550);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(50);
    obj.edit175:setHeight(24);
    obj.edit175:setField("conceal_9");
    obj.edit175:setName("edit175");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout128);
    obj.layout138:setLeft(15);
    obj.layout138:setTop(275);
    obj.layout138:setWidth(600);
    obj.layout138:setHeight(25);
    obj.layout138:setName("layout138");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout138);
    obj.edit176:setLeft(0);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(200);
    obj.edit176:setHeight(24);
    obj.edit176:setField("attack_10");
    obj.edit176:setName("edit176");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout138);
    obj.edit177:setLeft(200);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(100);
    obj.edit177:setHeight(24);
    obj.edit177:setField("roll_10");
    obj.edit177:setName("edit177");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout138);
    obj.edit178:setLeft(300);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(50);
    obj.edit178:setHeight(24);
    obj.edit178:setField("difficulty_10");
    obj.edit178:setName("edit178");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout138);
    obj.edit179:setLeft(350);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(50);
    obj.edit179:setHeight(24);
    obj.edit179:setField("damage_10");
    obj.edit179:setName("edit179");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout138);
    obj.edit180:setLeft(400);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(50);
    obj.edit180:setHeight(24);
    obj.edit180:setField("range_10");
    obj.edit180:setName("edit180");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout138);
    obj.edit181:setLeft(450);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(50);
    obj.edit181:setHeight(24);
    obj.edit181:setField("rate_10");
    obj.edit181:setName("edit181");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout138);
    obj.edit182:setLeft(500);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(50);
    obj.edit182:setHeight(24);
    obj.edit182:setField("clip_10");
    obj.edit182:setName("edit182");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout138);
    obj.edit183:setLeft(550);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(50);
    obj.edit183:setHeight(24);
    obj.edit183:setField("conceal_10");
    obj.edit183:setName("edit183");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.scrollBox3);
    obj.layout139:setLeft(640);
    obj.layout139:setTop(0);
    obj.layout139:setWidth(230);
    obj.layout139:setHeight(330);
    obj.layout139:setName("layout139");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout139);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setXradius(10);
    obj.rectangle23:setYradius(10);
    obj.rectangle23:setCornerType("innerLine");
    obj.rectangle23:setName("rectangle23");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout139);
    obj.label79:setLeft(0);
    obj.label79:setTop(0);
    obj.label79:setWidth(230);
    obj.label79:setHeight(20);
    obj.label79:setText("ITEMS");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout139);
    obj.textEditor1:setLeft(15);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(290);
    obj.textEditor1:setField("items");
    obj.textEditor1:setName("textEditor1");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.scrollBox3);
    obj.layout140:setLeft(0);
    obj.layout140:setTop(340);
    obj.layout140:setWidth(230);
    obj.layout140:setHeight(230);
    obj.layout140:setName("layout140");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout140);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setXradius(10);
    obj.rectangle24:setYradius(10);
    obj.rectangle24:setCornerType("innerLine");
    obj.rectangle24:setName("rectangle24");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout140);
    obj.label80:setLeft(0);
    obj.label80:setTop(0);
    obj.label80:setWidth(230);
    obj.label80:setHeight(20);
    obj.label80:setText("GEAR (CARRIED)");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout140);
    obj.textEditor2:setLeft(15);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(200);
    obj.textEditor2:setHeight(190);
    obj.textEditor2:setField("gear");
    obj.textEditor2:setName("textEditor2");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.scrollBox3);
    obj.layout141:setLeft(240);
    obj.layout141:setTop(340);
    obj.layout141:setWidth(230);
    obj.layout141:setHeight(230);
    obj.layout141:setName("layout141");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout141);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setXradius(10);
    obj.rectangle25:setYradius(10);
    obj.rectangle25:setCornerType("innerLine");
    obj.rectangle25:setName("rectangle25");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout141);
    obj.label81:setLeft(0);
    obj.label81:setTop(0);
    obj.label81:setWidth(230);
    obj.label81:setHeight(20);
    obj.label81:setText("EQUIPMENT (OWNED)");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout141);
    obj.textEditor3:setLeft(15);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(200);
    obj.textEditor3:setHeight(190);
    obj.textEditor3:setField("equipment");
    obj.textEditor3:setName("textEditor3");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.scrollBox3);
    obj.layout142:setLeft(480);
    obj.layout142:setTop(340);
    obj.layout142:setWidth(230);
    obj.layout142:setHeight(230);
    obj.layout142:setName("layout142");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout142);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setXradius(10);
    obj.rectangle26:setYradius(10);
    obj.rectangle26:setCornerType("innerLine");
    obj.rectangle26:setName("rectangle26");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout142);
    obj.label82:setLeft(0);
    obj.label82:setTop(0);
    obj.label82:setWidth(230);
    obj.label82:setHeight(20);
    obj.label82:setText("FOCI");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout142);
    obj.textEditor4:setLeft(15);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(200);
    obj.textEditor4:setHeight(190);
    obj.textEditor4:setField("foci");
    obj.textEditor4:setName("textEditor4");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.scrollBox3);
    obj.layout143:setLeft(720);
    obj.layout143:setTop(340);
    obj.layout143:setWidth(230);
    obj.layout143:setHeight(230);
    obj.layout143:setName("layout143");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout143);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setXradius(10);
    obj.rectangle27:setYradius(10);
    obj.rectangle27:setCornerType("innerLine");
    obj.rectangle27:setName("rectangle27");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout143);
    obj.label83:setLeft(0);
    obj.label83:setTop(0);
    obj.label83:setWidth(230);
    obj.label83:setHeight(20);
    obj.label83:setText("MISC");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout143);
    obj.textEditor5:setLeft(15);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(200);
    obj.textEditor5:setHeight(190);
    obj.textEditor5:setField("misc");
    obj.textEditor5:setName("textEditor5");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.scrollBox3);
    obj.layout144:setLeft(880);
    obj.layout144:setTop(0);
    obj.layout144:setWidth(230);
    obj.layout144:setHeight(230);
    obj.layout144:setName("layout144");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout144);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(10);
    obj.rectangle28:setYradius(10);
    obj.rectangle28:setCornerType("innerLine");
    obj.rectangle28:setName("rectangle28");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout144);
    obj.label84:setLeft(0);
    obj.label84:setTop(0);
    obj.label84:setWidth(230);
    obj.label84:setHeight(20);
    obj.label84:setText("ARMOR");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout144);
    obj.layout145:setLeft(15);
    obj.layout145:setTop(25);
    obj.layout145:setWidth(200);
    obj.layout145:setHeight(25);
    obj.layout145:setName("layout145");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout145);
    obj.label85:setLeft(0);
    obj.label85:setTop(5);
    obj.label85:setWidth(50);
    obj.label85:setHeight(20);
    obj.label85:setText("Class");
    obj.label85:setHorzTextAlign("trailing");
    obj.label85:setName("label85");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout145);
    obj.edit184:setLeft(55);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(145);
    obj.edit184:setHeight(25);
    obj.edit184:setField("armorClass");
    obj.edit184:setName("edit184");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout144);
    obj.layout146:setLeft(15);
    obj.layout146:setTop(50);
    obj.layout146:setWidth(200);
    obj.layout146:setHeight(25);
    obj.layout146:setName("layout146");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout146);
    obj.label86:setLeft(0);
    obj.label86:setTop(5);
    obj.label86:setWidth(50);
    obj.label86:setHeight(20);
    obj.label86:setText("Rating");
    obj.label86:setHorzTextAlign("trailing");
    obj.label86:setName("label86");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout146);
    obj.edit185:setLeft(55);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(145);
    obj.edit185:setHeight(25);
    obj.edit185:setField("armorRating");
    obj.edit185:setName("edit185");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout144);
    obj.layout147:setLeft(15);
    obj.layout147:setTop(75);
    obj.layout147:setWidth(600);
    obj.layout147:setHeight(25);
    obj.layout147:setName("layout147");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout147);
    obj.label87:setLeft(0);
    obj.label87:setTop(5);
    obj.label87:setWidth(50);
    obj.label87:setHeight(20);
    obj.label87:setText("Penalty");
    obj.label87:setHorzTextAlign("trailing");
    obj.label87:setName("label87");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout147);
    obj.edit186:setLeft(55);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(145);
    obj.edit186:setHeight(25);
    obj.edit186:setField("armorPenalty");
    obj.edit186:setName("edit186");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout144);
    obj.textEditor6:setLeft(15);
    obj.textEditor6:setTop(100);
    obj.textEditor6:setWidth(200);
    obj.textEditor6:setHeight(115);
    obj.textEditor6:setField("armorDescription");
    obj.textEditor6:setName("textEditor6");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Details");
    obj.tab4:setName("tab4");

    obj.frmMDA20_4 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMDA20_4:setParent(obj.tab4);
    obj.frmMDA20_4:setName("frmMDA20_4");
    obj.frmMDA20_4:setAlign("client");
    obj.frmMDA20_4:setTheme("dark");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmMDA20_4);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.scrollBox4);
    obj.layout148:setLeft(0);
    obj.layout148:setTop(0);
    obj.layout148:setWidth(240);
    obj.layout148:setHeight(165);
    obj.layout148:setName("layout148");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout148);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(10);
    obj.rectangle29:setYradius(10);
    obj.rectangle29:setCornerType("innerLine");
    obj.rectangle29:setName("rectangle29");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout148);
    obj.label88:setLeft(0);
    obj.label88:setTop(0);
    obj.label88:setWidth(240);
    obj.label88:setHeight(20);
    obj.label88:setText("ALLIES");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout148);
    obj.textEditor7:setLeft(15);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(200);
    obj.textEditor7:setHeight(125);
    obj.textEditor7:setField("allies");
    obj.textEditor7:setName("textEditor7");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.scrollBox4);
    obj.layout149:setLeft(0);
    obj.layout149:setTop(175);
    obj.layout149:setWidth(240);
    obj.layout149:setHeight(165);
    obj.layout149:setName("layout149");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout149);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setXradius(10);
    obj.rectangle30:setYradius(10);
    obj.rectangle30:setCornerType("innerLine");
    obj.rectangle30:setName("rectangle30");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout149);
    obj.label89:setLeft(0);
    obj.label89:setTop(0);
    obj.label89:setWidth(240);
    obj.label89:setHeight(20);
    obj.label89:setText("MENTOR");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout149);
    obj.textEditor8:setLeft(15);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(200);
    obj.textEditor8:setHeight(125);
    obj.textEditor8:setField("mentor");
    obj.textEditor8:setName("textEditor8");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.scrollBox4);
    obj.layout150:setLeft(250);
    obj.layout150:setTop(0);
    obj.layout150:setWidth(240);
    obj.layout150:setHeight(165);
    obj.layout150:setName("layout150");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout150);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setXradius(10);
    obj.rectangle31:setYradius(10);
    obj.rectangle31:setCornerType("innerLine");
    obj.rectangle31:setName("rectangle31");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout150);
    obj.label90:setLeft(0);
    obj.label90:setTop(0);
    obj.label90:setWidth(240);
    obj.label90:setHeight(20);
    obj.label90:setText("CONTACTS");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout150);
    obj.textEditor9:setLeft(15);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(200);
    obj.textEditor9:setHeight(125);
    obj.textEditor9:setField("contacts");
    obj.textEditor9:setName("textEditor9");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.scrollBox4);
    obj.layout151:setLeft(250);
    obj.layout151:setTop(175);
    obj.layout151:setWidth(240);
    obj.layout151:setHeight(165);
    obj.layout151:setName("layout151");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout151);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setXradius(10);
    obj.rectangle32:setYradius(10);
    obj.rectangle32:setCornerType("innerLine");
    obj.rectangle32:setName("rectangle32");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout151);
    obj.label91:setLeft(0);
    obj.label91:setTop(0);
    obj.label91:setWidth(240);
    obj.label91:setHeight(20);
    obj.label91:setText("RESOURCES");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout151);
    obj.textEditor10:setLeft(15);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(200);
    obj.textEditor10:setHeight(125);
    obj.textEditor10:setField("resources");
    obj.textEditor10:setName("textEditor10");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.scrollBox4);
    obj.layout152:setLeft(500);
    obj.layout152:setTop(0);
    obj.layout152:setWidth(240);
    obj.layout152:setHeight(165);
    obj.layout152:setName("layout152");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout152);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setXradius(10);
    obj.rectangle33:setYradius(10);
    obj.rectangle33:setCornerType("innerLine");
    obj.rectangle33:setName("rectangle33");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout152);
    obj.label92:setLeft(0);
    obj.label92:setTop(0);
    obj.label92:setWidth(240);
    obj.label92:setHeight(20);
    obj.label92:setText("LIBRARY");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout152);
    obj.textEditor11:setLeft(15);
    obj.textEditor11:setTop(25);
    obj.textEditor11:setWidth(200);
    obj.textEditor11:setHeight(125);
    obj.textEditor11:setField("library");
    obj.textEditor11:setName("textEditor11");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.scrollBox4);
    obj.layout153:setLeft(500);
    obj.layout153:setTop(175);
    obj.layout153:setWidth(240);
    obj.layout153:setHeight(165);
    obj.layout153:setName("layout153");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout153);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setXradius(10);
    obj.rectangle34:setYradius(10);
    obj.rectangle34:setCornerType("innerLine");
    obj.rectangle34:setName("rectangle34");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout153);
    obj.label93:setLeft(0);
    obj.label93:setTop(0);
    obj.label93:setWidth(240);
    obj.label93:setHeight(20);
    obj.label93:setText("FAMILIARS");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout153);
    obj.textEditor12:setLeft(15);
    obj.textEditor12:setTop(25);
    obj.textEditor12:setWidth(200);
    obj.textEditor12:setHeight(125);
    obj.textEditor12:setField("familiars");
    obj.textEditor12:setName("textEditor12");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.scrollBox4);
    obj.layout154:setLeft(750);
    obj.layout154:setTop(0);
    obj.layout154:setWidth(240);
    obj.layout154:setHeight(165);
    obj.layout154:setName("layout154");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout154);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setXradius(10);
    obj.rectangle35:setYradius(10);
    obj.rectangle35:setCornerType("innerLine");
    obj.rectangle35:setName("rectangle35");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout154);
    obj.label94:setLeft(0);
    obj.label94:setTop(0);
    obj.label94:setWidth(240);
    obj.label94:setHeight(20);
    obj.label94:setText("CRAY");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout154);
    obj.textEditor13:setLeft(15);
    obj.textEditor13:setTop(25);
    obj.textEditor13:setWidth(200);
    obj.textEditor13:setHeight(125);
    obj.textEditor13:setField("cray");
    obj.textEditor13:setName("textEditor13");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.scrollBox4);
    obj.layout155:setLeft(750);
    obj.layout155:setTop(175);
    obj.layout155:setWidth(240);
    obj.layout155:setHeight(165);
    obj.layout155:setName("layout155");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout155);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setXradius(10);
    obj.rectangle36:setYradius(10);
    obj.rectangle36:setCornerType("innerLine");
    obj.rectangle36:setName("rectangle36");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout155);
    obj.label95:setLeft(0);
    obj.label95:setTop(0);
    obj.label95:setWidth(240);
    obj.label95:setHeight(20);
    obj.label95:setText("SERVANTS");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout155);
    obj.textEditor14:setLeft(15);
    obj.textEditor14:setTop(25);
    obj.textEditor14:setWidth(200);
    obj.textEditor14:setHeight(125);
    obj.textEditor14:setField("servants");
    obj.textEditor14:setName("textEditor14");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.scrollBox4);
    obj.layout156:setLeft(1000);
    obj.layout156:setTop(0);
    obj.layout156:setWidth(240);
    obj.layout156:setHeight(165);
    obj.layout156:setName("layout156");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout156);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setXradius(10);
    obj.rectangle37:setYradius(10);
    obj.rectangle37:setCornerType("innerLine");
    obj.rectangle37:setName("rectangle37");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout156);
    obj.label96:setLeft(0);
    obj.label96:setTop(0);
    obj.label96:setWidth(240);
    obj.label96:setHeight(20);
    obj.label96:setText("INFLUENCE");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout156);
    obj.textEditor15:setLeft(15);
    obj.textEditor15:setTop(25);
    obj.textEditor15:setWidth(200);
    obj.textEditor15:setHeight(125);
    obj.textEditor15:setField("influence");
    obj.textEditor15:setName("textEditor15");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.scrollBox4);
    obj.layout157:setLeft(1000);
    obj.layout157:setTop(175);
    obj.layout157:setWidth(240);
    obj.layout157:setHeight(165);
    obj.layout157:setName("layout157");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout157);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setXradius(10);
    obj.rectangle38:setYradius(10);
    obj.rectangle38:setCornerType("innerLine");
    obj.rectangle38:setName("rectangle38");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout157);
    obj.label97:setLeft(0);
    obj.label97:setTop(0);
    obj.label97:setWidth(240);
    obj.label97:setHeight(20);
    obj.label97:setText("OTHER");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout157);
    obj.textEditor16:setLeft(15);
    obj.textEditor16:setTop(25);
    obj.textEditor16:setWidth(200);
    obj.textEditor16:setHeight(125);
    obj.textEditor16:setField("other");
    obj.textEditor16:setName("textEditor16");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.scrollBox4);
    obj.layout158:setLeft(0);
    obj.layout158:setTop(350);
    obj.layout158:setWidth(615);
    obj.layout158:setHeight(215);
    obj.layout158:setName("layout158");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout158);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setXradius(10);
    obj.rectangle39:setYradius(10);
    obj.rectangle39:setCornerType("innerLine");
    obj.rectangle39:setName("rectangle39");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout158);
    obj.label98:setLeft(0);
    obj.label98:setTop(0);
    obj.label98:setWidth(615);
    obj.label98:setHeight(20);
    obj.label98:setText("CHANTRY");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout158);
    obj.label99:setLeft(10);
    obj.label99:setTop(25);
    obj.label99:setWidth(200);
    obj.label99:setHeight(20);
    obj.label99:setText("Location");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout158);
    obj.label100:setLeft(210);
    obj.label100:setTop(25);
    obj.label100:setWidth(395);
    obj.label100:setHeight(20);
    obj.label100:setText("Description");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout158);
    obj.layout159:setLeft(0);
    obj.layout159:setTop(50);
    obj.layout159:setWidth(615);
    obj.layout159:setHeight(25);
    obj.layout159:setName("layout159");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout159);
    obj.edit187:setLeft(10);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(200);
    obj.edit187:setHeight(24);
    obj.edit187:setField("place_location_1");
    obj.edit187:setName("edit187");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout159);
    obj.edit188:setLeft(210);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(395);
    obj.edit188:setHeight(24);
    obj.edit188:setField("place_description_1");
    obj.edit188:setName("edit188");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.layout158);
    obj.layout160:setLeft(0);
    obj.layout160:setTop(75);
    obj.layout160:setWidth(615);
    obj.layout160:setHeight(25);
    obj.layout160:setName("layout160");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout160);
    obj.edit189:setLeft(10);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(200);
    obj.edit189:setHeight(24);
    obj.edit189:setField("place_location_2");
    obj.edit189:setName("edit189");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout160);
    obj.edit190:setLeft(210);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(395);
    obj.edit190:setHeight(24);
    obj.edit190:setField("place_description_2");
    obj.edit190:setName("edit190");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout158);
    obj.layout161:setLeft(0);
    obj.layout161:setTop(100);
    obj.layout161:setWidth(615);
    obj.layout161:setHeight(25);
    obj.layout161:setName("layout161");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout161);
    obj.edit191:setLeft(10);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(200);
    obj.edit191:setHeight(24);
    obj.edit191:setField("place_location_3");
    obj.edit191:setName("edit191");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout161);
    obj.edit192:setLeft(210);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(395);
    obj.edit192:setHeight(24);
    obj.edit192:setField("place_description_3");
    obj.edit192:setName("edit192");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout158);
    obj.layout162:setLeft(0);
    obj.layout162:setTop(125);
    obj.layout162:setWidth(615);
    obj.layout162:setHeight(25);
    obj.layout162:setName("layout162");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout162);
    obj.edit193:setLeft(10);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(200);
    obj.edit193:setHeight(24);
    obj.edit193:setField("place_location_4");
    obj.edit193:setName("edit193");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout162);
    obj.edit194:setLeft(210);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(395);
    obj.edit194:setHeight(24);
    obj.edit194:setField("place_description_4");
    obj.edit194:setName("edit194");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout158);
    obj.layout163:setLeft(0);
    obj.layout163:setTop(150);
    obj.layout163:setWidth(615);
    obj.layout163:setHeight(25);
    obj.layout163:setName("layout163");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout163);
    obj.edit195:setLeft(10);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(200);
    obj.edit195:setHeight(24);
    obj.edit195:setField("place_location_5");
    obj.edit195:setName("edit195");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout163);
    obj.edit196:setLeft(210);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(395);
    obj.edit196:setHeight(24);
    obj.edit196:setField("place_description_5");
    obj.edit196:setName("edit196");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout158);
    obj.layout164:setLeft(0);
    obj.layout164:setTop(175);
    obj.layout164:setWidth(615);
    obj.layout164:setHeight(25);
    obj.layout164:setName("layout164");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout164);
    obj.edit197:setLeft(10);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(200);
    obj.edit197:setHeight(24);
    obj.edit197:setField("place_location_6");
    obj.edit197:setName("edit197");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout164);
    obj.edit198:setLeft(210);
    obj.edit198:setTop(0);
    obj.edit198:setWidth(395);
    obj.edit198:setHeight(24);
    obj.edit198:setField("place_description_6");
    obj.edit198:setName("edit198");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.scrollBox4);
    obj.layout165:setLeft(625);
    obj.layout165:setTop(350);
    obj.layout165:setWidth(615);
    obj.layout165:setHeight(215);
    obj.layout165:setName("layout165");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout165);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(10);
    obj.rectangle40:setYradius(10);
    obj.rectangle40:setCornerType("innerLine");
    obj.rectangle40:setName("rectangle40");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout165);
    obj.label101:setLeft(0);
    obj.label101:setTop(0);
    obj.label101:setWidth(615);
    obj.label101:setHeight(20);
    obj.label101:setText("SANCTUM");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout165);
    obj.label102:setLeft(10);
    obj.label102:setTop(25);
    obj.label102:setWidth(200);
    obj.label102:setHeight(20);
    obj.label102:setText("Location");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout165);
    obj.label103:setLeft(210);
    obj.label103:setTop(25);
    obj.label103:setWidth(395);
    obj.label103:setHeight(20);
    obj.label103:setText("Description");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout165);
    obj.layout166:setLeft(0);
    obj.layout166:setTop(50);
    obj.layout166:setWidth(615);
    obj.layout166:setHeight(25);
    obj.layout166:setName("layout166");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout166);
    obj.edit199:setLeft(10);
    obj.edit199:setTop(0);
    obj.edit199:setWidth(200);
    obj.edit199:setHeight(24);
    obj.edit199:setField("place_location_7");
    obj.edit199:setName("edit199");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout166);
    obj.edit200:setLeft(210);
    obj.edit200:setTop(0);
    obj.edit200:setWidth(395);
    obj.edit200:setHeight(24);
    obj.edit200:setField("place_description_7");
    obj.edit200:setName("edit200");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout165);
    obj.layout167:setLeft(0);
    obj.layout167:setTop(75);
    obj.layout167:setWidth(615);
    obj.layout167:setHeight(25);
    obj.layout167:setName("layout167");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout167);
    obj.edit201:setLeft(10);
    obj.edit201:setTop(0);
    obj.edit201:setWidth(200);
    obj.edit201:setHeight(24);
    obj.edit201:setField("place_location_8");
    obj.edit201:setName("edit201");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout167);
    obj.edit202:setLeft(210);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(395);
    obj.edit202:setHeight(24);
    obj.edit202:setField("place_description_8");
    obj.edit202:setName("edit202");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout165);
    obj.layout168:setLeft(0);
    obj.layout168:setTop(100);
    obj.layout168:setWidth(615);
    obj.layout168:setHeight(25);
    obj.layout168:setName("layout168");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout168);
    obj.edit203:setLeft(10);
    obj.edit203:setTop(0);
    obj.edit203:setWidth(200);
    obj.edit203:setHeight(24);
    obj.edit203:setField("place_location_9");
    obj.edit203:setName("edit203");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout168);
    obj.edit204:setLeft(210);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(395);
    obj.edit204:setHeight(24);
    obj.edit204:setField("place_description_9");
    obj.edit204:setName("edit204");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout165);
    obj.layout169:setLeft(0);
    obj.layout169:setTop(125);
    obj.layout169:setWidth(615);
    obj.layout169:setHeight(25);
    obj.layout169:setName("layout169");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout169);
    obj.edit205:setLeft(10);
    obj.edit205:setTop(0);
    obj.edit205:setWidth(200);
    obj.edit205:setHeight(24);
    obj.edit205:setField("place_location_10");
    obj.edit205:setName("edit205");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout169);
    obj.edit206:setLeft(210);
    obj.edit206:setTop(0);
    obj.edit206:setWidth(395);
    obj.edit206:setHeight(24);
    obj.edit206:setField("place_description_10");
    obj.edit206:setName("edit206");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout165);
    obj.layout170:setLeft(0);
    obj.layout170:setTop(150);
    obj.layout170:setWidth(615);
    obj.layout170:setHeight(25);
    obj.layout170:setName("layout170");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout170);
    obj.edit207:setLeft(10);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(200);
    obj.edit207:setHeight(24);
    obj.edit207:setField("place_location_11");
    obj.edit207:setName("edit207");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout170);
    obj.edit208:setLeft(210);
    obj.edit208:setTop(0);
    obj.edit208:setWidth(395);
    obj.edit208:setHeight(24);
    obj.edit208:setField("place_description_11");
    obj.edit208:setName("edit208");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout165);
    obj.layout171:setLeft(0);
    obj.layout171:setTop(175);
    obj.layout171:setWidth(615);
    obj.layout171:setHeight(25);
    obj.layout171:setName("layout171");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout171);
    obj.edit209:setLeft(10);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(200);
    obj.edit209:setHeight(24);
    obj.edit209:setField("place_location_12");
    obj.edit209:setName("edit209");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout171);
    obj.edit210:setLeft(210);
    obj.edit210:setTop(0);
    obj.edit210:setWidth(395);
    obj.edit210:setHeight(24);
    obj.edit210:setField("place_description_12");
    obj.edit210:setName("edit210");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Background");
    obj.tab5:setName("tab5");

    obj.frmMDA20_5 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMDA20_5:setParent(obj.tab5);
    obj.frmMDA20_5:setName("frmMDA20_5");
    obj.frmMDA20_5:setAlign("client");
    obj.frmMDA20_5:setTheme("dark");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmMDA20_5);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.scrollBox5);
    obj.layout172:setLeft(0);
    obj.layout172:setTop(0);
    obj.layout172:setWidth(960);
    obj.layout172:setHeight(95);
    obj.layout172:setName("layout172");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout172);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(10);
    obj.rectangle41:setYradius(10);
    obj.rectangle41:setCornerType("innerLine");
    obj.rectangle41:setName("rectangle41");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.layout172);
    obj.layout173:setLeft(5);
    obj.layout173:setTop(5);
    obj.layout173:setWidth(310);
    obj.layout173:setHeight(25);
    obj.layout173:setName("layout173");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout173);
    obj.label104:setLeft(0);
    obj.label104:setTop(5);
    obj.label104:setWidth(100);
    obj.label104:setHeight(20);
    obj.label104:setText("Sex");
    obj.label104:setHorzTextAlign("trailing");
    obj.label104:setName("label104");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout173);
    obj.edit211:setLeft(110);
    obj.edit211:setTop(0);
    obj.edit211:setWidth(200);
    obj.edit211:setHeight(25);
    obj.edit211:setField("desc_sexo");
    obj.edit211:setName("edit211");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout172);
    obj.layout174:setLeft(320);
    obj.layout174:setTop(5);
    obj.layout174:setWidth(310);
    obj.layout174:setHeight(25);
    obj.layout174:setName("layout174");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout174);
    obj.label105:setLeft(0);
    obj.label105:setTop(5);
    obj.label105:setWidth(100);
    obj.label105:setHeight(20);
    obj.label105:setText("Height");
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setName("label105");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout174);
    obj.edit212:setLeft(110);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(200);
    obj.edit212:setHeight(25);
    obj.edit212:setField("desc_altura");
    obj.edit212:setName("edit212");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout172);
    obj.layout175:setLeft(585);
    obj.layout175:setTop(5);
    obj.layout175:setWidth(310);
    obj.layout175:setHeight(25);
    obj.layout175:setName("layout175");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout175);
    obj.label106:setLeft(0);
    obj.label106:setTop(5);
    obj.label106:setWidth(100);
    obj.label106:setHeight(20);
    obj.label106:setText("Eyes");
    obj.label106:setHorzTextAlign("trailing");
    obj.label106:setName("label106");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout175);
    obj.edit213:setLeft(110);
    obj.edit213:setTop(0);
    obj.edit213:setWidth(200);
    obj.edit213:setHeight(25);
    obj.edit213:setField("desc_olhos");
    obj.edit213:setName("edit213");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.layout172);
    obj.layout176:setLeft(5);
    obj.layout176:setTop(35);
    obj.layout176:setWidth(310);
    obj.layout176:setHeight(25);
    obj.layout176:setName("layout176");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout176);
    obj.label107:setLeft(0);
    obj.label107:setTop(5);
    obj.label107:setWidth(100);
    obj.label107:setHeight(20);
    obj.label107:setText("Age");
    obj.label107:setHorzTextAlign("trailing");
    obj.label107:setName("label107");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout176);
    obj.edit214:setLeft(110);
    obj.edit214:setTop(0);
    obj.edit214:setWidth(200);
    obj.edit214:setHeight(25);
    obj.edit214:setField("desc_idade");
    obj.edit214:setName("edit214");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.layout172);
    obj.layout177:setLeft(320);
    obj.layout177:setTop(35);
    obj.layout177:setWidth(310);
    obj.layout177:setHeight(25);
    obj.layout177:setName("layout177");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout177);
    obj.label108:setLeft(0);
    obj.label108:setTop(5);
    obj.label108:setWidth(100);
    obj.label108:setHeight(20);
    obj.label108:setText("Weight");
    obj.label108:setHorzTextAlign("trailing");
    obj.label108:setName("label108");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout177);
    obj.edit215:setLeft(110);
    obj.edit215:setTop(0);
    obj.edit215:setWidth(200);
    obj.edit215:setHeight(25);
    obj.edit215:setField("desc_peso");
    obj.edit215:setName("edit215");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.layout172);
    obj.layout178:setLeft(585);
    obj.layout178:setTop(35);
    obj.layout178:setWidth(310);
    obj.layout178:setHeight(25);
    obj.layout178:setName("layout178");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout178);
    obj.label109:setLeft(0);
    obj.label109:setTop(5);
    obj.label109:setWidth(100);
    obj.label109:setHeight(20);
    obj.label109:setText("Hair");
    obj.label109:setHorzTextAlign("trailing");
    obj.label109:setName("label109");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout178);
    obj.edit216:setLeft(110);
    obj.edit216:setTop(0);
    obj.edit216:setWidth(200);
    obj.edit216:setHeight(25);
    obj.edit216:setField("desc_cabelo");
    obj.edit216:setName("edit216");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.layout172);
    obj.layout179:setLeft(5);
    obj.layout179:setTop(65);
    obj.layout179:setWidth(310);
    obj.layout179:setHeight(25);
    obj.layout179:setName("layout179");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout179);
    obj.label110:setLeft(0);
    obj.label110:setTop(5);
    obj.label110:setWidth(100);
    obj.label110:setHeight(20);
    obj.label110:setText("Apparent Age");
    obj.label110:setHorzTextAlign("trailing");
    obj.label110:setName("label110");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout179);
    obj.edit217:setLeft(110);
    obj.edit217:setTop(0);
    obj.edit217:setWidth(200);
    obj.edit217:setHeight(25);
    obj.edit217:setField("desc_idadeAparente");
    obj.edit217:setName("edit217");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.layout172);
    obj.layout180:setLeft(320);
    obj.layout180:setTop(65);
    obj.layout180:setWidth(310);
    obj.layout180:setHeight(25);
    obj.layout180:setName("layout180");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout180);
    obj.label111:setLeft(0);
    obj.label111:setTop(5);
    obj.label111:setWidth(100);
    obj.label111:setHeight(20);
    obj.label111:setText("Nationality");
    obj.label111:setHorzTextAlign("trailing");
    obj.label111:setName("label111");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout180);
    obj.edit218:setLeft(110);
    obj.edit218:setTop(0);
    obj.edit218:setWidth(200);
    obj.edit218:setHeight(25);
    obj.edit218:setField("desc_nationality");
    obj.edit218:setName("edit218");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.layout172);
    obj.layout181:setLeft(585);
    obj.layout181:setTop(65);
    obj.layout181:setWidth(310);
    obj.layout181:setHeight(25);
    obj.layout181:setName("layout181");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout181);
    obj.label112:setLeft(0);
    obj.label112:setTop(5);
    obj.label112:setWidth(100);
    obj.label112:setHeight(20);
    obj.label112:setText("Race");
    obj.label112:setHorzTextAlign("trailing");
    obj.label112:setName("label112");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout181);
    obj.edit219:setLeft(110);
    obj.edit219:setTop(0);
    obj.edit219:setWidth(200);
    obj.edit219:setHeight(25);
    obj.edit219:setField("desc_race");
    obj.edit219:setName("edit219");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.scrollBox5);
    obj.layout182:setLeft(0);
    obj.layout182:setTop(105);
    obj.layout182:setWidth(400);
    obj.layout182:setHeight(175);
    obj.layout182:setName("layout182");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout182);
    obj.rectangle42:setLeft(0);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(400);
    obj.rectangle42:setHeight(175);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(10);
    obj.rectangle42:setYradius(10);
    obj.rectangle42:setCornerType("innerLine");
    obj.rectangle42:setName("rectangle42");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout182);
    obj.label113:setLeft(0);
    obj.label113:setTop(0);
    obj.label113:setWidth(400);
    obj.label113:setHeight(20);
    obj.label113:setText("Appearance");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout182);
    obj.textEditor17:setLeft(10);
    obj.textEditor17:setTop(25);
    obj.textEditor17:setWidth(380);
    obj.textEditor17:setHeight(135);
    obj.textEditor17:setField("aparencia");
    obj.textEditor17:setName("textEditor17");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.scrollBox5);
    obj.layout183:setLeft(0);
    obj.layout183:setTop(285);
    obj.layout183:setWidth(195);
    obj.layout183:setHeight(175);
    obj.layout183:setName("layout183");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout183);
    obj.rectangle43:setLeft(0);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(195);
    obj.rectangle43:setHeight(175);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(10);
    obj.rectangle43:setYradius(10);
    obj.rectangle43:setCornerType("innerLine");
    obj.rectangle43:setName("rectangle43");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout183);
    obj.label114:setLeft(0);
    obj.label114:setTop(0);
    obj.label114:setWidth(195);
    obj.label114:setHeight(20);
    obj.label114:setText("Derangements");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout183);
    obj.textEditor18:setLeft(15);
    obj.textEditor18:setTop(25);
    obj.textEditor18:setWidth(165);
    obj.textEditor18:setHeight(135);
    obj.textEditor18:setField("derangements");
    obj.textEditor18:setName("textEditor18");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.scrollBox5);
    obj.layout184:setLeft(205);
    obj.layout184:setTop(285);
    obj.layout184:setWidth(195);
    obj.layout184:setHeight(175);
    obj.layout184:setName("layout184");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout184);
    obj.rectangle44:setLeft(0);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(195);
    obj.rectangle44:setHeight(175);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(10);
    obj.rectangle44:setYradius(10);
    obj.rectangle44:setCornerType("innerLine");
    obj.rectangle44:setName("rectangle44");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout184);
    obj.label115:setLeft(0);
    obj.label115:setTop(0);
    obj.label115:setWidth(195);
    obj.label115:setHeight(20);
    obj.label115:setText("Goals");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout184);
    obj.textEditor19:setLeft(15);
    obj.textEditor19:setTop(25);
    obj.textEditor19:setWidth(165);
    obj.textEditor19:setHeight(135);
    obj.textEditor19:setField("goals");
    obj.textEditor19:setName("textEditor19");

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.scrollBox5);
    obj.layout185:setLeft(0);
    obj.layout185:setTop(465);
    obj.layout185:setWidth(400);
    obj.layout185:setHeight(175);
    obj.layout185:setName("layout185");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout185);
    obj.rectangle45:setLeft(0);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(400);
    obj.rectangle45:setHeight(175);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setXradius(10);
    obj.rectangle45:setYradius(10);
    obj.rectangle45:setCornerType("innerLine");
    obj.rectangle45:setName("rectangle45");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout185);
    obj.label116:setLeft(0);
    obj.label116:setTop(0);
    obj.label116:setWidth(400);
    obj.label116:setHeight(20);
    obj.label116:setText("Languages");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout185);
    obj.textEditor20:setLeft(10);
    obj.textEditor20:setTop(25);
    obj.textEditor20:setWidth(380);
    obj.textEditor20:setHeight(135);
    obj.textEditor20:setField("idiomas");
    obj.textEditor20:setName("textEditor20");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.scrollBox5);
    obj.layout186:setLeft(410);
    obj.layout186:setTop(105);
    obj.layout186:setWidth(630);
    obj.layout186:setHeight(535);
    obj.layout186:setName("layout186");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout186);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(10);
    obj.rectangle46:setYradius(10);
    obj.rectangle46:setCornerType("innerLine");
    obj.rectangle46:setName("rectangle46");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout186);
    obj.label117:setLeft(0);
    obj.label117:setTop(0);
    obj.label117:setWidth(630);
    obj.label117:setHeight(20);
    obj.label117:setText("Prelude");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout186);
    obj.richEdit1:setLeft(10);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(610);
    obj.richEdit1:setHeight(495);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Notes");
    obj.tab6:setName("tab6");

    obj.frmMDA20_6 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMDA20_6:setParent(obj.tab6);
    obj.frmMDA20_6:setName("frmMDA20_6");
    obj.frmMDA20_6:setAlign("client");
    obj.frmMDA20_6:setTheme("dark");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmMDA20_6);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.scrollBox6);
    obj.layout187:setLeft(0);
    obj.layout187:setTop(0);
    obj.layout187:setWidth(400);
    obj.layout187:setHeight(580);
    obj.layout187:setName("layout187");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout187);
    obj.rectangle47:setLeft(0);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(400);
    obj.rectangle47:setHeight(580);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setXradius(10);
    obj.rectangle47:setYradius(10);
    obj.rectangle47:setCornerType("innerLine");
    obj.rectangle47:setName("rectangle47");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout187);
    obj.label118:setLeft(0);
    obj.label118:setTop(0);
    obj.label118:setWidth(400);
    obj.label118:setHeight(20);
    obj.label118:setText("Notes");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout187);
    obj.textEditor21:setLeft(10);
    obj.textEditor21:setTop(25);
    obj.textEditor21:setWidth(380);
    obj.textEditor21:setHeight(540);
    obj.textEditor21:setField("anotacoes1");
    obj.textEditor21:setName("textEditor21");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.scrollBox6);
    obj.layout188:setLeft(410);
    obj.layout188:setTop(0);
    obj.layout188:setWidth(400);
    obj.layout188:setHeight(580);
    obj.layout188:setName("layout188");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout188);
    obj.rectangle48:setLeft(0);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(400);
    obj.rectangle48:setHeight(580);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setXradius(10);
    obj.rectangle48:setYradius(10);
    obj.rectangle48:setCornerType("innerLine");
    obj.rectangle48:setName("rectangle48");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout188);
    obj.label119:setLeft(0);
    obj.label119:setTop(0);
    obj.label119:setWidth(400);
    obj.label119:setHeight(20);
    obj.label119:setText("Notes");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout188);
    obj.textEditor22:setLeft(10);
    obj.textEditor22:setTop(25);
    obj.textEditor22:setWidth(380);
    obj.textEditor22:setHeight(540);
    obj.textEditor22:setField("anotacoes2");
    obj.textEditor22:setName("textEditor22");

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.scrollBox6);
    obj.layout189:setLeft(820);
    obj.layout189:setTop(0);
    obj.layout189:setWidth(400);
    obj.layout189:setHeight(580);
    obj.layout189:setName("layout189");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout189);
    obj.rectangle49:setLeft(0);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(400);
    obj.rectangle49:setHeight(580);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(10);
    obj.rectangle49:setYradius(10);
    obj.rectangle49:setCornerType("innerLine");
    obj.rectangle49:setName("rectangle49");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout189);
    obj.label120:setLeft(0);
    obj.label120:setTop(0);
    obj.label120:setWidth(400);
    obj.label120:setHeight(20);
    obj.label120:setText("Notes");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.layout189);
    obj.textEditor23:setLeft(10);
    obj.textEditor23:setTop(25);
    obj.textEditor23:setWidth(380);
    obj.textEditor23:setHeight(540);
    obj.textEditor23:setField("anotacoes3");
    obj.textEditor23:setName("textEditor23");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Credits");
    obj.tab7:setName("tab7");

    obj.frmMDA20_7 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMDA20_7:setParent(obj.tab7);
    obj.frmMDA20_7:setName("frmMDA20_7");
    obj.frmMDA20_7:setAlign("client");
    obj.frmMDA20_7:setTheme("dark");


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				if node:getClassName() == "recordList" then
					children = rclKids(node);
					--write(children[1]:getClassName());

					children = rclKids(children[1]);
				end;
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			function rclKids(rcl)
				local ret = {};
				local i;
				local childCount = _obj_getProp(rcl.handle, "ChildrenCount");
				local child;
				local childHandle;
				local idxDest = 1;
					
				for i = 0, childCount - 1, 1 do
					childHandle = _gui_getChild(rcl.handle, i);
					
					if (childHandle ~= nil) then							
						child = gui.fromHandle(childHandle);
						
						if (type(child) == "table") then							
							ret[idxDest] = child;
							idxDest = idxDest + 1;
						end
					end;	
				end
				
				return ret;
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

			local function tryTranslate(txt)
				if txt==nil then return "" end;

				local trans = Locale.tryLang("wod." .. txt);

				if trans == nil then return txt end;
				return trans;
			end;
		


    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmMDA20_7);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.scrollBox7);
    obj.image11:setLeft(0);
    obj.image11:setTop(0);
    obj.image11:setWidth(500);
    obj.image11:setHeight(175);
    obj.image11:setStyle("autoFit");
    obj.image11:setSRC("/MageDarkAges/images/mage.png");
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.scrollBox7);
    obj.image12:setLeft(550);
    obj.image12:setTop(0);
    obj.image12:setWidth(250);
    obj.image12:setHeight(250);
    obj.image12:setStyle("autoFit");
    obj.image12:setSRC("/MageDarkAges/images/RPGmeister.jpg");
    obj.image12:setName("image12");

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.scrollBox7);
    obj.layout190:setLeft(850);
    obj.layout190:setTop(0);
    obj.layout190:setWidth(200);
    obj.layout190:setHeight(250);
    obj.layout190:setName("layout190");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout190);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(10);
    obj.rectangle50:setYradius(10);
    obj.rectangle50:setCornerType("innerLine");
    obj.rectangle50:setName("rectangle50");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout190);
    obj.label121:setLeft(0);
    obj.label121:setTop(10);
    obj.label121:setWidth(200);
    obj.label121:setHeight(20);
    obj.label121:setText("Programador: Vinny (Ambesek)");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout190);
    obj.label122:setLeft(0);
    obj.label122:setTop(35);
    obj.label122:setWidth(200);
    obj.label122:setHeight(20);
    obj.label122:setText("Arte: Nefer (Nefertyne)");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout190);
    obj.label123:setLeft(0);
    obj.label123:setTop(60);
    obj.label123:setWidth(200);
    obj.label123:setHeight(20);
    obj.label123:setText("Consultor: Nautilus");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setFontSize(13);
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout190);
    obj.label124:setLeft(0);
    obj.label124:setTop(85);
    obj.label124:setWidth(200);
    obj.label124:setHeight(20);
    obj.label124:setText("Ficha feita para a mesa ");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout190);
    obj.label125:setLeft(0);
    obj.label125:setTop(110);
    obj.label125:setWidth(200);
    obj.label125:setHeight(20);
    obj.label125:setText("Sistema: Storyteller");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout190);
    obj.label126:setLeft(0);
    obj.label126:setTop(160);
    obj.label126:setWidth(200);
    obj.label126:setHeight(20);
    obj.label126:setText("Colaboradores:");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout190);
    obj.label127:setLeft(0);
    obj.label127:setTop(185);
    obj.label127:setWidth(200);
    obj.label127:setHeight(20);
    obj.label127:setText("Nautilus");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout190);
    obj.label128:setLeft(0);
    obj.label128:setTop(210);
    obj.label128:setWidth(200);
    obj.label128:setHeight(20);
    obj.label128:setText("Gallo");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.scrollBox7);
    obj.layout191:setLeft(850);
    obj.layout191:setTop(260);
    obj.layout191:setWidth(200);
    obj.layout191:setHeight(150);
    obj.layout191:setName("layout191");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout191);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setXradius(10);
    obj.rectangle51:setYradius(10);
    obj.rectangle51:setCornerType("innerLine");
    obj.rectangle51:setName("rectangle51");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout191);
    obj.label129:setLeft(0);
    obj.label129:setTop(10);
    obj.label129:setWidth(80);
    obj.label129:setHeight(20);
    obj.label129:setText("Tema:");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout191);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout191);
    obj.dataLink1:setField("theme");
    obj.dataLink1:setDefaultValue("Escuro");
    obj.dataLink1:setName("dataLink1");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout191);
    obj.label130:setLeft(0);
    obj.label130:setTop(35);
    obj.label130:setWidth(90);
    obj.label130:setHeight(20);
    obj.label130:setText("Colors");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout191);
    obj.label131:setLeft(0);
    obj.label131:setTop(60);
    obj.label131:setWidth(90);
    obj.label131:setHeight(20);
    obj.label131:setText("Background");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout191);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout191);
    obj.dataLink2:setField("colorBackground");
    obj.dataLink2:setDefaultValue("#000000");
    obj.dataLink2:setName("dataLink2");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout191);
    obj.label132:setLeft(0);
    obj.label132:setTop(85);
    obj.label132:setWidth(90);
    obj.label132:setHeight(20);
    obj.label132:setText("Font");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout191);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorFont");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout191);
    obj.dataLink3:setField("colorFont");
    obj.dataLink3:setDefaultValue("#FFFFFF");
    obj.dataLink3:setName("dataLink3");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout191);
    obj.checkBox38:setLeft(20);
    obj.checkBox38:setTop(110);
    obj.checkBox38:setWidth(160);
    obj.checkBox38:setHeight(20);
    obj.checkBox38:setField("localization");
    obj.checkBox38:setText("Translate");
    obj.checkBox38:setName("checkBox38");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout191);
    obj.dataLink4:setField("localization");
    obj.dataLink4:setDefaultValue("#FFFFFF");
    obj.dataLink4:setName("dataLink4");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.scrollBox7);
    obj.label133:setLeft(555);
    obj.label133:setTop(275);
    obj.label133:setWidth(200);
    obj.label133:setHeight(20);
    obj.label133:setText("Versão Atual: ");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setField("versionInstalled");
    obj.label133:setName("label133");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.scrollBox7);
    obj.label134:setLeft(555);
    obj.label134:setTop(300);
    obj.label134:setWidth(200);
    obj.label134:setHeight(20);
    obj.label134:setText("Sua Versão: ");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setField("versionDownloaded");
    obj.label134:setName("label134");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.scrollBox7);
    obj.checkBox39:setLeft(555);
    obj.checkBox39:setTop(325);
    obj.checkBox39:setWidth(200);
    obj.checkBox39:setHeight(20);
    obj.checkBox39:setField("noUpdate");
    obj.checkBox39:setText("Não pedir para atualizar.");
    obj.checkBox39:setName("checkBox39");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox7);
    obj.button3:setLeft(555);
    obj.button3:setTop(350);
    obj.button3:setWidth(100);
    obj.button3:setText("Change Log");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox7);
    obj.button4:setLeft(667);
    obj.button4:setTop(350);
    obj.button4:setWidth(100);
    obj.button4:setText("Atualizar");
    obj.button4:setName("button4");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.scrollBox7);
    obj.label135:setLeft(555);
    obj.label135:setTop(400);
    obj.label135:setWidth(200);
    obj.label135:setHeight(20);
    obj.label135:setText("Conheça a Mesa:");
    obj.label135:setName("label135");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox7);
    obj.button5:setLeft(555);
    obj.button5:setTop(425);
    obj.button5:setWidth(100);
    obj.button5:setText("RPGmeister");
    obj.button5:setName("button5");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/World%20of%20Darkness%2020th/output/World%20of%20Darkness%2020th.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/World%20of%20Darkness%2020th/output/World%20of%20Darkness%2020th.rpk?raw=true');
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
                        end);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclTalismans:append();
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclAides:append();
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
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

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            		            if sheet.localization ~= true then return end;
            
            		            local labels = findClass("label");
            
            					for i=1, #labels, 1 do 
            						local label = labels[i];
            						label.text = tryTranslate(label.text or "");
            					end;
            
            		            local radios = findClass("radioButton");
            
            					for i=1, #radios, 1 do 
            						local radio = radios[i];
            						radio.text = tryTranslate(radio.text or "");
            					end;
        end, obj);

    obj._e_event7 = obj.button3:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/World%20of%20Darkness%2020th/README.md')
        end, obj);

    obj._e_event8 = obj.button4:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/World%20of%20Darkness%2020th/output/World%20of%20Darkness%2020th.rpk?raw=true')
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.imageCheckBox296 ~= nil then self.imageCheckBox296:destroy(); self.imageCheckBox296 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.imageCheckBox58 ~= nil then self.imageCheckBox58:destroy(); self.imageCheckBox58 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.imageCheckBox115 ~= nil then self.imageCheckBox115:destroy(); self.imageCheckBox115 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.imageCheckBox67 ~= nil then self.imageCheckBox67:destroy(); self.imageCheckBox67 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.imageCheckBox210 ~= nil then self.imageCheckBox210:destroy(); self.imageCheckBox210 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.imageCheckBox289 ~= nil then self.imageCheckBox289:destroy(); self.imageCheckBox289 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.frmMDA20_6 ~= nil then self.frmMDA20_6:destroy(); self.frmMDA20_6 = nil; end;
        if self.imageCheckBox304 ~= nil then self.imageCheckBox304:destroy(); self.imageCheckBox304 = nil; end;
        if self.imageCheckBox190 ~= nil then self.imageCheckBox190:destroy(); self.imageCheckBox190 = nil; end;
        if self.imageCheckBox271 ~= nil then self.imageCheckBox271:destroy(); self.imageCheckBox271 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.imageCheckBox176 ~= nil then self.imageCheckBox176:destroy(); self.imageCheckBox176 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.imageCheckBox181 ~= nil then self.imageCheckBox181:destroy(); self.imageCheckBox181 = nil; end;
        if self.imageCheckBox174 ~= nil then self.imageCheckBox174:destroy(); self.imageCheckBox174 = nil; end;
        if self.imageCheckBox316 ~= nil then self.imageCheckBox316:destroy(); self.imageCheckBox316 = nil; end;
        if self.imageCheckBox129 ~= nil then self.imageCheckBox129:destroy(); self.imageCheckBox129 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.imageCheckBox99 ~= nil then self.imageCheckBox99:destroy(); self.imageCheckBox99 = nil; end;
        if self.imageCheckBox133 ~= nil then self.imageCheckBox133:destroy(); self.imageCheckBox133 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.imageCheckBox141 ~= nil then self.imageCheckBox141:destroy(); self.imageCheckBox141 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.imageCheckBox191 ~= nil then self.imageCheckBox191:destroy(); self.imageCheckBox191 = nil; end;
        if self.imageCheckBox145 ~= nil then self.imageCheckBox145:destroy(); self.imageCheckBox145 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.imageCheckBox79 ~= nil then self.imageCheckBox79:destroy(); self.imageCheckBox79 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.imageCheckBox150 ~= nil then self.imageCheckBox150:destroy(); self.imageCheckBox150 = nil; end;
        if self.imageCheckBox136 ~= nil then self.imageCheckBox136:destroy(); self.imageCheckBox136 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.imageCheckBox78 ~= nil then self.imageCheckBox78:destroy(); self.imageCheckBox78 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.imageCheckBox336 ~= nil then self.imageCheckBox336:destroy(); self.imageCheckBox336 = nil; end;
        if self.imageCheckBox103 ~= nil then self.imageCheckBox103:destroy(); self.imageCheckBox103 = nil; end;
        if self.imageCheckBox214 ~= nil then self.imageCheckBox214:destroy(); self.imageCheckBox214 = nil; end;
        if self.imageCheckBox241 ~= nil then self.imageCheckBox241:destroy(); self.imageCheckBox241 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.imageCheckBox131 ~= nil then self.imageCheckBox131:destroy(); self.imageCheckBox131 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.imageCheckBox326 ~= nil then self.imageCheckBox326:destroy(); self.imageCheckBox326 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.imageCheckBox159 ~= nil then self.imageCheckBox159:destroy(); self.imageCheckBox159 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.imageCheckBox285 ~= nil then self.imageCheckBox285:destroy(); self.imageCheckBox285 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.imageCheckBox117 ~= nil then self.imageCheckBox117:destroy(); self.imageCheckBox117 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.imageCheckBox194 ~= nil then self.imageCheckBox194:destroy(); self.imageCheckBox194 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.imageCheckBox155 ~= nil then self.imageCheckBox155:destroy(); self.imageCheckBox155 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.imageCheckBox59 ~= nil then self.imageCheckBox59:destroy(); self.imageCheckBox59 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.imageCheckBox90 ~= nil then self.imageCheckBox90:destroy(); self.imageCheckBox90 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox318 ~= nil then self.imageCheckBox318:destroy(); self.imageCheckBox318 = nil; end;
        if self.imageCheckBox182 ~= nil then self.imageCheckBox182:destroy(); self.imageCheckBox182 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.imageCheckBox93 ~= nil then self.imageCheckBox93:destroy(); self.imageCheckBox93 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.frmMDA20_2 ~= nil then self.frmMDA20_2:destroy(); self.frmMDA20_2 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.imageCheckBox219 ~= nil then self.imageCheckBox219:destroy(); self.imageCheckBox219 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.imageCheckBox246 ~= nil then self.imageCheckBox246:destroy(); self.imageCheckBox246 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.imageCheckBox340 ~= nil then self.imageCheckBox340:destroy(); self.imageCheckBox340 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.imageCheckBox260 ~= nil then self.imageCheckBox260:destroy(); self.imageCheckBox260 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.imageCheckBox173 ~= nil then self.imageCheckBox173:destroy(); self.imageCheckBox173 = nil; end;
        if self.imageCheckBox309 ~= nil then self.imageCheckBox309:destroy(); self.imageCheckBox309 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.imageCheckBox128 ~= nil then self.imageCheckBox128:destroy(); self.imageCheckBox128 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.imageCheckBox205 ~= nil then self.imageCheckBox205:destroy(); self.imageCheckBox205 = nil; end;
        if self.imageCheckBox315 ~= nil then self.imageCheckBox315:destroy(); self.imageCheckBox315 = nil; end;
        if self.imageCheckBox333 ~= nil then self.imageCheckBox333:destroy(); self.imageCheckBox333 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.imageCheckBox107 ~= nil then self.imageCheckBox107:destroy(); self.imageCheckBox107 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.imageCheckBox298 ~= nil then self.imageCheckBox298:destroy(); self.imageCheckBox298 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.imageCheckBox62 ~= nil then self.imageCheckBox62:destroy(); self.imageCheckBox62 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox325 ~= nil then self.imageCheckBox325:destroy(); self.imageCheckBox325 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.imageCheckBox94 ~= nil then self.imageCheckBox94:destroy(); self.imageCheckBox94 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.imageCheckBox110 ~= nil then self.imageCheckBox110:destroy(); self.imageCheckBox110 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.imageCheckBox313 ~= nil then self.imageCheckBox313:destroy(); self.imageCheckBox313 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.imageCheckBox339 ~= nil then self.imageCheckBox339:destroy(); self.imageCheckBox339 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.imageCheckBox305 ~= nil then self.imageCheckBox305:destroy(); self.imageCheckBox305 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.imageCheckBox231 ~= nil then self.imageCheckBox231:destroy(); self.imageCheckBox231 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.imageCheckBox247 ~= nil then self.imageCheckBox247:destroy(); self.imageCheckBox247 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.imageCheckBox125 ~= nil then self.imageCheckBox125:destroy(); self.imageCheckBox125 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.imageCheckBox87 ~= nil then self.imageCheckBox87:destroy(); self.imageCheckBox87 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.imageCheckBox322 ~= nil then self.imageCheckBox322:destroy(); self.imageCheckBox322 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.imageCheckBox262 ~= nil then self.imageCheckBox262:destroy(); self.imageCheckBox262 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.imageCheckBox172 ~= nil then self.imageCheckBox172:destroy(); self.imageCheckBox172 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.imageCheckBox127 ~= nil then self.imageCheckBox127:destroy(); self.imageCheckBox127 = nil; end;
        if self.imageCheckBox118 ~= nil then self.imageCheckBox118:destroy(); self.imageCheckBox118 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.imageCheckBox86 ~= nil then self.imageCheckBox86:destroy(); self.imageCheckBox86 = nil; end;
        if self.imageCheckBox294 ~= nil then self.imageCheckBox294:destroy(); self.imageCheckBox294 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.imageCheckBox179 ~= nil then self.imageCheckBox179:destroy(); self.imageCheckBox179 = nil; end;
        if self.imageCheckBox235 ~= nil then self.imageCheckBox235:destroy(); self.imageCheckBox235 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.imageCheckBox250 ~= nil then self.imageCheckBox250:destroy(); self.imageCheckBox250 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.imageCheckBox65 ~= nil then self.imageCheckBox65:destroy(); self.imageCheckBox65 = nil; end;
        if self.imageCheckBox211 ~= nil then self.imageCheckBox211:destroy(); self.imageCheckBox211 = nil; end;
        if self.imageCheckBox73 ~= nil then self.imageCheckBox73:destroy(); self.imageCheckBox73 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.imageCheckBox268 ~= nil then self.imageCheckBox268:destroy(); self.imageCheckBox268 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.imageCheckBox105 ~= nil then self.imageCheckBox105:destroy(); self.imageCheckBox105 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.frmMDA20_1 ~= nil then self.frmMDA20_1:destroy(); self.frmMDA20_1 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.imageCheckBox237 ~= nil then self.imageCheckBox237:destroy(); self.imageCheckBox237 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.imageCheckBox291 ~= nil then self.imageCheckBox291:destroy(); self.imageCheckBox291 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.imageCheckBox328 ~= nil then self.imageCheckBox328:destroy(); self.imageCheckBox328 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.imageCheckBox295 ~= nil then self.imageCheckBox295:destroy(); self.imageCheckBox295 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.imageCheckBox332 ~= nil then self.imageCheckBox332:destroy(); self.imageCheckBox332 = nil; end;
        if self.imageCheckBox153 ~= nil then self.imageCheckBox153:destroy(); self.imageCheckBox153 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.imageCheckBox244 ~= nil then self.imageCheckBox244:destroy(); self.imageCheckBox244 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.imageCheckBox198 ~= nil then self.imageCheckBox198:destroy(); self.imageCheckBox198 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.imageCheckBox199 ~= nil then self.imageCheckBox199:destroy(); self.imageCheckBox199 = nil; end;
        if self.imageCheckBox101 ~= nil then self.imageCheckBox101:destroy(); self.imageCheckBox101 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.imageCheckBox258 ~= nil then self.imageCheckBox258:destroy(); self.imageCheckBox258 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.imageCheckBox130 ~= nil then self.imageCheckBox130:destroy(); self.imageCheckBox130 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.imageCheckBox229 ~= nil then self.imageCheckBox229:destroy(); self.imageCheckBox229 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.imageCheckBox293 ~= nil then self.imageCheckBox293:destroy(); self.imageCheckBox293 = nil; end;
        if self.imageCheckBox81 ~= nil then self.imageCheckBox81:destroy(); self.imageCheckBox81 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.imageCheckBox335 ~= nil then self.imageCheckBox335:destroy(); self.imageCheckBox335 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.imageCheckBox123 ~= nil then self.imageCheckBox123:destroy(); self.imageCheckBox123 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imageCheckBox184 ~= nil then self.imageCheckBox184:destroy(); self.imageCheckBox184 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.imageCheckBox134 ~= nil then self.imageCheckBox134:destroy(); self.imageCheckBox134 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.imageCheckBox280 ~= nil then self.imageCheckBox280:destroy(); self.imageCheckBox280 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.imageCheckBox95 ~= nil then self.imageCheckBox95:destroy(); self.imageCheckBox95 = nil; end;
        if self.imageCheckBox279 ~= nil then self.imageCheckBox279:destroy(); self.imageCheckBox279 = nil; end;
        if self.imageCheckBox297 ~= nil then self.imageCheckBox297:destroy(); self.imageCheckBox297 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.imageCheckBox135 ~= nil then self.imageCheckBox135:destroy(); self.imageCheckBox135 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.imageCheckBox206 ~= nil then self.imageCheckBox206:destroy(); self.imageCheckBox206 = nil; end;
        if self.imageCheckBox120 ~= nil then self.imageCheckBox120:destroy(); self.imageCheckBox120 = nil; end;
        if self.imageCheckBox162 ~= nil then self.imageCheckBox162:destroy(); self.imageCheckBox162 = nil; end;
        if self.imageCheckBox286 ~= nil then self.imageCheckBox286:destroy(); self.imageCheckBox286 = nil; end;
        if self.imageCheckBox338 ~= nil then self.imageCheckBox338:destroy(); self.imageCheckBox338 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.imageCheckBox102 ~= nil then self.imageCheckBox102:destroy(); self.imageCheckBox102 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.imageCheckBox163 ~= nil then self.imageCheckBox163:destroy(); self.imageCheckBox163 = nil; end;
        if self.imageCheckBox109 ~= nil then self.imageCheckBox109:destroy(); self.imageCheckBox109 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.imageCheckBox272 ~= nil then self.imageCheckBox272:destroy(); self.imageCheckBox272 = nil; end;
        if self.imageCheckBox323 ~= nil then self.imageCheckBox323:destroy(); self.imageCheckBox323 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.imageCheckBox303 ~= nil then self.imageCheckBox303:destroy(); self.imageCheckBox303 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.imageCheckBox164 ~= nil then self.imageCheckBox164:destroy(); self.imageCheckBox164 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.imageCheckBox114 ~= nil then self.imageCheckBox114:destroy(); self.imageCheckBox114 = nil; end;
        if self.imageCheckBox327 ~= nil then self.imageCheckBox327:destroy(); self.imageCheckBox327 = nil; end;
        if self.imageCheckBox329 ~= nil then self.imageCheckBox329:destroy(); self.imageCheckBox329 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.imageCheckBox202 ~= nil then self.imageCheckBox202:destroy(); self.imageCheckBox202 = nil; end;
        if self.imageCheckBox226 ~= nil then self.imageCheckBox226:destroy(); self.imageCheckBox226 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.imageCheckBox276 ~= nil then self.imageCheckBox276:destroy(); self.imageCheckBox276 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.imageCheckBox75 ~= nil then self.imageCheckBox75:destroy(); self.imageCheckBox75 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.imageCheckBox270 ~= nil then self.imageCheckBox270:destroy(); self.imageCheckBox270 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.imageCheckBox161 ~= nil then self.imageCheckBox161:destroy(); self.imageCheckBox161 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.imageCheckBox281 ~= nil then self.imageCheckBox281:destroy(); self.imageCheckBox281 = nil; end;
        if self.imageCheckBox60 ~= nil then self.imageCheckBox60:destroy(); self.imageCheckBox60 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.imageCheckBox77 ~= nil then self.imageCheckBox77:destroy(); self.imageCheckBox77 = nil; end;
        if self.imageCheckBox201 ~= nil then self.imageCheckBox201:destroy(); self.imageCheckBox201 = nil; end;
        if self.imageCheckBox254 ~= nil then self.imageCheckBox254:destroy(); self.imageCheckBox254 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.imageCheckBox69 ~= nil then self.imageCheckBox69:destroy(); self.imageCheckBox69 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.imageCheckBox317 ~= nil then self.imageCheckBox317:destroy(); self.imageCheckBox317 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.imageCheckBox209 ~= nil then self.imageCheckBox209:destroy(); self.imageCheckBox209 = nil; end;
        if self.imageCheckBox218 ~= nil then self.imageCheckBox218:destroy(); self.imageCheckBox218 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.imageCheckBox228 ~= nil then self.imageCheckBox228:destroy(); self.imageCheckBox228 = nil; end;
        if self.imageCheckBox178 ~= nil then self.imageCheckBox178:destroy(); self.imageCheckBox178 = nil; end;
        if self.imageCheckBox261 ~= nil then self.imageCheckBox261:destroy(); self.imageCheckBox261 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.imageCheckBox321 ~= nil then self.imageCheckBox321:destroy(); self.imageCheckBox321 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.imageCheckBox132 ~= nil then self.imageCheckBox132:destroy(); self.imageCheckBox132 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.imageCheckBox147 ~= nil then self.imageCheckBox147:destroy(); self.imageCheckBox147 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.imageCheckBox299 ~= nil then self.imageCheckBox299:destroy(); self.imageCheckBox299 = nil; end;
        if self.imageCheckBox236 ~= nil then self.imageCheckBox236:destroy(); self.imageCheckBox236 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.imageCheckBox151 ~= nil then self.imageCheckBox151:destroy(); self.imageCheckBox151 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.imageCheckBox243 ~= nil then self.imageCheckBox243:destroy(); self.imageCheckBox243 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.imageCheckBox140 ~= nil then self.imageCheckBox140:destroy(); self.imageCheckBox140 = nil; end;
        if self.imageCheckBox221 ~= nil then self.imageCheckBox221:destroy(); self.imageCheckBox221 = nil; end;
        if self.imageCheckBox216 ~= nil then self.imageCheckBox216:destroy(); self.imageCheckBox216 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.imageCheckBox84 ~= nil then self.imageCheckBox84:destroy(); self.imageCheckBox84 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.imageCheckBox311 ~= nil then self.imageCheckBox311:destroy(); self.imageCheckBox311 = nil; end;
        if self.imageCheckBox312 ~= nil then self.imageCheckBox312:destroy(); self.imageCheckBox312 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.imageCheckBox108 ~= nil then self.imageCheckBox108:destroy(); self.imageCheckBox108 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.imageCheckBox72 ~= nil then self.imageCheckBox72:destroy(); self.imageCheckBox72 = nil; end;
        if self.imageCheckBox230 ~= nil then self.imageCheckBox230:destroy(); self.imageCheckBox230 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.imageCheckBox183 ~= nil then self.imageCheckBox183:destroy(); self.imageCheckBox183 = nil; end;
        if self.imageCheckBox98 ~= nil then self.imageCheckBox98:destroy(); self.imageCheckBox98 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.imageCheckBox310 ~= nil then self.imageCheckBox310:destroy(); self.imageCheckBox310 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.imageCheckBox227 ~= nil then self.imageCheckBox227:destroy(); self.imageCheckBox227 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.imageCheckBox287 ~= nil then self.imageCheckBox287:destroy(); self.imageCheckBox287 = nil; end;
        if self.imageCheckBox200 ~= nil then self.imageCheckBox200:destroy(); self.imageCheckBox200 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.imageCheckBox175 ~= nil then self.imageCheckBox175:destroy(); self.imageCheckBox175 = nil; end;
        if self.imageCheckBox225 ~= nil then self.imageCheckBox225:destroy(); self.imageCheckBox225 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.imageCheckBox185 ~= nil then self.imageCheckBox185:destroy(); self.imageCheckBox185 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.imageCheckBox148 ~= nil then self.imageCheckBox148:destroy(); self.imageCheckBox148 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.imageCheckBox288 ~= nil then self.imageCheckBox288:destroy(); self.imageCheckBox288 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.imageCheckBox251 ~= nil then self.imageCheckBox251:destroy(); self.imageCheckBox251 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.imageCheckBox126 ~= nil then self.imageCheckBox126:destroy(); self.imageCheckBox126 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.imageCheckBox166 ~= nil then self.imageCheckBox166:destroy(); self.imageCheckBox166 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.imageCheckBox196 ~= nil then self.imageCheckBox196:destroy(); self.imageCheckBox196 = nil; end;
        if self.imageCheckBox337 ~= nil then self.imageCheckBox337:destroy(); self.imageCheckBox337 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.imageCheckBox248 ~= nil then self.imageCheckBox248:destroy(); self.imageCheckBox248 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox168 ~= nil then self.imageCheckBox168:destroy(); self.imageCheckBox168 = nil; end;
        if self.imageCheckBox290 ~= nil then self.imageCheckBox290:destroy(); self.imageCheckBox290 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.imageCheckBox63 ~= nil then self.imageCheckBox63:destroy(); self.imageCheckBox63 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.imageCheckBox104 ~= nil then self.imageCheckBox104:destroy(); self.imageCheckBox104 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.imageCheckBox154 ~= nil then self.imageCheckBox154:destroy(); self.imageCheckBox154 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.imageCheckBox68 ~= nil then self.imageCheckBox68:destroy(); self.imageCheckBox68 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.imageCheckBox331 ~= nil then self.imageCheckBox331:destroy(); self.imageCheckBox331 = nil; end;
        if self.imageCheckBox224 ~= nil then self.imageCheckBox224:destroy(); self.imageCheckBox224 = nil; end;
        if self.imageCheckBox233 ~= nil then self.imageCheckBox233:destroy(); self.imageCheckBox233 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.imageCheckBox239 ~= nil then self.imageCheckBox239:destroy(); self.imageCheckBox239 = nil; end;
        if self.imageCheckBox208 ~= nil then self.imageCheckBox208:destroy(); self.imageCheckBox208 = nil; end;
        if self.imageCheckBox112 ~= nil then self.imageCheckBox112:destroy(); self.imageCheckBox112 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.imageCheckBox207 ~= nil then self.imageCheckBox207:destroy(); self.imageCheckBox207 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.imageCheckBox302 ~= nil then self.imageCheckBox302:destroy(); self.imageCheckBox302 = nil; end;
        if self.imageCheckBox91 ~= nil then self.imageCheckBox91:destroy(); self.imageCheckBox91 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.frmMDA20_7 ~= nil then self.frmMDA20_7:destroy(); self.frmMDA20_7 = nil; end;
        if self.imageCheckBox341 ~= nil then self.imageCheckBox341:destroy(); self.imageCheckBox341 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.imageCheckBox314 ~= nil then self.imageCheckBox314:destroy(); self.imageCheckBox314 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.imageCheckBox106 ~= nil then self.imageCheckBox106:destroy(); self.imageCheckBox106 = nil; end;
        if self.imageCheckBox255 ~= nil then self.imageCheckBox255:destroy(); self.imageCheckBox255 = nil; end;
        if self.imageCheckBox83 ~= nil then self.imageCheckBox83:destroy(); self.imageCheckBox83 = nil; end;
        if self.imageCheckBox193 ~= nil then self.imageCheckBox193:destroy(); self.imageCheckBox193 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.imageCheckBox213 ~= nil then self.imageCheckBox213:destroy(); self.imageCheckBox213 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rclTalismans ~= nil then self.rclTalismans:destroy(); self.rclTalismans = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.imageCheckBox124 ~= nil then self.imageCheckBox124:destroy(); self.imageCheckBox124 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.imageCheckBox249 ~= nil then self.imageCheckBox249:destroy(); self.imageCheckBox249 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.imageCheckBox189 ~= nil then self.imageCheckBox189:destroy(); self.imageCheckBox189 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.imageCheckBox71 ~= nil then self.imageCheckBox71:destroy(); self.imageCheckBox71 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.imageCheckBox137 ~= nil then self.imageCheckBox137:destroy(); self.imageCheckBox137 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.imageCheckBox142 ~= nil then self.imageCheckBox142:destroy(); self.imageCheckBox142 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.imageCheckBox264 ~= nil then self.imageCheckBox264:destroy(); self.imageCheckBox264 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.imageCheckBox180 ~= nil then self.imageCheckBox180:destroy(); self.imageCheckBox180 = nil; end;
        if self.imageCheckBox253 ~= nil then self.imageCheckBox253:destroy(); self.imageCheckBox253 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.imageCheckBox85 ~= nil then self.imageCheckBox85:destroy(); self.imageCheckBox85 = nil; end;
        if self.imageCheckBox252 ~= nil then self.imageCheckBox252:destroy(); self.imageCheckBox252 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.imageCheckBox157 ~= nil then self.imageCheckBox157:destroy(); self.imageCheckBox157 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.imageCheckBox156 ~= nil then self.imageCheckBox156:destroy(); self.imageCheckBox156 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.imageCheckBox116 ~= nil then self.imageCheckBox116:destroy(); self.imageCheckBox116 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.imageCheckBox222 ~= nil then self.imageCheckBox222:destroy(); self.imageCheckBox222 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.imageCheckBox307 ~= nil then self.imageCheckBox307:destroy(); self.imageCheckBox307 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.imageCheckBox158 ~= nil then self.imageCheckBox158:destroy(); self.imageCheckBox158 = nil; end;
        if self.imageCheckBox220 ~= nil then self.imageCheckBox220:destroy(); self.imageCheckBox220 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.imageCheckBox171 ~= nil then self.imageCheckBox171:destroy(); self.imageCheckBox171 = nil; end;
        if self.imageCheckBox334 ~= nil then self.imageCheckBox334:destroy(); self.imageCheckBox334 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.imageCheckBox204 ~= nil then self.imageCheckBox204:destroy(); self.imageCheckBox204 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.imageCheckBox197 ~= nil then self.imageCheckBox197:destroy(); self.imageCheckBox197 = nil; end;
        if self.imageCheckBox242 ~= nil then self.imageCheckBox242:destroy(); self.imageCheckBox242 = nil; end;
        if self.imageCheckBox111 ~= nil then self.imageCheckBox111:destroy(); self.imageCheckBox111 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.imageCheckBox96 ~= nil then self.imageCheckBox96:destroy(); self.imageCheckBox96 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.imageCheckBox165 ~= nil then self.imageCheckBox165:destroy(); self.imageCheckBox165 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.imageCheckBox76 ~= nil then self.imageCheckBox76:destroy(); self.imageCheckBox76 = nil; end;
        if self.imageCheckBox292 ~= nil then self.imageCheckBox292:destroy(); self.imageCheckBox292 = nil; end;
        if self.imageCheckBox308 ~= nil then self.imageCheckBox308:destroy(); self.imageCheckBox308 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.imageCheckBox186 ~= nil then self.imageCheckBox186:destroy(); self.imageCheckBox186 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.imageCheckBox195 ~= nil then self.imageCheckBox195:destroy(); self.imageCheckBox195 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.imageCheckBox149 ~= nil then self.imageCheckBox149:destroy(); self.imageCheckBox149 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.imageCheckBox283 ~= nil then self.imageCheckBox283:destroy(); self.imageCheckBox283 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.imageCheckBox215 ~= nil then self.imageCheckBox215:destroy(); self.imageCheckBox215 = nil; end;
        if self.imageCheckBox306 ~= nil then self.imageCheckBox306:destroy(); self.imageCheckBox306 = nil; end;
        if self.frmMDA20_4 ~= nil then self.frmMDA20_4:destroy(); self.frmMDA20_4 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.imageCheckBox192 ~= nil then self.imageCheckBox192:destroy(); self.imageCheckBox192 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.imageCheckBox320 ~= nil then self.imageCheckBox320:destroy(); self.imageCheckBox320 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.imageCheckBox301 ~= nil then self.imageCheckBox301:destroy(); self.imageCheckBox301 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.imageCheckBox138 ~= nil then self.imageCheckBox138:destroy(); self.imageCheckBox138 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rclAides ~= nil then self.rclAides:destroy(); self.rclAides = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.imageCheckBox267 ~= nil then self.imageCheckBox267:destroy(); self.imageCheckBox267 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.imageCheckBox330 ~= nil then self.imageCheckBox330:destroy(); self.imageCheckBox330 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.imageCheckBox263 ~= nil then self.imageCheckBox263:destroy(); self.imageCheckBox263 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.imageCheckBox80 ~= nil then self.imageCheckBox80:destroy(); self.imageCheckBox80 = nil; end;
        if self.imageCheckBox265 ~= nil then self.imageCheckBox265:destroy(); self.imageCheckBox265 = nil; end;
        if self.imageCheckBox119 ~= nil then self.imageCheckBox119:destroy(); self.imageCheckBox119 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.imageCheckBox256 ~= nil then self.imageCheckBox256:destroy(); self.imageCheckBox256 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.imageCheckBox92 ~= nil then self.imageCheckBox92:destroy(); self.imageCheckBox92 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.imageCheckBox234 ~= nil then self.imageCheckBox234:destroy(); self.imageCheckBox234 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.imageCheckBox238 ~= nil then self.imageCheckBox238:destroy(); self.imageCheckBox238 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox169 ~= nil then self.imageCheckBox169:destroy(); self.imageCheckBox169 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.imageCheckBox66 ~= nil then self.imageCheckBox66:destroy(); self.imageCheckBox66 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.imageCheckBox217 ~= nil then self.imageCheckBox217:destroy(); self.imageCheckBox217 = nil; end;
        if self.imageCheckBox275 ~= nil then self.imageCheckBox275:destroy(); self.imageCheckBox275 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.imageCheckBox82 ~= nil then self.imageCheckBox82:destroy(); self.imageCheckBox82 = nil; end;
        if self.imageCheckBox74 ~= nil then self.imageCheckBox74:destroy(); self.imageCheckBox74 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.frmMDA20_3 ~= nil then self.frmMDA20_3:destroy(); self.frmMDA20_3 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imageCheckBox146 ~= nil then self.imageCheckBox146:destroy(); self.imageCheckBox146 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.imageCheckBox300 ~= nil then self.imageCheckBox300:destroy(); self.imageCheckBox300 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.imageCheckBox278 ~= nil then self.imageCheckBox278:destroy(); self.imageCheckBox278 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.imageCheckBox139 ~= nil then self.imageCheckBox139:destroy(); self.imageCheckBox139 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.imageCheckBox187 ~= nil then self.imageCheckBox187:destroy(); self.imageCheckBox187 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.imageCheckBox223 ~= nil then self.imageCheckBox223:destroy(); self.imageCheckBox223 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.imageCheckBox266 ~= nil then self.imageCheckBox266:destroy(); self.imageCheckBox266 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.imageCheckBox245 ~= nil then self.imageCheckBox245:destroy(); self.imageCheckBox245 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.imageCheckBox160 ~= nil then self.imageCheckBox160:destroy(); self.imageCheckBox160 = nil; end;
        if self.imageCheckBox259 ~= nil then self.imageCheckBox259:destroy(); self.imageCheckBox259 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.imageCheckBox88 ~= nil then self.imageCheckBox88:destroy(); self.imageCheckBox88 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.frmMDA20_5 ~= nil then self.frmMDA20_5:destroy(); self.frmMDA20_5 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.imageCheckBox61 ~= nil then self.imageCheckBox61:destroy(); self.imageCheckBox61 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.imageCheckBox64 ~= nil then self.imageCheckBox64:destroy(); self.imageCheckBox64 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.imageCheckBox274 ~= nil then self.imageCheckBox274:destroy(); self.imageCheckBox274 = nil; end;
        if self.imageCheckBox170 ~= nil then self.imageCheckBox170:destroy(); self.imageCheckBox170 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.imageCheckBox121 ~= nil then self.imageCheckBox121:destroy(); self.imageCheckBox121 = nil; end;
        if self.imageCheckBox152 ~= nil then self.imageCheckBox152:destroy(); self.imageCheckBox152 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.imageCheckBox203 ~= nil then self.imageCheckBox203:destroy(); self.imageCheckBox203 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.imageCheckBox113 ~= nil then self.imageCheckBox113:destroy(); self.imageCheckBox113 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.imageCheckBox89 ~= nil then self.imageCheckBox89:destroy(); self.imageCheckBox89 = nil; end;
        if self.imageCheckBox319 ~= nil then self.imageCheckBox319:destroy(); self.imageCheckBox319 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox188 ~= nil then self.imageCheckBox188:destroy(); self.imageCheckBox188 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.imageCheckBox284 ~= nil then self.imageCheckBox284:destroy(); self.imageCheckBox284 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.imageCheckBox177 ~= nil then self.imageCheckBox177:destroy(); self.imageCheckBox177 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.imageCheckBox97 ~= nil then self.imageCheckBox97:destroy(); self.imageCheckBox97 = nil; end;
        if self.imageCheckBox100 ~= nil then self.imageCheckBox100:destroy(); self.imageCheckBox100 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.imageCheckBox144 ~= nil then self.imageCheckBox144:destroy(); self.imageCheckBox144 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.imageCheckBox212 ~= nil then self.imageCheckBox212:destroy(); self.imageCheckBox212 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.imageCheckBox70 ~= nil then self.imageCheckBox70:destroy(); self.imageCheckBox70 = nil; end;
        if self.imageCheckBox282 ~= nil then self.imageCheckBox282:destroy(); self.imageCheckBox282 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.imageCheckBox57 ~= nil then self.imageCheckBox57:destroy(); self.imageCheckBox57 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.imageCheckBox143 ~= nil then self.imageCheckBox143:destroy(); self.imageCheckBox143 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.imageCheckBox269 ~= nil then self.imageCheckBox269:destroy(); self.imageCheckBox269 = nil; end;
        if self.imageCheckBox273 ~= nil then self.imageCheckBox273:destroy(); self.imageCheckBox273 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.imageCheckBox277 ~= nil then self.imageCheckBox277:destroy(); self.imageCheckBox277 = nil; end;
        if self.imageCheckBox240 ~= nil then self.imageCheckBox240:destroy(); self.imageCheckBox240 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.imageCheckBox324 ~= nil then self.imageCheckBox324:destroy(); self.imageCheckBox324 = nil; end;
        if self.imageCheckBox257 ~= nil then self.imageCheckBox257:destroy(); self.imageCheckBox257 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.imageCheckBox122 ~= nil then self.imageCheckBox122:destroy(); self.imageCheckBox122 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.imageCheckBox232 ~= nil then self.imageCheckBox232:destroy(); self.imageCheckBox232 = nil; end;
        if self.imageCheckBox167 ~= nil then self.imageCheckBox167:destroy(); self.imageCheckBox167 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMageDarkAges()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMageDarkAges();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMageDarkAges = {
    newEditor = newfrmMageDarkAges, 
    new = newfrmMageDarkAges, 
    name = "frmMageDarkAges", 
    dataType = "Ambesek.Mage.DarkAges", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Mage Dark Ages", 
    description=""};

frmMageDarkAges = _frmMageDarkAges;
Firecast.registrarForm(_frmMageDarkAges);
Firecast.registrarDataType(_frmMageDarkAges);

return _frmMageDarkAges;
