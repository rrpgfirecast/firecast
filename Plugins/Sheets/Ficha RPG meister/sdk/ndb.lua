local objs = require("rrpgObjs.lua");
local vhd = require("vhd");
require("utils.lua");
ndb = {}
NDB = ndb;

local localNDB = {};


local _localOpenNDBs = {}
setmetatable(_localOpenNDBs, objs.weakMetatable);


function localNDB.ndbFromHandle(handle)
	local ctrl;

	if handle ~= nil then
		ctrl = objs.tryFindFromHandle(handle);
		
		if ctrl ~= nil then
			return ctrl;
		end;
	else
		return nil;
	end;

	ctrl = objs.objectFromHandle(handle);
	ctrl.__dbFlag = true;
	
	objs.registerHandle(handle, ctrl);	
	return ctrl;
end;

function localNDB.nodeFromHandle(nodeHandle)
	local ctrl;

	if nodeHandle == nil then
		return nil;
	end;
	
	ctrl = objs.tryFindFromHandle(nodeHandle);
	
	if ctrl ~= nil then
		return ctrl;
	end;
	
	ctrl = objs.objectFromHandle(nodeHandle);
	ctrl.__nodeFlag = true;	
	ctrl.__nodeDatabase = localNDB.ndbFromHandle(_ndb_getNDBHandleOfNode(nodeHandle));
	
	function ctrl:findChild(nodeName)
		local nh = _ndb_findChild(self.handle, nodeName);
		return localNDB.openNode(nh);
	end;
	
	function ctrl:getFacade()
		local nodeFacade = rawget(self, "__nodeFacade");
	
		if nodeFacade == nil then
			nodeFacade = localNDB.newNodeFacadeFor(self);
			rawset(self, "__nodeFacade", nodeFacade);
		end;
	
		return nodeFacade;
	end;
	
	function ctrl:getAttribute(name)
		return _ndb_getAttribute(self.handle, name);
	end;
	
	function ctrl:setAttribute(name, value)
		return _ndb_setAttribute(self.handle, name, value);	
	end;
	
	function ctrl:clearNode()
		return _obj_invoke(self.handle, "ClearNode");			
	end;
	
	function ctrl:getAttributesNames()
		return _ndb_getAttributesNames(self.handle);
	end;
	
	function ctrl:getAllAttributes()
		return _ndb_getAllAttributes(self.handle);	
	end;
	
	function ctrl:getChildCount()
		return _ndb_getChildCount(self.handle);
	end;
	
	function ctrl:getChild(indice)
		return localNDB.openNode(_ndb_getChild(self.handle, indice));
	end;
	
	function ctrl:getAllChilds()
		local ret = {};
		local count = self:getChildCount();			
		
		for i = 0, count - 1, 1 do
			ret[i + 1] = self:getChild(i);
		end;
		
		return ret;
	end;
	
	function ctrl:addChild(nodeName)
		return localNDB.openNode(_ndb_addChild(self.handle, nodeName));
	end;
	
	function ctrl:delete()
		_obj_invoke(self.handle, "Delete");
	end;
	
	function ctrl:getName()
		return _ndb_getNodeName(self.handle);
	end;
	
	function ctrl:getPersistedAttributeValue(attributeName)
		return _ndb_getPersistedAttributeValue(self.handle, attributeName);
	end;

	function ctrl:exportXML()
		return _obj_invoke(self.handle, "ExportToXMLString");
	end;
	
	function ctrl:importXML(xmlString)
		return _obj_invoke(self.handle, "ImportXMLString", (tostring(xmlString)) or "");
	end;	
			
	function ctrl:getLocalID()
		return _obj_getProp(self.handle, "LocalID");
	end;	
	
	function ctrl:beginUpdate()
		_obj_invoke(self.handle, "BeginUpdate");
	end;	
	
	function ctrl:endUpdate()
		_obj_invoke(self.handle, "EndUpdate");
	end;		
	
	function ctrl:getState()
		return _obj_getProp(self.handle, "ProviderState");
	end;
	
	function ctrl:setPermission(selKind, selId, permission, allowance)
		return _obj_invokeEx(self.handle, "SetPermission", selKind, selId, permission, allowance);
	end;
	
	function ctrl:getPermission(selKind, selId, permission)
		return _obj_invokeEx(self.handle, "GetPermission", selKind, selId, permission);
	end;	
	
	function ctrl:testPermission(permission)
		return _obj_invokeEx(self.handle, "TestPermission", permission);
	end;
	
	function ctrl:enumPermissions()
		return _obj_invokeEx(self.handle, "EnumPermissions");
	end;
	
	objs.registerHandle(nodeHandle, ctrl);		
	return ctrl;
