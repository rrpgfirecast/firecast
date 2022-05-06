require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_autoupdaterPopup()
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
    obj:setName("autoupdaterPopup");
    obj:setFormType("undefined");
    obj:setDataType("ambesek.autoupdater");
    obj:setTitle("Auto Updater");
    obj:setWidth(720);
    obj:setHeight(300);

    obj.frmMainAutoupdater = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMainAutoupdater:setParent(obj);
    obj.frmMainAutoupdater:setName("frmMainAutoupdater");
    obj.frmMainAutoupdater:setFormType("tablesDock");
    obj.frmMainAutoupdater:setDataType("Ambesek.Auto.Updater");
    obj.frmMainAutoupdater:setTitle("Plugin Auto Updater");
    obj.frmMainAutoupdater:setAlign("client");
    obj.frmMainAutoupdater:setTheme("dark");


        



        local function dump(o)
           if type(o) == 'table' then
              local s = '{ '
              for k,v in pairs(o) do
                 if type(k) ~= 'number' then k = '"'..k..'"' end
                 s = s .. '['..k..'] = ' .. dump(v) .. ','
              end
              return s .. '} '
           else
              return tostring(o)
           end
        end
        
        local function write(str)
            local mesa = Firecast.getMesaDe(self);
            if str then
                mesa.activeChat:escrever(str);
            else
                mesa.activeChat:escrever("String nula");
            end;
        end;

        local function tryTranslate(text)
            local trans = Locale.tryLang(text);
            if trans == nil then trans = text end;
            return trans;
        end

        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;

        local function verifyUpdate(plugin)
            local nodes = NDB.getChildNodes(updaterSheet.installedPluginsList); 
            local myNode;
            for i=1, #nodes, 1 do
                if nodes[i].moduleId == plugin.id then
                    myNode = nodes[i];
                end;
            end

            updaterSheet.loaded = updaterSheet.loaded + 1;
            updaterSheet.loading = tryTranslate("loading") .. updaterSheet.loaded .. "/" .. updaterSheet.toLoad;

            if updaterSheet.toLoad <= updaterSheet.loaded then
                self.loader.visible = false;
                self.downloadedPluginsList:sort();
            end;

            if myNode ~= nil then
                myNode.versionAvailable = plugin.version;
                myNode.url = plugin.url;
            else
                local item = self.downloadedPluginsList:append();
                item.name = plugin.name;
                item.moduleId = plugin.id;
                item.author = plugin.author;
                item.version = plugin.version;
                item.versionAvailable = plugin.version;
                item.url = plugin.url;
                item.enabled = true;
                item.description = plugin.description;
                item.contact = plugin.contact;
            end;
        end;

        local function init()
            -- Carrega o local sheet para ser usado. 
            updaterSheet = NDB.load("config.xml");
            self.scope:setNodeObject(updaterSheet);

            -- Limpa os recordList e carrega a lista de plugins instaladados
            local installed = Firecast.Plugins.getInstalledPlugins();
            local nodesDownloaded = NDB.getChildNodes(updaterSheet.downloadedPluginsList); 
            for i=1, #nodesDownloaded, 1 do
                NDB.deleteNode(nodesDownloaded[i]);
            end;
            local nodesInstalled = NDB.getChildNodes(updaterSheet.installedPluginsList); 
            for i=1, #nodesInstalled, 1 do
                NDB.deleteNode(nodesInstalled[i]);
            end;

            -- Adiciona os plugins instalados a lista
            for i=1, #installed, 1 do
                local item = self.installedPluginsList:append();
                item.name = installed[i].name;
                item.moduleId = installed[i].moduleId;
                item.author = installed[i].author;
                item.version = installed[i].version;
                item.enabled = true;
                item.description = installed[i].description;
                item.contact = installed[i].contact;
            end;
            
            -- Adiciona o nome das colunas as listas.
            local item = self.installedPluginsList:append();
            item.name = tryTranslate("name")
            item.moduleId = tryTranslate("id")
            item.author = tryTranslate("author")
            item.version = tryTranslate("installed")
            item.versionAvailable = tryTranslate("available")
            item.enabled = false;

            local item = self.downloadedPluginsList:append();
            item.name = tryTranslate("name")
            item.moduleId = tryTranslate("id")
            item.author = tryTranslate("author")
            item.version = tryTranslate("installed")
            item.enabled = false;

            self.installedPluginsList:sort();

            -- Inicia o download da lista de plugins do git

            self.loader.visible = true;
            updaterSheet.loading = tryTranslate("loading") .. "?/?";
            Internet.download("https://raw.githubusercontent.com/rrpgfirecast/firecast/master/Plugins/plugins.xml",
                function(stream, contentType)
                    if VHD.fileExists("plugins.xml") then
                        VHD.deleteFile("plugins.xml");
                    end;
                    local file = VHD.openFile("plugins.xml", "w");
                    file:copyFrom(stream, stream.size);
                    setTimeout(
                        function ()
                            file:close();
                            local import = NDB.load("plugins.xml");

                            local list = NDB.getChildNodes(import);

                            updaterSheet.loaded = 0;
                            updaterSheet.toLoad = #list;
                            updaterSheet.loading = tryTranslate("loading") .. "0/" .. updaterSheet.toLoad;

                            for i=1, #list, 1 do
                                -- Verifica se tem updates em cada plugin
                                verifyUpdate(list[i]);
                            end;

                            self.downloadedPluginsList:sort();

                        end, 
                        1000
                    );
                end,       
                function (errorMsg)
                    -- esta função será chamada quando ocorrer algum erro no download.
                    -- errorMsg possui a msg de erro
                    showMessage(tryTranslate("error.load").."\n" .. errorMsg);
                end,       
                function (downloaded, total)
                    -- esta função será chamada constantemente.
                    -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                end,
                "alwaysDownload");
        end;
        


 
    


    obj.scope = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.scope:setParent(obj.frmMainAutoupdater);
    obj.scope:setName("scope");
    obj.scope:setAlign("client");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.scope);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("@@hud.installed");
    obj.tab1:setName("tab1");

    obj.frmInstalled = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInstalled:setParent(obj.tab1);
    obj.frmInstalled:setName("frmInstalled");
    obj.frmInstalled:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmInstalled);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.installedPluginsList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.installedPluginsList:setParent(obj.scrollBox1);
    obj.installedPluginsList:setAlign("client");
    obj.installedPluginsList:setField("installedPluginsList");
    obj.installedPluginsList:setName("installedPluginsList");
    obj.installedPluginsList:setTemplateForm("frmInstalledPlugin");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("bottom");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(350);
    obj.label1:setField("selectedDataType");
    obj.label1:setName("label1");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout1);
    obj.progressBar1:setAlign("client");
    obj.progressBar1:setField("downloadProgress");
    obj.progressBar1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.progressBar1:setMax(1.0);
    obj.progressBar1:setName("progressBar1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("@@hud.avaialable");
    obj.tab2:setName("tab2");

    obj.frmAvailable = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAvailable:setParent(obj.tab2);
    obj.frmAvailable:setName("frmAvailable");
    obj.frmAvailable:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAvailable);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox2);
    obj.edit1:setAlign("top");
    obj.edit1:setHeight(25);
    obj.edit1:setField("filter");
    obj.edit1:setTextPrompt("Filtro");
    obj.edit1:setName("edit1");

    obj.downloadedPluginsList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.downloadedPluginsList:setParent(obj.scrollBox2);
    obj.downloadedPluginsList:setAlign("client");
    obj.downloadedPluginsList:setField("downloadedPluginsList");
    obj.downloadedPluginsList:setName("downloadedPluginsList");
    obj.downloadedPluginsList:setTemplateForm("frmDownloadedPlugin");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox2);
    obj.layout2:setAlign("bottom");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setWidth(350);
    obj.label2:setField("selectedDataType");
    obj.label2:setName("label2");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.layout2);
    obj.progressBar2:setAlign("client");
    obj.progressBar2:setField("downloadProgress");
    obj.progressBar2:setMargins({left=5,right=5,top=5,bottom=5});
    obj.progressBar2:setMax(1.0);
    obj.progressBar2:setName("progressBar2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("@@hud.credits");
    obj.tab3:setName("tab3");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab3);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmTemplateCreditos);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox3);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox3);
    obj.label3:setLeft(5);
    obj.label3:setTop(10);
    obj.label3:setWidth(200);
    obj.label3:setHeight(20);
    obj.label3:setText("@@madeBy");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox3);
    obj.label4:setLeft(5);
    obj.label4:setTop(35);
    obj.label4:setWidth(200);
    obj.label4:setHeight(20);
    obj.label4:setText("Versão Atual: ");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("versionInstalled");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox3);
    obj.label5:setLeft(5);
    obj.label5:setTop(60);
    obj.label5:setWidth(200);
    obj.label5:setHeight(20);
    obj.label5:setText("Sua Versão: ");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setField("versionDownloaded");
    obj.label5:setName("label5");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox3);
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(85);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("@@dontUpdate");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox3);
    obj.button1:setLeft(5);
    obj.button1:setTop(110);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox3);
    obj.button2:setLeft(5);
    obj.button2:setTop(135);
    obj.button2:setWidth(100);
    obj.button2:setText("@@update");
    obj.button2:setName("button2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox3);
    obj.label6:setLeft(5);
    obj.label6:setTop(160);
    obj.label6:setWidth(200);
    obj.label6:setHeight(20);
    obj.label6:setText("@@visit");
    obj.label6:setName("label6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox3);
    obj.button3:setLeft(5);
    obj.button3:setTop(185);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.loader = GUI.fromHandle(_obj_newObject("layout"));
    obj.loader:setParent(obj.scope);
    obj.loader:setLeft(250);
    obj.loader:setTop(0);
    obj.loader:setHeight(25);
    obj.loader:setWidth(150);
    obj.loader:setName("loader");
    obj.loader:setVisible(false);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.loader);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(25);
    obj.image1:setHeight(25);
    obj.image1:setSRC("/AutoUpdater/images/hourglass.png");
    obj.image1:setName("image1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.loader);
    obj.label7:setLeft(25);
    obj.label7:setTop(0);
    obj.label7:setWidth(140);
    obj.label7:setHeight(25);
    obj.label7:setField("loading");
    obj.label7:setName("label7");

    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            init();
        end, obj);

    obj._e_event1 = obj.frmMainAutoupdater:addEventListener("onNodeChanged",
        function (_)
            init();
        end, obj);

    obj._e_event2 = obj.frmMainAutoupdater:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            updaterSheet.versionDownloaded = tryTranslate("available")..": " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    updaterSheet.versionInstalled = tryTranslate("installed")..": " .. installed[i].version;
                                end;
                            end;
            
                            rawset(updaterSheet, "stream", stream);
            
                            if updaterSheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose(tryTranslate("newVersion"),{tryTranslate("yes"), tryTranslate("no"), tryTranslate("dontAsk")},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            local install = Firecast.Plugins.installPlugin(rawget(updaterSheet,"stream"), true);
                                            if install==false then
                                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true');
                                            end;
                                        elseif selected and selectedIndex == 3 then
                                            updaterSheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end,
                        "checkForModification");
        end, obj);

    obj._e_event3 = obj.installedPluginsList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            					return Utils.compareStringPtBr(nodeA.name, nodeB.name);
            				elseif nodeA.enabled then
            					return 1;
            				elseif nodeB.enabled then
            					return -1;
            				end;
        end, obj);

    obj._e_event4 = obj.edit1:addEventListener("onChange",
        function (_)
            --write(self.scope.node);
            				if self.scope.node == nil then return end;
            
            				local nodes = NDB.getChildNodes(self.scope.node.downloadedPluginsList);
            				--local mesa = Firecast.getMesaDe(self);
            				--local login = mesa.meuJogador.login;
            				local filter = string.lower(Utils.removerAcentos(self.scope.node.filter));
            
            				-- Deixe todos visiveis 
            				if filter == nil or filter == "" then
            					for i = 1, #nodes, 1 do
            						nodes[i].priority = 0;
            						--NDB.setPermission(nodes[i], "user", login, "read", "allow");
            					end;
            				-- Deixe apenas os matchs visiveis
            				else
            					for i = 1, #nodes, 1 do
            						local name = string.lower(Utils.removerAcentos(nodes[i].name));
            						local moduleId = string.lower(Utils.removerAcentos(nodes[i].moduleId));
            						local author = string.lower(Utils.removerAcentos(nodes[i].author));
            
            						if string.find(name, filter) or string.find(moduleId, filter) or string.find(author, filter) then
            							nodes[i].priority = 1;
            							--NDB.setPermission(nodes[i], "user", login, "read", "allow");
            						else
            							nodes[i].priority = -1;
            							--NDB.setPermission(nodes[i], "user", login, "read", "deny");
            							--showMessage(NDB.getPermission(nodes[i], "user", login, "read"));
            						end;
            					end;
            				end;
        end, obj);

    obj._e_event5 = obj.downloadedPluginsList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then
            					if (tonumber(nodeA.priority) or 0) > (tonumber(nodeB.priority) or 0) then
            						return -1;
            					elseif (tonumber(nodeB.priority) or 0) > (tonumber(nodeA.priority) or 0) then
            						return 1;
            					else
            						return Utils.compareStringPtBr(nodeA.name, nodeB.name);
            					end;
            				elseif nodeA.enabled then
            					return 1;
            				elseif nodeB.enabled then
            					return -1;
            				end;
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/README.md')
        end, obj);

    obj._e_event7 = obj.button1:addEventListener("onClick",
        function (_)
            local install = Firecast.Plugins.installPlugin(rawget(updaterSheet,"stream"), true);
                            if install==false then
                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true');
                            end;
        end, obj);

    obj._e_event8 = obj.button2:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true')
        end, obj);

    obj._e_event9 = obj.button3:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.installedPluginsList ~= nil then self.installedPluginsList:destroy(); self.installedPluginsList = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.loader ~= nil then self.loader:destroy(); self.loader = nil; end;
        if self.scope ~= nil then self.scope:destroy(); self.scope = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.frmMainAutoupdater ~= nil then self.frmMainAutoupdater:destroy(); self.frmMainAutoupdater = nil; end;
        if self.frmAvailable ~= nil then self.frmAvailable:destroy(); self.frmAvailable = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.downloadedPluginsList ~= nil then self.downloadedPluginsList:destroy(); self.downloadedPluginsList = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.frmInstalled ~= nil then self.frmInstalled:destroy(); self.frmInstalled = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newautoupdaterPopup()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_autoupdaterPopup();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _autoupdaterPopup = {
    newEditor = newautoupdaterPopup, 
    new = newautoupdaterPopup, 
    name = "autoupdaterPopup", 
    dataType = "ambesek.autoupdater", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Auto Updater", 
    description=""};

autoupdaterPopup = _autoupdaterPopup;
Firecast.registrarForm(_autoupdaterPopup);
Firecast.registrarDataType(_autoupdaterPopup);

return _autoupdaterPopup;
