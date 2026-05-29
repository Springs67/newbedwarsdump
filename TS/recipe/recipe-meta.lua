local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u2 = {
    [v1.TIME_BOMB_POTION] = {
        ["timeToCraft"] = 3,
        ["ingredients"] = { v1.EMERALD_BLOCK, v1.EMERALD_BLOCK, v1.EMERALD_BLOCK },
        ["result"] = v1.TIME_BOMB_POTION
    },
    [v1.SLEEP_SPLASH_POTION] = {
        ["timeToCraft"] = 4,
        ["ingredients"] = { v1.MUSHROOMS, v1.MUSHROOMS, v1.MUSHROOMS },
        ["result"] = v1.SLEEP_SPLASH_POTION
    },
    [v1.BIG_SHIELD] = {
        ["timeToCraft"] = 7,
        ["ingredients"] = { v1.THORNS, v1.THORNS, v1.WILD_FLOWER },
        ["result"] = v1.BIG_SHIELD
    },
    [v1.POISON_SPLASH_POTION] = {
        ["timeToCraft"] = 5,
        ["ingredients"] = { v1.THORNS, v1.MUSHROOMS, v1.MUSHROOMS },
        ["result"] = v1.POISON_SPLASH_POTION
    },
    [v1.HEAL_SPLASH_POTION] = {
        ["timeToCraft"] = 5,
        ["ingredients"] = { v1.WILD_FLOWER, v1.WILD_FLOWER, v1.WILD_FLOWER },
        ["result"] = v1.HEAL_SPLASH_POTION
    }
}
return {
    ["getRecipeMeta"] = function(p3) --[[ Name: getRecipeMeta, Line 31 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v4 = u2[p3]
        return v4 == nil and {
            ["timeToCraft"] = 2,
            ["ingredients"] = {}
        } or v4
    end,
    ["recipes"] = u2
}