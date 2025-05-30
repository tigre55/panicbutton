ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(200)
    end
end)

RegisterNetEvent('esx-panicbutton:alert')
AddEventHandler('esx-panicbutton:alert', function(coords)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.5)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("🔴 PANICO - Agente in difficoltà")
    EndTextCommandSetBlipName(blip)

    PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    ESX.ShowNotification("~r~Un agente ha premuto il pulsante PANICO!")

    Wait(30000)
    RemoveBlip(blip)
end)

CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 56) then -- F9
            ESX.TriggerServerCallback('esx:getPlayerData', function(data)
                if data.job.name == 'police' then
                    local coords = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent('esx-panicbutton:sendAlert', coords)
                    ESX.ShowNotification("~r~Hai inviato un segnale di panico!")
                end
            end)
        end
    end
end)
