local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.GOLD = "gold"
v1.gold = "GOLD"
v2.SPECIAL = "special"
v1.special = "SPECIAL"
v2.DIAMOND = "diamond"
v1.diamond = "DIAMOND"
v2.IRON = "iron"
v1.iron = "IRON"
local u3 = {
    [v2.GOLD] = {
        ["name"] = "Gold",
        ["icon"] = "rbxassetid://7976208326",
        ["model"] = "fish_gold",
        ["color"] = Color3.fromRGB(247, 181, 44)
    },
    [v2.SPECIAL] = {
        ["name"] = "Special",
        ["icon"] = "rbxassetid://7976208326",
        ["model"] = "fish_special",
        ["color"] = Color3.fromRGB(220, 111, 127)
    },
    [v2.DIAMOND] = {
        ["name"] = "Diamond",
        ["icon"] = "rbxassetid://7976208326",
        ["model"] = "fish_diamond",
        ["color"] = Color3.fromRGB(2, 247, 247)
    },
    [v2.IRON] = {
        ["name"] = "Iron",
        ["icon"] = "rbxassetid://7976208326",
        ["model"] = "fish_iron",
        ["color"] = Color3.fromRGB(145, 140, 146)
    }
}
return {
    ["getFishMetadata"] = function(p4) --[[ Name: getFishMetadata, Line 43 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p4]
    end,
    ["FishType"] = v2,
    ["FishMeta"] = u3
}