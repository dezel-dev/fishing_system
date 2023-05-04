---@author Dezel

Config = {}

Config.Fish = {
    ["anchovy"] = {
        name = "anchovy",
        label = "Anchois",
        price = {
            min = 5,
            max = 8
        }
    },
    ["cod"] = {
        name = "cod",
        label = "Cabillaud",
        price = {
            min = 15,
            max = 25
        }
    },
    ["salmon"] = {
        name = "salmon",
        label = "Saumon",
        price = {
            min = 40,
            max = 65
        }
    },
    ["ray"] = {
        name = "ray",
        label = "Raie",
        price = {
            min = 70,
            max = 85
        }
    },
    ["shark"] = {
        name = "shark",
        label = "Requin",
        price = {
            min = 220,
            max = 300
        }
    }
}
Config.FishZones = {
    {
        position = vector3(-1882.694, -1266.831, 16.67615),
        showBlip = true,
        minDst = 40.0,
    }
}
Config.FishRandoms = {
    {
        name = "anchovy",
        chance = {
            without_hook = 50,
            basic = 20,
            upgraded = 5
        }
    },
    {
        name = "cod",
        chance = {
            without_hook = 40,
            basic = 35,
            upgraded = 25
        }
    },
    {
        name = "salmon",
        chance = {
            without_hook = 10,
            basic = 35,
            upgraded = 30
        }
    },
    {
        name = "ray",
        chance = {
            without_hook = 0,
            basic = 10,
            upgraded = 30
        }
    },
    {
        name = "shark",
        chance = {
            without_hook = 0,
            basic = 0,
            upgraded = 10
        }
    },
}

---DONT TOUCH
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)