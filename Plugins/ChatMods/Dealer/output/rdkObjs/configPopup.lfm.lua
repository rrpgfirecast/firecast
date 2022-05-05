require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_dealerPopup()
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
    obj:setName("dealerPopup");
    obj:setFormType("undefined");
    obj:setDataType("ambesek.dealer");
    obj:setTitle("Dealer");
    obj:setWidth(315);
    obj:setHeight(500);


		local function AddCards(deck, num, owner, url)
			local num = tonumber(num) or 0
			for i=1,num,1 do
				local item = self.deckList:append()
				if item ~= nil then
					item.location = owner
					item.card = deck[i] or "UnamedCard"
					item.user = true;
					if url ~= nil then item.url = url[deck[i]] end;
				end
			end
		end
	


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Opções");
    obj.tab1:setName("tab1");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.tab1);
    obj.checkBox1:setField("botEnabled");
    obj.checkBox1:setLeft(10);
    obj.checkBox1:setTop(10);
    obj.checkBox1:setWidth(270);
    obj.checkBox1:setText("Habilitar Dealer");
    obj.checkBox1:setName("checkBox1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.tab1);
    obj.label1:setLeft(10);
    obj.label1:setTop(40);
    obj.label1:setWidth(65);
    obj.label1:setText("Cartas: ");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.tab1);
    obj.label2:setLeft(80);
    obj.label2:setTop(40);
    obj.label2:setWidth(65);
    obj.label2:setField("numCards");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.tab1);
    obj.label3:setLeft(145);
    obj.label3:setTop(40);
    obj.label3:setWidth(65);
    obj.label3:setText("Descarte: ");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.tab1);
    obj.label4:setLeft(215);
    obj.label4:setTop(40);
    obj.label4:setWidth(65);
    obj.label4:setField("numDiscard");
    obj.label4:setName("label4");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Deck");
    obj.tab2:setName("tab2");

    obj.deckList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.deckList:setParent(obj.tab2);
    obj.deckList:setAlign("client");
    obj.deckList:setMargins({left=5,right=5,top=5,bottom=5});
    obj.deckList:setField("deckList");
    obj.deckList:setName("deckList");
    obj.deckList:setTemplateForm("frmDeckItem");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Log");
    obj.tab3:setName("tab3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.tab3);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.textEditor1:setField("log");
    obj.textEditor1:setName("textEditor1");

    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            if sheet==nil then return end
            
            		local nodes = NDB.getChildNodes(sheet.deckList) 
            		for i=1, #nodes, 1 do
            			NDB.deleteNode(nodes[i])
            		end
            
            		local item = self.deckList:append()
            
            		AddCards(sheet.deck,sheet.numCards,"Deck", sheet.deckURL);
            		AddCards(sheet.discard,sheet.numDiscard,"Discard", sheet.deckURL);
            
            		for k,v in pairs(sheet.players) do
            			AddCards(sheet.players[k], sheet.hands[k], k, sheet.deckURL)
            		end;
        end, obj);

    obj._e_event1 = obj.deckList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.user and not nodeB.user then
            						return 1
            					elseif nodeB.user and not nodeA.user then
            						return -1
            					end
            
            					local location = Utils.compareStringPtBr(nodeA.location, nodeB.location)
            					local card = Utils.compareStringPtBr(nodeA.card, nodeB.card)
            					
            					if location ~= 0 then
            						return location
            					end
            					return card
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

        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.deckList ~= nil then self.deckList:destroy(); self.deckList = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newdealerPopup()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_dealerPopup();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _dealerPopup = {
    newEditor = newdealerPopup, 
    new = newdealerPopup, 
    name = "dealerPopup", 
    dataType = "ambesek.dealer", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Dealer", 
    description=""};

dealerPopup = _dealerPopup;
Firecast.registrarForm(_dealerPopup);
Firecast.registrarDataType(_dealerPopup);

return _dealerPopup;
