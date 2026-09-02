local BancoItens = {}

BancoItens.ranks = {"E", "D", "C", "B", "A", "S"}

BancoItens.rankOrdem = {
    E = 1,
    D = 2,
    C = 3,
    B = 4,
    A = 5,
    S = 6
}

BancoItens.tiposArma = {
    "Espada",
    "Machado",
    "Martelo",
    "Maca",
    "Lanca",
    "Adaga",
    "Chicote",
    "Arco",
    "Besta",
    "Cajado",
    "Orbe",
    "Braco Acoplado"
}

BancoItens.tiposArmadura = {
    "Capacete",
    "Peitoral",
    "Calca",
    "Bota",
    "Escudo"
}

BancoItens.profissoes = {
    "-",
    "COLETOR",
    "CARPINTEIRO",
    "FERREIRO",
    "MERCADOR",
    "ALQUIMISTA"
}

BancoItens.framesProfissao = {
    ["-"] = "Frames/geral.png",
    COLETOR = "Frames/Coleta.jpg",
    CARPINTEIRO = "Frames/geral.png",
    FERREIRO = "Frames/ferreiro.png",
    MERCADOR = "Frames/geral.png",
    ALQUIMISTA = "Frames/Alquimista.jpg"
}

BancoItens.materiais = {
    minerios = {
        E = {
            id = "lingote_bronze_refinado",
            nome = "Lingote de Bronze Refinado",
            categoria = "material",
            tipo = "minerio",
            rank = "E",
            precoPrata = 18,
            localizacao = "Minas rasas, cavernas comuns e regioes de extracao basica.",
            descricao = "Um lingote de bronze refinado, usado em criacoes simples de Rank E.",
            imagemUrl = "https://blob.firecast.com.br/blobs/RHNUABTL_3817952/c77fdac6324274f6327b7a19c98283ba-removebg-.png"
        },
        D = {
            id = "lingote_ferro_comum",
            nome = "Lingote de Ferro Comum",
            categoria = "material",
            tipo = "minerio",
            rank = "D",
            precoPrata = 26,
            localizacao = "Minas comuns, pedreiras antigas e depositos de ferro.",
            descricao = "Um lingote de ferro comum, resistente o bastante para equipamentos de Rank D.",
            imagemUrl = "https://blob.firecast.com.br/blobs/RECWEIOK_3817943/79195f37b60f2969089d0c58ebc39d84-removebg-.png"
        },
        C = {
            id = "lingote_aco",
            nome = "Lingote de Aco",
            categoria = "material",
            tipo = "minerio",
            rank = "C",
            precoPrata = 43,
            localizacao = "Minas profundas, forjas urbanas e fortalezas abandonadas.",
            descricao = "Um lingote de aco preparado para fabricar equipamentos confiaveis de Rank C.",
            imagemUrl = "https://blob.firecast.com.br/blobs/DCQOMPGM_3817958/f5e47e7b3b5497afa3a526e7a1d681b6-removebg-.png"
        },
        B = {
            id = "lingote_mithril",
            nome = "Lingote de Mithril",
            categoria = "material",
            tipo = "minerio",
            rank = "B",
            precoPrata = 78,
            localizacao = "Veios raros em montanhas antigas e minas protegidas.",
            descricao = "Um lingote leve e resistente, usado em criacoes superiores de Rank B.",
            imagemUrl = "https://blob.firecast.com.br/blobs/TIDOQCPJ_3817964/af008864eaa594e23f45c41c21e4239e-removebg-.png"
        },
        A = {
            id = "lingote_adamantita",
            nome = "Lingote de Adamantita",
            categoria = "material",
            tipo = "minerio",
            rank = "A",
            precoPrata = 148,
            localizacao = "Profundezas perigosas, ruinas ancestrais e minas seladas.",
            descricao = "Um lingote extremamente duro, adequado para obras de mestre de Rank A.",
            imagemUrl = "https://blob.firecast.com.br/blobs/JKSDGTFV_3817968/6f80c7f49546ed5e7b4d85a475c76e5d-removebg-.png"
        },
        S = {
            id = "lingote_cristal_estrelas",
            nome = "Lingote de Cristal das Estrelas",
            categoria = "material",
            tipo = "minerio",
            rank = "S",
            precoPrata = 308,
            localizacao = "Crateras celestes, regioes misticas e locais tocados por energia astral.",
            descricao = "Um lingote rarissimo com brilho estelar, usado em criacoes lendarias de Rank S.",
            imagemUrl = "https://blob.firecast.com.br/blobs/WJSPHWLJ_3818679/6e81beb3f69d02c615d0e344e68e8fdb-removebg-.png"
        }
    },

    couros = {
        E = {
            id = "couro_simples",
            nome = "Couro Simples",
            categoria = "material",
            tipo = "couro",
            rank = "E",
            precoPrata = 15,
            localizacao = "Animais comuns, cacadas simples e mercados locais.",
            descricao = "Couro basico usado em pecas leves e reforcos simples de Rank E.",
            imagemUrl = "https://blob.firecast.com.br/blobs/HCAWNAJG_3825228/OIG2.WV1ywlJs2-removebg-preview.png"
        },
        D = {
            id = "couro_grosso",
            nome = "Couro Grosso",
            categoria = "material",
            tipo = "couro",
            rank = "D",
            precoPrata = 23,
            localizacao = "Feras maiores, regioes selvagens e curtumes especializados.",
            descricao = "Couro mais espesso, usado em equipamentos de Rank D.",
            imagemUrl = "https://blob.firecast.com.br/blobs/IWLBPDKA_3825238/09fbfb2e-3228-4683-b812-8055c8d0cc65-remov.png"
        },
        C = {
            id = "couro_reforcado",
            nome = "Couro Reforcado",
            categoria = "material",
            tipo = "couro",
            rank = "C",
            precoPrata = 40,
            localizacao = "Bestas resistentes, monstros de medio porte e oficinas de curtimento.",
            descricao = "Couro tratado e reforcado para suportar criacoes de Rank C.",
            imagemUrl = "https://blob.firecast.com.br/blobs/LEIDMJGV_3825244/OIG3-removebg-preview__2_.png"
        },
        B = {
            id = "couro_adornado",
            nome = "Couro Adornado",
            categoria = "material",
            tipo = "couro",
            rank = "B",
            precoPrata = 75,
            localizacao = "Criaturas raras, cacadas perigosas e artesaos nobres.",
            descricao = "Couro de alta qualidade, adornado e preparado para itens de Rank B.",
            imagemUrl = "https://blob.firecast.com.br/blobs/IUGFGAIU_3825259/c6b5ff6f-a6ec-423f-ae80-ab1632889bc9-remov.png"
        },
        A = {
            id = "couro_draconico",
            nome = "Couro Draconico",
            categoria = "material",
            tipo = "couro",
            rank = "A",
            precoPrata = 145,
            localizacao = "Criaturas draconicas, regioes vulcanicas e covis antigos.",
            descricao = "Couro resistente de origem draconica, usado em equipamentos de Rank A.",
            imagemUrl = "https://blob.firecast.com.br/blobs/TTESGUKE_3825267/OIG1-removebg-preview__2_.png"
        },
        S = {
            id = "couro_celesti",
            nome = "Couro Celesti",
            categoria = "material",
            tipo = "couro",
            rank = "S",
            precoPrata = 305,
            localizacao = "Criaturas celestiais, planos superiores e territorios sagrados.",
            descricao = "Couro rarissimo de natureza celestial, usado em criacoes lendarias de Rank S.",
            imagemUrl = "https://blob.firecast.com.br/blobs/OLGAQAJC_3825272/OIG4-removebg-preview__1_.png"
        }
    },

    madeiras = {
        E = {
            id = "madeira_simples",
            nome = "Madeira Simples",
            categoria = "material",
            tipo = "madeira",
            rank = "E",
            precoPrata = 12,
            localizacao = "Bosques comuns, campos arborizados e vilas rurais.",
            descricao = "Madeira comum usada em criacoes simples de Rank E.",
            imagemUrl = "https://blob.firecast.com.br/blobs/HLRLQVJO_4511972/4d23a05b-0d1a-46fb-9cfb-f88a84fa1d59.png"
        },
        D = {
            id = "madeira_resistente",
            nome = "Madeira Resistente",
            categoria = "material",
            tipo = "madeira",
            rank = "D",
            precoPrata = 20,
            localizacao = "Florestas densas, trilhas selvagens e arvores antigas.",
            descricao = "Madeira firme usada em criacoes de Rank D.",
            imagemUrl = "https://blob.firecast.com.br/blobs/AUCQHSUV_4511974/f0972bc4-4a6f-4a34-a058-58eeb509bc2d.png"
        },
        C = {
            id = "madeira_carvalho",
            nome = "Madeira de Carvalho",
            categoria = "material",
            tipo = "madeira",
            rank = "C",
            precoPrata = 37,
            localizacao = "Carvalhais antigos, reservas protegidas e oficinas de carpintaria.",
            descricao = "Madeira de qualidade usada em criacoes de Rank C.",
            imagemUrl = "https://blob.firecast.com.br/blobs/VOAOQPFN_4511975/d3a70371-ee9d-4b38-947e-8efbac4de875.png"
        },
        B = {
            id = "madeira_nobre",
            nome = "Madeira Nobre",
            categoria = "material",
            tipo = "madeira",
            rank = "B",
            precoPrata = 72,
            localizacao = "Bosques raros, terras nobres e florestas profundas.",
            descricao = "Madeira refinada usada em criacoes superiores de Rank B.",
            imagemUrl = "https://blob.firecast.com.br/blobs/EFGUDLUJ_4511976/8ddb748a-fb79-42bc-9ca1-2179b4d97ea6.png"
        },
        A = {
            id = "madeira_ancestral",
            nome = "Madeira Ancestral",
            categoria = "material",
            tipo = "madeira",
            rank = "A",
            precoPrata = 142,
            localizacao = "Arvores milenares, ruinas naturais e regioes encantadas.",
            descricao = "Madeira antiga e poderosa usada em criacoes avançadas de Rank A.",
            imagemUrl = "https://blob.firecast.com.br/blobs/IHCHUARC_4511977/5fbf39bb-7f5c-4696-9631-65c7af3766ff.png"
        },
        S = {
            id = "madeira_sagrada",
            nome = "Madeira Sagrada",
            categoria = "material",
            tipo = "madeira",
            rank = "S",
            precoPrata = 302,
            localizacao = "Bosques sagrados, planos superiores e territorios intocados.",
            descricao = "Madeira lendaria usada em criacoes de Rank S.",
            imagemUrl = "https://blob.firecast.com.br/blobs/CIVWCJOM_4511978/e5d2bc86-bfbb-4383-b017-0afb93832133.png"
        }
    },

    ervas = {
        E = {
            id = "verdolina_simples",
            nome = "Verdolina Simples",
            categoria = "material",
            tipo = "erva",
            rank = "E",
            precoPrata = 10,
            localizacao = "Campos abertos, beiras de estrada e clareiras comuns.",
            descricao = "Erva simples de propriedades leves, usada em alquimia de Rank E.",
            imagemUrl = "https://blob.firecast.com.br/blobs/HOKCPFQH_3825316/5f798458-390b-4609-9f5c-69897d701eed-remov.png"
        },
        D = {
            id = "braverva",
            nome = "Braverva",
            categoria = "material",
            tipo = "erva",
            rank = "D",
            precoPrata = 18,
            localizacao = "Florestas densas, trilhas selvagens e margens de rios.",
            descricao = "Erva vigorosa, usada em preparos alquimicos de Rank D.",
            imagemUrl = "https://blob.firecast.com.br/blobs/ELGQRGLV_3825331/dff3ce87-bb5a-4e46-8667-581a3d5dd5a1-remov.png"
        },
        C = {
            id = "noctifolio",
            nome = "Noctifolio",
            categoria = "material",
            tipo = "erva",
            rank = "C",
            precoPrata = 35,
            localizacao = "Bosques sombrios, cavernas umidas e areas de pouca luz.",
            descricao = "Folhagem escura que cresce melhor longe do sol, usada em receitas de Rank C.",
            imagemUrl = "https://blob.firecast.com.br/blobs/KPEGVJRP_3825326/OIG1.L-removebg-preview.png"
        },
        B = {
            id = "raiz_de_sa",
            nome = "Raiz-de-Sa",
            categoria = "material",
            tipo = "erva",
            rank = "B",
            precoPrata = 70,
            localizacao = "Terras antigas, florestas profundas e solos carregados de energia.",
            descricao = "Raiz rara e potente, valorizada em alquimia de Rank B.",
            imagemUrl = "https://blob.firecast.com.br/blobs/HWOHMQIV_3825322/7b2bbcbe-3dda-436f-9769-d4e10cb3dd9c-remov.png"
        },
        A = {
            id = "flor_de_vahrun",
            nome = "Flor de Vahrun",
            categoria = "material",
            tipo = "erva",
            rank = "A",
            precoPrata = 140,
            localizacao = "Jardins esquecidos, ruinas antigas e regioes encantadas.",
            descricao = "Flor de grande poder alquimico, usada em preparos avancados de Rank A.",
            imagemUrl = "https://blob.firecast.com.br/blobs/IIQUMHTQ_3825338/bca01fc3-8835-4c4c-8665-aa4dacbaea0c-remov.png"
        },
        S = {
            id = "selenita",
            nome = "Selenita",
            categoria = "material",
            tipo = "erva",
            rank = "S",
            precoPrata = 300,
            localizacao = "Locais banhados por luar mistico, santuarios antigos e vales sagrados.",
            descricao = "Erva lendaria de brilho lunar, usada em alquimia de Rank S.",
            imagemUrl = "https://blob.firecast.com.br/blobs/JFDFIKJG_3825308/c74675ab-ecbf-404a-a416-a3e1e0bc5970-remov.png"
        }
    },

    cristais = {
        E = {
            id = "cristal_opaco",
            nome = "Cristal Opaco",
            categoria = "material",
            tipo = "cristal",
            rank = "E",
            precoPrata = 20,
            localizacao = "Cavernas rasas, veios minerais comuns e ruinas antigas.",
            descricao = "Cristal opaco de baixa pureza, usado em criacoes e encantamentos simples de Rank E.",
            imagemUrl = "https://blob.firecast.com.br/blobs/PFSSTFTB_4511980/c581b79e-45ce-4186-b9a1-91f7b8dfd2e0.png"
        },
        D = {
            id = "cristal_azul",
            nome = "Cristal Azul",
            categoria = "material",
            tipo = "cristal",
            rank = "D",
            precoPrata = 28,
            localizacao = "Grutas umidas, minas com energia arcana leve e fontes subterraneas.",
            descricao = "Cristal azul com leve brilho magico, usado em criacoes de Rank D.",
            imagemUrl = "https://blob.firecast.com.br/blobs/CKGGVPTO_4511983/ea283d5a-ffae-4fa4-940e-e1c4a2baebfb.png"
        },
        C = {
            id = "cristal_violeta",
            nome = "Cristal Violeta",
            categoria = "material",
            tipo = "cristal",
            rank = "C",
            precoPrata = 45,
            localizacao = "Cavernas profundas, ruinas arcanas e regioes de fluxo magico.",
            descricao = "Cristal violeta com energia estavel, usado em itens e formulas de Rank C.",
            imagemUrl = "https://blob.firecast.com.br/blobs/JMTTRBUR_4511984/07005e65-2442-419a-bcca-e4dda116213b.png"
        },
        B = {
            id = "cristal_brilhante",
            nome = "Cristal Brilhante",
            categoria = "material",
            tipo = "cristal",
            rank = "B",
            precoPrata = 80,
            localizacao = "Montanhas encantadas, cavernas cristalinas e santuarios esquecidos.",
            descricao = "Cristal de brilho intenso, usado em criacoes superiores de Rank B.",
            imagemUrl = "https://blob.firecast.com.br/blobs/TNFQJCUV_4511987/21a0fc20-3887-4e43-ac08-5ad90d8cb20a.png"
        },
        A = {
            id = "cristal_raro",
            nome = "Cristal Raro",
            categoria = "material",
            tipo = "cristal",
            rank = "A",
            precoPrata = 150,
            localizacao = "Ruinas ancestrais, depositos arcanos raros e territorios perigosos.",
            descricao = "Cristal raro de grande valor, usado em criacoes avancadas de Rank A.",
            imagemUrl = "https://blob.firecast.com.br/blobs/HBVRUKAH_4511988/5ddf4848-1534-487b-a5f6-4799eb347a5e.png"
        },
        S = {
            id = "cristal_ancestral",
            nome = "Cristal Ancestral",
            categoria = "material",
            tipo = "cristal",
            rank = "S",
            precoPrata = 310,
            localizacao = "Templos perdidos, planos antigos e regioes de poder ancestral.",
            descricao = "Cristal lendario carregado de energia ancestral, usado em criacoes de Rank S.",
            imagemUrl = "https://blob.firecast.com.br/blobs/FRPUNJNN_4511990/14690a3c-e754-471c-b97f-ed25407a7540.png"
        }
    }
,

    frascos = {
        E = {
            id = "frasco_vazio_e",
            nome = "Frasco Vazio",
            categoria = "material",
            tipo = "frasco",
            rank = "E",
            precoPrata = 5,
            localizacao = "Lojas de alquimia, mercados comuns e bancadas de iniciantes.",
            descricao = "Frasco vazio usado em receitas alquimicas de Rank E.",
            imagemUrl = "https://blob.firecast.com.br/blobs/FGVTMQHM_4514247/frasco_vazio.png"
        },
        D = {
            id = "frasco_vazio_d",
            nome = "Frasco Vazio",
            categoria = "material",
            tipo = "frasco",
            rank = "D",
            precoPrata = 10,
            localizacao = "Lojas de alquimia e fornecedores de reagentes.",
            descricao = "Frasco vazio usado em receitas alquimicas de Rank D.",
            imagemUrl = "https://blob.firecast.com.br/blobs/NFMQFMGA_4517022/frasco_d.png"
        },
        C = {
            id = "frasco_vazio_c",
            nome = "Frasco Vazio",
            categoria = "material",
            tipo = "frasco",
            rank = "C",
            precoPrata = 18,
            localizacao = "Guildas alquimicas e mercados especializados.",
            descricao = "Frasco vazio usado em receitas alquimicas de Rank C.",
            imagemUrl = "https://blob.firecast.com.br/blobs/VKVISEND_4517020/frasco_c.png"
        },
        B = {
            id = "frasco_vazio_b",
            nome = "Frasco Vazio",
            categoria = "material",
            tipo = "frasco",
            rank = "B",
            precoPrata = 35,
            localizacao = "Fornecedores raros e atelies alquimicos avancados.",
            descricao = "Frasco vazio usado em receitas alquimicas de Rank B.",
            imagemUrl = "https://blob.firecast.com.br/blobs/DUAFPHWT_4517023/frasco_b.png"
        },
        A = {
            id = "frasco_vazio_a",
            nome = "Frasco Vazio",
            categoria = "material",
            tipo = "frasco",
            rank = "A",
            precoPrata = 70,
            localizacao = "Guildas nobres, laboratorios arcanos e mercadores raros.",
            descricao = "Frasco vazio usado em receitas alquimicas de Rank A.",
            imagemUrl = "https://blob.firecast.com.br/blobs/OTFLVBPE_4517024/frasco_a.png"
        },
        S = {
            id = "frasco_vazio_s",
            nome = "Frasco Vazio",
            categoria = "material",
            tipo = "frasco",
            rank = "S",
            precoPrata = 150,
            localizacao = "Laboratorios lendarios, tesouros antigos e mercados excepcionais.",
            descricao = "Frasco vazio usado em receitas alquimicas de Rank S.",
            imagemUrl = "https://blob.firecast.com.br/blobs/BIGKGJHB_4517021/frasco_s.png"
        }
    }
}

