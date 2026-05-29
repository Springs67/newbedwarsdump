local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u2 = {}
local v3 = v1.HALLOWEEN_GRAVEYARD
local v4 = {
    ["loadingScreen"] = {
        ["Title"] = "GRAVEYARD",
        ["BackgroundImage"] = "rbxassetid://11340018523",
        ["Description"] = "Beware of the grave keeper. Dig up the correct grave or die.",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Don\'t get too close to the keeper.", "Be on the look out for clues." }
    }
}
u2[v3] = v4
local v5 = v1.HALLOWEEN_GRAVEYARD_2023
local v6 = {
    ["loadingScreen"] = {
        ["Title"] = "GRAVEYARD",
        ["BackgroundImage"] = "rbxassetid://11340018523",
        ["Description"] = "Find candles and satisfy the Skull Altar.",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Keep a vigilant eye for the altar candles.", "Let the colored flames guide your path." }
    }
}
u2[v5] = v6
local v7 = v1.HALLOWEEN_OBBY
local v8 = {
    ["loadingScreen"] = {
        ["Title"] = "CRYPT ESCAPE",
        ["BackgroundImage"] = "rbxassetid://11349658767",
        ["Description"] = "RUN!",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Be hasty. The fog will catch up to you", "Look for ghosts on the bridge" }
    }
}
u2[v7] = v8
local v9 = v1.HALLOWEEN_MAZE
local v10 = {
    ["loadingScreen"] = {
        ["Title"] = "MAZE",
        ["BackgroundImage"] = "rbxassetid://11350360572",
        ["Description"] = "Follow the light!",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Follow the light", "Shine your teammates to the end" }
    }
}
u2[v9] = v10
local v11 = v1.HALLOWEEN_BOSS
local v12 = {
    ["loadingScreen"] = {
        ["Title"] = "FINAL TRIAL",
        ["BackgroundImage"] = "rbxassetid://11363008804",
        ["Description"] = "???",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Spot large clues spawned in the air", "Look for ghosts on the stone platforms", "Spot the clue when cursed by Eldric" }
    }
}
u2[v11] = v12
local v13 = v1.SKELETON_BOSS
local v14 = {
    ["loadingScreen"] = {
        ["Title"] = "FINAL TRIAL",
        ["BackgroundImage"] = "rbxassetid://11363008804",
        ["Description"] = "???",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = {}
    }
}
u2[v13] = v14
local v15 = v1.HALLOWEEN_2024_STAGE_1
local v16 = {
    ["loadingScreen"] = {
        ["Title"] = "The Dark Forest",
        ["BackgroundImage"] = "rbxassetid://80204639527004",
        ["Description"] = "Find crystals and avoid the guards to open the gate.",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "There\'s no benefit to killing the guards, and they\'re extremely dangerous. Try to just avoid them!" }
    }
}
u2[v15] = v16
local v17 = v1.HALLOWEEN_2024_STAGE_2
local v18 = {
    ["loadingScreen"] = {
        ["Title"] = "The Crystal CAVERN",
        ["BackgroundImage"] = "rbxassetid://104890347764235",
        ["Description"] = "Gather crystals to open the gate to the Queen\'s LAIR",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Keep an eye on the above.", "Sharp Stalactite hang from above... Perhaps a well-aimed shot could dislodge them?", "When the ground falls away, sometimes you must build your own way across." }
    }
}
u2[v17] = v18
local v19 = v1.HALLOWEEN_2024_STAGE_3
local v20 = {
    ["loadingScreen"] = {
        ["Title"] = "Queen\'s Lair",
        ["BackgroundImage"] = "rbxassetid://80277335823549",
        ["Description"] = "Glowing crystals fuel a dark power",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Beware of dust on the ground", "Spiders live in webs" }
    }
}
u2[v19] = v20
local v21 = v1.HALLOWEEN_2025_STAGE_2
local v22 = {
    ["loadingScreen"] = {
        ["Title"] = "The Crystal CAVERN",
        ["BackgroundImage"] = "rbxassetid://104890347764235",
        ["Description"] = "Gather crystals to open the gate to the Queen\'s LAIR",
        ["TitleColor"] = Color3.fromHex("89ffd4")
    },
    ["deathScreen"] = {
        ["deathMessages"] = { "Keep an eye on the above.", "Sharp Stalactite hang from above... Perhaps a well-aimed shot could dislodge them?", "When the ground falls away, sometimes you must build your own way across." }
    }
}
u2[v21] = v22
return {
    ["SceneMeta"] = u2,
    ["getSceneMeta"] = function(p23) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2[p23]
    end
}