end;

function localNDB.copyNodeToAnother(nodeDest, nodeSrc, ctxCtrl)
	if nodeDest.handle == nodeSrc.handle then
		return;
	end;
	
	if ctxCtrl == nil then
		ctxCtrl = {}; -- avoid circular reference
	end;
	
	if ctxCtrl[nodeSrc.handle] then
		return;
	else
		ctxCtrl[nodeSrc.handle] = true; 
	end;				
	
	nodeDest:beginUpdate();
	
	tryFinally(
		function()
			nodeDest:clearNode();
			
			local allAtts = nodeSrc:getAllAttributes();
			
			for k, v in pairs(allAtts) do
				localNDB.assignPropValueToNode(nodeDest, k, v);
			end;
			
			local allChilds = nodeSrc:getAllChilds();
			local newChild, srcChild;
			
			for _, v in pairs(allChilds) do
				srcChild = v;
				
				if not ctxCtrl[srcChild.handle] then
					newChild = nodeDest:addChild(srcChild:getName());
					localNDB.copyNodeToAnother(newChild, srcChild, ctxCtrl);
				end;
			end;
		end,
		
		function()
			nodeDest:endUpdate();
		end);
end;

function localNDB.copyTableToNode(nodeDest, tableValue)
	nodeDest:clearNode();

	for k, v in pairs(tableValue) do
		localNDB.assignPropValueToNode(nodeDest, k, v);
	end;
end;

function localNDB.assignPropValueToNode(node, prop, value)
	prop = tostring(prop);
		
	-- Limpando propriedade
	if value == nil then
		_obj_invoke(node.handle, "RemoveAtributeAndChildNodes", prop);
		return;
	end;

	if type(value) == "function" then
		-- Tipo inválido para setar
		require("locale.lua");		
		error(string.format(lang("sdk3.err.ndb.functionAssign"), tostring(prop)));
		return;
	end;
	
	if type(value) == "table" then
		-- Setando um Table/Child Node
		_obj_invoke(node.handle, "BeginUpdate");		
		
		node:setAttribute(prop, nil);  -- remover atributo de mesmo nome se existir	
		local childNode = node:findChild(prop);
		
		if childNode == nil then
			childNode = node:addChild(prop); -- Nodo não existe, vamos criar um
		end;
				
		if rawget(value, "__nodeFlag") then
			-- é um node
			localNDB.copyNodeToAnother(childNode, value);
		elseif rawget(value, "__nodeFacadeFlag") then
			-- é um node facade
			localNDB.copyNodeToAnother(childNode, value.__node);	
		else
			-- Aparentemente é um table comum
			localNDB.copyTableToNode(childNode, value);			
		end;	
		
		_obj_invoke(node.handle, "EndUpdate");	
	else
		-- Setando um Atributo
		--_obj_invoke(node.handle, "BeginUpdate");
		_obj_invoke(node.handle, "RemoveChildNodes", prop); -- remover todos os child nodes de mesmo nome	
		node:setAttribute(prop, value);
		--_obj_invoke(node.handle, "EndUpdate");	
	end;
