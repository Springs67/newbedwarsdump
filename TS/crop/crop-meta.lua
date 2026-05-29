local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "taliyah", "taliyah-util").TaliyahUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = {}
local v6 = {
    ["disableTeammatePickup"] = true,
    ["itemType"] = v4.PUMPKIN,
    ["stages"] = {
        {
            ["time"] = 15
        },
        {
            ["time"] = 15
        },
        {
            ["time"] = 15
        }
    },
    ["requireKit"] = v2.FARMER_CLETUS
}
local v7 = {
    ["replant"] = true,
    ["disableTeammatePickup"] = true,
    ["itemType"] = v4.CARROT,
    ["stages"] = {
        {
            ["time"] = 35
        },
        {
            ["time"] = 40
        },
        {
            ["time"] = 45
        }
    },
    ["harvestReward"] = {
        ["amount"] = 1,
        ["itemType"] = v4.DIAMOND
    },
    ["requireKit"] = v2.FARMER_CLETUS
}
local v8 = {
    ["replant"] = true,
    ["disableTeammatePickup"] = true,
    ["itemType"] = v4.MELON,
    ["stages"] = {
        {
            ["time"] = 40
        },
        {
            ["time"] = 50
        },
        {
            ["time"] = 50
        }
    },
    ["harvestReward"] = {
        ["amount"] = 1.1,
        ["itemType"] = v4.EMERALD
    },
    ["requireKit"] = v2.FARMER_CLETUS
}
local v9 = {
    ["disableTeammatePickup"] = true,
    ["itemType"] = v4.CHICKEN_EGG_BLOCK,
    ["stages"] = {
        {
            ["time"] = v3.EGG_HARVEST_TIME / 4
        },
        {
            ["time"] = v3.EGG_HARVEST_TIME / 4
        },
        {
            ["time"] = v3.EGG_HARVEST_TIME / 4
        },
        {
            ["time"] = v3.EGG_HARVEST_TIME / 4
        }
    },
    ["harvestReward"] = {
        ["amount"] = 1,
        ["itemType"] = v4.CHICKEN_DEPLOY
    },
    ["requireKit"] = v2.TALIYAH
}
__set_list(u5, 1, {v6, v7, v8, v9})
return {
    ["getCropConfig"] = function(p10) --[[ Name: getCropConfig, Line 67 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v11 = nil
        for v12, v13 in u5 do
            local _ = v12 - 1
            if v13.itemType == p10 == true then
                return v13
            end
        end
        return v11
    end
}