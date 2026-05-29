local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.Field = "Field"
v2.Field = "Field"
v3.Team = "Team"
v2.Team = "Team"
v3.Item = "Item"
v2.Item = "Item"
local u4 = {}
local v5 = v1.GLOBAL_GENERATOR_GADGET
local v6 = {
    ["config"] = {
        ["Item"] = v3.Item,
        ["Cooldown"] = v3.Field,
        ["Max Stack Size"] = v3.Field
    }
}
u4[v5] = v6
local v7 = v1.TEAM_GENERATOR_GADGET
local v8 = {
    ["config"] = {
        ["Team"] = v3.Team,
        ["Cooldown"] = v3.Field,
        ["Max Stack Size"] = v3.Field
    }
}
u4[v7] = v8
local v9 = v1.BED_GADGET
local v10 = {
    ["removeOnConfig"] = true,
    ["config"] = {
        ["Team"] = v3.Team
    }
}
u4[v9] = v10
local v11 = v1.SPAWN_GADGET
local v12 = {
    ["removeOnConfig"] = true,
    ["config"] = {
        ["Team"] = v3.Team
    }
}
u4[v11] = v12
return {
    ["getCreativeGadgetMeta"] = function(p13) --[[ Name: getCreativeGadgetMeta, Line 45 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p13]
    end,
    ["GadgetConfigOptions"] = v3,
    ["CreativeGadgetMeta"] = u4
}