end;

local NodeFacadeMetatable = {
	--[[ getter padrão de propriedades dos objetos. Chamado quando tentou gettar uma propriedade que não existe ]]--	
	__index = function(table, key)
		local v = rawget(table, key);
				
		if (v ~= nil) then
			return v;
		end;
		
		local node = rawget(table, "__node");
		
		if node ~= nil then
			local childNode = node:findChild(key);
			
			if childNode ~= nil then
				-- Achamos um child node com este nome.
				return childNode:getFacade();
			end;
			
			return node:getAttribute(key);
		end;		
		
		return nil;
	end,
	
	--[[ setter padrão de propriedades dos objetos. Chamado quando tentou settar uma propriedade que não existe ]]--	
	__newindex = function(table, key, value)
		local node = rawget(table, "__node");
		
		if node ~= nil then		
			localNDB.assignPropValueToNode(node, key, value);
		end;			
	end,	
};

function localNDB.newNodeFacadeFor(nodeObj)
	local nodeFacade = {};
	nodeFacade.__node = nodeObj;
	nodeFacade.__nodeFacadeFlag = true;
	setmetatable(nodeFacade, NodeFacadeMetatable);	
	return nodeFacade;
end;

function localNDB.openNode(nodeHandle)
	local nodeObj;
	
	if nodeHandle == nil then
		return nil;
	end;
		
	nodeObj = objs.tryFindFromHandle(nodeHandle);
	
	if nodeObj == nil then
		nodeObj = localNDB.nodeFromHandle(nodeHandle);
	end;
	
	return nodeObj;
end;

function localNDB.openNodeFacade(nodeHandle)
	local nodeObj = localNDB.openNode(nodeHandle);
	
	if nodeObj ~= nil then
		return nodeObj:getFacade();
	else
		return nil;
	end;
end;

function localNDB.getNodeObjectFromFacade(nodeFacade)
	return rawget(nodeFacade, "__node");
end;

function _export_ndb_openNodeFacade(nodeHandle)
	return localNDB.openNodeFacade(nodeHandle);
end;

-- Funções exportadas 

function ndb.openNodeDatabaseFromHandle(nodeDatabaseHandle)
	return localNDB.ndbFromHandle(nodeDatabaseHandle);
end;

function ndb.load(fileName, userName)
	local expandedName = vhd.expandFileName(fileName);
	
	if #expandedName > 0 then
		if string.sub(expandedName, 1, 1) ~= "/" then
			expandedName = "/" .. expandedName;
		end;
	end;
	
	if type(userName) ~= "string" then
		userName = "";
	end;
	
	local openDB = _localOpenNDBs[expandedName];
	
	if openDB ~= nil then
		return ndb.getRoot(openDB);
	end;
	
	openDB = ndb.openNodeDatabaseFromHandle(_obj_newObject("TLocalLuaNodeDatabase"));
	_localOpenNDBs[expandedName] = openDB;
	_obj_invoke(openDB.handle, "SetupLocalFile", expandedName, userName);		
	return ndb.getRoot(openDB);
end;

function ndb.newMemNodeDatabase()
	local openDB = ndb.openNodeDatabaseFromHandle(_obj_newObject("TLuaMemoryNodeDatabase"));
	return ndb.getRoot(openDB);
end;

function ndb.getRoot(node)
	if type(node) ~= "table" then
		return nil;
	end;
	
	if node.__nodeFlag then
		return localNDB.openNodeFacade(_ndb_getTheRoot(node.handle));
	elseif node.__nodeFacadeFlag then
		return ndb.getRoot(rawget(node, "__node"));	
	elseif node.__dbFlag then
		return localNDB.openNodeFacade(_ndb_getRoot(node.handle));
	else
		return nil;
	end;
end;

