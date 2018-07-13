require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmNodePermissions()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmNodePermissions");
    obj:setWidth(400);
    obj:setHeight(280);
    obj:setTitle("Node Explorer");
    obj:setTheme("dark");
    obj:setResizable(true);


		local ndb = require("ndb.lua");	
		local ndbTemporario = ndb.newMemNodeDatabase();
	
		local nodeRaiz; -- Node raiz que o usuario pediu para editar
		local node = nil; -- Node Atual que o usuario está editando
		local currentChildNodes = {}; -- Array com os child nodes do node atual

		local depth = 0;	
		
		if sheet~=nil and node==nil then
			node = sheet;
		end;

		local trPermissions = nil;

		local permission_list = {"read", "write", "createChild", "delete", "readPermissions", "writePermissions", "writeMetaPermissions"};

		local function refreshScreen()
			if node==nil then
				node = nodeRaiz;
			end;
			
			if sheet.selKind=="user" then
				self.edit_login.visible = true;
				self.comboBox_selId.visible = false;

				for i=1, 7 do
					local perm =  ndb.getPermission(node, "user", sheet.login, permission_list[i]);
					sheet[permission_list[i]] = perm;
				end;
			elseif sheet.selKind=="group" then
				self.edit_login.visible = false;
				self.comboBox_selId.visible = true;

				for i=1, 7 do
					local perm =  ndb.getPermission(node, "group", sheet.selId, permission_list[i]);
					sheet[permission_list[i]] = perm;
				end;
			end;
		end;

		local function refreshList()
			if node==nil then
				node = nodeRaiz;
			end;
			
			local list = ndb.getChildNodes(sheet.childs);
			for i=1, #list do
				if ndb.isNodeObject(list[i]) then
					ndb.deleteNode(list[i]);
				end;
			end;
			
			local newChilds = {};
			
			for i = 1, #currentChildNodes, 1 do
				local childInfo = {};
				childInfo.child_name = ndb.getNodeName(currentChildNodes[i]);
				childInfo.num = i;
				newChilds[i] = childInfo;
			end;
			
			sheet.childs = newChilds;

			local novoAddress = nil;
			local addrNode = node;
			local depthAlcancado = 0;
			
			while addrNode ~= nil do
				if depthAlcancado >= 4 then
					novoAddress = "(..) > " .. novoAddress;
					break;
				end;
			
				if depthAlcancado == 0 then
					novoAddress = ndb.getNodeName(addrNode);
				else
					novoAddress = ndb.getNodeName(addrNode) .. " > " .. novoAddress;
				end;
				
				depthAlcancado = depthAlcancado + 1;
				
				if addrNode ~= nodeRaiz then
					addrNode = ndb.getParent(addrNode);			
				else
					addrNode = nil;
				end;
			end;
			
			sheet.address = novoAddress;
		end;
		
		local function gotoNode(n)
			node = n;
			currentChildNodes = ndb.getChildNodes(n);
			
			table.sort(currentChildNodes,
				function(left, right)
					return Utils.compareStringPtBr(ndb.getNodeName(left), ndb.getNodeName(right)) < 0;
				end);
			
			refreshList();			
		end;
		
		
		
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(105);
    obj.button1:setHeight(25);
    obj.button1:setText("Raiz");
    obj.button1:setName("button1");

    obj.button_father = GUI.fromHandle(_obj_newObject("button"));
    obj.button_father:setParent(obj.scrollBox1);
    obj.button_father:setLeft(5);
    obj.button_father:setTop(35);
    obj.button_father:setWidth(105);
    obj.button_father:setHeight(25);
    obj.button_father:setText("Voltar");
    obj.button_father:setName("button_father");
    obj.button_father:setVisible(false);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(5);
    obj.rectangle1:setTop(65);
    obj.rectangle1:setWidth(105);
    obj.rectangle1:setHeight(210);
    obj.rectangle1:setColor("#404040");
    obj.rectangle1:setName("rectangle1");

    obj.rclChilds = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclChilds:setParent(obj.scrollBox1);
    obj.rclChilds:setName("rclChilds");
    obj.rclChilds:setField("childs");
    obj.rclChilds:setTemplateForm("frmChildNodePerms");
    obj.rclChilds:setLeft(5);
    obj.rclChilds:setTop(65);
    obj.rclChilds:setWidth(105);
    obj.rclChilds:setHeight(210);
    obj.rclChilds:setSelectable(true);
    obj.rclChilds:setHitTest(true);
    obj.rclChilds:setCursor("handPoint");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(115);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(1);
    obj.rectangle2:setHeight(270);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(120);
    obj.label1:setTop(5);
    obj.label1:setWidth(270);
    obj.label1:setHeight(25);
    obj.label1:setField("address");
    obj.label1:setTextTrimming("character");
    obj.label1:setName("label1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox1);
    obj.comboBox1:setLeft(120);
    obj.comboBox1:setTop(35);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setItems({'Usuário', 'Grupo'});
    obj.comboBox1:setValues({'user', 'group'});
    obj.comboBox1:setField("selKind");
    obj.comboBox1:setName("comboBox1");

    obj.edit_login = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit_login:setParent(obj.scrollBox1);
    obj.edit_login:setLeft(225);
    obj.edit_login:setTop(35);
    obj.edit_login:setWidth(170);
    obj.edit_login:setHeight(25);
    obj.edit_login:setField("login");
    obj.edit_login:setName("edit_login");
    obj.edit_login:setVisible(false);

    obj.comboBox_selId = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox_selId:setParent(obj.scrollBox1);
    obj.comboBox_selId:setLeft(225);
    obj.comboBox_selId:setTop(35);
    obj.comboBox_selId:setWidth(170);
    obj.comboBox_selId:setHeight(25);
    obj.comboBox_selId:setItems({'Todos', 'Mestres Auxiliares', 'Mestres', 'Jogadores', 'Espectadores', 'Criador da Mesa', 'Criador', 'Dono', 'Cegos', 'Mudos', 'Com Voz'});
    obj.comboBox_selId:setValues({'todos', 'mestresAux', 'mestres', 'jogadores', 'espectadores', 'criadorDaMesa', 'criador', 'dono', 'cegos', 'mudos', 'voices'});
    obj.comboBox_selId:setField("selId");
    obj.comboBox_selId:setName("comboBox_selId");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("selId");
    obj.dataLink1:setDefaultValue("jogadores");
    obj.dataLink1:setName("dataLink1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.scrollBox1);
    obj.horzLine1:setLeft(125);
    obj.horzLine1:setTop(65);
    obj.horzLine1:setWidth(270);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(125);
    obj.label2:setTop(70);
    obj.label2:setWidth(95);
    obj.label2:setHeight(25);
    obj.label2:setText("Visualizar");
    obj.label2:setHitTest(true);
    obj.label2:setHint("Indica se o usuario/grupo pode visualizar os dados desse objeto.");
    obj.label2:setName("label2");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.scrollBox1);
    obj.comboBox2:setLeft(225);
    obj.comboBox2:setTop(70);
    obj.comboBox2:setWidth(170);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setItems({'Permitido', 'Negado', 'Fortemente Permitido', 'Indefinido'});
    obj.comboBox2:setValues({'allow', 'deny', 'strongAllow', ''});
    obj.comboBox2:setField("read");
    obj.comboBox2:setName("comboBox2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(125);
    obj.label3:setTop(95);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("Modificar");
    obj.label3:setHitTest(true);
    obj.label3:setHint("Indica se o usuario/grupo pode modificar informação armazenada nesse objeto.");
    obj.label3:setName("label3");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.scrollBox1);
    obj.comboBox3:setLeft(225);
    obj.comboBox3:setTop(95);
    obj.comboBox3:setWidth(170);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setItems({'Permitido', 'Negado', 'Fortemente Permitido', 'Indefinido'});
    obj.comboBox3:setValues({'allow', 'deny', 'strongAllow', ''});
    obj.comboBox3:setField("write");
    obj.comboBox3:setName("comboBox3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(125);
    obj.label4:setTop(120);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("Expandir");
    obj.label4:setHitTest(true);
    obj.label4:setHint("Indica se o usuario/grupo pode adicionar objetos filhos a esse objeto.");
    obj.label4:setName("label4");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.scrollBox1);
    obj.comboBox4:setLeft(225);
    obj.comboBox4:setTop(120);
    obj.comboBox4:setWidth(170);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setItems({'Permitido', 'Negado', 'Fortemente Permitido', 'Indefinido'});
    obj.comboBox4:setValues({'allow', 'deny', 'strongAllow', ''});
    obj.comboBox4:setField("createChild");
    obj.comboBox4:setName("comboBox4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(125);
    obj.label5:setTop(145);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("Apagar");
    obj.label5:setHitTest(true);
    obj.label5:setHint("Indica se o usuario/grupo pode apagar esse objeto do banco de dados.");
    obj.label5:setName("label5");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.scrollBox1);
    obj.comboBox5:setLeft(225);
    obj.comboBox5:setTop(145);
    obj.comboBox5:setWidth(170);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setItems({'Permitido', 'Negado', 'Fortemente Permitido', 'Indefinido'});
    obj.comboBox5:setValues({'allow', 'deny', 'strongAllow', ''});
    obj.comboBox5:setField("delete");
    obj.comboBox5:setName("comboBox5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox1);
    obj.label6:setLeft(125);
    obj.label6:setTop(170);
    obj.label6:setWidth(100);
    obj.label6:setHeight(25);
    obj.label6:setText("Ler Permissões");
    obj.label6:setHitTest(true);
    obj.label6:setHint("Indica se o usuario/grupo pode ver as permissões de visualização, modificação, expansão e de apagar.");
    obj.label6:setName("label6");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.scrollBox1);
    obj.comboBox6:setLeft(225);
    obj.comboBox6:setTop(170);
    obj.comboBox6:setWidth(170);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setItems({'Permitido', 'Negado', 'Fortemente Permitido', 'Indefinido'});
    obj.comboBox6:setValues({'allow', 'deny', 'strongAllow', ''});
    obj.comboBox6:setField("readPermissions");
    obj.comboBox6:setName("comboBox6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.scrollBox1);
    obj.label7:setLeft(125);
    obj.label7:setTop(195);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setText("Dar Permissões");
    obj.label7:setHitTest(true);
    obj.label7:setHint("Indica se o usuario/grupo pode dar permissões de visualização, modificação, expansão e de apagar.");
    obj.label7:setName("label7");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.scrollBox1);
    obj.comboBox7:setLeft(225);
    obj.comboBox7:setTop(195);
    obj.comboBox7:setWidth(170);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setItems({'Permitido', 'Negado', 'Fortemente Permitido', 'Indefinido'});
    obj.comboBox7:setValues({'allow', 'deny', 'strongAllow', ''});
    obj.comboBox7:setField("writePermissions");
    obj.comboBox7:setName("comboBox7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.scrollBox1);
    obj.label8:setLeft(125);
    obj.label8:setTop(220);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setText("META Permissões");
    obj.label8:setFontSize(12);
    obj.label8:setHitTest(true);
    obj.label8:setHint("Indica se o usuario/grupo pode definir quem pode dar permissões de dar permissões e ler permissões.");
    obj.label8:setName("label8");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.scrollBox1);
    obj.comboBox8:setLeft(225);
    obj.comboBox8:setTop(220);
    obj.comboBox8:setWidth(170);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setItems({'Permitido', 'Negado', 'Fortemente Permitido', 'Indefinido'});
    obj.comboBox8:setValues({'allow', 'deny', 'strongAllow', ''});
    obj.comboBox8:setField("writeMetaPermissions");
    obj.comboBox8:setName("comboBox8");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(125);
    obj.button2:setTop(250);
    obj.button2:setWidth(80);
    obj.button2:setHeight(25);
    obj.button2:setText("Desfazer");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(215);
    obj.button3:setTop(250);
    obj.button3:setWidth(80);
    obj.button3:setHeight(25);
    obj.button3:setText("Salvar");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(305);
    obj.button4:setTop(250);
    obj.button4:setWidth(80);
    obj.button4:setHeight(25);
    obj.button4:setText("Ajuda");
    obj.button4:setName("button4");


		function self:editar(ONodeRaiz) 
			nodeRaiz = ONodeRaiz;
			self:setNodeObject(ndbTemporario);
			self:show();
		end;
	


    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            if sheet ~= nil then
            			trPermissions = ndb.newTransaction(nodeRaiz);
            			node = nodeRaiz;
            
            			sheet.address = "Raiz";
            			depth = 0;
            
            			sheet.selKind = "group";
            			sheet.selId = "jogadores";
            
            			for i=1, 7 do
            				local perm =  ndb.getPermission(node, "group", sheet.selId, permission_list[i]);
            				sheet[permission_list[i]] = perm;
            			end;
            
            			if ndb.getState(node) == "opening" then
            				self:lockWithActivity("Carregando...");
            			
            				self.nodeObserver = ndb.newObserver(node);
            				self.nodeObserver.onStateChanged = 
            					function (theNode)
            						if ndb.getState(node) ~= "opening" then
            							self:unlockWithActivity();
            							gotoNode(nodeRaiz);
            							self.nodeObserver = nil;
            						end;						
            					end;
            			else
            				gotoNode(nodeRaiz);
            			end					
            		end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onHide",
        function (_)
            if sheet ~= nil then
            			trPermissions:rollback();
            		end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet~= nil then
            					gotoNode(nodeRaiz)
            					depth = 0;
            					self.button_father.visible = false;
            					refreshScreen();
            				end;
        end, obj);

    obj._e_event3 = obj.button_father:addEventListener("onClick",
        function (_)
            if sheet~= nil then
            					local nodePai;
            				
            					if depth > 1 then
            						nodePai = ndb.getParent(node);
            					else
            						nodePai = nodeRaiz;
            					end;
            					
            					depth = depth - 1;
            					
            					if depth==0 then
            						self.button_father.visible = false;
            					end;
            
            					gotoNode(nodePai);
            					refreshScreen();
            				end;
        end, obj);

    obj._e_event4 = obj.rclChilds:addEventListener("onSelect",
        function (_)
            if sheet~= nil and self.rclChilds.selectedNode~=nil then
            					if node==nil then
            						node = nodeRaiz;
            					end;
            
            					local novoNode = currentChildNodes[self.rclChilds.selectedNode.num];
            					
            					if depth == nil then
            						depth = 1;
            					else 
            						depth = depth+1;
            					end;
            
            					gotoNode(novoNode);
            					refreshScreen();					
            					self.button_father.visible = true;
            				end;
        end, obj);

    obj._e_event5 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					refreshScreen();
            				end;
        end, obj);

    obj._e_event6 = obj.edit_login:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					if node==nil then
            						node = sheet;
            					end;
            					
            					for i=1, 7 do
            						local perm =  ndb.getPermission(node, "user", sheet.login, permission_list[i]);
            						sheet[permission_list[i]] = perm;
            					end;
            				end;
        end, obj);

    obj._e_event7 = obj.comboBox_selId:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selId == nil then
            						sheet.selId="jogadores";
            					end;
            					for i=1, 7 do
            						local perm =  ndb.getPermission(node, "group", sheet.selId, permission_list[i]);
            						sheet[permission_list[i]] = perm;
            					end;
            				end;
        end, obj);

    obj._e_event8 = obj.comboBox2:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					ndb.pushTransaction(nodeRaiz, trPermissions);
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selKind=="user" then
            						ndb.setPermission(node, "user", sheet.login, "read", sheet.read);
            					elseif sheet.selKind=="group" then
            						ndb.setPermission(node, "group", sheet.selId, "read", sheet.read);
            					end;
            					ndb.popTransaction(nodeRaiz);
            				end;
        end, obj);

    obj._e_event9 = obj.comboBox3:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					ndb.pushTransaction(nodeRaiz, trPermissions);
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selKind=="user" then
            						ndb.setPermission(node, "user", sheet.login, "write", sheet.write);
            					elseif sheet.selKind=="group" then
            						ndb.setPermission(node, "group", sheet.selId, "write", sheet.write);
            					end;
            					ndb.popTransaction(nodeRaiz);
            				end;
        end, obj);

    obj._e_event10 = obj.comboBox4:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					ndb.pushTransaction(nodeRaiz, trPermissions);
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selKind=="user" then
            						ndb.setPermission(node, "user", sheet.login, "createChild", sheet.createChild);
            					elseif sheet.selKind=="group" then
            						ndb.setPermission(node, "group", sheet.selId, "createChild", sheet.createChild);
            					end;
            					ndb.popTransaction(nodeRaiz);
            				end;
        end, obj);

    obj._e_event11 = obj.comboBox5:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					ndb.pushTransaction(nodeRaiz, trPermissions);
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selKind=="user" then
            						ndb.setPermission(node, "user", sheet.login, "delete", sheet.delete);
            					elseif sheet.selKind=="group" then
            						ndb.setPermission(node, "group", sheet.selId, "delete", sheet.delete);
            					end;
            					ndb.popTransaction(nodeRaiz);
            				end;
        end, obj);

    obj._e_event12 = obj.comboBox6:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					ndb.pushTransaction(nodeRaiz, trPermissions);
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selKind=="user" then
            						ndb.setPermission(node, "user", sheet.login, "readPermissions", sheet.readPermissions);
            					elseif sheet.selKind=="group" then
            						ndb.setPermission(node, "group", sheet.selId, "readPermissions", sheet.readPermissions);
            					end;
            					ndb.popTransaction(nodeRaiz);
            				end;
        end, obj);

    obj._e_event13 = obj.comboBox7:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					ndb.pushTransaction(nodeRaiz, trPermissions);
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selKind=="user" then
            						ndb.setPermission(node, "user", sheet.login, "writePermissions", sheet.writePermissions);
            					elseif sheet.selKind=="group" then
            						ndb.setPermission(node, "group", sheet.selId, "writePermissions", sheet.writePermissions);
            					end;
            					ndb.popTransaction(nodeRaiz);
            				end;
        end, obj);

    obj._e_event14 = obj.comboBox8:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					ndb.pushTransaction(nodeRaiz, trPermissions);
            					if node==nil then
            						node = sheet;
            					end;
            					if sheet.selKind=="user" then
            						ndb.setPermission(node, "user", sheet.login, "writeMetaPermissions", sheet.writeMetaPermissions);
            					elseif sheet.selKind=="group" then
            						ndb.setPermission(node, "group", sheet.selId, "writeMetaPermissions", sheet.writeMetaPermissions);
            					end;
            					ndb.popTransaction(nodeRaiz);
            				end;
        end, obj);

    obj._e_event15 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet~= nil then
            					Dialogs.confirmOkCancel("Tem certeza que deseja desfazer as alterações?",
            						function (confirmado)
            							if confirmado then
            								trPermissions:rollback();
            								refreshScreen();
            							end;
            					end);
            				end;
        end, obj);

    obj._e_event16 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet~= nil then
            					Dialogs.confirmOkCancel("Tem certeza que deseja salvar as alterações?",
            						function (confirmado)
            							if confirmado then
            								trPermissions:commit();
            							end;
            					end);
            				end;
        end, obj);

    obj._e_event17 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet~= nil then
            					GUI.openInBrowser('http://wiki.rrpg.com.br/index.php?title=Editor_de_Permiss%C3%B5es_de_Node');
            				end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.comboBox_selId ~= nil then self.comboBox_selId:destroy(); self.comboBox_selId = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.rclChilds ~= nil then self.rclChilds:destroy(); self.rclChilds = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button_father ~= nil then self.button_father:destroy(); self.button_father = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit_login ~= nil then self.edit_login:destroy(); self.edit_login = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmNodePermissions = {
    newEditor = newfrmNodePermissions, 
    new = newfrmNodePermissions, 
    name = "frmNodePermissions", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Node Explorer", 
    description=""};

frmNodePermissions = _frmNodePermissions;
Firecast.registrarForm(_frmNodePermissions);

return _frmNodePermissions;