BancoItens.componentes = {
    empunhaduras = {
        simples = {id = "empunhadura_simples", nome = "Simples", categoria = "componente", tipo = "empunhadura", localizacao = "Oficinas comuns, lojas de ferreiro e artesanato basico.", descricao = "Empunhadura simples usada na fabricacao de armas.", imagemUrl = ""},
        reforcada = {id = "empunhadura_reforcada", nome = "Reforcada", categoria = "componente", tipo = "empunhadura", localizacao = "Forjas especializadas e oficinas de armeiros.", descricao = "Empunhadura mais firme e resistente, usada em armas de melhor acabamento.", imagemUrl = ""},
        carvalho = {id = "empunhadura_carvalho", nome = "Carvalho", categoria = "componente", tipo = "empunhadura", localizacao = "Carpintarias, bosques antigos e oficinas de artesanato fino.", descricao = "Empunhadura de madeira de carvalho, firme e duravel.", imagemUrl = ""},
        nobre = {id = "empunhadura_nobre", nome = "Nobre", categoria = "componente", tipo = "empunhadura", localizacao = "Artesaos nobres, guildas de ferreiros e mercados raros.", descricao = "Empunhadura refinada para armas de alta qualidade.", imagemUrl = ""},
        encantada = {id = "empunhadura_encantada", nome = "Encantada", categoria = "componente", tipo = "empunhadura", localizacao = "Guildas arcanas, ruinas encantadas e artesaos raros.", descricao = "Empunhadura tratada com energia magica, usada em armas especiais.", imagemUrl = ""}
    },

    revestimentos = {
        simples = {id = "revestimento_simples", nome = "Revestimento Simples", categoria = "componente", tipo = "revestimento", localizacao = "Oficinas comuns, curtumes e lojas de artesanato.", descricao = "Revestimento simples usado na fabricacao de armaduras.", imagemUrl = ""},
        reforcado = {id = "revestimento_reforcado", nome = "Revestimento Reforcado", categoria = "componente", tipo = "revestimento", localizacao = "Curtumes especializados e oficinas de armaduras.", descricao = "Revestimento resistente para armaduras de melhor qualidade.", imagemUrl = ""},
        encantado = {id = "revestimento_encantado", nome = "Revestimento Encantado", categoria = "componente", tipo = "revestimento", localizacao = "Guildas arcanas, ruinas encantadas e artesaos raros.", descricao = "Revestimento tratado com energia magica para armaduras superiores.", imagemUrl = ""}
    }
}

