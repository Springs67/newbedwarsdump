local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-rarity").VendingMachineRarity
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId
local v5 = {
    [v4.NONE] = {
        ["id"] = v4.NONE,
        ["rarity"] = v3.COMMON
    },
    [v4.DODO_BIRD] = {
        ["disabled"] = true,
        ["id"] = v4.DODO_BIRD,
        ["rarity"] = v3.COMMON,
        ["custom"] = {
            ["image"] = "rbxassetid://9112234692",
            ["title"] = "Dodo Bird"
        }
    }
}
local v6 = v4.PAINT_BLASTER
local v7 = {
    ["id"] = v4.PAINT_BLASTER,
    ["rarity"] = v3.COMMON,
    ["item"] = {
        ["amount"] = 1,
        ["itemType"] = v2.PAINT_SHOTGUN
    }
}
v5[v6] = v7
local v8 = v4.TWIRLBLADE
local v9 = {
    ["disabled"] = true,
    ["id"] = v4.TWIRLBLADE,
    ["rarity"] = v3.COMMON,
    ["item"] = {
        ["amount"] = 1,
        ["itemType"] = v2.TWIRLBLADE
    }
}
v5[v8] = v9
local v10 = v4.CARROT_CANNON
local v11 = {
    ["id"] = v4.CARROT_CANNON,
    ["rarity"] = v3.COMMON,
    ["item"] = {
        ["amount"] = 1,
        ["itemType"] = v2.CARROT_CANNON
    }
}
v5[v10] = v11
local v12 = v4.BEAR_CLAWS
local v13 = {
    ["id"] = v4.BEAR_CLAWS,
    ["rarity"] = v3.COMMON,
    ["item"] = {
        ["amount"] = 1,
        ["itemType"] = v2.BEAR_CLAWS
    }
}
v5[v12] = v13
local v14 = v4.SPEED_BOOTS
local v15 = {
    ["id"] = v4.SPEED_BOOTS,
    ["rarity"] = v3.COMMON,
    ["item"] = {
        ["amount"] = 1,
        ["itemType"] = v2.SPEED_BOOTS
    }
}
v5[v14] = v15
local v16 = v4.JUMP_BOOTS
local v17 = {
    ["id"] = v4.JUMP_BOOTS,
    ["rarity"] = v3.COMMON,
    ["item"] = {
        ["amount"] = 1,
        ["itemType"] = v2.JUMP_BOOTS
    }
}
v5[v16] = v17
local v18 = v4.BOBA_BLASTER
local v19 = {
    ["id"] = v4.BOBA_BLASTER,
    ["rarity"] = v3.COMMON,
    ["item"] = {
        ["amount"] = 1,
        ["itemType"] = v2.BOBA_BLASTER
    }
}
v5[v18] = v19
return {
    ["VendingMachineRewardMeta"] = v5
}