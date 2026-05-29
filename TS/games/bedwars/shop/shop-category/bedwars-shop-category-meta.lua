local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local v6 = {
    [v5.Recommended] = {
        ["name"] = "\226\173\144 Recommended",
        ["displayLayoutOrder"] = 0
    },
    [v5.Blocks] = {
        ["name"] = "Blocks",
        ["displayLayoutOrder"] = 1
    },
    [v5.Combat] = {
        ["name"] = "Combat",
        ["displayLayoutOrder"] = 2
    },
    [v5.Tools] = {
        ["name"] = "Tools",
        ["displayLayoutOrder"] = 3
    },
    [v5.Potions] = {
        ["name"] = "Potions",
        ["displayLayoutOrder"] = 4
    },
    [v5.Void] = {
        ["name"] = "Void",
        ["layoutOrder"] = 4,
        ["icon"] = v3.VOID_ICON_SOLID,
        ["unlockable"] = {
            ["disableTillUnlocked"] = true
        }
    }
}
local v7 = v5.Armory
local v8 = {
    ["name"] = "Armory",
    ["layoutOrder"] = 1,
    ["disabled"] = true,
    ["icon"] = v2.HELMET_SOLID
}
local v9 = {
    ["teamUnlock"] = true,
    ["purchaseReq"] = {
        ["price"] = 4,
        ["currency"] = v4.DIAMOND
    }
}
v8.unlockable = v9
v6[v7] = v8
local v10 = v5.Pirate
local v11 = {
    ["name"] = "Become a Pirate",
    ["disabled"] = true,
    ["layoutOrder"] = 4,
    ["icon"] = v3.PIRATE_SKULL_ICON
}
local v12 = {
    ["teamUnlock"] = false,
    ["purchaseReq"] = {
        ["price"] = 20,
        ["currency"] = v4.IRON
    }
}
v11.unlockable = v12
v6[v10] = v11
v6[v5.Halloween] = {
    ["name"] = "Halloween",
    ["icon"] = "rbxassetid://7843844110",
    ["disabled"] = true,
    ["layoutOrder"] = 4
}
v6[v5.Seeds] = {
    ["name"] = "Seeds",
    ["icon"] = "rbxassetid://7843844110",
    ["layoutOrder"] = 2
}
v6[v5.Resources] = {
    ["name"] = "Resources",
    ["layoutOrder"] = 4
}
v6[v5.BlackMarket] = {
    ["name"] = "Black Market",
    ["layoutOrder"] = 5
}
v6[v5.Random] = {
    ["name"] = "Random (Changes each match)",
    ["displayLayoutOrder"] = 6
}
return {
    ["BedwarsShopCategoryMeta"] = v6
}