local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-contents", "afk-crate-items").AFK_CRATE_ITEMS
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-contents", "lucky-crate-items").LUCKY_CRATE_ITEMS
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-items").CrateItemType
local v13 = {}
local v14 = setmetatable({}, {
    ["__index"] = v13
})
v14.TIER_0 = 0
v13[0] = "TIER_0"
v14.TIER_1 = 1
v13[1] = "TIER_1"
v14.TIER_2 = 2
v13[2] = "TIER_2"
v14.TIER_3 = 3
v13[3] = "TIER_3"
local v15 = {
    [v9.LEVEL_UP_CRATE] = {
        ["displayName"] = "Gold Lucky Crate",
        ["image"] = v6.LUCKY_CRATE_RENDER,
        ["model"] = v3.Assets.Misc.RewardCrate,
        ["consumableRequirement"] = v4.LEVEL_UP_CRATE,
        ["items"] = v11,
        ["raritySettings"] = {
            [v14.TIER_0] = {
                [v8.ONE_STAR] = 0.38,
                [v8.TWO_STAR] = 0.32,
                [v8.THREE_STAR] = 0.2,
                [v8.FOUR_STAR] = 0.0825,
                [v8.FIVE_STAR] = 0.015,
                [v8.SIX_STAR] = 0.0025
            },
            [v14.TIER_1] = {
                [v8.ONE_STAR] = 0.18,
                [v8.TWO_STAR] = 0.4,
                [v8.THREE_STAR] = 0.25,
                [v8.FOUR_STAR] = 0.1425,
                [v8.FIVE_STAR] = 0.025,
                [v8.SIX_STAR] = 0.0025
            },
            [v14.TIER_2] = {
                [v8.ONE_STAR] = 0.1,
                [v8.TWO_STAR] = 0.3,
                [v8.THREE_STAR] = 0.35,
                [v8.FOUR_STAR] = 0.2025,
                [v8.FIVE_STAR] = 0.045,
                [v8.SIX_STAR] = 0.0025
            },
            [v14.TIER_3] = {
                [v8.ONE_STAR] = 0,
                [v8.TWO_STAR] = 0.2,
                [v8.THREE_STAR] = 0.47,
                [v8.FOUR_STAR] = 0.2575,
                [v8.FIVE_STAR] = 0.06,
                [v8.SIX_STAR] = 0.0125
            }
        }
    },
    [v9.DIAMOND_LUCKY_CRATE] = {
        ["displayName"] = "Diamond Lucky Crate",
        ["image"] = "rbxassetid://15883494822",
        ["model"] = v3.Assets.Misc.DiamondLuckyCrate,
        ["consumableRequirement"] = v4.DIAMOND_LUCKY_CRATE,
        ["items"] = v11,
        ["raritySettings"] = {
            [v14.TIER_0] = {
                [v8.ONE_STAR] = 0.2,
                [v8.TWO_STAR] = 0.25,
                [v8.THREE_STAR] = 0.3,
                [v8.FOUR_STAR] = 0.15,
                [v8.FIVE_STAR] = 0.075,
                [v8.SIX_STAR] = 0.025
            },
            [v14.TIER_1] = {
                [v8.ONE_STAR] = 0.1,
                [v8.TWO_STAR] = 0.2,
                [v8.THREE_STAR] = 0.4,
                [v8.FOUR_STAR] = 0.18,
                [v8.FIVE_STAR] = 0.09,
                [v8.SIX_STAR] = 0.03
            },
            [v14.TIER_2] = {
                [v8.ONE_STAR] = 0,
                [v8.TWO_STAR] = 0.2,
                [v8.THREE_STAR] = 0.35,
                [v8.FOUR_STAR] = 0.3,
                [v8.FIVE_STAR] = 0.11,
                [v8.SIX_STAR] = 0.04
            },
            [v14.TIER_3] = {
                [v8.ONE_STAR] = 0,
                [v8.TWO_STAR] = 0.2,
                [v8.THREE_STAR] = 0.25,
                [v8.FOUR_STAR] = 0.35,
                [v8.FIVE_STAR] = 0.15,
                [v8.SIX_STAR] = 0.05
            }
        }
    },
    [v9.AFK_CRATE] = {
        ["displayName"] = "AFK Crate",
        ["image"] = v6.AFK_CRATE_RENDER,
        ["model"] = v3.Assets.Misc.AFKLuckyCrate,
        ["consumableRequirement"] = v4.AFK_CRATE,
        ["items"] = v10,
        ["raritySettings"] = {
            [v14.TIER_0] = {
                [v8.ONE_STAR] = 0.45,
                [v8.TWO_STAR] = 0.25,
                [v8.THREE_STAR] = 0.15,
                [v8.FOUR_STAR] = 0.0985,
                [v8.FIVE_STAR] = 0.05,
                [v8.SIX_STAR] = 0.0015
            },
            [v14.TIER_1] = {
                [v8.ONE_STAR] = 0.35,
                [v8.TWO_STAR] = 0.3,
                [v8.THREE_STAR] = 0.18,
                [v8.FOUR_STAR] = 0.1185,
                [v8.FIVE_STAR] = 0.05,
                [v8.SIX_STAR] = 0.0015
            },
            [v14.TIER_2] = {
                [v8.ONE_STAR] = 0.25,
                [v8.TWO_STAR] = 0.35,
                [v8.THREE_STAR] = 0.21,
                [v8.FOUR_STAR] = 0.1285,
                [v8.FIVE_STAR] = 0.06,
                [v8.SIX_STAR] = 0.0015
            },
            [v14.TIER_3] = {
                [v8.ONE_STAR] = 0.2,
                [v8.TWO_STAR] = 0.35,
                [v8.THREE_STAR] = 0.24,
                [v8.FOUR_STAR] = 0.1385,
                [v8.FIVE_STAR] = 0.07,
                [v8.SIX_STAR] = 0.0015
            }
        }
    },
    [v9.MURDER_CRATE] = {
        ["displayName"] = "Mystery Crate",
        ["image"] = "",
        ["model"] = v3.Assets.Misc.RewardCrate,
        ["items"] = {
            {
                ["amount"] = 1,
                ["itemType"] = v12.SLEEP_SPLASH_POTION,
                ["rarity"] = v8.TWO_STAR
            },
            {
                ["amount"] = 1,
                ["itemType"] = v12.PIE,
                ["rarity"] = v8.TWO_STAR
            },
            {
                ["amount"] = 1,
                ["itemType"] = v12.WOOD_SWORD,
                ["rarity"] = v8.THREE_STAR
            },
            {
                ["amount"] = 1,
                ["itemType"] = v12.WOOD_BOW,
                ["rarity"] = v8.THREE_STAR,
                ["extraItems"] = {
                    {
                        ["amount"] = 8,
                        ["itemType"] = v7.ARROW
                    }
                }
            }
        },
        ["raritySettings"] = {
            [v14.TIER_0] = {
                [v8.ONE_STAR] = 0.38,
                [v8.TWO_STAR] = 0.35,
                [v8.THREE_STAR] = 0.2,
                [v8.FOUR_STAR] = 0.05,
                [v8.FIVE_STAR] = 0.02,
                [v8.SIX_STAR] = 0
            },
            [v14.TIER_1] = {
                [v8.ONE_STAR] = 0.38,
                [v8.TWO_STAR] = 0.35,
                [v8.THREE_STAR] = 0.2,
                [v8.FOUR_STAR] = 0.05,
                [v8.FIVE_STAR] = 0.02,
                [v8.SIX_STAR] = 0
            },
            [v14.TIER_2] = {
                [v8.ONE_STAR] = 0.38,
                [v8.TWO_STAR] = 0.35,
                [v8.THREE_STAR] = 0.2,
                [v8.FOUR_STAR] = 0.05,
                [v8.FIVE_STAR] = 0.02,
                [v8.SIX_STAR] = 0
            },
            [v14.TIER_3] = {
                [v8.ONE_STAR] = 0.38,
                [v8.TWO_STAR] = 0.35,
                [v8.THREE_STAR] = 0.2,
                [v8.FOUR_STAR] = 0.05,
                [v8.FIVE_STAR] = 0.02,
                [v8.SIX_STAR] = 0
            }
        }
    }
}
local v16 = v9.KITSKIN_CRATE
local v17 = {
    ["displayName"] = "Kit Skin Crate",
    ["image"] = v6.KIT_SKIN_CRATE,
    ["model"] = v3.Assets.Misc.KitSkinCrate,
    ["consumableRequirement"] = v4.KITSKIN_CRATE
}
local v18 = 0
local v19 = {}
for v20, v21 in v2.entries(v5) do
    local _ = v20 - 1
    local v22 = v21[1]
    local v23 = v21[2].product ~= nil and {
        ["amount"] = 1,
        ["itemType"] = v22,
        ["rarity"] = v8.SIX_STAR
    } or nil
    if v23 ~= nil then
        v18 = v18 + 1
        v19[v18] = v23
    end
