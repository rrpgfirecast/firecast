require("rrpg.lua")
require("ndb.lua")

Data = NDB.load("data.xml")
--[[eu testei colocar size dentro de Memes como Memes._size, mas a posição de _size
    em um teste com 1 entrada variava entre primeiro e último
    talvez colocar um continue caso a key seja _size funcione
    CONSIDERAR TABELA DE VARIÁVEIS --]]
Memes = {}
Comumemes = {}
--semem sod kcap retratS
if Data.semeM == nil then
    --êuq o rezaf sam lam oiem aos memes etnemzilefni !??ADITREVNI ALEBAT A ?OSSI É EUQ O ,HO
    Data.semeM = {
    ["kappa"] = "http://blob.firecast.com.br/blobs/ATGQVIMR_165515.png",
    ["erro"] = "http://blob.firecast.com.br/blobs/HVDLWCCR_276890.png",
    ["errou"] = "http://blob.firecast.com.br/blobs/HVDLWCCR_276890.png",
    ["faustao"] = "http://blob.firecast.com.br/blobs/HVDLWCCR_276890.png",
    ["facepalm"] = "http://blob.firecast.com.br/blobs/PPEMNCDI_257702.png",
    ["laranjo"] = "http://blob.firecast.com.br/blobs/MBTPQHUR_288484.png",
    ["ata"] = "http://blob.firecast.com.br/blobs/MBTPQHUR_288484.png",
    ["birl"] = "http://blob.firecast.com.br/blobs/GDMPHSMR_285489.png",
    ["bambam"] = "http://blob.firecast.com.br/blobs/GDMPHSMR_285489.png",
    ["gil"] = "http://blob.firecast.com.br/blobs/NTSWIOSO_287456.png",
    ["esfirra"] = "http://blob.firecast.com.br/blobs/NTSWIOSO_287456.png",
    ["numberone"] = "http://blob.firecast.com.br/blobs/OHJTJSFT_279124.png",
    ["robbie"] = "http://blob.firecast.com.br/blobs/OHJTJSFT_279124.png",
    ["yeye"] = "http://blob.firecast.com.br/blobs/LPWAKFTO_322926.png",
    ["mallandro"] = "http://blob.firecast.com.br/blobs/LPWAKFTO_322926.png",
    ["malandro"] = "http://blob.firecast.com.br/blobs/LPWAKFTO_322926.png",
    ["jailson"] = "http://blob.firecast.com.br/blobs/KQITWFQA_281059.png",
    ["delicia"] = "http://blob.firecast.com.br/blobs/KQITWFQA_281059.png",
    ["dlc"] = "http://blob.firecast.com.br/blobs/KQITWFQA_281059.png",
    ["mineirinho"] = "http://blob.firecast.com.br/blobs/GPPTICTF_445968/GFCINCDF_332393.png",
    ["mineiro"] = "http://blob.firecast.com.br/blobs/GPPTICTF_445968/GFCINCDF_332393.png",
    ["miner"] = "http://blob.firecast.com.br/blobs/GPPTICTF_445968/GFCINCDF_332393.png",
    ["rollsafe"] = "http://blob.firecast.com.br/blobs/DTWVUJTG_328320.png",
    ["aliens"] = "http://blob.firecast.com.br/blobs/SATTWRBV_280800.png",
    ["joke"] = "http://blob.firecast.com.br/blobs/COOIWFRQ_342869.png",
    ["ruby"] = "http://blob.firecast.com.br/blobs/HCVTTTUS_446360/Ruby.png",
    ["vasco"] = "http://blob.firecast.com.br/blobs/DKEFSHKB_446449/VascoEmote_copy.png",
    ["segundo"] = "http://blob.firecast.com.br/blobs/DKEFSHKB_446449/VascoEmote_copy.png",
    ["serieb"] = "http://blob.firecast.com.br/blobs/DKEFSHKB_446449/VascoEmote_copy.png",
    ["silver"] = "http://blob.firecast.com.br/blobs/FITEQFAH_446364/Silver.png",
    ["gratidao"] = "http://blob.firecast.com.br/blobs/EGLROTRF_381620.png",
    ["flor"] = "http://blob.firecast.com.br/blobs/EGLROTRF_381620.png",
    ["grr"] = "http://blob.firecast.com.br/blobs/NJUUOSGI_446436/GRREMOTEgrr_copy.png",
    ["raiva"] = "http://blob.firecast.com.br/blobs/NJUUOSGI_446436/GRREMOTEgrr_copy.png",
    ["kappapride"] = "http://blob.firecast.com.br/blobs/VJFPBSCR_446366/1.0.png",
    ["pride"] = "http://blob.firecast.com.br/blobs/VJFPBSCR_446366/1.0.png",
    ["grand"] = "http://firecast.blob.core.windows.net/blobs/FSHMQBPU_261884.png",
    ["granddad"] = "http://firecast.blob.core.windows.net/blobs/FSHMQBPU_261884.png",
    ["dad"] = "http://firecast.blob.core.windows.net/blobs/FSHMQBPU_261884.png",
    ["smol"] = "http://firecast.blob.core.windows.net/blobs/KGJMHLUI_262017.png",
    ["lennyface"] = "http://firecast.blob.core.windows.net/blobs/LTNUGORU_324911.png",
    ["aquelacarinha"] = "http://firecast.blob.core.windows.net/blobs/LTNUGORU_324911.png",
    ["carinha"] = "http://firecast.blob.core.windows.net/blobs/LTNUGORU_324911.png",
    ["sadcena"] = "http://firecast.blob.core.windows.net/blobs/EFOBDVPO_286295.png",
    ["prettygood"] = "http://blob.firecast.com.br/blobs/OHEPLIGJ_286305.png",
    ["eyy"] = "http://blob.firecast.com.br/blobs/OHEPLIGJ_286305.png",
    ["nico"] = "http://firecast.blob.core.windows.net/blobs/UJJGOVUD_291027.png",
    ["ayy"] = "http://blob.firecast.com.br/blobs/PPVUFLVC_446372/renatinho_copy.png",
    ["lmao"] = "http://blob.firecast.com.br/blobs/PPVUFLVC_446372/renatinho_copy.png",
    ["ayylmao"] = "http://blob.firecast.com.br/blobs/PPVUFLVC_446372/renatinho_copy.png",
    ["snoop"] = "http://blob.firecast.com.br/blobs/EMVLJSLL_280475.png",
    ["snoopdog"] = "http://blob.firecast.com.br/blobs/EMVLJSLL_280475.png",
    ["aesthetic"] = "http://blob.firecast.com.br/blobs/SKPJCQPT_280267.png",
    ["vaporwave"] = "http://blob.firecast.com.br/blobs/SKPJCQPT_280267.png",
    ["opinar"] = "http://blob.firecast.com.br/blobs/JBVOGKWL_304931.png",
    ["whoa"] = "http://blob.firecast.com.br/blobs/TVMALCDF_466315/Screenshot_1.png",
    ["woah"] = "http://blob.firecast.com.br/blobs/TVMALCDF_466315/Screenshot_1.png",
    ["italian"] = "http://blob.firecast.com.br/blobs/MVPQVOLH_446430/ItalianWayofEMOTE_copy.png",
    ["italianway"] = "http://blob.firecast.com.br/blobs/MVPQVOLH_446430/ItalianWayofEMOTE_copy.png",
    ["italia"] = "http://blob.firecast.com.br/blobs/MVPQVOLH_446430/ItalianWayofEMOTE_copy.png",
    ["proerd"] = "http://blob.firecast.com.br/blobs/KLNSMRMH_481319/6Proerd-10_07_copy.png",
    ["drogas"] = "http://blob.firecast.com.br/blobs/KLNSMRMH_481319/6Proerd-10_07_copy.png",
    ["drakeyea"] = "http://blob.firecast.com.br/blobs/RWHEIETK_470134/Drakeapproves_copy.png",
    ["drakeyes"] = "http://blob.firecast.com.br/blobs/RWHEIETK_470134/Drakeapproves_copy.png",
    ["drakey"] = "http://blob.firecast.com.br/blobs/RWHEIETK_470134/Drakeapproves_copy.png",
    ["drakenay"] = "http://blob.firecast.com.br/blobs/MJVWEWKP_470131/Drake_emote.png",
    ["drakeno"] = "http://blob.firecast.com.br/blobs/MJVWEWKP_470131/Drake_emote.png",
    ["draken"] = "http://blob.firecast.com.br/blobs/MJVWEWKP_470131/Drake_emote.png",
    ["whynotboth"] = "http://blob.firecast.com.br/blobs/SGOBWJLM_482152/160722_old_el_paso_copy.png",
    ["both"] = "http://blob.firecast.com.br/blobs/SGOBWJLM_482152/160722_old_el_paso_copy.png",
    ["boromir"] = "http://blob.firecast.com.br/blobs/ARMSCPPA_476913/One_Meme_Does_Not_Simply_copy.png",
    ["onenotsimple"] = "http://blob.firecast.com.br/blobs/ARMSCPPA_476913/One_Meme_Does_Not_Simply_copy.png",
    ["notsimple"] = "http://blob.firecast.com.br/blobs/ARMSCPPA_476913/One_Meme_Does_Not_Simply_copy.png",
    ["knuckles"] = "http://blob.firecast.com.br/blobs/IJCCEVVN_482138/_Knuckles.png",
    ["&knuckles"] = "http://blob.firecast.com.br/blobs/IJCCEVVN_482138/_Knuckles.png",
    ["sleep"] = "http://blob.firecast.com.br/blobs/OGETOALJ_526205/real_shit.png",
    ["shaqsleep"] = "http://blob.firecast.com.br/blobs/OGETOALJ_526205/real_shit.png",
    ["realshit"] = "http://blob.firecast.com.br/blobs/CEPGSOJW_526296/isleep.png",
    ["shaqshit"] = "http://blob.firecast.com.br/blobs/CEPGSOJW_526296/isleep.png",
    ["ascended"] = "http://blob.firecast.com.br/blobs/PVMTJELH_526308/ascended.png",
    ["shaqasc"] = "http://blob.firecast.com.br/blobs/PVMTJELH_526308/ascended.png",
    ["bwah"] = "http://blob.firecast.com.br/blobs/RTKBCLSH_528465/bwah.png",
    ["rabbid"] = "http://blob.firecast.com.br/blobs/RTKBCLSH_528465/bwah.png",
    ["rabbids"] = "http://blob.firecast.com.br/blobs/RTKBCLSH_528465/bwah.png",
    ["sanic"] = "http://blob.firecast.com.br/blobs/KCPDJJBA_528523/sanic_copy.png",
    ["gottagofast"] = "http://blob.firecast.com.br/blobs/KCPDJJBA_528523/sanic_copy.png",
    ["sonico"] = "http://blob.firecast.com.br/blobs/QMASOATM_528507/Sonico.png",
    ["pogchamp"] = "http://blob.firecast.com.br/blobs/DNLLQKDV_528597/PogChamp.png",
    ["cazalbe"] = "http://blob.firecast.com.br/blobs/SDLQDDCS_528531/Cazalbe_copy.png",
    ["prassa"] = "http://blob.firecast.com.br/blobs/SDLQDDCS_528531/Cazalbe_copy.png",
    ["praça"] = "http://blob.firecast.com.br/blobs/SDLQDDCS_528531/Cazalbe_copy.png",
    ["lul"] = "http://blob.firecast.com.br/blobs/PDLQTSCP_528568/lul_copy.png",
    ["dio"] = "http://blob.firecast.com.br/blobs/JGCFEWLQ_528617/It_was_me__dio_copy.png",
    ["itwasme"] = "http://blob.firecast.com.br/blobs/JGCFEWLQ_528617/It_was_me__dio_copy.png",
    ["wasme"] = "http://blob.firecast.com.br/blobs/JGCFEWLQ_528617/It_was_me__dio_copy.png",
    ["padoru"] = "http://blob.firecast.com.br/blobs/PVJNEUJU_586789/padoru.png",
    ["vrikoloko"] = "http://blob.firecast.com.br/blobs/KQNTQLRQ_586827/vrikowithleiseres.png",
    ["vriko300"] = "http://blob.firecast.com.br/blobs/KQNTQLRQ_586827/vrikowithleiseres.png",
    ["vrikoputasso"] = "http://blob.firecast.com.br/blobs/KQNTQLRQ_586827/vrikowithleiseres.png",
    ["lixa"] = "http://blob.firecast.com.br/blobs/AVWILHTQ_586799/Gato_lixa.png",
    ["salem"] = "http://blob.firecast.com.br/blobs/AVWILHTQ_586799/Gato_lixa.png",
    ["sadpepe"] = "http://blob.firecast.com.br/blobs/BLIKAAGJ_586841/sadpepe.png",
    ["feelsbad"] = "http://blob.firecast.com.br/blobs/BLIKAAGJ_586841/sadpepe.png",
    ["feelsbadman"] = "http://blob.firecast.com.br/blobs/BLIKAAGJ_586841/sadpepe.png",
    ["feelsgoodman"] = "http://blob.firecast.com.br/blobs/JEERQWGF_586849/feelsgoodman.png",
    ["feelsgood"] = "http://blob.firecast.com.br/blobs/JEERQWGF_586849/feelsgoodman.png",
    ["feelsgoodbro"] = "http://blob.firecast.com.br/blobs/JEERQWGF_586849/feelsgoodman.png",
    ["monkaS"] = "http://blob.firecast.com.br/blobs/HPVHBIDH_586853/monkaS.png",
    ["monkas"] = "http://blob.firecast.com.br/blobs/HPVHBIDH_586853/monkaS.png",
    ["ohno"] = "http://blob.firecast.com.br/blobs/QINNLNTH_609786/ohno.png",
    ["way"] = "http://blob.firecast.com.br/blobs/AGCDMMKP_637066/the_way.png",
    ["wae"] = "http://blob.firecast.com.br/blobs/AGCDMMKP_637066/the_way.png",
    ["salty"] = "http://blob.firecast.com.br/blobs/RALAVJLW_668475/Salt_copy.png",
    ["salt"] = "http://blob.firecast.com.br/blobs/RALAVJLW_668475/Salt_copy.png",
    ["sal"] = "http://blob.firecast.com.br/blobs/RALAVJLW_668475/Salt_copy.png",
    ["entei"] = "http://blob.firecast.com.br/blobs/IOUDFOEG_667482/Entei_emote_gulhotinado.png",
    ["tudobem"] = "http://blob.firecast.com.br/blobs/IOUDFOEG_667482/Entei_emote_gulhotinado.png",
    ["hallo"] = "https://i.imgur.com/s9MjjM8.png",
    ["toad"] = "https://i.imgur.com/s9MjjM8.png",
    ["bup"] = "https://i.imgur.com/s9MjjM8.png",
    ["omegalul"] = "https://i.imgur.com/dqM4V8L.png",
    ["blessrng"] = "https://i.imgur.com/lRCwdwV.png",
    ["pray"] = "https://i.imgur.com/lRCwdwV.png",
    ["reza"] = "https://i.imgur.com/lRCwdwV.png",
    ["poggers"] = "https://i.imgur.com/WlejhwU.png",
    ["pog"] = "https://i.imgur.com/WlejhwU.png",
    ["donk"] = "https://i.imgur.com/wzeqv1I.png",
    ["dk"] = "https://i.imgur.com/wzeqv1I.png",
    ["kong"] = "https://i.imgur.com/wzeqv1I.png",
    ["rubinho"] = "https://i.imgur.com/LZQ2eZW.png",
    ["barrichello"] = "https://i.imgur.com/LZQ2eZW.png",
    ["kreygasm"] = "https://i.imgur.com/KNdN2Wu.png",
    ["gasm"] = "https://i.imgur.com/KNdN2Wu.png",
    ["ciencia"] = "https://i.imgur.com/c1KPWhz.png",
    ["doctor"] = "https://i.imgur.com/c1KPWhz.png",
    ["doctorkirby"] = "https://i.imgur.com/c1KPWhz.png",
    ["nice"] = "https://i.imgur.com/fDzGGWA.png",
    ["woodman"] = "https://i.imgur.com/fDzGGWA.png",
    ["duelo"] = "https://i.imgur.com/Z4XCj05.png",
    ["yugi"] = "https://i.imgur.com/Z4XCj05.png",
    ["foca"] = "https://i.imgur.com/UoMrXID.png",
    ["focasessao"] = "https://i.imgur.com/UoMrXID.png",
    ["popplio"] = "https://i.imgur.com/UoMrXID.png",
    ["referencia"] = "https://i.imgur.com/0v9bJE1.png",
    ["oh"] = "https://i.imgur.com/3OpyB9g.png",
    ["pikachu"] = "https://i.imgur.com/3OpyB9g.png",
    ["surpreso"] = "https://i.imgur.com/3OpyB9g.png",
    ["gnotanelf"] = "https://i.imgur.com/oDvgqMO.png",
    ["gnotagoblin"] = "https://i.imgur.com/oDvgqMO.png",
    ["gnome"] = "https://i.imgur.com/oDvgqMO.png",
    ["gnomed"] = "https://i.imgur.com/oDvgqMO.png",
    ["nyan"] = "https://i.imgur.com/zyfAk7G.gif",
    ["nyancat"] = "https://i.imgur.com/zyfAk7G.gif",
    ["dong"] = "http://blob.firecast.com.br/blobs/LOKLSJKD_290948.png",
    ["expand"] = "http://blob.firecast.com.br/blobs/LOKLSJKD_290948.png",
    ["expanddong"] = "http://blob.firecast.com.br/blobs/LOKLSJKD_290948.png",
    ["continue"] = "http://blob.firecast.com.br/blobs/OFNUQGOJ_446386/tobeemote.png",
    ["continued"] = "http://blob.firecast.com.br/blobs/OFNUQGOJ_446386/tobeemote.png",
    ["tobecontinued"] = "http://blob.firecast.com.br/blobs/OFNUQGOJ_446386/tobeemote.png"}
    Data["Size"] = 74
