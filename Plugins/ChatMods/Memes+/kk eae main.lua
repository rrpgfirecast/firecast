require("rrpg.lua");
require("utils.lua");


-- -- Comandos
rrpg.messaging.listen('HandleChatCommand', 
		function(message)
			if message.comando == "memes+" then
-- -- -- -- -- -- -- -- -- Lembrar de colocar sempre o número da nova página em pags.
			local pags = {"1", "2", "3", "4", "5"}
				if message.parametro == "1" then
				message.chat:escrever("---------------------------");
				message.chat:escrever("(" .. message.parametro .. "/".. #pags ..") Memes extras disponíveis:");
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/ATGQVIMR_165515.png] - :kappa:")
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/HVDLWCCR_276890.png] - :erro: :errou: :faustao:")
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/PPEMNCDI_257702.png] - :facepalm:");
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/MBTPQHUR_288484.png] - :laranjo: :ata:");
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/GDMPHSMR_285489.png] - :birl: :bambam:")
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/NTSWIOSO_287456.png] - :gil: :esfirra:")
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/OHJTJSFT_279124.png] - :numberone: :robbie:")
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/LPWAKFTO_322926.png] - :yeye: :mallandro: :malandro:")
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/KQITWFQA_281059.png] - :jailson: :delicia: :dlc:")
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/GPPTICTF_445968/GFCINCDF_332393.png] - :mineirinho: :mineiro: :miner:")
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/DTWVUJTG_328320.png] - :rollsafe:");
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/SATTWRBV_280800.png] - :aliens:");
				message.chat:escrever("[§i http://blob.firecast.com.br/blobs/COOIWFRQ_342869.png] - :joke:")
				message.chat:escrever("---------------------------")
				message.response = {handled = true};
			elseif message.parametro == "2" then
				message.chat:escrever("---------------------------");
				message.chat:escrever("(" .. message.parametro .. "/".. #pags ..") Memes extras disponíveis:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/HCVTTTUS_446360/Ruby.png] - :ruby:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/DKEFSHKB_446449/VascoEmote_copy.png] - :vasco: :segundo: :serieb:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/FITEQFAH_446364/Silver.png] - :silver:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/EGLROTRF_381620.png] - :gratidao: :flor:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/NJUUOSGI_446436/GRREMOTEgrr_copy.png] - :grr: :raiva:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/VJFPBSCR_446366/1.0.png] - :kappapride: :pride:");
				message.chat:escrever("[§I http://firecast.blob.core.windows.net/blobs/FSHMQBPU_261884.png] - :grand: :granddad: :dad:");
				message.chat:escrever("[§I http://firecast.blob.core.windows.net/blobs/KGJMHLUI_262017.png] - :smol:");
				message.chat:escrever("[§I http://firecast.blob.core.windows.net/blobs/LTNUGORU_324911.png] - :lennyface: :aquelacarinha: :carinha:");
				message.chat:escrever("[§I http://firecast.blob.core.windows.net/blobs/EFOBDVPO_286295.png] - :sadcena:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/OHEPLIGJ_286305.png] - :prettygood: :eyy:");
				message.chat:escrever("[§I http://firecast.blob.core.windows.net/blobs/UJJGOVUD_291027.png] - :nico:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/PPVUFLVC_446372/renatinho_copy.png] - :ayy: :lmao: :ayylmao:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/EMVLJSLL_280475.png] - :snoop: :snoopdog:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/SKPJCQPT_280267.png] - :aesthetic: :vaporwave:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/JBVOGKWL_304931.png] - :opinar:");
				message.chat:escrever("---------------------------");
				
				message.response = {handled = true};
			elseif message.parametro == "3" then
				message.chat:escrever("---------------------------");
				message.chat:escrever("(" .. message.parametro .. "/".. #pags ..") Memes extras disponíveis:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/TVMALCDF_466315/Screenshot_1.png] - :whoa: :woah:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/MVPQVOLH_446430/ItalianWayofEMOTE_copy.png] - :italian: :italianway: :italia:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/KLNSMRMH_481319/6Proerd-10_07_copy.png] - :proerd: :drogas:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/RWHEIETK_470134/Drakeapproves_copy.png] - :drakeyea: :drakeyes: :drakey:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/MJVWEWKP_470131/Drake_emote.png] - :drakenay: :drakeno: :draken:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/SGOBWJLM_482152/160722_old_el_paso_copy.png] - :whynotboth: :both:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/ARMSCPPA_476913/One_Meme_Does_Not_Simply_copy.png] - :boromir: :onenotsimple: :notsimple:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/IJCCEVVN_482138/_Knuckles.png] - :knuckles: :&knuckles:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/OGETOALJ_526205/real_shit.png] - :sleep: :shaqsleep:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/CEPGSOJW_526296/isleep.png] - :realshit: :shaqshit:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/PVMTJELH_526308/ascended.png] - :ascended: :shaqasc:");
				message.chat:escrever("---------------------------");
				
				message.response = {handled = true};
			elseif message.parametro == "4" then
				message.chat:escrever("---------------------------");
				message.chat:escrever("(" .. message.parametro .. "/".. #pags ..") Memes extras disponíveis:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/RTKBCLSH_528465/bwah.png] - :bwah: :rabbid: :rabbids:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/KCPDJJBA_528523/sanic_copy.png] - :sanic: :gottagofast:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/QMASOATM_528507/Sonico.png] - :sonico:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/DNLLQKDV_528597/PogChamp.png] - :pogchamp:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/SDLQDDCS_528531/Cazalbe_copy.png] - :cazalbe: :prassa: :praça:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/PDLQTSCP_528568/lul_copy.png] - :lul:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/JGCFEWLQ_528617/It_was_me__dio_copy.png] - :dio: :itwasme: :wasme:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/PVJNEUJU_586789/padoru.png] - :padoru:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/KQNTQLRQ_586827/vrikowithleiseres.png] - :vrikoloko: :vriko300: :vrikoputasso:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/AVWILHTQ_586799/Gato_lixa.png] - :lixa: :salem:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/BLIKAAGJ_586841/sadpepe.png] - :sadpepe: :feelsbad: :feelsbadman:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/JEERQWGF_586849/feelsgoodman.png] - :feelsgoodman: :feelsgood: :feelsgoodbro:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/HPVHBIDH_586853/monkaS.png] - :monkaS: :monkas:");
				message.chat:escrever("---------------------------");
				
				message.response = {handled = true};
			elseif message.parametro == "5" then
				message.chat:escrever("---------------------------");
				message.chat:escrever("(" .. message.parametro .. "/".. #pags ..") Memes extras disponíveis:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/QINNLNTH_609786/ohno.png] - :ohno:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/AGCDMMKP_637066/the_way.png] - :way: :wae:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/RALAVJLW_668475/Salt_copy.png] - :salty: :salt: :sal:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/IOUDFOEG_667482/Entei_emote_gulhotinado.png] - :entei: :tudobem:");
				message.chat:escrever("[§I https://i.imgur.com/s9MjjM8.png] - :hallo: :toad: :bup:");
				message.chat:escrever("[§I https://i.imgur.com/dqM4V8L.png] - :omegalul:");
				message.chat:escrever("[§I https://i.imgur.com/lRCwdwV.png] - :blessrng: :pray: :reza:");
				message.chat:escrever("[§I https://i.imgur.com/WlejhwU.png] - :poggers: :pog:");
				message.chat:escrever("[§I https://i.imgur.com/wzeqv1I.png] - :donk: :dk: :kong:");
				message.chat:escrever("[§I https://i.imgur.com/LZQ2eZW.png] - :rubinho: :barrichello:");
				message.chat:escrever("[§I https://i.imgur.com/IabQdDG.png] - Perdão, este meme está bloqueado. Para libera-lo, considere adquirir na loja.");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/LOKLSJKD_290948.png] - :dong: :expand: :expanddong:");
				message.chat:escrever("[§I http://blob.firecast.com.br/blobs/OFNUQGOJ_446386/tobeemote.png] - :continue: :continued: :tobecontinued:");
				message.chat:escrever("---------------------------");
				
				message.response = {handled = true};
				else
					message.chat:escrever("Página inválida, tente entre as ".. #pags .." páginas disponíveis.")
					message.response = {handled = true};
-- -- -- -- -- -- -- -- -- Checar linha 8 caso atualizar a quantia de páginas.
				end;
			elseif message.comando == "randommeme" then
			local memes = {":kappa:", ":pog:", ":dk:", ":hallo:", ":omegalul:", ":pray:", ":erro:", ":salty:", ":entei:", ":wae:", ":ohno:", ":facepalm:", ":laranjo:", ":birl:", ":gil:", ":numberone:", ":yeye:", ":dlc:", ":miner:", ":rollsafe:", ":aliens:", ":joke:", ":ruby:", ":vasco:", ":silver:", ":flor:", ":grr:", ":pride:", ":dad:", ":smol:", ":carinha:", ":sadcena:", ":eyy:", ":nico:", ":ayy:", ":snoop:", ":aesthetic:", ":opinar:", ":whoa:", ":italia:", ":proerd:", ":drakey:", ":draken:", ":both:", ":boromir:", ":knuckles:", ":sleep:", ":realshit:", ":ascended:", ":bwah:", ":sanic:", ":sonico:", ":pogchamp:", ":praça:", ":lul:", ":dio:", ":padoru:", ":vriko300:", ":lixa:", ":sadpepe:", ":feelsgood:", ":monkaS:", ":barrichello:", ":expand:", ":continue:"}
			local parN = tonumber(message.parametro);
			local rolagem = rrpg.interpretarRolagem("1d" .. #memes);
			local parVero = isNumber(parN)
				if parVero == true then
				if parN <= 0 then
					rolagem:rolarLocalmente()
					message.chat:enviarMensagem(memes[rolagem.resultado])
					message.response = {handled = true};
				elseif parN >= 11 then
					local msg = "";
					for m = 1, 10, 1 do
						rolagem:rolarLocalmente()
						msg = msg .. " " .. memes[rolagem.resultado];
					end;
						message.chat:enviarMensagem(msg)
						message.response = {handled = true};
				else
					local msg = "";
					for m = 1, parN, 1 do
						rolagem:rolarLocalmente()
						msg = msg .. " " .. memes[rolagem.resultado];
					end;
						message.chat:enviarMensagem(msg)
						message.response = {handled = true};
				end;
				else
				message.response = {handled = true};
				message.chat:escrever("Parâmetro inválido, por favor insira a quantia de memes sortidos que deseja.");
				end; end; end)

			
-- -- Listagem dos Comandos
rrpg.messaging.listen("ListChatCommands",
	function(message)
			message.response = {{comando="/memes+ <PÁGINA>", descricao="Exibe a lista de emotes e memes que o Memes+ adiciona."}};
	end);
-- -- Memes
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':kappa:', '[§i http://blob.firecast.com.br/blobs/ATGQVIMR_165515.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':erro:', '[§i http://blob.firecast.com.br/blobs/HVDLWCCR_276890.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':errou:', '[§i http://blob.firecast.com.br/blobs/HVDLWCCR_276890.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':faustao:', '[§i http://blob.firecast.com.br/blobs/HVDLWCCR_276890.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':facepalm:', '[§i http://blob.firecast.com.br/blobs/PPEMNCDI_257702.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':laranjo:', '[§i http://blob.firecast.com.br/blobs/MBTPQHUR_288484.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':ata:', '[§i http://blob.firecast.com.br/blobs/MBTPQHUR_288484.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':birl:', '[§i http://blob.firecast.com.br/blobs/GDMPHSMR_285489.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':bambam:', '[§i http://blob.firecast.com.br/blobs/GDMPHSMR_285489.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':gil:', '[§i http://blob.firecast.com.br/blobs/NTSWIOSO_287456.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':esfirra:', '[§i http://blob.firecast.com.br/blobs/NTSWIOSO_287456.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':numberone:', '[§i http://blob.firecast.com.br/blobs/OHJTJSFT_279124.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':robbie:', '[§i http://blob.firecast.com.br/blobs/OHJTJSFT_279124.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':yeye:', '[§i http://blob.firecast.com.br/blobs/LPWAKFTO_322926.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':mallandro:', '[§i http://blob.firecast.com.br/blobs/LPWAKFTO_322926.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':malandro:', '[§i http://blob.firecast.com.br/blobs/LPWAKFTO_322926.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':jailson:', '[§i http://blob.firecast.com.br/blobs/KQITWFQA_281059.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':delicia:', '[§i http://blob.firecast.com.br/blobs/KQITWFQA_281059.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':dlc:', '[§i http://blob.firecast.com.br/blobs/KQITWFQA_281059.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':mineirinho:', '[§i http://blob.firecast.com.br/blobs/GPPTICTF_445968/GFCINCDF_332393.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':mineiro:', '[§i http://blob.firecast.com.br/blobs/GPPTICTF_445968/GFCINCDF_332393.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':miner:', '[§i http://blob.firecast.com.br/blobs/GPPTICTF_445968/GFCINCDF_332393.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':rollsafe:', '[§i http://blob.firecast.com.br/blobs/DTWVUJTG_328320.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':aliens:', '[§i http://blob.firecast.com.br/blobs/SATTWRBV_280800.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':joke:', '[§i http://blob.firecast.com.br/blobs/COOIWFRQ_342869.png]') };

    end);
	
-- -- Página 2

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':ruby:', '[§I http://blob.firecast.com.br/blobs/HCVTTTUS_446360/Ruby.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':vasco:', '[§I http://blob.firecast.com.br/blobs/DKEFSHKB_446449/VascoEmote_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':segundo:', '[§I http://blob.firecast.com.br/blobs/DKEFSHKB_446449/VascoEmote_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':serieb:', '[§I http://blob.firecast.com.br/blobs/DKEFSHKB_446449/VascoEmote_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':silver:', '[§I http://blob.firecast.com.br/blobs/FITEQFAH_446364/Silver.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':gratidao:', '[§I http://blob.firecast.com.br/blobs/EGLROTRF_381620.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':flor:', '[§I http://blob.firecast.com.br/blobs/EGLROTRF_381620.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':grr:', '[§I http://blob.firecast.com.br/blobs/NJUUOSGI_446436/GRREMOTEgrr_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':raiva:', '[§I http://blob.firecast.com.br/blobs/NJUUOSGI_446436/GRREMOTEgrr_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':kappapride:', '[§I http://blob.firecast.com.br/blobs/VJFPBSCR_446366/1.0.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':pride:', '[§I http://blob.firecast.com.br/blobs/VJFPBSCR_446366/1.0.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':grand:', '[§I http://firecast.blob.core.windows.net/blobs/FSHMQBPU_261884.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':granddad:', '[§I http://firecast.blob.core.windows.net/blobs/FSHMQBPU_261884.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':dad:', '[§I http://firecast.blob.core.windows.net/blobs/FSHMQBPU_261884.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':smol:', '[§I http://firecast.blob.core.windows.net/blobs/KGJMHLUI_262017.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':lennyface:', '[§I http://firecast.blob.core.windows.net/blobs/LTNUGORU_324911.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':aquelacarinha:', '[§I http://firecast.blob.core.windows.net/blobs/LTNUGORU_324911.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':carinha:', '[§I http://firecast.blob.core.windows.net/blobs/LTNUGORU_324911.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':sadcena:', '[§I http://firecast.blob.core.windows.net/blobs/EFOBDVPO_286295.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':prettygood:', '[§I http://blob.firecast.com.br/blobs/OHEPLIGJ_286305.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':eyy:', '[§I http://blob.firecast.com.br/blobs/OHEPLIGJ_286305.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':nico:', '[§I http://firecast.blob.core.windows.net/blobs/UJJGOVUD_291027.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':ayy:', '[§I http://blob.firecast.com.br/blobs/PPVUFLVC_446372/renatinho_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':ayylmao:', '[§I http://blob.firecast.com.br/blobs/PPVUFLVC_446372/renatinho_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':lmao:', '[§I http://blob.firecast.com.br/blobs/PPVUFLVC_446372/renatinho_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':snoop:', '[§I http://blob.firecast.com.br/blobs/EMVLJSLL_280475.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':snoopdog:', '[§I http://blob.firecast.com.br/blobs/EMVLJSLL_280475.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':aesthetic:', '[§I http://blob.firecast.com.br/blobs/SKPJCQPT_280267.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':vaporwave:', '[§I http://blob.firecast.com.br/blobs/SKPJCQPT_280267.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':opinar:', '[§I http://blob.firecast.com.br/blobs/JBVOGKWL_304931.png]') };

    end);
	
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- Página 3

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':whoa:', '[§I http://blob.firecast.com.br/blobs/TVMALCDF_466315/Screenshot_1.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':woah:', '[§I http://blob.firecast.com.br/blobs/TVMALCDF_466315/Screenshot_1.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':italian:', '[§I http://blob.firecast.com.br/blobs/MVPQVOLH_446430/ItalianWayofEMOTE_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':italianway:', '[§I http://blob.firecast.com.br/blobs/MVPQVOLH_446430/ItalianWayofEMOTE_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':italia:', '[§I http://blob.firecast.com.br/blobs/MVPQVOLH_446430/ItalianWayofEMOTE_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':continue:', '[§I http://blob.firecast.com.br/blobs/OFNUQGOJ_446386/tobeemote.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':tobecontinued:', '[§I http://blob.firecast.com.br/blobs/OFNUQGOJ_446386/tobeemote.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':continued:', '[§I http://blob.firecast.com.br/blobs/OFNUQGOJ_446386/tobeemote.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':proerd:', '[§I http://blob.firecast.com.br/blobs/KLNSMRMH_481319/6Proerd-10_07_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':drogas:', '[§I http://blob.firecast.com.br/blobs/KLNSMRMH_481319/6Proerd-10_07_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':knuckles:', '[§I http://blob.firecast.com.br/blobs/IJCCEVVN_482138/_Knuckles.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':&knuckles:', '[§I http://blob.firecast.com.br/blobs/IJCCEVVN_482138/_Knuckles.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':drakeyes:', '[§I http://blob.firecast.com.br/blobs/RWHEIETK_470134/Drakeapproves_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':drakeyea:', '[§I http://blob.firecast.com.br/blobs/RWHEIETK_470134/Drakeapproves_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':drakey:', '[§I http://blob.firecast.com.br/blobs/RWHEIETK_470134/Drakeapproves_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':drakenay:', '[§I http://blob.firecast.com.br/blobs/MJVWEWKP_470131/Drake_emote.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':drakeno:', '[§I http://blob.firecast.com.br/blobs/MJVWEWKP_470131/Drake_emote.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':draken:', '[§I http://blob.firecast.com.br/blobs/MJVWEWKP_470131/Drake_emote.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':whynotboth:', '[§I http://blob.firecast.com.br/blobs/SGOBWJLM_482152/160722_old_el_paso_copy.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':both:', '[§I http://blob.firecast.com.br/blobs/SGOBWJLM_482152/160722_old_el_paso_copy.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':boromir:', '[§I http://blob.firecast.com.br/blobs/ARMSCPPA_476913/One_Meme_Does_Not_Simply_copy.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':onenotsimple:', '[§I http://blob.firecast.com.br/blobs/ARMSCPPA_476913/One_Meme_Does_Not_Simply_copy.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':notsimple:', '[§I http://blob.firecast.com.br/blobs/ARMSCPPA_476913/One_Meme_Does_Not_Simply_copy.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':sleep:', '[§I http://blob.firecast.com.br/blobs/OGETOALJ_526205/real_shit.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':shaqsleep:', '[§I http://blob.firecast.com.br/blobs/OGETOALJ_526205/real_shit.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':realshit:', '[§I http://blob.firecast.com.br/blobs/CEPGSOJW_526296/isleep.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':shaqshit:', '[§I http://blob.firecast.com.br/blobs/CEPGSOJW_526296/isleep.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':ascended:', '[§I http://blob.firecast.com.br/blobs/PVMTJELH_526308/ascended.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':shaqasc:', '[§I http://blob.firecast.com.br/blobs/PVMTJELH_526308/ascended.png]') };

    end);	
	
	

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- Página 4 (Parei de contar páginas, eventualmente trocarei como são adicionados de qualquer jeito)

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':bwah:', '[§I http://blob.firecast.com.br/blobs/RTKBCLSH_528465/bwah.png]') };

    end);	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':rabbid:', '[§I http://blob.firecast.com.br/blobs/RTKBCLSH_528465/bwah.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':rabbids:', '[§I http://blob.firecast.com.br/blobs/RTKBCLSH_528465/bwah.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':sanic:', '[§I http://blob.firecast.com.br/blobs/KCPDJJBA_528523/sanic_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':gottagofast:', '[§I http://blob.firecast.com.br/blobs/KCPDJJBA_528523/sanic_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':sonico:', '[§I http://blob.firecast.com.br/blobs/QMASOATM_528507/Sonico.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':pogchamp:', '[§I http://blob.firecast.com.br/blobs/DNLLQKDV_528597/PogChamp.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':cazalbe:', '[§I http://blob.firecast.com.br/blobs/SDLQDDCS_528531/Cazalbe_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':prassa:', '[§I http://blob.firecast.com.br/blobs/SDLQDDCS_528531/Cazalbe_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':praça:', '[§I http://blob.firecast.com.br/blobs/SDLQDDCS_528531/Cazalbe_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':lul:', '[§I http://blob.firecast.com.br/blobs/PDLQTSCP_528568/lul_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':dio:', '[§I http://blob.firecast.com.br/blobs/JGCFEWLQ_528617/It_was_me__dio_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':itwasme:', '[§I http://blob.firecast.com.br/blobs/JGCFEWLQ_528617/It_was_me__dio_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':wasme:', '[§I http://blob.firecast.com.br/blobs/JGCFEWLQ_528617/It_was_me__dio_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':expand:', '[§I http://blob.firecast.com.br/blobs/LOKLSJKD_290948.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':expanddong:', '[§I http://blob.firecast.com.br/blobs/LOKLSJKD_290948.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':padoru:', '[§I http://blob.firecast.com.br/blobs/PVJNEUJU_586789/padoru.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':vrikoloko:', '[§I http://blob.firecast.com.br/blobs/KQNTQLRQ_586827/vrikowithleiseres.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':vriko300:', '[§I http://blob.firecast.com.br/blobs/KQNTQLRQ_586827/vrikowithleiseres.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':vrikoputasso:', '[§I http://blob.firecast.com.br/blobs/KQNTQLRQ_586827/vrikowithleiseres.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':lixa:', '[§I http://blob.firecast.com.br/blobs/AVWILHTQ_586799/Gato_lixa.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':salem:', '[§I http://blob.firecast.com.br/blobs/AVWILHTQ_586799/Gato_lixa.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':sadpepe:', '[§I http://blob.firecast.com.br/blobs/BLIKAAGJ_586841/sadpepe.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':feelsbad:', '[§I http://blob.firecast.com.br/blobs/BLIKAAGJ_586841/sadpepe.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':feelsbadman:', '[§I http://blob.firecast.com.br/blobs/BLIKAAGJ_586841/sadpepe.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':feelsgood:', '[§I http://blob.firecast.com.br/blobs/JEERQWGF_586849/feelsgoodman.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':feelsgoodman:', '[§I http://blob.firecast.com.br/blobs/JEERQWGF_586849/feelsgoodman.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':feelsgoodbro:', '[§I http://blob.firecast.com.br/blobs/JEERQWGF_586849/feelsgoodman.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':monkaS:', '[§I http://blob.firecast.com.br/blobs/HPVHBIDH_586853/monkaS.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':monkas:', '[§I http://blob.firecast.com.br/blobs/HPVHBIDH_586853/monkaS.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':ohno:', '[§I http://blob.firecast.com.br/blobs/QINNLNTH_609786/ohno.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':way:', '[§I http://blob.firecast.com.br/blobs/AGCDMMKP_637066/the_way.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':wae:', '[§I http://blob.firecast.com.br/blobs/AGCDMMKP_637066/the_way.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':entei:', '[§I http://blob.firecast.com.br/blobs/IOUDFOEG_667482/Entei_emote_gulhotinado.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':tudobem:', '[§I http://blob.firecast.com.br/blobs/IOUDFOEG_667482/Entei_emote_gulhotinado.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':salt:', '[§I http://blob.firecast.com.br/blobs/RALAVJLW_668475/Salt_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':salty:', '[§I http://blob.firecast.com.br/blobs/RALAVJLW_668475/Salt_copy.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':sal:', '[§I http://blob.firecast.com.br/blobs/RALAVJLW_668475/Salt_copy.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':hallo:', '[§I https://i.imgur.com/s9MjjM8.png]') };

    end);

RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':toad:', '[§I https://i.imgur.com/s9MjjM8.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':bup:', '[§I https://i.imgur.com/s9MjjM8.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':omegalul:', '[§I https://i.imgur.com/dqM4V8L.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':blessrng:', '[§I https://i.imgur.com/lRCwdwV.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':pray:', '[§I https://i.imgur.com/lRCwdwV.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':reza:', '[§I https://i.imgur.com/lRCwdwV.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':poggers:', '[§I https://i.imgur.com/WlejhwU.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':pog:', '[§I https://i.imgur.com/WlejhwU.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':donk:', '[§I https://i.imgur.com/wzeqv1I.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':dk:', '[§I https://i.imgur.com/wzeqv1I.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':kong:', '[§I https://i.imgur.com/wzeqv1I.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':rubinho:', '[§I https://i.imgur.com/LZQ2eZW.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':barrichello:', '[§I https://i.imgur.com/LZQ2eZW.png]') };

    end);
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':dong:', '[§I http://blob.firecast.com.br/blobs/LOKLSJKD_290948.png]') };

    end);
	
	
RRPG.listen('HandleChatTextInput',

    function(message)  
		message.response =

            {newText = string.gsub(message.texto, ':true:', ':truestory:') };

    end);