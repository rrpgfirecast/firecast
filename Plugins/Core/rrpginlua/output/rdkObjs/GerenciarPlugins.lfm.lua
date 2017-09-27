require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciarPlugins()
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
    obj:setName("frmGerenciarPlugins");
    obj:setTitle("Gerenciar Plugins");
    obj:setWidth(300);
    obj:setHeight(380);

		
		local downloadsPlugs = require("downloadsDePlugins.lua");
		
		local function atualizarListaDePlugins()
			if sheet == nil then
				return;
			end;
		
			sheet.plugins = rrpg.plugins.getInstalledPlugins();				
		end;
		
		local function goInstalarNovoPlugin()
		
			dialogs.inputQuery("Baixar Plugin", "Cole a URL do arquivo plugin de extensão '.rpk' (http://)", "", 
				function (url)										
						local id = downloadsPlugs.startDownloadPlugin(url); 
				end);			
		end;	

	


    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Plug-ins instalados");
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

    obj.layTop = gui.fromHandle(_obj_newObject("layout"));
    obj.layTop:setParent(obj.layout1);
    obj.layTop:setName("layTop");
    obj.layTop:setAlign("top");
    obj.layTop:setHeight(45);
    obj.layTop:setMargins({bottom=10});

    obj.btnInstalar = gui.fromHandle(_obj_newObject("button"));
    obj.btnInstalar:setParent(obj.layTop);
    obj.btnInstalar:setName("btnInstalar");
    obj.btnInstalar:setText("Baixar um plug-in...");
    obj.btnInstalar:setWidth(200);
    obj.btnInstalar:setWordWrap(false);

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.layout1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.recordList1 = gui.fromHandle(_obj_newObject("recordList"));
    obj.recordList1:setParent(obj.scrollBox1);
    obj.recordList1:setAlign("top");
    obj.recordList1:setField("downloads");
    obj.recordList1:setTemplateForm("frmPluginBaixando");
    obj.recordList1:setAutoHeight(true);
    obj.recordList1:setName("recordList1");

    obj.recordList2 = gui.fromHandle(_obj_newObject("recordList"));
    obj.recordList2:setParent(obj.scrollBox1);
    obj.recordList2:setAlign("top");
    obj.recordList2:setField("plugins");
    obj.recordList2:setTemplateForm("frmGerencPluginItem");
    obj.recordList2:setAutoHeight(true);
    obj.recordList2:setName("recordList2");

    obj._e_event0 = obj:addEventListener("onShow",
        function (self)
            if sheet == nil then
            			self:setNodeObject(downloadsPlugs.getNDB());
            			atualizarListaDePlugins();
            		end;		
            		
            		self._listener1 = rrpg.messaging.listen("PluginInstalled",
            			function ()
            				atualizarListaDePlugins();
            			end);		
            			
            		self._listener2 = rrpg.messaging.listen("PluginUninstalled",
            			function ()
            				atualizarListaDePlugins();
            			end);
        end, obj);

    obj._e_event1 = obj:addEventListener("onHide",
        function (self)
            rrpg.messaging.unlisten(self._listener1);
            		rrpg.messaging.unlisten(self._listener2);
        end, obj);

    obj._e_event2 = obj.layTop:addEventListener("onResize",
        function (self)
            self.btnInstalar.left = self.layTop.width / 2 - self.btnInstalar.width / 2; self.btnInstalar.height = self.layTop.height;
        end, obj);

    obj._e_event3 = obj.btnInstalar:addEventListener("onClick",
        function (self)
            goInstalarNovoPlugin()
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

        if self.layTop ~= nil then self.layTop:destroy(); self.layTop = nil; end;
        if self.btnInstalar ~= nil then self.btnInstalar:destroy(); self.btnInstalar = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.recordList1 ~= nil then self.recordList1:destroy(); self.recordList1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.recordList2 ~= nil then self.recordList2:destroy(); self.recordList2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciarPlugins = {
    newEditor = newfrmGerenciarPlugins, 
    new = newfrmGerenciarPlugins, 
    name = "frmGerenciarPlugins", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Gerenciar Plugins", 
    description=""};

frmGerenciarPlugins = _frmGerenciarPlugins;
rrpg.registrarForm(_frmGerenciarPlugins);

return _frmGerenciarPlugins;
