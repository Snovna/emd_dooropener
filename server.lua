RegisterServerEvent("emergencydispatch:alarmierung:wache")
AddEventHandler("emergencydispatch:alarmierung:wache", function(wache)
    local vehicles = exports['emergencydispatch']:mannedvehicles()

    for k, v in pairs(vehicles) do
        if v.status == 2 and v.leitstelle == 'C' then
            if Config.Vehicles[v.value] and Config.Vehicles[v.value].Wache == wache then
                local tor = Config.Vehicles[v.value].Tor
                OpenDoor(Config.Doors[wache][tor])
            end
        end
    end
end)

if GetResourceState('doors_creator') == 'started' then
    print('Doorscreator erkannt')
    OpenDoor = function(door)
        print('Ich möchte öffnen: '..door)
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