local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType
local u5 = {
    [u4.DISRUPTOR] = {
        ["image"] = "rbxassetid://16829921611",
        ["shortDesc"] = "DISABLE ENEMIES AND GENERATORS"
    },
    [u4.RUSH] = {
        ["image"] = "rbxassetid://16829921408",
        ["shortDesc"] = "FAST MOVESPEED"
    },
    [u4.TANK] = {
        ["image"] = "rbxassetid://16829921158",
        ["shortDesc"] = "HIGH HP"
    },
    [u4.PROWLER] = {
        ["image"] = "rbxassetid://73177174211943",
        ["shortDesc"] = "SNEAK AND TRACK"
    }
}
return {
    ["getRandomInfectedVariant"] = function() --[[ Name: getRandomInfectedVariant, Line 7 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u4
        --]]
        local v6 = u2.fromList
        local v7 = u3.values
        local v8 = u4
        return v6(unpack(v7(v8)))
    end,
    ["InfectedVariantMeta"] = u5,
    ["getInfectedVariantMetadata"] = function(p9) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p9]
    end
}