end

function updateMemes()
    for k, v in pairs(Data.semeM) do
        if Memes[v] == nil then Memes[v] = {k} else table.insert(Memes[v], k) end
    end
end
updateMemes()

--para location depois
PMTINV = "Parâmetro Inválido."
LM = "Memes extras disponíveis:"
IFA = "Índice fora do alcance."
MAS = "Meme adicionado com sucesso!"
AR = "Meme já removido. "
RM = "Meme(s) removido(s):"
FC = "Falha ao carregar nodo."
MLC = " memes da mesa foram carregados. Use /m+ rlist para listá-los!"
PI = "Você não tem permissão para modificar o nodo."
DESC = "/m+ <COMANDO> <PARÂMETRO> — Interface de comandos do Memes+, com os seguintes comandos:\n\t/m+ add <IMAGEM> <NOME(S)> — Adiciona IMAGEM à lista de Memes, podendo ser usado com :NOME(S):.\n\t/m+ radd <IMAGEM> <NOME(S)> — Adiciona IMAGEM à lista de Memes da mesa, podendo ser usado com :NOME(S):. É necessário ser Mestre. Memes do Usuário tem prioridade em caso de conflito de NOME(S).\n\t/m+ rmv <IMAGEM(NS) OU NOME(S)> — Remove um ou mais Memes cujo link ou os nomes tenham sido listados.\n\t/m+ rrmv <IMAGEM(NS) OU NOME(S)> — Remove um ou mais Memes da mesa cujo link ou os nomes tenham sido listados. É necessário ser Mestre.\n\t/m+ list <ÍNDICE> — Lista a página ÍNDICE de Memes. São listados 10 Memes em cada página. A ordem da lista e a posição onde são inseridos novos Memes é arbitrária, mas a ordem é fixa na sessão.\n\t/m+ rlist <ÍNDICE> — Lista a página ÍNDICE de Memes da mesa. São listados 10 Memes em cada página."

