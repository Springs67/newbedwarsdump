local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = {}
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.COMMON = 100
v5[100] = "COMMON"
v6.UNCOMMON = 60
v5[60] = "UNCOMMON"
v6.RARE = 25
v5[25] = "RARE"
v6.EPIC = 10
v5[10] = "EPIC"
v6.LEGENDARY = 3
v5[3] = "LEGENDARY"
v4.BattleRoyalLootRarity = v6
v4.RarityEffectColors = {
    [v6.COMMON] = Color3.new(1, 1, 1),
    [v6.UNCOMMON] = Color3.new(0.25, 0.94, 0.22),
    [v6.RARE] = Color3.fromRGB(40, 101, 234),
    [v6.EPIC] = Color3.new(0.87, 0.24, 0.85),
    [v6.LEGENDARY] = Color3.new(0.85, 0.7, 0.09)
}
v4.ItemRarityMap = {
    [v3.STONE_SWORD] = v6.COMMON,
    [v3.IRON_SWORD] = v6.UNCOMMON,
    [v3.DIAMOND_SWORD] = v6.EPIC,
    [v3.EMERALD_SWORD] = v6.LEGENDARY,
    [v3.STONE_PICKAXE] = v6.COMMON,
    [v3.IRON_PICKAXE] = v6.UNCOMMON,
    [v3.DIAMOND_PICKAXE] = v6.EPIC,
    [v3.LEATHER_HELMET] = v6.COMMON,
    [v3.IRON_HELMET] = v6.UNCOMMON,
    [v3.DIAMOND_HELMET] = v6.EPIC,
    [v3.EMERALD_HELMET] = v6.LEGENDARY,
    [v3.LEATHER_CHESTPLATE] = v6.COMMON,
    [v3.IRON_CHESTPLATE] = v6.UNCOMMON,
    [v3.DIAMOND_CHESTPLATE] = v6.EPIC,
    [v3.EMERALD_CHESTPLATE] = v6.LEGENDARY,
    [v3.LEATHER_BOOTS] = v6.COMMON,
    [v3.IRON_BOOTS] = v6.UNCOMMON,
    [v3.DIAMOND_BOOTS] = v6.EPIC,
    [v3.EMERALD_BOOTS] = v6.LEGENDARY,
    [v3.WOOD_BOW] = v6.UNCOMMON,
    [v3.WOOD_CROSSBOW] = v6.RARE,
    [v3.TACTICAL_CROSSBOW] = v6.EPIC,
    [v3.HEADHUNTER] = v6.LEGENDARY,
    [v3.ARROW] = v6.COMMON,
    [v3.TELEPEARL] = v6.RARE,
    [v3.FIREBALL] = v6.RARE,
    [v3.APPLE] = v6.COMMON,
    [v3.GOLDEN_APPLE] = v6.EPIC,
    [v3.MINI_SHIELD] = v6.UNCOMMON,
    [v3.BIG_SHIELD] = v6.RARE,
    [v3.PIE] = v6.UNCOMMON,
    [v3.FURY_POTION] = v6.RARE,
    [v3.SERPENTS_TOUCH_POTION] = v6.RARE
}
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 73 ]]
        return "BattleRoyaleLootTable"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 82 ]] end
