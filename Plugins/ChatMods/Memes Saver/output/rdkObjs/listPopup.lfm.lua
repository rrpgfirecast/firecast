require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_listPopup()
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
    obj:setName("listPopup");
    obj:setFormType("undefined");
    obj:setDataType("ambesek.memesaver");
    obj:setTitle("MemeSaver");
    obj:setWidth(500);
    obj:setHeight(325);

    obj.memeList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.memeList:setParent(obj);
    obj.memeList:setLeft(0);
    obj.memeList:setTop(0);
    obj.memeList:setWidth(200);
    obj.memeList:setHeight(300);
    obj.memeList:setField("memeList");
    obj.memeList:setName("memeList");
    obj.memeList:setTemplateForm("frmMemeItem");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(0);
    obj.button1:setTop(300);
    obj.button1:setWidth(100);
    obj.button1:setHeight(25);
    obj.button1:setText("Novo");
    obj.button1:setHint("Cria novo meme");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(100);
    obj.button2:setTop(300);
    obj.button2:setWidth(100);
    obj.button2:setHeight(25);
    obj.button2:setText("Adicionar");
    obj.button2:setHint("adiciona novo atalho ao meme selecionado");
    obj.button2:setName("button2");

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj);
    obj.boxDetalhesDoItem:setLeft(200);
    obj.boxDetalhesDoItem:setTop(0);
    obj.boxDetalhesDoItem:setWidth(300);
    obj.boxDetalhesDoItem:setHeight(300);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.boxDetalhesDoItem);
    obj.image1:setAlign("client");
    obj.image1:setEditable(false);
    obj.image1:setField("meme");
    obj.image1:setName("image1");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(200);
    obj.button3:setTop(300);
    obj.button3:setWidth(150);
    obj.button3:setHeight(25);
    obj.button3:setText("Alterar");
    obj.button3:setHint("troca o url do meme");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setLeft(350);
    obj.button4:setTop(300);
    obj.button4:setWidth(150);
    obj.button4:setHeight(25);
    obj.button4:setText("Excluir");
    obj.button4:setHint("remove o meme");
    obj.button4:setName("button4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("load");
    obj.dataLink1:setName("dataLink1");

    obj.refresh = GUI.fromHandle(_obj_newObject("button"));
    obj.refresh:setParent(obj);
    obj.refresh:setLeft(0);
    obj.refresh:setTop(0);
    obj.refresh:setWidth(500);
    obj.refresh:setHeight(325);
    obj.refresh:setText("Recarregar");
    obj.refresh:setHint("tenta recarregar os memes");
    obj.refresh:setVisible(false);
    obj.refresh:setName("refresh");

    obj._e_event0 = obj.memeList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.nome and nodeB.nome then 
            				return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
            			elseif nodeA.nome then
            				return 1;
            			elseif nodeB.nome then
            				return -1;
            			end;
        end, obj);

    obj._e_event1 = obj.memeList:addEventListener("onSelect",
        function (_)
            local node = self.memeList.selectedNode;  
                        self.boxDetalhesDoItem.node = node;                       
                    
                    	self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.inputQuery("Adiciona novo meme", "Informe o atalho", "",
            				function (atalho)
            				    Dialogs.selectImageURL("",
            				        function (url)
            				        	sheet.link[atalho] = url;
            				        	
            							local item = self.memeList:append();
            							if item ~= nil then
            								item.nome = atalho;
            								item.meme = url;
            							end;
            
            							self.memeList:sort();
            				        end);
            					end);
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            local node = self.memeList.selectedNode; 
            			if node==nil then return end;
            
            			Dialogs.inputQuery("Adiciona novo atalho", "Informe o novo atalho", "",
            				function (atalho)
            				    node.nome = node.nome .. ", " .. atalho;
            				    sheet.link[atalho] = node.meme;
            				end);
        end, obj);

    obj._e_event4 = obj.image1:addEventListener("onLoad",
        function (_)
            --showMessage("onload");
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            local node = self.memeList.selectedNode; 
            			if node==nil then return end;
            
            			Dialogs.selectImageURL("",
            		        function (url)
            		        	node.meme = url;
            		            for i in string.gmatch(node.nome, "[^,%s]+") do
            						sheet.link[i] = url;
            					end;
            		        end);
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            local node = self.memeList.selectedNode; 
            			if node==nil then return end;
            
            			Dialogs.confirmOkCancel("Tem certeza que quer apagar esse meme?",
            					function (confirmado)
            						if confirmado then
            							-- Quebra os parametros nas virgulas e nos espaços
            							for i in string.gmatch(node.nome, "[^,%s]+") do
            								sheet.link[i] = nil;
            							end;
            							NDB.deleteNode(node);
            						end;
            				end);
        end, obj);

    obj._e_event7 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			if sheet.load then
            				sheet.load = false;
            
            				local nodes = NDB.getChildNodes(sheet.memeList); 
            				for i=1, #nodes, 1 do
            					NDB.deleteNode(nodes[i]);
            				end
            
            				local list = {};
            				-- concatena palavras associadas ao mesmo url
            				for k,v in pairs(memedb.link) do
            			        if list[dump(v)] == nil then
            			        	list[dump(v)] = "" .. k;
            			        else
            			        	list[dump(v)] = list[dump(v)] .. ", " .. k;
            			        end
            			    end
            
            			    for k,v in pairs(list) do
            					local item = self.memeList:append();
            					if item ~= nil then
            						item.nome = dump(v);
            						item.meme = k;
            					else
            						-- try again
            						self.refresh.visible = true;
            					end;
            				end;
            
            				self.memeList:sort();
            			end;
        end, obj);

    obj._e_event8 = obj.refresh:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            			self.refresh.visible = false;
            			sheet.load = true;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.refresh ~= nil then self.refresh:destroy(); self.refresh = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.memeList ~= nil then self.memeList:destroy(); self.memeList = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newlistPopup()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_listPopup();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _listPopup = {
    newEditor = newlistPopup, 
    new = newlistPopup, 
    name = "listPopup", 
    dataType = "ambesek.memesaver", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "MemeSaver", 
    description=""};

listPopup = _listPopup;
Firecast.registrarForm(_listPopup);
Firecast.registrarDataType(_listPopup);

return _listPopup;