end
v17.items = v19
v17.raritySettings = {
    [v14.TIER_0] = {
        [v8.ONE_STAR] = 0,
        [v8.TWO_STAR] = 0,
        [v8.THREE_STAR] = 0,
        [v8.FOUR_STAR] = 0,
        [v8.FIVE_STAR] = 0,
        [v8.SIX_STAR] = 1
    },
    [v14.TIER_1] = {
        [v8.ONE_STAR] = 0,
        [v8.TWO_STAR] = 0,
        [v8.THREE_STAR] = 0,
        [v8.FOUR_STAR] = 0,
        [v8.FIVE_STAR] = 0,
        [v8.SIX_STAR] = 1
    },
    [v14.TIER_2] = {
        [v8.ONE_STAR] = 0,
        [v8.TWO_STAR] = 0,
        [v8.THREE_STAR] = 0,
        [v8.FOUR_STAR] = 0,
        [v8.FIVE_STAR] = 0,
        [v8.SIX_STAR] = 1
    },
    [v14.TIER_3] = {
        [v8.ONE_STAR] = 0,
        [v8.TWO_STAR] = 0,
        [v8.THREE_STAR] = 0,
        [v8.FOUR_STAR] = 0,
        [v8.FIVE_STAR] = 0,
        [v8.SIX_STAR] = 1
    }
}
v15[v16] = v17
return {
    ["AltarUpgradeTier"] = v14,
    ["CrateMeta"] = v15
}