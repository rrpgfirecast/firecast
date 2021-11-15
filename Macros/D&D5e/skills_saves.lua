-- Macro para rolar skill checks e saving throws em D&D5e
-- Feito para funcionar com a ficha de 5e nativa do Firecast
-- por Marcola42


local indice, texto = choose("O que deseja fazer?", {"Saving throw", "Skill check"}, 1);

local indiceat, textoat = choose("Qual o atributo principal?", {"Força", "Destreza","Constituição","Inteligência","Sabedoria","Carisma"}, 1);

if indice==1 then
   agir("Save de " .. textoat)
   if indiceat == 1 then
	roll("1d20" .. sheet.resistencias.bonusforcastr,"Rolagem normal")
	roll("1d20" .. sheet.resistencias.bonusforcastr,"Rolagem com (des)Vantagem")
   end
   if indiceat == 2 then
	roll("1d20" .. sheet.resistencias.bonusdestrezastr,"Rolagem normal")
	roll("1d20" .. sheet.resistencias.bonusdestrezastr,"Rolagem com (des)Vantagem")
   end
   if indiceat == 3 then
	roll("1d20" .. sheet.resistencias.bonusconstituicaostr,"Rolagem normal")
	roll("1d20" .. sheet.resistencias.bonusconstituicaostr,"Rolagem com (des)Vantagem")
   end
   if indiceat == 4 then
	roll("1d20" .. sheet.resistencias.bonusinteligenciastr,"Rolagem normal")
	roll("1d20" .. sheet.resistencias.bonusinteligenciastr,"Rolagem com (des)Vantagem")
   end
   if indiceat == 5 then
	roll("1d20" .. sheet.resistencias.bonussabedoriastr,"Rolagem normal")
	roll("1d20" .. sheet.resistencias.bonussabedoriastr,"Rolagem com (des)Vantagem")
   end
   if indiceat == 6 then
	roll("1d20" .. sheet.resistencias.bonuscarismastr ,"Rolagem normal")
	roll("1d20" .. sheet.resistencias.bonuscarismastr ,"Rolagem com (des)Vantagem")
   end
end

if indice==2 then
   if indiceat==1 then
      local indicesk, textosk = choose("Selecione a skill", {"Atletismo"}, 1);
      agir("Teste de " .. textosk)
      if indicesk==1 then
         roll("1d20" .. sheet.pericias.bonusatletismostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusatletismostr,"Rolagem com (des)Vantagem")
      end
   end
   if indiceat==2 then
      local indicesk, textosk = choose("Selecione a skill", {"Acrobacia","Furtividade","Prestigitação"}, 1);
      agir("Teste de " .. textosk)
      if indicesk==1 then
         roll("1d20" .. sheet.pericias.bonusacrobaciastr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusacrobaciastr,"Rolagem com (des)Vantagem")
      end
      if indicesk==2 then
         roll("1d20" .. sheet.pericias.bonusfurtividadestr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusfurtividadestr,"Rolagem com (des)Vantagem")
      end
      if indicesk==3 then
         roll("1d20" .. sheet.pericias.bonusprestidigitacaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusprestidigitacaostr,"Rolagem com (des)Vantagem")
      end
   end
   if indiceat==3 then
      write("Não existe perícia associada a Constituição, tente de novo")
   end
   if indiceat==4 then
      local indicesk, textosk = choose("Selecione a skill", {"Arcanismo","História","Investigação","Natureza","Religião"}, 1);
      agir("Teste de " .. textosk)
      if indicesk==1 then
         roll("1d20" .. sheet.pericias.bonusarcanismostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusarcanismostr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==2 then
         roll("1d20" .. sheet.pericias.bonushistoriastr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonushistoriastr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==3 then
         roll("1d20" .. sheet.pericias.bonusinvestigacaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusinvestigacaostr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==4 then
         roll("1d20" .. sheet.pericias.bonusnaturezastr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusnaturezastr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==5 then
         roll("1d20" .. sheet.pericias.bonusreligiaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusreligiaostr,"Rolagem com (des)Vantagem")
      end
   end
   if indiceat==5 then
      local indicesk, textosk = choose("Selecione a skill", {"Adestrar Animais","Intuição","Medicina","Percepção","Sobrevivência"}, 1);
      agir("Teste de " .. textosk)
      if indicesk==1 then
         roll("1d20" .. sheet.pericias.bonusadestrarAnimaisstr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusadestrarAnimaisstr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==2 then
         roll("1d20" .. sheet.pericias.bonusintuicaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusintuicaostr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==3 then
         roll("1d20" .. sheet.pericias.bonusmedicinastr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusmedicinastr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==4 then
         roll("1d20" .. sheet.pericias.bonuspercepcaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonuspercepcaostr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==5 then
         roll("1d20" .. sheet.pericias.bonussobrevivenciastr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonussobrevivenciastr,"Rolagem com (des)Vantagem")
      end
   end
   if indiceat==6 then
      local indicesk, textosk = choose("Selecione a skill", {"Atuação","Enganação","Indimidação","Persuasão"}, 1);
      agir("Teste de " .. textosk)
      if indicesk==1 then
         roll("1d20" .. sheet.pericias.bonusatuacaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusatuacaostr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==2 then
         roll("1d20" .. sheet.pericias.bonusenganacaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusenganacaostr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==3 then
         roll("1d20" .. sheet.pericias.bonusintimidacaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonusintimidacaostr,"Rolagem com (des)Vantagem")
      end
	  if indicesk==4 then
         roll("1d20" .. sheet.pericias.bonuspersuasaostr,"Rolagem normal")
         roll("1d20" .. sheet.pericias.bonuspersuasaostr,"Rolagem com (des)Vantagem")
      end
   end

end
