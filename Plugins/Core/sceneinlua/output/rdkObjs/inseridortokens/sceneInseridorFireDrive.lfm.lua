require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmInseriorFireDrive()
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
    obj:setName("frmInseriorFireDrive");
    obj:setWidth(460);
    obj:setHeight(300);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);


		require("system.lua");
		require("rrpgScene_Undo.dlua");
		require("dialogs.lua");
		require("fireDrive.lua");
		require("rrpgScene_Globals.lua");
		local scene = nil;	
		
		if not System.isMobile() then
			self.height = 485;
		end;
		
		function self:checkVisibilityOfTabControl()
			local selected = self.rclListaDosTokens.selectedNode;  			
			local mustBeVisible = selected ~= nil;
			
			self.dsbToken.visible = mustBeVisible;
			self.layInfoSelectOrCreateToken.visible = not mustBeVisible; 
			self.btnInsert.enabled = mustBeVisible;
			self.btnOkName.enabled = mustBeVisible;
			self.delete.enabled = mustBeVisible;
		end;
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(130);
    obj.layout1:setAlign("left");
    obj.layout1:setMargins({left=5, bottom=2, top=2});
    obj.layout1:setName("layout1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.layout1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.btnNew = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNew:setParent(obj.flowLayout1);
    obj.btnNew:setWidth(60);
    obj.btnNew:setHorzTextAlign("center");
    obj.btnNew:setMargins({left=0, top=2, bottom=2, right=2});
    obj.btnNew:setName("btnNew");
    obj.btnNew:setHeight(35);

    obj.delete = GUI.fromHandle(_obj_newObject("button"));
    obj.delete:setParent(obj.flowLayout1);
    obj.delete:setWidth(60);
    obj.delete:setMargins({left=0, top=2, bottom=2});
    obj.delete:setName("delete");
    obj.delete:setHeight(35);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#707070");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setStrokeColor("#70707080");
    obj.rectangle1:setName("rectangle1");

    obj.rclListaDosTokens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTokens:setParent(obj.rectangle1);
    obj.rclListaDosTokens:setAlign("client");
    obj.rclListaDosTokens:setName("rclListaDosTokens");
    obj.rclListaDosTokens:setField("tokensSalvos");
    obj.rclListaDosTokens:setTemplateForm("rclPlayer_svg");
    obj.rclListaDosTokens:setSelectable(true);

    obj.layInfoSelectOrCreateToken = GUI.fromHandle(_obj_newObject("layout"));
    obj.layInfoSelectOrCreateToken:setParent(obj.scrollBox1);
    obj.layInfoSelectOrCreateToken:setVisible(false);
    obj.layInfoSelectOrCreateToken:setName("layInfoSelectOrCreateToken");
    obj.layInfoSelectOrCreateToken:setAlign("client");
    obj.layInfoSelectOrCreateToken:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labSelectTokenInfo = GUI.fromHandle(_obj_newObject("label"));
    obj.labSelectTokenInfo:setParent(obj.layInfoSelectOrCreateToken);
    obj.labSelectTokenInfo:setName("labSelectTokenInfo");
    obj.labSelectTokenInfo:setAlign("client");
    obj.labSelectTokenInfo:setVertTextAlign("center");
    obj.labSelectTokenInfo:setHorzTextAlign("center");
    obj.labSelectTokenInfo:setWordWrap(true);

    obj.dsbToken = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dsbToken:setParent(obj.scrollBox1);
    obj.dsbToken:setAlign("client");
    obj.dsbToken:setName("dsbToken");

    obj.tabCtrlDados = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabCtrlDados:setParent(obj.dsbToken);
    obj.tabCtrlDados:setAlign("client");
    obj.tabCtrlDados:setMargins({left=5, bottom=2, top=2, right=5});
    obj.tabCtrlDados:setName("tabCtrlDados");

    obj.tabPrincipal = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabPrincipal:setParent(obj.tabCtrlDados);
    obj.tabPrincipal:setName("tabPrincipal");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tabPrincipal);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flaContent = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContent:setParent(obj.scrollBox2);
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
    obj.labGroupHeader1:setAlign("left");
    obj.labGroupHeader1:setAutoSize(true);
    obj.labGroupHeader1:setWordWrap(false);
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
    obj.labPersonagem:setAlign("left");
    obj.labPersonagem:setWidth(110);
    obj.labPersonagem:setAutoSize(false);
    obj.labPersonagem:setHorzTextAlign("trailing");
    obj.labPersonagem:setVertTextAlign("center");
    obj.labPersonagem:setMargins({right=5});

    obj.cmbPersonagem = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbPersonagem:setParent(obj.flowPart2);
    obj.cmbPersonagem:setName("cmbPersonagem");
    obj.cmbPersonagem:setField("character");
    obj.cmbPersonagem:setAlign("client");
    obj.cmbPersonagem:setMargins({right=5});

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flaContent);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setHeight(30);
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(5000);
    obj.flowPart3:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labelText = GUI.fromHandle(_obj_newObject("label"));
    obj.labelText:setParent(obj.flowPart3);
    obj.labelText:setName("labelText");
    obj.labelText:setAlign("left");
    obj.labelText:setWidth(110);
    obj.labelText:setAutoSize(false);
    obj.labelText:setHorzTextAlign("trailing");
    obj.labelText:setVertTextAlign("center");
    obj.labelText:setMargins({right=5});

    obj.labelVal = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelVal:setParent(obj.flowPart3);
    obj.labelVal:setName("labelVal");
    obj.labelVal:setField("name");
    obj.labelVal:setAlign("client");
    obj.labelVal:setMargins({right=5});

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
    obj.labSnapToGrid:setAlign("left");
    obj.labSnapToGrid:setWidth(110);
    obj.labSnapToGrid:setAutoSize(false);
    obj.labSnapToGrid:setHorzTextAlign("trailing");
    obj.labSnapToGrid:setVertTextAlign("center");
    obj.labSnapToGrid:setMargins({right=5});

    obj.cbxSnapToGrid = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxSnapToGrid:setParent(obj.flowPart4);
    obj.cbxSnapToGrid:setName("cbxSnapToGrid");
    obj.cbxSnapToGrid:setField("snapToGrid");
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
    obj.labFacingMode:setAlign("left");
    obj.labFacingMode:setWidth(110);
    obj.labFacingMode:setAutoSize(false);
    obj.labFacingMode:setHorzTextAlign("trailing");
    obj.labFacingMode:setVertTextAlign("center");
    obj.labFacingMode:setMargins({right=5});

    obj.cmbFacingMode = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbFacingMode:setParent(obj.flowPart5);
    obj.cmbFacingMode:setName("cmbFacingMode");
    obj.cmbFacingMode:setValues({'rotate', 'drawArrow'});
    obj.cmbFacingMode:setField("facingMode");
    obj.cmbFacingMode:setAlign("client");
    obj.cmbFacingMode:setMargins({right=5});

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flaContent);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setHeight(30);
    obj.flowPart6:setMinWidth(50);
    obj.flowPart6:setMaxWidth(5000);
    obj.flowPart6:setMargins({left=2, right=2, top=2, bottom=2});

    obj.layerText = GUI.fromHandle(_obj_newObject("label"));
    obj.layerText:setParent(obj.flowPart6);
    obj.layerText:setName("layerText");
    obj.layerText:setAlign("left");
    obj.layerText:setWidth(110);
    obj.layerText:setAutoSize(false);
    obj.layerText:setHorzTextAlign("trailing");
    obj.layerText:setVertTextAlign("center");
    obj.layerText:setMargins({right=5});

    obj.layerVal = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.layerVal:setParent(obj.flowPart6);
    obj.layerVal:setName("layerVal");
    obj.layerVal:setField("layer");
    obj.layerVal:setAlign("client");
    obj.layerVal:setMargins({right=5});

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
    obj.labBar1:setAlign("left");
    obj.labBar1:setWidth(110);
    obj.labBar1:setAutoSize(false);
    obj.labBar1:setHorzTextAlign("trailing");
    obj.labBar1:setVertTextAlign("center");
    obj.labBar1:setMargins({right=5});

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flpBar1);
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setAlign("client");
    obj.flowLayout2:setMargins({right=5});

    obj.edtBarValue1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarValue1:setParent(obj.flowLayout2);
    obj.edtBarValue1:setName("edtBarValue1");
    obj.edtBarValue1:setWidth(35);
    obj.edtBarValue1:setField("bar1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowLayout2);
    obj.label1:setText("/");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setAutoSize(true);
    obj.label1:setWordWrap(false);
    obj.label1:setMargins({left=8, right=8});
    obj.label1:setName("label1");

    obj.edtBarMax1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarMax1:setParent(obj.flowLayout2);
    obj.edtBarMax1:setName("edtBarMax1");
    obj.edtBarMax1:setWidth(35);
    obj.edtBarMax1:setField("bar1Max");

    obj.cmbCorBar1 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorBar1:setParent(obj.flowLayout2);
    obj.cmbCorBar1:setName("cmbCorBar1");
    obj.cmbCorBar1:setWidth(50);
    obj.cmbCorBar1:setUseAlpha(false);
    obj.cmbCorBar1:setMargins({left=8, right=8});
    obj.cmbCorBar1:setField("bar1Color");


			self.labBar1.text = LANG('scene.tokenEdit.barraPrefix') .. " 1:";
		


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
    obj.labBar2:setAlign("left");
    obj.labBar2:setWidth(110);
    obj.labBar2:setAutoSize(false);
    obj.labBar2:setHorzTextAlign("trailing");
    obj.labBar2:setVertTextAlign("center");
    obj.labBar2:setMargins({right=5});

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flpBar2);
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setAlign("client");
    obj.flowLayout3:setMargins({right=5});

    obj.edtBarValue2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarValue2:setParent(obj.flowLayout3);
    obj.edtBarValue2:setName("edtBarValue2");
    obj.edtBarValue2:setWidth(35);
    obj.edtBarValue2:setField("bar2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout3);
    obj.label2:setText("/");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setAutoSize(true);
    obj.label2:setWordWrap(false);
    obj.label2:setMargins({left=8, right=8});
    obj.label2:setName("label2");

    obj.edtBarMax2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarMax2:setParent(obj.flowLayout3);
    obj.edtBarMax2:setName("edtBarMax2");
    obj.edtBarMax2:setWidth(35);
    obj.edtBarMax2:setField("bar2Max");

    obj.cmbCorBar2 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorBar2:setParent(obj.flowLayout3);
    obj.cmbCorBar2:setName("cmbCorBar2");
    obj.cmbCorBar2:setWidth(50);
    obj.cmbCorBar2:setUseAlpha(false);
    obj.cmbCorBar2:setMargins({left=8, right=8});
    obj.cmbCorBar2:setField("bar2Color");


			self.labBar2.text = LANG('scene.tokenEdit.barraPrefix') .. " 2:";
		


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
    obj.labBar3:setAlign("left");
    obj.labBar3:setWidth(110);
    obj.labBar3:setAutoSize(false);
    obj.labBar3:setHorzTextAlign("trailing");
    obj.labBar3:setVertTextAlign("center");
    obj.labBar3:setMargins({right=5});

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flpBar3);
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setAlign("client");
    obj.flowLayout4:setMargins({right=5});

    obj.edtBarValue3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarValue3:setParent(obj.flowLayout4);
    obj.edtBarValue3:setName("edtBarValue3");
    obj.edtBarValue3:setWidth(35);
    obj.edtBarValue3:setField("bar3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout4);
    obj.label3:setText("/");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setAutoSize(true);
    obj.label3:setWordWrap(false);
    obj.label3:setMargins({left=8, right=8});
    obj.label3:setName("label3");

    obj.edtBarMax3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtBarMax3:setParent(obj.flowLayout4);
    obj.edtBarMax3:setName("edtBarMax3");
    obj.edtBarMax3:setWidth(35);
    obj.edtBarMax3:setField("bar3Max");

    obj.cmbCorBar3 = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorBar3:setParent(obj.flowLayout4);
    obj.cmbCorBar3:setName("cmbCorBar3");
    obj.cmbCorBar3:setWidth(50);
    obj.cmbCorBar3:setUseAlpha(false);
    obj.cmbCorBar3:setMargins({left=8, right=8});
    obj.cmbCorBar3:setField("bar3Color");


			self.labBar3.text = LANG('scene.tokenEdit.barraPrefix') .. " 3:";
		


    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flaContent);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setHeight(30);
    obj.flowPart7:setMinWidth(50);
    obj.flowPart7:setMaxWidth(5000);
    obj.flowPart7:setMargins({left=2, right=2, top=2, bottom=2});

    obj.widthText = GUI.fromHandle(_obj_newObject("label"));
    obj.widthText:setParent(obj.flowPart7);
    obj.widthText:setLeft(55);
    obj.widthText:setTop(5);
    obj.widthText:setWidth(60);
    obj.widthText:setHeight(20);
    obj.widthText:setName("widthText");
    obj.widthText:setHorzTextAlign("center");

    obj.widthVal = GUI.fromHandle(_obj_newObject("edit"));
    obj.widthVal:setParent(obj.flowPart7);
    obj.widthVal:setLeft(115);
    obj.widthVal:setTop(5);
    obj.widthVal:setWidth(50);
    obj.widthVal:setHeight(25);
    obj.widthVal:setName("widthVal");
    obj.widthVal:setType("number");
    obj.widthVal:setField("width");

    obj.widthCell = GUI.fromHandle(_obj_newObject("label"));
    obj.widthCell:setParent(obj.flowPart7);
    obj.widthCell:setLeft(170);
    obj.widthCell:setTop(5);
    obj.widthCell:setWidth(60);
    obj.widthCell:setHeight(20);
    obj.widthCell:setName("widthCell");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flaContent);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setHeight(30);
    obj.flowPart8:setMinWidth(50);
    obj.flowPart8:setMaxWidth(5000);
    obj.flowPart8:setMargins({left=2, right=2, top=2, bottom=2});

    obj.heightText = GUI.fromHandle(_obj_newObject("label"));
    obj.heightText:setParent(obj.flowPart8);
    obj.heightText:setLeft(55);
    obj.heightText:setTop(5);
    obj.heightText:setWidth(60);
    obj.heightText:setHeight(20);
    obj.heightText:setName("heightText");
    obj.heightText:setHorzTextAlign("center");

    obj.heightVal = GUI.fromHandle(_obj_newObject("edit"));
    obj.heightVal:setParent(obj.flowPart8);
    obj.heightVal:setLeft(115);
    obj.heightVal:setTop(5);
    obj.heightVal:setWidth(50);
    obj.heightVal:setHeight(25);
    obj.heightVal:setName("heightVal");
    obj.heightVal:setType("number");
    obj.heightVal:setField("height");

    obj.heightCell = GUI.fromHandle(_obj_newObject("label"));
    obj.heightCell:setParent(obj.flowPart8);
    obj.heightCell:setLeft(170);
    obj.heightCell:setTop(5);
    obj.heightCell:setWidth(60);
    obj.heightCell:setHeight(20);
    obj.heightCell:setName("heightCell");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flaContent);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setHeight(30);
    obj.flowPart9:setMinWidth(50);
    obj.flowPart9:setMaxWidth(5000);
    obj.flowPart9:setMargins({left=2, right=2, top=2, bottom=2});

    obj.angleText = GUI.fromHandle(_obj_newObject("label"));
    obj.angleText:setParent(obj.flowPart9);
    obj.angleText:setLeft(55);
    obj.angleText:setTop(5);
    obj.angleText:setWidth(60);
    obj.angleText:setHeight(20);
    obj.angleText:setName("angleText");
    obj.angleText:setHorzTextAlign("center");

    obj.angleVal = GUI.fromHandle(_obj_newObject("edit"));
    obj.angleVal:setParent(obj.flowPart9);
    obj.angleVal:setLeft(115);
    obj.angleVal:setTop(5);
    obj.angleVal:setWidth(50);
    obj.angleVal:setHeight(25);
    obj.angleVal:setName("angleVal");
    obj.angleVal:setType("float");
    obj.angleVal:setMin(0);
    obj.angleVal:setMax(360);
    obj.angleVal:setDecimalPlaces(1);
    obj.angleVal:setField("angle");

    obj.angleDegree = GUI.fromHandle(_obj_newObject("label"));
    obj.angleDegree:setParent(obj.flowPart9);
    obj.angleDegree:setLeft(170);
    obj.angleDegree:setTop(5);
    obj.angleDegree:setWidth(60);
    obj.angleDegree:setHeight(20);
    obj.angleDegree:setName("angleDegree");

    obj.tabImagem = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabImagem:setParent(obj.tabCtrlDados);
    obj.tabImagem:setName("tabImagem");

    obj.labTitle = GUI.fromHandle(_obj_newObject("label"));
    obj.labTitle:setParent(obj.tabImagem);
    obj.labTitle:setName("labTitle");
    obj.labTitle:setLeft(10);
    obj.labTitle:setTop(0);
    obj.labTitle:setWidth(100);
    obj.labTitle:setHeight(28);
    obj.labTitle:setHorzTextAlign("leading");
    obj.labTitle:setVertTextAlign("center");
    obj.labTitle:setFontSize(15);
    obj.labTitle:setFontColor("#FFCC66");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.tabImagem);
    obj.horzLine2:setLeft(10);
    obj.horzLine2:setTop(30);
    obj.horzLine2:setWidth(290);
    obj.horzLine2:setStrokeColor("#FFCC6670");
    obj.horzLine2:setMargins({left=10});
    obj.horzLine2:setName("horzLine2");


						self.labTitle.text = lang("scene.inseridor.tab.imagem");
					


    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.tabImagem);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(30);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(270);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(45);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(200);
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.click = GUI.fromHandle(_obj_newObject("label"));
    obj.click:setParent(obj.layout2);
    obj.click:setLeft(45);
    obj.click:setTop(95);
    obj.click:setWidth(200);
    obj.click:setHeight(20);
    obj.click:setFontSize(11);
    obj.click:setName("click");
    obj.click:setHorzTextAlign("center");

    obj.image = GUI.fromHandle(_obj_newObject("image"));
    obj.image:setParent(obj.layout2);
    obj.image:setLeft(45);
    obj.image:setTop(5);
    obj.image:setWidth(200);
    obj.image:setHeight(200);
    obj.image:setStyle("autoFit");
    obj.image:setEditable(true);
    obj.image:setName("image");
    obj.image:setField("image");

    obj.input = GUI.fromHandle(_obj_newObject("button"));
    obj.input:setParent(obj.layout2);
    obj.input:setLeft(55);
    obj.input:setTop(215);
    obj.input:setWidth(185);
    obj.input:setHeight(25);
    obj.input:setName("input");

    obj.tabFOW = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabFOW:setParent(obj.tabCtrlDados);
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

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flaContentFOW);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setHeight(30);
    obj.flowPart10:setMinWidth(50);
    obj.flowPart10:setMaxWidth(5000);
    obj.flowPart10:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader2:setParent(obj.flowPart10);
    obj.labGroupHeader2:setName("labGroupHeader2");
    obj.labGroupHeader2:setAlign("left");
    obj.labGroupHeader2:setAutoSize(true);
    obj.labGroupHeader2:setWordWrap(false);
    obj.labGroupHeader2:setHorzTextAlign("leading");
    obj.labGroupHeader2:setVertTextAlign("center");
    obj.labGroupHeader2:setMargins({left=10, right=5});
    obj.labGroupHeader2:setFontSize(15);
    obj.labGroupHeader2:setFontColor("#FFCC66");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart10);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setStrokeColor("#FFCC6670");
    obj.horzLine3:setMargins({left=10});
    obj.horzLine3:setName("horzLine3");


			self.labGroupHeader2.text = lang("scene.fogOfWar.tokenVision");
		


    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flaContentFOW);
    obj.flowPart11:setHeight(150);
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMinWidth(50);
    obj.flowPart11:setMaxWidth(5000);
    obj.flowPart11:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labCampoDeVisao = GUI.fromHandle(_obj_newObject("label"));
    obj.labCampoDeVisao:setParent(obj.flowPart11);
    obj.labCampoDeVisao:setName("labCampoDeVisao");
    obj.labCampoDeVisao:setAlign("left");
    obj.labCampoDeVisao:setWidth(110);
    obj.labCampoDeVisao:setAutoSize(false);
    obj.labCampoDeVisao:setHorzTextAlign("trailing");
    obj.labCampoDeVisao:setVertTextAlign("center");
    obj.labCampoDeVisao:setMargins({right=5});

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart11);
    obj.layout3:setName("layout3");
    obj.layout3:setAlign("client");
    obj.layout3:setMargins({right=5});

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(28);
    obj.layout4:setMargins({top=2});
    obj.layout4:setName("layout4");

    obj.labHasVision = GUI.fromHandle(_obj_newObject("label"));
    obj.labHasVision:setParent(obj.layout4);
    obj.labHasVision:setName("labHasVision");
    obj.labHasVision:setAlign("left");
    obj.labHasVision:setWidth(100);
    obj.labHasVision:setHorzTextAlign("trailing");
    obj.labHasVision:setMargins({right=4});

    obj.visionHave = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.visionHave:setParent(obj.layout4);
    obj.visionHave:setName("visionHave");
    obj.visionHave:setAlign("client");
    obj.visionHave:setMargins({top=2});
    obj.visionHave:setField("hasSight");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(28);
    obj.layout5:setMargins({top=2});
    obj.layout5:setName("layout5");

    obj.labCompLuz1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz1:setParent(obj.layout5);
    obj.labCompLuz1:setName("labCompLuz1");
    obj.labCompLuz1:setAlign("left");
    obj.labCompLuz1:setWidth(100);
    obj.labCompLuz1:setHorzTextAlign("trailing");
    obj.labCompLuz1:setMargins({right=4});

    obj.visionIntense = GUI.fromHandle(_obj_newObject("edit"));
    obj.visionIntense:setParent(obj.layout5);
    obj.visionIntense:setLeft(105);
    obj.visionIntense:setTop(0);
    obj.visionIntense:setWidth(50);
    obj.visionIntense:setHeight(28);
    obj.visionIntense:setName("visionIntense");
    obj.visionIntense:setType("float");
    obj.visionIntense:setMin(0);
    obj.visionIntense:setMax(9999);
    obj.visionIntense:setDecimalPlaces(1);
    obj.visionIntense:setField("visionIntense");

    obj.labMetricVLI = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricVLI:setParent(obj.layout5);
    obj.labMetricVLI:setLeft(158);
    obj.labMetricVLI:setTop(3);
    obj.labMetricVLI:setWidth(50);
    obj.labMetricVLI:setHeight(28);
    obj.labMetricVLI:setName("labMetricVLI");
    obj.labMetricVLI:setText("m");
    obj.labMetricVLI:setAutoSize(true);
    obj.labMetricVLI:setMargins({left=4, right=2});


						self.labCompLuz1.text = lang('scene.fogOfWar.sobLuzIntensa') .. ":";								
					


    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(28);
    obj.layout6:setMargins({top=2});
    obj.layout6:setName("layout6");

    obj.labCompLuz2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz2:setParent(obj.layout6);
    obj.labCompLuz2:setName("labCompLuz2");
    obj.labCompLuz2:setAlign("left");
    obj.labCompLuz2:setWidth(100);
    obj.labCompLuz2:setHorzTextAlign("trailing");
    obj.labCompLuz2:setMargins({right=4});

    obj.visionWeak = GUI.fromHandle(_obj_newObject("edit"));
    obj.visionWeak:setParent(obj.layout6);
    obj.visionWeak:setLeft(105);
    obj.visionWeak:setTop(0);
    obj.visionWeak:setWidth(50);
    obj.visionWeak:setHeight(28);
    obj.visionWeak:setName("visionWeak");
    obj.visionWeak:setType("float");
    obj.visionWeak:setMin(0);
    obj.visionWeak:setMax(9999);
    obj.visionWeak:setDecimalPlaces(1);
    obj.visionWeak:setField("visionWeak");

    obj.labMetricVLF = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricVLF:setParent(obj.layout6);
    obj.labMetricVLF:setLeft(158);
    obj.labMetricVLF:setTop(3);
    obj.labMetricVLF:setWidth(50);
    obj.labMetricVLF:setHeight(28);
    obj.labMetricVLF:setName("labMetricVLF");
    obj.labMetricVLF:setText("m");
    obj.labMetricVLF:setAutoSize(true);
    obj.labMetricVLF:setMargins({left=4, right=2});


						self.labCompLuz2.text = lang('scene.fogOfWar.sobLuzFraca') .. ":";								
					


    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout3);
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

    obj.visionDark = GUI.fromHandle(_obj_newObject("edit"));
    obj.visionDark:setParent(obj.layout7);
    obj.visionDark:setLeft(105);
    obj.visionDark:setTop(0);
    obj.visionDark:setWidth(50);
    obj.visionDark:setHeight(28);
    obj.visionDark:setName("visionDark");
    obj.visionDark:setType("float");
    obj.visionDark:setMin(0);
    obj.visionDark:setMax(9999);
    obj.visionDark:setDecimalPlaces(1);
    obj.visionDark:setField("visionDark");

    obj.labMetricVLE = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricVLE:setParent(obj.layout7);
    obj.labMetricVLE:setLeft(158);
    obj.labMetricVLE:setTop(3);
    obj.labMetricVLE:setWidth(50);
    obj.labMetricVLE:setHeight(28);
    obj.labMetricVLE:setName("labMetricVLE");
    obj.labMetricVLE:setText("m");
    obj.labMetricVLE:setAutoSize(true);
    obj.labMetricVLE:setMargins({left=4, right=2});


						self.labCompLuz3.text = lang('scene.fogOfWar.sobEscuridao') .. ":";								
					


    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout3);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(28);
    obj.layout8:setMargins({top=2});
    obj.layout8:setName("layout8");

    obj.labCompAngulo1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompAngulo1:setParent(obj.layout8);
    obj.labCompAngulo1:setName("labCompAngulo1");
    obj.labCompAngulo1:setAlign("left");
    obj.labCompAngulo1:setWidth(100);
    obj.labCompAngulo1:setHorzTextAlign("trailing");
    obj.labCompAngulo1:setMargins({right=4});

    obj.visionAngle = GUI.fromHandle(_obj_newObject("edit"));
    obj.visionAngle:setParent(obj.layout8);
    obj.visionAngle:setLeft(105);
    obj.visionAngle:setTop(0);
    obj.visionAngle:setWidth(30);
    obj.visionAngle:setHeight(28);
    obj.visionAngle:setName("visionAngle");
    obj.visionAngle:setType("float");
    obj.visionAngle:setMin(1);
    obj.visionAngle:setMax(360);
    obj.visionAngle:setDecimalPlaces(1);
    obj.visionAngle:setField("visionAngle");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout8);
    obj.label4:setLeft(138);
    obj.label4:setTop(3);
    obj.label4:setWidth(50);
    obj.label4:setHeight(28);
    obj.label4:setName("label4");
    obj.label4:setText("graus");
    obj.label4:setAutoSize(true);
    obj.label4:setMargins({left=4, right=2});


						self.labCompAngulo1.text = lang('scene.fogOfWar.angulo') .. ":";
					


    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flaContentFOW);
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setHeight(30);
    obj.flowPart12:setMinWidth(50);
    obj.flowPart12:setMaxWidth(5000);
    obj.flowPart12:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader3:setParent(obj.flowPart12);
    obj.labGroupHeader3:setName("labGroupHeader3");
    obj.labGroupHeader3:setAlign("left");
    obj.labGroupHeader3:setAutoSize(true);
    obj.labGroupHeader3:setWordWrap(false);
    obj.labGroupHeader3:setHorzTextAlign("leading");
    obj.labGroupHeader3:setVertTextAlign("center");
    obj.labGroupHeader3:setMargins({left=10, right=5});
    obj.labGroupHeader3:setFontSize(15);
    obj.labGroupHeader3:setFontColor("#FFCC66");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.flowPart12);
    obj.horzLine4:setAlign("bottom");
    obj.horzLine4:setStrokeColor("#FFCC6670");
    obj.horzLine4:setMargins({left=10});
    obj.horzLine4:setName("horzLine4");


			self.labGroupHeader3.text = lang("scene.fogOfWar.tokenLight");
		


    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flaContentFOW);
    obj.flowPart13:setHeight(90);
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMinWidth(50);
    obj.flowPart13:setMaxWidth(5000);
    obj.flowPart13:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labLuz = GUI.fromHandle(_obj_newObject("label"));
    obj.labLuz:setParent(obj.flowPart13);
    obj.labLuz:setName("labLuz");
    obj.labLuz:setAlign("left");
    obj.labLuz:setWidth(110);
    obj.labLuz:setAutoSize(false);
    obj.labLuz:setHorzTextAlign("trailing");
    obj.labLuz:setVertTextAlign("center");
    obj.labLuz:setMargins({right=5});

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart13);
    obj.layout9:setName("layout9");
    obj.layout9:setAlign("client");
    obj.layout9:setMargins({right=5});

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(28);
    obj.layout10:setMargins({top=2});
    obj.layout10:setName("layout10");

    obj.labCompLuz4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz4:setParent(obj.layout10);
    obj.labCompLuz4:setName("labCompLuz4");
    obj.labCompLuz4:setAlign("left");
    obj.labCompLuz4:setWidth(100);
    obj.labCompLuz4:setHorzTextAlign("trailing");
    obj.labCompLuz4:setMargins({right=4});

    obj.lightIntense = GUI.fromHandle(_obj_newObject("edit"));
    obj.lightIntense:setParent(obj.layout10);
    obj.lightIntense:setLeft(105);
    obj.lightIntense:setTop(0);
    obj.lightIntense:setWidth(50);
    obj.lightIntense:setHeight(28);
    obj.lightIntense:setName("lightIntense");
    obj.lightIntense:setType("float");
    obj.lightIntense:setMin(0);
    obj.lightIntense:setMax(9999);
    obj.lightIntense:setDecimalPlaces(1);
    obj.lightIntense:setField("lightIntense");

    obj.labMetricLI = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricLI:setParent(obj.layout10);
    obj.labMetricLI:setLeft(158);
    obj.labMetricLI:setTop(3);
    obj.labMetricLI:setWidth(50);
    obj.labMetricLI:setHeight(28);
    obj.labMetricLI:setName("labMetricLI");
    obj.labMetricLI:setText("m");
    obj.labMetricLI:setAutoSize(true);
    obj.labMetricLI:setMargins({left=4, right=2});


						self.labCompLuz4.text = lang('scene.fogOfWar.luzIntensa') .. ":";								
					


    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout9);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(28);
    obj.layout11:setMargins({top=2});
    obj.layout11:setName("layout11");

    obj.labCompLuz5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompLuz5:setParent(obj.layout11);
    obj.labCompLuz5:setName("labCompLuz5");
    obj.labCompLuz5:setAlign("left");
    obj.labCompLuz5:setWidth(100);
    obj.labCompLuz5:setHorzTextAlign("trailing");
    obj.labCompLuz5:setMargins({right=4});

    obj.lightWeak = GUI.fromHandle(_obj_newObject("edit"));
    obj.lightWeak:setParent(obj.layout11);
    obj.lightWeak:setLeft(105);
    obj.lightWeak:setTop(0);
    obj.lightWeak:setWidth(50);
    obj.lightWeak:setHeight(28);
    obj.lightWeak:setName("lightWeak");
    obj.lightWeak:setType("float");
    obj.lightWeak:setMin(0);
    obj.lightWeak:setMax(9999);
    obj.lightWeak:setDecimalPlaces(1);
    obj.lightWeak:setField("lightWeak");

    obj.labMetricLF = GUI.fromHandle(_obj_newObject("label"));
    obj.labMetricLF:setParent(obj.layout11);
    obj.labMetricLF:setLeft(158);
    obj.labMetricLF:setTop(3);
    obj.labMetricLF:setWidth(50);
    obj.labMetricLF:setHeight(28);
    obj.labMetricLF:setName("labMetricLF");
    obj.labMetricLF:setText("m");
    obj.labMetricLF:setAutoSize(true);
    obj.labMetricLF:setMargins({left=4, right=2});


						self.labCompLuz5.text = lang('scene.fogOfWar.luzFraca') .. ":";								
					


    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout9);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(28);
    obj.layout12:setMargins({top=2});
    obj.layout12:setName("layout12");

    obj.labCompAngulo2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labCompAngulo2:setParent(obj.layout12);
    obj.labCompAngulo2:setName("labCompAngulo2");
    obj.labCompAngulo2:setAlign("left");
    obj.labCompAngulo2:setWidth(100);
    obj.labCompAngulo2:setHorzTextAlign("trailing");
    obj.labCompAngulo2:setMargins({right=4});

    obj.lightAngle = GUI.fromHandle(_obj_newObject("edit"));
    obj.lightAngle:setParent(obj.layout12);
    obj.lightAngle:setLeft(105);
    obj.lightAngle:setTop(0);
    obj.lightAngle:setWidth(30);
    obj.lightAngle:setHeight(28);
    obj.lightAngle:setName("lightAngle");
    obj.lightAngle:setType("float");
    obj.lightAngle:setMin(1);
    obj.lightAngle:setMax(360);
    obj.lightAngle:setDecimalPlaces(1);
    obj.lightAngle:setField("lightAngle");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout12);
    obj.label5:setLeft(138);
    obj.label5:setTop(3);
    obj.label5:setWidth(50);
    obj.label5:setHeight(28);
    obj.label5:setName("label5");
    obj.label5:setText("graus");
    obj.label5:setAutoSize(true);
    obj.label5:setMargins({left=4, right=2});


						self.labCompAngulo2.text = lang('scene.fogOfWar.angulo') .. ":";
					


    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj);
    obj.layout13:setName("layout13");
    obj.layout13:setAlign("bottom");
    obj.layout13:setMargins({top=2, bottom=2});
    obj.layout13:setHeight(40);

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.layout13);
    obj.flowLayout5:setAlign("client");
    obj.flowLayout5:setHorzAlign("trailing");
    obj.flowLayout5:setName("flowLayout5");

    obj.btnInsert = GUI.fromHandle(_obj_newObject("button"));
    obj.btnInsert:setParent(obj.flowLayout5);
    obj.btnInsert:setWidth(80);
    obj.btnInsert:setHorzTextAlign("center");
    obj.btnInsert:setName("btnInsert");
    obj.btnInsert:setHeight(35);
    obj.btnInsert:setMargins({left=4, right=4});

    obj.btnOkName = GUI.fromHandle(_obj_newObject("button"));
    obj.btnOkName:setParent(obj.flowLayout5);
    obj.btnOkName:setWidth(100);
    obj.btnOkName:setHorzTextAlign("center");
    obj.btnOkName:setName("btnOkName");
    obj.btnOkName:setHeight(35);
    obj.btnOkName:setMargins({left=4, right=4});

    obj.btnCancelName = GUI.fromHandle(_obj_newObject("button"));
    obj.btnCancelName:setParent(obj.flowLayout5);
    obj.btnCancelName:setWidth(80);
    obj.btnCancelName:setHorzTextAlign("center");
    obj.btnCancelName:setName("btnCancelName");
    obj.btnCancelName:setHeight(35);
    obj.btnCancelName:setMargins({left=4, right=4});


			self.btnNew.text = lang('scene.inseridor.buttons.new');			
			self.btnInsert.text = lang('scene.inseridor.buttons.insert');
			self.btnOkName.text = lang('scene.inseridor.buttons.insertClose');
			self.btnCancelName.text = lang('scene.inseridor.buttons.Close');
		



		local node = NDB.load("inseridorOptions.xml");

		if node.tokens == nil then
			node.tokens = {};
			node.widthVal = 1;
			node.heightVal = 1;
		end;

		self.labSelectTokenInfo.text = lang('scene.inseridor.selectOrCreateToken');
		self.tabImagem.text = lang('scene.inseridor.tab.imagem');
		self.tabPrincipal.text = lang('scene.tokenEdit.propriedades');
		self.tabFOW.text = lang('scene.fogOfWar');

		self.labPersonagem.text = lang('scene.tokenEdit.personagem');
		self.cbxSnapToGrid.text = lang('scene.tokenEdit.snapToGrid');

		self.labCampoDeVisao.text = lang('scene.fogOfWar.alcance.tokenVision');
		self.labLuz.text = lang('scene.fogOfWar.alcance.tokenLight');
		self.labHasVision.text = lang('scene.fogOfWar.token.hasSight');

		self.click.text = lang('scene.inseridor.image.click');
		self.image.url = "";
		self.widthText.text = lang('scene.inseridor.labels.width');
		self.widthCell.text = lang('scene.inseridor.labels.cell');
		self.widthVal.text = node.widthVal;
		self.heightText.text = lang('scene.inseridor.labels.height');
		self.heightCell.text = lang('scene.inseridor.labels.cell');
		self.heightVal.text = node.heightVal;
		self.angleText.text = lang('scene.inseridor.labels.angle');
		self.angleVal.text = node.angleVal;
		self.angleDegree.text = lang('scene.inseridor.labels.degree');

		self.cbxSnapToGrid.checked = node.snapToGrid;

		self.edtBarValue1.text = node.bar1X;
		self.edtBarMax1.text = node.bar1Y;
		self.cmbCorBar1.color = node.bar1C or "Indianred";

		self.edtBarValue2.text = node.bar2X;
		self.edtBarMax2.text = node.bar2Y;
		self.cmbCorBar2.color = node.bar2C or "Lightskyblue";

		self.edtBarValue3.text = node.bar3X;
		self.edtBarMax3.text = node.bar3Y;
		self.cmbCorBar3.color = node.bar3C or "Limegreen";

		self.cmbPersonagem.value = tostring(node.character) or "0";

		self.visionIntense.text = node.visionIntense;
		self.visionWeak.text = node.visionWeak;
		self.visionDark.text = node.visionDark;
		self.visionAngle.text = node.visionAngle;
		self.visionHave.checked = node.visionHave;
		self.lightIntense.text = node.lightIntense;
		self.lightWeak.text = node.lightWeak;
		self.lightAngle.text = node.lightAngle;

		self.labelText.text = lang('scene.inseridor.labels.label');
		self.input.text = lang('scene.inseridor.labels.input');
		self.delete.text = lang('scene.inseridor.labels.delete');
		self.layerText.text = lang('scene.inseridor.labels.layer');
		self.layerVal.items = {lang("scene.inseridor.labels.layer1"), lang("scene.inseridor.labels.layer2"), lang("scene.inseridor.labels.layer3")};
		self.layerVal.values = {'B', 'O', 'T'};
		
		self.labFacingMode.text = lang('scene.FacingMode.title');
		self.cmbFacingMode.items = {lang('scene.FacingMode.rotate'), lang('scene.FacingMode.arrow')};		

		function self:prepareForShow(oScene)
			scene = oScene;

			self:listAllCharacters();
			self:checkVisibilityOfTabControl();			
		end;

		function self:listAllCharacters()
			local mesa = Firecast.getMesaDe(scene);

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

		function self:openFile()
			local selNode = self.rclListaDosTokens.selectedNode;
			
			if selNode == nil then
				return;
			end;
		
			Dialogs.openFile("Selecione o arquivo de imagem", "image/*", false,
		        function(arquivos)
		                local arq = arquivos[1];
		                -- arq.name possui o nome do arquivo
		                -- arq.stream possui o objeto stream do conteúdo 

		                FireDrive.createDirectory("/uploads");
		                FireDrive.upload("/uploads/" .. arq.name, arq.stream,
		                	function(fditem)
								if selNode ~= nil then
									selNode.image = fditem.url;
								end;		                		
		                	end);          
		        end);
		end;

		function self:deleteToken()
			local nodeToDelete = self.rclListaDosTokens.selectedNode;
			
			if nodeToDelete ~= nil then
		
				Dialogs.confirmYesNo(lang('scene.inseridor.labels.deleteConfirm'),
					function (confirmado)
						if confirmado then				
							NDB.deleteNode(nodeToDelete);
							self:checkVisibilityOfTabControl();
						end;
					end);
			end;
		end;

		function self:processarOkClose()
			self:processarOK();
			self:processarCancel();
		end;

		
		function self:processarNew()			
			local newNode = self.rclListaDosTokens:append();	
			
			if newNode ~= nil then
				newNode.name = lang("scene.inseridor.nameYourToken");
				newNode.width = 1;
				newNode.height = 1;
				newNode.angle = 0;	
				newNode.snapToGrid = true;				
				newNode.bar1Color = "Indianred";
				newNode.bar2Color = "Lightskyblue";
				newNode.bar3Color = "Limegreen";	
				newNode.visionIntense = 102;
				newNode.visionWeak = 1.5;
				newNode.visionDark = 0;
				newNode.visionAngle = 360;
				newNode.hasSight = false;
				newNode.lightIntense = 0;
				newNode.lightWeak = 0;
				newNode.lightAngle = 360;
				newNode.layer = 'T';  -- tokens
				newNode.facingMode = "rotate";
				self.rclListaDosTokens.selectedNode = newNode;
				self:checkVisibilityOfTabControl();				
				self.tabCtrlDados.tabIndex = 0;
				self.labelVal:setFocus();
			end;		
		end;

		function self:processarOK()	
			local x, y;
			local _lastMouseDown = rawget(scene, "_lastMouseDown");	
			local layer;
			
			if self.layerVal.value == 'O' then
				layer = "objects";
			elseif self.layerVal.value == 'B' then
				layer = "background"
			else
				layer = "tokens";
			end;					
						
			if _lastMouseDown ~= nil then
				x = _lastMouseDown.x;
				y = _lastMouseDown.y;
			else
				x = (scene.worldWidth / 2);
				y = (scene.worldHeight / 2);				
			end;

			local i, j = scene.grid:worldToCell(x, y);
			local tx, ty = scene.grid:cellToWorld(i, j);
			x, y = UTIL_BomLugarCenter(scene, tx, ty, layer);		
		
			local token = scene.items:addToken(layer);
			local size = scene.grid.cellSize;
			local width = (tonumber(self.widthVal.text) or 1) * size;
			local height = (tonumber(self.heightVal.text) or 1) * size;
			local angle = tonumber(self.angleVal.text) or 0;		

			token.snapToGrid = self.cbxSnapToGrid.checked;

			token.barValue1 = self.edtBarValue1.text;
			token.barMax1 = self.edtBarMax1.text;
			token.barColor1 = self.cmbCorBar1.color;
			token.barValue2 = self.edtBarValue2.text;
			token.barMax2 = self.edtBarMax2.text;
			token.barColor2 = self.cmbCorBar2.color;
			token.barValue3 = self.edtBarValue3.text;
			token.barMax3 = self.edtBarMax3.text;
			token.barColor3 = self.cmbCorBar3.color;

			local ownerCharID = tonumber(self.cmbPersonagem.value) or 0;
			if ownerCharID > 0 then
				token.ownerCharacter = ownerCharID;
			else
				token.ownerCharacter = 0;
			end;

			if self.visionIntense.text==nil or self.visionIntense.text=="" then
				self.visionIntense.text = "102";
			end;
			if self.visionWeak.text==nil or self.visionWeak.text=="" then
				self.visionWeak.text = "1,5";
			end;
			if self.visionAngle.text==nil or self.visionAngle.text=="" then
				self.visionAngle.text = "360";
			end;
			if self.lightAngle.text==nil or self.lightAngle.text=="" then
				self.lightAngle.text = "360";
			end;

			token.visionIntenseLightRange = self.visionIntense.text;
			token.visionWeakLightRange = self.visionWeak.text;
			token.visionDarknessRange = self.visionDark.text;
			token.visionAngle= self.visionAngle.text;
			token.visionHaveVision = self.visionHave.checked;
			token.lightIntenseRange = self.lightIntense.text;
			token.lightWeakRange = self.lightWeak.text;
			token.lightAngle = self.lightAngle.text;

			if self.cmbFacingMode.value ~= "" then
				token.facingMode = self.cmbFacingMode.value;
			end;
			
			token.width = width;
			token.height = height;
			token.rotation = angle;			
			token.x = x - width / 2;
			token.y = y - height / 2;
			token:doSnapToGrid();

			token.image.url = self.image.url;
			scene.items:clearSelection();
			token.selected = true;
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

    obj._e_event2 = obj.btnNew:addEventListener("onClick",
        function (_)
            self:processarNew()
        end, obj);

    obj._e_event3 = obj.delete:addEventListener("onClick",
        function (_)
            self:deleteToken()
        end, obj);

    obj._e_event4 = obj.rclListaDosTokens:addEventListener("onSelect",
        function (_)
            self.dsbToken.node = self.rclListaDosTokens.selectedNode;													
            						self:checkVisibilityOfTabControl();
        end, obj);

    obj._e_event5 = obj.rclListaDosTokens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.name, nodeB.name);
        end, obj);

    obj._e_event6 = obj.labelVal:addEventListener("onUserChange",
        function (_)
            self.rclListaDosTokens:sort()
        end, obj);

    obj._e_event7 = obj.input:addEventListener("onClick",
        function (_)
            self:openFile()
        end, obj);

    obj._e_event8 = obj.btnInsert:addEventListener("onClick",
        function (_)
            self:processarOK()
        end, obj);

    obj._e_event9 = obj.btnOkName:addEventListener("onClick",
        function (_)
            self:processarOkClose()
        end, obj);

    obj._e_event10 = obj.btnCancelName:addEventListener("onClick",
        function (_)
            self:processarCancel()
        end, obj);

    function obj:_releaseEvents()
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

        if self.layerVal ~= nil then self.layerVal:destroy(); self.layerVal = nil; end;
        if self.labCompAngulo1 ~= nil then self.labCompAngulo1:destroy(); self.labCompAngulo1 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.visionDark ~= nil then self.visionDark:destroy(); self.visionDark = nil; end;
        if self.flaContent ~= nil then self.flaContent:destroy(); self.flaContent = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edtBarMax3 ~= nil then self.edtBarMax3:destroy(); self.edtBarMax3 = nil; end;
        if self.btnOkName ~= nil then self.btnOkName:destroy(); self.btnOkName = nil; end;
        if self.tabImagem ~= nil then self.tabImagem:destroy(); self.tabImagem = nil; end;
        if self.edtBarMax1 ~= nil then self.edtBarMax1:destroy(); self.edtBarMax1 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.visionIntense ~= nil then self.visionIntense:destroy(); self.visionIntense = nil; end;
        if self.labGroupHeader1 ~= nil then self.labGroupHeader1:destroy(); self.labGroupHeader1 = nil; end;
        if self.btnInsert ~= nil then self.btnInsert:destroy(); self.btnInsert = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.labLuz ~= nil then self.labLuz:destroy(); self.labLuz = nil; end;
        if self.visionWeak ~= nil then self.visionWeak:destroy(); self.visionWeak = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.labSelectTokenInfo ~= nil then self.labSelectTokenInfo:destroy(); self.labSelectTokenInfo = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.layerText ~= nil then self.layerText:destroy(); self.layerText = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.angleVal ~= nil then self.angleVal:destroy(); self.angleVal = nil; end;
        if self.click ~= nil then self.click:destroy(); self.click = nil; end;
        if self.btnNew ~= nil then self.btnNew:destroy(); self.btnNew = nil; end;
        if self.visionHave ~= nil then self.visionHave:destroy(); self.visionHave = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.heightCell ~= nil then self.heightCell:destroy(); self.heightCell = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.cmbCorBar1 ~= nil then self.cmbCorBar1:destroy(); self.cmbCorBar1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.labSnapToGrid ~= nil then self.labSnapToGrid:destroy(); self.labSnapToGrid = nil; end;
        if self.labGroupHeader3 ~= nil then self.labGroupHeader3:destroy(); self.labGroupHeader3 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.cmbFacingMode ~= nil then self.cmbFacingMode:destroy(); self.cmbFacingMode = nil; end;
        if self.edtBarValue3 ~= nil then self.edtBarValue3:destroy(); self.edtBarValue3 = nil; end;
        if self.labMetricVLI ~= nil then self.labMetricVLI:destroy(); self.labMetricVLI = nil; end;
        if self.labCompLuz2 ~= nil then self.labCompLuz2:destroy(); self.labCompLuz2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.labMetricLF ~= nil then self.labMetricLF:destroy(); self.labMetricLF = nil; end;
        if self.labMetricLI ~= nil then self.labMetricLI:destroy(); self.labMetricLI = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edtBarValue2 ~= nil then self.edtBarValue2:destroy(); self.edtBarValue2 = nil; end;
        if self.tabPrincipal ~= nil then self.tabPrincipal:destroy(); self.tabPrincipal = nil; end;
        if self.btnCancelName ~= nil then self.btnCancelName:destroy(); self.btnCancelName = nil; end;
        if self.labelVal ~= nil then self.labelVal:destroy(); self.labelVal = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.labBar3 ~= nil then self.labBar3:destroy(); self.labBar3 = nil; end;
        if self.labCompLuz4 ~= nil then self.labCompLuz4:destroy(); self.labCompLuz4 = nil; end;
        if self.angleText ~= nil then self.angleText:destroy(); self.angleText = nil; end;
        if self.labCampoDeVisao ~= nil then self.labCampoDeVisao:destroy(); self.labCampoDeVisao = nil; end;
        if self.labPersonagem ~= nil then self.labPersonagem:destroy(); self.labPersonagem = nil; end;
        if self.labCompLuz3 ~= nil then self.labCompLuz3:destroy(); self.labCompLuz3 = nil; end;
        if self.dsbToken ~= nil then self.dsbToken:destroy(); self.dsbToken = nil; end;
        if self.labCompLuz5 ~= nil then self.labCompLuz5:destroy(); self.labCompLuz5 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.labHasVision ~= nil then self.labHasVision:destroy(); self.labHasVision = nil; end;
        if self.tabFOW ~= nil then self.tabFOW:destroy(); self.tabFOW = nil; end;
        if self.labBar2 ~= nil then self.labBar2:destroy(); self.labBar2 = nil; end;
        if self.flaContentFOW ~= nil then self.flaContentFOW:destroy(); self.flaContentFOW = nil; end;
        if self.tabCtrlDados ~= nil then self.tabCtrlDados:destroy(); self.tabCtrlDados = nil; end;
        if self.labFacingMode ~= nil then self.labFacingMode:destroy(); self.labFacingMode = nil; end;
        if self.labTitle ~= nil then self.labTitle:destroy(); self.labTitle = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.cmbCorBar3 ~= nil then self.cmbCorBar3:destroy(); self.cmbCorBar3 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.heightVal ~= nil then self.heightVal:destroy(); self.heightVal = nil; end;
        if self.lightIntense ~= nil then self.lightIntense:destroy(); self.lightIntense = nil; end;
        if self.delete ~= nil then self.delete:destroy(); self.delete = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.labMetricVLE ~= nil then self.labMetricVLE:destroy(); self.labMetricVLE = nil; end;
        if self.angleDegree ~= nil then self.angleDegree:destroy(); self.angleDegree = nil; end;
        if self.heightText ~= nil then self.heightText:destroy(); self.heightText = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.image ~= nil then self.image:destroy(); self.image = nil; end;
        if self.widthText ~= nil then self.widthText:destroy(); self.widthText = nil; end;
        if self.labCompAngulo2 ~= nil then self.labCompAngulo2:destroy(); self.labCompAngulo2 = nil; end;
        if self.labBar1 ~= nil then self.labBar1:destroy(); self.labBar1 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.lightAngle ~= nil then self.lightAngle:destroy(); self.lightAngle = nil; end;
        if self.edtBarMax2 ~= nil then self.edtBarMax2:destroy(); self.edtBarMax2 = nil; end;
        if self.labelText ~= nil then self.labelText:destroy(); self.labelText = nil; end;
        if self.labGroupHeader2 ~= nil then self.labGroupHeader2:destroy(); self.labGroupHeader2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.labMetricVLF ~= nil then self.labMetricVLF:destroy(); self.labMetricVLF = nil; end;
        if self.cmbPersonagem ~= nil then self.cmbPersonagem:destroy(); self.cmbPersonagem = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.edtBarValue1 ~= nil then self.edtBarValue1:destroy(); self.edtBarValue1 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.widthVal ~= nil then self.widthVal:destroy(); self.widthVal = nil; end;
        if self.flpBar1 ~= nil then self.flpBar1:destroy(); self.flpBar1 = nil; end;
        if self.lightWeak ~= nil then self.lightWeak:destroy(); self.lightWeak = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.flpBar3 ~= nil then self.flpBar3:destroy(); self.flpBar3 = nil; end;
        if self.cmbCorBar2 ~= nil then self.cmbCorBar2:destroy(); self.cmbCorBar2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.labCompLuz1 ~= nil then self.labCompLuz1:destroy(); self.labCompLuz1 = nil; end;
        if self.layInfoSelectOrCreateToken ~= nil then self.layInfoSelectOrCreateToken:destroy(); self.layInfoSelectOrCreateToken = nil; end;
        if self.widthCell ~= nil then self.widthCell:destroy(); self.widthCell = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flpBar2 ~= nil then self.flpBar2:destroy(); self.flpBar2 = nil; end;
        if self.cbxSnapToGrid ~= nil then self.cbxSnapToGrid:destroy(); self.cbxSnapToGrid = nil; end;
        if self.input ~= nil then self.input:destroy(); self.input = nil; end;
        if self.visionAngle ~= nil then self.visionAngle:destroy(); self.visionAngle = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rclListaDosTokens ~= nil then self.rclListaDosTokens:destroy(); self.rclListaDosTokens = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmInseriorFireDrive()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmInseriorFireDrive();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmInseriorFireDrive = {
    newEditor = newfrmInseriorFireDrive, 
    new = newfrmInseriorFireDrive, 
    name = "frmInseriorFireDrive", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmInseriorFireDrive = _frmInseriorFireDrive;
Firecast.registrarForm(_frmInseriorFireDrive);

return _frmInseriorFireDrive;
