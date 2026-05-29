local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.RANGE = "range"
v2.range = "RANGE"
v3.HEAT = "heat"
v2.heat = "HEAT"
v3.POWER = "power"
v2.power = "POWER"
local u4 = {}
local v5 = v3.HEAT
local v6 = {
    ["name"] = "Heat",
    ["tiers"] = {
        {
            ["name"] = "+100% Fire Damage",
            ["price"] = 1,
            ["values"] = { 100 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "+180% Fire Damage",
            ["price"] = 2,
            ["values"] = { 180 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "+250% Fire Damage",
            ["price"] = 3,
            ["values"] = { 250 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "+50% Fire Armor Penetration",
            ["price"] = 6,
            ["values"] = { 250, 50 },
            ["currency"] = v1.EMBER
        }
    }
}
u4[v5] = v6
local v7 = v3.POWER
local v8 = {
    ["name"] = "Power",
    ["tiers"] = {
        {
            ["name"] = "+30% Brittle Attack Damage",
            ["price"] = 1,
            ["values"] = { 30 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "+50% Brittle Attack Damage",
            ["price"] = 2,
            ["values"] = { 50 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "+80% Brittle Attack Damage",
            ["price"] = 3,
            ["values"] = { 80 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "Flames Knockback Enemies",
            ["price"] = 8,
            ["values"] = { 80, 0.65 },
            ["currency"] = v1.EMBER
        }
    }
}
u4[v7] = v8
local v9 = v3.RANGE
local v10 = {
    ["name"] = "Range",
    ["tiers"] = {
        {
            ["name"] = "+25% Flame Range",
            ["price"] = 1,
            ["values"] = { 25 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "+50% Flame Range",
            ["price"] = 2,
            ["values"] = { 50 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "+75% Flame Range",
            ["price"] = 3,
            ["values"] = { 75 },
            ["currency"] = v1.EMBER
        },
        {
            ["name"] = "Fire Burns Flammable Blocks",
            ["price"] = 4,
            ["values"] = { 75, 1 },
            ["currency"] = v1.EMBER
        }
    }
}
u4[v9] = v10
return {
    ["getFlamethrowerUpgradeMeta"] = function(p11) --[[ Name: getFlamethrowerUpgradeMeta, Line 91 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p11]
    end,
    ["FlamethrowerUpgrade"] = v3,
    ["FlamethrowerUpgradeMeta"] = u4
}