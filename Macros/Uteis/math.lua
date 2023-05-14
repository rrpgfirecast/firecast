local func, errorMsg = load("resultado = (" .. parameter .. ")");
 
if func ~= nil then
  -- O codigo foi carregado. Vamos invocá-lo agora
  enviar("[§K3]Expressão: [§B][§K1]" .. parameter);
  func();
  enviar("[§K3]Resultado: [§B][§K2]" .. resultado)
else
  write("could not load lua code: " .. errorMsg);
end