--Carrega o NDB da tabela invertida da mesa e cria as outras tabelas a partir dela
function CmmInit(mesa, callback)
    mesa:abrirNDBDeMesa("MPlus",
            function(sus)
                if sus == nil then mesa.chat:escrever(FC)
                else
                    Comumemes[mesa.codigoInterno] = {}
                    Comumemes[mesa.codigoInterno].semeM = sus
                    Comumemes[mesa.codigoInterno].Memes = {}
                    Comumemes[mesa.codigoInterno].Data = {["Size"]=0}
                    Comumemes[mesa.codigoInterno].Escuta = NDB.newObserver(sus)
                    Comumemes[mesa.codigoInterno].Escuta.onChanged = function(node, attribute, oldValue)

                        if Comumemes[mesa.codigoInterno].Memes[node[attribute]] == nil then --nova img
                            if node[attribute] ~= nil then
                            Comumemes[mesa.codigoInterno].Memes[node[attribute]] = {attribute}
                            Comumemes[mesa.codigoInterno].Data["Size"] = Comumemes[mesa.codigoInterno].Data["Size"] +1
                            end
                        else --img existente
                            table.insert(Comumemes[mesa.codigoInterno].Memes[node[attribute]], attribute)
                        end
                        if oldValue ~= nil then
                            if #Comumemes[mesa.codigoInterno].Memes[oldValue] <= 1 then --remoção de meme
                                Comumemes[mesa.codigoInterno].Memes[oldValue] = nil --F
                                Comumemes[mesa.codigoInterno].Data["Size"] = Comumemes[mesa.codigoInterno].Data["Size"] -1
                            else --só uma handle do meme
                                local index
                                for i, v in ipairs(Comumemes[mesa.codigoInterno].Memes[oldValue]) do
                                    if v == attribute then index = i break end
                                end
                                table.remove(Comumemes[mesa.codigoInterno].Memes[oldValue], index)
                            end
                        end
                    end

                    for k, v in pairs(Comumemes[mesa.codigoInterno].semeM) do
                        if Comumemes[mesa.codigoInterno].Memes[v] == nil then --novo
                            Comumemes[mesa.codigoInterno].Memes[v] = {k}
                            Comumemes[mesa.codigoInterno].Data["Size"] = Comumemes[mesa.codigoInterno].Data["Size"] +1
                        else
                            table.insert(Comumemes[mesa.codigoInterno].Memes[v], k)
                        end
                    end

                    callback()
                end
            end,
            {criar=true})