function ndb.getParent(node)
	if type(node) ~= "table" then
		return nil;
	end;
	
	if node.__nodeFlag then
		return localNDB.openNodeFacade(_ndb_getParent(node.handle));
	elseif node.__nodeFacadeFlag then
		return ndb.getParent(rawget(node, "__node"));	
	else
		return nil;
	end;
end;

function ndb.openNodeFacade(nodeHandle)
	return localNDB.openNodeFacade(nodeHandle);
end;

function ndb.getChildNodes(nodeObj)
	if (nodeObj == nil) then
		return {};
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		local nodesCtrls = node:getAllChilds();
		local ret = {};
		
		for i = 1, #nodesCtrls, 1 do
			ret[i] = nodesCtrls[i]:getFacade();
		end;
		
		return ret;
	else
		return {};
	end;
end;

function ndb.getAttributes(nodeObj)
	if (nodeObj == nil) then
		return {};
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		return node:getAllAttributes();
	else
		return {};
	end;
end;

function ndb.isNodeObject(value)
	if type(value) ~= "table" then
		return false;
	end;
	
	return rawget(value, "__nodeFacadeFlag");
end;

function ndb.getNodeHandle(nodeObject)
	if ndb.isNodeObject(nodeObject) then
		return nodeObject.__node.handle;
	else
		return nil;
	end;
end;

function ndb.createChildNode(nodeObj, childName)
	if (nodeObj == nil) then
		return nil;
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		return node:addChild(childName):getFacade();
	else
		return nil;
	end;
end;

function ndb.deleteNode(nodeObj)
	if (nodeObj == nil) then
		return;
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		node:delete();
	end;
end;

function ndb.clearNode(nodeObj)
	if (nodeObj == nil) then
		return;
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		node:clearNode();
	end;
end;

function ndb.getNodeName(nodeObj)
	if (nodeObj == nil) then
		return nil;
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		return node:getName();
	else
		return nil;
	end;
end;

function ndb.getPersistedAttributeValue(nodeObj, attributeName)
	if (nodeObj == nil) then
		return nil;
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		return node:getPersistedAttributeValue(attributeName);
	else
		return nil;
	end;
end;

function ndb.exportXML(nodeObj)
	if (nodeObj == nil) then
		local aLocale = require("locale.lua");
		error(aLocale.lang("sdk3.err.ndb.func.exportToXML.invalidPar"));
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		return node:exportXML();
	else
		local aLocale = require("locale.lua");
		error(aLocale.lang("sdk3.err.ndb.func.exportToXML.invalidPar"));
	end;
end;

function ndb.importXML(nodeObj, xmlString)
	if (nodeObj == nil) then
		local aLocale = require("locale.lua");
		error(aLocale.lang("sdk3.err.ndb.func.importXML.invalidPar"));
	end;

	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then
		return node:importXML(xmlString);
	else
		local aLocale = require("locale.lua");
		error(aLocale.lang("sdk3.err.ndb.func.importXML.invalidPar"));
	end;
end;

function ndb.copy(destNodeObj, srcNodeObj)
	if (destNodeObj == nil) then
		local aLocale = require("locale.lua");
		error(aLocale.lang("sdk3.err.ndb.func.copy.invalidPar2"));
	end;

	local srcNode;	
	local dstNode = localNDB.getNodeObjectFromFacade(destNodeObj);
	
	if srcNodeObj ~= nil then
		srcNode = localNDB.getNodeObjectFromFacade(srcNodeObj);
	else
		srcNode = nil;
	end;	
	
	if dstNode ~= nil then	
		if srcNode ~= nil then	
			local xmlString = srcNode:exportXML();
			dstNode:importXML(xmlString);			
		else
			dstNode:clearNode();
		end;
	else
		local aLocale = require("locale.lua");
		error(aLocale.lang("sdk3.err.ndb.func.copy.invalidPar2"));
	end;
end;

function ndb.beginUpdate(nodeObj)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then
			node:beginUpdate();
		end;
	end;
end;

