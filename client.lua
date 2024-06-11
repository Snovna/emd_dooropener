local playerJob = nil

RegisterNetEvent('esx:setJob', function(job, lastJob)
    playerJob = job.name
end)
AddEventHandler('esx:playerLoaded', function()
    while ESX.GetPlayerData().job == nil do
		Wait(100)
	end
    playerJob = ESX.GetPlayerData().job.name
end)
AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    while ESX.GetPlayerData().job == nil do
		Wait(100)
	end
    playerJob = ESX.GetPlayerData().job.name
end)

local vehiclesTable = {}
for k,v in pairs(Config.Doors) do
    vehiclesTable[k] = {}
    for i in pairs(v) do
        vehiclesTable[k][i] = {}
    end
end
for k,v in pairs(Config.Vehicles) do
    table.insert(vehiclesTable[v.Wache][v.Tor],k)
    table.sort(vehiclesTable[v.Wache][v.Tor])
end

for k,v in pairs(Config.ControlPanels) do
    local doorOptions = {
        {
            title = 'Alle Tore öffnen',
            description = k,
            icon = 'door-open',
            onSelect = function()
                TriggerServerEvent('emd_openStation', k)
            end,
        },
    }

    local doorKeys = {}
    for door in pairs(Config.Doors[k]) do table.insert(doorKeys, door) end
    table.sort(doorKeys)
    for _, d in ipairs(doorKeys) do
        table.insert(doorOptions, {
            title = d..' öffnen',
            description = table.concat(vehiclesTable[k][d],', '),
            icon = 'door-open',
            onSelect = function()
                TriggerServerEvent('emd_openDoor', Config.Doors[k][d])
            end,
        })
    end

    table.insert(doorOptions, {
        title = 'Alle Tore schließen',
        description = k,
        icon = 'door-closed',
        onSelect = function()
            TriggerServerEvent('emd_closeStation', k)
        end,
    })

    lib.registerContext({
        id = 'doorpanel_'..k,
        title = 'Türsteuerung',
        options = doorOptions,
    })

    exports.ox_target:addSphereZone({
        coords = v.coords,
        radius = 1,
        options = {
            {
                name = 'emd_dooropener:openPanel',
                icon = 'fa-solid fa-warehouse',
                label = 'Torsteuerung',
                onSelect = function()
                    lib.showContext('doorpanel_'..k)
                end,
                canInteract = function()
                    return lib.table.contains(v.jobs, playerJob)
                end,
            },
        }
    })
end
