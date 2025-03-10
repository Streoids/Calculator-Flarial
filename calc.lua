onCommand("calc", "made by @Streoids", function(args)
    local expression = table.concat(args, " ")
    if expression:match("[+%-/%*%^][+%-/%*%^]")then
        return sendClientMessage("§4calc: Invalid operator")
    end
    if expression:match("%a")then
        return sendClientMessage("§4calc: Invalid calculation")
    end
    local func = load("return " .. expression)
    if not func then return sendClientMessage("§4calc: Invalid input")
    end
    local success, result = pcall(func)
    if not success then return sendClientMessage("§4calc: Invalid calculation")
    end
    if result == math.huge or result == -math.huge then 
        return sendClientMessage("§4calc: can't divide with 0. consider getting an education") 
    end
    sendClientMessage("§acalc: " .. (result == math.floor(result) and math.floor(result) or result))
end)
onCommand("calchelp", "calc help", function()
    sendClientMessage("§ecalc is a simple Calculator that runs in Minecraft, by §fStreoids")
    sendClientMessage("§fIt can perform arithmetic functions such as:")
    sendClientMessage("§o§bAddition [ + ]")
    sendClientMessage("§o§bSubtraction [ - ]")
    sendClientMessage("§o§bMultiplication [ * ]")
    sendClientMessage("§o§bDivision [ / ]")
    sendClientMessage("§o§bExponentiation [ ^ ]")
    sendClientMessage("§eExamples:")
    sendClientMessage("§b.calc 5+2")
    sendClientMessage("§b.calc (5+5)*2")
    sendClientMessage("§b.calc 16/2")
    sendClientMessage("§b.calc 6-3")
    sendClientMessage("§b.calc 6^2")
    sendClientMessage("§k§2!.§a:§2'§r §4Flarial on top! §k§2!.§a:§2'")
end)
--i like computer