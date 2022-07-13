require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Ataque()
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
    obj:setName("Ataque");
    obj:setHeight(350);
    obj:setWidth(230);
    obj:setTheme("light");

			

			local function showItemPopup()
				local pop = self:findControlByName("InfoATK");
					
				if pop ~= nil then
					pop:setNodeObject(self.sheet);
					pop:showPopupEx("bottom", self);
					else
						showMessage("Ops, bug.. nao encontrei o popup para exibir");
					end;				
				end;
		


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(230);
    obj.rectangle1:setHeight(350);
    obj.rectangle1:setColor("#00000000");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setTop(1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(30);
    lfm_setPropAsString(obj.rectangle2, "sides",  "bottom");
    obj.rectangle2:setColor("#00000000");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setWidth(200);
    obj.edit1:setField("ataque");
    obj.edit1:setHeight(40);
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("#C0504D");
    obj.edit1:setFontSize(20);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontFamily("kalam");
    obj.edit1:setTransparent(true);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setTop(59);
    obj.rectangle3:setLeft(09);
    obj.rectangle3:setWidth(86);
    obj.rectangle3:setHeight(31);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setColor("#00000000");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setXradius(8);
    obj.rectangle3:setYradius(8);
    obj.rectangle3:setName("rectangle3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setField("ModIniciativa");
    obj.edit2:setWidth(85);
    obj.edit2:setHeight(30);
    obj.edit2:setTop(60);
    obj.edit2:setLeft(10);
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("#C0504D");
    obj.edit2:setFontSize(20);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontFamily("kalam");
    obj.edit2:setTransparent(true);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setText("Mod. Iniciativa");
    obj.label1:setWidth(85);
    obj.label1:setHeight(30);
    obj.label1:setTop(40);
    obj.label1:setLeft(10);
    obj.label1:setName("label1");
    obj.label1:setFontColor("#000000");
    obj.label1:setFontSize(10);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("center");
    obj.label1:setFontFamily("kalam");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle1);
    obj.rectangle4:setTop(59);
    obj.rectangle4:setLeft(104);
    obj.rectangle4:setWidth(86);
    obj.rectangle4:setHeight(31);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setColor("#00000000");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setXradius(8);
    obj.rectangle4:setYradius(8);
    obj.rectangle4:setName("rectangle4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setField("ModAtaque");
    obj.edit3:setWidth(85);
    obj.edit3:setHeight(30);
    obj.edit3:setTop(60);
    obj.edit3:setLeft(105);
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("#C0504D");
    obj.edit3:setFontSize(20);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setFontFamily("kalam");
    obj.edit3:setTransparent(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setText("Mod. Ataque");
    obj.label2:setWidth(85);
    obj.label2:setHeight(30);
    obj.label2:setTop(40);
    obj.label2:setLeft(105);
    obj.label2:setName("label2");
    obj.label2:setFontColor("#000000");
    obj.label2:setFontSize(10);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setVertTextAlign("center");
    obj.label2:setFontFamily("kalam");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle1);
    obj.rectangle5:setTop(109);
    obj.rectangle5:setLeft(09);
    obj.rectangle5:setWidth(86);
    obj.rectangle5:setHeight(31);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setColor("#00000000");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setXradius(8);
    obj.rectangle5:setYradius(8);
    obj.rectangle5:setName("rectangle5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setField("Dano");
    obj.edit4:setWidth(85);
    obj.edit4:setHeight(30);
    obj.edit4:setTop(110);
    obj.edit4:setLeft(10);
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("#C0504D");
    obj.edit4:setFontSize(20);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setFontFamily("kalam");
    obj.edit4:setTransparent(true);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setText("Dano");
    obj.label3:setWidth(85);
    obj.label3:setHeight(30);
    obj.label3:setTop(90);
    obj.label3:setLeft(10);
    obj.label3:setName("label3");
    obj.label3:setFontColor("#000000");
    obj.label3:setFontSize(10);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setVertTextAlign("center");
    obj.label3:setFontFamily("kalam");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle1);
    obj.rectangle6:setTop(109);
    obj.rectangle6:setLeft(104);
    obj.rectangle6:setWidth(86);
    obj.rectangle6:setHeight(31);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setColor("#00000000");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setXradius(8);
    obj.rectangle6:setYradius(8);
    obj.rectangle6:setName("rectangle6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setField("CD");
    obj.edit5:setWidth(85);
    obj.edit5:setHeight(30);
    obj.edit5:setTop(110);
    obj.edit5:setLeft(105);
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("#C0504D");
    obj.edit5:setFontSize(20);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");
    obj.edit5:setFontFamily("kalam");
    obj.edit5:setTransparent(true);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setText("CD");
    obj.label4:setWidth(85);
    obj.label4:setHeight(30);
    obj.label4:setTop(90);
    obj.label4:setLeft(105);
    obj.label4:setName("label4");
    obj.label4:setFontColor("#000000");
    obj.label4:setFontSize(10);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("center");
    obj.label4:setFontFamily("kalam");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setText("i");
    obj.button1:setFontFamily("kalam");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setTop(60);
    obj.button1:setLeft(200);
    obj.button1:setHint("Informações do ataque.");
    obj.button1:setName("button1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setWidth(27);
    obj.image1:setHeight(27);
    obj.image1:setLeft(200);
    obj.image1:setTop(59);
    obj.image1:setStyle("proportional");
    obj.image1:setCenter(true);
    obj.image1:setSRC("/DZ_Ficha2.0/images/bala4.png");
    obj.image1:setName("image1");

    obj.InfoATK = GUI.fromHandle(_obj_newObject("popup"));
    obj.InfoATK:setParent(obj.rectangle1);
    obj.InfoATK:setName("InfoATK");
    obj.InfoATK:setWidth(600);
    obj.InfoATK:setHeight(500);
    obj.InfoATK:setBackOpacity(0.5);

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.InfoATK);
    obj.label5:setField("ataque");
    obj.label5:setWidth(600);
    obj.label5:setHeight(30);
    obj.label5:setTop(1);
    obj.label5:setFontSize(20);
    lfm_setPropAsString(obj.label5, "fontStyle",  "underline");
    obj.label5:setName("label5");
    obj.label5:setFontColor("#000000");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setVertTextAlign("center");
    obj.label5:setFontFamily("kalam");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.InfoATK);
    obj.image2:setField("IconATK");
    obj.image2:setWidth(600);
    obj.image2:setHeight(150);
    obj.image2:setTop(30);
    obj.image2:setEditable(true);
    obj.image2:setShowProgress(true);
    obj.image2:setStyle("proportional");
    obj.image2:setOptimize(true);
    obj.image2:setHint("imagem da arma.");
    obj.image2:setSRC("/DZ_Ficha2.0/images/ATKimage.png");
    obj.image2:setName("image2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.InfoATK);
    obj.comboBox1:setField("AlcanceATK");
    obj.comboBox1:setLeft(33);
    obj.comboBox1:setTop(200);
    obj.comboBox1:setWidth(200);
    obj.comboBox1:setHeight(30);
    obj.comboBox1:setItems({'Corpo a corpo', 'Curto', 'Medio', 'Longo'});
    obj.comboBox1:setFontSize(15);
    obj.comboBox1:setHint("Alcance do ataque.");
    obj.comboBox1:setValues({'Cc', 'C', 'M', 'L'});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontColor("#000000");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setFontFamily("kalam");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.InfoATK);
    obj.comboBox2:setField("AtributoATK");
    obj.comboBox2:setLeft(33);
    obj.comboBox2:setTop(240);
    obj.comboBox2:setWidth(200);
    obj.comboBox2:setHeight(30);
    obj.comboBox2:setItems({'Força', 'Destreza', 'Percepção', 'Inteligencia'});
    obj.comboBox2:setFontSize(15);
    obj.comboBox2:setHint("Atributo da rolagem do ataque.");
    obj.comboBox2:setValues({'FOR', 'DES', 'PER', 'INT'});
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setFontColor("#000000");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setVertTextAlign("center");
    obj.comboBox2:setFontFamily("kalam");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.InfoATK);
    obj.richEdit1:setLeft(50);
    obj.richEdit1:setTop(320);
    obj.richEdit1:setWidth(500);
    obj.richEdit1:setHeight(150);
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "gray");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "#C0504D");
    obj.richEdit1:setField("NotasAtaqueinfo");
    lfm_setPropAsString(obj.richEdit1, "showToolbar",  "false");
    obj.richEdit1:setName("richEdit1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setFontFamily("kalam");
    obj.button2:setWidth(24);
    obj.button2:setHeight(25);
    obj.button2:setTop(110);
    obj.button2:setHint("Executa a rolagem configurada.");
    obj.button2:setLeft(200);
    obj.button2:setName("button2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setWidth(26);
    obj.image3:setHeight(26);
    obj.image3:setLeft(199);
    obj.image3:setTop(110);
    obj.image3:setStyle("proportional");
    obj.image3:setCenter(true);
    obj.image3:setSRC("/DZ_Ficha2.0/images/Dado.jpg");
    obj.image3:setName("image3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle1);
    obj.rectangle7:setTop(159);
    obj.rectangle7:setLeft(09);
    obj.rectangle7:setWidth(86);
    obj.rectangle7:setHeight(31);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setColor("#00000000");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setXradius(8);
    obj.rectangle7:setYradius(8);
    obj.rectangle7:setName("rectangle7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setField("Pente");
    obj.edit6:setWidth(85);
    obj.edit6:setHeight(30);
    obj.edit6:setTop(160);
    obj.edit6:setLeft(10);
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("#C0504D");
    obj.edit6:setFontSize(20);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setFontFamily("kalam");
    obj.edit6:setTransparent(true);

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setText("Pente");
    obj.label6:setWidth(85);
    obj.label6:setHeight(30);
    obj.label6:setTop(140);
    obj.label6:setLeft(10);
    obj.label6:setName("label6");
    obj.label6:setFontColor("#000000");
    obj.label6:setFontSize(10);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setVertTextAlign("center");
    obj.label6:setFontFamily("kalam");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle1);
    obj.rectangle8:setTop(159);
    obj.rectangle8:setLeft(104);
    obj.rectangle8:setWidth(86);
    obj.rectangle8:setHeight(31);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setColor("#00000000");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setXradius(8);
    obj.rectangle8:setYradius(8);
    obj.rectangle8:setName("rectangle8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setField("Penalidade");
    obj.edit7:setWidth(85);
    obj.edit7:setHeight(30);
    obj.edit7:setTop(160);
    obj.edit7:setLeft(105);
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("#C0504D");
    obj.edit7:setFontSize(20);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setFontFamily("kalam");
    obj.edit7:setTransparent(true);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setText("PenalidadeATK");
    obj.label7:setWidth(85);
    obj.label7:setHeight(30);
    obj.label7:setTop(140);
    obj.label7:setLeft(105);
    obj.label7:setName("label7");
    obj.label7:setFontColor("#000000");
    obj.label7:setFontSize(10);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setVertTextAlign("center");
    obj.label7:setFontFamily("kalam");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setText("X");
    obj.button3:setFontFamily("kalam");
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setTop(160);
    obj.button3:setLeft(200);
    obj.button3:setHint("Apaga o ataque.");
    obj.button3:setName("button3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle1);
    obj.image4:setWidth(27);
    obj.image4:setHeight(27);
    obj.image4:setLeft(200);
    obj.image4:setTop(159);
    obj.image4:setStyle("proportional");
    obj.image4:setCenter(true);
    obj.image4:setSRC("/DZ_Ficha2.0/images/x.jpg");
    obj.image4:setName("image4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setText("Notas");
    obj.label8:setFontSize(15);
    obj.label8:setWidth(210);
    obj.label8:setHeight(30);
    obj.label8:setTop(190);
    obj.label8:setLeft(5);
    obj.label8:setName("label8");
    obj.label8:setFontColor("#000000");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("center");
    obj.label8:setFontFamily("kalam");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle1);
    obj.rectangle9:setTop(209);
    obj.rectangle9:setLeft(09);
    obj.rectangle9:setWidth(211);
    obj.rectangle9:setHeight(76);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setColor("#00000000");
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setXradius(8);
    obj.rectangle9:setYradius(8);
    obj.rectangle9:setName("rectangle9");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(10);
    obj.layout1:setTop(210);
    obj.layout1:setWidth(210);
    obj.layout1:setHeight(75);
    obj.layout1:setName("layout1");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout1);
    obj.richEdit2:setWidth(210);
    obj.richEdit2:setAlign("client");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#00000000");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "#C0504D");
    obj.richEdit2:setField("NotasAtaque");
    lfm_setPropAsString(obj.richEdit2, "showToolbar",  "false");
    obj.richEdit2:setName("richEdit2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            showItemPopup();
        end, obj);

    obj._e_event1 = obj.button3:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Quer mesmo apagar esse ataque?",
            						function (confirmado)
            							if confirmado then
            								NDB.deleteNode(sheet);
            							end;
            					end);
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
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.InfoATK ~= nil then self.InfoATK:destroy(); self.InfoATK = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newAtaque()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Ataque();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Ataque = {
    newEditor = newAtaque, 
    new = newAtaque, 
    name = "Ataque", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

Ataque = _Ataque;
Firecast.registrarForm(_Ataque);

return _Ataque;
