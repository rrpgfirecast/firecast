require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmBoardProps()
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
    obj:setName("frmBoardProps");
    obj:setWidth(300);
    obj:setHeight(300);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);


		require("system.lua");
		require("rrpgScene_Undo.dlua");
		local scene = nil;	
		local ignoreRecalcWH = false;
		local realCellWidth = 1;
		local realCellHeight = 1;
		local offsetCellsW = 1;
		local offsetCellsH = 1;
		local exibindoFOW = false;
		
		local _maxH = 450;
		local _minH = 300;
		local _useHeight;
		local _, _screenSafeH = System.getScreenSize();
		_screenSafeH = _screenSafeH - 40;
				
		_useHeight = _screenSafeH;
		
		if _useHeight < _minH then
			_useHeight = _minH;
		elseif _useHeight > _maxH then
			_useHeight = _maxH;
		end;
		
		self.height = _useHeight;
		


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


			self.labGroupHeader1.text = lang("scene.menu.sceneOptions");
		


    obj.partTipoCelula = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.partTipoCelula:setParent(obj.flaContent);
    obj.partTipoCelula:setName("partTipoCelula");
    obj.partTipoCelula:setHeight(30);
    obj.partTipoCelula:setMinWidth(50);
    obj.partTipoCelula:setMaxWidth(5000);
    obj.partTipoCelula:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labTipoDeCelula = GUI.fromHandle(_obj_newObject("label"));
    obj.labTipoDeCelula:setParent(obj.partTipoCelula);
    obj.labTipoDeCelula:setName("labTipoDeCelula");
    obj.labTipoDeCelula:setAlign("left");
    obj.labTipoDeCelula:setWidth(110);
    obj.labTipoDeCelula:setAutoSize(false);
    obj.labTipoDeCelula:setHorzTextAlign("trailing");
    obj.labTipoDeCelula:setVertTextAlign("center");
    obj.labTipoDeCelula:setMargins({right=5});

    obj.flaTipoDeCelula = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaTipoDeCelula:setParent(obj.partTipoCelula);
    obj.flaTipoDeCelula:setName("flaTipoDeCelula");
    obj.flaTipoDeCelula:setAlign("client");
    obj.flaTipoDeCelula:setMargins({right=5});

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flaTipoDeCelula);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMinWidth(50);
    obj.flowPart2:setMaxWidth(50);
    obj.flowPart2:setHeight(30);
    obj.flowPart2:setMargins({left=3, right=3, top=3, bottom=3});
    obj.flowPart2:setHitTest(true);

    obj.rbtCellTypeQuad = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.rbtCellTypeQuad:setParent(obj.flowPart2);
    obj.rbtCellTypeQuad:setName("rbtCellTypeQuad");
    obj.rbtCellTypeQuad:setAlign("left");
    obj.rbtCellTypeQuad:setWidth(20);
    obj.rbtCellTypeQuad:setGroupName("sceneCellType");

    obj.path1 = GUI.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.flowPart2);
    obj.path1:setPathData("M 0 0 L 1 0 L 1 1 L 0 1 z");
    obj.path1:setName("path1");
    obj.path1:setAlign("client");
    obj.path1:setMode("fit");
    obj.path1:setColor("#00000000");
    obj.path1:setStrokeColor("white");
    obj.path1:setStrokeSize(1.0);
    obj.path1:setHitTest(false);
    obj.path1:setRoundToPixel(true);

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flaTipoDeCelula);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(50);
    obj.flowPart3:setHeight(30);
    obj.flowPart3:setMargins({left=3, right=3, top=3, bottom=3});
    obj.flowPart3:setHitTest(true);

    obj.rbtCellTypeVertHex = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.rbtCellTypeVertHex:setParent(obj.flowPart3);
    obj.rbtCellTypeVertHex:setName("rbtCellTypeVertHex");
    obj.rbtCellTypeVertHex:setAlign("left");
    obj.rbtCellTypeVertHex:setWidth(20);
    obj.rbtCellTypeVertHex:setGroupName("sceneCellType");

    obj.path2 = GUI.fromHandle(_obj_newObject("path"));
    obj.path2:setParent(obj.flowPart3);
    obj.path2:setPathData("M 84 0 L 168 50 L 168 140 L 84 190 L 0 140 L 0 50 z");
    obj.path2:setName("path2");
    obj.path2:setAlign("client");
    obj.path2:setMode("fit");
    obj.path2:setColor("#00000000");
    obj.path2:setStrokeColor("white");
    obj.path2:setStrokeSize(1.0);
    obj.path2:setHitTest(false);
    obj.path2:setRoundToPixel(true);

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flaTipoDeCelula);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMinWidth(50);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(30);
    obj.flowPart4:setMargins({left=3, right=3, top=3, bottom=3});
    obj.flowPart4:setHitTest(true);

    obj.rbtCellTypeHorzHex = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.rbtCellTypeHorzHex:setParent(obj.flowPart4);
    obj.rbtCellTypeHorzHex:setName("rbtCellTypeHorzHex");
    obj.rbtCellTypeHorzHex:setAlign("left");
    obj.rbtCellTypeHorzHex:setWidth(20);
    obj.rbtCellTypeHorzHex:setGroupName("sceneCellType");

    obj.path3 = GUI.fromHandle(_obj_newObject("path"));
    obj.path3:setParent(obj.flowPart4);
    obj.path3:setPathData("M 0 84 L 50 0 L 140 0 L 190 84 L 140 168 L 50 168 Z");
    obj.path3:setName("path3");
    obj.path3:setAlign("client");
    obj.path3:setMode("fit");
    obj.path3:setColor("#00000000");
    obj.path3:setStrokeColor("white");
    obj.path3:setStrokeSize(1.0);
    obj.path3:setHitTest(false);
    obj.path3:setRoundToPixel(true);

    obj.partSquareDiagonals = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.partSquareDiagonals:setParent(obj.flaContent);
    obj.partSquareDiagonals:setName("partSquareDiagonals");
    obj.partSquareDiagonals:setHeight(30);
    obj.partSquareDiagonals:setMinWidth(50);
    obj.partSquareDiagonals:setMaxWidth(5000);
    obj.partSquareDiagonals:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labDiagonais = GUI.fromHandle(_obj_newObject("label"));
    obj.labDiagonais:setParent(obj.partSquareDiagonals);
    obj.labDiagonais:setName("labDiagonais");
    obj.labDiagonais:setAlign("left");
    obj.labDiagonais:setWidth(110);
    obj.labDiagonais:setAutoSize(false);
    obj.labDiagonais:setHorzTextAlign("trailing");
    obj.labDiagonais:setVertTextAlign("center");
    obj.labDiagonais:setMargins({right=5});

    obj.cmbDiagonais = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbDiagonais:setParent(obj.partSquareDiagonals);
    obj.cmbDiagonais:setName("cmbDiagonais");
    obj.cmbDiagonais:setAlign("client");
    obj.cmbDiagonais:setMargins({right=5});

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flaContent);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setHeight(30);
    obj.flowPart5:setMinWidth(50);
    obj.flowPart5:setMaxWidth(5000);
    obj.flowPart5:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labCellSize = GUI.fromHandle(_obj_newObject("label"));
    obj.labCellSize:setParent(obj.flowPart5);
    obj.labCellSize:setName("labCellSize");
    obj.labCellSize:setAlign("left");
    obj.labCellSize:setWidth(110);
    obj.labCellSize:setAutoSize(false);
    obj.labCellSize:setHorzTextAlign("trailing");
    obj.labCellSize:setVertTextAlign("center");
    obj.labCellSize:setMargins({right=5});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart5);
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({right=5});

    obj.edtCellSize = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtCellSize:setParent(obj.layout1);
    obj.edtCellSize:setName("edtCellSize");
    obj.edtCellSize:setType("float");
    obj.edtCellSize:setAlign("client");
    obj.edtCellSize:setDecimalPlaces(1);
    obj.edtCellSize:setMin(0.1);

    obj.cmbMetric = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbMetric:setParent(obj.layout1);
    obj.cmbMetric:setName("cmbMetric");
    obj.cmbMetric:setAlign("right");
    obj.cmbMetric:setWidth(90);
    obj.cmbMetric:setMargins({left=5});

    obj.partDimensoes = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.partDimensoes:setParent(obj.flaContent);
    obj.partDimensoes:setName("partDimensoes");
    obj.partDimensoes:setMargins({left=2, right=2, top=3, bottom=3});
    obj.partDimensoes:setHeight(30);
    obj.partDimensoes:setMinWidth(50);
    obj.partDimensoes:setMaxWidth(5000);

    obj.labDimensoes = GUI.fromHandle(_obj_newObject("label"));
    obj.labDimensoes:setParent(obj.partDimensoes);
    obj.labDimensoes:setName("labDimensoes");
    obj.labDimensoes:setWordWrap(true);
    obj.labDimensoes:setAlign("left");
    obj.labDimensoes:setWidth(110);
    obj.labDimensoes:setAutoSize(false);
    obj.labDimensoes:setHorzTextAlign("trailing");
    obj.labDimensoes:setVertTextAlign("center");
    obj.labDimensoes:setMargins({right=5});

    obj.layContentDimensions = GUI.fromHandle(_obj_newObject("layout"));
    obj.layContentDimensions:setParent(obj.partDimensoes);
    obj.layContentDimensions:setName("layContentDimensions");
    obj.layContentDimensions:setAlign("client");
    obj.layContentDimensions:setMargins({right=5});

    obj.flaContentDimensions = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContentDimensions:setParent(obj.layContentDimensions);
    obj.flaContentDimensions:setName("flaContentDimensions");
    obj.flaContentDimensions:setAlign("top");
    obj.flaContentDimensions:setAutoHeight(true);

    obj.edtLargura = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtLargura:setParent(obj.flaContentDimensions);
    obj.edtLargura:setName("edtLargura");
    obj.edtLargura:setWidth(50);
    obj.edtLargura:setType("float");
    obj.edtLargura:setDecimalPlaces(1);
    obj.edtLargura:setMin(0.1);

    obj.labLarguraXAltura = GUI.fromHandle(_obj_newObject("label"));
    obj.labLarguraXAltura:setParent(obj.flaContentDimensions);
    obj.labLarguraXAltura:setName("labLarguraXAltura");
    obj.labLarguraXAltura:setAutoSize(true);
    obj.labLarguraXAltura:setWordWrap(false);
    obj.labLarguraXAltura:setMargins({left=5, right=5});
    obj.labLarguraXAltura:setText("x");
    obj.labLarguraXAltura:setHorzTextAlign("center");

    obj.edtAltura = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtAltura:setParent(obj.flaContentDimensions);
    obj.edtAltura:setName("edtAltura");
    obj.edtAltura:setWidth(50);
    obj.edtAltura:setType("float");
    obj.edtAltura:setDecimalPlaces(1);
    obj.edtAltura:setMin(0.1);

    obj.labLarguraAlturaMetric = GUI.fromHandle(_obj_newObject("label"));
    obj.labLarguraAlturaMetric:setParent(obj.flaContentDimensions);
    obj.labLarguraAlturaMetric:setName("labLarguraAlturaMetric");
    obj.labLarguraAlturaMetric:setAutoSize(true);
    obj.labLarguraAlturaMetric:setMargins({left=5});
    obj.labLarguraAlturaMetric:setWordWrap(false);
    obj.labLarguraAlturaMetric:setFontSize(11);

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flaContentDimensions);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.labLarguraAlturaOr = GUI.fromHandle(_obj_newObject("label"));
    obj.labLarguraAlturaOr:setParent(obj.flaContentDimensions);
    obj.labLarguraAlturaOr:setName("labLarguraAlturaOr");
    obj.labLarguraAlturaOr:setAutoSize(true);
    obj.labLarguraAlturaOr:setHorzTextAlign("leading");
    obj.labLarguraAlturaOr:setWordWrap(false);
    obj.labLarguraAlturaOr:setMargins({left=55});

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flaContentDimensions);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.edtLarguraCells = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtLarguraCells:setParent(obj.flaContentDimensions);
    obj.edtLarguraCells:setName("edtLarguraCells");
    obj.edtLarguraCells:setWidth(50);
    obj.edtLarguraCells:setType("float");
    obj.edtLarguraCells:setDecimalPlaces(1);
    obj.edtLarguraCells:setMin(1);

    obj.labLarguraXAlturaCells = GUI.fromHandle(_obj_newObject("label"));
    obj.labLarguraXAlturaCells:setParent(obj.flaContentDimensions);
    obj.labLarguraXAlturaCells:setName("labLarguraXAlturaCells");
    obj.labLarguraXAlturaCells:setAutoSize(true);
    obj.labLarguraXAlturaCells:setWordWrap(false);
    obj.labLarguraXAlturaCells:setMargins({left=5, right=5});
    obj.labLarguraXAlturaCells:setText("x");
    obj.labLarguraXAlturaCells:setHorzTextAlign("center");

    obj.edtAlturaCells = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtAlturaCells:setParent(obj.flaContentDimensions);
    obj.edtAlturaCells:setName("edtAlturaCells");
    obj.edtAlturaCells:setWidth(50);
    obj.edtAlturaCells:setType("float");
    obj.edtAlturaCells:setDecimalPlaces(1);
    obj.edtAlturaCells:setMin(1);

    obj.labLarguraAlturaMetricCells = GUI.fromHandle(_obj_newObject("label"));
    obj.labLarguraAlturaMetricCells:setParent(obj.flaContentDimensions);
    obj.labLarguraAlturaMetricCells:setName("labLarguraAlturaMetricCells");
    obj.labLarguraAlturaMetricCells:setAutoSize(true);
    obj.labLarguraAlturaMetricCells:setMargins({left=5});
    obj.labLarguraAlturaMetricCells:setWordWrap(false);
    obj.labLarguraAlturaMetricCells:setFontSize(10);

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flaContent);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setHeight(30);
    obj.flowPart6:setMinWidth(50);
    obj.flowPart6:setMaxWidth(5000);
    obj.flowPart6:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labCorDeFundo = GUI.fromHandle(_obj_newObject("label"));
    obj.labCorDeFundo:setParent(obj.flowPart6);
    obj.labCorDeFundo:setName("labCorDeFundo");
    obj.labCorDeFundo:setAlign("left");
    obj.labCorDeFundo:setWidth(110);
    obj.labCorDeFundo:setAutoSize(false);
    obj.labCorDeFundo:setHorzTextAlign("trailing");
    obj.labCorDeFundo:setVertTextAlign("center");
    obj.labCorDeFundo:setMargins({right=5});

    obj.cmbCorFundo = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorFundo:setParent(obj.flowPart6);
    obj.cmbCorFundo:setName("cmbCorFundo");
    obj.cmbCorFundo:setUseAlpha(false);
    obj.cmbCorFundo:setAlign("client");
    obj.cmbCorFundo:setMargins({right=5});

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flaContent);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setHeight(30);
    obj.flowPart7:setMinWidth(50);
    obj.flowPart7:setMaxWidth(5000);
    obj.flowPart7:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader2:setParent(obj.flowPart7);
    obj.labGroupHeader2:setName("labGroupHeader2");
    obj.labGroupHeader2:setAlign("left");
    obj.labGroupHeader2:setAutoSize(true);
    obj.labGroupHeader2:setWordWrap(false);
    obj.labGroupHeader2:setHorzTextAlign("leading");
    obj.labGroupHeader2:setVertTextAlign("center");
    obj.labGroupHeader2:setMargins({left=10, right=5});
    obj.labGroupHeader2:setFontSize(15);
    obj.labGroupHeader2:setFontColor("#FFCC66");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart7);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setStrokeColor("#FFCC6670");
    obj.horzLine2:setMargins({left=10});
    obj.horzLine2:setName("horzLine2");


			self.labGroupHeader2.text = lang("scene.grid");
		


    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flaContent);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setHeight(30);
    obj.flowPart8:setMinWidth(50);
    obj.flowPart8:setMaxWidth(5000);
    obj.flowPart8:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labDrawGridLines = GUI.fromHandle(_obj_newObject("label"));
    obj.labDrawGridLines:setParent(obj.flowPart8);
    obj.labDrawGridLines:setName("labDrawGridLines");
    obj.labDrawGridLines:setAlign("left");
    obj.labDrawGridLines:setWidth(110);
    obj.labDrawGridLines:setAutoSize(false);
    obj.labDrawGridLines:setHorzTextAlign("trailing");
    obj.labDrawGridLines:setVertTextAlign("center");
    obj.labDrawGridLines:setMargins({right=5});

    obj.cbxDrawGrid = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxDrawGrid:setParent(obj.flowPart8);
    obj.cbxDrawGrid:setName("cbxDrawGrid");
    obj.cbxDrawGrid:setAlign("client");
    obj.cbxDrawGrid:setMargins({right=5});

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flaContent);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setHeight(30);
    obj.flowPart9:setMinWidth(50);
    obj.flowPart9:setMaxWidth(5000);
    obj.flowPart9:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labCorGrid = GUI.fromHandle(_obj_newObject("label"));
    obj.labCorGrid:setParent(obj.flowPart9);
    obj.labCorGrid:setName("labCorGrid");
    obj.labCorGrid:setAlign("left");
    obj.labCorGrid:setWidth(110);
    obj.labCorGrid:setAutoSize(false);
    obj.labCorGrid:setHorzTextAlign("trailing");
    obj.labCorGrid:setVertTextAlign("center");
    obj.labCorGrid:setMargins({right=5});

    obj.cmbCorGrid = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbCorGrid:setParent(obj.flowPart9);
    obj.cmbCorGrid:setName("cmbCorGrid");
    obj.cmbCorGrid:setAlign("client");
    obj.cmbCorGrid:setMargins({right=5});

    obj.partGridOffset = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.partGridOffset:setParent(obj.flaContent);
    obj.partGridOffset:setName("partGridOffset");
    obj.partGridOffset:setHeight(30);
    obj.partGridOffset:setMinWidth(50);
    obj.partGridOffset:setMaxWidth(5000);
    obj.partGridOffset:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labDeslocamentoGrid = GUI.fromHandle(_obj_newObject("label"));
    obj.labDeslocamentoGrid:setParent(obj.partGridOffset);
    obj.labDeslocamentoGrid:setName("labDeslocamentoGrid");
    obj.labDeslocamentoGrid:setAlign("left");
    obj.labDeslocamentoGrid:setWidth(110);
    obj.labDeslocamentoGrid:setAutoSize(false);
    obj.labDeslocamentoGrid:setHorzTextAlign("trailing");
    obj.labDeslocamentoGrid:setVertTextAlign("center");
    obj.labDeslocamentoGrid:setMargins({right=5});

    obj.flaContentOffset = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContentOffset:setParent(obj.partGridOffset);
    obj.flaContentOffset:setName("flaContentOffset");
    obj.flaContentOffset:setAlign("client");
    obj.flaContentOffset:setMargins({right=5});

    obj.edtOffsetX = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtOffsetX:setParent(obj.flaContentOffset);
    obj.edtOffsetX:setName("edtOffsetX");
    obj.edtOffsetX:setWidth(50);
    obj.edtOffsetX:setType("float");
    obj.edtOffsetX:setDecimalPlaces(2);

    obj.labOffsetXOffsetY = GUI.fromHandle(_obj_newObject("label"));
    obj.labOffsetXOffsetY:setParent(obj.flaContentOffset);
    obj.labOffsetXOffsetY:setName("labOffsetXOffsetY");
    obj.labOffsetXOffsetY:setAutoSize(true);
    obj.labOffsetXOffsetY:setWordWrap(false);
    obj.labOffsetXOffsetY:setMargins({left=5, right=5});
    obj.labOffsetXOffsetY:setText("x");
    obj.labOffsetXOffsetY:setHorzTextAlign("center");

    obj.edtOffsetY = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtOffsetY:setParent(obj.flaContentOffset);
    obj.edtOffsetY:setName("edtOffsetY");
    obj.edtOffsetY:setWidth(50);
    obj.edtOffsetY:setType("float");
    obj.edtOffsetY:setDecimalPlaces(2);

    obj.labOffsetMetric = GUI.fromHandle(_obj_newObject("label"));
    obj.labOffsetMetric:setParent(obj.flaContentOffset);
    obj.labOffsetMetric:setName("labOffsetMetric");
    obj.labOffsetMetric:setAutoSize(true);
    obj.labOffsetMetric:setMargins({left=5});
    obj.labOffsetMetric:setWordWrap(false);
    obj.labOffsetMetric:setFontSize(11);

    obj.tabBkgImg = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabBkgImg:setParent(obj.tabControl1);
    obj.tabBkgImg:setName("tabBkgImg");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tabBkgImg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flaContentBkg = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flaContentBkg:setParent(obj.scrollBox2);
    obj.flaContentBkg:setAlign("top");
    obj.flaContentBkg:setAutoHeight(true);
    obj.flaContentBkg:setMaxControlsPerLine(1);
    obj.flaContentBkg:setName("flaContentBkg");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flaContentBkg);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setHeight(30);
    obj.flowPart10:setMinWidth(50);
    obj.flowPart10:setMaxWidth(5000);
    obj.flowPart10:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader3:setParent(obj.flowPart10);
    obj.labGroupHeader3:setName("labGroupHeader3");
    obj.labGroupHeader3:setAlign("left");
    obj.labGroupHeader3:setAutoSize(true);
    obj.labGroupHeader3:setWordWrap(false);
    obj.labGroupHeader3:setHorzTextAlign("leading");
    obj.labGroupHeader3:setVertTextAlign("center");
    obj.labGroupHeader3:setMargins({left=10, right=5});
    obj.labGroupHeader3:setFontSize(15);
    obj.labGroupHeader3:setFontColor("#FFCC66");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart10);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setStrokeColor("#FFCC6670");
    obj.horzLine3:setMargins({left=10});
    obj.horzLine3:setName("horzLine3");


			self.labGroupHeader3.text = lang("scene.bkgImageTabTitle");
		


    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flaContentBkg);
    obj.flowPart11:setHeight(200);
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMinWidth(50);
    obj.flowPart11:setMaxWidth(5000);
    obj.flowPart11:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labBkgImg = GUI.fromHandle(_obj_newObject("label"));
    obj.labBkgImg:setParent(obj.flowPart11);
    obj.labBkgImg:setName("labBkgImg");
    obj.labBkgImg:setVisible(false);
    obj.labBkgImg:setAlign("left");
    obj.labBkgImg:setWidth(110);
    obj.labBkgImg:setAutoSize(false);
    obj.labBkgImg:setHorzTextAlign("trailing");
    obj.labBkgImg:setVertTextAlign("center");
    obj.labBkgImg:setMargins({right=5});

    obj.rctBkgImg = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rctBkgImg:setParent(obj.flowPart11);
    obj.rctBkgImg:setName("rctBkgImg");
    obj.rctBkgImg:setStrokeColor("white");
    obj.rctBkgImg:setColor("None");
    obj.rctBkgImg:setStrokeSize(1);
    obj.rctBkgImg:setAlign("client");
    obj.rctBkgImg:setMargins({right=5});

    obj.imgBkgImg = GUI.fromHandle(_obj_newObject("image"));
    obj.imgBkgImg:setParent(obj.rctBkgImg);
    obj.imgBkgImg:setName("imgBkgImg");
    obj.imgBkgImg:setAlign("client");
    obj.imgBkgImg:setStyle("proportional");
    obj.imgBkgImg:setCenter(true);
    obj.imgBkgImg:setEditable(true);
    obj.imgBkgImg:setMargins({top=2, left=2, right=2});

    obj.labOrientBkgImg = GUI.fromHandle(_obj_newObject("label"));
    obj.labOrientBkgImg:setParent(obj.rctBkgImg);
    obj.labOrientBkgImg:setName("labOrientBkgImg");
    obj.labOrientBkgImg:setAlign("bottom");
    obj.labOrientBkgImg:setWordWrap(false);
    obj.labOrientBkgImg:setFontSize(10);
    obj.labOrientBkgImg:setHorzTextAlign("center");

						   
						     local __m = self.rctBkgImg.margins;
							 __m.left = __m.right;
							 self.rctBkgImg.margins = __m;
						 


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

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flaContentFOW);
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setHeight(30);
    obj.flowPart12:setMinWidth(50);
    obj.flowPart12:setMaxWidth(5000);
    obj.flowPart12:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labGroupHeader4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGroupHeader4:setParent(obj.flowPart12);
    obj.labGroupHeader4:setName("labGroupHeader4");
    obj.labGroupHeader4:setAlign("left");
    obj.labGroupHeader4:setAutoSize(true);
    obj.labGroupHeader4:setWordWrap(false);
    obj.labGroupHeader4:setHorzTextAlign("leading");
    obj.labGroupHeader4:setVertTextAlign("center");
    obj.labGroupHeader4:setMargins({left=10, right=5});
    obj.labGroupHeader4:setFontSize(15);
    obj.labGroupHeader4:setFontColor("#FFCC66");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.flowPart12);
    obj.horzLine4:setAlign("bottom");
    obj.horzLine4:setStrokeColor("#FFCC6670");
    obj.horzLine4:setMargins({left=10});
    obj.horzLine4:setName("horzLine4");


			self.labGroupHeader4.text = lang("scene.gm.editFow");
		


    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flaContentFOW);
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setHeight(30);
    obj.flowPart13:setMinWidth(50);
    obj.flowPart13:setMaxWidth(5000);
    obj.flowPart13:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labEnableFoW = GUI.fromHandle(_obj_newObject("label"));
    obj.labEnableFoW:setParent(obj.flowPart13);
    obj.labEnableFoW:setName("labEnableFoW");
    obj.labEnableFoW:setAlign("left");
    obj.labEnableFoW:setWidth(110);
    obj.labEnableFoW:setAutoSize(false);
    obj.labEnableFoW:setHorzTextAlign("trailing");
    obj.labEnableFoW:setVertTextAlign("center");
    obj.labEnableFoW:setMargins({right=5});

    obj.cbxEnableFoW = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxEnableFoW:setParent(obj.flowPart13);
    obj.cbxEnableFoW:setName("cbxEnableFoW");
    obj.cbxEnableFoW:setAlign("client");
    obj.cbxEnableFoW:setMargins({right=5});

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flaContentFOW);
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setHeight(30);
    obj.flowPart14:setMinWidth(50);
    obj.flowPart14:setMaxWidth(5000);
    obj.flowPart14:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labAmbientLight = GUI.fromHandle(_obj_newObject("label"));
    obj.labAmbientLight:setParent(obj.flowPart14);
    obj.labAmbientLight:setName("labAmbientLight");
    obj.labAmbientLight:setAlign("left");
    obj.labAmbientLight:setWidth(110);
    obj.labAmbientLight:setAutoSize(false);
    obj.labAmbientLight:setHorzTextAlign("trailing");
    obj.labAmbientLight:setVertTextAlign("center");
    obj.labAmbientLight:setMargins({right=5});

    obj.cmbAmbientLight = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbAmbientLight:setParent(obj.flowPart14);
    obj.cmbAmbientLight:setName("cmbAmbientLight");
    obj.cmbAmbientLight:setAlign("client");
    obj.cmbAmbientLight:setMargins({right=5});

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flaContentFOW);
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setHeight(30);
    obj.flowPart15:setMinWidth(50);
    obj.flowPart15:setMaxWidth(5000);
    obj.flowPart15:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labFogSharing = GUI.fromHandle(_obj_newObject("label"));
    obj.labFogSharing:setParent(obj.flowPart15);
    obj.labFogSharing:setName("labFogSharing");
    obj.labFogSharing:setAlign("left");
    obj.labFogSharing:setWidth(110);
    obj.labFogSharing:setAutoSize(false);
    obj.labFogSharing:setHorzTextAlign("trailing");
    obj.labFogSharing:setVertTextAlign("center");
    obj.labFogSharing:setMargins({right=5});

    obj.cmbFogSharing = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbFogSharing:setParent(obj.flowPart15);
    obj.cmbFogSharing:setName("cmbFogSharing");
    obj.cmbFogSharing:setAlign("client");
    obj.cmbFogSharing:setMargins({right=5});

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setName("layout2");
    obj.layout2:setAlign("bottom");
    obj.layout2:setMargins({top=2, bottom=2});
    obj.layout2:setHeight(40);

    obj.btnOk1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnOk1:setParent(obj.layout2);
    obj.btnOk1:setWidth(100);
    obj.btnOk1:setHorzTextAlign("center");
    obj.btnOk1:setAlign("right");
    obj.btnOk1:setName("btnOk1");
    obj.btnOk1:setMargins({left=4, right=4});

    obj.btnCancel1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnCancel1:setParent(obj.layout2);
    obj.btnCancel1:setHorzTextAlign("center");
    obj.btnCancel1:setAlign("right");
    obj.btnCancel1:setName("btnCancel1");
    obj.btnCancel1:setWidth(100);
    obj.btnCancel1:setMargins({left=4, right=4});


			self.btnOk1.text = lang("Ok");
			self.btnCancel1.text = lang("cancelar");
		


	
		self.title = lang('scene.menu.sceneOptions');
		self.labCorDeFundo.text = lang('scene.title.bkgColor');
		self.labCellSize.text = lang('scene.cellSize');
		self.labDimensoes.text = lang('scene.dimensionsTitle');		
		self.labLarguraAlturaOr.text = lang("scene.or");
		self.labLarguraAlturaMetricCells.text = lang("scene.cells");
		self.labTipoDeCelula.text = lang("scene.cellType");
		self.labCorGrid.text = lang('scene.gridColor');
		self.cbxDrawGrid.text = lang('scene.drawGrid');
		self.labDeslocamentoGrid.text = lang('scene.gridOffset');
		self.labDiagonais.text = lang('scene.squareDiagonals');
		self.tabPrincipal.text = lang('scene.menu.sceneOptions.tabPrincipal');
		self.tabFOW.text = lang('scene.fogOfWar');		
		self.tabBkgImg.text = lang('scene.bkgImageTabTitle');
		self.labBkgImg.text = lang('scene.bkgImageTabTitle.useThis');		
		self.labOrientBkgImg.text = lang('scene.bkgImageTabTitle.guide');
		
		self.labEnableFoW.text = lang('scene.fogOfWar.options.enabled');
		self.labAmbientLight.text = lang('scene.fogOfWar.options.ambientLight');
		self.labFogSharing.text = lang('scene.fogOfWar.options.sharing');		
		
		local metricValues = {'cm', 'in', 'm', 'ft', 'km', 'mi', 'anoluz'};
		local metricNames = {};
		
		self.cmbAmbientLight.items = {lang("scene.fogOfWar.options.ambientLight.intense"), 
									  lang("scene.fogOfWar.options.ambientLight.weak"),
									  lang("scene.fogOfWar.options.ambientLight.none")};
		self.cmbAmbientLight.values = {"intense", "weak", "none"};
		
		self.cmbFogSharing.items = {lang('scene.fogOfWar.options.sharing.individual'),
									lang('scene.fogOfWar.options.sharing.group')};
		self.cmbFogSharing.values = {"individual", "group"};									
		
		if System.isMobile() then
			self.placement = "top";
		end;
		
		for i = 1, #metricValues, 1 do
			metricNames[i] = lang("metric." .. metricValues[i]);
		end;
		
		self.cmbMetric.values = metricValues;
		self.cmbMetric.items = metricNames;
		
		self.cmbDiagonais.values = {"simplified", "alternated", "manhattan", "euclidean"};
		self.cmbDiagonais.items = {lang("scene.diagonals.simplified"), 
								   lang("scene.diagonals.alternated"), 
								   lang("scene.diagonals.manhattan"), 
								   lang("scene.diagonals.euclidean")};
		
		self.edtLargura.onChange = function()
			if not ignoreRecalcWH then
				ignoreRecalcWH = true;								
				self.edtLarguraCells.asNumber = self:metricToCells(self.edtLargura.asNumber, realCellWidth, offsetCellsW);		
				ignoreRecalcWH = false;
			end;
		end;
		
		self.edtAltura.onChange = function()
			if not ignoreRecalcWH then
				ignoreRecalcWH = true;
				self.edtAlturaCells.asNumber = self:metricToCells(self.edtAltura.asNumber, realCellHeight, offsetCellsH);									
				ignoreRecalcWH = false;
			end;
		end;		
		
		self.edtLarguraCells.onChange = function()
			if not ignoreRecalcWH then
				ignoreRecalcWH = true;			
				self.edtLargura.asNumber = self:cellsToMetric(self.edtLarguraCells.asNumber, realCellWidth, offsetCellsW);														
				ignoreRecalcWH = false;
			end;
		end;	

		self.edtAlturaCells.onChange = function()
			if not ignoreRecalcWH then
				ignoreRecalcWH = true;
				self.edtAltura.asNumber = self:cellsToMetric(self.edtAlturaCells.asNumber, realCellHeight, offsetCellsH);	
				ignoreRecalcWH = false;
			end;
		end;
		
		function self:recalculateRealCellSize()
			local diagonalsVisible = false;
		
			if self.rbtCellTypeVertHex.checked then
				realCellWidth = self.edtCellSize.asNumber;
				realCellHeight = self.edtCellSize.asNumber * (2 / math.sqrt(3));				
				offsetCellsW = realCellWidth;
				offsetCellsH = realCellHeight * 0.75;
				self.edtOffsetX.min = -realCellWidth;
				self.edtOffsetX.max = realCellWidth;
				self.edtOffsetY.min = -2 * realCellHeight;
				self.edtOffsetY.max = 2 * realCellHeight;						
			elseif self.rbtCellTypeHorzHex.checked then
				realCellWidth = self.edtCellSize.asNumber * (2 / math.sqrt(3));
				realCellHeight = self.edtCellSize.asNumber;							
				offsetCellsW = realCellWidth * 0.75;
				offsetCellsH = realCellHeight;		
				self.edtOffsetX.min = -2 * realCellWidth;
				self.edtOffsetX.max = 2 * realCellWidth;
				self.edtOffsetY.min = -realCellHeight;
				self.edtOffsetY.max = realCellHeight;				
			else
				realCellWidth = self.edtCellSize.asNumber;
				realCellHeight = self.edtCellSize.asNumber;						
				offsetCellsW = realCellWidth;
				offsetCellsH = realCellHeight;				
				self.edtOffsetX.min = -realCellWidth;
				self.edtOffsetX.max = realCellWidth;
				self.edtOffsetY.min = -realCellHeight;
				self.edtOffsetY.max = realCellHeight;				
				diagonalsVisible = true;
			end;					
			
			if diagonalsVisible ~= self.partSquareDiagonals.visible then
				self.partSquareDiagonals.visible = diagonalsVisible;
				self.flaContent:needRealign();
			end;
		end;		
		
		function self:metricToCells(metric, cellSize, cellOffset)
			if metric <= cellSize then
				return metric / cellSize;
			else
				return 1 + (metric - cellSize) / cellOffset;
			end;
		end;
		
		function self:cellsToMetric(cells, cellSize, cellOffset)
			if cells < 1 then
				return cells * cellSize;
			else
				return cellSize + (cells - 1) * cellOffset;
			end;
		end;
		
		function self:rbtCellTypeChanged()		
			self:recalculateRealCellSize()
			
			if not ignoreRecalcWH then
				ignoreRecalcWH = true;
				self.edtLargura.asNumber = self:cellsToMetric(self.edtLarguraCells.asNumber, realCellWidth, offsetCellsW);				
				self.edtAltura.asNumber = self:cellsToMetric(self.edtAlturaCells.asNumber, realCellHeight, offsetCellsH);					
				ignoreRecalcWH = false;
			end;		
		end;
		
		function self:atualizarTitulosLarguraAltura()
			self.labLarguraAlturaMetric.text = self.cmbMetric.text;
			self.labOffsetMetric.text = self.cmbMetric.text;
		end;
		
		function self:prepareForShow(oScene)
			scene = oScene;
			
			self:beginUpdate();
			self.cmbCorFundo.color = scene.bkgColor;
			self.cmbCorGrid.color = scene.grid.gridColor;
			self.edtCellSize.asNumber = scene.grid.cellSize;
			self.cmbMetric.value = scene.worldMetricName;	
			self.cbxDrawGrid.checked = scene.grid.drawGrid;
			self.edtOffsetX.asNumber = scene.grid.offsetX;
			self.edtOffsetY.asNumber = scene.grid.offsetY;
			self.cmbDiagonais.value = scene.grid.squareDiagonals;
			self:atualizarTitulosLarguraAltura();
			
			local gridType = scene.grid.gridType;
			
			self.rbtCellTypeVertHex.checked = false;
			self.rbtCellTypeHorzHex.checked = false;
			self.rbtCellTypeQuad.checked = false;
			
			if gridType == "vertHex" then
				self.rbtCellTypeVertHex.checked = true;
			elseif gridType == "horzHex" then
				self.rbtCellTypeHorzHex.checked = true;
			else
				self.rbtCellTypeQuad.checked = true;
			end;
			
			self:recalculateRealCellSize();		
			
			exibindoFOW = scene.isGM;
			self.tabFOW.visible = exibindoFOW;
			self.tabBkgImg.visible = scene.isGM;
			
			ignoreRecalcWH = true;
			self.edtLargura.asNumber = scene.worldWidth;
			self.edtAltura.asNumber = scene.worldHeight;
			self.edtLarguraCells.asNumber = self:metricToCells(self.edtLargura.asNumber, realCellWidth, offsetCellsW);
			self.edtAlturaCells.asNumber = self:metricToCells(self.edtAltura.asNumber, realCellHeight, offsetCellsH);
			self.edtLargura.min = scene.grid.cellSize;
			self.edtAltura.min = scene.grid.cellSize;
			self.cbxEnableFoW.checked = scene.fogOfWar.enabled;
			self.cmbAmbientLight.value = scene.fogOfWar.ambientLight;	
			self.cmbFogSharing.value = scene.fogOfWar.sharingMode;
			self.imgBkgImg.src = scene.bkgImageURL;
			
			ignoreRecalcWH = false;
			self:endUpdate();
		end;		
		
		function self:processarOK()
			SC3UNDO_Capture(scene,
				function()						
					scene:beginUpdate();			
					scene.bkgColor = self.cmbCorFundo.color;
					scene.grid.gridColor = self.cmbCorGrid.color;
					scene.grid.cellSize = self.edtCellSize.asNumber;
					scene.grid.drawGrid = self.cbxDrawGrid.checked;
					scene.worldMetricName = self.cmbMetric.value;
					scene.worldWidth = self.edtLargura.asNumber;
					scene.worldHeight = self.edtAltura.asNumber;
					scene.grid.offsetX = self.edtOffsetX.asNumber;
					scene.grid.offsetY = self.edtOffsetY.asNumber;
					scene.grid.squareDiagonals = self.cmbDiagonais.value;
										
					
					if self.rbtCellTypeVertHex.checked then
						scene.grid.gridType = "vertHex";
					elseif self.rbtCellTypeHorzHex.checked then
						scene.grid.gridType = "horzHex";
					else
						scene.grid.gridType = "square";
					end;
					
					if exibindoFOW then
						scene.fogOfWar.enabled = self.cbxEnableFoW.checked;
						scene.fogOfWar.ambientLight = self.cmbAmbientLight.value;	
						scene.fogOfWar.sharingMode = self.cmbFogSharing.value;						
					end;
					
					if self.tabBkgImg.visible  then
						scene.bkgImageURL = self.imgBkgImg.src;					
					end;
					
					scene:endUpdate();
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

    obj._e_event2 = obj.flaTipoDeCelula:addEventListener("onAfterLayoutCalc",
        function (_)
            self.partTipoCelula.height = math.max(30, self.flaTipoDeCelula.contentHeight)
        end, obj);

    obj._e_event3 = obj.flowPart2:addEventListener("onClick",
        function (_)
            self.rbtCellTypeQuad.checked = true
        end, obj);

    obj._e_event4 = obj.rbtCellTypeQuad:addEventListener("onChange",
        function (_)
            self:rbtCellTypeChanged()
        end, obj);

    obj._e_event5 = obj.flowPart3:addEventListener("onClick",
        function (_)
            self.rbtCellTypeVertHex.checked = true
        end, obj);

    obj._e_event6 = obj.rbtCellTypeVertHex:addEventListener("onChange",
        function (_)
            self:rbtCellTypeChanged()
        end, obj);

    obj._e_event7 = obj.flowPart4:addEventListener("onClick",
        function (_)
            self.rbtCellTypeHorzHex.checked = true
        end, obj);

    obj._e_event8 = obj.rbtCellTypeHorzHex:addEventListener("onChange",
        function (_)
            self:rbtCellTypeChanged()
        end, obj);

    obj._e_event9 = obj.edtCellSize:addEventListener("onChange",
        function (_)
            ignoreRecalcWH = true;
            									self:recalculateRealCellSize();
            									self.edtLargura.min = realCellWidth;
            									self.edtAltura.min = realCellHeight;
            									self.edtLargura.asNumber = self:cellsToMetric(self.edtLarguraCells.asNumber, realCellWidth, offsetCellsW);				
            									self.edtAltura.asNumber = self:cellsToMetric(self.edtAlturaCells.asNumber, realCellHeight, offsetCellsH);			
            									ignoreRecalcWH = false;
        end, obj);

    obj._e_event10 = obj.cmbMetric:addEventListener("onChange",
        function (_)
            self:atualizarTitulosLarguraAltura()
        end, obj);

    obj._e_event11 = obj.flaContentDimensions:addEventListener("onAfterLayoutCalc",
        function (_)
            self.partDimensoes.height = self.flaContentDimensions.height;
        end, obj);

    obj._e_event12 = obj.flaContentOffset:addEventListener("onAfterLayoutCalc",
        function (_)
            self.partGridOffset.height = math.max(self.flaContentOffset.contentHeight, 30);
        end, obj);

    obj._e_event13 = obj.btnOk1:addEventListener("onClick",
        function (_)
            self:processarOK()
        end, obj);

    obj._e_event14 = obj.btnCancel1:addEventListener("onClick",
        function (_)
            self:processarCancel()
        end, obj);

    function obj:_releaseEvents()
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

        if self.imgBkgImg ~= nil then self.imgBkgImg:destroy(); self.imgBkgImg = nil; end;
        if self.flaContentBkg ~= nil then self.flaContentBkg:destroy(); self.flaContentBkg = nil; end;
        if self.labCorDeFundo ~= nil then self.labCorDeFundo:destroy(); self.labCorDeFundo = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.cmbMetric ~= nil then self.cmbMetric:destroy(); self.cmbMetric = nil; end;
        if self.labLarguraAlturaMetric ~= nil then self.labLarguraAlturaMetric:destroy(); self.labLarguraAlturaMetric = nil; end;
        if self.flaContentOffset ~= nil then self.flaContentOffset:destroy(); self.flaContentOffset = nil; end;
        if self.labOffsetXOffsetY ~= nil then self.labOffsetXOffsetY:destroy(); self.labOffsetXOffsetY = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.rctBkgImg ~= nil then self.rctBkgImg:destroy(); self.rctBkgImg = nil; end;
        if self.flaContent ~= nil then self.flaContent:destroy(); self.flaContent = nil; end;
        if self.edtCellSize ~= nil then self.edtCellSize:destroy(); self.edtCellSize = nil; end;
        if self.tabFOW ~= nil then self.tabFOW:destroy(); self.tabFOW = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.labAmbientLight ~= nil then self.labAmbientLight:destroy(); self.labAmbientLight = nil; end;
        if self.flaContentFOW ~= nil then self.flaContentFOW:destroy(); self.flaContentFOW = nil; end;
        if self.partDimensoes ~= nil then self.partDimensoes:destroy(); self.partDimensoes = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.labGroupHeader1 ~= nil then self.labGroupHeader1:destroy(); self.labGroupHeader1 = nil; end;
        if self.rbtCellTypeHorzHex ~= nil then self.rbtCellTypeHorzHex:destroy(); self.rbtCellTypeHorzHex = nil; end;
        if self.labCellSize ~= nil then self.labCellSize:destroy(); self.labCellSize = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.cmbFogSharing ~= nil then self.cmbFogSharing:destroy(); self.cmbFogSharing = nil; end;
        if self.labLarguraXAlturaCells ~= nil then self.labLarguraXAlturaCells:destroy(); self.labLarguraXAlturaCells = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.labFogSharing ~= nil then self.labFogSharing:destroy(); self.labFogSharing = nil; end;
        if self.labDrawGridLines ~= nil then self.labDrawGridLines:destroy(); self.labDrawGridLines = nil; end;
        if self.edtAltura ~= nil then self.edtAltura:destroy(); self.edtAltura = nil; end;
        if self.flaTipoDeCelula ~= nil then self.flaTipoDeCelula:destroy(); self.flaTipoDeCelula = nil; end;
        if self.partSquareDiagonals ~= nil then self.partSquareDiagonals:destroy(); self.partSquareDiagonals = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.edtLarguraCells ~= nil then self.edtLarguraCells:destroy(); self.edtLarguraCells = nil; end;
        if self.cmbDiagonais ~= nil then self.cmbDiagonais:destroy(); self.cmbDiagonais = nil; end;
        if self.edtOffsetX ~= nil then self.edtOffsetX:destroy(); self.edtOffsetX = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.labCorGrid ~= nil then self.labCorGrid:destroy(); self.labCorGrid = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.partGridOffset ~= nil then self.partGridOffset:destroy(); self.partGridOffset = nil; end;
        if self.labTipoDeCelula ~= nil then self.labTipoDeCelula:destroy(); self.labTipoDeCelula = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layContentDimensions ~= nil then self.layContentDimensions:destroy(); self.layContentDimensions = nil; end;
        if self.labGroupHeader2 ~= nil then self.labGroupHeader2:destroy(); self.labGroupHeader2 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.labEnableFoW ~= nil then self.labEnableFoW:destroy(); self.labEnableFoW = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.labDeslocamentoGrid ~= nil then self.labDeslocamentoGrid:destroy(); self.labDeslocamentoGrid = nil; end;
        if self.path2 ~= nil then self.path2:destroy(); self.path2 = nil; end;
        if self.labDiagonais ~= nil then self.labDiagonais:destroy(); self.labDiagonais = nil; end;
        if self.labOffsetMetric ~= nil then self.labOffsetMetric:destroy(); self.labOffsetMetric = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.labGroupHeader3 ~= nil then self.labGroupHeader3:destroy(); self.labGroupHeader3 = nil; end;
        if self.labOrientBkgImg ~= nil then self.labOrientBkgImg:destroy(); self.labOrientBkgImg = nil; end;
        if self.labDimensoes ~= nil then self.labDimensoes:destroy(); self.labDimensoes = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.path3 ~= nil then self.path3:destroy(); self.path3 = nil; end;
        if self.rbtCellTypeVertHex ~= nil then self.rbtCellTypeVertHex:destroy(); self.rbtCellTypeVertHex = nil; end;
        if self.labGroupHeader4 ~= nil then self.labGroupHeader4:destroy(); self.labGroupHeader4 = nil; end;
        if self.edtAlturaCells ~= nil then self.edtAlturaCells:destroy(); self.edtAlturaCells = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.flaContentDimensions ~= nil then self.flaContentDimensions:destroy(); self.flaContentDimensions = nil; end;
        if self.cbxDrawGrid ~= nil then self.cbxDrawGrid:destroy(); self.cbxDrawGrid = nil; end;
        if self.labLarguraXAltura ~= nil then self.labLarguraXAltura:destroy(); self.labLarguraXAltura = nil; end;
        if self.edtOffsetY ~= nil then self.edtOffsetY:destroy(); self.edtOffsetY = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.edtLargura ~= nil then self.edtLargura:destroy(); self.edtLargura = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tabPrincipal ~= nil then self.tabPrincipal:destroy(); self.tabPrincipal = nil; end;
        if self.rbtCellTypeQuad ~= nil then self.rbtCellTypeQuad:destroy(); self.rbtCellTypeQuad = nil; end;
        if self.tabBkgImg ~= nil then self.tabBkgImg:destroy(); self.tabBkgImg = nil; end;
        if self.labLarguraAlturaOr ~= nil then self.labLarguraAlturaOr:destroy(); self.labLarguraAlturaOr = nil; end;
        if self.cmbCorGrid ~= nil then self.cmbCorGrid:destroy(); self.cmbCorGrid = nil; end;
        if self.labLarguraAlturaMetricCells ~= nil then self.labLarguraAlturaMetricCells:destroy(); self.labLarguraAlturaMetricCells = nil; end;
        if self.cmbAmbientLight ~= nil then self.cmbAmbientLight:destroy(); self.cmbAmbientLight = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.labBkgImg ~= nil then self.labBkgImg:destroy(); self.labBkgImg = nil; end;
        if self.cbxEnableFoW ~= nil then self.cbxEnableFoW:destroy(); self.cbxEnableFoW = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.partTipoCelula ~= nil then self.partTipoCelula:destroy(); self.partTipoCelula = nil; end;
        if self.btnOk1 ~= nil then self.btnOk1:destroy(); self.btnOk1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.cmbCorFundo ~= nil then self.cmbCorFundo:destroy(); self.cmbCorFundo = nil; end;
        if self.btnCancel1 ~= nil then self.btnCancel1:destroy(); self.btnCancel1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmBoardProps()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmBoardProps();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmBoardProps = {
    newEditor = newfrmBoardProps, 
    new = newfrmBoardProps, 
    name = "frmBoardProps", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmBoardProps = _frmBoardProps;
Firecast.registrarForm(_frmBoardProps);

return _frmBoardProps;
