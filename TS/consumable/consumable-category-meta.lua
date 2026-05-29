local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local v2 = v1.ConsumableCategory
local v3 = v1.ConsumableStatus
local u4 = {
    [v2.BATTLE_PASS_XP] = {
        ["displayName"] = "Battle Pass XP Boost",
        ["blockMultipleActive"] = true,
        ["statusOnConsume"] = v3.ACTIVE
    },
    [v2.ARMOR_TRIM_XP] = {
        ["displayName"] = "Armor Trim XP Boost",
        ["blockMultipleActive"] = true,
        ["statusOnConsume"] = v3.ACTIVE
    },
    [v2.KIT_RENTAL] = {
        ["displayName"] = "Kit Rental Pass",
        ["statusOnConsume"] = v3.ACTIVE
    },
    [v2.MISSION_TICKET] = {
        ["displayName"] = "Mission Ticket",
        ["statusOnConsume"] = v3.DEPLETED
    },
    [v2.REWARD_CRATE] = {
        ["displayName"] = "Reward Crate",
        ["statusOnConsume"] = v3.DEPLETED
    },
    [v2.KIT_TOKEN] = {
        ["displayName"] = "Kit Token",
        ["statusOnConsume"] = v3.DEPLETED
    },
    [v2.RED_ENVELOPE] = {
        ["displayName"] = "Red Envelope",
        ["statusOnConsume"] = v3.DEPLETED
    },
    [v2.LOBBY_ITEM] = {
        ["displayName"] = "One Time Use Lobby Gadget",
        ["statusOnConsume"] = v3.DEPLETED
    },
    [v2.CRATE_ALTAR] = {
        ["displayName"] = "Crate Altar",
        ["statusOnConsume"] = v3.ACTIVE
    },
    [v2.CURRENCY] = {
        ["displayName"] = "Currency",
        ["statusOnConsume"] = v3.DEPLETED
    }
}
return {
    ["consumableCategoryMeta"] = u4,
    ["getConsumableCategoryMeta"] = function(p5) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end
}