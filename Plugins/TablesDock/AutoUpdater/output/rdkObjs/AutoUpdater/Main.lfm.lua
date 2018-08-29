require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmTemplate()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmTemplate");
    obj:setFormType("tablesDock");
    obj:setDataType("Ambesek.Auto.Updater");
    obj:setTitle("Plugin Auto Updater");
    obj:setAlign("client");
    obj:setTheme("dark");


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

        local function verifyUpdate(id, url)
            local nodes = ndb.getChildNodes(updaterSheet.installedPluginsList); 
            local myNode;
            for i=1, #nodes, 1 do
                if nodes[i].moduleId == id then
                    myNode = nodes[i];
                end;
            end

            internet.download(url,
                function(stream, contentType)
                    -- esta função será chamada quando o download terminar
                    -- o conteúdo do arquivo baixado está em stream.
                    local info = rrpg.plugins.getRPKDetails(stream);

                    updaterSheet.loaded = updaterSheet.loaded + 1;
                    updaterSheet.loading = "Carregando " .. updaterSheet.loaded .. "/" .. updaterSheet.toLoad;

                    if updaterSheet.toLoad <= updaterSheet.loaded then
                        self.loader.visible = false;
                        self.downloadedPluginsList:sort();
                    end;

                    if myNode ~= nil then
                        myNode.versionAvailable = info.version;
                        myNode.url = url;
                        myNode.stream = stream;
                    else
                        local item = self.downloadedPluginsList:append();
                        item.name = info.name;
                        item.moduleId = info.moduleId;
                        item.author = info.author;
                        item.version = info.version;
                        item.url = url;
                        item.stream = stream;
                        item.enabled = true;
                        item.description = info.description;
                        item.contact = info.contact;
                    end;
                end,       
                function (errorMsg)
                    -- esta função será chamada quando ocorrer algum erro no download.
                    -- errorMsg possui a msg de erro
                    showMessage(errorMsg);
                end,
                function (downloaded, total)
                    -- esta função será chamada constantemente.
                    -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                end,
                "checkForModification");
        end;
        


    obj.scope = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.scope:setParent(obj);
    obj.scope:setName("scope");
    obj.scope:setAlign("client");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.scope);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Instalado");
    obj.tab1:setName("tab1");

    obj.frmInstalled = gui.fromHandle(_obj_newObject("form"));
    obj.frmInstalled:setParent(obj.tab1);
    obj.frmInstalled:setName("frmInstalled");
    obj.frmInstalled:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmInstalled);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.installedPluginsList = gui.fromHandle(_obj_newObject("recordList"));
    obj.installedPluginsList:setParent(obj.scrollBox1);
    obj.installedPluginsList:setAlign("client");
    obj.installedPluginsList:setField("installedPluginsList");
    obj.installedPluginsList:setName("installedPluginsList");
    obj.installedPluginsList:setTemplateForm("frmInstalledPlugin");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Disponível");
    obj.tab2:setName("tab2");

    obj.frmAvailable = gui.fromHandle(_obj_newObject("form"));
    obj.frmAvailable:setParent(obj.tab2);
    obj.frmAvailable:setName("frmAvailable");
    obj.frmAvailable:setAlign("client");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAvailable);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.downloadedPluginsList = gui.fromHandle(_obj_newObject("recordList"));
    obj.downloadedPluginsList:setParent(obj.scrollBox2);
    obj.downloadedPluginsList:setAlign("client");
    obj.downloadedPluginsList:setField("downloadedPluginsList");
    obj.downloadedPluginsList:setName("downloadedPluginsList");
    obj.downloadedPluginsList:setTemplateForm("frmDownloadedPlugin");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Creditos");
    obj.tab3:setName("tab3");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab3);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmTemplateCreditos);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox3);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox3);
    obj.label1:setLeft(5);
    obj.label1:setTop(10);
    obj.label1:setWidth(200);
    obj.label1:setHeight(20);
    obj.label1:setText("Feito por: Vinny (Ambesek)");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox3);
    obj.label2:setLeft(5);
    obj.label2:setTop(35);
    obj.label2:setWidth(200);
    obj.label2:setHeight(20);
    obj.label2:setText("Versão Atual: ");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setField("versionInstalled");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox3);
    obj.label3:setLeft(5);
    obj.label3:setTop(60);
    obj.label3:setWidth(200);
    obj.label3:setHeight(20);
    obj.label3:setText("Sua Versão: ");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setField("versionDownloaded");
    obj.label3:setName("label3");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox3);
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(85);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox3);
    obj.button1:setLeft(5);
    obj.button1:setTop(110);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox3);
    obj.button2:setLeft(5);
    obj.button2:setTop(135);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setName("button2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox3);
    obj.label4:setLeft(5);
    obj.label4:setTop(160);
    obj.label4:setWidth(200);
    obj.label4:setHeight(20);
    obj.label4:setText("Conheça a Mesa:");
    obj.label4:setName("label4");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox3);
    obj.button3:setLeft(5);
    obj.button3:setTop(185);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.loader = gui.fromHandle(_obj_newObject("layout"));
    obj.loader:setParent(obj.scope);
    obj.loader:setLeft(250);
    obj.loader:setTop(0);
    obj.loader:setHeight(25);
    obj.loader:setWidth(150);
    obj.loader:setName("loader");
    obj.loader:setVisible(false);

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.loader);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(25);
    obj.image1:setHeight(25);
    obj.image1:setSRC("/AutoUpdater/images/hourglass.png");
    obj.image1:setName("image1");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.loader);
    obj.label5:setLeft(25);
    obj.label5:setTop(0);
    obj.label5:setWidth(140);
    obj.label5:setHeight(25);
    obj.label5:setField("loading");
    obj.label5:setName("label5");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            -- Carrega o local sheet para ser usado. 
                    updaterSheet = ndb.load("sheet.xml");
                    self.scope:setNodeObject(updaterSheet);
            
                    -- Limpa os recordList e carrega a lista de plugins instaladados
                    local installed = rrpg.plugins.getInstalledPlugins();
                    local nodes = ndb.getChildNodes(updaterSheet.downloadedPluginsList); 
                    for i=1, #nodes, 1 do
                        ndb.deleteNode(nodes[i]);
                    end;
                    local nodes = ndb.getChildNodes(updaterSheet.installedPluginsList); 
                    for i=1, #nodes, 1 do
                        ndb.deleteNode(nodes[i]);
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
                    item.name = "Nome";
                    item.moduleId = "ID";
                    item.author = "Autor";
                    item.version = "Versão Instalada";
                    item.versionAvailable = "Versão Disponível";
                    item.enabled = false;
            
                    local item = self.downloadedPluginsList:append();
                    item.name = "Nome";
                    item.moduleId = "ID";
                    item.author = "Autor";
                    item.version = "Versão Disponível";
                    item.enabled = false;
            
                    self.installedPluginsList:sort();
            
                    -- Inicia o download da lista de plugins do git
            
                    self.loader.visible = true;
                    updaterSheet.loading = "Carregando ?/?";
                    internet.download("https://raw.githubusercontent.com/rrpgfirecast/firecast/master/Plugins/plugins.xml",
                        function(stream, contentType)
                            if vhd.fileExists("import.xml") then
                                vhd.deleteFile("import.xml");
                            end;
                            local file = vhd.openFile("import.xml", "w");
                            file:copyFrom(stream, stream.size);
                            setTimeout(
                                function ()
                                    file:close();
                                    local import = ndb.load("import.xml");
            
                                    local list = ndb.getChildNodes(import);
            
                                    updaterSheet.loaded = 0;
                                    updaterSheet.toLoad = #list;
                                    updaterSheet.loading = "Carregando 0/" .. updaterSheet.toLoad;
                                    for i=1, #list, 1 do
                                        -- Verifica se tem updates em cada plugin
                                        verifyUpdate(list[i].id, list[i].url);
                                    end;
            
                                end, 
                                1000
                            );
                        end,       
                        function (errorMsg)
                            -- esta função será chamada quando ocorrer algum erro no download.
                            -- errorMsg possui a msg de erro
                            showMessage("Não consegui pegar a lista de plugins do githut :/ \n" .. errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end,
                        "alwaysDownload");
        end, obj);

    obj._e_event1 = obj:addEventListener("onNodeReady",
        function (self)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true",
                        function(stream, contentType)
                            local info = rrpg.plugins.getRPKDetails(stream);
                            updaterSheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = rrpg.plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    updaterSheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            updaterSheet.stream = stream;
            
                            if updaterSheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            local install = rrpg.plugins.installPlugin(updaterSheet.stream, true);
                                            if install==false then
                                                gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true');
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

    obj._e_event2 = obj.installedPluginsList:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            					return utils.compareStringPtBr(nodeA.name, nodeB.name);
            				elseif nodeA.enabled then
            					return 1;
            				elseif nodeB.enabled then
            					return -1;
            				end;
        end, obj);

    obj._e_event3 = obj.downloadedPluginsList:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            					return utils.compareStringPtBr(nodeA.name, nodeB.name);
            				elseif nodeA.enabled then
            					return 1;
            				elseif nodeB.enabled then
            					return -1;
            				end;
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/README.md')
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (self)
            local install = rrpg.plugins.installPlugin(updaterSheet.stream, true);
                            if install==false then
                                gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true');
                            end;
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/TablesDock/AutoUpdater/output/AutoUpdater.rpk?raw=true')
        end, obj);

    obj._e_event7 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.loader ~= nil then self.loader:destroy(); self.loader = nil; end;
        if self.scope ~= nil then self.scope:destroy(); self.scope = nil; end;
        if self.frmAvailable ~= nil then self.frmAvailable:destroy(); self.frmAvailable = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.downloadedPluginsList ~= nil then self.downloadedPluginsList:destroy(); self.downloadedPluginsList = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.frmInstalled ~= nil then self.frmInstalled:destroy(); self.frmInstalled = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmTemplate = {
    newEditor = newfrmTemplate, 
    new = newfrmTemplate, 
    name = "frmTemplate", 
    dataType = "Ambesek.Auto.Updater", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Plugin Auto Updater", 
    description=""};

frmTemplate = _frmTemplate;
rrpg.registrarForm(_frmTemplate);
rrpg.registrarDataType(_frmTemplate);
rrpg.registrarSpecialForm(_frmTemplate);

return _frmTemplate;
