local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.GRASS = 0
v2[0] = "GRASS"
v3.STONE = 1
v2[1] = "STONE"
v3.WOOD = 2
v2[2] = "WOOD"
v3.SAND = 3
v2[3] = "SAND"
v3.VOID = 4
v2[4] = "VOID"
v3.WOOL = 5
v2[5] = "WOOL"
v3.SNOW = 6
v2[6] = "SNOW"
v3.ICE = 7
v2[7] = "ICE"
v3.GUM = 8
v2[8] = "GUM"
local v4 = {
    [v3.GRASS] = {
        ["volume"] = 0.18,
        ["walk"] = {
            v1.BLOCK_GRASS_FOOTSTEP_1,
            v1.BLOCK_GRASS_FOOTSTEP_2,
            v1.BLOCK_GRASS_FOOTSTEP_3,
            v1.BLOCK_GRASS_FOOTSTEP_4
        },
        ["run"] = {
            v1.BLOCK_GRASS_FOOTSTEP_1,
            v1.BLOCK_GRASS_FOOTSTEP_2,
            v1.BLOCK_GRASS_FOOTSTEP_3,
            v1.BLOCK_GRASS_FOOTSTEP_4
        }
    },
    [v3.STONE] = {
        ["volume"] = 0.12,
        ["walk"] = {
            v1.BLOCK_STONE_FOOTSTEP_1,
            v1.BLOCK_STONE_FOOTSTEP_2,
            v1.BLOCK_STONE_FOOTSTEP_3,
            v1.BLOCK_STONE_FOOTSTEP_4
        },
        ["run"] = {
            v1.BLOCK_STONE_FOOTSTEP_1,
            v1.BLOCK_STONE_FOOTSTEP_2,
            v1.BLOCK_STONE_FOOTSTEP_3,
            v1.BLOCK_STONE_FOOTSTEP_4
        }
    },
    [v3.WOOD] = {
        ["walk"] = {
            v1.BLOCK_WOOD_FOOTSTEP_1,
            v1.BLOCK_WOOD_FOOTSTEP_2,
            v1.BLOCK_WOOD_FOOTSTEP_3,
            v1.BLOCK_WOOD_FOOTSTEP_4
        },
        ["run"] = {
            v1.BLOCK_WOOD_FOOTSTEP_1,
            v1.BLOCK_WOOD_FOOTSTEP_2,
            v1.BLOCK_WOOD_FOOTSTEP_3,
            v1.BLOCK_WOOD_FOOTSTEP_4
        }
    },
    [v3.SAND] = {
        ["walk"] = {
            "rbxassetid://6342794392",
            "rbxassetid://6342794345",
            "rbxassetid://6345664026",
            "rbxassetid://6345663913"
        },
        ["run"] = {
            "rbxassetid://6342794392",
            "rbxassetid://6342794345",
            "rbxassetid://6345664026",
            "rbxassetid://6345663913"
        }
    },
    [v3.VOID] = {
        ["volume"] = 0.06,
        ["walk"] = {
            "rbxassetid://9867707447",
            "rbxassetid://9867707580",
            "rbxassetid://9867707252",
            "rbxassetid://9867707660"
        },
        ["run"] = {
            "rbxassetid://9867707447",
            "rbxassetid://9867707580",
            "rbxassetid://9867707252",
            "rbxassetid://9867707660"
        }
    },
    [v3.WOOL] = {
        ["volume"] = 0.26,
        ["walk"] = {
            v1.BLOCK_WOOL_FOOTSTEP_1,
            v1.BLOCK_WOOL_FOOTSTEP_2,
            v1.BLOCK_WOOL_FOOTSTEP_3,
            v1.BLOCK_WOOL_FOOTSTEP_4
        },
        ["run"] = {
            v1.BLOCK_WOOL_FOOTSTEP_1,
            v1.BLOCK_WOOL_FOOTSTEP_2,
            v1.BLOCK_WOOL_FOOTSTEP_3,
            v1.BLOCK_WOOL_FOOTSTEP_4
        }
    },
    [v3.ICE] = {
        ["volume"] = 0.26,
        ["walk"] = {
            v1.ICE_FOOTSTEP_1,
            v1.ICE_FOOTSTEP_2,
            v1.ICE_FOOTSTEP_3,
            v1.ICE_FOOTSTEP_4
        },
        ["run"] = {
            v1.ICE_FOOTSTEP_1,
            v1.ICE_FOOTSTEP_2,
            v1.ICE_FOOTSTEP_3,
            v1.ICE_FOOTSTEP_4
        }
    },
    [v3.SNOW] = {
        ["volume"] = 0.26,
        ["walk"] = {
            v1.SNOW_FOOTSTEP_1,
            v1.SNOW_FOOTSTEP_2,
            v1.SNOW_FOOTSTEP_3,
            v1.SNOW_FOOTSTEP_4
        },
        ["run"] = {
            v1.SNOW_FOOTSTEP_1,
            v1.SNOW_FOOTSTEP_2,
            v1.SNOW_FOOTSTEP_3,
            v1.SNOW_FOOTSTEP_4
        }
    },
    [v3.GUM] = {
        ["volume"] = 0.26,
        ["walk"] = {
            v1.GUM_FOOTSTEP_1,
            v1.GUM_FOOTSTEP_2,
            v1.GUM_FOOTSTEP_3,
            v1.GUM_FOOTSTEP_4
        },
        ["run"] = {
            v1.GUM_FOOTSTEP_1,
            v1.GUM_FOOTSTEP_2,
            v1.GUM_FOOTSTEP_3,
            v1.GUM_FOOTSTEP_4
        }
    }
}
return {
    ["BlockFootstepSound"] = v3,
    ["FootstepSounds"] = v4,
    ["DefaultFootstepSound"] = v3.STONE,
    ["TerrainFootstepSounds"] = {
        [Enum.Material.Grass] = v3.GRASS,
        [Enum.Material.LeafyGrass] = v3.GRASS,
        [Enum.Material.Mud] = v3.GRASS,
        [Enum.Material.Ground] = v3.GRASS,
        [Enum.Material.Cobblestone] = v3.STONE,
        [Enum.Material.CrackedLava] = v3.STONE,
        [Enum.Material.Asphalt] = v3.STONE,
        [Enum.Material.Rock] = v3.STONE,
        [Enum.Material.Sand] = v3.SAND,
        [Enum.Material.Snow] = v3.SNOW,
        [Enum.Material.Ice] = v3.ICE,
        [Enum.Material.Glacier] = v3.ICE
    }
}