function ndb.endUpdate(nodeObj)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then
			node:endUpdate();
		end;
	end;
end;

function ndb.getState(nodeObj)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then
			return node:getState();		
		end;	
	end;
	
	return "closed";	
end;	

local _observerBib = nil;

function ndb.newObserver(nodeObj)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then
			if _observerBib == nil then
				_observerBib = require("ndb_observer.dlua");
			end;
		
			return _observerBib.newObserver(node.handle, nodeObj);
		end;	
	end;
	
	return nil;		
end;

function ndb.setPermission(node, selKind, selId, permission, allowance)
	if node ~= nil then
		local nodeObj = localNDB.getNodeObjectFromFacade(node);
		
		if nodeObj ~= nil then
			return nodeObj:setPermission(tostring(selKind), tostring(selId), tostring(permission), allowance);			
		end;	
	end;
end;

function ndb.getPermission(node, selKind, selId, permission)
	if node ~= nil then
		local nodeObj = localNDB.getNodeObjectFromFacade(node);
		
		if nodeObj ~= nil then
			return nodeObj:getPermission(tostring(selKind), tostring(selId), tostring(permission));			
		end;	
	end;
	
	return nil;
end;

function ndb.testPermission(node, permission)
	if node ~= nil then
		local nodeObj = localNDB.getNodeObjectFromFacade(node);
		
		if nodeObj ~= nil then
			return nodeObj:testPermission(tostring(permission));			
		end;	
	end;
	
	return false;
end;

function ndb.enumPermissions(node)
	if node ~= nil then
		local nodeObj = localNDB.getNodeObjectFromFacade(node);
		
		if nodeObj ~= nil then
			return nodeObj:enumPermissions();			
		end;	
	end;	
	
	return {};
end;

function ndb.resetPermissions(node)
	if node ~= nil then
		local nodeObj = localNDB.getNodeObjectFromFacade(node);
		
		if nodeObj ~= nil then
			_obj_invoke(nodeObj.handle, "ResetPermissions");
		end;	
	end;	
	
	return {};
end;

local _transactionBib = nil;

function ndb.newTransaction(nodeObj)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then
			if _transactionBib == nil then
				_transactionBib = require("ndb_transaction.dlua");
			end;
		
			return _transactionBib.newTransaction(node.handle, nodeObj);
		end;	
	end;
	
	return nil;	
end;

function ndb.pushTransaction(nodeObj, transaction)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then
			local trHandle;
		
			if transaction ~= nil then
				trHandle = transaction.handle or 0;
			else
				trHandle = 0;
			end;
			
			_obj_invoke(node.handle, "PushTransaction", trHandle);			
		end;	
	end;
end;

function ndb.popTransaction(nodeObj)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then		
			_obj_invoke(node.handle, "PopTransaction");			
		end;	
	end;
end;

function ndb.getServerUTCTime(nodeObj)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then		
			return _obj_getProp(node.handle, "ServerUTCTime");			
		end;	
	end;
end;

function ndb.editPermissions(nodeObj)
	if nodeObj == nil then
		return;
	end;
	
	local node = localNDB.getNodeObjectFromFacade(nodeObj);
	
	if node ~= nil then		
		local plugins = require("plugins.lua");
		local ndbmodule = "RRPG.FIRECAST.FMXModule";	
		plugins.sendPM(ndbmodule, "ndbHost:editPermissions", {localNodeID=node:getLocalID()}, nil, nil);		
	end;		
end;

function ndb.loadNodeFromLocalID(localNodeID)
	return _ndb_tryLoadNodeFromLocalID(localNodeID);
end;

local _Serializer = nil;

function ndb.broadcastMessage(nodeObj, messageId, message, loopBack)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then		
			if _Serializer == nil then
				_Serializer = require("utils.serializer.dlua");
			end;
		
			if loopBack == nil then
				loopBack = false;
			end;
		
			_obj_invokeEx(node.handle, "LUABroadcastMessage", messageId, _Serializer.serialize(message), loopBack);			
		end;	
	end;
