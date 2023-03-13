require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmRollItens()
    local obj = GUI.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmRollItens");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});


        function rolarDado(sheet)
        local minhaMesa = Firecast.getRoomOf(sheet)
        if minhaMesa == nil then
          -- A sheet não está associada a uma sala no Firecast, então não podemos rolar dados
          return
        end
        
        local chat = minhaMesa.chat
      
        -- Definir tabela de mapeamento de resultados
        local mapeamento = {
          [1] = "Boneco de Ação, Balança de Precisão",
          [2] = "Livro de Endereços, Roupa de Couro, Carteira de cigarros 2d10",
          [3] = "Ataduras Adesivas, Tecido, Caixa de munição Fuzil",
          [4] = "Compressor De Ar, Barbeador Elétrico, Câmera Tecpix",
          [7] = "Purificador de ar. Óleo Lubrificante Anal",
          [8] = "Secretária Eletrônica, Camisinhas, Cabeça de Manequim",
          [9] = "Antissépticos, Frascos, Pólvora",
          [10] = "CD de Áudio, Radio de Pilha, 1d10 Comida enlatada. Como rações.",  
          [12] = "Mamadeira, Leite em Pó, Caneta, Tanque de hidrogênio explosivo, d10 de dano em um raio de 5m",
          [13] = "Monitor e Receptor de Bebê, Filtro para Máscara de Gás",
          [14] = "Assadeira, Bolsa com Artigos Esportivos",
          [15] = "Bandagem Grande, Material Esterilizante",
          [16] = "Bola de Beisebol, Colete a Prova de Balas", 
          [17] = "Luva de Beisebol, Máscara de Beisebol, Pacote de Cocaína",
          [18] = "Bola de Basquete, Tênis Adidas, Poster Cristiano Ronaldo",  
          [19] = "Balança de Banheiro, Silver Tape, Tanque de hélio, o suficiente para encher 30 balões. Quando inalado, bônus de +2 em testes de disfarçar a voz de criança por 1 minuto.",
          [20] = "Bateria, Playboy, Vibrador, Munição d10",
          [21] = "Carregador de Bateria, Fone de Ouvido",
          [22] = "Arma de Brinquedo, Bola de Futebol, Rifle Destruído",
          [23] = "Munição de Pistola, Televisão Portátil",
          [24] = "Lençol, Pinto de Borracha, Contador de Radiação",
          [25] = "Sino, Caixinha Bailarina, 1d10 barras de proteína.",
          [26] = "Bicicleta de Criança e Esportiva, Ácido Corrosivo", 
          [27] = "Carrinho de Supermercado, Controle de Vídeo Game",
          [28] = "Sino de Bicicleta, Roupa de Ciclista, Machado de Incêndio",
          [29] = "Capacete de Bicicleta, Óculos de sol Importado",
          [30] = "Binóculos, Bilhete com Senha de Cofre",
          [31] = "Manguito de Pressão Arterial, Estetoscópio",
          [32] = "Jogo de Tabuleiro, Cartas Eróticas, Mochila Velha",
          [33] = "Livro, Tablet da Apple, Coleira de Cachorro",
          [34] = "Bola de Boliche, Televisão, Chopeira",
          [35] = "Pino de Boliche, Esmaltes de Unhas",
          [36] = "Míni Serra, Martelo, Graxa, Garrafas de Vinho",
          [37] = "Caixa à Prova de Fogo e Água, com Chave",
          [38] = "Luvas de Boxe, Saco de Luta, Oculos Escuro Aviador",
          [39] = "Kit de Maquiagem, Máscara de Gás, Motoserra", 
          [40] = "Exterminador de Insetos, Isqueiro",
          [41] = "Alicate de Corte de Cabo, Saco de Cimento 50 Kg",
          [42] = "Abraçadeiras Saco com 100, Máscara de Gás", 
          [43] = "Calculadora, Painel Solar, 1d10 Baterias",
          [44] = "Computador, Kit de Unha, Saca Rolhas",
          [45] = "Câmera infravermelho, Micro-ondas, Kit Primeiro Socorros",
          [46] = "Barraca de Acampamento, 8 pessoas",
          [47] = "Cigarros 2d10, Mapa e Bilhete, Lanterna sem Pilhas",
          [48] = "Abridor de Latas, Caixinha de Fosforo.",
          [49] = "Vela, Sapatos Femininos, Roupas Femininas",
          [50] = "Canos hidráulicos, Jogo de Panelas, Lata de Gasolina",
          [51] = "Reservatório de Água Potável, Soco Inglês",
          [52] = "Revolver Velho, Cantil, Luvas Esportivas",
          [53] = "Controle de Garagem, Pilhas, Caixa de Metal", 
          [54] = "Kit de Primeiro Socorros, Papel Higiênico,",
          [55] = "Enlatados, Wisky, Bola de Futebol,",
          [56] = "Espada do Conan, Cinto, Cabeça Empalada",
          [57] = "Secador, Compressor, Violão, Cigarros 2d10",
          [58] = "Capa de Chuva, Kit de Solda",
          [59] = "Distintivo Policial, Pistola, Espelho",
          [60] = "Livro de Receitas, Baú Metal Com Dinheiro",
          [61] = "Barril de Chope Metal, Cilindro para Fermentação",
          [62] = "Material para Peixes e Anfíbios, Vara de Pesca",
          [63] = "Roupa de Guarda de Transito, Par de Algemas",
          [64] = "Absorvente, Pilulas Anticoncepcionais, Remédio Abortivo",
          [65] = "Cilindro de Gás Letal, Cilindro de Oxigênio, Motor", 
          [66] = "Central Radio Comunicador, Granadas, Lâmpadas",
          [67] = "Microscópio, Iodo, Fogão Portátil, Bomba não detonada. Qualquer impacto forte fará com que ele exploda. D10 de dano em um raio de 5m. Pesado, pode ser largado ou catapultado, mas não arremessado com os braços.",
          [68] = "Corda de Alpinismo, Cabide, Linha de Pesca, Iscas",
          [69] = "Impressora, Álbum Completo Michael Jackson",
          [70] = "Laser Verde, Cadeado Resistente com Chaves",
          [71] = "Disquete Velho, Roupa do Super Homem, Homem Aranha",
          [72] = "Moto Guardada, Chaves Reservas, Caixa Fechada - Surpresa",
          [73] = "Ração de Cachorro, Gato Animal Com Filhotes, Vídeo Game",
          [74] = "Canoa Esportiva, Nadadeiras, Mala de Senha Fechado",
          [75] = "Extintor de Incêndio, Galão de Gasolina",
          [76] = "Velas de Rituais, Cadeira de Massagem, Esteira",
          [77] = "Crucifixo, Bandeira Americana Velha, Roupa de Padre",
          [78] = "DVD de Sexo Gay, Paraquedas, Botas Militar",
          [79] = "Carro de Controle Remoto, Remédios",
          [80] = "Cabo de Chupeta, Cortador de Grama",
          [81] = "Colar Cervical, Bateria de Carro, Ventilador Industrial",
          [82] = "Armadura Medieval, Moto Serra, Caixa de Reparo",
          [83] = "Armadilha Bomba Caseira, Caixa Aberta de Metal Resistente",
          [84] = "Carrinho Improvisado de Combustível",
          [85] = "Aparelho GPS, Chaves de uma Embarcação",
          [86] = "Cinto de Acessórios, Guarda Chuva, Kit Odontológico",
          [87] = "Cesto de Carregar Animal, Isqueiro Velho",
          [88] = "Armadilha de Urso, Caixa de Pregos",
          [89] = "Mochila de Hidratação, Revolver Enferrujado",
          [90] = "Caixa de Coca Cola, Um saco de fertilizante de 50 kg.",
          [91] = "Relógio de Pulso, Pá Militar, Comprimidos. Cure 1d3 de saúde. Chance de salvar contra veneno ou usar para perder 2 pontos de um valor aleatório em Atributo.",
          [92] = "Pé de Cabra, Pesos Para Academia",
          [93] = "Serra Manual de Construção",
          [94] = "Arma de Paintball, Corda, Algema",
          [95] = "Guitarra, Alarme Despertador",
          [96] = "Filtro para Aquário, Desentupidor de Borracha",
          [97] = "Sino de Vento Sonoro com Pequenos Metais Brilhantes",
          [98] = "Sensor de Presença Sonoro",
          [99] = "Chocalho, Megafone, Cordas de Violão",
          [100] = "Sensor de Estacionamento Wifi",
          [101] = "Uma bateria de carro descarregada. Contém ácido sulfúrico: veneno (1d10).",
          [102] = "Uniforme Do Exercito Alemão",
          [103] = "Alicate Cortador de Cerca, Bússola",
          [104] = "Coldre, Lâmpadas, Liquidificador",
          [105] = "Bastão de Luz Química Laranja",
          [106] = "Máscara de gás - 1 Filtro, Isqueiro",
          [107] = "Cigarro (1- 20), Bola de Tênis",
          [108] = "Mapa, Atlas Marcado Com Estradas",
          [109] = "Rádio Comunicador Simples",
          [110] = "Apito para Cachorro, Bíblia Sagrada",
          [111] = "Microscópio, Frascos Cilíndricos de Vidro, Frascos Quimicos",
          [112] = "Chaves de um Helicóptero, Quepe Policial",
          [113] = "Cela de Cavalo para Montaria",
          [114] = "Armadilha Improvisada Escopeta",
          [115] = "Peruca, Seios de Silicone, Lanterna Velha",
          [116] = "Corda (9 Metros), Boneco UFC",
          [117] = "Saco com Drogas, Centrifuga, Produtos Químicos", 
          [118] = "Gerador de Energia, Ração para Aves 50 kg",
          [119] = "Correntes de Metal 5 Metros",
          [120] = "Moto de Trilha, Triciclo, Não Possui Chaves",
          [121] = "Maquininha de Tatuagem, Kit Instrumentais Cirúrgicos",
          [122] = "Detector de Monóxido de Carbono",
          [123] = "Carrinho de Bebê, Chá Calmante",
          [124] = "Caixa de Metal com Dinheiro - Possui Chave",
          [125] = "Fita Isolante, Boné de Personagem",
          [126] = "Braçadeira, Medidor de Barulho Sonoro",
          [127] = "Telefone Celular, Serra Circular",
          [128] = "Tigela de Cerâmica, Arame Farpado",
          [129] = "Fato Químico Encapsulado",
          [130] = "Cinzel, Lamparina, Cadeira Dobrável",
          [131] = "Frascos de Vacina Animal",
          [132] = "Martelo de Garra, Luvas, Apito de Segurança",
          [133] = "Lâmpada, Tridente, Roupa de Jardinagem",
          [134] = "Relógio Digital + Rádio, Livro de Jardinagem",
          [135] = "Ferro de Passar Roupas Elétrico",
          [136] = "Cafeteira Elétrica, Pacote de Rosquinha",
          [137] = "Pinto de Borracha, Camisinhas, Peruca",
          [138] = "Revista em Quadrinhos, Berrante, Botas de Boiadeiro de Couro",
          [139] = "Mouse de Computador, com fio, HD Externo",
          [140] = "Mouse de Computador, sem fio, Autoclave, Laringoscópio (Para Ventilação)",
          [141] = "Alto-Falantes de Computador, Cinto de Granada",
          [142] = "Controle de Videogame, Fone de Ouvido",
          [143] = "Refrigerador, Pendulo Para Carnes Bovinas",
          [144] = "Lápis de Cor 15 Cores, Mochila, Pistola de Cola Quente",
          [145] = "Chave inglesa 74, Coo-ler com Rodinhas",
          [146] = "Ferramenta de Crimpagem, Solda, Materiais de Construção Civil",
          [147] = "Pé-De-Cabra, Materiais de Construção Civil, Britadeira",
          [148] = "Muleta de Alumínio, Galão de Gasolina",
          [149] = "Relógio Cuco, Quarto Completo, Posteres de Ídolos",
          [150] = "Forma de Bolo, Copos em Metal, Laptop velho e pesado. Teste de Sorte para que ainda funcione. Qual poderia ser a senha?",
          [151] = "Lâmpada de Mesa, Estoque de Bebidas Alcoólicas",
          [152] = "Grampeador de Mesa, Lanche Rápido - Batata - Bolacha",
          [153] = "Reprodutor de Música Digital (8 GB Com Cabo)",
          [154] = "Termômetro Digital, Cozinha Completa",
          [155] = "Tigela de Cachorro, Livro Religioso",
          [156] = "Náilon, Ferramentas de Construção, Arame Farpado",
          [157] = "Coleira de Cão com Espinhos, Panela de Pressão",
          [158] = "Granada de Fumaça, Pneus Veicular",
          [158] = "Torradeira Elétrica, Caixa de Temperos para as Refeições", 
          [159] = "Manivela, Caixa De Sementes",
          [160] = "Silver Tape, Toca Disco, Bumerangue",
          [161] = "Pá de Lixo, Bombinhas de São João",
          [162] = "DVD virgem, Bastão de Beisebol",
          [163] = "Filme O Poderoso Chefão, Xuxa",
          [164] = "Chaleira Elétrica, Lanche Rápido - Doritos",
          [165] = "Lixadeira Elétrica, Fita Isolante, Chave de Roda",
          [166] = "Cabo de Extensão Elétrico, 10 Metros",
          [168] = "Silver Tape, Espada de Bambu, Chapéu",
          [169] = "Cabo Eletrônico 5 metros, Água Mineral, Entalado Sardinha",
          [170] = "Quadro de Pintura para Desenho",
          [171] = "Ventilador, Televisão Fina, Óculos de Grau",
          [172] = "Furadeira, Coquetel Molotov",
          [173] = "Álcool, Alarme Antigo, Pedaços de Pano",
          [174] = "Fogos de Artifício Bombinhas, Rojão",
          [175] = "Antena de Comunicação, Walkie Tock do BEN-10",
          [176] = "Partes de Circuito, Fios Elétricos Simples",
          [178] = "Componentes Para Armas de Fogo, Molas, Lubrificantes",
          [179] = "CDs de Música e DvD Infantis, Panela Elétrica",
          [180] = "Vídeo Cassete, Camiseta Assinado Pela Madona",
          [181] = "Notebook, Spray de Tinta, Caixa de Fosforo (D10)",
          [182] = "Caixa de Munição, Detector de Fumaça",
          [183] = "Ursinho de Pelúcia, Bichinho que aperta e faz Barulho",
          [184] = "Artefato Explosivo, Dinamite",
          [185] = "Caixa de Produtos Químicos Perigosos, Microfone",
          [186] = "Agrotóxico, Borrifador Mecânico",
          [187] = "Kit Médico Cirúrgico (Instrumentais)",
          [188] = "Peças Mecânicas Automotivas, Colete", 
          [189] = "Kit de Itens Esportivos, Taco de Sinuca, Bolas de Bilhar",
          [190] = "Botijão de Gás, Chapinha de Cabelo",
          [191] = "Placa de Energia Solar, Mini Vaso Químico Portátil",
          [192] = "Vara de Pesca, Flechas, Bebedouro Desativado",
          [193] = "Fação, Espada de Samurai",
          [194] = "Alvo Para Tiro, Bandana de Rock",
          [195] = "Aquecedor Elétrico, Esqueleto de Manequim",
          [196] = "Material Higiênico, Alternador de Eletricidade",
          [196] = "Aparelhagem de Raio-x, Instrumentos Odontológicos",
          [197] = "Granada, Revista Playboy",
          [198] = "Otorrinolaringologia, Bico de Pato (Genecologia)",
          [199] = "Anotações Importantes, Cadeira de Rodas",
          [200] = "Pistola Sinalizadora Laranja, Colete Salva-Vivas",
          [201] = "Flecha Com Ponta Explosiva, Botas Militares",
          [202] = "Claymore, Colete Militar, Poster do Rambo",
          [203] = "Dinamites - Instáveis Vazando Óleo",
          [204] = "Cela de Montaria, Ração Animal",
          [205] = "2 pneus de trator velho, óculos de aros de metal quebrados",
          [206] = "Serra de madeira sem corte",
          [207] = "Pés de pranchas 2x4punhado de pregos enferrujados",
          [208] = "Pote de cola de madeira, enxada de jardim",
          [209] = "Olho de vidro, Cadeira de massagem com Circuitos",
          [210] = "Cutelo de açougueiro enferrujado, Cama de Massagem com Circuitos",
          [211] = "Carrinho de compras, Walkie Talkie, Foto de Crianças",
          [212] = "Kit de costura pessoal, Sino de mão, Câmera Roll D8 [1-6: Quebrado; 7-8: Contém Filme]",
          [213] = "Agulha de Tricô, Rolo D20 Enfeites de Natal, Proteção Torso + Capacete",
          [214] = "Caneca de Café, Urso Teddy, Caneta Tinteira, Fogão Portátil, Torso de Manequim",
          [215] = "Foto Emoldurada de Político do Velho Mundo, Mapa Topográfico Subaquático",
          [216] = "Cardápio do Restaurante, Carro de Brinquedo Eletrico",
          [217] = "Rolos de cabelo, Espátula de jardinagem, Frasco Anéstésico 1d10",
          [218] = "Macarrão Seco, Maconha Prensada, Livro Intacto, Cofre",
          [219] = "Lanterna de Helicóptero, Crânio Humano Carbonizado, Carcaça de Helicóptero",
          [220] = "Botas de Alpinismo, Placa de Carro, Caça-Níquel de Alavanca, Agulha Hipodérmica",
          [221] = "Garrafa de Café Vazia - Moedas Antigas, Garrafa de Uísque",
          [222] = "Caixas com D30 Vidro Ornamentais, Boneca Falante Pilhas no Final",
          [223] = "Bolso Cheio de Moedas, Revista de Mulheres Peladas",
          [224] = "Volante, Triciclo de Criança, Bule Para Chá, Roupa do Papai Noel",
          [225] = "Espelho de Mão, iPod, Panela de Arroz Elétrica",
          [226] = "Pequena Célula de Energia, Rádio Comunicador",
          [227] = "Guarda-Chuva, Sutiã de Mulher, Sinta Liga",
          [228] = "Perfume, Cloro, Desinfetante, Máscara para Mergulho com Canudo",
          [229] = "Rodinha de Academia Abdominal, Barra de Metal para Parede (Exercícios)",
          [230] = "Peixe - Taxidermia, Manequim de Poliuretano Para Empalhamento.",
          [231] = "Disco de Vinil (D10) mochila (role 3 vezes (AQUI NA LISTA) para ver o conteúdo)",
          [232] = "Jarra Cheia de Areia, Rolo de caixa de chumbo 1d10 x Rolo 1d10 x 16",
          [233] = "Rolo D10 Blocos de Brinquedo de Madeira, Caixa de Fósforos",
          [234] = "Saco de Mármores Role 2d12 Mármores, Livro de Contos Infantis",
          [235] = "Capa de Bolo de Casamento, Vela de Parafina, Secador de Cabelo",
          [236] = "Meia Usada, Pedra de Amolar, Revista de Publicação para Adultos (Gay - Zoofilia)",
          [237] = "Enlatados, Celular Rosa, Manequim de Ferro, Aquecedor Elétrico de Água",
          [238] = "Engrenagens Mecânicas, Drone sem Controle e Bateria",
          [239] = "Caixa de Música, Role D4 (1-2 Defeitos / 3-4 Funcionando)",
          [240] = "Caixão, Tamanho Infantil, Formol, Corpos Dissecados",
          [241] = "Rádio Portátil, Pato de Borracha, Toalha de chá, Esqueleto de Brinquedo",
          [242] = "Traje Quimico. Protege contra radiação e veneno transportado pelo ar. Sem valor de armadura, mas ocupa espaço de armadura. Perde a utilidade quando danificado.243 - Barco de Remo, Roupa de Ski, Equipamento de Escalada",
          [244] = "Cofre Antigo Velho, Anão de Jardim, Carrinho do Papai Noel",
          [245] = "Maquina de Refrigerante e Salgadinhos Antigo, Almofada Macia Com Plumas",
          [246] = "Cadeira de Balanço, Concha de Praia, Ração de Comida Canina",
          [247] = "Cinto de Couro, Caneta, Lâmpada Com Sensor de Presença",
          [248] = "Caixa de Lâmpadas, Roll D30 Intactas",
          [249] = "Saco de Cimento (Usado), Tinta Vermelha para Parede",
          [250] = "Prótese Dentaria, Caneta Motor de Dentista, Remédios Anti-inflamatórios",
          [251] = "Espelho, Pente, Kit Higiênico, Esmalte de Unha, Peruca Loira",
          [252] = "Cabo de Bateria, Aparelho Medidor de Radiação",
          [253] = "Jarra Contendo Dentes D12, Feto em Conserva, Instrumentos de Parto",
          [254] = "Faca, Diagrama de Chip de Água Carbonizada",
          [255] = "Medidor de Velocidade, Medidor de Temperatura Corporal", 
        }
      
        -- Rolar dado e obter resultado
        local resultado = math.random(1, 255)
      
        -- Enviar mensagem com o resultado nomeado
        if resultado ~= nil then
          local mensagem = "[§B][§K11] Você Encontrou: [§K5][§B]" .. mapeamento[resultado]
          chat:enviarMensagem(mensagem)
        end
      end
            


    obj.ItensComuns = GUI.fromHandle(_obj_newObject("button"));
    obj.ItensComuns:setParent(obj);
    obj.ItensComuns:setName("ItensComuns");
    obj.ItensComuns:setText("Rolar Itens comuns");
    obj.ItensComuns:setWidth(152);
    obj.ItensComuns:setHeight(30);
    obj.ItensComuns:setLeft(0);
    obj.ItensComuns:setTop(0);
    lfm_setPropAsString(obj.ItensComuns, "fontStyle",  "bold");
    obj.ItensComuns:setFontColor("black");

    obj._e_event0 = obj.ItensComuns:addEventListener("onClick",
        function (_)
            rolarDado(sheet)
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.ItensComuns ~= nil then self.ItensComuns:destroy(); self.ItensComuns = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmRollItens()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmRollItens();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmRollItens = {
    newEditor = newfrmRollItens, 
    new = newfrmRollItens, 
    name = "frmRollItens", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmRollItens = _frmRollItens;
Firecast.registrarForm(_frmRollItens);

return _frmRollItens;
