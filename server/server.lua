local data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterNetEvent('kfo_misc:checkCompass')
AddEventHandler('kfo_misc:checkCompass', function()
    local compass = data.checkItem(source, 'Compass')

    if compass > 0 then
        TriggerClientEvent('kfo_misc:setMinimap', source, 3)
    else
        TriggerClientEvent('kfo_misc:setMinimap', source, 0)
    end
end)