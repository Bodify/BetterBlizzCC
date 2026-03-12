local errorMsg = "Better|cff00c0ffBlizz|rCC is only intended for TBC and MoP atm."

SLASH_BBCC1 = "/BBCC"
SlashCmdList["BBCC"] = function()
    print(errorMsg)
end

C_Timer.After(5, function()
    print(errorMsg)
end)