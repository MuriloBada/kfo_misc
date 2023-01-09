local data = {}
local usedCompass = false

TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

AddEventHandler("RegisterUsableItem:Compass", function(source)
    local _source = source
    usedCompass = true
end)

RegisterNetEvent('kfo_misc:checkCompass')
AddEventHandler('kfo_misc:checkCompass', function()
    local compass = data.checkItem(source, 'Compass')

    if compass > 0 and usedCompass then
        TriggerClientEvent('kfo_misc:setMinimap', source, 3)

    elseif compass == 0 and usedCompass then
        usedCompass = false
        TriggerClientEvent('kfo_misc:setMinimap', source, 0)
        
    else
        TriggerClientEvent('kfo_misc:setMinimap', source, 0)
    end
end)

RegisterNetEvent('kfo_misc:handleInventory')
AddEventHandler('kfo_misc:handleInventory', function()
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
    usedCompass = false
end)