require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmTemplateCreditos()
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
    obj:setName("frmTemplateCreditos");
    obj:setAlign("client");



	local function listToString(list, max)
		local text = "";

		for k=0, max, 1 do
			text = text .. (list[k] or "");
		end;

		return text;
	end;

	local function richEditToMarkdown(richEdit)
		if richEdit==nil then return "" end;
		local nodes = ndb.getChildNodes(richEdit);
		--local text = utils.tableToStr(richEdit) .. "\n";
		local text = "";

		local strList = {};
		local strMax = 0;

		for i=1, #nodes, 1 do
			local parts = ndb.getChildNodes(nodes[i]);

			local str = "";
			local table = "";

			local fragList = {};
			local fragMax = 0;
			for j=1, #parts, 1 do 
				local object = parts[j];
				local frag = "";

				if object.t == "txt" then
					if object.text ~= nil then
						frag = object.text:gsub("\9", "\n");
					else
						frag = "";
					end;

					if object.style ~= nil and frag~="\n" then
						local style = object.style;

						if string.match(style, "b") then
							frag = "**" .. frag .. "**";
						end;

						if string.match(style, "i") then
							frag = "*" .. frag .. "*";
						end;

						if string.match(style, "u") then
							--frag = "__" .. frag .. "__";
						end;

						if string.match(style, "s") then
							frag = "~~" .. frag .. "~~";
						end;
					end;
				elseif object.ctype == "imageURL" then
					frag = "<img src='" .. object.url .. "' style='position:absolute;bottom:50px;right:30px;width:280px' />";
				end;

				if object.i ~= nil then
					fragList[object.i] = frag;
					if object.i > fragMax then fragMax = object.i end;
				end;

				table = table .. utils.tableToStr(object) .. "\n";
			end;
			
			str = listToString(fragList, fragMax);
			strList[nodes[i].i] = str .. "\n";
			if nodes[i].i > strMax then strMax = nodes[i].i end;
			
			--text = text .. "\n" .. table .. "\n";
			--text = text .. utils.tableToStr(nodes[i]) .. "\n\n";
		end;

		text = listToString(strList, strMax);

		return text;
	end;

	local function exportToMarkdown()
		local retorno = "";

		local mesa = rrpg.getMesaDe(sheet);

		local reino = ndb.getChildNodes(sheet.listaDeDestalhesDoReino);
		retorno = "# " .. (sheet.reino or "Reino") .. "\n" .. richEditToMarkdown(reino[1]["$(field)"]) .. "\n";
		retorno = retorno .. "## Cultura" .. "\n" .. richEditToMarkdown(reino[2]["$(field)"]) .. "\n";
		retorno = retorno .. "## Raças" .. "\n" .. richEditToMarkdown(reino[3]["$(field)"]) .. "\n";
		retorno = retorno .. "## Classes" .. "\n" .. richEditToMarkdown(reino[4]["$(field)"]) .. "\n";
		retorno = retorno .. "## Historia" .. "\n" .. richEditToMarkdown(reino[5]["$(field)"]) .. "\n";
		retorno = retorno .. "## Geografia" .. "\n" .. richEditToMarkdown(reino[6]["$(field)"]) .. "\n";
		retorno = retorno .. "## Clima" .. "\n" .. richEditToMarkdown(reino[7]["$(field)"]) .. "\n";
		retorno = retorno .. "## Religião" .. "\n" .. richEditToMarkdown(reino[9]["$(field)"]) .. "\n";
		retorno = retorno .. "## Outros" .. "\n" .. richEditToMarkdown(reino[8]["$(field)"]) .. "\n";

		retorno = retorno .. "<div class='wide'><img src='" .. (sheet.mapa or "") .. "' style='width:640px;height:360px' /><div style='margin-top:20px'></div></div>\n";
		
		local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);

		retorno = retorno .. "## Cidades" .. "\n\n"

		for i=1, #cidades, 1 do 
			local cidade = cidades[i];
			local capital = "";
			if cidade.capital then
				capital = "[capital]\n";
			end;


			retorno = retorno .. "### " .. (cidade.nome or "Cidade") .. "\n" .. capital .. richEditToMarkdown(cidade.descricao) .. "\n";
			retorno = retorno .. "#### Historia" .. "\n" .. richEditToMarkdown(cidade.historia) .. "\n";

			retorno = retorno .. "**Tamanho:** " .. (cidade.tamanho or "tamanho") .. "\n\n";
			retorno = retorno .. "**Tipo:** " .. (cidade.tipo or "tipo") .. "\n\n";
			retorno = retorno .. "**Composição Racial:** " .. (cidade.composicao or "composicao") .. "\n\n";
			retorno = retorno .. "**Economia:** " .. (cidade.economia or "economia") .. "\n\n";
			retorno = retorno .. "**População:** " .. (cidade.populacao or "populacao") .. "\n\n";
			retorno = retorno .. "**Limite de PO:** " .. (cidade.limitePO or "limitePO") .. "\n\n";
			retorno = retorno .. "**Riqueza Total:** " .. (cidade.riqueza or "riqueza") .. "\n\n";
			retorno = retorno .. "**Fundação:** " .. (cidade.fundacao or "fundacao") .. "\n\n";

			retorno = retorno .. "#### Boatos" .. "\n" .. richEditToMarkdown(cidade.boatos) .. "\n";

			retorno = retorno .. "**Politica:** ";
			if cidade.politica_1 then
				retorno = retorno .. "Monarquia ";
			end;
			if cidade.politica_2 then
				retorno = retorno .. "Tribal ";
			end;
			if cidade.politica_3 then
				retorno = retorno .. "Feudal ";
			end;
			if cidade.politica_4 then
				retorno = retorno .. "República ";
			end;
			if cidade.politica_5 then
				retorno = retorno .. "Democracia ";
			end;
			if cidade.politica_6 then
				retorno = retorno .. "Magocracia";
			end;
			if cidade.politica_7 then
				retorno = retorno .. "Teocracia";
			end;
			if cidade.politica_8 then
				retorno = retorno .. "Plutocracia";
			end;
			if cidade.politica_9 then
				retorno = retorno .. "Outros";
			end;
			retorno = retorno .. "\n\n";

			retorno = retorno .. "**Militarização:** " .. (cidade.militarizacao or "militarizacao") .. "\n\n";
			retorno = retorno .. "**Guardas:** " .. (cidade.guardas or "guardas") .. "\n\n";
			retorno = retorno .. "**Reservistas:** " .. (cidade.reservistas or "reservistas") .. "\n\n";

			retorno = retorno .. "#### Poderes" .. "\n" .. richEditToMarkdown(cidade.poderes) .. "\n";
			retorno = retorno .. "#### Pessoas Importantes" .. "\n" .. richEditToMarkdown(cidade.pessoas) .. "\n";
			retorno = retorno .. "#### Organizações" .. "\n" .. richEditToMarkdown(cidade.organizacoes) .. "\n";
			retorno = retorno .. "#### Religião" .. "\n" .. richEditToMarkdown(cidade.religiao) .. "\n";

			retorno = retorno .. "<div class='wide'><img src='" .. (cidade.mapaCidade or "") .. "' style='width:640px;height:360px' /><div style='margin-top:20px'></div></div>\n";

		end;

		local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);

		retorno = retorno .. "## Pontos de Interesse\n\n";

		for i=1, #lugares, 1 do
			local lugar = lugares[i];

			retorno = retorno .. "### " .. (lugar.nome or "Lugar") .. "\n" .. richEditToMarkdown(lugar.descricao) .. "\n";
		end;

		System.setClipboardText(retorno);
	end;

	


    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(500);
    obj.image1:setHeight(500);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/FichaReinosD20/images/RPGmeister.jpg");
    obj.image1:setName("image1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(550);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(160);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(10);
    obj.label1:setWidth(200);
    obj.label1:setHeight(20);
    obj.label1:setText("Plugin feito por: ");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(0);
    obj.label2:setTop(35);
    obj.label2:setWidth(200);
    obj.label2:setHeight(20);
    obj.label2:setText("Vinny (Ambesek)");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(555);
    obj.label3:setTop(300);
    obj.label3:setWidth(200);
    obj.label3:setHeight(20);
    obj.label3:setText("Versão Atual: ");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setField("versionInstalled");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(555);
    obj.label4:setTop(325);
    obj.label4:setWidth(200);
    obj.label4:setHeight(20);
    obj.label4:setText("Ultima Versão: ");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("versionDownloaded");
    obj.label4:setName("label4");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(555);
    obj.button1:setTop(350);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(667);
    obj.button2:setTop(350);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setName("button2");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(555);
    obj.label5:setTop(400);
    obj.label5:setWidth(200);
    obj.label5:setHeight(20);
    obj.label5:setText("Conheça a Mesa:");
    obj.label5:setName("label5");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(555);
    obj.button3:setTop(425);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(660);
    obj.button4:setTop(425);
    obj.button4:setWidth(100);
    obj.button4:setText("Exportar");
    obj.button4:setHint("Coloca o conteudo da ficha na área de tranferencia (Ctrl+V) no formato markdown. Experimente colar o texto no site: homebrewery.naturalcrit.com");
    obj.button4:setName("button4");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20de%20Reinos%20d20/README.md')
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20de%20Reinos%20d20/output/Ficha%20de%20Reinos%20d20.rpk?raw=true')
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            exportToMarkdown();
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmTemplateCreditos = {
    newEditor = newfrmTemplateCreditos, 
    new = newfrmTemplateCreditos, 
    name = "frmTemplateCreditos", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTemplateCreditos = _frmTemplateCreditos;
rrpg.registrarForm(_frmTemplateCreditos);

return _frmTemplateCreditos;
