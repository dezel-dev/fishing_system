---@author Dezel

ESX.RegisterUsableItem('fishing_rod', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer ~= nil) then
        local haveItem = xPlayer.getInventoryItem('fishing_rod').count > 0
        if (haveItem) then
            TriggerClientEvent("fishing:startFishing", xPlayer.source)
        else
            xPlayer.showNotification("Vous n'avez pas de canne à pêche !")
        end
    end
end)

ESX.RegisterUsableItem("hook", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer ~= nil) then
        local haveItem = xPlayer.getInventoryItem('hook').count > 0
        if (haveItem) then
            TriggerClientEvent("fishing:attachBasicHook", xPlayer.source)
            xPlayer.removeInventoryItem("hook", 1)
        else
            xPlayer.showNotification("Vous n'avez pas d'hameçon !")
        end
    end
end)

ESX.RegisterUsableItem("hook_upgraded", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer ~= nil) then
        local haveItem = xPlayer.getInventoryItem('hook_upgraded').count > 0
        if (haveItem) then
            TriggerClientEvent("fishing:attachUpgradedHook", xPlayer.source)
            xPlayer.removeInventoryItem("hook_upgraded", 1)
        else
            xPlayer.showNotification("Vous n'avez pas d'hameçon amélioré !")
        end
    end
end)