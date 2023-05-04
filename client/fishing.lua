---@author Dezel

local canCatchFish = false
local touch = {
    [1] = 157,
    [2] = 158,
    [3] = 160,
    [4] = 164,
    [5] = 165,
    [6] = 159,
    [7] = 161,
    [8] = 162,
    [9] = 163
}

function GetRandomFish(hookType)
    local totalChance = 0
    for i, fish in ipairs(Config.FishRandoms) do
        totalChance = totalChance + fish.chance[hookType]
    end

    local randomValue = math.random(0, totalChance)

    for i, fish in ipairs(Config.FishRandoms) do
        randomValue = randomValue - fish.chance[hookType]
        if randomValue <= 0 then
            return fish.name
        end
    end

    return nil
end

--[[
    Stop fishing
]]--
Citizen.CreateThread(function()
    while (true) do
        local interval = 1000
        if (isPlayerFishing) then
            interval = 0
            ESX.ShowHelpNotification(("Appuyez sur ~INPUT_CONTEXT~ pour arrêter de pêcher ~n~Appât attaché : %s"):format(isPlayerEquipBasicHook and "~g~Basique" or isPlayerEquipUpgradedHook and "~g~Amélioré" or "~r~Aucun"))
            if (IsControlJustPressed(0, 51)) then
                isPlayerFishing = false
                isPlayerEquipBasicHook = false
                isPlayerEquipUpgradedHook = false
                ClearPedTasks(PlayerPedId())
            end
        end
        Wait(interval)
    end
end)

--[[
    Interaction fishing
]]--
Citizen.CreateThread(function()
    while (true) do
        if (isPlayerFishing) then
            --[[
                Random Fish
            ]]--
            hookType = isPlayerEquipBasicHook and "basic" or isPlayerEquipUpgradedHook and "upgraded" or "without_hook"
            local fish = Config.Fish[GetRandomFish(hookType)]

            if (not fish) then
                return
            end
            --[[
                Catch Fish
            ]]--
            local number = math.random(1,9)
            catchedFish = {
                name = fish.name,
                label = fish.label,
                number = number
            }
            canCatchFish = true
            ESX.ShowNotification(("Un(e) ~g~%s ~s~est au bout de la canne ! ~n~Appuyez sur ~y~%i ~s~pour l'attraper"):format(catchedFish.label, catchedFish.number))
            Citizen.SetTimeout(2000, function()
                if (canCatchFish) then
                    canCatchFish = false
                    ESX.ShowNotification("Le poisson s'est échappé ! Les appâts sont perdus !")
                    isPlayerEquipBasicHook = false
                    isPlayerEquipUpgradedHook = false
                end
            end)
        end
        Wait(math.random(25000, 40000))
    end
end)

Citizen.CreateThread(function()
    while (true) do
        local interval = 1000
        if (isPlayerFishing) then
            interval = 0
            if (canCatchFish) then
                if (IsControlJustPressed(0, touch[catchedFish.number])) then
                    canCatchFish = false
                    print(catchedFish.name)
                    TriggerServerEvent("fishing:catchFish", catchedFish.name, hookType)
                    ESX.ShowNotification("Vous avez attrapé un(e) ~g~"..catchedFish.label.." ~s~!")
                    isPlayerEquipBasicHook = false
                    isPlayerEquipUpgradedHook = false
                end
            end
        end
        Wait(interval)
    end
end)