end;

function ndb.newBroadcastListener(nodeObj, messageId, callback)
	if nodeObj ~= nil then
		local node = localNDB.getNodeObjectFromFacade(nodeObj);
		
		if node ~= nil then			
			local obj = objs.objectFromHandle(_obj_newObject("TLuaNDBBroadcastReceiver"));
			obj.eves = obj.eves or {};
			obj.eves["onReceiveBroadcast"] = "sender, messageId, messageText";	
			
			_obj_invoke(obj.handle, "SetupReceiver", node.handle, messageId or "");
			
			obj.onReceiveBroadcast = function(sender, returnedMessageId, messageText)			
										if callback ~= nil then										
											if _Serializer == nil then
												_Serializer = require("utils.serializer.dlua");
											end;										
										
											local success, message = pcall(_Serializer.deserialize, messageText);
											
											if not success then
												message = messageText;
											end;
										
											callback(sender, returnedMessageId, message);
										end;
									end;	
			return obj;		
		end;	
	end;
end;

function ndb.onReady(nodeObj, callback, failCallback)	
	local function scheduleFailReturn()
		if failCallback ~= nil then
			setTimeout(failCallback, 1, nil);
		end;
	end;
		
	if nodeObj == nil then
		scheduleFailReturn();		
		return;		
	end;	
	
	local state = ndb.getState(nodeObj);
	
	if state == "open" then
		-- Already loaded
		
		if callback ~= nil then
			setTimeout(callback, 1, nodeObj);
		end;
		
		return;
	end;
	
	-- Not loaded yet, letz monitor
	local nodeInternObj = localNDB.getNodeObjectFromFacade(nodeObj);
	local ndbObj = localNDB.ndbFromHandle(_ndb_getNDBHandleOfNode(nodeInternObj.handle));
	local jaNotificou = false;
	local listenerProvider = nil;
	local listenerLoaded = nil;
	
	local function checkState()
		if not jaNotificou then
			state = ndb.getState(nodeObj);
		
			if state == "open" then
				jaNotificou = true;
				
				if callback ~= nil then
					setTimeout(callback, 1, nodeObj);
				end;
			elseif state == "closed" then
				jaNotificou = true;					
				scheduleFailReturn();
			end;
			
			if jaNotificou then
				ndbObj:removeEventListener(listenerProvider);
				ndbObj:removeEventListener(listenerLoaded);
			end;						
		end;						
	end;
			
	listenerProvider = ndbObj:addEventListener("OnProviderStateChange", checkState);
	listenerLoaded = ndbObj:addEventListener("OnLoaded", checkState);
			
	checkState();	
end;

-- OVERRIDE de funções nativas para funcionar com o NDB

local oldPairsFunc = pairs;
local oldIPairsFunc = ipairs;

local function _prepareNodeFacadePairsState(nodeFacade)
	local node = nodeFacade.__node;
	local state = node:getAllAttributes();	
	
	local childs = node:getAllChilds();
	
	for _, v in oldPairsFunc(childs) do
		local name = v:getName();
		local nodeForName = node:findChild(name);
		
		if nodeForName ~= nil then
			state[name] = nodeForName;
		end;
	end;
	
	return state;
end;

function pairs(obj)
	if (obj ~= nil) and rawget(obj, "__nodeFacadeFlag") then
		-- Node Façade		
		local state = _prepareNodeFacadePairsState(obj);			
		return oldPairsFunc(state);
	else
		return oldPairsFunc(obj);
	end;
end;

function ipairs(obj)
	if rawget(obj, "__nodeFacadeFlag") then
		-- Node Façade		
		local state = _prepareNodeFacadePairsState(obj);			
		return oldIPairsFunc(state);
	else
		return oldIPairsFunc(obj);
	end;
end;

return ndb;