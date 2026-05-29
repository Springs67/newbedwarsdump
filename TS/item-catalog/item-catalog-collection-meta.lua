local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-collection").ItemCatalogCollection
local v4 = {
    [v3.DEFAULT] = {}
}
local v5 = v3.HALLOWEEN_LUCKY_BLOCK
local v6 = {
    ["displayLabel"] = {
        ["name"] = "Halloween Collection",
        ["color"] = v2.hexColor(16738645)
    }
}
v4[v5] = v6
local v7 = v3.MYTHIC_WEAPON
local v8 = {
    ["displayLabel"] = {
        ["name"] = "Mythic Weapon Collection",
        ["color"] = v2.hexColor(16733658)
    }
}
v4[v7] = v8
local v9 = v3.MAGICAL_HERO_LUCKY_BLOCK
local v10 = {
    ["displayLabel"] = {
        ["name"] = "Magical Hero Collection",
        ["color"] = v2.hexColor(16423917)
    }
}
v4[v9] = v10
return {
    ["ItemCatalogMetaCollectionMeta"] = v4
}