BancoItens.moldes = {armas = {}, armaduras = {}}

for _, tipoArma in ipairs(BancoItens.tiposArma) do
    local id = "molde_arma_" .. string.lower(tipoArma):gsub(" ", "_")
    BancoItens.moldes.armas[tipoArma] = {id = id, nome = "Molde de " .. tipoArma, categoria = "componente", tipo = "molde", subtipo = "arma", equipamentoTipo = tipoArma, localizacao = "Ferreiros, guildas de forja e lojas de moldes.", descricao = "Molde usado para fabricar armas do tipo " .. tipoArma .. ".", imagemUrl = ""}
end

for _, tipoArmadura in ipairs(BancoItens.tiposArmadura) do
    local id = "molde_armadura_" .. string.lower(tipoArmadura):gsub(" ", "_")
    BancoItens.moldes.armaduras[tipoArmadura] = {id = id, nome = "Molde de " .. tipoArmadura, categoria = "componente", tipo = "molde", subtipo = "armadura", equipamentoTipo = tipoArmadura, localizacao = "Armeiros, guildas de fabricacao e lojas de moldes.", descricao = "Molde usado para fabricar armaduras do tipo " .. tipoArmadura .. ".", imagemUrl = ""}
end

BancoItens.equipamentos = {armas = {}, armaduras = {}}

