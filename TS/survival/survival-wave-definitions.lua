local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {}
local v3 = {
    ["totalPenguins"] = 13,
    ["rewards"] = {
        {
            ["amount"] = 10,
            ["itemType"] = v1.IRON
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 2
    }
}
v2[1] = v3
local v4 = {
    ["totalPenguins"] = 13,
    ["announcement"] = "Tall penguins are now spawning!",
    ["rewards"] = {
        {
            ["amount"] = 20,
            ["itemType"] = v1.IRON
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 2
    }
}
v2[2] = v4
local v5 = {
    ["totalPenguins"] = 13,
    ["announcement"] = "A pirate ship approaching!",
    ["rewards"] = {
        {
            ["amount"] = 25,
            ["itemType"] = v1.IRON
        },
        {
            ["amount"] = 1,
            ["itemType"] = v1.EMERALD
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 3
    }
}
v2[3] = v5
local v6 = {
    ["totalPenguins"] = 17,
    ["announcement"] = "Bomber penguins are now spawning!",
    ["rewards"] = {
        {
            ["amount"] = 30,
            ["itemType"] = v1.IRON
        },
        {
            ["amount"] = 1,
            ["itemType"] = v1.EMERALD
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 3
    }
}
v2[4] = v6
local v7 = {
    ["totalPenguins"] = 21,
    ["announcement"] = "The next wave is gonna be a big one",
    ["rewards"] = {
        {
            ["amount"] = 35,
            ["itemType"] = v1.IRON
        },
        {
            ["amount"] = 2,
            ["itemType"] = v1.EMERALD
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 4
    }
}
v2[5] = v7
local v8 = {
    ["totalPenguins"] = 20,
    ["announcement"] = "Sniper penguins are now spawning!",
    ["rewards"] = {
        {
            ["amount"] = 40,
            ["itemType"] = v1.IRON
        },
        {
            ["amount"] = 3,
            ["itemType"] = v1.EMERALD
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 5
    }
}
v2[6] = v8
local v9 = {
    ["totalPenguins"] = 26,
    ["announcement"] = "Big penguins are now spawning!",
    ["rewards"] = {
        {
            ["amount"] = 40,
            ["itemType"] = v1.IRON
        },
        {
            ["amount"] = 4,
            ["itemType"] = v1.EMERALD
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 6
    }
}
v2[7] = v9
local v10 = {
    ["totalPenguins"] = 26,
    ["announcement"] = "Wizard penguins are now spawning!",
    ["rewards"] = {
        {
            ["amount"] = 45,
            ["itemType"] = v1.IRON
        },
        {
            ["amount"] = 5,
            ["itemType"] = v1.EMERALD
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 7
    }
}
v2[8] = v10
local v11 = {
    ["totalPenguins"] = 23,
    ["announcement"] = "The king penguin is coming...",
    ["rewards"] = {
        {
            ["amount"] = 50,
            ["itemType"] = v1.IRON
        },
        {
            ["amount"] = 6,
            ["itemType"] = v1.EMERALD
        }
    },
    ["spawnRules"] = {
        ["spawnLocationCount"] = 8
    }
}
v2[9] = v11
v2[10] = {
    ["totalPenguins"] = 30,
    ["announcement"] = "THE KING PENGUIN IS HERE!",
    ["rewards"] = {},
    ["spawnRules"] = {
        ["spawnLocationCount"] = 8
    }
}
return {
    ["SurvivalWaveDefinitions"] = v2
}