end

--Comandos (TODOS os r[comando] poderiam ser substituídos se eu mexesse um tico no wrapper e nos comandos locais)
Cmd = {}
--a ordem desta listagem é aleatória para cada sessão e cada item novo é inserido em uma posição arbitrária
function Cmd.list(message, args)
    local index = tonumber(args[1]) --vai ignorar outros args
    local chat = message.chat
    local contador = 0
    local offset;
    local pags = ((Data["Size"] -1)//10)+1
    if index == nil then chat:escrever(PMTINV) goto fim end;
    if index > pags or index <= 0 then chat:escrever(IFA) goto fim end;
    offset = (10*(index-1))
    chat:escrever("---------------------------")
    chat:escrever("(" .. index .. "/".. pags ..") ".. LM)

    for k, v in pairs(Memes) do
        local msgb = "[§i " .. k .. "]  -"
        if contador < offset then goto continue end
        if contador >= offset+10 then break end
        for _, h in ipairs(v) do
            msgb = msgb .. "  :" .. h .. ":"
        end
        chat:escrever(msgb)
        ::continue::
        contador = contador+1
    end
    chat:escrever("---------------------------")
    ::fim::
    message.response = {handled = true}
end;

function Cmd.rlist(message, args)
    local function resto()
        local index = tonumber(args[1]) --vai ignorar outros args
        local chat = message.chat
        local contador = 0
        local offset;
        local pags = ((Comumemes[message.room.codigoInterno].Data["Size"] -1)//10)+1
        if index == nil then chat:escrever(PMTINV) goto fim end;
        if index > pags or index <= 0 then chat:escrever(IFA) goto fim end;
        offset = (10*(index-1))
        chat:escrever("---------------------------")
        chat:escrever("(" .. index .. "/".. pags ..") ".. LM)

        for k, v in pairs(Comumemes[message.room.codigoInterno].Memes) do
            local msgb = "[§i " .. k .. "]  -"
            if contador < offset then goto continue end
            if contador >= offset+10 then break end
            for _, h in ipairs(v) do
                msgb = msgb .. "  :" .. h .. ":"
            end
            chat:escrever(msgb)
            ::continue::
            contador = contador+1
        end
        chat:escrever("---------------------------")
        ::fim::
    end
    if Comumemes[message.room.codigoInterno] == nil then --não iniciou na memória
        CmmInit(message.room, resto)
    else resto() end;
    message.response = {handled = true}
end;

function Cmd.add(message, args)
    local img, handles, chat = "", {}, message.chat
    if #args < 2 then chat:escrever(PMTINV) goto fim end;
    --cancelar repetições
    for i, v in ipairs(args) do
        if i ~= 1 then
            if Data.semeM[v] ~= nil or handles[v] ~= nil then chat:escrever(PMTINV .. " " .. v) goto fim end;
            table.insert(handles, v)
        else
            if Memes[v] ~= nil then chat:escrever(PMTINV .. " " .. v) goto fim end;
            img = v
        end
    end
    --atualizar tabelas
    Memes[img] = handles
    Data["Size"] = Data["Size"]+1
    for _, v in ipairs(handles) do Data.semeM[v] = img end;

    chat:escrever(MAS .. " [§i "..img.."]")
    ::fim::
    message.response = {handled = true}
end;

function Cmd.radd(message, args)
    local img, handles, chat = "", {}, message.chat

    local function resto()
        if message.room.meuJogador.isMestre == false then chat:escrever(PI) goto fim end;
        if #args < 2 then chat:escrever(PMTINV) goto fim end;
        --cancelar repetições
        for i, v in ipairs(args) do
            if i ~= 1 then --handles
                if Comumemes[message.room.codigoInterno].semeM[v] ~= nil or handles[v] ~= nil then chat:escrever(PMTINV .. " " .. v) goto fim end;
                table.insert(handles, v)
            else --link
                for h, l in pairs(Comumemes[message.room.codigoInterno].semeM) do
                    if v == h or v == l then chat:escrever(PMTINV .. " " .. v) goto fim end;
                end
                img = v
            end
        end
        --atualizar tabelas
        --Comumemes[message.room.codigoInterno].Memes[img] = handles
        --Comumemes[message.room.codigoInterno].Data["Size"] = Comumemes[message.room.codigoInterno].Data["Size"]+1
        for _, v in ipairs(handles) do Comumemes[message.room.codigoInterno].semeM[v] = img end;
    
        chat:escrever(MAS .. " [§i "..img.."]")
        ::fim::
        end

    if Comumemes[message.room.codigoInterno] == nil then --não iniciou na memória
        CmmInit(message.room, resto)
    else resto() end;
    message.response = {handled = true}
end;

function Cmd.rmv(message, args)
    local imgs, chat = {}, message.chat
    local msg
    if #args < 1 then chat:escrever(PMTINV .. " " .. tableToStr(args)) goto fim end;
    --Checagem
    for _, v in ipairs(args) do
        --link
        if Memes[v] ~= nil then
            imgs[v] = v --se usar índice aqui vira bagunça
            goto succ
        end
        --handle
        if Data.semeM[v] ~= nil then
            imgs[Data.semeM[v]] = Data.semeM[v]
            goto succ
        end
        chat:escrever(PMTINV .. " " .. v)
        ::succ::
    end

    --Remoção a partir da table de links
    msg = RM
    for k, _ in pairs(imgs) do
        if Memes[k] == nil then chat:escrever(AR .. " [§i "..k.."]")
        else
            for _, v in pairs(Memes[k]) do
                Data.semeM[v] = nil
            end
            Memes[k] = nil --vendo agora eu acho que devia feito a validação e a remoção no mesmo for
            Data["Size"] = Data["Size"]-1
            msg = msg .. " [§i "..k.."]"
        end
    end
    chat:escrever(msg)
    ::fim::
    message.response = {handled = true}
end

function Cmd.rrmv(message, args)
    local imgs, chat = {}, message.chat
    local function resto()
        if message.room.meuJogador.isMestre == false then chat:escrever(PI) goto fim end;
        local msg
        if #args < 1 then chat:escrever(PMTINV .. " " .. tableToStr(args)) goto fim end;
        --Checagem
        for _, v in ipairs(args) do
            --link
            if Comumemes[message.room.codigoInterno].Memes[v] ~= nil then
                imgs[v] = v
                goto succ
            end
            --handle
            if Comumemes[message.room.codigoInterno].semeM[v] ~= nil then
                imgs[Comumemes[message.room.codigoInterno].semeM[v]] = Comumemes[message.room.codigoInterno].semeM[v]
                goto succ
            end
            chat:escrever(PMTINV .. " " .. v)
            ::succ::
        end

        --Remoção a partir da table de links
        msg = RM
        for k, _ in pairs(imgs) do
            if Comumemes[message.room.codigoInterno].Memes[k] == nil then chat:escrever(AR .. " [§i "..k.."]")
            else
                for _, v in pairs(Comumemes[message.room.codigoInterno].Memes[k]) do
                    Comumemes[message.room.codigoInterno].semeM[v] = nil
                end
                --Comumemes[message.room.codigoInterno].Memes[k] = nil --vendo agora eu acho que devia feito a validação e a remoção no mesmo for
                --Comumemes[message.room.codigoInterno].Data["Size"] = Comumemes[message.room.codigoInterno].Data["Size"] -1
                msg = msg .. " [§i "..k.."]"
            end
        end
        chat:escrever(msg)
        ::fim::
    end

    if Comumemes[message.room.codigoInterno] == nil then --não iniciou na memória
        CmmInit(message.room, resto)
    else resto() end;

    message.response = {handled = true}
end

function Cmd.lookUp(message)
    if message.comando == "m+" then
        local args = {}
        for w in string.gmatch(message.parametro, "%g*") do
            table.insert(args,w)
        end
        if type(Cmd[args[1]]) == "function" and args[1] ~= "lookUp" then
            local func = table.remove(args,1) --poderia passar uma cópia sem o 1 no lugar
            Cmd[func](message, args)
            goto fim
        else
            message.chat:escrever(PMTINV .. " "..args[1])
            
        end
    end
    message.response = {handled = true}
    ::fim::
end

Firecast.Messaging.listen("HandleChatCommand", Cmd.lookUp)

                    function Escuta(message)
                message.response = {newText = string.gsub(message.text, ":%g-:",
            function (text)
        if Data.semeM[string.sub(text,2,-2)] == nil then
    if Comumemes[message.room.codigoInterno].semeM[string.sub(text,2,-2)] ~= nil then
return "[§I ".. Comumemes[message.room.codigoInterno].semeM[string.sub(text,2,-2)].."]"
    end
    return nil
        else
    return "[§I ".. Data.semeM[string.sub(text,2,-2)].."]" --:aditrevni alebat amu ret ed oãzar lapicnirp A
        end
            end
                )}
                    end

Firecast.Messaging.listen("HandleChatTextInput", Escuta)

Firecast.Messaging.listen("MesaJoined", function (message)
    if message.me then
        CmmInit(message.room, function ()
        message.room.chat:escrever(Comumemes[message.room.codigoInterno].Data["Size"]..MLC)
        end)
    end
end
)

Firecast.Messaging.listen("MesaParted", function (message)
    if message.me then
        Comumemes[message.room.codigoInterno] = nil
    end
end
)

Firecast.Messaging.listen("ListChatCommands", function(message)
    message.response = {{comando = "/m+", descricao=DESC}}
end
)