function BancoItens.existeRank(rank)
    return BancoItens.rankOrdem[rank] ~= nil
end

function BancoItens.getFrameProfissao(profissao)
    return BancoItens.framesProfissao[tostring(profissao or "-")] or BancoItens.framesProfissao["-"]
end

function BancoItens.getMaterial(tipoMaterial, rank)
    if tipoMaterial == "minerio" then
        return BancoItens.materiais.minerios[rank]
    elseif tipoMaterial == "couro" then
        return BancoItens.materiais.couros[rank]
    elseif tipoMaterial == "madeira" then
        return BancoItens.materiais.madeiras[rank]
    elseif tipoMaterial == "erva" then
        return BancoItens.materiais.ervas[rank]
    elseif tipoMaterial == "cristal" then
        return BancoItens.materiais.cristais[rank]
    elseif tipoMaterial == "frasco" then
        return BancoItens.materiais.frascos[rank]
    end

    return nil
end

function BancoItens.criarArma(tipoArma, rank, empunhaduraId, imagemUrl)
    if not BancoItens.existeRank(rank) then return nil end

    local minerio = BancoItens.materiais.minerios[rank]
    local molde = BancoItens.moldes.armas[tipoArma]
    local empunhadura = BancoItens.componentes.empunhaduras[empunhaduraId or "simples"]

    if minerio == nil or molde == nil or empunhadura == nil then return nil end

    local nomeMaterial = minerio.nome:gsub("Lingote de ", "")
    local idTipo = string.lower(tipoArma):gsub(" ", "_")
    local id = "arma_" .. idTipo .. "_" .. minerio.id .. "_" .. rank

    return {
        id = id,
        nome = tipoArma .. " de " .. nomeMaterial,
        categoria = "equipamento",
        tipo = tipoArma,
        subtipo = "arma",
        empilhavel = false,
        usaQuantidade = false,
        nivelUpgrade = 0,
        textoUpgrade = "+0",
        rank = rank,
        localizacao = "Produzido por ferreiro atraves de forja.",
        descricao = tipoArma .. " de Rank " .. rank .. " fabricada com " .. minerio.nome .. ".",
        imagemUrl = imagemUrl or "",
        custoProducao = {
            minerio = {id = minerio.id, nome = minerio.nome, quantidade = 3, rank = rank},
            molde = {id = molde.id, nome = molde.nome, quantidade = 1, rank = rank},
            empunhadura = {id = empunhadura.id, nome = empunhadura.nome, quantidade = 1, rank = rank}
        }
    }
