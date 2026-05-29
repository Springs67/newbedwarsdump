local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.RARE = 0
v6[0] = "RARE"
v7.EPIC = 1
v6[1] = "EPIC"
v7.UNIQUE = 2
v6[2] = "UNIQUE"
local v8 = {}
local v9 = setmetatable({}, {
    ["__index"] = v8
})
v9.ITEM = 0
v8[0] = "ITEM"
v9.BUFF = 1
v8[1] = "BUFF"
v9.DISCOUNT = 2
v8[2] = "DISCOUNT"
return {
    ["TRAVELING_MERCHANT_SPAWN_CHANCE"] = 100,
    ["TRAVELING_MERCHANT_STUDIO_SPAWN_TIME"] = 5,
    ["TRAVELING_MERCHANT_SETUP_TIME"] = 45,
    ["TRAVELING_MERCHANT_VISIT_TIME"] = 180,
    ["TRAVELING_MERCHANT_SHOP_QUANTITY"] = 3,
    ["TRAVELING_MERCHANT_WAGON_TAG"] = "MERCHANT_WAGON",
    ["TRAVELING_MERCHANT_OPEN_ATTRIBUTE"] = "MERCHANT_OPEN_ATTR",
    ["TRAVELING_MERCHANT_ITEM_TAG"] = "MERCHANT_ITEM",
    ["TRAVELING_MERCHANT_ITEM_ATTRIBUTE"] = "MERCHANT_ITEM_ATTR",
    ["TRAVELING_MERCHANT_SPAWN_RANGE"] = { 540, 540 },
    ["MerchantItemRarity"] = v7,
    ["MerchantItemCategory"] = v9,
    ["RARITY_TO_STAR_COUNT"] = {
        [v7.RARE] = 1,
        [v7.EPIC] = 2,
        [v7.UNIQUE] = 3
    },
    ["RARITY_TO_COLOR"] = {
        [v7.RARE] = Color3.fromRGB(0, 112, 221),
        [v7.EPIC] = Color3.fromRGB(163, 53, 238),
        [v7.UNIQUE] = Color3.fromRGB(255, 234, 0)
    },
    ["RARITY_TO_PURCHASE_SOUND"] = {
        [v7.RARE] = v5.TRAVELING_MERCHANT_PURCHASE_RARE,
        [v7.EPIC] = v5.TRAVELING_MERCHANT_PURCHASE_EPIC,
        [v7.UNIQUE] = v5.TRAVELING_MERCHANT_PURCHASE_UNIQUE
    },
    ["VALID_MERCHANT_QUEUE_TYPES"] = {
        v3.BEDWARS_TO1,
        v3.BEDWARS_TO2,
        v3.BEDWARS_TO4,
        v3.BEDWARS_20v20,
        v3.BEDWARS_16v16,
        v3.BEDWARS_20v20_LB,
        v3.BEDWARS_LUCKY_BLOCK,
        v3.BEDWARS_LUCKY_BLOCK_TO2,
        v3.BEDWARS_5v5
    },
    ["TRAVELING_MERCHANT_ITEM_POOL"] = v2.new({
        {
            ["quantity"] = 3,
            ["cost"] = 1,
            ["weight"] = 35,
            ["item"] = v4.TELEPEARL,
            ["purchaseCurrency"] = v4.EMERALD,
            ["rarity"] = v7.RARE,
            ["category"] = v9.DISCOUNT
        },
        {
            ["quantity"] = 1,
            ["cost"] = 8,
            ["weight"] = 15,
            ["item"] = v4.EMERALD_SWORD,
            ["purchaseCurrency"] = v4.EMERALD,
            ["rarity"] = v7.UNIQUE,
            ["category"] = v9.DISCOUNT
        },
        {
            ["quantity"] = 5,
            ["cost"] = 50,
            ["weight"] = 35,
            ["item"] = v4.FIREBALL,
            ["purchaseCurrency"] = v4.IRON,
            ["rarity"] = v7.RARE,
            ["category"] = v9.DISCOUNT
        },
        {
            ["quantity"] = 0,
            ["cost"] = 8,
            ["weight"] = 50,
            ["buffDescription"] = "Increases your team\'s damage by [g]+20%[/g].",
            ["item"] = v4.MERCHANT_DAMAGE_BUFF,
            ["purchaseCurrency"] = v4.DIAMOND,
            ["rarity"] = v7.EPIC,
            ["category"] = v9.BUFF
        },
        {
            ["quantity"] = 0,
            ["cost"] = 8,
            ["weight"] = 50,
            ["buffDescription"] = "Your team heals [g]+2[/g] HP [n]every second[/n].",
            ["item"] = v4.MERCHANT_HEAL_BUFF,
            ["purchaseCurrency"] = v4.DIAMOND,
            ["rarity"] = v7.EPIC,
            ["category"] = v9.BUFF
        },
        {
            ["quantity"] = 1,
            ["cost"] = 4,
            ["weight"] = 10,
            ["item"] = v4.TURTLE_BACKPACK,
            ["purchaseCurrency"] = v4.EMERALD,
            ["rarity"] = v7.UNIQUE,
            ["category"] = v9.ITEM
        },
        {
            ["quantity"] = 1,
            ["cost"] = 4,
            ["weight"] = 10,
            ["item"] = v4.ROCKET_BELT,
            ["purchaseCurrency"] = v4.EMERALD,
            ["rarity"] = v7.UNIQUE,
            ["category"] = v9.ITEM
        },
        {
            ["quantity"] = 5,
            ["cost"] = 50,
            ["weight"] = 30,
            ["item"] = v4.INVISIBLE_LANDMINE,
            ["purchaseCurrency"] = v4.IRON,
            ["rarity"] = v7.RARE,
            ["category"] = v9.ITEM
        },
        {
            ["quantity"] = 3,
            ["cost"] = 100,
            ["weight"] = 30,
            ["item"] = v4.HANG_GLIDER,
            ["purchaseCurrency"] = v4.IRON,
            ["rarity"] = v7.RARE,
            ["category"] = v9.ITEM
        },
        {
            ["quantity"] = 10,
            ["cost"] = 1,
            ["weight"] = 20,
            ["item"] = v4.DETONATED_BOMB,
            ["purchaseCurrency"] = v4.EMERALD,
            ["rarity"] = v7.EPIC,
            ["category"] = v9.ITEM
        }
    })
}