---@author Dezel

RegisterNetEvent("fishing:catchFish", function(fish, hookType)
    local _src <const> = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local canCarryFish = xPlayer.canCarryItem(fish, 1)
    if (not canCarryFish) then
        return xPlayer.showNotification("Vous n'avez plus de place dans votre inventaire !")
    end
    if (hookType == "basic") then
        xPlayer.removeInventoryItem("hook", 1)
    end
    if (hookType == "upgraded") then
        xPlayer.removeInventoryItem("hook_upgraded", 1)
    end
    xPlayer.addInventoryItem(fish, 1)
end)