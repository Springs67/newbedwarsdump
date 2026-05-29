local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").EmoteAssets
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType
local v15 = {
    [v14.HOLIDAY_BUNDLE_2021] = {
        ["name"] = "Holiday Bundle 2021",
        ["price"] = 1499,
        ["image"] = v3[v7.LUCKY_GIFT],
        ["gamepassId"] = v13.HOLIDAY_BUNDLE_2021,
        ["devProductId"] = v12.HOLIDAY_BUNDLE_2021_GIFT,
        ["rewards"] = {},
        ["disabled"] = true
    },
    [v14.LUNAR_BUNDLE_2022] = {
        ["name"] = "Lunar Bundle 2022",
        ["price"] = 999,
        ["image"] = "rbxassetid://8666432622",
        ["disabled"] = true,
        ["gamepassId"] = v13.LUNAR_BUNDLE_2022,
        ["devProductId"] = v12.LUNAR_NEW_YEAR_BUNDLE_2022_GIFT,
        ["rewards"] = {}
    },
    [v14.MINER_BUNDLE] = {
        ["name"] = "Miner Bundle",
        ["price"] = 899,
        ["image"] = "rbxassetid://8936489137",
        ["disabled"] = true,
        ["gamepassId"] = v13.MINER_BUNDLE,
        ["devProductId"] = v12.MINER_BUNDLE_GIFT,
        ["rewards"] = {}
    },
    [v14.EMBER_LUMEN_KIT_BUNDLE] = {
        ["name"] = "Ember & Lumen Kit Bundle",
        ["price"] = 999,
        ["image"] = "rbxassetid://9630018755",
        ["limitedTimeEndTime"] = 0,
        ["disabled"] = true,
        ["gamepassId"] = v13.EMBER_LUMEN_KIT_BUNDLE,
        ["devProductId"] = v12.EMBER_LUMEN_KIT_BUNDLE,
        ["rewards"] = {},
        ["kitShopBundle"] = {
            ["name"] = "Ember & Lumen Kit Bundle",
            ["image"] = "rbxassetid://9630018755",
            ["description"] = "Purchase this limited time bundle to unlock the following:\n\226\152\128\239\184\143\194\160<b>LUMEN (Kit)</b>\n\240\159\148\165\194\160<b>EMBER (Kit)</b>\n- Unlocks limited lobby titles: <font color=\"rgb(140, 5, 56)\"><b>Infernal \240\159\148\165</b></font> & <font color=\"rgb(242, 209, 0)\"><b>Light \240\159\148\133</b></font>\n- Unlocks limited time lobby gadgets: Infernal Saber & Light Sword\n",
            ["disabled"] = true
        }
    }
}
local v16 = v14.EMBER_LUMEN_KIT_BUNDLE_PERM
local v17 = {
    ["name"] = "Ember & Lumen Kit Bundle",
    ["price"] = 799,
    ["image"] = "rbxassetid://9630018755",
    ["disabled"] = false,
    ["gamepassId"] = v13.EMBER_LUMEN_KIT_BUNDLE_PERM,
    ["devProductId"] = v12.EMBER_LUMEN_KIT_BUNDLE_PERM,
    ["rewards"] = {
        {
            ["kit"] = v6.EMBER
        },
        {
            ["kit"] = v6.LUMEN
        }
    },
    ["kitShopBundle"] = {
        ["name"] = "Ember & Lumen Kit Bundle",
        ["image"] = "rbxassetid://9630018755",
        ["description"] = "This bundle unlocks the following:\n\226\152\128\239\184\143\194\160<b>LUMEN (Kit)</b>\n\240\159\148\165\194\160<b>EMBER (Kit)</b>"
    },
    ["storeUI"] = {
        ["disableDisplay"] = true
    }
}
v15[v16] = v17
v15[v14.EVELYNN_BUNDLE] = {
    ["name"] = "Evelynn Bundle",
    ["price"] = 999,
    ["image"] = "rbxassetid://10406984466",
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true,
    ["gamepassId"] = v13.EVELYNN_BUNDLE,
    ["devProductId"] = v12.EVELYNN_BUNDLE,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Evelynn Bundle",
        ["image"] = "rbxassetid://10406984466",
        ["description"] = "This bundle unlocks the following:\n\240\159\151\161\239\184\143\194\160<b>Evelynn (Kit)</b>\n\240\159\140\136\194\160<b>Prismatic Evelynn (Kit Skin)</b>",
        ["disabled"] = true
    }
}
v15[v14.HANNAH_BUNDLE] = {
    ["name"] = "Hannah Bundle",
    ["price"] = 999,
    ["image"] = "rbxassetid://10726577232",
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true,
    ["gamepassId"] = v13.HANNAH_BUNDLE,
    ["devProductId"] = v12.HANNAH_BUNDLE,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Hannah Bundle",
        ["image"] = "rbxassetid://10726577232",
        ["description"] = "This bundle unlocks the following:\n\240\159\143\180\226\128\141\226\152\160\239\184\143\194\160<b>Hannah (Kit)</b>\n\240\159\145\187\194\160<b>Ghost Hannah (Kit Skin)</b>\n\240\159\143\180\226\128\141\226\152\160\239\184\143\194\160<b>Corsair (Title)</b>\n\240\159\151\161\239\184\143\194\160<b>Ghost Cutlass (Lobby Gadget)</b>\n\240\159\151\161\239\184\143\194\160<b>Ghosted Hannah (Emote)</b>",
        ["disabled"] = true
    }
}
v15[v14.HOLIDAY_BUNDLE_2022] = {
    ["name"] = "Holiday Bundle 2022",
    ["price"] = 1499,
    ["image"] = v3[v7.LUCKY_GIFT],
    ["gamepassId"] = v13.HOLIDAY_BUNDLE_2022,
    ["devProductId"] = v12.HOLIDAY_BUNDLE_2022,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Holiday Bundle 2022",
        ["image"] = "rbxassetid://11902803137",
        ["description"] = "\240\159\144\159 Sheila kit (Limited)\n\240\159\167\138 Winter Miner skin + Miner kit\n\240\159\142\132 Christmas ElderTree skin + ElderTree kit\n\240\159\170\162 Wrapped Up kill effect (Limited)\n\240\159\167\138 Ice Block kill effect (Limited)\n\240\159\166\164 Dodo bird mount lobby gadget (Limited)\n\240\159\143\183\239\184\143 \226\128\156Iced Out\226\128\157 & \226\128\156Bing Chilling \240\159\165\182\240\159\141\167\226\128\157 lobby titles (Limited)",
        ["disabled"] = true
    },
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true
}
v15[v14.HOLIDAY_BUNDLE_2023] = {
    ["name"] = "Holiday Bundle 2023",
    ["price"] = 1499,
    ["image"] = "rbxassetid://15715067677",
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true,
    ["gamepassId"] = v13.HOLIDAY_BUNDLE_2023,
    ["devProductId"] = v12.HOLIDAY_BUNDLE_2023,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Holiday Bundle 2023",
        ["image"] = "rbxassetid://15715067677",
        ["description"] = "\226\155\132 Sigrid kit (Limited)\n\240\159\148\148 Krampus Ember skin + Ember kit + Lumen kit (Not Limited)\n\226\157\132\239\184\143 Frost Queen Lyla skin + Lyla kit (Not Limited)\n\240\159\146\165 Antler Strike kill effect (Limited)\n\240\159\154\130 Train win effect (Limited)\n\240\159\142\160 Elk mount lobby gadget (Limited)\n\240\159\143\183\239\184\143 \226\128\156Blizzard\226\128\157 & \226\128\156\240\159\142\129\226\128\157 lobby titles (Limited)",
        ["disabled"] = true
    }
}
v15[v14.LUNAR_BUNDLE_2024] = {
    ["name"] = "Lunar Bundle 2024",
    ["price"] = 799,
    ["image"] = "rbxassetid://16216065184",
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true,
    ["gamepassId"] = v13.LUNAR_BUNDLE_2024,
    ["devProductId"] = v12.LUNAR_BUNDLE_2024_GIFT,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Lunar Bundle 2024",
        ["image"] = "rbxassetid://16216065184",
        ["description"] = "\240\159\151\161\239\184\143 Lian Kit (Not Limited)\n\240\159\144\137 Lian Lunar Dragon Kit Skin (Not Limited)\n2 Titles (Limited)\n2 Emotes (Limited)\n",
        ["disabled"] = true
    }
}
v15[v14.MARINA_BUNDLE] = {
    ["name"] = "Marina Kit Bundle",
    ["price"] = 999,
    ["image"] = "rbxassetid://18136489107",
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true,
    ["gamepassId"] = v13.MARINA_BUNDLE,
    ["devProductId"] = v12.MARINA_BUNDLE,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Marina Kit Bundle",
        ["image"] = "rbxassetid://18136489107",
        ["description"] = "\240\159\146\167 Marina Kit (Not Limited)\n\240\159\140\136 Prismatic Marina Kit Skin (Limited)\n\240\159\143\132 1 Jellyfish Mount Lobby Gadget (Limited)\n\240\159\144\154 1 Title (Limited)\n\240\159\140\138 2 Emotes (Limited)",
        ["disabled"] = true
    }
}
v15[v14.HOLIDAY_BUNDLE_2024] = {
    ["name"] = "Holiday Bundle 2024",
    ["price"] = 1499,
    ["image"] = "rbxassetid://89254775707991",
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true,
    ["gamepassId"] = v13.HOLIDAY_BUNDLE_2024,
    ["devProductId"] = v12.HOLIDAY_BUNDLE_2024,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Holiday Bundle 2024 Bundle",
        ["image"] = "rbxassetid://89254775707991",
        ["description"] = "\240\159\146\167 Krystal Kit (Limited)\n\240\159\151\161\239\184\143 Festive Lumen (Not Limited)\n\240\159\142\129 Jovial Wren (Not Limited)\n\240\159\155\183 Flying Sleigh Lobby Gadget (Limited)\n\240\159\142\132 Christmas Tree Sitting Area Lobby Gadget (Limited)\n\226\157\132\239\184\143 Snow Globe Kill Effect (Limited)\n\240\159\141\170 Gingerbread Kill Effect (Limited)\n\240\159\148\165 Firewood Bed Break Effect (Limited)\n\240\159\143\149\239\184\143 Roasting Marshmallows Emote (Limited)\n\226\155\184\239\184\143 Ice Skating Emote (Limited)\n\226\155\184\239\184\143 Ice Skater Title (Limited)\n\226\152\128\239\184\143 Lumen Kit\n\240\159\143\170 Wren Kit\n",
        ["disabled"] = true
    }
}
v15[v14.TRIXIE_BUNDLE] = {
    ["name"] = "Trixie Bundle",
    ["price"] = 999,
    ["image"] = "rbxassetid://120144852837829",
    ["limitedTimeEndTime"] = 0,
    ["disabled"] = true,
    ["gamepassId"] = v13.TRIXIE_BUNDLE,
    ["devProductId"] = v12.TRIXIE_BUNDLE,
    ["rewards"] = {},
    ["kitShopBundle"] = {
        ["name"] = "Trixie Bundle",
        ["image"] = "rbxassetid://120144852837829",
        ["description"] = "This bundle unlocks the following:\n\240\159\146\156\194\160<b>Trixie (Kit)</b>\n\240\159\164\161\194\160<b>Harlequin Trixie (Kit Skin)</b>\n\240\159\143\183\239\184\143\194\160<b>Trickster (Title)</b>\n\240\159\150\188\239\184\143\194\160<b>Trixie Clown (Emote)</b>\240\159\150\188\239\184\143\194\160<b>Trixie Peek (Emote)</b>",
        ["disabled"] = true
    }
}
local v18 = v14.NEW_PLAYER_BUNDLE
local v19 = {
    ["name"] = "New Player Bundle",
    ["price"] = 149,
    ["image"] = "rbxassetid://98588353197933",
    ["disabled"] = false,
    ["devProductId"] = v12.NEW_PLAYER_BUNDLE
}
local v20 = {}
local v21 = {
    ["kit"] = v6.AXOLOTL
}
local v22 = {
    ["kit"] = v6.BUILDER
}
local v23 = {
    ["kit"] = v6.ARCHER
}
local v24 = {
    ["title"] = v10.SHARP
}
local v25 = {
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.BATTLE_PASS_2X
    }
}
local v26 = {
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.KIT_RENTAL_NORMAL
    }
}
__set_list(v20, 1, {v21, v22, v23, v24, v25, v26})
v19.rewards = v20
v15[v18] = v19
local v27 = v14.ZARRAH_BUNDLE
local v28 = {
    ["name"] = "Zarrah Kit Bundle",
    ["price"] = 899,
    ["originalPrice"] = 1379,
    ["image"] = "rbxassetid://131296802705215",
    ["disabled"] = true,
    ["devProductId"] = v12.ZARRAH_BUNDLE,
    ["rewards"] = {
        {
            ["kit"] = v6.GUN_BLADE
        },
        {
            ["kitSkin"] = v5.GUN_BLADE_SUMMER
        },
        {
            ["lobbyGadget"] = v9.DIAMOND_GUN_BLADE
        },
        {
            ["emote"] = v7.ZARRAH_SUMMER_RAD
        },
        {
            ["title"] = v10.GILDED
        }
    },
    ["kitShopBundle"] = {
        ["name"] = "Zarrah Kit Bundle",
        ["image"] = "rbxassetid://131296802705215",
        ["description"] = "This bundle unlocks the following:\n\240\159\148\147\194\160<b>Zarrah (Kit)</b>\n\240\159\148\147\194\160<b>Riptide Zarrah (Kit Skin)</b>\n\240\159\148\147\194\160<b>Gilded (Title)</b>\n\240\159\148\147\194\160<b>Zarrah Rad (Emote)</b>\n\240\159\148\147\194\160<b>Cutlass and Blunderbuss (Lobby Gadget)</b>",
        ["disabled"] = true
    },
    ["storeUI"] = {
        ["displayOrder"] = 1,
        ["rippleEffect"] = true,
        ["backgroundGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 138, 166)), ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 131, 254)) })
    }
}
v15[v27] = v28
local v29 = v14.BED_SKINS_RELEASE
local v30 = {
    ["name"] = "Bed Skins Release Bundle",
    ["price"] = 249,
    ["image"] = "rbxassetid://131633843404379",
    ["limitedTimeEndTime"] = 1761343200,
    ["originalPrice"] = 549,
    ["disabled"] = true,
    ["devProductId"] = v12.BED_SKIN_RELEASE,
    ["rewards"] = {
        {
            ["bedSkin"] = v4.RACECAR_BED
        },
        {
            ["bedSkin"] = v4.BED_SKETCH
        },
        {
            ["title"] = v10.BED_EMOJI
        }
    }
}
v15[v29] = v30
local v31 = v14.HOLIDAY_BUNDLE_2025
local v32 = {
    ["name"] = "\240\159\142\129 Holiday Bundle 2025",
    ["price"] = 1499,
    ["originalPrice"] = 4569,
    ["image"] = "rbxassetid://83274578564074",
    ["limitedTimeEndTime"] = 1767999600,
    ["disabled"] = true,
    ["devProductId"] = v12.HOLIDAY_BUNDLE_2025,
    ["rewards"] = {
        {
            ["kit"] = v6.ICE_MAGE
        },
        {
            ["kitSkin"] = v5.TALIYAH_PENGUIN_QUEEN
        },
        {
            ["kitSkin"] = v5.SNOW_OWL_ADETUNDE
        },
        {
            ["kit"] = v6.TALIYAH
        },
        {
            ["kit"] = v6.FROSTY_HAMMER
        },
        {
            ["bedCoins"] = 12000
        },
        {
            ["killEffect"] = v8.AURORA_BLAST
        },
        {
            ["winEffect"] = v11.SNOWBOARDER
        },
        {
            ["bedSkin"] = v4.BED_PRESENT
        },
        {
            ["bedSkin"] = v4.BED_SLEIGH
        },
        {
            ["lobbyGadget"] = v9.ICE_MAGE_STAFF
        },
        {
            ["emote"] = v7.SOPHIA_BRO
        },
        {
            ["emote"] = v7.HAPPY_SOPHIA
        },
        {
            ["title"] = v10.AURORA
        },
        {
            ["title"] = v10.ICE_MAIDEN
        }
    },
    ["kitShopBundle"] = {
        ["name"] = "Holiday Bundle 2025",
        ["image"] = "rbxassetid://83274578564074",
        ["description"] = "\226\157\132\239\184\143 Sophia Kit \n\240\159\148\168 Snow Owl Adetunde \n\226\152\128\239\184\143 Adetunde Kit\n\240\159\144\167 Penguin Queen Taliyah \n\240\159\144\163 Taliyah Kit\n\240\159\167\138 Freezing Staff Lobby Gadget \n\240\159\143\130 Snowboarder Win Effect \n\240\159\148\174 Aurora Blast Kill Effect \n\240\159\155\183 Sleigh Bed Skin \n\240\159\142\132 Festive Bed Skin \n\226\155\184\239\184\143 2 Image Emotes \n\226\155\184\239\184\143 2 Titles \n\240\159\170\153 12,000 Bed Coins \n",
        ["disabled"] = true
    },
    ["storeUI"] = {
        ["disableDisplay"] = true,
        ["displayOrder"] = 1,
        ["rippleEffect"] = true,
        ["backgroundGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 138, 166)), ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 131, 254)) })
    }
}
v15[v31] = v32
local v33 = v14.DARK_HEART_SWORDS
local v34 = {
    ["name"] = "Dark Heart Skin Bundle",
    ["price"] = 999,
    ["limitedTimeEndTime"] = 1772233200,
    ["originalPrice"] = 1349,
    ["disabled"] = false,
    ["devProductId"] = v12.DARK_HEART_SKINS,
    ["rewards"] = {
        {
            ["itemSkin"] = v4.DARKVALENTINE_WOOD_SWORD
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_STONE_SWORD
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_IRON_SWORD
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_DIAMOND_SWORD
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_EMERALD_SWORD
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_WOOD_AXE
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_STONE_AXE
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_IRON_AXE
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_DIAMOND_AXE
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_WOOD_PICKAXE
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_STONE_PICKAXE
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_IRON_PICKAXE
        },
        {
            ["itemSkin"] = v4.DARKVALENTINE_DIAMOND_PICKAXE
        }
    },
    ["storeUI"] = {
        ["displayOrder"] = 1,
        ["rippleEffect"] = true,
        ["disableDisplay"] = false,
        ["backgroundGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 138, 166)), ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 131, 254)) })
    }
}
v15[v33] = v34
local v35 = v14.WARRIOR_BUNDLE
local v36 = {
    ["name"] = "Warrior Kit Bundle",
    ["price"] = 999,
    ["originalPrice"] = 1390,
    ["image"] = "rbxassetid://82852184334293",
    ["disabled"] = false,
    ["devProductId"] = v12.WARRIOR_BUNDLE,
    ["rewards"] = {
        {
            ["kit"] = v6.WARRIOR
        },
        {
            ["kitSkin"] = v5.ICE_VIKING_WARRIOR
        }
    },
    ["kitShopBundle"] = {
        ["name"] = "Warrior Kit Bundle",
        ["image"] = "rbxassetid://82852184334293",
        ["description"] = "This bundle unlocks the following:\n\240\159\148\147\194\160<b>Warrior (Kit)</b>\n\240\159\148\147\194\160<b>Ice Viking Warrior (Kit Skin)</b>",
        ["disabled"] = false
    },
    ["storeUI"] = {
        ["displayOrder"] = 1,
        ["rippleEffect"] = true,
        ["backgroundGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(107, 163, 227)) })
    }
}
v15[v35] = v36
return {
    ["BundleMeta"] = v15
}