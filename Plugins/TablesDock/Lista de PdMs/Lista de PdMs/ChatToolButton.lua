require("firecast.lua")

local params = {}
params.hint = Locale.lang("hint.removeImp")
params.icon = "/Lista de PdMs/images/clear.png"

params.callback =
    function(chat)
        chat:setImpersonation({})
        chat.talemarkOptions=nil
    end

Firecast.registerChatToolButton(params)