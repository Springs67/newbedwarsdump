local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin").StatefulEntitySkin
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType
local u5 = {
    [v3.DIAMOND_GUARDIAN] = {
        ["name"] = "Diamond Guardian",
        ["statefulEntityType"] = v4.DIAMOND_GUARDIAN,
        ["model"] = v2.Assets.Misc.DiamondGuardian
    },
    [v3.GOLEM_BOSS] = {
        ["name"] = "Golem Boss",
        ["statefulEntityType"] = v4.GOLEM_BOSS,
        ["model"] = v2.Assets.Misc.GolemBoss
    },
    [v3.SPIRIT_GOLEM_BOSS] = {
        ["name"] = "Spirit Golem Boss",
        ["statefulEntityType"] = v4.SPIRIT_GOLEM_BOSS,
        ["model"] = v2.Assets.Misc.SpiritGolemBoss
    },
    [v3.VOID_GOLEM_BOSS] = {
        ["name"] = "Void Golem Boss",
        ["statefulEntityType"] = v4.VOID_GOLEM_BOSS,
        ["model"] = v2.Assets.Misc.VoidGolemBoss
    },
    [v3.CHRISTMAS_DIAMOND_GUARDIAN] = {
        ["name"] = "Christmas Diamond Guardian",
        ["statefulEntityType"] = v4.DIAMOND_GUARDIAN,
        ["model"] = v2.Assets.Misc.ChristmasDiamondGuardian
    },
    [v3.CHRISTMAS_GOLEM_BOSS] = {
        ["name"] = "Christmas Golem Boss",
        ["statefulEntityType"] = v4.GOLEM_BOSS,
        ["model"] = v2.Assets.Misc.ChristmasGolemBoss
    }
}
return {
    ["getEntitySkinMeta"] = function(p6) --[[ Name: getEntitySkinMeta, Line 38 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p6]
    end,
    ["StatefulEntitySkinMeta"] = u5
}