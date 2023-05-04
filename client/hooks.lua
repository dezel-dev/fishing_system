---@author Dezel

isPlayerEquipBasicHook = false
isPlayerEquipUpgradedHook = false

RegisterNetEvent("fishing:attachBasicHook", function()
    if (not isPlayerFishing) then
        return ESX.ShowNotification("Vous n'êtes pas en train de pêcher !")
    end
    isPlayerEquipBasicHook = true
    isPlayerEquipUpgradedHook = false
end)
RegisterNetEvent("fishing:attachUpgradedHook", function()
    if (not isPlayerFishing) then
        return ESX.ShowNotification("Vous n'êtes pas en train de pêcher !")
    end
    isPlayerEquipBasicHook = false
    isPlayerEquipUpgradedHook = true
end)