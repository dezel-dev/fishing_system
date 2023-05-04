---@author Dezel

isPlayerFishing = false

RegisterNetEvent("fishing:startFishing", function()
    if (not isPlayerInZone) then
       return ESX.ShowNotification("Vous n'êtes pas dans une zone de pêche !")
    end
    if (isPlayerFishing) then
        return ESX.ShowNotification("Vous êtes déjà en train de pêcher !")
    end
    isPlayerFishing = true
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
end)