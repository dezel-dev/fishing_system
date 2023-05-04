---@author Dezel

RegisterCommand("pos", function(source)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    print(playerCoords, playerHeading)
end)