local v10 = v2.new
local v11 = {}
local v12 = {
    ["amount"] = 1,
    ["itemType"] = v3.STONE_SWORD,
    ["weight"] = v6.COMMON
}
local v13 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_SWORD,
    ["weight"] = v6.RARE
}
local v14 = {
    ["amount"] = 1,
    ["itemType"] = v3.STONE_PICKAXE,
    ["weight"] = v6.COMMON
}
local v15 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_PICKAXE,
    ["weight"] = v6.RARE
}
local v16 = {
    ["amount"] = 1,
    ["itemType"] = v3.LEATHER_HELMET,
    ["weight"] = v6.COMMON
}
local v17 = {
    ["amount"] = 1,
    ["itemType"] = v3.LEATHER_CHESTPLATE,
    ["weight"] = v6.COMMON
}
local v18 = {
    ["amount"] = 1,
    ["itemType"] = v3.LEATHER_BOOTS,
    ["weight"] = v6.COMMON
}
local v19 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_HELMET,
    ["weight"] = v6.RARE
}
local v20 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_CHESTPLATE,
    ["weight"] = v6.RARE
}
local v21 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_BOOTS,
    ["weight"] = v6.RARE
}
local v22 = {
    ["amount"] = 1,
    ["itemType"] = v3.WOOD_BOW,
    ["weight"] = v6.RARE,
    ["extraItems"] = {
        {
            ["itemType"] = v3.ARROW,
            ["amount"] = NumberRange.new(8, 16)
        }
    }
}
__set_list(v11, 1, {v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, {
    ["amount"] = 1,
    ["itemType"] = v3.APPLE,
    ["weight"] = v6.COMMON
}, {
    ["amount"] = 1,
    ["itemType"] = v3.MINI_SHIELD,
    ["weight"] = v6.UNCOMMON
}, {
    ["amount"] = 1,
    ["itemType"] = v3.BIG_SHIELD,
    ["weight"] = v6.RARE
}, {
    ["amount"] = 1,
    ["itemType"] = v3.PIE,
    ["weight"] = v6.UNCOMMON
}})
u7.Tier0Chest = v10(v11)
local v23 = v2.new
local v24 = {}
local v25 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_SWORD,
    ["weight"] = v6.COMMON
}
local v26 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_SWORD,
    ["weight"] = v6.LEGENDARY
}
local v27 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_PICKAXE,
    ["weight"] = v6.COMMON
}
local v28 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_PICKAXE,
    ["weight"] = v6.LEGENDARY
}
local v29 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_HELMET,
    ["weight"] = v6.COMMON
}
local v30 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_CHESTPLATE,
    ["weight"] = v6.COMMON
}
local v31 = {
    ["amount"] = 1,
    ["itemType"] = v3.IRON_BOOTS,
    ["weight"] = v6.COMMON
}
local v32 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_HELMET,
    ["weight"] = v6.LEGENDARY
}
local v33 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_CHESTPLATE,
    ["weight"] = v6.LEGENDARY
}
local v34 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_BOOTS,
    ["weight"] = v6.LEGENDARY
}
local v35 = {
    ["itemType"] = v3.FIREBALL,
    ["amount"] = NumberRange.new(1, 3),
    ["weight"] = v6.EPIC
}
local v36 = {
    ["itemType"] = v3.ARROW,
    ["amount"] = NumberRange.new(16, 24),
    ["weight"] = v6.RARE
}
local v37 = {
    ["amount"] = 1,
    ["itemType"] = v3.TELEPEARL,
    ["weight"] = v6.RARE
}
local v38 = {
    ["amount"] = 1,
    ["itemType"] = v3.WOOD_BOW,
    ["weight"] = v6.COMMON,
    ["extraItems"] = {
        {
            ["itemType"] = v3.ARROW,
            ["amount"] = NumberRange.new(8, 16)
        }
    }
}
local v39 = {
    ["amount"] = 1,
    ["itemType"] = v3.WOOD_CROSSBOW,
    ["weight"] = v6.EPIC,
    ["extraItems"] = {
        {
            ["itemType"] = v3.ARROW,
            ["amount"] = NumberRange.new(16, 32)
        }
    }
}
__set_list(v24, 1, {v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, {
    ["itemType"] = v3.APPLE,
    ["amount"] = NumberRange.new(1, 3),
    ["weight"] = v6.COMMON
}})
__set_list(v24, 17, {{
    ["amount"] = 1,
    ["itemType"] = v3.BIG_SHIELD,
    ["weight"] = v6.RARE
}, {
    ["amount"] = 1,
    ["itemType"] = v3.PIE,
    ["weight"] = v6.RARE
}})
u7.Tier1Chest = v23(v24)
local v40 = v2.new
local v41 = {}
local v42 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_SWORD,
    ["weight"] = v6.UNCOMMON
}
local v43 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_SWORD,
    ["weight"] = v6.LEGENDARY
}
local v44 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_PICKAXE,
    ["weight"] = v6.UNCOMMON
}
local v45 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_HELMET,
    ["weight"] = v6.UNCOMMON
}
local v46 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_CHESTPLATE,
    ["weight"] = v6.UNCOMMON
}
local v47 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_BOOTS,
    ["weight"] = v6.UNCOMMON
}
local v48 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_HELMET,
    ["weight"] = v6.LEGENDARY
}
local v49 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_CHESTPLATE,
    ["weight"] = v6.LEGENDARY
}
local v50 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_BOOTS,
    ["weight"] = v6.LEGENDARY
}
local v51 = {
    ["itemType"] = v3.FIREBALL,
    ["amount"] = NumberRange.new(1, 2),
    ["weight"] = v6.RARE
}
local v52 = {
    ["itemType"] = v3.ARROW,
    ["amount"] = NumberRange.new(50),
    ["weight"] = v6.EPIC
}
local v53 = {
    ["amount"] = 1,
    ["itemType"] = v3.TELEPEARL,
    ["weight"] = v6.RARE
}
local v54 = {
    ["amount"] = 1,
    ["itemType"] = v3.WOOD_CROSSBOW,
    ["weight"] = v6.COMMON,
    ["extraItems"] = {
        {
            ["itemType"] = v3.ARROW,
            ["amount"] = NumberRange.new(16, 32)
        }
    }
}
local v55 = {
    ["amount"] = 1,
    ["itemType"] = v3.TACTICAL_CROSSBOW,
    ["weight"] = v6.RARE,
    ["extraItems"] = {
        {
            ["itemType"] = v3.ARROW,
            ["amount"] = NumberRange.new(16, 32)
        }
    }
}
__set_list(v41, 1, {v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, {
    ["itemType"] = v3.APPLE,
    ["amount"] = NumberRange.new(2, 3),
    ["weight"] = v6.UNCOMMON
}, {
    ["amount"] = 1,
    ["itemType"] = v3.GOLDEN_APPLE,
    ["weight"] = v6.UNCOMMON
}})
__set_list(v41, 17, {{
    ["amount"] = 1,
    ["itemType"] = v3.FURY_POTION,
    ["weight"] = v6.EPIC
}, {
    ["amount"] = 1,
    ["itemType"] = v3.SERPENTS_TOUCH_POTION,
    ["weight"] = v6.EPIC
}})
u7.Tier2Chest = v40(v41)
local v56 = v2.new
local v57 = {}
local v58 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_SWORD,
    ["weight"] = v6.COMMON
}
local v59 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_SWORD,
    ["weight"] = v6.UNCOMMON
}
local v60 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_PICKAXE,
    ["weight"] = v6.COMMON
}
local v61 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_HELMET,
    ["weight"] = v6.COMMON
}
local v62 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_CHESTPLATE,
    ["weight"] = v6.COMMON
}
local v63 = {
    ["amount"] = 1,
    ["itemType"] = v3.DIAMOND_BOOTS,
    ["weight"] = v6.COMMON
}
local v64 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_HELMET,
    ["weight"] = v6.UNCOMMON
}
local v65 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_CHESTPLATE,
    ["weight"] = v6.UNCOMMON
}
local v66 = {
    ["amount"] = 1,
    ["itemType"] = v3.EMERALD_BOOTS,
    ["weight"] = v6.UNCOMMON
}
local v67 = {
    ["itemType"] = v3.FIREBALL,
    ["amount"] = NumberRange.new(1, 5),
    ["weight"] = v6.RARE
}
local v68 = {
    ["itemType"] = v3.ARROW,
    ["amount"] = NumberRange.new(50),
    ["weight"] = v6.RARE
}
local v69 = {
    ["amount"] = 3,
    ["itemType"] = v3.TELEPEARL,
    ["weight"] = v6.COMMON
}
local v70 = {
    ["amount"] = 1,
    ["itemType"] = v3.TACTICAL_CROSSBOW,
    ["weight"] = v6.COMMON,
    ["extraItems"] = {
        {
            ["itemType"] = v3.ARROW,
            ["amount"] = NumberRange.new(16, 32)
        }
    }
}
local v71 = {
    ["amount"] = 1,
    ["itemType"] = v3.HEADHUNTER,
    ["weight"] = v6.UNCOMMON,
    ["extraItems"] = {
        {
            ["itemType"] = v3.ARROW,
            ["amount"] = NumberRange.new(16, 32)
        }
    }
}
__set_list(v57, 1, {v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, {
    ["itemType"] = v3.GOLDEN_APPLE,
    ["amount"] = NumberRange.new(1, 3),
    ["weight"] = v6.UNCOMMON
}, {
    ["amount"] = 1,
    ["itemType"] = v3.FURY_POTION,
    ["weight"] = v6.EPIC
}})
__set_list(v57, 17, {{
    ["amount"] = 1,
    ["itemType"] = v3.SERPENTS_TOUCH_POTION,
    ["weight"] = v6.EPIC
}})
u7.Tier3Chest = v56(v57)
v4.BattleRoyaleLootTable = u7
return {
    ["BattleRoyaleUtil"] = v4
}