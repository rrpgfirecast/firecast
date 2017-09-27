require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerTablesDock()
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
    obj:setName("frmGerTablesDock");
    obj:setTitle("Gerenciar Janelas Acopláveis");
    obj:setWidth(300);
    obj:setHeight(300);
    obj:setResizable(true);

		
		require("utils.lua");		
		local plugins = require("plugins.lua");
		
		local inicializado = false;
		local listenerPInstall;
		local listenerPUninstall;
		local listenerUserClosed;
	
		local function inicializar()
			self:setNodeObject(ndb.newMemNodeDatabase());	
			inicializado = true;
		end;
		
		local function carregarTablesDock()
			if not inicializado then
				inicializar();
			end;
		
			local tds = rrpg.plugins.getInstalledTablesDock();			
			
			table.sort(tds, 
				function(l, r)
					return utils.compareStringPtBr(l.title, r.title) < 0;
				end);
			
			for i = 1, #tds, 1 do
				local td = tds[i];				
				td.ativo = plugins.getIsTablesDockActive(self.mesa, td.moduleId, td.name);
			end;
				
			sheet.tablesDock = tds;
		end;
	


    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Janelas Acopláveis");
    obj.label1:setName("label1");
    obj.label1:setFontSize(15);
    obj.label1:setFontColor("#FFCC66");
    obj.label1:setMargins({left=4, right=4, top=3, bottom=3});
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setAlign("top");
    obj.label1:setAutoSize(true);

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({left=12, right=12, top=1, bottom=5});

    obj.rclTablesDock = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclTablesDock:setParent(obj.layout1);
    obj.rclTablesDock:setName("rclTablesDock");
    obj.rclTablesDock:setAlign("client");
    obj.rclTablesDock:setField("tablesDock");
    obj.rclTablesDock:setTemplateForm("frmTableDockItem");


		inicializar();
	


    obj._e_event0 = obj:addEventListener("onShow",
        function (self)
            carregarTablesDock();
            		
            		listenerPInstall = rrpg.messaging.listen("PluginInstalled", carregarTablesDock);
            		listenerPUninstall = rrpg.messaging.listen("PluginUninstalled", carregarTablesDock);
            		listenerUserClosed = rrpg.messaging.listen("TablesDockClosedByUser", carregarTablesDock);
        end, obj);

    obj._e_event1 = obj:addEventListener("onHide",
        function (self)
            rrpg.messaging.unlisten(listenerUserClosed);
            		rrpg.messaging.unlisten(listenerPInstall);
            		rrpg.messaging.unlisten(listenerPUninstall);
        end, obj);

    obj._e_event2 = obj.rclTablesDock:addEventListener("onItemAdded",
        function (self, node, form)
            form.mesa = self.mesa;
            				form.loadTDFunction = self.loadTDFunction;
            				form.unloadTDFunction = self.unloadTDFunction;
        end, obj);

    obj._e_event3 = obj.rclTablesDock:addEventListener("onItemRemoved",
        function (self, node, form)
            form.unloadTDFunction = nil;							
            				form.loadTDFunction = nil;				
            				form.mesa = nil;
        end, obj);

    function obj:_releaseEvents()
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

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rclTablesDock ~= nil then self.rclTablesDock:destroy(); self.rclTablesDock = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerTablesDock = {
    newEditor = newfrmGerTablesDock, 
    new = newfrmGerTablesDock, 
    name = "frmGerTablesDock", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Gerenciar Janelas Acopláveis", 
    description=""};

frmGerTablesDock = _frmGerTablesDock;
rrpg.registrarForm(_frmGerTablesDock);

return _frmGerTablesDock;
