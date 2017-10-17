-- Boost Die
local icons = {};
icons[1] = "[§I http://blob.firecast.com.br/blobs/HKJSWOFE_393972.png]"
icons[2] = "[§I http://blob.firecast.com.br/blobs/HKJSWOFE_393972.png]"
icons[3] = "[§I http://blob.firecast.com.br/blobs/HKJSWOFE_393972.png]"
icons[4] = "[§I http://blob.firecast.com.br/blobs/HKJSWOFE_393972.png]"
icons[5] = "[§I http://blob.firecast.com.br/blobs/HKJSWOFE_393972.png]"
icons[6] = "[§I http://blob.firecast.com.br/blobs/HKJSWOFE_393972.png]"

local resultado, rolagem = rolar("1d6", "Boost Die");

local text = "Seu Boost die deu" .. icons[resultado] .. "!";

enviar(text);