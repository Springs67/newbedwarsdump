local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums").LuckyBlockRarity
local v4 = {
    ["RarityEffectColors"] = {
        [u3.COMMON] = Color3.new(1, 1, 1),
        [u3.UNCOMMON] = Color3.new(0.25, 0.94, 0.22),
        [u3.RARE] = Color3.fromRGB(40, 101, 234),
        [u3.EPIC] = Color3.new(0.87, 0.24, 0.85),
        [u3.LEGENDARY] = Color3.new(0.85, 0.7, 0.09)
    },
    ["NeonEffectColors"] = {
        [u3.COMMON] = Color3.fromRGB(165, 164, 167),
        [u3.UNCOMMON] = Color3.fromRGB(54, 171, 62),
        [u3.RARE] = Color3.fromRGB(72, 108, 174),
        [u3.EPIC] = Color3.fromRGB(120, 72, 172),
        [u3.LEGENDARY] = Color3.fromRGB(192, 113, 55)
    }
}
local v5 = {
    [u3.COMMON] = v2.new({
        {
            ["weight"] = 80,
            ["luckyBlockRarity"] = u3.COMMON
        },
        {
            ["weight"] = 10,
            ["luckyBlockRarity"] = u3.UNCOMMON
        },
        {
            ["weight"] = 5,
            ["luckyBlockRarity"] = u3.RARE
        },
        {
            ["weight"] = 3,
            ["luckyBlockRarity"] = u3.EPIC
        },
        {
            ["weight"] = 2,
            ["luckyBlockRarity"] = u3.LEGENDARY
        }
    }),
    [u3.UNCOMMON] = v2.new({
        {
            ["weight"] = 82,
            ["luckyBlockRarity"] = u3.UNCOMMON
        },
        {
            ["weight"] = 10,
            ["luckyBlockRarity"] = u3.RARE
        },
        {
            ["weight"] = 5,
            ["luckyBlockRarity"] = u3.EPIC
        },
        {
            ["weight"] = 3,
            ["luckyBlockRarity"] = u3.LEGENDARY
        }
    }),
    [u3.RARE] = v2.new({
        {
            ["weight"] = 85,
            ["luckyBlockRarity"] = u3.RARE
        },
        {
            ["weight"] = 10,
            ["luckyBlockRarity"] = u3.EPIC
        },
        {
            ["weight"] = 5,
            ["luckyBlockRarity"] = u3.LEGENDARY
        }
    }),
    [u3.EPIC] = v2.new({
        {
            ["weight"] = 87,
            ["luckyBlockRarity"] = u3.EPIC
        },
        {
            ["weight"] = 13,
            ["luckyBlockRarity"] = u3.LEGENDARY
        }
    }),
    [u3.LEGENDARY] = v2.new({
        {
            ["weight"] = 100,
            ["luckyBlockRarity"] = u3.LEGENDARY
        }
    }),
    [u3.ZERO] = v2.new({})
}
v4.guaranteedRarityToWeightedSelect = v5
function v4.getGuaranteedLowestRarityFromSmeltPoints(p6) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p6 < 0.03 then
        return nil
    elseif p6 < 0.1 then
        return u3.COMMON
    elseif p6 < 0.2 then
        return u3.UNCOMMON
    elseif p6 < 0.4 then
        return u3.RARE
    elseif p6 < 0.8 then
        return u3.EPIC
    else
        return u3.LEGENDARY
    end
end
return {
    ["LuckyBlockSmelterUtil"] = v4
}