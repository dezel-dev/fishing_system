---@author Dezel

isPlayerInZone = false

--[[
    Zones blips
]]--
Citizen.CreateThread(function()
    for _,v in pairs(Config.FishZones) do
        if (v.showBlip) then
            --[[
                Static blip
            ]]--
            local blip_static = AddBlipForCoord(v.position)
            SetBlipSprite(blip_static, 68)
            SetBlipDisplay(blip_static, 4)
            SetBlipScale(blip_static, 0.8)
            SetBlipColour(blip_static, 3)
            SetBlipAsShortRange(blip_static, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Zone de pêche")
            EndTextCommandSetBlipName(blip_static)
            --[[
                Zone Blip
            ]]--
            local blip_zone = AddBlipForRadius(v.position, 500.0)
            SetBlipSprite(blip_zone,1)
            SetBlipColour(blip_zone, 3)
            SetBlipAlpha(blip_zone,100)
        end
    end
end)

--[[
    Zones manager
]]--
Citizen.CreateThread(function()
    while (true) do
        local interval = 1000
        for _,v in pairs(Config.FishZones) do
            local dst = #(GetEntityCoords(PlayerPedId()) - v.position)
            if (dst <= v.minDst) then
                interval = 0
                isPlayerInZone = true
                if (not isPlayerFishing) then
                    RageUI.Text({message = "Vous pouvez ~b~pêchez ~s~!"})
                end
            end
        end
        Wait(interval)
    end
end)