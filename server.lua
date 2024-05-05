RegisterServerEvent("emergencydispatch:alarmierung:wache")
AddEventHandler("emergencydispatch:alarmierung:wache", function(wache)
	Wait(1000)
    local vehicles = exports['emergencydispatch']:mannedvehicles()

    for k, v in ipairs(vehicles) do
        if v.status == 2 and v.leitstelle == 'C' then
            if Config.Vehicles[v.value] and Config.Vehicles[v.value].Wache == wache then
                local tor = Config.Vehicles[v.value].Tor
                Citizen.CreateThread(function() OpenDoor(Config.Doors[wache][tor]) end)
            end
        end
    end
end)

if GetResourceState('doors_creator') == 'started' then
    print('Doorscreator erkannt')
    OpenDoor = function(door)
        exports["doors_creator"]:setDoorState(door, 0)
        Wait(2*60*1000)
        exports["doors_creator"]:setDoorState(door, 1)
    end
elseif GetResourceState('ox_doorlock') == 'started' then
    print('ox_doorlock erkannt')
    OpenDoor = function(door)
        TriggerEvent('ox_doorlock:setState', door, 0)
        Wait(2*60*1000)
        TriggerEvent('ox_doorlock:setState', door, 1)
    end
else
    print('Keine Ressource gefunden')
    OpenDoor = function(door)
        print('Keine Ressource gefunden')
    end
end

RegisterNetEvent('emd_openStation', function(station)
    for door, doorId in pairs(Config.Doors[station]) do
        exports["doors_creator"]:setDoorState(doorId, 0)
    end
end)
RegisterNetEvent('emd_closeStation', function(station)
    for door, doorId in pairs(Config.Doors[station]) do
        exports["doors_creator"]:setDoorState(doorId, 1)
    end
end)
RegisterNetEvent('emd_openDoor', function(doorId)
    exports["doors_creator"]:setDoorState(doorId, 0)
end)