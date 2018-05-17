require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBlessing()
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
    obj:setName("frmBlessing");
    obj:setWidth(300);
    obj:setHeight(90);
    obj:setMargins({top=1});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(0);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(275);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("nome");
    obj.comboBox1:setItems({'O Chamado de Ninguém (2 moedas)', 'Contra-Ataque (5 moedas)', 'Defesa Ativa (5 moedas)', 'Bênção Severa (3 moedas)', 'Infusão de Espírito (3 moedas)', 'Segunda Chance (4 moedas)', 'Bênção Vigorosa (5 moedas)', 'Regeneração Inerente (3 moedas)', 'Contrato do Arrebatado (6 moedas)', 'Incendiário (4 moedas):', 'Sanguinário (4 moedas)', 'Porto Seguro (2 moedas)', 'Tatuagem de Aruman (8 moedas)', 'Ímpeto (4 moedas)', 'Fúria (4 moedas)', 'Momentum (4 moedas)', 'Invocação de Sentinela (2 moedas): Vulto', 'Invocação de Sentinela (2 moedas): Inquisidora', 'Invocação de Sentinela (2 moedas): Belladonna', 'Invocação de Sentinela (2 moedas): Zelote', 'Invocação de Sentinela (2 moedas): O Juiz:', 'Invocação de Sentinela (2 moedas): O Observador', 'Invocação de Sentinela (2 moedas): Ceifador Abissal'});
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'});
    obj.comboBox1:setName("comboBox1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(250);
    obj.textEditor1:setHeight(65);
    obj.textEditor1:setField("bencao");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(250);
    obj.rectangle2:setTop(25);
    obj.rectangle2:setWidth(25);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(250);
    obj.label1:setTop(25);
    obj.label1:setWidth(25);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setField("custo");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(250);
    obj.button1:setTop(50);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.comboBox1:addEventListener("onChange",
        function (self)
            if sheet==nil then return end;
            
            				if sheet.nome == "1" then
            					sheet.custo = 2;
            					sheet.bencao = "Ao custo de “1” Moeda Estranha teleporta a si e os Aliados em campo para sua localidade anterior, fugindo assim de qualquer Batalha (efeito de tipo Instantâneo).";
            				elseif sheet.nome == "2" then
            					sheet.custo = 5;
            					sheet.bencao = "Receber 2 de Dano Físico ou mais concede uma Ação Instantânea para atacar (efeitos de Habilidades e/ou outras Bênçãos não podem ser usados nesta nova Ação)(Máximo de um uso por Rodada).";
            				elseif sheet.nome == "3" then
            					sheet.custo = 5;
            					sheet.bencao = "Receber 3 de Dano Físico ou mais concede uma Ação Instantânea para defender este ataque, negando seu Dano completamente (efeitos de Habilidades e/ou outras Bênçãos não podem ser usados nesta nova ação)(Máximo de um uso por Rodada).";
            				elseif sheet.nome == "4" then
            					sheet.custo = 3;
            					sheet.bencao = "Deixa o portador imune a Envenenamento e Sangramento.";
            				elseif sheet.nome == "5" then
            					sheet.custo = 3;
            					sheet.bencao = "Ataques Corpo-a-Corpo e do tipo Projétil utilizando Armas Sacerdotais podem alvejar Inimigos do tipo Espírito sem a necessidade de um lançamento de Paranormalidade.";
            				elseif sheet.nome == "6" then
            					sheet.custo = 4;
            					sheet.bencao = "A Vida não pode descer para zero pontos em uma mesma Ação Inimiga, permanecendo em “1” ponto não importando a quantidade do Dano recebido. A Ação do próximo Inimigo na mesma Rodada, porém, pode diminuir a Vida se ao acaso ela continuar sendo “1” ponto.";
            				elseif sheet.nome == "7" then
            					sheet.custo = 5;
            					sheet.bencao = "Aumenta o efeito de qualquer Status Especial aplicado em si.";
            				elseif sheet.nome == "8" then
            					sheet.custo = 3;
            					sheet.bencao = "Em uma Batalha, toda Rodada em que não receber Dano e não gastar Fadiga regenera 20% da sua Vida máxima.";
            				elseif sheet.nome == "9" then
            					sheet.custo = 6;
            					sheet.bencao = "Se ao caso morrer seu Personagem retorna ao local da Dama Corvinal mais próxima com os mesmos pontos de Atributos e Habilidades, porém, perdendo todos os Itens, Bênçãos e pontos de Experiência já adquiridos (o Nível permanece o mesmo).";
            				elseif sheet.nome == "10" then
            					sheet.custo = 4;
            					sheet.bencao = "Obter Crítico em um teste de Dano Paranormal incendeia o Inimigo alvo, o aplicando Dano ao longo de duas Rodadas com base em sua Vida máxima (cada Inimigo tem uma resistência diferente às chamas).";
            				elseif sheet.nome == "11" then
            					sheet.custo = 4;
            					sheet.bencao = "Obter Crítico em um teste de Dano Físico causa Sangramento ao Inimigo alvo, os aplicando Dano ao longo de duas Rodadas com base na sua Vida máxima (cada Inimigo tem uma resistência diferente ao Sangramento).";
            				elseif sheet.nome == "12" then
            					sheet.custo = 2;
            					sheet.bencao = "Retornar a uma localidade da Dama Corvinal recupera todos os pontos de Vida e Fadiga.";
            				elseif sheet.nome == "13" then
            					sheet.custo = 8;
            					sheet.bencao = "Pode utilizar todos os espaços do Inventário sem precisar de Itens de Armazenamento.";
            				elseif sheet.nome == "14" then
            					sheet.custo = 4;
            					sheet.bencao = "Obter Crítico em qualquer teste de Dano remove a Habilidade “Tenacidade” do Inimigo alvo.";
            				elseif sheet.nome == "15" then
            					sheet.custo = 4;
            					sheet.bencao = "Regenera 1 ponto de Fadiga para cada 20% de Vida máxima que perder em uma Rodada.";
            				elseif sheet.nome == "16" then
            					sheet.custo = 4;
            					sheet.bencao = "Recupera 1 ponto de Fadiga sempre que obtiver um Acerto Crítico em qualquer lançamento.";
            				elseif sheet.nome == "17" then
            					sheet.custo = 2;
            					sheet.bencao = "Vulto: a cada Rodada esta Sentinela ataca um Inimigo aleatório no campo. Se por acaso ele atacar um Inimigo com Barreira ou Aura Protetora esta proteção é removida, porém, nenhum Dano será aplicado. Se houver apenas um Inimigo em campo a passiva do Vulto tem apenas metade de chance de ser ativada a cada Rodada.";
            				elseif sheet.nome == "18" then
            					sheet.custo = 2;
            					sheet.bencao = "Inquisidora: a cada Rodada esta Sentinela marca um Aliado aleatório no campo. Aliados marcados recebem cura e efeitos aumentados de fontes aliadas e também podem usar Habilidades sem gastar pontos de Fadiga, porém, Inimigos priorizarão seus ataques e Habilidades em Aliados marcados (sobrepondo Provocações). A marca dura apenas uma Rodada a menos que a Inquisidora marque ocasionalmente a mesmo Aliado novamente. Se houver apenas o portador desta Sentinela em campo a passiva da Inquisidora não será ativada. A Inquisidora não consegue marcar Aliados em modo Furtivo.";
            				elseif sheet.nome == "19" then
            					sheet.custo = 2;
            					sheet.bencao = "Belladonna: a cada Rodada esta Sentinela cura um Aliado aleatório no campo com base na sua Vida máxima. Se por acaso o Aliado curado estiver com um Status Anormal, a cura de Belladonna também remove este Status. Se houver apenas o portador desta Sentinela em campo a passiva de Belladonna tem apenas metade de chance de ser ativada a cada Rodada.";
            				elseif sheet.nome == "20" then
            					sheet.custo = 2;
            					sheet.bencao = "Zelote: a cada Rodada esta Sentinela negará o primeiro Dano do tipo Físico aplicado a um Aliado em campo, o revestindo com sua armadura. Durante esta Rodada o Aliado revestido por Zelote ganha a Habilidade “Tenacidade” e aplica Dano aumentado em seus ataques Corpo-a-Corpo.";
            				elseif sheet.nome == "21" then
            					sheet.custo = 2;
            					sheet.bencao = "O Juiz: a cada Rodada esta Sentinela marca um Inimigo aleatório no campo. Inimigos marcados recebem Dano aumentado de fontes aliadas e ficam Silenciados. A marca dura apenas uma Rodada a menos que O Juiz marque ocasionalmente a mesmo Inimigo novamente. Se houver apenas um Inimigo em campo a passiva d’O Juiz não será ativada. Se O Oportunista estiver em campo O Juiz marca prioritariamente este Inimigo.";
            				elseif sheet.nome == "22" then
            					sheet.custo = 2;
            					sheet.bencao = "O Observador: esta Sentinela anda sozinha pelo Mapa, assim que ela acha um Item Chave ou um mecanismo ativável o seu portador pode si teleporta para a sua localização ao custo de todos os seus pontos de Fadiga (precisa de no mínimo “1” ponto de Fadiga para poder ativar o teleporte)(apenas o seu portador é teleportado, deixando os seus Aliados para trás). O Observador não pode atravessar portas trancadas.";
            				elseif sheet.nome == "23" then
            					sheet.custo = 2;
            					sheet.bencao = "Ceifador Abissal: toda vez que um Aliado morre esta Sentinela guarda a sua alma. Se todos os Aliados que ainda estão vivos pagarem uma quantidade somada de 15 pontos de Vida e todos os seus pontos restantes de Fadiga o Aliado morto retorna a vida. Esta ressureição reestabelece metade de seus pontos de Vida máxima, mas retira todos os pontos de Fadiga que ainda tinha antes de morrer. Todos os Personagens envolvidos neste processo ficam Exaustos por uma grande quantidade de tempo.";
            				end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa benção?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
            						end;
            				end);
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

        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmBlessing = {
    newEditor = newfrmBlessing, 
    new = newfrmBlessing, 
    name = "frmBlessing", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBlessing = _frmBlessing;
rrpg.registrarForm(_frmBlessing);

return _frmBlessing;