end

function BancoItens.criarArmadura(tipoArmadura, rank, materialTipo, revestimentoId, imagemUrl)
    if not BancoItens.existeRank(rank) then return nil end

    local material = nil

    if materialTipo == "couro" then
        material = BancoItens.materiais.couros[rank]
    else
        material = BancoItens.materiais.minerios[rank]
        materialTipo = "minerio"
    end

    local molde = BancoItens.moldes.armaduras[tipoArmadura]
    local revestimento = BancoItens.componentes.revestimentos[revestimentoId or "simples"]

    if material == nil or molde == nil or revestimento == nil then return nil end

    local nomeMaterial = material.nome:gsub("Lingote de ", "")
    local idTipo = string.lower(tipoArmadura):gsub(" ", "_")
    local id = "armadura_" .. idTipo .. "_" .. material.id .. "_" .. rank

    return {
        id = id,
        nome = tipoArmadura .. " de " .. nomeMaterial,
        categoria = "equipamento",
        tipo = tipoArmadura,
        subtipo = "armadura",
        empilhavel = false,
        usaQuantidade = false,
        nivelUpgrade = 0,
        textoUpgrade = "+0",
        materialTipo = materialTipo,
        rank = rank,
        localizacao = "Produzido por artesao atraves de fabricacao.",
        descricao = tipoArmadura .. " de Rank " .. rank .. " fabricado com " .. material.nome .. ".",
        imagemUrl = imagemUrl or "",
        custoProducao = {
            material = {id = material.id, nome = material.nome, tipo = materialTipo, quantidade = 3, rank = rank},
            molde = {id = molde.id, nome = molde.nome, quantidade = 1, rank = rank},
            revestimento = {id = revestimento.id, nome = revestimento.nome, quantidade = 1, rank = rank}
        }
    }
end

function BancoItens.gerarEquipamentos()
    for _, rank in ipairs(BancoItens.ranks) do
        for _, tipoArma in ipairs(BancoItens.tiposArma) do
            local arma = BancoItens.criarArma(tipoArma, rank, "simples", "")
            if arma ~= nil then BancoItens.equipamentos.armas[arma.id] = arma end
        end

        for _, tipoArmadura in ipairs(BancoItens.tiposArmadura) do
            local armaduraMetal = BancoItens.criarArmadura(tipoArmadura, rank, "minerio", "simples", "")
            local armaduraCouro = BancoItens.criarArmadura(tipoArmadura, rank, "couro", "simples", "")

            if armaduraMetal ~= nil then BancoItens.equipamentos.armaduras[armaduraMetal.id] = armaduraMetal end
            if armaduraCouro ~= nil then BancoItens.equipamentos.armaduras[armaduraCouro.id] = armaduraCouro end
        end
    end
end

function BancoItens.calcularMultiplicadorRepeticao(quantidadeCriadaIncluindoAtual)
    if quantidadeCriadaIncluindoAtual <= 10 then
        return 1
    elseif quantidadeCriadaIncluindoAtual <= 20 then
        return 0.5
    end

    return 0.25
end

