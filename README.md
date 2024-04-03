# EMD_Dooropener

Öffnet automatisch Türen bei einem Alarm über [Emergency Dispatch](https://shop.loverp-scripts.de/package/4887641)

## Config

```lua
Config.Doors = {
    ['<Vollständiger Name der Wache>'] = {
        ['<T1-TX>'] = <Tür-ID von doorscreator/ox_doorlock>,
        ...
    },
    ['<Vollständiger Name der zweiten Wache>'] = {
        ...
    },
}

Config.Vehicles = {
    ['<Funkrufname (kurz)>'] = { Wache = '<Wachenname s. oben>', Tor = '<T1-TX>' },

    -- Ein Fahrzeug springt öfter zwischen 2 Wachen
    ['Fahrzeug A'] = { Wache = 'Wache 1', Tor = 'T5' }, -- Wenn auf Wache 1 stationiert Tor 5
    ['Fahrzeug A'] = { Wache = 'Wache 2', Tor = 'T2' }, -- Wenn auf Wache 2 stationiert Tor 2
    
     -- zwei Fahrzeuge teilen sich einen Platz
    ['Fahrzeug B'] = { Wache = 'Wache 1', Tor = 'T1' },
    ['Fahrzeug c'] = { Wache = 'Wache 1', Tor = 'T1' },
}
```
