local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weighted-select").WeightedSelect
local v4 = v3.new
local v5 = {}
local v6 = {
    ["id"] = "special_fish_1",
    ["weight"] = 1,
    ["fishModel"] = "fish_gold",
    ["fishSizeMultiplier"] = 2.5,
    ["drops"] = {
        {
            ["amount"] = 10,
            ["itemType"] = v2.EMERALD
        },
        {
            ["amount"] = 14,
            ["itemType"] = v2.DIAMOND
        },
        {
            ["amount"] = 100,
            ["itemType"] = v2.IRON
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 8
    }
}
local v7 = {
    ["id"] = "special_fish_2",
    ["weight"] = 0.2,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 4,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.CHARGE_SHIELD
        }
    }
}
local v8 = {
    ["id"] = "special_fish_3",
    ["weight"] = 0.2,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 4,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.ROCKET_LAUNCHER
        },
        {
            ["amount"] = 10,
            ["itemType"] = v2.ROCKET_LAUNCHER_MISSILE
        }
    }
}
local v9 = {
    ["id"] = "special_fish_4",
    ["weight"] = 3,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.TNT
        }
    }
}
local v10 = {
    ["id"] = "special_fish_5",
    ["weight"] = 5,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.FIREBALL
        }
    }
}
local v11 = {
    ["id"] = "special_fish_6",
    ["weight"] = 1,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 3,
            ["itemType"] = v2.OBSIDIAN
        }
    }
}
local v12 = {
    ["id"] = "special_fish_7",
    ["weight"] = 2,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 2,
            ["itemType"] = v2.FISHERMAN_CORAL
        }
    }
}
local v13 = {
    ["id"] = "special_fish_8",
    ["weight"] = 4,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 12,
            ["itemType"] = v2.BLASTPROOF_CERAMIC
        }
    }
}
local v14 = {
    ["id"] = "special_fish_9",
    ["weight"] = 1,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.GLUE_PROJECTILE
        }
    }
}
local v15 = {
    ["id"] = "emerald_fish_1",
    ["weight"] = 1.5,
    ["fishModel"] = "fish_emerald",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 4,
            ["itemType"] = v2.EMERALD
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 5
    }
}
local v16 = {
    ["id"] = "emerald_fish_2",
    ["weight"] = 5,
    ["fishModel"] = "fish_emerald",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 2,
            ["itemType"] = v2.EMERALD
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 5
    }
}
local v17 = {
    ["id"] = "emerald_fish_3",
    ["weight"] = 7,
    ["fishModel"] = "fish_emerald",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.EMERALD
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 5
    }
}
local v18 = {
    ["id"] = "diamond_fish_1",
    ["weight"] = 3,
    ["fishModel"] = "fish_diamond",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 4,
            ["itemType"] = v2.DIAMOND
        }
    }
}
local v19 = {
    ["id"] = "diamond_fish_2",
    ["weight"] = 5,
    ["fishModel"] = "fish_diamond",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 3,
            ["itemType"] = v2.DIAMOND
        }
    }
}
local v20 = {
    ["id"] = "diamond_fish_3",
    ["weight"] = 10,
    ["fishModel"] = "fish_diamond",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 2,
            ["itemType"] = v2.DIAMOND
        }
    }
}
local v21 = {
    ["id"] = "iron_fish_1",
    ["weight"] = 10,
    ["fishModel"] = "fish_iron",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 45,
            ["itemType"] = v2.IRON
        }
    }
}
__set_list(v5, 1, {v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21})
local v22 = {
    ["id"] = "iron_fish_2",
    ["weight"] = 20,
    ["fishModel"] = "fish_iron",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 30,
            ["itemType"] = v2.IRON
        }
    }
}
local v23 = {
    ["id"] = "iron_fish_3",
    ["weight"] = 30,
    ["fishModel"] = "fish_iron",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 15,
            ["itemType"] = v2.IRON
        }
    }
}
__set_list(v5, 17, {v22, v23})
local v24 = v4(v5)
local v25 = v3.new
local v26 = {}
local v27 = {
    ["id"] = "special_fish_1",
    ["weight"] = 1,
    ["fishModel"] = "fish_gold",
    ["fishSizeMultiplier"] = 4,
    ["drops"] = {
        {
            ["amount"] = 10,
            ["itemType"] = v2.EMERALD
        },
        {
            ["amount"] = 14,
            ["itemType"] = v2.DIAMOND
        },
        {
            ["amount"] = 100,
            ["itemType"] = v2.IRON
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 8
    }
}
local v28 = {
    ["id"] = "special_fish_2",
    ["weight"] = 0.2,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 4,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.CHARGE_SHIELD
        }
    }
}
local v29 = {
    ["id"] = "special_fish_3",
    ["weight"] = 0.2,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 4,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.ROCKET_LAUNCHER
        },
        {
            ["amount"] = 10,
            ["itemType"] = v2.ROCKET_LAUNCHER_MISSILE
        }
    }
}
local v30 = {
    ["id"] = "special_fish_4",
    ["weight"] = 3.5,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 2,
            ["itemType"] = v2.TNT
        }
    }
}
local v31 = {
    ["id"] = "special_fish_5",
    ["weight"] = 2,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.SIEGE_TNT
        }
    }
}
local v32 = {
    ["id"] = "special_fish_6",
    ["weight"] = 5,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.FIREBALL
        }
    }
}
local v33 = {
    ["id"] = "special_fish_7",
    ["weight"] = 1,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 4,
            ["itemType"] = v2.OBSIDIAN
        }
    }
}
local v34 = {
    ["id"] = "special_fish_8",
    ["weight"] = 2,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 3,
            ["itemType"] = v2.FISHERMAN_CORAL
        }
    }
}
local v35 = {
    ["id"] = "special_fish_9",
    ["weight"] = 4,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 12,
            ["itemType"] = v2.BLASTPROOF_CERAMIC
        }
    }
}
local v36 = {
    ["id"] = "special_fish_10",
    ["weight"] = 1,
    ["fishModel"] = "fish_special",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v2.GLUE_PROJECTILE
        }
    }
}
local v37 = {
    ["id"] = "emerald_fish_1",
    ["weight"] = 3,
    ["fishModel"] = "fish_emerald",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 5,
            ["itemType"] = v2.EMERALD
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 5
    }
}
local v38 = {
    ["id"] = "emerald_fish_2",
    ["weight"] = 5,
    ["fishModel"] = "fish_emerald",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 3,
            ["itemType"] = v2.EMERALD
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 5
    }
}
local v39 = {
    ["id"] = "emerald_fish_3",
    ["weight"] = 7,
    ["fishModel"] = "fish_emerald",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 2,
            ["itemType"] = v2.EMERALD
        }
    },
    ["weightScaling"] = {
        ["lowScaleMultiplier"] = 0.5,
        ["highScaleMultiplier"] = 1,
        ["amountOfFishToScaleToMax"] = 5
    }
}
local v40 = {
    ["id"] = "diamond_fish_1",
    ["weight"] = 3,
    ["fishModel"] = "fish_diamond",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 6,
            ["itemType"] = v2.DIAMOND
        }
    }
}
local v41 = {
    ["id"] = "diamond_fish_2",
    ["weight"] = 5,
    ["fishModel"] = "fish_diamond",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 4,
            ["itemType"] = v2.DIAMOND
        }
    }
}
local v42 = {
    ["id"] = "diamond_fish_3",
    ["weight"] = 10,
    ["fishModel"] = "fish_diamond",
    ["fishSizeMultiplier"] = 1,
    ["drops"] = {
        {
            ["amount"] = 3,
            ["itemType"] = v2.DIAMOND
        }
    }
}
__set_list(v26, 1, {v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42})
local v43 = {
    ["id"] = "iron_fish_1",
    ["weight"] = 5,
    ["fishModel"] = "fish_iron",
    ["fishSizeMultiplier"] = 2,
    ["drops"] = {
        {
            ["amount"] = 75,
            ["itemType"] = v2.IRON
        }
    }
}
local v44 = {
    ["id"] = "iron_fish_2",
    ["weight"] = 10,
    ["fishModel"] = "fish_iron",
    ["fishSizeMultiplier"] = 1.5,
    ["drops"] = {
        {
            ["amount"] = 50,
            ["itemType"] = v2.IRON
        }
    }
}
__set_list(v26, 17, {v43, v44})
return {
    ["FishermanDropsEarlyGame"] = v24,
    ["FishermanDropsLateGame"] = v25(v26)
}