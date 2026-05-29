local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type")
local v5 = v4.ArmorTrimPackType
local v6 = v4.ArmorTrimType
local v7 = {
    [v6.TRIM_1] = {
        ["name"] = "Test",
        ["packType"] = v5.BEGINNER
    }
}
local v8 = v6.TRIM_2
local v9 = {
    ["name"] = "Retro",
    ["packType"] = v5.BEGINNER
}
local v10 = {
    ["definition"] = {
        ["condition"] = "Select",
        ["effectType"] = { v2.DEFAULT, v2.ANNIVERSARY },
        ["default"] = v2.DEFAULT
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v9.effects = v10
v7[v8] = v9
v7[v6.TRIM_3] = {
    ["name"] = "Overgrown",
    ["packType"] = v5.BEGINNER
}
local v11 = v6.TRIM_4
local v12 = {
    ["name"] = "Butterfly",
    ["packType"] = v5.BEGINNER
}
local v13 = {
    ["definition"] = {
        ["condition"] = "Select",
        ["effectType"] = { v2.DEFAULT, v2.ANNIVERSARY },
        ["default"] = v2.DEFAULT
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v12.effects = v13
v7[v11] = v12
local v14 = v6.TRIM_5
local v15 = {
    ["name"] = "Fire",
    ["packType"] = v5.ELEMENTAL
}
local v16 = {
    ["definition"] = {
        ["condition"] = "Select",
        ["effectType"] = {
            v2.FIRE_WARM,
            v2.FIRE_COOL,
            v2.FIRE_BLACK,
            v2.FIRE_PURPLE,
            v2.FIRE_RED
        },
        ["default"] = v2.FIRE_WARM
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v15.effects = v16
v7[v14] = v15
local v17 = v6.TRIM_6
local v18 = {
    ["name"] = "Frosty",
    ["packType"] = v5.ELEMENTAL
}
local v19 = {
    ["definition"] = {
        ["condition"] = "None",
        ["effectType"] = v2.FROSTY
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v18.effects = v19
v7[v17] = v18
local v20 = v6.TRIM_7
local v21 = {
    ["name"] = "Void",
    ["packType"] = v5.SPIRIT_VS_VOID
}
local v22 = {
    ["definition"] = {
        ["condition"] = "Select",
        ["effectType"] = { v2.VOID, v2.ANNIVERSARY },
        ["default"] = v2.VOID
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v21.effects = v22
v7[v20] = v21
local v23 = v6.TRIM_8
local v24 = {
    ["name"] = "Spirit",
    ["packType"] = v5.SPIRIT_VS_VOID
}
local v25 = {
    ["definition"] = {
        ["condition"] = "Select",
        ["effectType"] = { v2.SPIRIT, v2.ANNIVERSARY },
        ["default"] = v2.SPIRIT
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v24.effects = v25
v7[v23] = v24
local v26 = v6.TRIM_9
local v27 = {
    ["name"] = "Bat",
    ["packType"] = v5.HALLOWEEN
}
local v28 = {
    ["definition"] = {
        ["condition"] = "None",
        ["effectType"] = v2.BAT
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v27.effects = v28
v7[v26] = v27
local v29 = v6.TRIM_10
local v30 = {
    ["name"] = "Claws",
    ["packType"] = v5.HALLOWEEN
}
local v31 = {
    ["definition"] = {
        ["condition"] = "None",
        ["effectType"] = v2.BAT
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v30.effects = v31
v7[v29] = v30
local v32 = v6.TRIM_11
local v33 = {
    ["name"] = "Crystal",
    ["packType"] = v5.HALLOWEEN
}
local v34 = {
    ["definition"] = {
        ["condition"] = "None",
        ["effectType"] = v2.BAT
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v33.effects = v34
v7[v32] = v33
local v35 = v6.TRIM_12
local v36 = {
    ["name"] = "Phoenix",
    ["packType"] = v5.ELEMENTAL
}
local v37 = {
    ["definition"] = {
        ["condition"] = "None",
        ["effectType"] = v2.PHOENIX
    },
    ["tierOverrides"] = { v3.T5, v3.T6, v3.T7 }
}
v36.effects = v37
v7[v35] = v36
return {
    ["ArmorTrimMeta"] = v7,
    ["ArmorTrimPackTypeMeta"] = {
        [v5.ALL_RANDOM] = {
            ["displayName"] = "Random",
            ["productId"] = 38
        },
        [v5.BEGINNER] = {
            ["displayName"] = "Beginner",
            ["productId"] = 67
        },
        [v5.ELEMENTAL] = {
            ["displayName"] = "Elemental",
            ["productId"] = 68
        },
        [v5.SPIRIT_VS_VOID] = {
            ["displayName"] = "Spirit Vs. Void",
            ["productId"] = 69
        },
        [v5.HALLOWEEN] = {
            ["displayName"] = "Halloween",
            ["productId"] = 70
        }
    }
}