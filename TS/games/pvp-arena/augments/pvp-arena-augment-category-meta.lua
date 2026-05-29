local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-category").PvPArenaAugmentCategory
local u2 = {}
local v3 = u1.SILVER
local v4 = {
    ["title"] = {
        ["displayName"] = "Silver",
        ["color"] = Color3.fromRGB(192, 192, 192)
    },
    ["hexagonOutlineGradient"] = ColorSequence.new(Color3.fromRGB(122, 122, 122), Color3.fromRGB(255, 255, 255))
}
u2[v3] = v4
local v5 = u1.GOLD
local v6 = {
    ["title"] = {
        ["displayName"] = "Gold",
        ["color"] = Color3.fromRGB(245, 181, 41)
    },
    ["hexagonOutlineGradient"] = ColorSequence.new(Color3.fromRGB(245, 181, 41), Color3.fromRGB(255, 250, 247))
}
u2[v5] = v6
local v7 = u1.PRISMATIC
local v8 = {
    ["title"] = {
        ["displayName"] = "Prismatic",
        ["color"] = Color3.fromRGB(43, 219, 255)
    },
    ["hexagonOutlineGradient"] = ColorSequence.new(Color3.fromRGB(43, 219, 255), Color3.fromRGB(219, 186, 255))
}
u2[v7] = v8
return {
    ["getPvpArenaAugmentCategoryMeta"] = function(p9) --[[ Name: getPvpArenaAugmentCategoryMeta, Line 27 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        local v10 = u2
        if p9 == nil then
            p9 = u1.SILVER
        end
        return v10[p9]
    end
}