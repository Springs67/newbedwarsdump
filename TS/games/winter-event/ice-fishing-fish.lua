local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.COMMON = "common"
v1.common = "COMMON"
v2.RARE = "rare"
v1.rare = "RARE"
v2.EPIC = "epic"
v1.epic = "EPIC"
local u3 = {
    [v2.EPIC] = {
        ["name"] = "EPIC",
        ["score"] = 10,
        ["rarity"] = 10,
        ["size"] = 3.5,
        ["fishModel"] = "fish_special",
        ["showRareEffect"] = true,
        ["color"] = Color3.fromRGB(242, 87, 87)
    },
    [v2.RARE] = {
        ["name"] = "RARE",
        ["score"] = 5,
        ["rarity"] = 30,
        ["size"] = 3,
        ["fishModel"] = "fish_emerald",
        ["color"] = Color3.fromRGB(89, 235, 84)
    },
    [v2.COMMON] = {
        ["name"] = "COMMON",
        ["score"] = 3,
        ["rarity"] = 100,
        ["size"] = 2.5,
        ["fishModel"] = "fish_diamond",
        ["color"] = Color3.fromRGB(0, 122, 255)
    }
}
local v5 = {
    ["FishWeightedSelect"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect.new({
        {
            ["weight"] = u3[v2.COMMON].rarity,
            ["fish"] = v2.COMMON
        },
        {
            ["weight"] = u3[v2.RARE].rarity,
            ["fish"] = v2.RARE
        },
        {
            ["weight"] = u3[v2.EPIC].rarity,
            ["fish"] = v2.EPIC
        }
    }),
    ["getFishMetadata"] = function(p4) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p4]
    end
}
return {
    ["IceFishingFish"] = v2,
    ["IceFishMeta"] = u3,
    ["IceFishingUtil"] = v5
}