RegisterServerEvent('esx-panicbutton:sendAlert')
AddEventHandler('esx-panicbutton:sendAlert', function(coords)
    TriggerClientEvent('esx-panicbutton:alert', -1, coords)
end)
