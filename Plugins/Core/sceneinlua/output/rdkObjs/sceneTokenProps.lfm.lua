require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTokenProps()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmTokenProps");
    obj:setWidth(350);
    obj:setHeight(300);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);

	
		require("system.lua");
		require("rrpgScene_Globals.lua");
		require("rrpgScene_Undo.dlua");
		require("rrpgSceneUtil.lua");
				
		local theToken = nil;
		local theSelection = nil;
		local theMesa = nil;
		local podeVerBarrinhas = false;
		local podeVerCoisasDeFoW = false;
		
		if not System.isMobile() then
			self.height = 450;
			self.width = 310;
		end;
	


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tabPrincipal = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabPrincipal:setParent(obj.tabControl1);
    obj.tabPrincipal:setName("tabPrincipal");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tabPrincipal);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flaContent = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContent:setParent(obj.scrollBox1);
    obj.flaContent:setAlign("top");
    obj.flaContent:setAutoHeight(true);
    obj.flaContent:setMaxControlsPerLine(1);
    obj.flaContent:setName("flaContent");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flaContent);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setHeight(30);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(5000);
    obj.flowPart1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader1:setParent(obj.flowPart1);
    obj.labGroupHeader1:setName("labGroupHeader1");
    obj.labGroupHeader1:setWordWrap(false);
    obj.labGroupHeader1:setAlign("left");
    obj.labGroupHeader1:setAutoSize(true);
    obj.labGroupHeader1:setHorzTextAlign("leading");
    obj.labGroupHeader1:setVertTextAlign("center");
    obj.labGroupHeader1:setMargins({left=10, right=5});
    obj.labGroupHeader1:setFontSize(15);
    obj.labGroupHeader1:setFontColor("#FFCC66");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("#FFCC6670");
    obj.horzLine1:setMargins({left=10});
    obj.horzLine1:setName("horzLine1");


			self.labGroupHeader1.text = lang("scene.menu.tokenOptions");
		


    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flaContent);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setHeight(30);
    obj.flowPart2:setMinWidth(50);
    obj.flowPart2:setMaxWidth(5000);
    obj.flowPart2:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labPersonagem = GUI.fromHandle(_obj_newObject("label"));
    obj.labPersonagem:setParent(obj.flowPart2);
    obj.labPersonagem:setName("labPersonagem");
    obj.labPersonagem:setWordWrap(false);
    obj.labPersonagem:setAlign("left");
    obj.labPersonagem:setWidth(130);
    obj.labPersonagem:setAutoSize(false);
    obj.labPersonagem:setHorzTextAlign("trailing");
    obj.labPersonagem:setVertTextAlign("center");
    obj.labPersonagem:setMargins({right=5});

    obj.cmbPersonagem = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbPersonagem:setParent(obj.flowPart2);
    obj.cmbPersonagem:setName("cmbPersonagem");
    obj.cmbPersonagem:setAlign("client");
    obj.cmbPersonagem:setMargins({right=5});

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flaContent);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setHeight(30);
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(5000);
    obj.flowPart3:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labNome = GUI.fromHandle(_obj_newObject("label"));
    obj.labNome:setParent(obj.flowPart3);
    obj.labNome:setName("labNome");
    obj.labNome:setWordWrap(false);
    obj.labNome:setAlign("left");
    obj.labNome:setWidth(130);
    obj.labNome:setAutoSize(false);
    obj.labNome:setHorzTextAlign("trailing");
    obj.labNome:setVertTextAlign("center");
    obj.labNome:setMargins({right=5});

    obj.edtNome = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNome:setParent(obj.flowPart3);
    obj.edtNome:setName("edtNome");
    obj.edtNome:setAlign("client");
    obj.edtNome:setMargins({right=5});

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flaContent);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setHeight(30);
    obj.flowPart4:setMinWidth(50);
    obj.flowPart4:setMaxWidth(5000);
    obj.flowPart4:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labSnapToGrid = GUI.fromHandle(_obj_newObject("label"));
    obj.labSnapToGrid:setParent(obj.flowPart4);
    obj.labSnapToGrid:setName("labSnapToGrid");
    obj.labSnapToGrid:setWordWrap(false);
    obj.labSnapToGrid:setAlign("left");
    obj.labSnapToGrid:setWidth(130);
    obj.labSnapToGrid:setAutoSize(false);
    obj.labSnapToGrid:setHorzTextAlign("trailing");
    obj.labSnapToGrid:setVertTextAlign("center");
    obj.labSnapToGrid:setMargins({right=5});

    obj.cbxSnapToGrid = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxSnapToGrid:setParent(obj.flowPart4);
    obj.cbxSnapToGrid:setName("cbxSnapToGrid");
    obj.cbxSnapToGrid:setAlign("client");
    obj.cbxSnapToGrid:setMargins({right=5});

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flaContent);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setHeight(30);
    obj.flowPart5:setMinWidth(50);
    obj.flowPart5:setMaxWidth(5000);
    obj.flowPart5:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labFacingMode = GUI.fromHandle(_obj_newObject("label"));
    obj.labFacingMode:setParent(obj.flowPart5);
    obj.labFacingMode:setName("labFacingMode");
    obj.labFacingMode:setWordWrap(false);
    obj.labFacingMode:setAlign("left");
    obj.labFacingMode:setWidth(130);
    obj.labFacingMode:setAutoSize(false);
    obj.labFacingMode:setHorzTextAlign("trailing");
    obj.labFacingMode:setVertTextAlign("center");
    obj.labFacingMode:setMargins({right=5});

    obj.cmbFacingMode = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbFacingMode:setParent(obj.flowPart5);
    obj.cmbFacingMode:setName("cmbFacingMode");
    obj.cmbFacingMode:setValues({'rotate', 'drawArrow'});
    obj.cmbFacingMode:setAlign("client");
    obj.cmbFacingMode:setMargins({right=5});

    obj.flpBar1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpBar1:setParent(obj.flaContent);
    obj.flpBar1:setName("flpBar1");
    obj.flpBar1:setHeight(30);
    obj.flpBar1:setMinWidth(50);
    obj.flpBar1:setMaxWidth(5000);
    obj.flpBar1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labBar1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labBar1:setParent(obj.flpBar1);
    obj.labBar1:setName("labBar1");
    obj.labBar1:setFontColor("white");
    obj.labBar1:setWordWrap(false);
    obj.labBar1:setAlign("left");
    obj.labBar1:setWidth(130);
    obj.labBar1:setAutoSize(false);
    obj.labBar1:setHorzTextAlign("trailing");
    obj.labBar1:setVertTextAlign("center");
    obj.labBar1:setMargins({right=5});

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.flpBar1);
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setMargins({right=5});

    obj.edtBarValue1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarValue1:setParent(obj.flowLayout1);
    obj.edtBarValue1:setName("edtBarValue1");
    obj.edtBarValue1:setWidth(35);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowLayout1);
    obj.label1:setText("/");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setAutoSize(true);
    obj.label1:setWordWrap(false);
    obj.label1:setMargins({left=8, right=8});
    obj.label1:setName("label1");

    obj.edtBarMax1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarMax1:setParent(obj.flowLayout1);
    obj.edtBarMax1:setName("edtBarMax1");
    obj.edtBarMax1:setWidth(35);
    obj.edtBarMax1:setHeight(30);

    obj.cmbCorBar1 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorBar1:setParent(obj.flowLayout1);
    obj.cmbCorBar1:setName("cmbCorBar1");
    obj.cmbCorBar1:setWidth(50);
    obj.cmbCorBar1:setUseAlpha(false);
    obj.cmbCorBar1:setMargins({left=8, right=8});
    obj.cmbCorBar1:setHeight(30);


			self.labBar1.text = LANG('scene.tokenEdit.barraPrefix') .. " 1:";
			self.flpBar1.height = self.flpBar1.height + 1; 
		


    obj.flpBar2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpBar2:setParent(obj.flaContent);
    obj.flpBar2:setName("flpBar2");
    obj.flpBar2:setHeight(30);
    obj.flpBar2:setMinWidth(50);
    obj.flpBar2:setMaxWidth(5000);
    obj.flpBar2:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labBar2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labBar2:setParent(obj.flpBar2);
    obj.labBar2:setName("labBar2");
    obj.labBar2:setFontColor("white");
    obj.labBar2:setWordWrap(false);
    obj.labBar2:setAlign("left");
    obj.labBar2:setWidth(130);
    obj.labBar2:setAutoSize(false);
    obj.labBar2:setHorzTextAlign("trailing");
    obj.labBar2:setVertTextAlign("center");
    obj.labBar2:setMargins({right=5});

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flpBar2);
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setAlign("client");
    obj.flowLayout2:setMargins({right=5});

    obj.edtBarValue2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarValue2:setParent(obj.flowLayout2);
    obj.edtBarValue2:setName("edtBarValue2");
    obj.edtBarValue2:setWidth(35);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout2);
    obj.label2:setText("/");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setAutoSize(true);
    obj.label2:setWordWrap(false);
    obj.label2:setMargins({left=8, right=8});
    obj.label2:setName("label2");

    obj.edtBarMax2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarMax2:setParent(obj.flowLayout2);
    obj.edtBarMax2:setName("edtBarMax2");
    obj.edtBarMax2:setWidth(35);
    obj.edtBarMax2:setHeight(30);

    obj.cmbCorBar2 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorBar2:setParent(obj.flowLayout2);
    obj.cmbCorBar2:setName("cmbCorBar2");
    obj.cmbCorBar2:setWidth(50);
    obj.cmbCorBar2:setUseAlpha(false);
    obj.cmbCorBar2:setMargins({left=8, right=8});
    obj.cmbCorBar2:setHeight(30);


			self.labBar2.text = LANG('scene.tokenEdit.barraPrefix') .. " 2:";
			self.flpBar2.height = self.flpBar2.height + 1; 
		


    obj.flpBar3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpBar3:setParent(obj.flaContent);
    obj.flpBar3:setName("flpBar3");
    obj.flpBar3:setHeight(30);
    obj.flpBar3:setMinWidth(50);
    obj.flpBar3:setMaxWidth(5000);
    obj.flpBar3:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labBar3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labBar3:setParent(obj.flpBar3);
    obj.labBar3:setName("labBar3");
    obj.labBar3:setFontColor("white");
    obj.labBar3:setWordWrap(false);
    obj.labBar3:setAlign("left");
    obj.labBar3:setWidth(130);
    obj.labBar3:setAutoSize(false);
    obj.labBar3:setHorzTextAlign("trailing");
    obj.labBar3:setVertTextAlign("center");
    obj.labBar3:setMargins({right=5});

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flpBar3);
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setAlign("client");
    obj.flowLayout3:setMargins({right=5});

    obj.edtBarValue3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarValue3:setParent(obj.flowLayout3);
    obj.edtBarValue3:setName("edtBarValue3");
    obj.edtBarValue3:setWidth(35);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout3);
    obj.label3:setText("/");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setAutoSize(true);
    obj.label3:setWordWrap(false);
    obj.label3:setMargins({left=8, right=8});
    obj.label3:setName("label3");

    obj.edtBarMax3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarMax3:setParent(obj.flowLayout3);
    obj.edtBarMax3:setName("edtBarMax3");
    obj.edtBarMax3:setWidth(35);
    obj.edtBarMax3:setHeight(30);

    obj.cmbCorBar3 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorBar3:setParent(obj.flowLayout3);
    obj.cmbCorBar3:setName("cmbCorBar3");
    obj.cmbCorBar3:setWidth(50);
    obj.cmbCorBar3:setUseAlpha(false);
    obj.cmbCorBar3:setMargins({left=8, right=8});
    obj.cmbCorBar3:setHeight(30);


			self.labBar3.text = LANG('scene.tokenEdit.barraPrefix') .. " 3:";
			self.flpBar3.height = self.flpBar3.height + 1; 
		


    obj.tabAura = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabAura:setParent(obj.tabControl1);
    obj.tabAura:setName("tabAura");
    obj.tabAura:setTitle("Auras");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tabAura);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flaAura = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaAura:setParent(obj.scrollBox2);
    obj.flaAura:setAlign("top");
    obj.flaAura:setAutoHeight(true);
    obj.flaAura:setMaxControlsPerLine(1);
    obj.flaAura:setName("flaAura");
    obj.flaAura:setMargins({left=10, right=10, top=10, bottom=2});

    obj.cbxPossuiAura = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxPossuiAura:setParent(obj.flaAura);
    obj.cbxPossuiAura:setName("cbxPossuiAura");
    obj.cbxPossuiAura:setLeft(30);
    obj.cbxPossuiAura:setTop(20);
    obj.cbxPossuiAura:setFontSize(18);
    obj.cbxPossuiAura:setText(lang("scene.FormaAura.PossuiAura"));

    obj.flaAuraContent = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaAuraContent:setParent(obj.flaAura);
    obj.flaAuraContent:setName("flaAuraContent");
    obj.flaAuraContent:setVisible(false);
    obj.flaAuraContent:setAutoHeight(true);
    obj.flaAuraContent:setAlign("top");
    obj.flaAuraContent:setMinWidth(50);
    obj.flaAuraContent:setMaxWidth(50000);
    obj.flaAuraContent:setMaxControlsPerLine(1);
    obj.flaAuraContent:setMargins({top=5});

    obj.flpFormaAura = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpFormaAura:setParent(obj.flaAuraContent);
    obj.flpFormaAura:setName("flpFormaAura");
    obj.flpFormaAura:setHeight(30);
    obj.flpFormaAura:setMinWidth(50);
    obj.flpFormaAura:setMaxWidth(5000);
    obj.flpFormaAura:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labFormaAura = GUI.fromHandle(_obj_newObject("label"));
    obj.labFormaAura:setParent(obj.flpFormaAura);
    obj.labFormaAura:setName("labFormaAura");
    obj.labFormaAura:setWordWrap(false);
    obj.labFormaAura:setAlign("left");
    obj.labFormaAura:setWidth(130);
    obj.labFormaAura:setAutoSize(false);
    obj.labFormaAura:setHorzTextAlign("trailing");
    obj.labFormaAura:setVertTextAlign("center");
    obj.labFormaAura:setMargins({right=5});

    obj.cmbFormaAura = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbFormaAura:setParent(obj.flpFormaAura);
    obj.cmbFormaAura:setName("cmbFormaAura");
    obj.cmbFormaAura:setAlign("client");
    obj.cmbFormaAura:setMargins({right=5});

    obj.flpImagemAura = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpImagemAura:setParent(obj.flaAuraContent);
    obj.flpImagemAura:setHeight(200);
    obj.flpImagemAura:setVisible(true);
    obj.flpImagemAura:setWidth(200);
    obj.flpImagemAura:setName("flpImagemAura");
    obj.flpImagemAura:setMinWidth(50);
    obj.flpImagemAura:setMaxWidth(5000);
    obj.flpImagemAura:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flpImagemAura);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setMargins({right=5});

    obj.labescolhaimg = GUI.fromHandle(_obj_newObject("label"));
    obj.labescolhaimg:setParent(obj.flpImagemAura);
    obj.labescolhaimg:setWidth(200);
    obj.labescolhaimg:setHeight(20);
    obj.labescolhaimg:setFontSize(11);
    obj.labescolhaimg:setName("labescolhaimg");
    obj.labescolhaimg:setHorzTextAlign("center");
    obj.labescolhaimg:setWordWrap(false);
    obj.labescolhaimg:setAlign("client");
    obj.labescolhaimg:setMargins({right=5});

    obj.imageAura = GUI.fromHandle(_obj_newObject("image"));
    obj.imageAura:setParent(obj.flpImagemAura);
    obj.imageAura:setWidth(200);
    obj.imageAura:setHeight(200);
    obj.imageAura:setStyle("autoFit");
    obj.imageAura:setEditable(true);
    obj.imageAura:setName("imageAura");
    obj.imageAura:setAlign("client");
    obj.imageAura:setMargins({right=5});

    obj.flpURLAura = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpURLAura:setParent(obj.flaAuraContent);
    obj.flpURLAura:setVisible(false);
    obj.flpURLAura:setName("flpURLAura");
    obj.flpURLAura:setHeight(30);
    obj.flpURLAura:setMinWidth(50);
    obj.flpURLAura:setMaxWidth(5000);
    obj.flpURLAura:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labAuraURL = GUI.fromHandle(_obj_newObject("label"));
    obj.labAuraURL:setParent(obj.flpURLAura);
    obj.labAuraURL:setName("labAuraURL");
    obj.labAuraURL:setWordWrap(false);
    obj.labAuraURL:setAlign("left");
    obj.labAuraURL:setWidth(130);
    obj.labAuraURL:setAutoSize(false);
    obj.labAuraURL:setHorzTextAlign("trailing");
    obj.labAuraURL:setVertTextAlign("center");
    obj.labAuraURL:setMargins({right=5});

    obj.edtAuraURL = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtAuraURL:setParent(obj.flpURLAura);
    obj.edtAuraURL:setName("edtAuraURL");
    obj.edtAuraURL:setAlign("client");
    obj.edtAuraURL:setMargins({right=5});

    obj.flpRaioAura = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpRaioAura:setParent(obj.flaAuraContent);
    obj.flpRaioAura:setVisible(false);
    obj.flpRaioAura:setName("flpRaioAura");
    obj.flpRaioAura:setHeight(30);
    obj.flpRaioAura:setMinWidth(50);
    obj.flpRaioAura:setMaxWidth(5000);
    obj.flpRaioAura:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labRaioAura = GUI.fromHandle(_obj_newObject("label"));
    obj.labRaioAura:setParent(obj.flpRaioAura);
    obj.labRaioAura:setName("labRaioAura");
    obj.labRaioAura:setWordWrap(false);
    obj.labRaioAura:setAlign("left");
    obj.labRaioAura:setWidth(130);
    obj.labRaioAura:setAutoSize(false);
    obj.labRaioAura:setHorzTextAlign("trailing");
    obj.labRaioAura:setVertTextAlign("center");
    obj.labRaioAura:setMargins({right=5});

    obj.edtRaioAura = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtRaioAura:setParent(obj.flpRaioAura);
    obj.edtRaioAura:setName("edtRaioAura");
    obj.edtRaioAura:setWidth(75);
    obj.edtRaioAura:setAlign("left");
    obj.edtRaioAura:setType("float");
    obj.edtRaioAura:setText("5");
    obj.edtRaioAura:setMin(0.1);
    obj.edtRaioAura:setMargins({right=5});

    obj.labUnidadeMetrica1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUnidadeMetrica1:setParent(obj.flpRaioAura);
    obj.labUnidadeMetrica1:setName("labUnidadeMetrica1");
    obj.labUnidadeMetrica1:setAlign("left");
    obj.labUnidadeMetrica1:setWordWrap(false);
    obj.labUnidadeMetrica1:setMargins({right=5});

    obj.fplAlturaAura = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fplAlturaAura:setParent(obj.flaAuraContent);
    obj.fplAlturaAura:setName("fplAlturaAura");
    obj.fplAlturaAura:setHeight(30);
    obj.fplAlturaAura:setMinWidth(50);
    obj.fplAlturaAura:setMaxWidth(5000);
    obj.fplAlturaAura:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labAlturaAura = GUI.fromHandle(_obj_newObject("label"));
    obj.labAlturaAura:setParent(obj.fplAlturaAura);
    obj.labAlturaAura:setName("labAlturaAura");
    obj.labAlturaAura:setWordWrap(false);
    obj.labAlturaAura:setAlign("left");
    obj.labAlturaAura:setWidth(130);
    obj.labAlturaAura:setAutoSize(false);
    obj.labAlturaAura:setHorzTextAlign("trailing");
    obj.labAlturaAura:setVertTextAlign("center");
    obj.labAlturaAura:setMargins({right=5});

    obj.edtAlturaAura = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtAlturaAura:setParent(obj.fplAlturaAura);
    obj.edtAlturaAura:setName("edtAlturaAura");
    obj.edtAlturaAura:setWidth(75);
    obj.edtAlturaAura:setAlign("left");
    obj.edtAlturaAura:setType("float");
    obj.edtAlturaAura:setText("5");
    obj.edtAlturaAura:setMin(0.1);
    obj.edtAlturaAura:setMargins({right=5});

    obj.labUnidadeMetrica2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUnidadeMetrica2:setParent(obj.fplAlturaAura);
    obj.labUnidadeMetrica2:setName("labUnidadeMetrica2");
    obj.labUnidadeMetrica2:setAlign("left");
    obj.labUnidadeMetrica2:setWordWrap(false);
    obj.labUnidadeMetrica2:setMargins({right=5});

    obj.fplLarguraAura = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fplLarguraAura:setParent(obj.flaAuraContent);
    obj.fplLarguraAura:setName("fplLarguraAura");
    obj.fplLarguraAura:setHeight(30);
    obj.fplLarguraAura:setMinWidth(50);
    obj.fplLarguraAura:setMaxWidth(5000);
    obj.fplLarguraAura:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labLarguraAura = GUI.fromHandle(_obj_newObject("label"));
    obj.labLarguraAura:setParent(obj.fplLarguraAura);
    obj.labLarguraAura:setName("labLarguraAura");
    obj.labLarguraAura:setWordWrap(false);
    obj.labLarguraAura:setAlign("left");
    obj.labLarguraAura:setWidth(130);
    obj.labLarguraAura:setAutoSize(false);
    obj.labLarguraAura:setHorzTextAlign("trailing");
    obj.labLarguraAura:setVertTextAlign("center");
    obj.labLarguraAura:setMargins({right=5});

    obj.edtLarguraAura = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtLarguraAura:setParent(obj.fplLarguraAura);
    obj.edtLarguraAura:setName("edtLarguraAura");
    obj.edtLarguraAura:setWidth(75);
    obj.edtLarguraAura:setAlign("left");
    obj.edtLarguraAura:setType("float");
    obj.edtLarguraAura:setText("5");
    obj.edtLarguraAura:setMin(0.1);
    obj.edtLarguraAura:setMargins({right=5});

    obj.labUnidadeMetrica3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUnidadeMetrica3:setParent(obj.fplLarguraAura);
    obj.labUnidadeMetrica3:setName("labUnidadeMetrica3");
    obj.labUnidadeMetrica3:setAlign("left");
    obj.labUnidadeMetrica3:setWordWrap(false);
    obj.labUnidadeMetrica3:setMargins({right=5});

    obj.fplCorAura = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fplCorAura:setParent(obj.flaAuraContent);
    obj.fplCorAura:setName("fplCorAura");
    obj.fplCorAura:setHeight(30);
    obj.fplCorAura:setMinWidth(50);
    obj.fplCorAura:setMaxWidth(5000);
    obj.fplCorAura:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labCorAura = GUI.fromHandle(_obj_newObject("label"));
    obj.labCorAura:setParent(obj.fplCorAura);
    obj.labCorAura:setName("labCorAura");
    obj.labCorAura:setWordWrap(false);
    obj.labCorAura:setAlign("left");
    obj.labCorAura:setWidth(130);
    obj.labCorAura:setAutoSize(false);
    obj.labCorAura:setHorzTextAlign("trailing");
    obj.labCorAura:setVertTextAlign("center");
    obj.labCorAura:setMargins({right=5});

    obj.cmbCorAura = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorAura:setParent(obj.fplCorAura);
    obj.cmbCorAura:setName("cmbCorAura");
    obj.cmbCorAura:setColor("red");
    obj.cmbCorAura:setAlign("client");
    obj.cmbCorAura:setMargins({right=5});

    obj.tabFOW = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabFOW:setParent(obj.tabControl1);
    obj.tabFOW:setName("tabFOW");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tabFOW);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.flaContentFOW = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContentFOW:setParent(obj.scrollBox3);
    obj.flaContentFOW:setAlign("top");
    obj.flaContentFOW:setAutoHeight(true);
    obj.flaContentFOW:setMaxControlsPerLine(1);
    obj.flaContentFOW:setName("flaContentFOW");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flaContentFOW);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setHeight(30);
    obj.flowPart6:setMinWidth(50);
    obj.flowPart6:setMaxWidth(5000);
    obj.flowPart6:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader2:setParent(obj.flowPart6);
    obj.labGroupHeader2:setName("labGroupHeader2");
    obj.labGroupHeader2:setWordWrap(false);
    obj.labGroupHeader2:setAlign("left");
    obj.labGroupHeader2:setAutoSize(true);
    obj.labGroupHeader2:setHorzTextAlign("leading");
    obj.labGroupHeader2:setVertTextAlign("center");
    obj.labGroupHeader2:setMargins({left=10, right=5});
    obj.labGroupHeader2:setFontSize(15);
    obj.labGroupHeader2:setFontColor("#FFCC66");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart6);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setStrokeColor("#FFCC6670");
    obj.horzLine2:setMargins({left=10});
    obj.horzLine2:setName("horzLine2");


			self.labGroupHeader2.text = lang("scene.fogOfWar.tokenVision");
		


    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flaContentFOW);
    obj.flowPart7:setHeight(150);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMinWidth(50);
    obj.flowPart7:setMaxWidth(5000);
    obj.flowPart7:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labCampoDeVisao = GUI.fromHandle(_obj_newObject("label"));
    obj.labCampoDeVisao:setParent(obj.flowPart7);
    obj.labCampoDeVisao:setName("labCampoDeVisao");
    obj.labCampoDeVisao:setWordWrap(false);
    obj.labCampoDeVisao:setAlign("left");
    obj.labCampoDeVisao:setWidth(130);
    obj.labCampoDeVisao:setAutoSize(false);
    obj.labCampoDeVisao:setHorzTextAlign("trailing");
    obj.labCampoDeVisao:setVertTextAlign("center");
    obj.labCampoDeVisao:setMargins({right=5});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart7);
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({right=5});

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(28);
    obj.layout2:setMargins({top=2});
    obj.layout2:setName("layout2");

    obj.labHasVision = GUI.fromHandle(_obj_newObject("label"));
    obj.labHasVision:setParent(obj.layout2);
    obj.labHasVision:setName("labHasVision");
    obj.labHasVision:setAlign("left");
    obj.labHasVision:setWidth(100);
    obj.labHasVision:setHorzTextAlign("trailing");
    obj.labHasVision:setMargins({right=4});
    obj.labHasVision:setWordWrap(false);

    obj.cbxHasVision = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxHasVision:setParent(obj.layout2);
    obj.cbxHasVision:setName("cbxHasVision");
    obj.cbxHasVision:setAlign("client");
    obj.cbxHasVision:setMargins({top=2});

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(28);
    obj.layout3:setMargins({top=2});
    obj.layout3:setName("layout3");

    obj.labCompLuz1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz1:setParent(obj.layout3);
    obj.labCompLuz1:setName("labCompLuz1");
    obj.labCompLuz1:setAlign("left");
    obj.labCompLuz1:setWidth(100);
    obj.labCompLuz1:setHorzTextAlign("trailing");
    obj.labCompLuz1:setMargins({right=4});
    obj.labCompLuz1:setWordWrap(false);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("client");
    obj.layout4:setName("layout4");

    obj.edtMetricVLI = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMetricVLI:setParent(obj.layout4);
    obj.edtMetricVLI:setName("edtMetricVLI");
    obj.edtMetricVLI:setAlign("client");
    obj.edtMetricVLI:setType("float");
    obj.edtMetricVLI:setMin(0);
    obj.edtMetricVLI:setMax(9999);
    obj.edtMetricVLI:setDecimalPlaces(1);

    obj.labMetricVLI = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricVLI:setParent(obj.layout4);
    obj.labMetricVLI:setName("labMetricVLI");
    obj.labMetricVLI:setText("m");
    obj.labMetricVLI:setAutoSize(true);
    obj.labMetricVLI:setAlign("right");
    obj.labMetricVLI:setMargins({left=4, right=2});
    obj.labMetricVLI:setWordWrap(false);


				self.labCompLuz1.text = lang('scene.fogOfWar.sobLuzIntensa') .. ":";								
			


    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(28);
    obj.layout5:setMargins({top=2});
    obj.layout5:setName("layout5");

    obj.labCompLuz2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz2:setParent(obj.layout5);
    obj.labCompLuz2:setName("labCompLuz2");
    obj.labCompLuz2:setAlign("left");
    obj.labCompLuz2:setWidth(100);
    obj.labCompLuz2:setHorzTextAlign("trailing");
    obj.labCompLuz2:setMargins({right=4});
    obj.labCompLuz2:setWordWrap(false);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("client");
    obj.layout6:setName("layout6");

    obj.edtMetricVLF = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMetricVLF:setParent(obj.layout6);
    obj.edtMetricVLF:setName("edtMetricVLF");
    obj.edtMetricVLF:setAlign("client");
    obj.edtMetricVLF:setType("float");
    obj.edtMetricVLF:setMin(0);
    obj.edtMetricVLF:setMax(9999);
    obj.edtMetricVLF:setDecimalPlaces(1);

    obj.labMetricVLF = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricVLF:setParent(obj.layout6);
    obj.labMetricVLF:setName("labMetricVLF");
    obj.labMetricVLF:setText("m");
    obj.labMetricVLF:setAutoSize(true);
    obj.labMetricVLF:setAlign("right");
    obj.labMetricVLF:setMargins({left=4, right=2});
    obj.labMetricVLF:setWordWrap(false);


				self.labCompLuz2.text = lang('scene.fogOfWar.sobLuzFraca') .. ":";								
			


    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(28);
    obj.layout7:setMargins({top=2});
    obj.layout7:setName("layout7");

    obj.labCompLuz3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz3:setParent(obj.layout7);
    obj.labCompLuz3:setName("labCompLuz3");
    obj.labCompLuz3:setAlign("left");
    obj.labCompLuz3:setWidth(100);
    obj.labCompLuz3:setHorzTextAlign("trailing");
    obj.labCompLuz3:setMargins({right=4});
    obj.labCompLuz3:setWordWrap(false);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("client");
    obj.layout8:setName("layout8");

    obj.edtMetricVLE = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMetricVLE:setParent(obj.layout8);
    obj.edtMetricVLE:setName("edtMetricVLE");
    obj.edtMetricVLE:setAlign("client");
    obj.edtMetricVLE:setType("float");
    obj.edtMetricVLE:setMin(0);
    obj.edtMetricVLE:setMax(9999);
    obj.edtMetricVLE:setDecimalPlaces(1);

    obj.labMetricVLE = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricVLE:setParent(obj.layout8);
    obj.labMetricVLE:setName("labMetricVLE");
    obj.labMetricVLE:setText("m");
    obj.labMetricVLE:setAutoSize(true);
    obj.labMetricVLE:setAlign("right");
    obj.labMetricVLE:setMargins({left=4, right=2});
    obj.labMetricVLE:setWordWrap(false);


				self.labCompLuz3.text = lang('scene.fogOfWar.sobEscuridao') .. ":";								
			


    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(28);
    obj.layout9:setMargins({top=2});
    obj.layout9:setName("layout9");

    obj.labCompAngulo1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompAngulo1:setParent(obj.layout9);
    obj.labCompAngulo1:setName("labCompAngulo1");
    obj.labCompAngulo1:setAlign("left");
    obj.labCompAngulo1:setWidth(100);
    obj.labCompAngulo1:setHorzTextAlign("trailing");
    obj.labCompAngulo1:setMargins({right=4});
    obj.labCompAngulo1:setWordWrap(false);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("client");
    obj.layout10:setName("layout10");

    obj.edtAnguloVisao = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtAnguloVisao:setParent(obj.layout10);
    obj.edtAnguloVisao:setName("edtAnguloVisao");
    obj.edtAnguloVisao:setAlign("client");
    obj.edtAnguloVisao:setType("float");
    obj.edtAnguloVisao:setMin(1);
    obj.edtAnguloVisao:setMax(360);
    obj.edtAnguloVisao:setDecimalPlaces(0);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout10);
    obj.label4:setText("graus");
    obj.label4:setAutoSize(true);
    obj.label4:setAlign("right");
    obj.label4:setMargins({left=4, right=2});
    obj.label4:setName("label4");
    obj.label4:setWordWrap(false);


				self.labCompAngulo1.text = lang('scene.fogOfWar.angulo') .. ":";
			


    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flaContentFOW);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setHeight(30);
    obj.flowPart8:setMinWidth(50);
    obj.flowPart8:setMaxWidth(5000);
    obj.flowPart8:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader3:setParent(obj.flowPart8);
    obj.labGroupHeader3:setName("labGroupHeader3");
    obj.labGroupHeader3:setWordWrap(false);
    obj.labGroupHeader3:setAlign("left");
    obj.labGroupHeader3:setAutoSize(true);
    obj.labGroupHeader3:setHorzTextAlign("leading");
    obj.labGroupHeader3:setVertTextAlign("center");
    obj.labGroupHeader3:setMargins({left=10, right=5});
    obj.labGroupHeader3:setFontSize(15);
    obj.labGroupHeader3:setFontColor("#FFCC66");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart8);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setStrokeColor("#FFCC6670");
    obj.horzLine3:setMargins({left=10});
    obj.horzLine3:setName("horzLine3");


			self.labGroupHeader3.text = lang("scene.fogOfWar.tokenLight");
		


    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flaContentFOW);
    obj.flowPart9:setHeight(90);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMinWidth(50);
    obj.flowPart9:setMaxWidth(5000);
    obj.flowPart9:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labLuz = GUI.fromHandle(_obj_newObject("label"));
    obj.labLuz:setParent(obj.flowPart9);
    obj.labLuz:setName("labLuz");
    obj.labLuz:setWordWrap(false);
    obj.labLuz:setAlign("left");
    obj.labLuz:setWidth(130);
    obj.labLuz:setAutoSize(false);
    obj.labLuz:setHorzTextAlign("trailing");
    obj.labLuz:setVertTextAlign("center");
    obj.labLuz:setMargins({right=5});

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart9);
    obj.layout11:setName("layout11");
    obj.layout11:setAlign("client");
    obj.layout11:setMargins({right=5});

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(28);
    obj.layout12:setMargins({top=2});
    obj.layout12:setName("layout12");

    obj.labCompLuz4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz4:setParent(obj.layout12);
    obj.labCompLuz4:setName("labCompLuz4");
    obj.labCompLuz4:setAlign("left");
    obj.labCompLuz4:setWidth(100);
    obj.labCompLuz4:setHorzTextAlign("trailing");
    obj.labCompLuz4:setMargins({right=4});
    obj.labCompLuz4:setWordWrap(false);

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setAlign("client");
    obj.layout13:setName("layout13");

    obj.edtMetricLI = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMetricLI:setParent(obj.layout13);
    obj.edtMetricLI:setName("edtMetricLI");
    obj.edtMetricLI:setAlign("client");
    obj.edtMetricLI:setType("float");
    obj.edtMetricLI:setMin(0);
    obj.edtMetricLI:setMax(9999);
    obj.edtMetricLI:setDecimalPlaces(1);

    obj.labMetricLI = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricLI:setParent(obj.layout13);
    obj.labMetricLI:setName("labMetricLI");
    obj.labMetricLI:setText("m");
    obj.labMetricLI:setAutoSize(true);
    obj.labMetricLI:setAlign("right");
    obj.labMetricLI:setMargins({left=4, right=2});
    obj.labMetricLI:setWordWrap(false);


				self.labCompLuz4.text = lang('scene.fogOfWar.luzIntensa') .. ":";								
			


    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(28);
    obj.layout14:setMargins({top=2});
    obj.layout14:setName("layout14");

    obj.labCompLuz5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz5:setParent(obj.layout14);
    obj.labCompLuz5:setName("labCompLuz5");
    obj.labCompLuz5:setAlign("left");
    obj.labCompLuz5:setWidth(100);
    obj.labCompLuz5:setHorzTextAlign("trailing");
    obj.labCompLuz5:setMargins({right=4});
    obj.labCompLuz5:setWordWrap(false);

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("client");
    obj.layout15:setName("layout15");

    obj.edtMetricLF = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMetricLF:setParent(obj.layout15);
    obj.edtMetricLF:setName("edtMetricLF");
    obj.edtMetricLF:setAlign("client");
    obj.edtMetricLF:setType("float");
    obj.edtMetricLF:setMin(0);
    obj.edtMetricLF:setMax(9999);
    obj.edtMetricLF:setDecimalPlaces(1);

    obj.labMetricLF = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricLF:setParent(obj.layout15);
    obj.labMetricLF:setName("labMetricLF");
    obj.labMetricLF:setText("m");
    obj.labMetricLF:setAutoSize(true);
    obj.labMetricLF:setAlign("right");
    obj.labMetricLF:setMargins({left=4, right=2});
    obj.labMetricLF:setWordWrap(false);


				self.labCompLuz5.text = lang('scene.fogOfWar.luzFraca') .. ":";								
			


    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(28);
    obj.layout16:setMargins({top=2});
    obj.layout16:setName("layout16");

    obj.labCompAngulo2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompAngulo2:setParent(obj.layout16);
    obj.labCompAngulo2:setName("labCompAngulo2");
    obj.labCompAngulo2:setAlign("left");
    obj.labCompAngulo2:setWidth(100);
    obj.labCompAngulo2:setHorzTextAlign("trailing");
    obj.labCompAngulo2:setMargins({right=4});
    obj.labCompAngulo2:setWordWrap(false);

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setAlign("client");
    obj.layout17:setName("layout17");

    obj.edtAnguloLuz = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtAnguloLuz:setParent(obj.layout17);
    obj.edtAnguloLuz:setName("edtAnguloLuz");
    obj.edtAnguloLuz:setAlign("client");
    obj.edtAnguloLuz:setType("float");
    obj.edtAnguloLuz:setMin(1);
    obj.edtAnguloLuz:setMax(360);
    obj.edtAnguloLuz:setDecimalPlaces(0);

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout17);
    obj.label5:setText("graus");
    obj.label5:setAutoSize(true);
    obj.label5:setAlign("right");
    obj.label5:setMargins({left=4, right=2});
    obj.label5:setName("label5");
    obj.label5:setWordWrap(false);


				self.labCompAngulo2.text = lang('scene.fogOfWar.angulo') .. ":";
			


    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj);
    obj.layout18:setName("layout18");
    obj.layout18:setAlign("bottom");
    obj.layout18:setMargins({top=2, bottom=2});
    obj.layout18:setHeight(40);

    obj.btnOk1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnOk1:setParent(obj.layout18);
    obj.btnOk1:setWidth(100);
    obj.btnOk1:setHorzTextAlign("center");
    obj.btnOk1:setAlign("right");
    obj.btnOk1:setName("btnOk1");
    obj.btnOk1:setMargins({left=4, right=4});

    obj.btnCancel1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnCancel1:setParent(obj.layout18);
    obj.btnCancel1:setHorzTextAlign("center");
    obj.btnCancel1:setAlign("right");
    obj.btnCancel1:setName("btnCancel1");
    obj.btnCancel1:setWidth(100);
    obj.btnCancel1:setMargins({left=4, right=4});


			self.btnOk1.text = lang("Ok");
			self.btnCancel1.text = lang("cancelar");
		


	
		self.title = lang('scene.menu.tokenOptions');	
		self.labPersonagem.text = lang('scene.tokenEdit.personagem');
		self.cbxSnapToGrid.text = lang('scene.tokenEdit.snapToGrid');
		self.labNome.text = lang('scene.tokenEdit.nome') .. ":";
		self.tabPrincipal.text = lang('scene.tokenEdit.propriedades');
		self.tabFOW.text = lang('scene.fogOfWar');
		self.labCampoDeVisao.text = lang('scene.fogOfWar.alcance.tokenVision');
		self.labLuz.text = lang('scene.fogOfWar.alcance.tokenLight');
		self.labHasVision.text = lang('scene.fogOfWar.token.hasSight');
		self.labFacingMode.text = lang('scene.FacingMode.title');
		self.cmbFacingMode.items = {lang('scene.FacingMode.rotate'), lang('scene.FacingMode.arrow')};
		self.labAlturaAura.text = lang('scene.labAlturaAura.text');
		self.labLarguraAura.text = lang('scene.labLarguraAura.text');
		self.labFormaAura.text = lang('scene.labFormaAura.text');
		
		self.cmbFormaAura.items = {lang('scene.FormaAura.URL'), 
		                           lang('scene.FormaAura.Circulo'), 
								   lang('scene.FormaAura.Quadrado'), 
								   lang('scene.FormaAura.ConeDiagonal'), 
								   lang('scene.FormaAura.ConeHorizontal'), 
								   lang('scene.FormaAura.SemiCirculo'), 
								   lang('scene.FormaAura.CirculoPerfeito')};
		
		self.cmbFormaAura.values = {'URL', 'C', 'Q', 'COD', 'COH', 'SC', 'CP'}
		self.labAuraURL.text = lang('scene.labAuraURL.text');
		self.labCorAura.text = lang('scene.labCorAura.text');
		self.labRaioAura.text = lang('scene.labRaioAura.text');
		self.labescolhaimg.text = lang('scene.labescolhaimg.text');
		
		local AURA_NAME = "aura"; 
		
		function recursiveEnumPersonagensEmBibItem(bibItem, dest)
			if bibItem.tipo == "personagem" then
				if (bibItem.loginDono ~= nil) and (bibItem.loginDono ~= "") then
					dest[#dest + 1] = bibItem;
				end;
			else
				local filhos = bibItem.filhos;
				
				for i = 1, #filhos, 1 do
					recursiveEnumPersonagensEmBibItem(filhos[i], dest);
				end;
			end; 
		end;
		
		function self:listarPersonagens(mesa)
			local personagens = {};
			recursiveEnumPersonagensEmBibItem(mesa.biblioteca, personagens);
			
			table.sort(personagens,
				function(left, right)
					return Utils.compareStringPtBr(left.nome, right.nome) < 0;
				end);
				
			local nomes = {};
			local valores = {};
			
			nomes[1] = LANG("scene.tokenEdit.semPersonagem");
			valores[1] = "0";
			
			for i = 1, #personagens, 1 do
				nomes[#nomes + 1] = personagens[i].nome;
				valores[#valores + 1] = tostring(personagens[i].codigoInterno);
			end;
			
			self.cmbPersonagem.items = nomes;
			self.cmbPersonagem.values = valores;
		end;
		
		function self:prepareForShow(oSelection, oScene)
			theSelection = oSelection;
			
			if #theSelection > 0 then
				theToken = theSelection[1];
			else
				theToken = nil;
			end;					
			
			podeVerBarrinhas = false;
			
			if theToken ~= nil then		
				podeVerBarrinhas = oScene.isGM or theToken.isMine;
				podeVerCoisasDeFoW = podeVerBarrinhas and oScene.fogOfWar.enabled;
			
				theMesa = Firecast.getMesaDe(oScene);
				self:beginUpdate();
			
				if theMesa ~= nil then
					self:listarPersonagens(theMesa);
					self.cmbPersonagem.value = tostring(theToken.ownerCharacter) or "0";
				else
					self.cmbPersonagem.items = {};
				end;
			
				self.cbxSnapToGrid.checked = theToken.snapToGrid;
				self.edtNome.text = theToken.name;
				
				for i = 1, 3, 1 do
					self["flpBar" .. i].visible = podeVerBarrinhas;
					
					if podeVerBarrinhas then
						self["edtBarValue" .. i].text = theToken["barValue" .. i];
						self["edtBarMax" .. i].text = theToken["barMax" .. i];						
						self["cmbCorBar" .. i].color = theToken["barColor" .. i];
					end;
				end;							
				
				self.tabFOW.visible = podeVerCoisasDeFoW;
				local metricToShow = lang("metric." .. oScene.worldMetricName);				
				self.labMetricVLI.text = metricToShow;
				self.labMetricVLF.text = metricToShow;
				self.labMetricVLE.text = metricToShow;
				self.labMetricLI.text = metricToShow;
				self.labMetricLF.text = metricToShow;
								
				self.edtMetricVLI.asNumber = theToken.visionIntenseLightRange;
				self.edtMetricVLF.asNumber = theToken.visionWeakLightRange;
				self.edtMetricVLE.asNumber = theToken.visionDarknessRange;				
				self.edtMetricLI.asNumber = theToken.lightIntenseRange;
				self.edtMetricLF.asNumber = theToken.lightWeakRange;
				self.edtAnguloVisao.asNumber = theToken.visionAngle;
				self.edtAnguloLuz.asNumber = theToken.lightAngle;
				self.cbxHasVision.checked = theToken.visionHaveVision;							
				self.cmbFacingMode.value = theToken.facingMode;		
				
				-- Carregar Dados de Aura		
				
				self.labUnidadeMetrica1.text = lang("metric." .. oScene.worldMetricName);
				self.labUnidadeMetrica2.text = lang("metric." .. oScene.worldMetricName);
				self.labUnidadeMetrica3.text = lang("metric." .. oScene.worldMetricName);
				
				local opGraficaAura = theToken.canvas:findByName(AURA_NAME);	
				
				if opGraficaAura ~= nil then				
					self.cbxPossuiAura.checked = true
					self.edtAlturaAura.asNumber = opGraficaAura.height or 0;					
					self.edtLarguraAura.asNumber = opGraficaAura.width or 0;					
					self.cmbFormaAura.value = opGraficaAura.userData.FormaAura;
					self.imageAura.url = opGraficaAura.url;
					self.edtRaioAura.asNumber = (opGraficaAura.height / 2) + (opGraficaAura.width / 2);
					self.labUnidadeMetrica1.text = lang("metric." .. oScene.worldMetricName);
					self.labUnidadeMetrica2.text = lang("metric." .. oScene.worldMetricName);
					self.labUnidadeMetrica3.text = lang("metric." .. oScene.worldMetricName);
					
					if opGraficaAura.userData.FormaAura == "URL" then
						self.imageAura.url = opGraficaAura.url;					
					elseif opGraficaAura.userData.FormaAura == "SC" then
						self.edtRaioAura.asNumber = (opGraficaAura.height / 2) + (opGraficaAura.width);
						self.cmbCorAura.color = opGraficaAura.color;
					else
						self.cmbCorAura.color = opGraficaAura.color;		
					end;					
				else
					self.cbxPossuiAura.checked = false
					self.cmbFormaAura.value = 'CP';
				end;																				
				
				self:endUpdate();											
			end;		
		end;		
		
		
		function self:processarOK()
			if theToken == nil then
				return;
			end;
		
			theToken:beginUpdate();
			
			tryFinally(
				function()
					SC3UNDO_Capture(theToken.scene, 
						function()
							local ownerCharID = tonumber(self.cmbPersonagem.value) or 0;
							
							if ownerCharID > 0 then
								theToken.ownerCharacter = ownerCharID;
							else
								theToken.ownerCharacter = 0;
							end;
							
							theToken.snapToGrid = self.cbxSnapToGrid.checked;
							theToken.name = self.edtNome.text;				
							
							if podeVerBarrinhas then
								for i = 1, 3, 1 do
									theToken["barValue" .. i] = self["edtBarValue" .. i].text;
									theToken["barMax" .. i] = self["edtBarMax" .. i].text;						
									theToken["barColor" .. i] = self["cmbCorBar" .. i].color;
								end;										
							end;
                           						   						   
							-- Salvar Aura
							
							local opGraficaAura = theToken.canvas:findByName(AURA_NAME);	
														
							-- 1 - Deletar se precisar deletar, ou se o que tem lá não é util.
							
							if opGraficaAura ~= nil then
							    local eraURL = opGraficaAura.userData.FormaAura == "URL"															
								local deveSerURL = self.cmbFormaAura.value == "URL"
							
								if not self.cbxPossuiAura.checked or (eraURL and not deveSerURL) or (not eraURL and deveSerURL) then
									opGraficaAura:delete()
									opGraficaAura = nil
								end;												
							end
																						
							-- 2 -- Se precisar, criar aura
														
							if opGraficaAura == nil and self.cbxPossuiAura.checked then
								if self.cmbFormaAura.value == "URL" then
									opGraficaAura = theToken.canvas:addBitmap();
								else
									opGraficaAura = theToken.canvas:addPath();
								end;															
							end
													
							
							-- 3 -- Se existir aura, alterar ela
							
							if opGraficaAura ~= nil then
								opGraficaAura.name = AURA_NAME
								opGraficaAura.height = self.edtAlturaAura.asNumber;
								opGraficaAura.width = self.edtLarguraAura.asNumber;
								opGraficaAura.y = (opGraficaAura.height /-2);
								opGraficaAura.x = (opGraficaAura.width /-2);
								opGraficaAura.xOrigin = 0.5;
								opGraficaAura.yOrigin = 0.5;
					            opGraficaAura.z = 10;                      
								opGraficaAura.outOfOrderMode = "beforeOwnerLayer"; 
								opGraficaAura.opacity = 0.5;     
								opGraficaAura.widthMetric = "worldMetric";
								opGraficaAura.heightMetric = "worldMetric";	
								opGraficaAura.xMetric = "worldMetric";
								opGraficaAura.yMetric = "worldMetric";
								opGraficaAura.userData.FormaAura = self.cmbFormaAura.value;
																
								if opGraficaAura.objectType == "opBitmap" then
									opGraficaAura.url = self.imageAura.url;
									opGraficaAura.opacity = 0.85;
								else		
									if opGraficaAura.userData.FormaAura == "C" then							
										opGraficaAura.color = self.cmbCorAura.color;
										opGraficaAura.height = self.edtRaioAura.asNumber;
								        opGraficaAura.width = self.edtRaioAura.asNumber;
										opGraficaAura.y = -(opGraficaAura.height / 2);
										opGraficaAura.x = -(opGraficaAura.width / 2);
										opGraficaAura.xOrigin = 0.5; 
										opGraficaAura.yOrigin = 0.5;
										opGraficaAura.pathData = criarPathAreaCirculo(math.ceil(opGraficaAura.height / 2));	
									end;
								
									if opGraficaAura.userData.FormaAura == "Q" then																										
										opGraficaAura.color = self.cmbCorAura.color;
										opGraficaAura.pathData = criarPathAreaQuadrado();										
									end;
									
									if opGraficaAura.userData.FormaAura == "COD" then
										opGraficaAura.color = self.cmbCorAura.color;
										opGraficaAura.xOrigin = 0.0;     -- X começa em 1.0 largura de token + 0.0 metros
										opGraficaAura.yOrigin = 0.0;
										opGraficaAura.height = self.edtRaioAura.asNumber;
								        opGraficaAura.width = self.edtRaioAura.asNumber;
										opGraficaAura.x = 0;	
										opGraficaAura.y = 0;	
										opGraficaAura.pathData = criarPathAreaConeDiagonal(math.ceil(opGraficaAura.height / 2), (math.ceil(opGraficaAura.width / 2)));										
									end;
																		
									if opGraficaAura.userData.FormaAura == "COH" then
										opGraficaAura.color = self.cmbCorAura.color;
										opGraficaAura.xOrigin = 1.0;  
										opGraficaAura.yOrigin = 0.5;
										opGraficaAura.x = 0;	
										opGraficaAura.y = opGraficaAura.height / -2;	
										opGraficaAura.pathData = criarPathAreaConeHorizontal(math.ceil((opGraficaAura.height / 2) + (opGraficaAura.width / 2)));										
									end;
									
									if opGraficaAura.userData.FormaAura == "SC" then
										opGraficaAura.color = self.cmbCorAura.color;										
										opGraficaAura.xOrigin = 1.0; 
										opGraficaAura.yOrigin = 0.5;
										opGraficaAura.x = 0;
										opGraficaAura.height = self.edtRaioAura.asNumber;
								        opGraficaAura.width = self.edtRaioAura.asNumber / 2;										
										opGraficaAura.y = opGraficaAura.height / -2;										
										opGraficaAura.pathData = criarPathAreaSemiCirculo(math.ceil((opGraficaAura.height / 2) + (opGraficaAura.width / 2)));
									end;
									
									if opGraficaAura.userData.FormaAura == "CP" then
										opGraficaAura.data = "M 25, 50 a 25,25 0 1,1 50,0 a 25,25 0 1,1 -50,0";		
										opGraficaAura.color = self.cmbCorAura.color;
										opGraficaAura.height = self.edtRaioAura.asNumber;
								        opGraficaAura.width = self.edtRaioAura.asNumber;
										opGraficaAura.y = opGraficaAura.height / -2;
										opGraficaAura.x = opGraficaAura.width / -2;
										opGraficaAura.xOrigin = 0.5; 
										opGraficaAura.yOrigin = 0.5;										
									end;
								end;
							end;
														
							-- Finaliza o Salva Aura 	
														
							if podeVerCoisasDeFoW then
								theToken.visionIntenseLightRange = self.edtMetricVLI.asNumber;
								theToken.visionWeakLightRange = self.edtMetricVLF.asNumber;
								theToken.visionDarknessRange = self.edtMetricVLE.asNumber;				
								theToken.lightIntenseRange = self.edtMetricLI.asNumber;
								theToken.lightWeakRange = self.edtMetricLF.asNumber;
								theToken.visionAngle = self.edtAnguloVisao.asNumber;
								theToken.lightAngle = self.edtAnguloLuz.asNumber;
								theToken.visionHaveVision = self.cbxHasVision.checked;
							end;
							
							theToken.facingMode = self.cmbFacingMode.value;
						end);
				end,
				
				function()				
					theToken:endUpdate();	
				end);			
					
			self:close();
		end;
			
		function self:processarCancel()
			self:close();
		end;
		


    obj._e_event0 = obj:addEventListener("onKeyUp",
        function (_, event)
            if (event.keyCode == 0x89) or (event.keyCode == 0x1B) then
            			setTimeout(
            				function()
            					self:processarCancel();
            				end, 1);
            			
            			event.keyCode = 0;
            			event.key = "";
            		end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onCancelRequest",
        function (_)
            self:processarCancel();
        end, obj);

    obj._e_event2 = obj.cbxPossuiAura:addEventListener("onChange",
        function (_)
            -- por mais feio que seja foi necessaria essas "gambiarra" por conta de algum bug do flowLayout --
            							
            							if self.cbxPossuiAura.checked then
            								self.flaAuraContent.visible = true;
            								self.flaAuraContent.height = self.flaAuraContent.height + 1;
            								self.flaAuraContent.height = self.flaAuraContent.height - 1;
            							else
            								self.flaAuraContent.visible = false;
            								self.flaAuraContent.height = self.flaAuraContent.height + 1;
            								self.flaAuraContent.height = self.flaAuraContent.height - 1;
            							end;
        end, obj);

    obj._e_event3 = obj.cmbFormaAura:addEventListener("onChange",
        function (_)
            if self.cmbFormaAura.value == "URL" then
            										self.flpImagemAura.visible = true;
            										self.fplCorAura.visible = false;
            										self.flaAuraContent:needRealign();
            									else
            										self.flpImagemAura.visible = false;
            										self.fplCorAura.visible = true;
            										self.flaAuraContent:needRealign();											
            									end;																			
            
            									if self.cmbFormaAura.value == "C" then	
            										self.flpRaioAura.visible = true;
            										self.fplAlturaAura.visible = false;
            										self.fplLarguraAura.visible = false;
            										self.flaAuraContent:needRealign();
            									elseif self.cmbFormaAura.value == "SC" then		
            										self.flpRaioAura.visible = true;
            										self.fplAlturaAura.visible = false;
            										self.fplLarguraAura.visible = false;
            										self.flaAuraContent:needRealign();
            									elseif self.cmbFormaAura.value == "CP" then
            										self.flpRaioAura.visible = true;
            										self.fplAlturaAura.visible = false;
            										self.fplLarguraAura.visible = false;
            										self.flaAuraContent:needRealign();
            									elseif self.cmbFormaAura.value == "COD" then
            										self.flpRaioAura.visible = true;
            										self.fplAlturaAura.visible = false;
            										self.fplLarguraAura.visible = false;
            										self.flaAuraContent:needRealign();
            									else
            										self.flpRaioAura.visible = false;
            										self.fplAlturaAura.visible = true;
            										self.fplLarguraAura.visible = true;
            										self.flaAuraContent:needRealign();
            									end;
        end, obj);

    obj._e_event4 = obj.btnOk1:addEventListener("onClick",
        function (_)
            self:processarOK()
        end, obj);

    obj._e_event5 = obj.btnCancel1:addEventListener("onClick",
        function (_)
            self:processarCancel()
        end, obj);

    function obj:_releaseEvents()
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

        if self.edtMetricVLE ~= nil then self.edtMetricVLE:destroy(); self.edtMetricVLE = nil; end;
        if self.labCompAngulo1 ~= nil then self.labCompAngulo1:destroy(); self.labCompAngulo1 = nil; end;
        if self.edtLarguraAura ~= nil then self.edtLarguraAura:destroy(); self.edtLarguraAura = nil; end;
        if self.cbxHasVision ~= nil then self.cbxHasVision:destroy(); self.cbxHasVision = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.labUnidadeMetrica2 ~= nil then self.labUnidadeMetrica2:destroy(); self.labUnidadeMetrica2 = nil; end;
        if self.flaContent ~= nil then self.flaContent:destroy(); self.flaContent = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edtBarMax3 ~= nil then self.edtBarMax3:destroy(); self.edtBarMax3 = nil; end;
        if self.labAlturaAura ~= nil then self.labAlturaAura:destroy(); self.labAlturaAura = nil; end;
        if self.edtBarMax1 ~= nil then self.edtBarMax1:destroy(); self.edtBarMax1 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.labGroupHeader1 ~= nil then self.labGroupHeader1:destroy(); self.labGroupHeader1 = nil; end;
        if self.edtAnguloVisao ~= nil then self.edtAnguloVisao:destroy(); self.edtAnguloVisao = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.flpFormaAura ~= nil then self.flpFormaAura:destroy(); self.flpFormaAura = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.labLuz ~= nil then self.labLuz:destroy(); self.labLuz = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.fplAlturaAura ~= nil then self.fplAlturaAura:destroy(); self.fplAlturaAura = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.flpRaioAura ~= nil then self.flpRaioAura:destroy(); self.flpRaioAura = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.cmbCorBar1 ~= nil then self.cmbCorBar1:destroy(); self.cmbCorBar1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.labSnapToGrid ~= nil then self.labSnapToGrid:destroy(); self.labSnapToGrid = nil; end;
        if self.imageAura ~= nil then self.imageAura:destroy(); self.imageAura = nil; end;
        if self.tabAura ~= nil then self.tabAura:destroy(); self.tabAura = nil; end;
        if self.labUnidadeMetrica3 ~= nil then self.labUnidadeMetrica3:destroy(); self.labUnidadeMetrica3 = nil; end;
        if self.labGroupHeader3 ~= nil then self.labGroupHeader3:destroy(); self.labGroupHeader3 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edtMetricVLI ~= nil then self.edtMetricVLI:destroy(); self.edtMetricVLI = nil; end;
        if self.cmbFacingMode ~= nil then self.cmbFacingMode:destroy(); self.cmbFacingMode = nil; end;
        if self.edtBarValue3 ~= nil then self.edtBarValue3:destroy(); self.edtBarValue3 = nil; end;
        if self.labMetricVLI ~= nil then self.labMetricVLI:destroy(); self.labMetricVLI = nil; end;
        if self.labCompLuz2 ~= nil then self.labCompLuz2:destroy(); self.labCompLuz2 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.labMetricLF ~= nil then self.labMetricLF:destroy(); self.labMetricLF = nil; end;
        if self.edtAnguloLuz ~= nil then self.edtAnguloLuz:destroy(); self.edtAnguloLuz = nil; end;
        if self.labMetricLI ~= nil then self.labMetricLI:destroy(); self.labMetricLI = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edtMetricLF ~= nil then self.edtMetricLF:destroy(); self.edtMetricLF = nil; end;
        if self.edtMetricLI ~= nil then self.edtMetricLI:destroy(); self.edtMetricLI = nil; end;
        if self.edtNome ~= nil then self.edtNome:destroy(); self.edtNome = nil; end;
        if self.tabPrincipal ~= nil then self.tabPrincipal:destroy(); self.tabPrincipal = nil; end;
        if self.edtBarValue2 ~= nil then self.edtBarValue2:destroy(); self.edtBarValue2 = nil; end;
        if self.cbxPossuiAura ~= nil then self.cbxPossuiAura:destroy(); self.cbxPossuiAura = nil; end;
        if self.labBar3 ~= nil then self.labBar3:destroy(); self.labBar3 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.labFormaAura ~= nil then self.labFormaAura:destroy(); self.labFormaAura = nil; end;
        if self.labCompLuz4 ~= nil then self.labCompLuz4:destroy(); self.labCompLuz4 = nil; end;
        if self.btnOk1 ~= nil then self.btnOk1:destroy(); self.btnOk1 = nil; end;
        if self.cmbFormaAura ~= nil then self.cmbFormaAura:destroy(); self.cmbFormaAura = nil; end;
        if self.labCompLuz3 ~= nil then self.labCompLuz3:destroy(); self.labCompLuz3 = nil; end;
        if self.labPersonagem ~= nil then self.labPersonagem:destroy(); self.labPersonagem = nil; end;
        if self.edtRaioAura ~= nil then self.edtRaioAura:destroy(); self.edtRaioAura = nil; end;
        if self.labCampoDeVisao ~= nil then self.labCampoDeVisao:destroy(); self.labCampoDeVisao = nil; end;
        if self.labCompLuz5 ~= nil then self.labCompLuz5:destroy(); self.labCompLuz5 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edtAuraURL ~= nil then self.edtAuraURL:destroy(); self.edtAuraURL = nil; end;
        if self.labNome ~= nil then self.labNome:destroy(); self.labNome = nil; end;
        if self.fplCorAura ~= nil then self.fplCorAura:destroy(); self.fplCorAura = nil; end;
        if self.tabFOW ~= nil then self.tabFOW:destroy(); self.tabFOW = nil; end;
        if self.labHasVision ~= nil then self.labHasVision:destroy(); self.labHasVision = nil; end;
        if self.labBar2 ~= nil then self.labBar2:destroy(); self.labBar2 = nil; end;
        if self.flaContentFOW ~= nil then self.flaContentFOW:destroy(); self.flaContentFOW = nil; end;
        if self.labFacingMode ~= nil then self.labFacingMode:destroy(); self.labFacingMode = nil; end;
        if self.flaAuraContent ~= nil then self.flaAuraContent:destroy(); self.flaAuraContent = nil; end;
        if self.edtAlturaAura ~= nil then self.edtAlturaAura:destroy(); self.edtAlturaAura = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.cmbCorBar3 ~= nil then self.cmbCorBar3:destroy(); self.cmbCorBar3 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.labMetricVLE ~= nil then self.labMetricVLE:destroy(); self.labMetricVLE = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.labCompAngulo2 ~= nil then self.labCompAngulo2:destroy(); self.labCompAngulo2 = nil; end;
        if self.labLarguraAura ~= nil then self.labLarguraAura:destroy(); self.labLarguraAura = nil; end;
        if self.labBar1 ~= nil then self.labBar1:destroy(); self.labBar1 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.flaAura ~= nil then self.flaAura:destroy(); self.flaAura = nil; end;
        if self.flpURLAura ~= nil then self.flpURLAura:destroy(); self.flpURLAura = nil; end;
        if self.edtBarMax2 ~= nil then self.edtBarMax2:destroy(); self.edtBarMax2 = nil; end;
        if self.labMetricVLF ~= nil then self.labMetricVLF:destroy(); self.labMetricVLF = nil; end;
        if self.labGroupHeader2 ~= nil then self.labGroupHeader2:destroy(); self.labGroupHeader2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.cmbCorAura ~= nil then self.cmbCorAura:destroy(); self.cmbCorAura = nil; end;
        if self.cmbPersonagem ~= nil then self.cmbPersonagem:destroy(); self.cmbPersonagem = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.edtBarValue1 ~= nil then self.edtBarValue1:destroy(); self.edtBarValue1 = nil; end;
        if self.flpImagemAura ~= nil then self.flpImagemAura:destroy(); self.flpImagemAura = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.labUnidadeMetrica1 ~= nil then self.labUnidadeMetrica1:destroy(); self.labUnidadeMetrica1 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.flpBar1 ~= nil then self.flpBar1:destroy(); self.flpBar1 = nil; end;
        if self.labRaioAura ~= nil then self.labRaioAura:destroy(); self.labRaioAura = nil; end;
        if self.flpBar3 ~= nil then self.flpBar3:destroy(); self.flpBar3 = nil; end;
        if self.cmbCorBar2 ~= nil then self.cmbCorBar2:destroy(); self.cmbCorBar2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.labCompLuz1 ~= nil then self.labCompLuz1:destroy(); self.labCompLuz1 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flpBar2 ~= nil then self.flpBar2:destroy(); self.flpBar2 = nil; end;
        if self.cbxSnapToGrid ~= nil then self.cbxSnapToGrid:destroy(); self.cbxSnapToGrid = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.labAuraURL ~= nil then self.labAuraURL:destroy(); self.labAuraURL = nil; end;
        if self.labescolhaimg ~= nil then self.labescolhaimg:destroy(); self.labescolhaimg = nil; end;
        if self.fplLarguraAura ~= nil then self.fplLarguraAura:destroy(); self.fplLarguraAura = nil; end;
        if self.labCorAura ~= nil then self.labCorAura:destroy(); self.labCorAura = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edtMetricVLF ~= nil then self.edtMetricVLF:destroy(); self.edtMetricVLF = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.btnCancel1 ~= nil then self.btnCancel1:destroy(); self.btnCancel1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTokenProps()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTokenProps();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTokenProps = {
    newEditor = newfrmTokenProps, 
    new = newfrmTokenProps, 
    name = "frmTokenProps", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmTokenProps = _frmTokenProps;
Firecast.registrarForm(_frmTokenProps);

return _frmTokenProps;
