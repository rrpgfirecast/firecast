require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGeneratorOptions()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmGeneratorOptions");
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
		
		if not System.isMobile() then
			self.height = 450;
		end;
	


    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tabOptions = gui.fromHandle(_obj_newObject("tab"));
    obj.tabOptions:setParent(obj.tabControl1);
    obj.tabOptions:setName("tabOptions");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tabOptions);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.tabName = gui.fromHandle(_obj_newObject("label"));
    obj.tabName:setParent(obj.scrollBox1);
    obj.tabName:setText("");
    obj.tabName:setName("tabName");
    obj.tabName:setAlign("top");
    obj.tabName:setMargins({left=10, right=5});
    obj.tabName:setFontSize(15);
    obj.tabName:setFontColor("#FFCC66");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.scrollBox1);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setStrokeColor("#FFCC6670");
    obj.horzLine1:setMargins({left=10});
    obj.horzLine1:setName("horzLine1");

    obj.salasText = gui.fromHandle(_obj_newObject("label"));
    obj.salasText:setParent(obj.scrollBox1);
    obj.salasText:setName("salasText");
    obj.salasText:setLeft(10);
    obj.salasText:setTop(30);
    obj.salasText:setWidth(120);
    obj.salasText:setHeight(25);
    obj.salasText:setText("");
    obj.salasText:setHitTest(true);
    obj.salasText:setHint("Quantidade Maxima de Salas.");
    obj.salasText:setHorzTextAlign("trailing");

    obj.salas = gui.fromHandle(_obj_newObject("edit"));
    obj.salas:setParent(obj.scrollBox1);
    obj.salas:setLeft(140);
    obj.salas:setTop(30);
    obj.salas:setWidth(50);
    obj.salas:setHeight(25);
    obj.salas:setName("salas");
    obj.salas:setType("number");

    obj.tamMaxText = gui.fromHandle(_obj_newObject("label"));
    obj.tamMaxText:setParent(obj.scrollBox1);
    obj.tamMaxText:setName("tamMaxText");
    obj.tamMaxText:setLeft(10);
    obj.tamMaxText:setTop(55);
    obj.tamMaxText:setWidth(120);
    obj.tamMaxText:setHeight(25);
    obj.tamMaxText:setText("");
    obj.tamMaxText:setHitTest(true);
    obj.tamMaxText:setHint("Tamanho maximo da sala (min. 4)");
    obj.tamMaxText:setHorzTextAlign("trailing");

    obj.tamMax = gui.fromHandle(_obj_newObject("edit"));
    obj.tamMax:setParent(obj.scrollBox1);
    obj.tamMax:setLeft(140);
    obj.tamMax:setTop(55);
    obj.tamMax:setWidth(50);
    obj.tamMax:setHeight(25);
    obj.tamMax:setName("tamMax");
    obj.tamMax:setType("number");

    obj.tamMinText = gui.fromHandle(_obj_newObject("label"));
    obj.tamMinText:setParent(obj.scrollBox1);
    obj.tamMinText:setName("tamMinText");
    obj.tamMinText:setLeft(10);
    obj.tamMinText:setTop(80);
    obj.tamMinText:setWidth(120);
    obj.tamMinText:setHeight(25);
    obj.tamMinText:setText("");
    obj.tamMinText:setHitTest(true);
    obj.tamMinText:setHint("Tamanho minimo da sala (min. 3)");
    obj.tamMinText:setHorzTextAlign("trailing");

    obj.tamMin = gui.fromHandle(_obj_newObject("edit"));
    obj.tamMin:setParent(obj.scrollBox1);
    obj.tamMin:setLeft(140);
    obj.tamMin:setTop(80);
    obj.tamMin:setWidth(50);
    obj.tamMin:setHeight(25);
    obj.tamMin:setName("tamMin");
    obj.tamMin:setType("number");

    obj.entradasText = gui.fromHandle(_obj_newObject("label"));
    obj.entradasText:setParent(obj.scrollBox1);
    obj.entradasText:setName("entradasText");
    obj.entradasText:setLeft(10);
    obj.entradasText:setTop(105);
    obj.entradasText:setWidth(120);
    obj.entradasText:setHeight(25);
    obj.entradasText:setText("");
    obj.entradasText:setHitTest(true);
    obj.entradasText:setHint("Quantidade de entradas");
    obj.entradasText:setHorzTextAlign("trailing");

    obj.entradas = gui.fromHandle(_obj_newObject("edit"));
    obj.entradas:setParent(obj.scrollBox1);
    obj.entradas:setLeft(140);
    obj.entradas:setTop(105);
    obj.entradas:setWidth(50);
    obj.entradas:setHeight(25);
    obj.entradas:setName("entradas");
    obj.entradas:setType("number");

    obj.escadasText = gui.fromHandle(_obj_newObject("label"));
    obj.escadasText:setParent(obj.scrollBox1);
    obj.escadasText:setName("escadasText");
    obj.escadasText:setLeft(10);
    obj.escadasText:setTop(130);
    obj.escadasText:setWidth(120);
    obj.escadasText:setHeight(25);
    obj.escadasText:setText("");
    obj.escadasText:setHitTest(true);
    obj.escadasText:setHint("Quantidade de escadas");
    obj.escadasText:setHorzTextAlign("trailing");

    obj.escadas = gui.fromHandle(_obj_newObject("edit"));
    obj.escadas:setParent(obj.scrollBox1);
    obj.escadas:setLeft(140);
    obj.escadas:setTop(130);
    obj.escadas:setWidth(50);
    obj.escadas:setHeight(25);
    obj.escadas:setName("escadas");
    obj.escadas:setType("number");

    obj.becosText = gui.fromHandle(_obj_newObject("label"));
    obj.becosText:setParent(obj.scrollBox1);
    obj.becosText:setName("becosText");
    obj.becosText:setLeft(10);
    obj.becosText:setTop(155);
    obj.becosText:setWidth(120);
    obj.becosText:setHeight(25);
    obj.becosText:setText("");
    obj.becosText:setHitTest(true);
    obj.becosText:setHint("Quantidade de becos");
    obj.becosText:setHorzTextAlign("trailing");

    obj.becos = gui.fromHandle(_obj_newObject("edit"));
    obj.becos:setParent(obj.scrollBox1);
    obj.becos:setLeft(140);
    obj.becos:setTop(155);
    obj.becos:setWidth(50);
    obj.becos:setHeight(25);
    obj.becos:setName("becos");
    obj.becos:setType("number");

    obj.armadilhasText = gui.fromHandle(_obj_newObject("label"));
    obj.armadilhasText:setParent(obj.scrollBox1);
    obj.armadilhasText:setName("armadilhasText");
    obj.armadilhasText:setLeft(10);
    obj.armadilhasText:setTop(180);
    obj.armadilhasText:setWidth(120);
    obj.armadilhasText:setHeight(25);
    obj.armadilhasText:setText("");
    obj.armadilhasText:setHitTest(true);
    obj.armadilhasText:setHint("");
    obj.armadilhasText:setHorzTextAlign("trailing");

    obj.armadilhas = gui.fromHandle(_obj_newObject("edit"));
    obj.armadilhas:setParent(obj.scrollBox1);
    obj.armadilhas:setLeft(140);
    obj.armadilhas:setTop(180);
    obj.armadilhas:setWidth(50);
    obj.armadilhas:setHeight(25);
    obj.armadilhas:setName("armadilhas");
    obj.armadilhas:setType("number");

    obj.passagensText = gui.fromHandle(_obj_newObject("label"));
    obj.passagensText:setParent(obj.scrollBox1);
    obj.passagensText:setName("passagensText");
    obj.passagensText:setLeft(10);
    obj.passagensText:setTop(205);
    obj.passagensText:setWidth(120);
    obj.passagensText:setHeight(25);
    obj.passagensText:setText("");
    obj.passagensText:setHitTest(true);
    obj.passagensText:setHint("");
    obj.passagensText:setHorzTextAlign("trailing");

    obj.passagens = gui.fromHandle(_obj_newObject("edit"));
    obj.passagens:setParent(obj.scrollBox1);
    obj.passagens:setLeft(140);
    obj.passagens:setTop(205);
    obj.passagens:setWidth(50);
    obj.passagens:setHeight(25);
    obj.passagens:setName("passagens");
    obj.passagens:setType("number");

    obj.thickness = gui.fromHandle(_obj_newObject("label"));
    obj.thickness:setParent(obj.scrollBox1);
    obj.thickness:setLeft(5);
    obj.thickness:setTop(230);
    obj.thickness:setWidth(130);
    obj.thickness:setName("thickness");
    obj.thickness:setHorzTextAlign("trailing");
    obj.thickness:setHitTest(true);

    obj.thick = gui.fromHandle(_obj_newObject("comboBox"));
    obj.thick:setParent(obj.scrollBox1);
    obj.thick:setLeft(140);
    obj.thick:setTop(230);
    obj.thick:setWidth(50);
    obj.thick:setName("thick");
    obj.thick:setItems({'1','1.5','2', '3'});

    obj.natural = gui.fromHandle(_obj_newObject("checkBox"));
    obj.natural:setParent(obj.scrollBox1);
    obj.natural:setLeft(120);
    obj.natural:setTop(255);
    obj.natural:setWidth(130);
    obj.natural:setName("natural");
    obj.natural:setHitTest(true);

    obj.tabTiles = gui.fromHandle(_obj_newObject("tab"));
    obj.tabTiles:setParent(obj.tabControl1);
    obj.tabTiles:setName("tabTiles");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tabTiles);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.style = gui.fromHandle(_obj_newObject("label"));
    obj.style:setParent(obj.scrollBox2);
    obj.style:setLeft(5);
    obj.style:setTop(5);
    obj.style:setName("style");
    obj.style:setMargins({left=10, right=5});
    obj.style:setFontSize(15);
    obj.style:setFontColor("#FFCC66");

    obj.styleOptions = gui.fromHandle(_obj_newObject("comboBox"));
    obj.styleOptions:setParent(obj.scrollBox2);
    obj.styleOptions:setLeft(75);
    obj.styleOptions:setTop(5);
    obj.styleOptions:setWidth(175);
    obj.styleOptions:setName("styleOptions");

    obj.saves = gui.fromHandle(_obj_newObject("label"));
    obj.saves:setParent(obj.scrollBox2);
    obj.saves:setLeft(5);
    obj.saves:setTop(30);
    obj.saves:setName("saves");
    obj.saves:setMargins({left=10, right=5});
    obj.saves:setFontSize(15);
    obj.saves:setFontColor("#FFCC66");
    obj.saves:setHitTest(true);

    obj.saveTile = gui.fromHandle(_obj_newObject("comboBox"));
    obj.saveTile:setParent(obj.scrollBox2);
    obj.saveTile:setLeft(75);
    obj.saveTile:setTop(30);
    obj.saveTile:setWidth(175);
    obj.saveTile:setName("saveTile");
    obj.saveTile:setItems({'1', '2', '3'});

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox2);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(55);
    obj.layout1:setHeight(630);
    obj.layout1:setWidth(300);
    obj.layout1:setName("layout1");

    obj.tiles1 = gui.fromHandle(_obj_newObject("label"));
    obj.tiles1:setParent(obj.layout1);
    obj.tiles1:setText("");
    obj.tiles1:setName("tiles1");
    obj.tiles1:setAlign("top");
    obj.tiles1:setFontSize(15);
    obj.tiles1:setFontColor("#FFCC66");

    obj.horzLine2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout1);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setStrokeColor("#FFCC6670");
    obj.horzLine2:setMargins({left=10});
    obj.horzLine2:setName("horzLine2");

    obj.door_light = gui.fromHandle(_obj_newObject("image"));
    obj.door_light:setParent(obj.layout1);
    obj.door_light:setLeft(5);
    obj.door_light:setTop(30);
    obj.door_light:setWidth(64);
    obj.door_light:setHeight(64);
    obj.door_light:setStyle("stretch");
    obj.door_light:setName("door_light");
    obj.door_light:setEditable(true);

    obj.door_heavy = gui.fromHandle(_obj_newObject("image"));
    obj.door_heavy:setParent(obj.layout1);
    obj.door_heavy:setLeft(74);
    obj.door_heavy:setTop(30);
    obj.door_heavy:setWidth(64);
    obj.door_heavy:setHeight(64);
    obj.door_heavy:setStyle("stretch");
    obj.door_heavy:setName("door_heavy");
    obj.door_heavy:setEditable(true);

    obj.trap = gui.fromHandle(_obj_newObject("image"));
    obj.trap:setParent(obj.layout1);
    obj.trap:setLeft(143);
    obj.trap:setTop(30);
    obj.trap:setWidth(64);
    obj.trap:setHeight(64);
    obj.trap:setStyle("stretch");
    obj.trap:setName("trap");
    obj.trap:setEditable(true);

    obj.passage = gui.fromHandle(_obj_newObject("image"));
    obj.passage:setParent(obj.layout1);
    obj.passage:setLeft(212);
    obj.passage:setTop(30);
    obj.passage:setWidth(64);
    obj.passage:setHeight(64);
    obj.passage:setStyle("stretch");
    obj.passage:setName("passage");
    obj.passage:setEditable(true);

    obj.tiles2 = gui.fromHandle(_obj_newObject("label"));
    obj.tiles2:setParent(obj.layout1);
    obj.tiles2:setText("");
    obj.tiles2:setName("tiles2");
    obj.tiles2:setTop(110);
    obj.tiles2:setWidth(250);
    obj.tiles2:setFontSize(15);
    obj.tiles2:setFontColor("#FFCC66");

    obj.horzLine3 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout1);
    obj.horzLine3:setTop(130);
    obj.horzLine3:setWidth(250);
    obj.horzLine3:setStrokeColor("#FFCC6670");
    obj.horzLine3:setMargins({left=10});
    obj.horzLine3:setName("horzLine3");

    obj.floor_deadend = gui.fromHandle(_obj_newObject("image"));
    obj.floor_deadend:setParent(obj.layout1);
    obj.floor_deadend:setLeft(5);
    obj.floor_deadend:setTop(140);
    obj.floor_deadend:setWidth(64);
    obj.floor_deadend:setHeight(64);
    obj.floor_deadend:setStyle("stretch");
    obj.floor_deadend:setName("floor_deadend");
    obj.floor_deadend:setEditable(true);

    obj.floor_line = gui.fromHandle(_obj_newObject("image"));
    obj.floor_line:setParent(obj.layout1);
    obj.floor_line:setLeft(74);
    obj.floor_line:setTop(140);
    obj.floor_line:setWidth(64);
    obj.floor_line:setHeight(64);
    obj.floor_line:setStyle("stretch");
    obj.floor_line:setName("floor_line");
    obj.floor_line:setEditable(true);

    obj.floor_curve = gui.fromHandle(_obj_newObject("image"));
    obj.floor_curve:setParent(obj.layout1);
    obj.floor_curve:setLeft(143);
    obj.floor_curve:setTop(140);
    obj.floor_curve:setWidth(64);
    obj.floor_curve:setHeight(64);
    obj.floor_curve:setStyle("stretch");
    obj.floor_curve:setName("floor_curve");
    obj.floor_curve:setEditable(true);

    obj.floor_tip = gui.fromHandle(_obj_newObject("image"));
    obj.floor_tip:setParent(obj.layout1);
    obj.floor_tip:setLeft(212);
    obj.floor_tip:setTop(140);
    obj.floor_tip:setWidth(64);
    obj.floor_tip:setHeight(64);
    obj.floor_tip:setStyle("stretch");
    obj.floor_tip:setName("floor_tip");
    obj.floor_tip:setEditable(true);

    obj.floor_t = gui.fromHandle(_obj_newObject("image"));
    obj.floor_t:setParent(obj.layout1);
    obj.floor_t:setLeft(5);
    obj.floor_t:setTop(209);
    obj.floor_t:setWidth(64);
    obj.floor_t:setHeight(64);
    obj.floor_t:setStyle("stretch");
    obj.floor_t:setName("floor_t");
    obj.floor_t:setEditable(true);

    obj.floor_coneright = gui.fromHandle(_obj_newObject("image"));
    obj.floor_coneright:setParent(obj.layout1);
    obj.floor_coneright:setLeft(74);
    obj.floor_coneright:setTop(209);
    obj.floor_coneright:setWidth(64);
    obj.floor_coneright:setHeight(64);
    obj.floor_coneright:setStyle("stretch");
    obj.floor_coneright:setName("floor_coneright");
    obj.floor_coneright:setEditable(true);

    obj.floor_coneleft = gui.fromHandle(_obj_newObject("image"));
    obj.floor_coneleft:setParent(obj.layout1);
    obj.floor_coneleft:setLeft(143);
    obj.floor_coneleft:setTop(209);
    obj.floor_coneleft:setWidth(64);
    obj.floor_coneleft:setHeight(64);
    obj.floor_coneleft:setStyle("stretch");
    obj.floor_coneleft:setName("floor_coneleft");
    obj.floor_coneleft:setEditable(true);

    obj.floor_side = gui.fromHandle(_obj_newObject("image"));
    obj.floor_side:setParent(obj.layout1);
    obj.floor_side:setLeft(212);
    obj.floor_side:setTop(209);
    obj.floor_side:setWidth(64);
    obj.floor_side:setHeight(64);
    obj.floor_side:setStyle("stretch");
    obj.floor_side:setName("floor_side");
    obj.floor_side:setEditable(true);

    obj.floor_cross = gui.fromHandle(_obj_newObject("image"));
    obj.floor_cross:setParent(obj.layout1);
    obj.floor_cross:setLeft(5);
    obj.floor_cross:setTop(278);
    obj.floor_cross:setWidth(64);
    obj.floor_cross:setHeight(64);
    obj.floor_cross:setStyle("stretch");
    obj.floor_cross:setName("floor_cross");
    obj.floor_cross:setEditable(true);

    obj.floor_twoway = gui.fromHandle(_obj_newObject("image"));
    obj.floor_twoway:setParent(obj.layout1);
    obj.floor_twoway:setLeft(74);
    obj.floor_twoway:setTop(278);
    obj.floor_twoway:setWidth(64);
    obj.floor_twoway:setHeight(64);
    obj.floor_twoway:setStyle("stretch");
    obj.floor_twoway:setName("floor_twoway");
    obj.floor_twoway:setEditable(true);

    obj.floor_opositeway = gui.fromHandle(_obj_newObject("image"));
    obj.floor_opositeway:setParent(obj.layout1);
    obj.floor_opositeway:setLeft(143);
    obj.floor_opositeway:setTop(278);
    obj.floor_opositeway:setWidth(64);
    obj.floor_opositeway:setHeight(64);
    obj.floor_opositeway:setStyle("stretch");
    obj.floor_opositeway:setName("floor_opositeway");
    obj.floor_opositeway:setEditable(true);

    obj.floor_exit = gui.fromHandle(_obj_newObject("image"));
    obj.floor_exit:setParent(obj.layout1);
    obj.floor_exit:setLeft(212);
    obj.floor_exit:setTop(278);
    obj.floor_exit:setWidth(64);
    obj.floor_exit:setHeight(64);
    obj.floor_exit:setStyle("stretch");
    obj.floor_exit:setName("floor_exit");
    obj.floor_exit:setEditable(true);

    obj.floor_opencurve = gui.fromHandle(_obj_newObject("image"));
    obj.floor_opencurve:setParent(obj.layout1);
    obj.floor_opencurve:setLeft(5);
    obj.floor_opencurve:setTop(347);
    obj.floor_opencurve:setWidth(64);
    obj.floor_opencurve:setHeight(64);
    obj.floor_opencurve:setStyle("stretch");
    obj.floor_opencurve:setName("floor_opencurve");
    obj.floor_opencurve:setEditable(true);

    obj.floor_inside = gui.fromHandle(_obj_newObject("image"));
    obj.floor_inside:setParent(obj.layout1);
    obj.floor_inside:setLeft(74);
    obj.floor_inside:setTop(347);
    obj.floor_inside:setWidth(64);
    obj.floor_inside:setHeight(64);
    obj.floor_inside:setStyle("stretch");
    obj.floor_inside:setName("floor_inside");
    obj.floor_inside:setEditable(true);

    obj.floor_stair = gui.fromHandle(_obj_newObject("image"));
    obj.floor_stair:setParent(obj.layout1);
    obj.floor_stair:setLeft(143);
    obj.floor_stair:setTop(347);
    obj.floor_stair:setWidth(64);
    obj.floor_stair:setHeight(64);
    obj.floor_stair:setStyle("stretch");
    obj.floor_stair:setName("floor_stair");
    obj.floor_stair:setEditable(true);

    obj.tiles3 = gui.fromHandle(_obj_newObject("label"));
    obj.tiles3:setParent(obj.layout1);
    obj.tiles3:setText("");
    obj.tiles3:setName("tiles3");
    obj.tiles3:setTop(447);
    obj.tiles3:setWidth(250);
    obj.tiles3:setFontSize(15);
    obj.tiles3:setFontColor("#FFCC66");

    obj.horzLine4 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout1);
    obj.horzLine4:setTop(467);
    obj.horzLine4:setWidth(250);
    obj.horzLine4:setStrokeColor("#FFCC6670");
    obj.horzLine4:setMargins({left=10});
    obj.horzLine4:setName("horzLine4");

    obj.wall_cross = gui.fromHandle(_obj_newObject("image"));
    obj.wall_cross:setParent(obj.layout1);
    obj.wall_cross:setLeft(5);
    obj.wall_cross:setTop(487);
    obj.wall_cross:setWidth(64);
    obj.wall_cross:setHeight(64);
    obj.wall_cross:setStyle("stretch");
    obj.wall_cross:setName("wall_cross");
    obj.wall_cross:setEditable(true);

    obj.wall_t = gui.fromHandle(_obj_newObject("image"));
    obj.wall_t:setParent(obj.layout1);
    obj.wall_t:setLeft(74);
    obj.wall_t:setTop(487);
    obj.wall_t:setWidth(64);
    obj.wall_t:setHeight(64);
    obj.wall_t:setStyle("stretch");
    obj.wall_t:setName("wall_t");
    obj.wall_t:setEditable(true);

    obj.wall_line = gui.fromHandle(_obj_newObject("image"));
    obj.wall_line:setParent(obj.layout1);
    obj.wall_line:setLeft(143);
    obj.wall_line:setTop(487);
    obj.wall_line:setWidth(64);
    obj.wall_line:setHeight(64);
    obj.wall_line:setStyle("stretch");
    obj.wall_line:setName("wall_line");
    obj.wall_line:setEditable(true);

    obj.wall_curve = gui.fromHandle(_obj_newObject("image"));
    obj.wall_curve:setParent(obj.layout1);
    obj.wall_curve:setLeft(212);
    obj.wall_curve:setTop(487);
    obj.wall_curve:setWidth(64);
    obj.wall_curve:setHeight(64);
    obj.wall_curve:setStyle("stretch");
    obj.wall_curve:setName("wall_curve");
    obj.wall_curve:setEditable(true);

    obj.wall_deadend = gui.fromHandle(_obj_newObject("image"));
    obj.wall_deadend:setParent(obj.layout1);
    obj.wall_deadend:setLeft(5);
    obj.wall_deadend:setTop(556);
    obj.wall_deadend:setWidth(64);
    obj.wall_deadend:setHeight(64);
    obj.wall_deadend:setStyle("stretch");
    obj.wall_deadend:setName("wall_deadend");
    obj.wall_deadend:setEditable(true);

    obj.wall_pilar = gui.fromHandle(_obj_newObject("image"));
    obj.wall_pilar:setParent(obj.layout1);
    obj.wall_pilar:setLeft(74);
    obj.wall_pilar:setTop(556);
    obj.wall_pilar:setWidth(64);
    obj.wall_pilar:setHeight(64);
    obj.wall_pilar:setStyle("stretch");
    obj.wall_pilar:setName("wall_pilar");
    obj.wall_pilar:setEditable(true);

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setName("layout2");
    obj.layout2:setAlign("bottom");
    obj.layout2:setMargins({top=2, bottom=2});
    obj.layout2:setHeight(40);

    obj.btnOk1 = gui.fromHandle(_obj_newObject("button"));
    obj.btnOk1:setParent(obj.layout2);
    obj.btnOk1:setWidth(100);
    obj.btnOk1:setHorzTextAlign("center");
    obj.btnOk1:setAlign("right");
    obj.btnOk1:setName("btnOk1");
    obj.btnOk1:setMargins({left=4, right=4});

    obj.btnCancel1 = gui.fromHandle(_obj_newObject("button"));
    obj.btnCancel1:setParent(obj.layout2);
    obj.btnCancel1:setHorzTextAlign("center");
    obj.btnCancel1:setAlign("right");
    obj.btnCancel1:setName("btnCancel1");
    obj.btnCancel1:setWidth(100);
    obj.btnCancel1:setMargins({left=4, right=4});


			self.btnOk1.text = lang("Ok");
			self.btnCancel1.text = lang("cancelar");
		



		local node = ndb.load("generatorOptions.xml");
		self.tabOptions.text = lang('scene.generator.tab.options');
		self.tabTiles.text = lang('scene.generator.tab.tiles');
		self.tabName.text = lang('scene.generator.tabName');
		self.salasText.text = lang('scene.generator.salas.text');
		self.salasText.hint = lang('scene.generator.salas.hint');
		self.tamMaxText.text = lang('scene.generator.tamMax.text');
		self.tamMaxText.hint = lang('scene.generator.tamMax.hint');
		self.tamMinText.text = lang('scene.generator.tamMin.text');
		self.tamMinText.hint = lang('scene.generator.tamMin.hint');
		self.entradasText.text = lang('scene.generator.entradas.text');
		self.entradasText.hint = lang('scene.generator.entradas.hint');
		self.escadasText.text = lang('scene.generator.escadas.text');
		self.escadasText.hint = lang('scene.generator.escadas.hint');
		self.armadilhasText.text = lang('scene.generator.armadilhas.text');
		self.armadilhasText.hint = lang('scene.generator.armadilhas.hint');
		self.passagensText.text = lang('scene.generator.passagens.text');
		self.passagensText.hint = lang('scene.generator.passagens.hint');
		self.becosText.text = lang('scene.generator.becos.text');
		self.becosText.hint = lang('scene.generator.becos.hint');
		self.saves.text = lang('scene.generator.saves.text');
		self.saves.hint = lang('scene.generator.saves.hint');
		self.natural.text = lang('scene.generator.natural.text');
		self.natural.hint = lang('scene.generator.natural.hint');

		if node.salas == mil then
			node.salas = 20;
			node.tamMax = 5;
			node.tamMin = 3;
			node.entradas = 1;
			node.escadas = 2;
			node.becos = 0;
			node.armadilhas = 2;
			node.passagens = 2;
			node.natural = false;
			node.thick = "2";
			node.style = lang('scene.generator.tiles.style1');
			node.save = {};
			node.save[1] = "http://firecast.blob.core.windows.net/blobs/LLBKLNNN_328371.png";
			node.save[2] = "http://firecast.blob.core.windows.net/blobs/NSVRSNLG_328370.png";
			node.save[3] = "http://firecast.blob.core.windows.net/blobs/DCCHNTNH_328338.png";
			node.save[4] = "http://firecast.blob.core.windows.net/blobs/VBQRSILF_328334.png";
			node.save[5] = "http://firecast.blob.core.windows.net/blobs/CHKWJATW_328360.png";
			node.save[6] = "http://firecast.blob.core.windows.net/blobs/RKDFSJOR_328336.png";
			node.save[7] = "http://firecast.blob.core.windows.net/blobs/OUICQAEA_328330.png";
			node.save[8] = "http://firecast.blob.core.windows.net/blobs/MFRICDNQ_328364.png";
			node.save[9] = "http://firecast.blob.core.windows.net/blobs/FALFKGFW_328365.png";
			node.save[10] = "http://firecast.blob.core.windows.net/blobs/SUJINTTV_328324.png";
			node.save[11] = "http://firecast.blob.core.windows.net/blobs/EQDFPEFJ_328323.png";
			node.save[12] = "http://firecast.blob.core.windows.net/blobs/MKBOEQSN_328560.png";
			node.save[13] = "http://firecast.blob.core.windows.net/blobs/RKJUVLDJ_328561.png";
			node.save[14] = "http://firecast.blob.core.windows.net/blobs/KEUMVLIT_328361.png";
			node.save[15] = "http://firecast.blob.core.windows.net/blobs/DIGAMPSO_328538.png";
			node.save[16] = "http://firecast.blob.core.windows.net/blobs/KKVCTGSV_328328.png";
			node.save[17] = "http://firecast.blob.core.windows.net/blobs/VGRUNOJU_328508.png";
			node.save[18] = "http://firecast.blob.core.windows.net/blobs/ERKWBFJS_328345.png";
			node.save[19] = "http://firecast.blob.core.windows.net/blobs/LBOAERRP_328342.png";
			node.save[20] = "http://firecast.blob.core.windows.net/blobs/IRSBUCLP_328346.png";
			node.save[21] = "http://firecast.blob.core.windows.net/blobs/SDMDKCTL_328344.png";
			node.save[22] = "http://firecast.blob.core.windows.net/blobs/HKWNFCIW_328340.png";
			node.save[23] = "http://firecast.blob.core.windows.net/blobs/CVFPGFHI_328350.png";
			node.save[24] = "http://firecast.blob.core.windows.net/blobs/EDUPFJLI_328660.png";
			node.save[25] = "http://firecast.blob.core.windows.net/blobs/AEHGOPMH_332114.png";
		end;

		self.salas.text = node.salas;
		self.tamMax.text = node.tamMax;
		self.tamMin.text = node.tamMin;
		self.entradas.text = node.entradas;
		self.escadas.text = node.escadas;
		self.becos.text = node.becos;
		self.armadilhas.text = node.armadilhas;
		self.passagens.text = node.passagens;
		self.natural.checked = node.natural;

		self.thickness.text = lang('scene.generator.thickness.text');
		self.thickness.hint = lang('scene.generator.thickness.hint');
		self.thick.value = node.thick;

		self.style.text = lang('scene.generator.tiles.style');
		self.styleOptions.items = {lang("scene.generator.tiles.style1"), lang("scene.generator.tiles.style2"), lang("scene.generator.tiles.style3"), lang("scene.generator.tiles.style4"), lang("scene.generator.tiles.style5"), lang("scene.generator.tiles.style6"), lang("scene.generator.tiles.style10"), lang("scene.generator.tiles.style7"), lang("scene.generator.tiles.style8"), lang("scene.generator.tiles.style9")};

		self.tiles1.text = lang('scene.generator.tiles.door');
		self.tiles2.text = lang('scene.generator.tiles.floor');
		self.tiles3.text = lang('scene.generator.tiles.wall');
		self.door_light.url = node.save[1];
		self.door_heavy.url = node.save[2];
		self.floor_deadend.url = node.save[3];
		self.floor_line.url = node.save[4];
		self.floor_curve.url = node.save[5];
		self.floor_tip.url = node.save[6];
		self.floor_t.url = node.save[7];
		self.floor_coneright.url = node.save[8];
		self.floor_coneleft.url = node.save[9];
		self.floor_side.url = node.save[10];
		self.floor_cross.url = node.save[11];
		self.floor_twoway.url = node.save[12];
		self.floor_opositeway.url = node.save[13];
		self.floor_exit.url = node.save[14];
		self.floor_opencurve.url = node.save[15];
		self.floor_inside.url = node.save[16];
		self.floor_stair.url = node.save[17];
		self.wall_cross.url = node.save[18];
		self.wall_t.url = node.save[19];
		self.wall_line.url = node.save[20];
		self.wall_curve.url = node.save[21];
		self.wall_deadend.url = node.save[22];
		self.wall_pilar.url = node.save[23];
		self.trap.url = node.save[24];
		self.passage.url = node.save[25];
		self.styleOptions.value = node.style;

		--self.status.text = lang('scene.generator.status.message') .. lang('scene.generator.status.wait');

		function self:prepareForShow(oScene)
			scene = oScene;
		end;

		function self:processarOK()	
			scene.bkgColor = "black";	
			scene.grid.gridColor = "gray";

			-- Limpando scene atual
			scene.isViewingAsGM = true;
			scene.fogOfWar:resetOpaqueAreas();
			local deletions = #scene.items;
			for i=deletions, 1, -1 do
				if scene.items[i]~=nil and scene.items[i].layer=="background" then
					scene.items[i]:delete();
				end;
			end;
			scene.fogOfWar.enabled = true;

			-- Inicializando variaveis uteis
			local thick = tonumber(self.thick.value) or 1;
			local size = scene.grid.cellSize * thick;
			local horzSquare = math.floor(scene.worldWidth/size);
			local vertSquare = math.floor(scene.worldHeight/size);

			local centros = {};
			local centrosNum = 1;
			local map = {};
			for i=1, horzSquare, 1 do
				map[i] = {};
				for j=1, vertSquare, 1 do
					map[i][j] = "nada";
					-- Marcar bordas do mapa
					if i==1 or j==1 or i==horzSquare or j==vertSquare then
						map[i][j] = "borda";
					end;
				end;
			end;

			-- Pegando opções do usuario
			local salas = self.salas.asNumber or 1;
			local limit = (self.salas.asNumber or 1)*2;
			local tamMax = self.tamMax.asNumber or 4;
			if tamMax < 4 then
				tamMax = 4;
			end;
			local tamMin = self.tamMin.asNumber or 3;
			if tamMin < 3 then
				tamMin = 3;
			end;
			if tamMin > tamMax then
				tamMin = 3;
				tamMax = 4;
			end;
			local dif = tamMax - tamMin + 1;
			local entradas = self.entradas.asNumber or 0;
			local escadas = self.escadas.asNumber or 0;
			local becos = self.becos.asNumber or 0;
			local armadilhas = self.armadilhas.asNumber or 0;
			local passagens = self.passagens.asNumber or 0;

			-- Gera entradas [ENTRADA]
			for i=1, entradas, 1 do
				local side = math.floor(math.random() * 4);
				local x = 0;
				local y = 0;
				if side == 0 then
					x = 1;
				elseif side == 1 then
					x = horzSquare;
				elseif side == 2 then
					y = 1;
				elseif side == 3 then
					y = vertSquare;
				end;

				if x == 0 then
					x = math.random(2, (horzSquare-1));
				elseif y == 0 then
					y = math.random(2, (vertSquare-1));
				end;
				if map[x] and map[x][y] == "borda" then
					map[x][y] = "entrada";

					centros[centrosNum] = {x=x, y=y};
					centrosNum = centrosNum+1;
				end;
			end;

			--self.status.text = lang('scene.generator.status.message') .. lang('scene.generator.status.room');
			-- Gerar Salas [SALA]
			for i=1, salas, 1 do
				local width = math.random(tamMin, tamMax);
				local height = math.random(tamMin, tamMax);
				local posx = math.random(2, (horzSquare-1));
				local posy = math.random(2, (vertSquare-1));
				local midx = math.ceil(width/2);
				local midy = math.ceil(height/2);

				-- Verificar se a posição vai colidir com outra sala
				local valid = true;
				for x=1, width, 1 do
					for y=1, height, 1 do
						if posx+x <= horzSquare and posy+y <= vertSquare and map[posx+x][posy+y]~="nada" then
							valid = false;
						end;
					end;
				end; 

				-- Gere a SALA e suas PAREDES
				if valid then
					for x=1, width, 1 do
						for y=1, height, 1 do
							-- Adiciona o chao
							if posx+x <= horzSquare-1 and posy+y <= vertSquare-1 and map[posx+x][posy+y]=="nada" then
								map[posx+x][posy+y] = "chao";
							    if x==midx and y==midy then
							    	centros[centrosNum] = {x=posx+x, y=posy+y};
							    	centrosNum = centrosNum +1;
							    end;
							end;

							-- Se quina topo esquerdo adiciona parede. 
							if x==1 and y==1 then
								if posx+x-1 >= 1 and posy+y-1 >= 1 and map[posx+x-1][posy+y-1]=="nada" then
									map[posx+x-1][posy+y-1] = "parede";
								end;
							end;

							-- Se quina topo direito adiciona parede. 
							if x==width and y==1 then
								if posx+x+1 <= horzSquare and posy+y-1 >= 1 and map[posx+x+1][posy+y-1]=="nada" then
									map[posx+x+1][posy+y-1] = "parede";
								end;
							end;

							-- Se quina inferior esquerda adiciona parede. 
							if x==1 and y==height then
								if posx+x-1 >= 1 and posy+y-1 <= vertSquare and map[posx+x-1][posy+y+1]=="nada" then
									map[posx+x-1][posy+y+1] = "parede";
								end;
							end;

							-- Se quina inferior direita adiciona parede. 
							if x==width and y==height then
								if posx+x+1 <= horzSquare and posy+y+1 <= vertSquare and map[posx+x+1][posy+y+1]=="nada" then
									map[posx+x+1][posy+y+1] = "parede";
								end;
							end;

							-- Se topo adiciona parede
							if y==1 then
								if posx+x >= 1 and posx+x <= horzSquare and posy+y-1 >= 1 and map[posx+x][posy+y-1]=="nada" then
									map[posx+x][posy+y-1] = "parede";
								end;
							end;

							-- Se inferior adiciona parede
							if y==height then
								if posx+x >= 1 and posx+x <= horzSquare and posy+y+1 <= vertSquare and map[posx+x][posy+y+1]=="nada" then
									map[posx+x][posy+y+1] = "parede";
								end;
							end;

							-- Se esquerda adiciona parede
							if x==1 then
								if posx+x-1 >= 1 and posy+y >= 1 and posy+y <=vertSquare and map[posx+x-1][posy+y]=="nada" then
									map[posx+x-1][posy+y] = "parede";
								end;
							end;

							-- Se direita adiciona parede
							if x==width then
								if posx+x+1 <= horzSquare and posy+y >= 1 and posy+y <=vertSquare and map[posx+x+1][posy+y]=="nada" then
									map[posx+x+1][posy+y] = "parede";
								end;
							end;
						end;
					end;
				else 
					salas = salas + 1;
					if salas > limit then
						i = 2 * salas;
					end;
				end;
			end;

			-- Gera becos [BECOS]
			local corredores = {};
			local corredoresNum = 0;
			for i=1, becos, 1 do
				local x = math.random(2, (horzSquare-1));
				local y = math.random(2, (vertSquare-1));

				if map[x]~=nil and map[x][y] == "nada" then
					map[x][y] = "corredor";

					centros[centrosNum] = {x=x, y=y};
					centrosNum = centrosNum+1;

					corredoresNum = corredoresNum +1;
					corredores[corredoresNum] = {x=x, y=y};
				elseif becos <= (self.becos.asNumber or 0) then
					becos = becos +1;
				end;
			end;

			-- Gera corredores [CORREDOR]
			centrosNum = centrosNum -2;
			local secrets = {};
		    local secretsNum = 0;

			-- Mistura a ordem das salas
			if not self.natural.checked then
				local counter = centrosNum;
				while counter > 3 do
			        local index = math.random(2, counter);
			        centros[index], centros[counter] = centros[counter], centros[index];
			        counter = counter - 1;
			    end
			
				for i=1, centrosNum, 1 do
					local x1 = centros[i].x;
					local x2 = centros[i+1].x;
					local y1 = centros[i].y;
					local y2 = centros[i+1].y;

					local horz = x2 - x1;
					local dirx = 0;
					if horz > 0 then
						dirx = 1;
					else 
						dirx = -1;
					end;
					horz = math.abs(horz);

					local vert = y2 - y1;
					local diry = 0;
					if vert > 0 then
						diry = 1;
					else 
						diry = -1;
					end;
					vert = math.abs(vert);

					--showMessage(horz .. "|" .. vert);

					local y = y1; 
					local expand = 0;
					local aux = 0;
					for j=1, horz, 1 do
						local x = x1 + (dirx * (j+aux));
						if map[x][y] == "parede" then
							if map[x + dirx][y] == "parede" and map[x + dirx + dirx][y] == "parede" then
								y = y + diry;
								y1 = y1 + diry;
								vert = vert - diry;
								aux = aux-2;
								horz = horz + 2;
								expand = expand +2;
							else
								map[x][y] = "porta";
								corredoresNum = corredoresNum +1;
								corredores[corredoresNum] = {x=x, y=y};

								secretsNum = secretsNum +1;
								secrets[secretsNum] = {x=x, y=y};
							end;
						elseif map[x][y] == "nada" then
							map[x][y] = "corredor";

							corredoresNum = corredoresNum +1;
							corredores[corredoresNum] = {x=x, y=y};
						end;
					end;
					horz = horz - expand;

					local x = x1 + (dirx * horz);
					local aux = 0;
					for j=1, vert, 1 do
						local y = y1 + (diry * (j+aux)); 
						if map[x][y] == "parede" then
							if map[x][y+diry] == "parede" and map[x][y+diry+diry] == "parede" then
								x = x + dirx;
								dirx = dirx * -1;
								aux = aux - 2;
								vert = vert + 2;
							else
								map[x][y] = "porta";
								corredoresNum = corredoresNum +1;
								corredores[corredoresNum] = {x=x, y=y};

								secretsNum = secretsNum +1;
								secrets[secretsNum] = {x=x, y=y};
							end;
						elseif map[x][y] == "nada" then
							map[x][y] = "corredor";

							corredoresNum = corredoresNum +1;
							corredores[corredoresNum] = {x=x, y=y};
						end;
					end;
				end;
			else
				-- Gera corredor de [CAVERNA]
				for i=1, centrosNum, 1 do
					local x1 = centros[i].x;
					local x2 = centros[i+1].x;
					local y1 = centros[i].y;
					local y2 = centros[i+1].y;

					local success, distance, path = scene.grid:shortestPath(x1, y1, x2, y2);

					for j=1, #path, 1 do
						local x = path[j].i;
						local y = path[j].j;
						if map[x][y]=="parede" or map[x][y]=="nada" then
							map[x][y] = "corredor";

							corredoresNum = corredoresNum +1;
							corredores[corredoresNum] = {x=x, y=y};
						end;
					end;
				end;

			end;

			-- Gera paredes dos corredores [PAREDE]
			for i=1, corredoresNum, 1 do
				local cx = corredores[i].x;
				local cy = corredores[i].y;

				for x=-1, 1, 1 do
					for y=-1, 1, 1 do
						local px = cx+x;
						local py = cy+y;
						if map[px][py] == "nada" then
							map[px][py] = "parede";
						end;
					end;
				end;
			end;

			-- Gera escadas [ESCADA]
			for i=1, escadas, 1 do
				local pos = math.random(centrosNum);
				local x = centros[pos].x;
				local y = centros[pos].y;
				if map[x][y] == "corredor" then
					map[x][y] = "escada";
				elseif map[x][y] == "chao" then
					map[x][y] = "escada";
				end;
			end;

			-- Marcando passagens secretas [PASSAGEM]
			if secretsNum>0 then
				for i=1, passagens, 1 do
					local pos = math.random(secretsNum);
					local x = secrets[pos].x;
					local y = secrets[pos].y;

					if map[x][y] == "porta"then
						map[x][y] = "parede";
					end;
				end;
			end;

			-- Filtro de Caverna
			if self.natural.checked then
				for x=1, horzSquare, 1 do
					for y=1, vertSquare, 1 do
						local tl, t, tr, l, r, bl, b, br;
						if map[x-1]~= nil then
							tl =  map[x-1][y-1];
							l =  map[x-1][y];
							bl =  map[x-1][y+1];
						end;
						if map[x+1]~= nil then
							tr =  map[x+1][y-1];
							r =  map[x+1][y];
							br =  map[x+1][y+1];
						end;
						t = map[x][y-1];
						b = map[x][y+1];

						local piso = 0;
						local paredes = 0;

						if tl == "chao" then
							piso = piso + 1;
						elseif tl == "parede" or tl == "borda" then
							paredes = paredes + 1;
						end;
						if t == "chao" then
							piso = piso + 1;
						elseif t == "parede" or t == "borda" then
							paredes = paredes + 1;
						end;
						if tr == "chao" then
							piso = piso + 1;
						elseif tr == "parede" or tr == "borda" then
							paredes = paredes + 1;
						end;
						if l == "chao" then
							piso = piso + 1;
						elseif l == "parede" or l == "borda" then
							paredes = paredes + 1;
						end;
						if r == "chao" then
							piso = piso + 1;
						elseif r == "parede" or r == "borda" then
							paredes = paredes + 1;
						end;
						if  bl == "chao" then
							piso = piso + 1;
						elseif bl == "parede" or bl == "borda" then
							paredes = paredes + 1;
						end;
						if b == "chao" then
							piso = piso + 1;
						elseif b == "parede" or b == "borda" then
							paredes = paredes + 1;
						end;
						if br == "chao" then
							piso = piso + 1;
						elseif br == "parede" or br == "borda" then
							paredes = paredes + 1;
						end;
						if piso>= 5 then
							map[x][y] = "chao";
						elseif paredes >= 5 and map[x][y]=="chao" then
							map[x][y] = "parede";
						end;
					end;
				end;
			end;

			-- Posicionar os [TILES]
			local endTest = true;
			if endTest then
				for x=1, horzSquare, 1 do
					--self.status.text = lang('scene.generator.status.message') .. lang('scene.generator.status.tiles') .. x;
					for y=1, vertSquare, 1 do
						if map[x][y] ~= "nada" then
							local token = scene.items:addToken("background");
							token.x = (x-1) * size;
							token.y = (y-1) * size;

							token.width = token.width * thick;
							token.height = token.height * thick;

							-- Descobre o que tem envolta do token que está sendo analisado
							local tl, t, tr, l, r, bl, b, br;
							if map[x-1]~= nil then
								tl =  map[x-1][y-1];
								l =  map[x-1][y];
								bl =  map[x-1][y+1];
							end;
							if map[x+1]~= nil then
								tr =  map[x+1][y-1];
								r =  map[x+1][y];
								br =  map[x+1][y+1];
							end;
							t = map[x][y-1];
							b = map[x][y+1];

							-- Define o tipo de tile e sua rotação
							if map[x][y] == "chao" or map[x][y] == "corredor" then
								if (t=="parede" or t=="borda") and (r=="parede" or r=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.floor_deadend.url;
									token.image.rotation = 180;
								elseif (t=="parede" or t=="borda") and (l=="parede" or l=="borda") and (r=="parede" or r=="borda") then
									token.image.url = self.floor_deadend.url;
									token.image.rotation = 270;
								elseif (t=="parede" or t=="borda") and (l=="parede" or l=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.floor_deadend.url;
									token.image.rotation = 0;
								elseif (r=="parede" or r=="borda") and (l=="parede" or l=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.floor_deadend.url;
									token.image.rotation = 90;
								elseif (r=="parede" or r=="borda") and (l=="parede" or l=="borda") then
									token.image.url = self.floor_line.url;
									token.image.rotation = 90;
								elseif (t=="parede" or t=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.floor_line.url;
								elseif (t=="parede" or t=="borda") and (l=="parede" or l=="borda") then
									if (br=="parede" or br=="borda") then
										token.image.url = self.floor_curve.url;
									else 
										token.image.url = self.floor_tip.url;
									end;
								elseif (b=="parede" or b=="borda") and (l=="parede" or l=="borda") then
									if (tr=="parede" or tr=="borda") then
										token.image.url = self.floor_curve.url;
									else 
										token.image.url = self.floor_tip.url;
									end;
									token.image.rotation = 90;
								elseif (t=="parede" or t=="borda") and (r=="parede" or r=="borda") then
									if (bl=="parede" or bl=="borda") then
										token.image.url = self.floor_curve.url;
									else 
										token.image.url = self.floor_tip.url;
									end;
									token.image.rotation = 270;
								elseif (b=="parede" or b=="borda") and (r=="parede" or r=="borda") then
									if (tl=="parede" or tl=="borda") then
										token.image.url = self.floor_curve.url;
									else 
										token.image.url = self.floor_tip.url;
									end;
									token.image.rotation = 180;
								elseif (t=="parede" or t=="borda") then
									if (br=="parede" or br=="borda") and (bl=="parede" or bl=="borda") then
										token.image.url = self.floor_t.url;
									elseif (br=="parede" or br=="borda") then
										token.image.url = self.floor_coneright.url;
									elseif (bl=="parede" or bl=="borda") then
										token.image.url = self.floor_coneleft.url;
									else 
										token.image.url = self.floor_side.url;
									end;
								elseif (l=="parede" or l=="borda") then
									if (tr=="parede" or tr=="borda") and (br=="parede" or br=="borda") then
										token.image.url = self.floor_t.url;
									elseif (br=="parede" or br=="borda") then
										token.image.url = self.floor_coneleft.url;
									elseif (tr=="parede" or tr=="borda") then
										token.image.url = self.floor_coneright.url;
									else 
										token.image.url = self.floor_side.url;
									end;
									token.image.rotation = 90;
								elseif (b=="parede" or b=="borda") then
									if (tr=="parede" or tr=="borda") and (tl=="parede" or tl=="borda") then
										token.image.url = self.floor_t.url;
									elseif (tr=="parede" or tr=="borda") then
										token.image.url = self.floor_coneleft.url;
									elseif (tl=="parede" or tl=="borda") then
										token.image.url = self.floor_coneright.url;
									else 
										token.image.url = self.floor_side.url;
									end;
									token.image.rotation = 180;
								elseif (r=="parede" or r=="borda") then
									if (bl=="parede" or bl=="borda") and (tl=="parede" or tl=="borda") then
										token.image.url = self.floor_t.url;
									elseif (tl=="parede" or tl=="borda") then
										token.image.url = self.floor_coneleft.url;
									elseif (bl=="parede" or bl=="borda") then
										token.image.url = self.floor_coneright.url;
									else 
										token.image.url = self.floor_side.url;
									end;
									token.image.rotation = 270;
								else 
									if (tl=="parede" or tl=="borda") and (tr=="parede" or tr=="borda") and (bl=="parede" or bl=="borda") and (br=="parede" or br=="borda") then
										token.image.url = self.floor_cross.url;
									elseif (tl=="parede" or tl=="borda") and (tr=="parede" or tr=="borda") and (br=="parede" or br=="borda") then
										token.image.url = self.floor_twoway.url;
										token.image.rotation = 90;
									elseif (bl=="parede" or bl=="borda") and (tr=="parede" or tr=="borda") and (br=="parede" or br=="borda") then
										token.image.url = self.floor_twoway.url;
										token.image.rotation = 180;
									elseif (bl=="parede" or bl=="borda") and (tl=="parede" or tl=="borda") and (br=="parede" or br=="borda") then
										token.image.url = self.floor_twoway.url;
										token.image.rotation = 270;
									elseif (bl=="parede" or bl=="borda") and (tl=="parede" or tl=="borda") and (tr=="parede" or tr=="borda") then
										token.image.url = self.floor_twoway.url;
										token.image.rotation = 0;
									elseif (bl=="parede" or bl=="borda") and (tr=="parede" or tr=="borda") then
										token.image.url = self.floor_opositeway.url;
									elseif (tl=="parede" or tl=="borda") and (br=="parede" or br=="borda") then
										token.image.url = self.floor_opositeway.url;
										token.image.rotation = 90;
									elseif (tl=="parede" or tl=="borda") and (tr=="parede" or tr=="borda") then
										token.image.url = self.floor_exit.url;
									elseif (tl=="parede" or tl=="borda") and (bl=="parede" or bl=="borda") then
										token.image.url = self.floor_exit.url;
										token.image.rotation = 90;
									elseif (br=="parede" or br=="borda") and (bl=="parede" or bl=="borda") then
										token.image.url = self.floor_exit.url;
										token.image.rotation = 180;
									elseif (tr=="parede" or tr=="borda") and (br=="parede" or br=="borda") then
										token.image.url = self.floor_exit.url;
										token.image.rotation = 270;
									elseif (br=="parede" or br=="borda") then
										token.image.url = self.floor_opencurve.url;
									elseif (tr=="parede" or tr=="borda") then
										token.image.url = self.floor_opencurve.url;
										token.image.rotation = 90;
									elseif (tl=="parede" or tl=="borda") then
										token.image.url = self.floor_opencurve.url;
										token.image.rotation = 180;
									elseif (bl=="parede" or bl=="borda") then
										token.image.url = self.floor_opencurve.url;
										token.image.rotation = 270;
									else
										token.image.url = self.floor_inside.url;
									end;
								end;								
							elseif map[x][y] == "parede" then
								if (b=="parede" or b=="borda") and (t=="parede" or t=="borda") and (l=="parede" or l=="borda") and (r=="parede" or r=="borda") then
									token.image.url = self.wall_cross.url;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (b=="parede" or b=="borda") and (l=="parede" or l=="borda") and (r=="parede" or r=="borda") then
									token.image.url = self.wall_t.url;
									local aux = {};
									aux[1] = {x=x*size, y=(y-0.6)*size};
									aux[2] = {x=x*size, y=(y-0.4)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[4] = {x=(x-0.4)*size, y=y*size};
									aux[5] = {x=(x-0.6)*size, y=y*size};
									aux[6] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[8] = {x=(x-1)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (b=="parede" or b=="borda") and (t=="parede" or t=="borda") and (r=="parede" or r=="borda") then
									token.image.url = self.wall_t.url;
									token.image.rotation = 90;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (l=="parede" or l=="borda") and (t=="parede" or t=="borda") and (r=="parede" or r=="borda") then
									token.image.url = self.wall_t.url;
									token.image.rotation = 180;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[8] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (l=="parede" or l=="borda") and (t=="parede" or t=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.wall_t.url;
									token.image.rotation = 270;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=y*size};
									aux[4] = {x=(x-0.6)*size, y=y*size};
									aux[5] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[6] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[8] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (l=="parede" or l=="borda") and (r=="parede" or r=="borda") then
									token.image.url = self.wall_line.url;
									local aux = {};
									aux[1] = {x=x*size, y=(y-0.6)*size};
									aux[2] = {x=x*size, y=(y-0.4)*size};
									aux[3] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[4] = {x=(x-1)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (t=="parede" or t=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.wall_line.url;
									token.image.rotation = 90;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y)*size};
									aux[4] = {x=(x-0.6)*size, y=(y)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (r=="parede" or r=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.wall_curve.url;
									local aux = {};
									aux[1] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[2] = {x=x*size, y=(y-0.6)*size};
									aux[3] = {x=x*size, y=(y-0.4)*size};
									aux[4] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[5] = {x=(x-0.4)*size, y=y*size};
									aux[6] = {x=(x-0.6)*size, y=y*size};
									aux[7] = {x=(x-0.6)*size, y=(y-0.4)*size};
									if not self.natural. checked then
										aux[8] = {x=(x-1)*size, y=(y-0.4)*size};
										aux[9] = {x=(x-1)*size, y=(y-0.6)*size};
										aux[10] = {x=(x-0.6)*size, y=(y-0.6)*size};
										aux[11] = {x=(x-0.6)*size, y=(y-1)*size};
										aux[12] = {x=(x-0.4)*size, y=(y-1)*size};
									end;
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (r=="parede" or r=="borda") and (t=="parede" or t=="borda") then
									token.image.url = self.wall_curve.url;
									token.image.rotation = 90;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-0.6)*size};
									aux[2] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[4] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.6)*size};
									aux[6] = {x=x*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=(y-0.4)*size};
									if not self.natural. checked then
										aux[8] = {x=(x-0.4)*size, y=y*size};
										aux[9] = {x=(x-0.6)*size, y=y*size};
										aux[10] = {x=(x-0.6)*size, y=(y-0.4)*size};
										aux[11] = {x=(x-1)*size, y=(y-0.4)*size};
										aux[12] = {x=(x-1)*size, y=(y-0.6)*size};
									end;
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (l=="parede" or l=="borda") and (t=="parede" or t=="borda") then
									token.image.url = self.wall_curve.url;
									token.image.rotation = 180;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[2] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[3] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[4] = {x=(x-0.6)*size, y=(y-0.6)*size};
									aux[5] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[7] = {x=(x-0.4)*size, y=(y-0.6)*size};
									if not self.natural. checked then
										aux[8] = {x=x*size, y=(y-0.6)*size};
										aux[9] = {x=x*size, y=(y-0.4)*size};
										aux[10] = {x=(x-0.4)*size, y=(y-0.4)*size};
										aux[11] = {x=(x-0.4)*size, y=y*size};
										aux[12] = {x=(x-0.6)*size, y=y*size};
									end;
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (l=="parede" or l=="borda") and (b=="parede" or b=="borda") then
									token.image.url = self.wall_curve.url;
									token.image.rotation = 270;
									local aux = {};

									aux[1] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[2] = {x=(x-0.4)*size, y=y*size};
									aux[3] = {x=(x-0.6)*size, y=y*size};
									aux[4] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[5] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[6] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[7] = {x=(x-0.6)*size, y=(y-0.6)*size};
									if not self.natural. checked then
										aux[8] = {x=(x-0.6)*size, y=(y-1)*size};
										aux[9] = {x=(x-0.4)*size, y=(y-1)*size};
										aux[10] = {x=(x-0.4)*size, y=(y-0.6)*size};
										aux[11] = {x=x*size, y=(y-0.6)*size};
										aux[12] = {x=x*size, y=(y-0.4)*size};
									end;
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (l=="parede" or l=="borda") then
									token.image.url = self.wall_deadend.url;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (b=="parede" or b=="borda") then
									token.image.url = self.wall_deadend.url;
									token.image.rotation = 90;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (r=="parede" or r=="borda") then
									token.image.url = self.wall_deadend.url;
									token.image.rotation = 180;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif (t=="parede" or t=="borda") then
									token.image.url = self.wall_deadend.url;
									token.image.rotation = 270;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								else
									token.image.url = self.wall_pilar.url;
									local aux = {};
									aux[1] = {x=(x-0.2)*size, y=(y-0.8)*size};
									aux[2] = {x=(x-0.2)*size, y=(y-0.2)*size};
									aux[3] = {x=(x-0.8)*size, y=(y-0.2)*size};
									aux[4] = {x=(x-0.8)*size, y=(y-0.8)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								end;
							elseif map[x][y] == "borda" then
								if b == "borda" and t == "borda" and (l=="parede" or r=="parede") then
									token.image.url = self.wall_t.url;
									if l=="parede" then
										token.image.rotation = 270;
										local aux = {};
										aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
										aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
										aux[3] = {x=(x-0.4)*size, y=y*size};
										aux[4] = {x=(x-0.6)*size, y=y*size};
										aux[5] = {x=(x-0.6)*size, y=(y-0.4)*size};
										aux[6] = {x=(x-1)*size, y=(y-0.4)*size};
										aux[7] = {x=(x-1)*size, y=(y-0.6)*size};
										aux[8] = {x=(x-0.6)*size, y=(y-0.6)*size};
										scene.fogOfWar:addOpaqueArea(aux);
									else
										token.image.rotation = 90;
										local aux = {};
										aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
										aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
										aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
										aux[4] = {x=x*size, y=(y-0.6)*size};
										aux[5] = {x=x*size, y=(y-0.4)*size};
										aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
										aux[7] = {x=(x-0.4)*size, y=y*size};
										aux[8] = {x=(x-0.6)*size, y=y*size}
										scene.fogOfWar:addOpaqueArea(aux);
									end;
								elseif r == "borda" and l == "borda" and (b=="parede" or t=="parede") then
									token.image.url = self.wall_t.url;
									if t=="parede" then
										token.image.rotation = 180;
										local aux = {};
										aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
										aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
										aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
										aux[4] = {x=x*size, y=(y-0.6)*size};
										aux[5] = {x=x*size, y=(y-0.4)*size};
										aux[6] = {x=(x-1)*size, y=(y-0.4)*size};
										aux[7] = {x=(x-1)*size, y=(y-0.6)*size};
										aux[8] = {x=(x-0.6)*size, y=(y-0.6)*size};
										scene.fogOfWar:addOpaqueArea(aux);
									else
										local aux = {};
										aux[1] = {x=x*size, y=(y-0.6)*size};
										aux[2] = {x=x*size, y=(y-0.4)*size};
										aux[3] = {x=(x-0.4)*size, y=(y-0.4)*size};
										aux[4] = {x=(x-0.4)*size, y=y*size};
										aux[5] = {x=(x-0.6)*size, y=y*size};
										aux[6] = {x=(x-0.6)*size, y=(y-0.4)*size};
										aux[7] = {x=(x-1)*size, y=(y-0.4)*size};
										aux[8] = {x=(x-1)*size, y=(y-0.6)*size};
										scene.fogOfWar:addOpaqueArea(aux);
									end;
								elseif b == "borda" and t == "borda" then
									token.image.url = self.wall_line.url;
									token.image.rotation = 90;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y)*size};
									aux[4] = {x=(x-0.6)*size, y=(y)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif r == "borda" and l == "borda" then
									token.image.url = self.wall_line.url;
									local aux = {};
									aux[1] = {x=x*size, y=(y-0.6)*size};
									aux[2] = {x=x*size, y=(y-0.4)*size};
									aux[3] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[4] = {x=(x-1)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif r == "entrada" then
									token.image.url = self.wall_deadend.url;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif l == "entrada" then
									token.image.url = self.wall_deadend.url;
									token.image.rotation = 180;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif b == "entrada" then
									token.image.url = self.wall_deadend.url;
									token.image.rotation = 270;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								elseif t == "entrada" then
									token.image.url = self.wall_deadend.url;
									token.image.rotation = 90;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								else
									token.image.url = self.wall_curve.url;
									if b~=nil and l~=nil then
										token.image.rotation = 270;
									elseif t~=nil and l~=nil then
										token.image.rotation = 180;
									elseif t~=nil and r~=nil then
										token.image.rotation = 90;
									end;
									local aux = {};
									aux[1] = {x=(x-0.6)*size, y=(y-1)*size};
									aux[2] = {x=(x-0.4)*size, y=(y-1)*size};
									aux[3] = {x=(x-0.4)*size, y=(y-0.6)*size};
									aux[4] = {x=x*size, y=(y-0.6)*size};
									aux[5] = {x=x*size, y=(y-0.4)*size};
									aux[6] = {x=(x-0.4)*size, y=(y-0.4)*size};
									aux[7] = {x=(x-0.4)*size, y=y*size};
									aux[8] = {x=(x-0.6)*size, y=y*size};
									aux[9] = {x=(x-0.6)*size, y=(y-0.4)*size};
									aux[10] = {x=(x-1)*size, y=(y-0.4)*size};
									aux[11] = {x=(x-1)*size, y=(y-0.6)*size};
									aux[12] = {x=(x-0.6)*size, y=(y-0.6)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								end;
							elseif map[x][y] == "porta" then
								token.image.url = self.door_light.url;
								if (b == "parede" or b =="porta") and (t == "parede" or t=="porta") then
									token.image.rotation = 90;
									local aux = {};
									aux[1] = {x=(x-0.525)*size, y=(y-1.5)*size};
									aux[2] = {x=(x-0.475)*size, y=(y-1.5)*size};
									aux[3] = {x=(x-0.475)*size, y=(y+0.5)*size};
									aux[4] = {x=(x-0.525)*size, y=(y+0.5)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								else
									local aux = {};
									aux[1] = {x=(x+0.5)*size, y=(y-0.525)*size};
									aux[2] = {x=(x+0.5)*size, y=(y-0.475)*size};
									aux[3] = {x=(x-1.5)*size, y=(y-0.475)*size};
									aux[4] = {x=(x-1.5)*size, y=(y-0.525)*size};
									scene.fogOfWar:addOpaqueArea(aux);
								end;
							elseif map[x][y] == "escada" then
								token.image.url = self.floor_stair.url;
							elseif map[x][y] == "entrada" then
								token.image.url = self.door_heavy.url;
								if b== "borda" and t == "borda" then
									token.image.rotation = 90;
								end;
							end;
						end;
					end;
				end;
			end;

			-- Posicionando tiles de armadilhas [ARMADILHA]
			for i=1, armadilhas, 1 do
				local pos = math.random(centrosNum);
				local x = centros[pos].x;
				local y = centros[pos].y;
				if map[x][y] == "corredor" or map[x][y] == "chao" or map[x][y] == "escada" then
					local token = scene.items:addToken("background");
					token.x = (x-1) * size;
					token.y = (y-1) * size;

					token.width = token.width * thick;
					token.height = token.height * thick;
					token.image.url = self.trap.url;
					token.visible = false;
				end;
			end;

			-- Posicionando tiles de passagens secretas [PASSAGEM]
			for i=1, secretsNum, 1 do
				local x = secrets[i].x;
				local y = secrets[i].y;
				if map[x][y] == "parede"then
					local tl, t, tr, l, r, bl, b, br;
					if map[x-1]~= nil then
						tl =  map[x-1][y-1];
						l =  map[x-1][y];
						bl =  map[x-1][y+1];
					end;
					if map[x+1]~= nil then
						tr =  map[x+1][y-1];
						r =  map[x+1][y];
						br =  map[x+1][y+1];
					end;
					t = map[x][y-1];
					b = map[x][y+1];

					local token = scene.items:addToken("background");
					token.x = (x-1) * size;
					token.y = (y-1) * size;

					token.width = token.width * thick;
					token.height = token.height * thick;
					token.image.url = self.passage.url;
					token.visible = false;

					if (b == "parede" or b =="porta") and (t == "parede" or t=="porta") then
						token.image.rotation = 90;
					end;

				end;
			end;

			node.salas = self.salas.text;
			node.tamMax = self.tamMax.text;
			node.tamMin = self.tamMin.text;
			node.entradas = self.entradas.text;
			node.escadas = self.escadas.text;
			node.becos = self.becos.text;
			node.armadilhas = self.armadilhas.text;
			node.passagens = self.passagens.text;
			node.natural = self.natural.checked;
			node.thick = self.thick.value;
			node.style = self.styleOptions.value;
			node.save = {};
			node.save[1] = self.door_light.url;
			node.save[2] = self.door_heavy.url;
			node.save[3] = self.floor_deadend.url;
			node.save[4] = self.floor_line.url;
			node.save[5] = self.floor_curve.url;
			node.save[6] = self.floor_tip.url;
			node.save[7] = self.floor_t.url;
			node.save[8] = self.floor_coneright.url;
			node.save[9] = self.floor_coneleft.url;
			node.save[10] = self.floor_side.url;
			node.save[11] = self.floor_cross.url;
			node.save[12] = self.floor_twoway.url;
			node.save[13] = self.floor_opositeway.url;
			node.save[14] = self.floor_exit.url;
			node.save[15] = self.floor_opencurve.url;
			node.save[16] = self.floor_inside.url;
			node.save[17] = self.floor_stair.url;
			node.save[18] = self.wall_cross.url;
			node.save[19] = self.wall_t.url;
			node.save[20] = self.wall_line.url;
			node.save[21] = self.wall_curve.url;
			node.save[22] = self.wall_deadend.url;
			node.save[23] = self.wall_pilar.url;
			node.save[24] = self.trap.url;
			node.save[25] = self.passage.url;

			self:close();
		end;
		
		function self:processarCancel()
			node.salas = self.salas.text;
			node.tamMax = self.tamMax.text;
			node.tamMin = self.tamMin.text;
			node.entradas = self.entradas.text;
			node.escadas = self.escadas.text;
			node.becos = self.becos.text;
			node.thick = self.thick.value;
			node.style = self.styleOptions.value;
			node.armadilhas = self.armadilhas.text;
			node.passagens = self.passagens.text;
			node.natural = self.natural.checked;
			node.save = {};
			node.save[1] = self.door_light.url;
			node.save[2] = self.door_heavy.url;
			node.save[3] = self.floor_deadend.url;
			node.save[4] = self.floor_line.url;
			node.save[5] = self.floor_curve.url;
			node.save[6] = self.floor_tip.url;
			node.save[7] = self.floor_t.url;
			node.save[8] = self.floor_coneright.url;
			node.save[9] = self.floor_coneleft.url;
			node.save[10] = self.floor_side.url;
			node.save[11] = self.floor_cross.url;
			node.save[12] = self.floor_twoway.url;
			node.save[13] = self.floor_opositeway.url;
			node.save[14] = self.floor_exit.url;
			node.save[15] = self.floor_opencurve.url;
			node.save[16] = self.floor_inside.url;
			node.save[17] = self.floor_stair.url;
			node.save[18] = self.wall_cross.url;
			node.save[19] = self.wall_t.url;
			node.save[20] = self.wall_line.url;
			node.save[21] = self.wall_curve.url;
			node.save[22] = self.wall_deadend.url;
			node.save[23] = self.wall_pilar.url;
			node.save[24] = self.trap.url;
			node.save[25] = self.passage.url;

			self:close();
		end;
		


    obj._e_event0 = obj:addEventListener("onKeyUp",
        function (self, event)
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
        function (self)
            self:processarCancel();
        end, obj);

    obj._e_event2 = obj.styleOptions:addEventListener("onChange",
        function (self)
            if self.styleOptions.value == lang('scene.generator.tiles.style1') then
            							self.door_light.url = "http://firecast.blob.core.windows.net/blobs/LLBKLNNN_328371.png";
            							self.door_heavy.url = "http://firecast.blob.core.windows.net/blobs/NSVRSNLG_328370.png";
            							self.trap.url = "http://firecast.blob.core.windows.net/blobs/EDUPFJLI_328660.png";
            							self.passage.url = "http://firecast.blob.core.windows.net/blobs/AEHGOPMH_332114.png";
            
            							self.floor_deadend.url = "http://firecast.blob.core.windows.net/blobs/DCCHNTNH_328338.png";
            							self.floor_line.url = "http://firecast.blob.core.windows.net/blobs/VBQRSILF_328334.png";
            							self.floor_curve.url = "http://firecast.blob.core.windows.net/blobs/CHKWJATW_328360.png";
            							self.floor_tip.url = "http://firecast.blob.core.windows.net/blobs/RKDFSJOR_328336.png";
            							self.floor_t.url = "http://firecast.blob.core.windows.net/blobs/OUICQAEA_328330.png";
            							self.floor_coneright.url = "http://firecast.blob.core.windows.net/blobs/MFRICDNQ_328364.png";
            							self.floor_coneleft.url = "http://firecast.blob.core.windows.net/blobs/FALFKGFW_328365.png";
            							self.floor_side.url = "http://firecast.blob.core.windows.net/blobs/SUJINTTV_328324.png";
            							self.floor_cross.url = "http://firecast.blob.core.windows.net/blobs/EQDFPEFJ_328323.png";
            							self.floor_twoway.url = "http://firecast.blob.core.windows.net/blobs/MKBOEQSN_328560.png";
            							self.floor_opositeway.url = "http://firecast.blob.core.windows.net/blobs/RKJUVLDJ_328561.png";
            							self.floor_exit.url = "http://firecast.blob.core.windows.net/blobs/KEUMVLIT_328361.png";
            							self.floor_opencurve.url = "http://firecast.blob.core.windows.net/blobs/DIGAMPSO_328538.png";
            							self.floor_inside.url = "http://firecast.blob.core.windows.net/blobs/KKVCTGSV_328328.png";
            							self.floor_stair.url = "http://firecast.blob.core.windows.net/blobs/VGRUNOJU_328508.png";
            
            							self.wall_cross.url = "http://firecast.blob.core.windows.net/blobs/ERKWBFJS_328345.png";
            							self.wall_t.url = "http://firecast.blob.core.windows.net/blobs/LBOAERRP_328342.png";
            							self.wall_line.url = "http://firecast.blob.core.windows.net/blobs/IRSBUCLP_328346.png";
            							self.wall_curve.url = "http://firecast.blob.core.windows.net/blobs/SDMDKCTL_328344.png";
            							self.wall_deadend.url = "http://firecast.blob.core.windows.net/blobs/HKWNFCIW_328340.png";
            							self.wall_pilar.url = "http://firecast.blob.core.windows.net/blobs/CVFPGFHI_328350.png";
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style2') then
            							self.door_light.url = "http://firecast.blob.core.windows.net/blobs/AWJKDKAC_328734.png";
            							self.door_heavy.url = "http://firecast.blob.core.windows.net/blobs/KEILLRML_328736.png";
            							self.trap.url = "http://firecast.blob.core.windows.net/blobs/HPNFUWKV_332117.png";
            							self.passage.url = "http://firecast.blob.core.windows.net/blobs/CBHDTEGQ_332116.png";
            							
            							self.floor_deadend.url = "http://firecast.blob.core.windows.net/blobs/KRRTQJUG_328743.png";
            							self.floor_line.url = "http://firecast.blob.core.windows.net/blobs/FFFCNNRA_328748.png";
            							self.floor_curve.url = "http://firecast.blob.core.windows.net/blobs/TGSUMGBG_328740.png";
            							self.floor_tip.url = "http://firecast.blob.core.windows.net/blobs/RCASWDBH_328764.png";
            							self.floor_t.url = "http://firecast.blob.core.windows.net/blobs/TGERSJBG_328750.png";
            							self.floor_coneright.url = "http://firecast.blob.core.windows.net/blobs/JSDMTBKW_328746.png";
            							self.floor_coneleft.url = "http://firecast.blob.core.windows.net/blobs/CPLNFUGG_328756.png";
            							self.floor_side.url = "http://firecast.blob.core.windows.net/blobs/IJOQKWAB_328778.png";
            							self.floor_cross.url = "http://firecast.blob.core.windows.net/blobs/PPIQFHNO_328735.png";
            							self.floor_twoway.url = "http://firecast.blob.core.windows.net/blobs/TMGOVKAH_328776.png";
            							self.floor_opositeway.url = "http://firecast.blob.core.windows.net/blobs/OCLLPSKP_328759.png";
            							self.floor_exit.url = "http://firecast.blob.core.windows.net/blobs/KJEAMHJU_328742.png";
            							self.floor_opencurve.url = "http://firecast.blob.core.windows.net/blobs/RDPGAKCT_328753.png";
            							self.floor_inside.url = "http://firecast.blob.core.windows.net/blobs/CAMUVFGO_328752.png";
            							self.floor_stair.url = "http://firecast.blob.core.windows.net/blobs/RHNLHKTP_328772.png";
            
            							self.wall_cross.url = "http://firecast.blob.core.windows.net/blobs/KJGCUDAM_328762.png";
            							self.wall_t.url = "http://firecast.blob.core.windows.net/blobs/FWMBVBCB_328758.png";
            							self.wall_line.url = "http://firecast.blob.core.windows.net/blobs/WBUQKCPR_328770.png";
            							self.wall_curve.url = "http://firecast.blob.core.windows.net/blobs/WVUEGBNU_328765.png";
            							self.wall_deadend.url = "http://firecast.blob.core.windows.net/blobs/HCGLWRRC_328768.png";
            							self.wall_pilar.url = "http://firecast.blob.core.windows.net/blobs/QLOPOGTG_328774.png";
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style3') then
            							self.door_light.url = "http://firecast.blob.core.windows.net/blobs/ASGFSISW_329320.png";
            							self.door_heavy.url = "http://firecast.blob.core.windows.net/blobs/ASGFSISW_329320.png";
            							self.trap.url = "http://firecast.blob.core.windows.net/blobs/CJJFVOHM_332120.png";
            							self.passage.url = "http://firecast.blob.core.windows.net/blobs/ASGFSISW_329320.png";
            							
            							self.floor_deadend.url = "http://firecast.blob.core.windows.net/blobs/WLWRMANJ_329322.jpg";
            							self.floor_line.url = "http://firecast.blob.core.windows.net/blobs/CBDUBAMQ_329345.png";
            							self.floor_curve.url = "http://firecast.blob.core.windows.net/blobs/TTNASKFU_329323.jpg";
            							self.floor_tip.url = "http://firecast.blob.core.windows.net/blobs/DQCKIBNU_329328.jpg";
            							self.floor_t.url = "http://firecast.blob.core.windows.net/blobs/MTEOMLWF_329338.png";
            							self.floor_coneright.url = "http://firecast.blob.core.windows.net/blobs/BMDMFEMN_329337.png";
            							self.floor_coneleft.url = "http://firecast.blob.core.windows.net/blobs/OEGFLVQO_329343.png";
            							self.floor_side.url = "http://firecast.blob.core.windows.net/blobs/ITRDMMWK_329347.png";
            							self.floor_cross.url = "http://firecast.blob.core.windows.net/blobs/BTWIOSUO_329326.jpg";
            							self.floor_twoway.url = "http://firecast.blob.core.windows.net/blobs/FTFIPHHK_329352.jpg";
            							self.floor_opositeway.url = "http://firecast.blob.core.windows.net/blobs/PDOLMBKA_329335.jpg";
            							self.floor_exit.url = "http://firecast.blob.core.windows.net/blobs/PPGPCUGT_329358.jpg";
            							self.floor_opencurve.url = "http://firecast.blob.core.windows.net/blobs/GLSWWJBD_329332.png";
            							self.floor_inside.url = "http://firecast.blob.core.windows.net/blobs/SHGBFFHA_329341.png";
            							self.floor_stair.url = "http://firecast.blob.core.windows.net/blobs/GHANDAIU_329331.png";
            
            							self.wall_cross.url = "http://firecast.blob.core.windows.net/blobs/EHBQVTHS_329351.png";
            							self.wall_t.url = "http://firecast.blob.core.windows.net/blobs/EHBQVTHS_329351.png";
            							self.wall_line.url = "http://firecast.blob.core.windows.net/blobs/EHBQVTHS_329351.png";
            							self.wall_curve.url = "http://firecast.blob.core.windows.net/blobs/EHBQVTHS_329351.png";
            							self.wall_deadend.url = "http://firecast.blob.core.windows.net/blobs/EHBQVTHS_329351.png";
            							self.wall_pilar.url = "http://firecast.blob.core.windows.net/blobs/EHBQVTHS_329351.png";
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style4') then
            							self.door_light.url = "http://firecast.blob.core.windows.net/blobs/IHNOSLRB_329541.png";
            							self.door_heavy.url = "http://firecast.blob.core.windows.net/blobs/QLSSSSQM_329580.png";
            							self.trap.url = "http://firecast.blob.core.windows.net/blobs/UVWDHKET_332122.png";
            							self.passage.url = "http://firecast.blob.core.windows.net/blobs/HQASAGPB_332124.png";
            
            							self.floor_deadend.url = "http://firecast.blob.core.windows.net/blobs/KNKLUVFJ_329540.png";
            							self.floor_line.url = "http://firecast.blob.core.windows.net/blobs/OEWGPTTL_329576.png";
            							self.floor_curve.url = "http://firecast.blob.core.windows.net/blobs/IWLQGFRB_329534.png";
            							self.floor_tip.url = "http://firecast.blob.core.windows.net/blobs/BFHBERSL_329570.png";
            							self.floor_t.url = "http://firecast.blob.core.windows.net/blobs/MCJPCEDL_329536.png";
            							self.floor_coneright.url = "http://firecast.blob.core.windows.net/blobs/LONCNMBR_329546.png";
            							self.floor_coneleft.url = "http://firecast.blob.core.windows.net/blobs/DMQPIQJR_329544.png";
            							self.floor_side.url = "http://firecast.blob.core.windows.net/blobs/BDLQMCWU_329560.png";
            							self.floor_cross.url = "http://firecast.blob.core.windows.net/blobs/JFIIPDRF_329554.png";
            							self.floor_twoway.url = "http://firecast.blob.core.windows.net/blobs/OAAFLUJI_329558.png";
            							self.floor_opositeway.url = "http://firecast.blob.core.windows.net/blobs/EUMIELCK_329566.png";
            							self.floor_exit.url = "http://firecast.blob.core.windows.net/blobs/LTDWDTPC_329535.png";
            							self.floor_opencurve.url = "http://firecast.blob.core.windows.net/blobs/UTWCKBMF_329568.png";
            							self.floor_inside.url = "http://firecast.blob.core.windows.net/blobs/HVARPVMD_329578.png";
            							self.floor_stair.url = "http://firecast.blob.core.windows.net/blobs/NFGUROCR_329572.png";
            
            							self.wall_cross.url = "http://firecast.blob.core.windows.net/blobs/FRJIBOIQ_329562.png";
            							self.wall_t.url = "http://firecast.blob.core.windows.net/blobs/SSUOWVOT_329550.png";
            							self.wall_line.url = "http://firecast.blob.core.windows.net/blobs/OVJWNISR_329551.png";
            							self.wall_curve.url = "http://firecast.blob.core.windows.net/blobs/KHSKBVNB_329556.png";
            							self.wall_deadend.url = "http://firecast.blob.core.windows.net/blobs/PSHQKLON_329574.png";
            							self.wall_pilar.url = "http://firecast.blob.core.windows.net/blobs/GPCUFOBC_329563.png";
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style5') then
            							self.door_light.url = "http://firecast.blob.core.windows.net/blobs/LJKGSFOM_329829.png";
            							self.door_heavy.url = "http://firecast.blob.core.windows.net/blobs/OUOWGIWF_329825.png";
            							self.trap.url = "http://firecast.blob.core.windows.net/blobs/LTUAEHIS_332128.png";
            							self.passage.url = "http://firecast.blob.core.windows.net/blobs/CUJPIRNK_332126.png";
            							
            							self.floor_deadend.url = "http://firecast.blob.core.windows.net/blobs/LSBVEFUE_329833.png";
            							self.floor_line.url = "http://firecast.blob.core.windows.net/blobs/HCTNMNTG_329849.png";
            							self.floor_curve.url = "http://firecast.blob.core.windows.net/blobs/QFCUPDKL_329827.png";
            							self.floor_tip.url = "http://firecast.blob.core.windows.net/blobs/GWLTJWQD_329851.png";
            							self.floor_t.url = "http://firecast.blob.core.windows.net/blobs/VJRLJLIP_329835.png";
            							self.floor_coneright.url = "http://firecast.blob.core.windows.net/blobs/JETNCEDV_329837.png";
            							self.floor_coneleft.url = "http://firecast.blob.core.windows.net/blobs/AGQVIIOC_329831.png";
            							self.floor_side.url = "http://firecast.blob.core.windows.net/blobs/BGNSEQEV_329853.png";
            							self.floor_cross.url = "http://firecast.blob.core.windows.net/blobs/MUGCAHCC_329843.png";
            							self.floor_twoway.url = "http://firecast.blob.core.windows.net/blobs/MHTBQHCU_329841.png";
            							self.floor_opositeway.url = "http://firecast.blob.core.windows.net/blobs/DQKUIGSA_329855.png";
            							self.floor_exit.url = "http://firecast.blob.core.windows.net/blobs/MJWUJEGV_329865.png";
            							self.floor_opencurve.url = "http://firecast.blob.core.windows.net/blobs/VFLPUBSF_329839.png";
            							self.floor_inside.url = "http://firecast.blob.core.windows.net/blobs/VNAMTMGA_329847.png";
            							self.floor_stair.url = "http://firecast.blob.core.windows.net/blobs/TJSMPUQJ_331903.png";
            							
            							self.wall_cross.url = "http://firecast.blob.core.windows.net/blobs/VNQTBSEP_329857.png";
            							self.wall_t.url = "http://firecast.blob.core.windows.net/blobs/ANHEQLQS_329863.png";
            							self.wall_line.url = "http://firecast.blob.core.windows.net/blobs/JCEANFAN_329869.png";
            							self.wall_curve.url = "http://firecast.blob.core.windows.net/blobs/OCIAJCEG_329861.png";
            							self.wall_deadend.url = "http://firecast.blob.core.windows.net/blobs/SBKLABQH_329859.png";
            							self.wall_pilar.url = "http://firecast.blob.core.windows.net/blobs/EBQHSNUU_329867.png";
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style6') then
            							self.door_light.url = "http://firecast.blob.core.windows.net/blobs/RIUGQSGD_330392.png";
            							self.door_heavy.url = "http://firecast.blob.core.windows.net/blobs/LROGHUWU_330376.png";
            							self.trap.url = "http://firecast.blob.core.windows.net/blobs/GAAAHVRC_332132.png";
            							self.passage.url = "http://firecast.blob.core.windows.net/blobs/RIUGQSGD_330392.png";
            							
            							self.floor_deadend.url = "http://firecast.blob.core.windows.net/blobs/CBRDIDTG_330380.png";
            							self.floor_line.url = "http://firecast.blob.core.windows.net/blobs/TKUGJHBB_330394.png";
            							self.floor_curve.url = "http://firecast.blob.core.windows.net/blobs/DWVVDDLE_330381.png";
            							self.floor_tip.url = "http://firecast.blob.core.windows.net/blobs/JTGVLEUL_330402.png";
            							self.floor_t.url = "http://firecast.blob.core.windows.net/blobs/ENDICILC_330390.png";
            							self.floor_coneright.url = "http://firecast.blob.core.windows.net/blobs/CUINVIGD_330372.png";
            							self.floor_coneleft.url = "http://firecast.blob.core.windows.net/blobs/EFEVEHJF_330374.png";
            							self.floor_side.url = "http://firecast.blob.core.windows.net/blobs/BVVUVHGR_330396.png";
            							self.floor_cross.url = "http://firecast.blob.core.windows.net/blobs/WVBEANSO_330378.png";
            							self.floor_twoway.url = "http://firecast.blob.core.windows.net/blobs/GRONQQCD_330400.png";
            							self.floor_opositeway.url = "http://firecast.blob.core.windows.net/blobs/EWLELELT_330386.png";
            							self.floor_exit.url = "http://firecast.blob.core.windows.net/blobs/GKMWAGIV_330384.png";
            							self.floor_opencurve.url = "http://firecast.blob.core.windows.net/blobs/UPEJUFOG_330404.png";
            							self.floor_inside.url = "http://firecast.blob.core.windows.net/blobs/MHGHUWBT_330388.png";
            							self.floor_stair.url = "http://firecast.blob.core.windows.net/blobs/JVRJFNEO_330398.png";
            							
            							self.wall_cross.url = "http://firecast.blob.core.windows.net/blobs/HKTNHTLV_330408.png";
            							self.wall_t.url = "http://firecast.blob.core.windows.net/blobs/FQKBVDRE_330414.png";
            							self.wall_line.url = "http://firecast.blob.core.windows.net/blobs/WFGNBKEK_330406.png";
            							self.wall_curve.url = "http://firecast.blob.core.windows.net/blobs/DGRLUWEC_330416.png";
            							self.wall_deadend.url = "http://firecast.blob.core.windows.net/blobs/WULMLDKW_330412.png";
            							self.wall_pilar.url = "http://firecast.blob.core.windows.net/blobs/OGNMMJLI_330410.png";
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style7') and node.save1~=nil then
            							self.door_light.url = node.save1[1];
            							self.door_heavy.url = node.save1[2];
            							self.floor_deadend.url = node.save1[3];
            							self.floor_line.url = node.save1[4];
            							self.floor_curve.url = node.save1[5];
            							self.floor_tip.url = node.save1[6];
            							self.floor_t.url = node.save1[7];
            							self.floor_coneright.url = node.save1[8];
            							self.floor_coneleft.url = node.save1[9];
            							self.floor_side.url = node.save1[10];
            							self.floor_cross.url = node.save1[11];
            							self.floor_twoway.url = node.save1[12];
            							self.floor_opositeway.url = node.save1[13];
            							self.floor_exit.url = node.save1[14];
            							self.floor_opencurve.url = node.save1[15];
            							self.floor_inside.url = node.save1[16];
            							self.floor_stair.url = node.save1[17];
            							self.wall_cross.url = node.save1[18];
            							self.wall_t.url = node.save1[19];
            							self.wall_line.url = node.save1[20];
            							self.wall_curve.url = node.save1[21];
            							self.wall_deadend.url = node.save1[22];
            							self.wall_pilar.url = node.save1[23];
            							self.trap.url = node.save1[24];
            							self.passage.url = node.save1[25];
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style8') and node.save2~=nil then
            							self.door_light.url = node.save2[1];
            							self.door_heavy.url = node.save2[2];
            							self.floor_deadend.url = node.save2[3];
            							self.floor_line.url = node.save2[4];
            							self.floor_curve.url = node.save2[5];
            							self.floor_tip.url = node.save2[6];
            							self.floor_t.url = node.save2[7];
            							self.floor_coneright.url = node.save2[8];
            							self.floor_coneleft.url = node.save2[9];
            							self.floor_side.url = node.save2[10];
            							self.floor_cross.url = node.save2[11];
            							self.floor_twoway.url = node.save2[12];
            							self.floor_opositeway.url = node.save2[13];
            							self.floor_exit.url = node.save2[14];
            							self.floor_opencurve.url = node.save2[15];
            							self.floor_inside.url = node.save2[16];
            							self.floor_stair.url = node.save2[17];
            							self.wall_cross.url = node.save2[18];
            							self.wall_t.url = node.save2[19];
            							self.wall_line.url = node.save2[20];
            							self.wall_curve.url = node.save2[21];
            							self.wall_deadend.url = node.save2[22];
            							self.wall_pilar.url = node.save2[23];
            							self.trap.url = node.save2[24];
            							self.passage.url = node.save2[25];
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style9') and node.save3~=nil then
            							self.door_light.url = node.save3[1];
            							self.door_heavy.url = node.save3[2];
            							self.floor_deadend.url = node.save3[3];
            							self.floor_line.url = node.save3[4];
            							self.floor_curve.url = node.save3[5];
            							self.floor_tip.url = node.save3[6];
            							self.floor_t.url = node.save3[7];
            							self.floor_coneright.url = node.save3[8];
            							self.floor_coneleft.url = node.save3[9];
            							self.floor_side.url = node.save3[10];
            							self.floor_cross.url = node.save3[11];
            							self.floor_twoway.url = node.save3[12];
            							self.floor_opositeway.url = node.save3[13];
            							self.floor_exit.url = node.save3[14];
            							self.floor_opencurve.url = node.save3[15];
            							self.floor_inside.url = node.save3[16];
            							self.floor_stair.url = node.save3[17];
            							self.wall_cross.url = node.save3[18];
            							self.wall_t.url = node.save3[19];
            							self.wall_line.url = node.save3[20];
            							self.wall_curve.url = node.save3[21];
            							self.wall_deadend.url = node.save3[22];
            							self.wall_pilar.url = node.save3[23];
            							self.trap.url = node.save3[24];
            							self.passage.url = node.save3[25];
            						elseif self.styleOptions.value == lang('scene.generator.tiles.style10') then
            							self.door_light.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.door_heavy.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.trap.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.passage.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_deadend.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_line.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_curve.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_tip.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_t.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_coneright.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_coneleft.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_side.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_cross.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_twoway.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_opositeway.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_exit.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_opencurve.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_inside.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.floor_stair.url = "http://firecast.blob.core.windows.net/blobs/RLCOISRC_331335.png";
            							self.wall_cross.url = "http://firecast.blob.core.windows.net/blobs/BOINHCPW_344827.png";
            							self.wall_t.url = "http://firecast.blob.core.windows.net/blobs/JAFEEKVG_344832.png";
            							self.wall_line.url = "http://firecast.blob.core.windows.net/blobs/BUVMSHJO_344838.png";
            							self.wall_curve.url = "http://firecast.blob.core.windows.net/blobs/QDUISQSL_344829.png";
            							self.wall_deadend.url = "http://firecast.blob.core.windows.net/blobs/ESOQKQNL_344834.png";
            							self.wall_pilar.url = "http://firecast.blob.core.windows.net/blobs/MBSBDVKQ_344836.png";
            						end;
        end, obj);

    obj._e_event3 = obj.saveTile:addEventListener("onChange",
        function (self)
            if self.saveTile.value == "1" then
            							node.save1 = {};
            							node.save1[1] = self.door_light.url;
            							node.save1[2] = self.door_heavy.url;
            							node.save1[3] = self.floor_deadend.url;
            							node.save1[4] = self.floor_line.url;
            							node.save1[5] = self.floor_curve.url;
            							node.save1[6] = self.floor_tip.url;
            							node.save1[7] = self.floor_t.url;
            							node.save1[8] = self.floor_coneright.url;
            							node.save1[9] = self.floor_coneleft.url;
            							node.save1[10] = self.floor_side.url;
            							node.save1[11] = self.floor_cross.url;
            							node.save1[12] = self.floor_twoway.url;
            							node.save1[13] = self.floor_opositeway.url;
            							node.save1[14] = self.floor_exit.url;
            							node.save1[15] = self.floor_opencurve.url;
            							node.save1[16] = self.floor_inside.url;
            							node.save1[17] = self.floor_stair.url;
            							node.save1[18] = self.wall_cross.url;
            							node.save1[19] = self.wall_t.url;
            							node.save1[20] = self.wall_line.url;
            							node.save1[21] = self.wall_curve.url;
            							node.save1[22] = self.wall_deadend.url;
            							node.save1[23] = self.wall_pilar.url;
            							node.save1[24] = self.trap.url;
            							node.save1[25] = self.passage.url;
            						elseif self.saveTile.value == "2" then
            							node.save2 = {};
            							node.save2[1] = self.door_light.url;
            							node.save2[2] = self.door_heavy.url;
            							node.save2[3] = self.floor_deadend.url;
            							node.save2[4] = self.floor_line.url;
            							node.save2[5] = self.floor_curve.url;
            							node.save2[6] = self.floor_tip.url;
            							node.save2[7] = self.floor_t.url;
            							node.save2[8] = self.floor_coneright.url;
            							node.save2[9] = self.floor_coneleft.url;
            							node.save2[10] = self.floor_side.url;
            							node.save2[11] = self.floor_cross.url;
            							node.save2[12] = self.floor_twoway.url;
            							node.save2[13] = self.floor_opositeway.url;
            							node.save2[14] = self.floor_exit.url;
            							node.save2[15] = self.floor_opencurve.url;
            							node.save2[16] = self.floor_inside.url;
            							node.save2[17] = self.floor_stair.url;
            							node.save2[18] = self.wall_cross.url;
            							node.save2[19] = self.wall_t.url;
            							node.save2[20] = self.wall_line.url;
            							node.save2[21] = self.wall_curve.url;
            							node.save2[22] = self.wall_deadend.url;
            							node.save2[23] = self.wall_pilar.url;
            							node.save2[24] = self.trap.url;
            							node.save2[25] = self.passage.url;
            						elseif self.saveTile.value == "3" then
            							node.save3 = {};
            							node.save3[1] = self.door_light.url;
            							node.save3[2] = self.door_heavy.url;
            							node.save3[3] = self.floor_deadend.url;
            							node.save3[4] = self.floor_line.url;
            							node.save3[5] = self.floor_curve.url;
            							node.save3[6] = self.floor_tip.url;
            							node.save3[7] = self.floor_t.url;
            							node.save3[8] = self.floor_coneright.url;
            							node.save3[9] = self.floor_coneleft.url;
            							node.save3[10] = self.floor_side.url;
            							node.save3[11] = self.floor_cross.url;
            							node.save3[12] = self.floor_twoway.url;
            							node.save3[13] = self.floor_opositeway.url;
            							node.save3[14] = self.floor_exit.url;
            							node.save3[15] = self.floor_opencurve.url;
            							node.save3[16] = self.floor_inside.url;
            							node.save3[17] = self.floor_stair.url;
            							node.save3[18] = self.wall_cross.url;
            							node.save3[19] = self.wall_t.url;
            							node.save3[20] = self.wall_line.url;
            							node.save3[21] = self.wall_curve.url;
            							node.save3[22] = self.wall_deadend.url;
            							node.save3[23] = self.wall_pilar.url;
            							node.save3[24] = self.trap.url;
            							node.save3[25] = self.passage.url;
            						end;
        end, obj);

    obj._e_event4 = obj.door_light:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.door_light.url);
        end, obj);

    obj._e_event5 = obj.door_heavy:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.door_heavy.url);
        end, obj);

    obj._e_event6 = obj.trap:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.trap.url);
        end, obj);

    obj._e_event7 = obj.passage:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.passage.url);
        end, obj);

    obj._e_event8 = obj.floor_deadend:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_deadend.url);
        end, obj);

    obj._e_event9 = obj.floor_line:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_line.url);
        end, obj);

    obj._e_event10 = obj.floor_curve:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_curve.url);
        end, obj);

    obj._e_event11 = obj.floor_tip:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_tip.url);
        end, obj);

    obj._e_event12 = obj.floor_t:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_t.url);
        end, obj);

    obj._e_event13 = obj.floor_coneright:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_coneright.url);
        end, obj);

    obj._e_event14 = obj.floor_coneleft:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_coneleft.url);
        end, obj);

    obj._e_event15 = obj.floor_side:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_side.url);
        end, obj);

    obj._e_event16 = obj.floor_cross:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_cross.url);
        end, obj);

    obj._e_event17 = obj.floor_twoway:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_twoway.url);
        end, obj);

    obj._e_event18 = obj.floor_opositeway:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_opositeway.url);
        end, obj);

    obj._e_event19 = obj.floor_exit:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_exit.url);
        end, obj);

    obj._e_event20 = obj.floor_opencurve:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_opencurve.url);
        end, obj);

    obj._e_event21 = obj.floor_inside:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_inside.url);
        end, obj);

    obj._e_event22 = obj.floor_stair:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.floor_stair.url);
        end, obj);

    obj._e_event23 = obj.wall_cross:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.wall_cross.url);
        end, obj);

    obj._e_event24 = obj.wall_t:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.wall_t.url);
        end, obj);

    obj._e_event25 = obj.wall_line:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.wall_line.url);
        end, obj);

    obj._e_event26 = obj.wall_curve:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.wall_curve.url);
        end, obj);

    obj._e_event27 = obj.wall_deadend:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.wall_deadend.url);
        end, obj);

    obj._e_event28 = obj.wall_pilar:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.wall_pilar.url);
        end, obj);

    obj._e_event29 = obj.btnOk1:addEventListener("onClick",
        function (self)
            self:processarOK()
        end, obj);

    obj._e_event30 = obj.btnCancel1:addEventListener("onClick",
        function (self)
            self:processarCancel()
        end, obj);

    function obj:_releaseEvents()
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

        if self.thick ~= nil then self.thick:destroy(); self.thick = nil; end;
        if self.tiles2 ~= nil then self.tiles2:destroy(); self.tiles2 = nil; end;
        if self.floor_twoway ~= nil then self.floor_twoway:destroy(); self.floor_twoway = nil; end;
        if self.btnCancel1 ~= nil then self.btnCancel1:destroy(); self.btnCancel1 = nil; end;
        if self.floor_cross ~= nil then self.floor_cross:destroy(); self.floor_cross = nil; end;
        if self.thickness ~= nil then self.thickness:destroy(); self.thickness = nil; end;
        if self.saveTile ~= nil then self.saveTile:destroy(); self.saveTile = nil; end;
        if self.tabName ~= nil then self.tabName:destroy(); self.tabName = nil; end;
        if self.style ~= nil then self.style:destroy(); self.style = nil; end;
        if self.wall_line ~= nil then self.wall_line:destroy(); self.wall_line = nil; end;
        if self.passage ~= nil then self.passage:destroy(); self.passage = nil; end;
        if self.floor_curve ~= nil then self.floor_curve:destroy(); self.floor_curve = nil; end;
        if self.door_light ~= nil then self.door_light:destroy(); self.door_light = nil; end;
        if self.armadilhasText ~= nil then self.armadilhasText:destroy(); self.armadilhasText = nil; end;
        if self.becosText ~= nil then self.becosText:destroy(); self.becosText = nil; end;
        if self.wall_t ~= nil then self.wall_t:destroy(); self.wall_t = nil; end;
        if self.wall_pilar ~= nil then self.wall_pilar:destroy(); self.wall_pilar = nil; end;
        if self.escadas ~= nil then self.escadas:destroy(); self.escadas = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.floor_deadend ~= nil then self.floor_deadend:destroy(); self.floor_deadend = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.floor_inside ~= nil then self.floor_inside:destroy(); self.floor_inside = nil; end;
        if self.natural ~= nil then self.natural:destroy(); self.natural = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.floor_coneleft ~= nil then self.floor_coneleft:destroy(); self.floor_coneleft = nil; end;
        if self.floor_line ~= nil then self.floor_line:destroy(); self.floor_line = nil; end;
        if self.door_heavy ~= nil then self.door_heavy:destroy(); self.door_heavy = nil; end;
        if self.floor_t ~= nil then self.floor_t:destroy(); self.floor_t = nil; end;
        if self.becos ~= nil then self.becos:destroy(); self.becos = nil; end;
        if self.tiles3 ~= nil then self.tiles3:destroy(); self.tiles3 = nil; end;
        if self.salasText ~= nil then self.salasText:destroy(); self.salasText = nil; end;
        if self.tamMax ~= nil then self.tamMax:destroy(); self.tamMax = nil; end;
        if self.escadasText ~= nil then self.escadasText:destroy(); self.escadasText = nil; end;
        if self.armadilhas ~= nil then self.armadilhas:destroy(); self.armadilhas = nil; end;
        if self.tamMinText ~= nil then self.tamMinText:destroy(); self.tamMinText = nil; end;
        if self.trap ~= nil then self.trap:destroy(); self.trap = nil; end;
        if self.tamMin ~= nil then self.tamMin:destroy(); self.tamMin = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.floor_side ~= nil then self.floor_side:destroy(); self.floor_side = nil; end;
        if self.tamMaxText ~= nil then self.tamMaxText:destroy(); self.tamMaxText = nil; end;
        if self.floor_stair ~= nil then self.floor_stair:destroy(); self.floor_stair = nil; end;
        if self.passagensText ~= nil then self.passagensText:destroy(); self.passagensText = nil; end;
        if self.floor_coneright ~= nil then self.floor_coneright:destroy(); self.floor_coneright = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.tabTiles ~= nil then self.tabTiles:destroy(); self.tabTiles = nil; end;
        if self.tiles1 ~= nil then self.tiles1:destroy(); self.tiles1 = nil; end;
        if self.saves ~= nil then self.saves:destroy(); self.saves = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.wall_curve ~= nil then self.wall_curve:destroy(); self.wall_curve = nil; end;
        if self.tabOptions ~= nil then self.tabOptions:destroy(); self.tabOptions = nil; end;
        if self.floor_opositeway ~= nil then self.floor_opositeway:destroy(); self.floor_opositeway = nil; end;
        if self.floor_opencurve ~= nil then self.floor_opencurve:destroy(); self.floor_opencurve = nil; end;
        if self.wall_cross ~= nil then self.wall_cross:destroy(); self.wall_cross = nil; end;
        if self.floor_exit ~= nil then self.floor_exit:destroy(); self.floor_exit = nil; end;
        if self.entradasText ~= nil then self.entradasText:destroy(); self.entradasText = nil; end;
        if self.passagens ~= nil then self.passagens:destroy(); self.passagens = nil; end;
        if self.btnOk1 ~= nil then self.btnOk1:destroy(); self.btnOk1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.salas ~= nil then self.salas:destroy(); self.salas = nil; end;
        if self.styleOptions ~= nil then self.styleOptions:destroy(); self.styleOptions = nil; end;
        if self.wall_deadend ~= nil then self.wall_deadend:destroy(); self.wall_deadend = nil; end;
        if self.floor_tip ~= nil then self.floor_tip:destroy(); self.floor_tip = nil; end;
        if self.entradas ~= nil then self.entradas:destroy(); self.entradas = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGeneratorOptions = {
    newEditor = newfrmGeneratorOptions, 
    new = newfrmGeneratorOptions, 
    name = "frmGeneratorOptions", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmGeneratorOptions = _frmGeneratorOptions;
rrpg.registrarForm(_frmGeneratorOptions);

return _frmGeneratorOptions;
