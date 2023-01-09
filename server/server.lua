local data = {}
local CompassEnabled = false

TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

AddEventHandler("RegisterUsableItem:Compass", function(source)
    CompassEnabled = not CompassEnabled
end)

RegisterNetEvent('kfo_misc:checkCompass')
AddEventHandler('kfo_misc:checkCompass', function()
    local compass = data.checkItem(source, 'Compass')

    if compass > 0 then
        if CompassEnabled then 
            TriggerClientEvent('kfo_misc:setMinimap', source, 3)
        else
            TriggerClientEvent('kfo_misc:setMinimap', source, 0)
        end
    else
        TriggerClientEvent('kfo_misc:setMinimap', source, 0)
    end

end)

RegisterNetEvent('kfo_misc:handleInventory')
AddEventHandler('kfo_misc:handleInventory', function()
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
    CompassEnabled = false
end)