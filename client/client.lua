-- 1. Disable those achievments from online rdr2 from appearing when you join the game
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 	
 		local size = GetNumberOfEvents(0)
        if size > 0 then
            for i = 0, size - 1 do
                local eventAtIndex = GetEventAtIndex(0, i)
                if eventAtIndex == GetHashKey("EVENT_CHALLENGE_GOAL_COMPLETE") 
                 or eventAtIndex == GetHashKey("EVENT_CHALLENGE_REWARD") 
                 or eventAtIndex == GetHashKey("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then
                    Citizen.InvokeNative(0x6035E8FBCA32AC5E)
                end
            end
        end
    end
end)
------------------------------------------------------------------------------------------

-- 2. Put horse Holster
function NativeFixMeshIssues(ped, categoryHash)
    Citizen.InvokeNative(0x59BD177A1A48600A, ped, categoryHash)
end

function NativeUpdatePedVariation(ped)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false)
end

function NativeSetPedComponentEnabled(ped, componentHash, immediately, isMp, cat)
    if cat then
        NativeFixMeshIssues(ped, cat)
    end
    
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, componentHash, immediately, isMp, true)--ApplyShopItemToPed
    
    NativeUpdatePedVariation(ped)
    return
end

NativeSetPedComponentEnabled(horsePed, 0xF772CED6, true, true, 0xAC106B30)--apply holster on horse
------------------------------------------------------------------------------------------

-- 3. Disable Headshots
AddEventHandler('playerSpawned', function()
    Citizen.CreateThread(function()
        Citizen.InvokeNative(0xFAEE099C6F890BB8, PlayerPedId(), 128, 0) -- SET_ENTITY_PROOFS
    end)
end)
------------------------------------------------------------------------------------------

-- 4. Minimap type
-- 3 = Compass 0 = Off
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('kfo_misc:checkCompass')
        Citizen.Wait(500)
    end
end)
------------------------------------------------------------------------------------------

RegisterNetEvent('kfo_misc:setMinimap')
AddEventHandler('kfo_misc:setMinimap', function(minimapType)
    SetMinimapType(minimapType)
end)