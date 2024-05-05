Config = {}

Config.Doors = {
    ['Feuer- und Rettungswache 1'] = {
        ['T1'] = 36,
        ['T2'] = 37,
        ['T3'] = 38,
        ['T4'] = 39,
        ['T5'] = 40,
        ['T6'] = 41,
        ['T7'] = 42,
        ['T8'] = 43,
    },
    ['Rettungswache Klinikum'] = {
        ['T1'] = 70,
        ['T2'] = 71,
    },
    ['Feuer- und Rettungswache 2'] = {
        ['T1'] = 121,
        ['T2'] = 122,
        ['T3'] = 123,
        ['T4'] = 124,
        ['T5'] = 125,
        ['T6'] = 126,
        ['T7'] = 127,
        ['T8'] = 128,
    },
}
Config.Vehicles = {
    ['KdoW 1'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T1' },
    ['KdoW 2'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T1' },
    ['1 ELW 1'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T1' },
    ['1 RTW 1'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T2' },
    ['1 RTW 2'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T3' },
    ['1 RTW 3'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T4' },
    ['1 Engine 1'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T5' },
    ['1 Engine 2'] = { Wache = 'Feuer- und Rettungswache 1', Tor = 'T6' },
	
    ['4 NEF 1'] = { Wache = 'Rettungswache Klinikum', Tor = 'T1' },
    ['4 NEF 2'] = { Wache = 'Rettungswache Klinikum', Tor = 'T2' },
	
    ['2 Engine 1'] = { Wache = 'Feuer- und Rettungswache 2', Tor = 'T2' },
    ['2 FR 1'] = { Wache = 'Feuer- und Rettungswache 2', Tor = 'T3' },
    ['2 Brush 1'] = { Wache = 'Feuer- und Rettungswache 2', Tor = 'T4' },
    ['2 RTW 1'] = { Wache = 'Feuer- und Rettungswache 2', Tor = 'T6' },
}

Config.ControlPanels = {
	['Feuer- und Rettungswache 1'] = {
		coords = vector3(-1044.552,-1396.038,11.091),
		jobs = {'ambulance'},
	},
	['Feuer- und Rettungswache 2'] = {
		coords = vector3(2524.176,4222.347,40.287),
		jobs = {'ambulance'},
	},
}