BancoItens.receitasForja = {
    armas = {},
    armaduras = {
        E = {
            Capacete = {nomeItem = "Capacete de Pano Velho", tipoItem = "Capacete", precoPrata = 45, rd = 0.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/UBQTVIMF_4485147/CAPACETE.png", descricaoItem = ""},
            Peitoral = {nomeItem = "Camisa Esfarrapada", tipoItem = "Peitoral", precoPrata = 60, rd = 0.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/VUTOQTSN_4485144/PEITORAL.png", descricaoItem = ""},
            Calca = {nomeItem = "Calças Rasgadas", tipoItem = "Calca", precoPrata = 50, rd = 0.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/LGUREVWL_4485146/CAL_A.png", descricaoItem = ""},
            Bota = {nomeItem = "Sandálias de Couro Gastas", tipoItem = "Bota", precoPrata = 40, rd = 0.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/ADRUEONG_4485145/BOTA.png", descricaoItem = ""},
            Escudo = {nomeItem = "Escudo de madeira", tipoItem = "Escudo", precoPrata = 120, rd = 1, imagemestilo2 = "https://blob.firecast.com.br/blobs/VPROQFIT_4485166/ESCUDO.png", descricaoItem = ""}
        },
        D = {
            Capacete = {nomeItem = "Chapéu de Viagem", tipoItem = "Capacete", precoPrata = 90, rd = 1, imagemestilo2 = "https://blob.firecast.com.br/blobs/URFQJEFO_4485087/CHAPEU.png", descricaoItem = ""},
            Peitoral = {nomeItem = "Túnica Reforçada", tipoItem = "Peitoral", precoPrata = 140, rd = 1.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/HTSTDBHK_4485086/PEITORAL.png", descricaoItem = ""},
            Calca = {nomeItem = "Calças de Lona", tipoItem = "Calca", precoPrata = 120, rd = 1.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/DNVVUFGU_4485084/CALCA.png", descricaoItem = ""},
            Bota = {nomeItem = "Botas de Algodão Grosso", tipoItem = "Bota", precoPrata = 100, rd = 1, imagemestilo2 = "https://blob.firecast.com.br/blobs/CPTAIJTI_4485085/BOTA.png", descricaoItem = ""},
            Escudo = {nomeItem = "Escudo de madeira Reforçado", tipoItem = "Escudo", precoPrata = 150, rd = 2, imagemestilo2 = "https://blob.firecast.com.br/blobs/HBHCHNJC_4458845/6a32b5763cc024f401582c57.png", descricaoItem = ""}
        },
        C = {
            Capacete = {nomeItem = "Elmo de Couro Enrijecido", tipoItem = "Capacete", precoPrata = 180, rd = 2, imagemestilo2 = "https://blob.firecast.com.br/blobs/GELPNTCT_4458844/capacete_azul.png", descricaoItem = ""},
            Peitoral = {nomeItem = "Peitoral de Couro Curtido", tipoItem = "Peitoral", precoPrata = 320, rd = 2.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/HRQVMBBG_4458842/7cc19391-9f9f-4f4c-b51a-b844cb4025d8-remov.png", descricaoItem = ""},
            Calca = {nomeItem = "Perneiras de Couro com Fivelas", tipoItem = "Calca", precoPrata = 260, rd = 2.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/UWUWJJFN_4458841/d636c11a-8db7-4739-8174-fa73edee7adc-remov.png", descricaoItem = ""},
            Bota = {nomeItem = "Botas Altas de Couro", tipoItem = "Bota", precoPrata = 220, rd = 2, imagemestilo2 = "https://blob.firecast.com.br/blobs/UQOUSKHG_4458843/625ac680-7006-499f-b052-ad7854b4843c-remov.png", descricaoItem = ""},
            Escudo = {nomeItem = "Escudo de metal simples", tipoItem = "Escudo", precoPrata = 240, rd = 3, imagemestilo2 = "https://blob.firecast.com.br/blobs/RQEITVUG_4481274/escudo_c.png", descricaoItem = ""}
        },
        B = {
            Capacete = {nomeItem = "Elmo de Cobre com Narigueira", tipoItem = "Capacete", precoPrata = 180, rd = 3, imagemestilo2 = "https://blob.firecast.com.br/blobs/OFKJIAMB_4458848/7047f0b2-fdd3-40be-a8d9-c8ef1f3c0e27-remov.png", descricaoItem = "Elmo de Cobre Enrijecido reforçado!basico"},
            Peitoral = {nomeItem = "Peitoral de Escamas de Cobre", tipoItem = "Peitoral", precoPrata = 680, rd = 3.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/QASOLLEL_4458849/38af0792-02e8-4705-9679-dc274da92607-remov.png", descricaoItem = ""},
            Calca = {nomeItem = "Grevas de Cobre Leves", tipoItem = "Calca", precoPrata = 520, rd = 3.5, imagemestilo2 = "https://blob.firecast.com.br/blobs/NQJJHRSC_4458846/OIG4-removebg-preview.png", descricaoItem = ""},
            Bota = {nomeItem = "Botas de Cobre Reforçadas", tipoItem = "Bota", precoPrata = 450, rd = 3, imagemestilo2 = "https://blob.firecast.com.br/blobs/QHRUFQRS_4458847/OIG1.xE76ElwhKaVi_y-removebg-preview.png", descricaoItem = ""},
            Escudo = {nomeItem = "Escudo de metal reforçado", tipoItem = "Escudo", precoPrata = 530, rd = 4, imagemestilo2 = "https://blob.firecast.com.br/blobs/HTDGSDJA_4458839/6a3d0c583cc024f40196e681.jpg", descricaoItem = "Um escudo reforçado de metal, bastante resistente!"}
        },
        A = {
            Capacete = {nomeItem = "Elmo de Adamantita", tipoItem = "Capacete", precoPrata = 320, rd = 4, imagemestilo2 = "", descricaoItem = ""},
            Peitoral = {nomeItem = "Peitoral de Adamantita", tipoItem = "Peitoral", precoPrata = 1200, rd = 4.5, imagemestilo2 = "", descricaoItem = ""},
            Calca = {nomeItem = "Grevas de Adamantita", tipoItem = "Calca", precoPrata = 950, rd = 4.5, imagemestilo2 = "", descricaoItem = ""},
            Bota = {nomeItem = "Botas de Adamantita", tipoItem = "Bota", precoPrata = 750, rd = 4, imagemestilo2 = "", descricaoItem = ""},
            Escudo = {nomeItem = "Escudo de Adamantita", tipoItem = "Escudo", precoPrata = 1000, rd = 5, imagemestilo2 = "", descricaoItem = ""}
        },
        S = {
            Capacete = {nomeItem = "Elmo de Cristal Estelar", tipoItem = "Capacete", precoPrata = 600, rd = 5, imagemestilo2 = "", descricaoItem = ""},
            Peitoral = {nomeItem = "Peitoral de Cristal Estelar", tipoItem = "Peitoral", precoPrata = 2400, rd = 5.5, imagemestilo2 = "", descricaoItem = ""},
            Calca = {nomeItem = "Grevas de Cristal Estelar", tipoItem = "Calca", precoPrata = 1800, rd = 5.5, imagemestilo2 = "", descricaoItem = ""},
            Bota = {nomeItem = "Botas de Cristal Estelar", tipoItem = "Bota", precoPrata = 1400, rd = 5, imagemestilo2 = "", descricaoItem = ""},
            Escudo = {nomeItem = "Escudo de Cristal Estelar", tipoItem = "Escudo", precoPrata = 1800, rd = 6, imagemestilo2 = "", descricaoItem = ""}
        }
    }
}

BancoItens.receitasForja.armas = {
    E = {
        Espada = {nomeItem = "Espada de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/WFOQNEAF_4506890/6a6e55f83cc024f402b14c73.jpg", descricaoItem = ""},
        Machado = {nomeItem = "Machado de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/MKENMVMU_4506891/6a6e56103cc024f402b14d2e.jpg", descricaoItem = ""},
        Martelo = {nomeItem = "Martelo de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/TUNTAWBK_4506897/6a6e567b3cc024f402b150a5.jpg", descricaoItem = ""},
        Maca = {nomeItem = "Maca de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/QLGWTBNI_4506901/6a6e56b53cc024f402b15288.jpg", descricaoItem = ""},
        Lanca = {nomeItem = "Lanca de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/DJRMMOLN_4506893/6a6e562a3cc024f402b14ddd.jpg", descricaoItem = ""},
        Adaga = {nomeItem = "Adaga de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/CVNSRGEU_4506886/6a6e55be3cc024f402b14a73.jpg", descricaoItem = ""},
        Chicote = {nomeItem = "Chicote de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/PGTUQHGE_4506894/6a6e563f3cc024f402b14e73.jpg", descricaoItem = ""},
        Arco = {nomeItem = "Arco de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/GVCTSAPE_4506900/6a6e569d3cc024f402b151c6.jpg", descricaoItem = ""},
        Besta = {nomeItem = "Besta de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/ACODITPC_4506898/6a6e56873cc024f402b150f9.jpg", descricaoItem = ""},
        Cajado = {nomeItem = "Cajado de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/BBJEOMWR_4506903/6a6e56e13cc024f402b15436.jpg", descricaoItem = ""},
        Orbe = {nomeItem = "Orbe de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/CLAUTSFR_4506895/6a6e56623cc024f402b14f47.jpg", descricaoItem = ""},
        ["Braco Acoplado"] = {nomeItem = "Braco Acoplado de Bronze Refinado", tipoItem = "Arma", precoPrata = 45, rd = 0, dano = "1d4", imagemestilo2 = "https://blob.firecast.com.br/blobs/JWATKPFK_4506902/6a6e56cc3cc024f402b1538b.jpg", descricaoItem = ""}
    },
    D = {
        Espada = {nomeItem = "Espada de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/JWDWGVHO_4506916/6a6e592e3cc024f402b165e0.jpg", descricaoItem = ""},
        Machado = {nomeItem = "Machado de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/ROJHUPBB_4506917/6a6e593b3cc024f402b1664b.jpg", descricaoItem = ""},
        Martelo = {nomeItem = "Martelo de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/HCWVGPTB_4506923/6a6e59c73cc024f402b16aa3.jpg", descricaoItem = ""},
        Maca = {nomeItem = "Maca de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/TOLBJLDW_4506926/6a6e5a143cc024f402b16dca.jpg", descricaoItem = ""},
        Lanca = {nomeItem = "Lanca de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/VQLRVMIC_4506918/6a6e594f3cc024f402b16709.jpg", descricaoItem = ""},
        Adaga = {nomeItem = "Adaga de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/BSTOEAPL_4506914/6a6e591d3cc024f402b16578.jpg", descricaoItem = ""},
        Chicote = {nomeItem = "Chicote de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/MGJLRDTC_4506920/6a6e59833cc024f402b16891.jpg", descricaoItem = ""},
        Arco = {nomeItem = "Arco de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/VHUMPUJV_4506925/6a6e59fa3cc024f402b16cc3.jpg", descricaoItem = ""},
        Besta = {nomeItem = "Besta de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/MINMJHMK_4506924/6a6e59d83cc024f402b16be8.jpg", descricaoItem = ""},
        Cajado = {nomeItem = "Cajado de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/IHGIJADW_4506922/6a6e59af3cc024f402b169f2.jpg", descricaoItem = ""},
        Orbe = {nomeItem = "Orbe de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/QWFWNDWW_4506921/6a6e599c3cc024f402b168e6.jpg", descricaoItem = ""},
        ["Braco Acoplado"] = {nomeItem = "Braco Acoplado de Ferro Comum", tipoItem = "Arma", precoPrata = 110, rd = 0, dano = "1d6", imagemestilo2 = "https://blob.firecast.com.br/blobs/DHWJANCS_4506927/6a6e5a263cc024f402b16e52.jpg", descricaoItem = ""}
    },
    C = {
        Espada = {nomeItem = "Espada de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/CAIHOMBC_4506945/6a6e5b403cc024f402b17526.jpg", descricaoItem = ""},
        Machado = {nomeItem = "Machado de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/FNPDOQRP_4506947/6a6e5b503cc024f402b1759f.jpg", descricaoItem = ""},
        Martelo = {nomeItem = "Martelo de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/BSOUKVPU_4506954/6a6e5bb43cc024f402b1799c.jpg", descricaoItem = ""},
        Maca = {nomeItem = "Maca de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/IVFTBHAN_4506966/6a6e5bee3cc024f402b17b8a.jpg", descricaoItem = ""},
        Lanca = {nomeItem = "Lanca de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/IIPCECUP_4506953/6a6e5b993cc024f402b17871.jpg", descricaoItem = ""},
        Adaga = {nomeItem = "Adaga de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/CHMRKOTG_4506941/6a6e5b2a3cc024f402b17473.jpg", descricaoItem = ""},
        Chicote = {nomeItem = "Chicote de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/MBQQBJWO_4506950/6a6e5b6a3cc024f402b176bd.jpg", descricaoItem = ""},
        Arco = {nomeItem = "Arco de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/DRUWUHKF_4506957/6a6e5bcc3cc024f402b17a3c.jpg", descricaoItem = ""},
        Besta = {nomeItem = "Besta de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/EIAGLMFM_4506969/6a6e5c093cc024f402b17c24.jpg", descricaoItem = ""},
        Cajado = {nomeItem = "Cajado de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/IIPCECUP_4506953/6a6e5b993cc024f402b17871.jpg", descricaoItem = ""},
        Orbe = {nomeItem = "Orbe de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/NJCNPBHO_4506951/6a6e5b843cc024f402b1779a.jpg", descricaoItem = ""},
        ["Braco Acoplado"] = {nomeItem = "Braco Acoplado de Aco", tipoItem = "Arma", precoPrata = 220, rd = 0, dano = "1d8", imagemestilo2 = "https://blob.firecast.com.br/blobs/LWFOUALR_4506968/6a6e5bfc3cc024f402b17bd6.jpg", descricaoItem = ""}
    },
    B = {
        Espada = {nomeItem = "Espada de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/GOJGKSJV_4506977/6a6e5d2e3cc024f402b185a6.jpg", descricaoItem = ""},
        Machado = {nomeItem = "Machado de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/HLCLCAOB_4506975/6a6e5cf33cc024f402b18427.jpg", descricaoItem = ""},
        Martelo = {nomeItem = "Martelo de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/VQVQLNKR_4506983/6a6e5d9d3cc024f402b18814.jpg", descricaoItem = ""},
        Maca = {nomeItem = "Maca de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/IHPDWJSF_4506990/6a6e5dcc3cc024f402b18937.jpg", descricaoItem = ""},
        Lanca = {nomeItem = "Lanca de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/EAHQJADR_4506976/6a6e5d143cc024f402b18533.jpg", descricaoItem = ""},
        Adaga = {nomeItem = "Adaga de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/KSRWAQCP_4506974/6a6e5ce53cc024f402b183cb.jpg", descricaoItem = ""},
        Chicote = {nomeItem = "Chicote de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/QKKCEVKB_4506978/6a6e5d3c3cc024f402b18610.jpg", descricaoItem = ""},
        Arco = {nomeItem = "Arco de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/HFKTJCME_4506985/6a6e5dab3cc024f402b1885c.jpg", descricaoItem = ""},
        Besta = {nomeItem = "Besta de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/MOGHGQIB_4506986/6a6e5db73cc024f402b188a6.jpg", descricaoItem = ""},
        Cajado = {nomeItem = "Cajado de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/DULEIVSD_4506982/6a6e5d8c3cc024f402b187b3.jpg", descricaoItem = ""},
        Orbe = {nomeItem = "Orbe de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/AACEMEAP_4506980/6a6e5d543cc024f402b18664.jpg", descricaoItem = ""},
        ["Braco Acoplado"] = {nomeItem = "Braco Acoplado de Mithril", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/STEVGVFN_4506991/6a6e5de43cc024f402b189e8.jpg", descricaoItem = ""}
    },
    A = {
        Espada = {nomeItem = "Espada de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/GIAKKONP_4506998/6a6e5ead3cc024f402b18fff.jpg", descricaoItem = ""},
        Machado = {nomeItem = "Machado de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/ACBCBCID_4506999/6a6e5ecd3cc024f402b19098.jpg", descricaoItem = ""},
        Martelo = {nomeItem = "Martelo de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/IBNEVDUC_4507010/6a6e5f893cc024f402b1954b.jpg", descricaoItem = ""},
        Maca = {nomeItem = "Maca de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/CTFONDTE_4507015/6a6e5fe43cc024f402b197ac.jpg", descricaoItem = ""},
        Lanca = {nomeItem = "Lanca de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/AUKURJQE_4507000/6a6e5efd3cc024f402b191a9.jpg", descricaoItem = ""},
        Adaga = {nomeItem = "Adaga de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/CKFVORIA_4506997/6a6e5e7c3cc024f402b18e9d.jpg", descricaoItem = ""},
        Chicote = {nomeItem = "Chicote de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/HDOWEQIO_4507001/6a6e5f163cc024f402b1922d.jpg", descricaoItem = ""},
        Arco = {nomeItem = "Arco de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/SMTSQQOH_4507013/6a6e5fc43cc024f402b196ad.jpg", descricaoItem = ""},
        Besta = {nomeItem = "Besta de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/MVITVNFK_4507012/6a6e5f9e3cc024f402b195d1.jpg", descricaoItem = ""},
        Cajado = {nomeItem = "Cajado de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/BLATTFJK_4507007/6a6e5f643cc024f402b19425.jpg", descricaoItem = ""},
        Orbe = {nomeItem = "Orbe de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/VFSRIKQW_4507003/6a6e5f403cc024f402b19325.jpg", descricaoItem = ""},
        ["Braco Acoplado"] = {nomeItem = "Braco Acoplado de Adamantita", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/EKHKSOJV_4507014/6a6e5fd23cc024f402b19709.jpg", descricaoItem = ""}
    },
    S = {
        Espada = {nomeItem = "Espada de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/JICDDACW_4507028/6a6e61263cc024f402b1a010.jpg", descricaoItem = ""},
        Machado = {nomeItem = "Machado de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/IHSGHHEB_4507031/6a6e61313cc024f402b1a079.jpg", descricaoItem = ""},
        Martelo = {nomeItem = "Martelo de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/WPBLRVFF_4507054/6a6e61da3cc024f402b1a5b0.jpg", descricaoItem = ""},
        Maca = {nomeItem = "Maca de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/MEKIVBNM_4507072/6a6e621f3cc024f402b1a76c.jpg", descricaoItem = ""},
        Lanca = {nomeItem = "Lanca de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/IFKFFRLN_4507043/6a6e616b3cc024f402b1a211.jpg", descricaoItem = ""},
        Adaga = {nomeItem = "Adaga de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/RJHCQQKN_4507025/6a6e61133cc024f402b19f33.jpg", descricaoItem = ""},
        Chicote = {nomeItem = "Chicote de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/PSFQDECB_4507077/6a6e62623cc024f402b1a911.jpg", descricaoItem = ""},
        Arco = {nomeItem = "Arco de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/TSCUDQOU_4507058/6a6e61f23cc024f402b1a655.jpg", descricaoItem = ""},
        Besta = {nomeItem = "Besta de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/OVVOJNLL_4507057/6a6e61e73cc024f402b1a60a.jpg", descricaoItem = ""},
        Cajado = {nomeItem = "Cajado de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/GKEIFLEN_4507047/6a6e61b13cc024f402b1a490.jpg", descricaoItem = ""},
        Orbe = {nomeItem = "Orbe de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/HBKKBGUF_4507046/6a6e61a33cc024f402b1a441.jpg", descricaoItem = ""},
        ["Braco Acoplado"] = {nomeItem = "Braco Acoplado de Cristal das Estrelas", tipoItem = "Arma", precoPrata = 0, rd = 0, dano = 0, imagemestilo2 = "https://blob.firecast.com.br/blobs/AJQKAIUK_4507069/6a6e620e3cc024f402b1a6e3.jpg", descricaoItem = ""}
    }
}

function BancoItens.getReceitaForjaArma(rank, tipoArma)
    local porRank = BancoItens.receitasForja.armas[string.upper(tostring(rank or ""))]
    if porRank == nil then return nil end
    return porRank[tostring(tipoArma or "")]
end

function BancoItens.getReceitaForjaArmadura(rank, tipoArmadura)
    local porRank = BancoItens.receitasForja.armaduras[string.upper(tostring(rank or ""))]
    if porRank == nil then return nil end
    return porRank[tostring(tipoArmadura or "")]
end
BancoItens.gerarEquipamentos()

return BancoItens
