local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local v14 = v13.Consumable
local v15 = v13.ConsumableCategory
local v16 = v13.ConsumableType
local function v38(u17) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    local v18 = u2.entries(u7)
    local function v32(p19) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local v20 = p19[1]
        local v21 = p19[2]
        local v22 = v21.limitedTime
        local v23 = v21.battlepassSeason ~= nil and true or v21.unlockedInBattlePass
        if v21.disableKitRenting or v21.freeKit then
            return nil
        else
            local v24 = u17
            if v24 ~= nil then
                v24 = v24.includeLimiteds
            end
            local v25 = not v24
            if not v25 then
                v22 = v25
            end
            if v22 then
                return nil
            else
                local v26 = u17
                if v26 ~= nil then
                    v26 = v26.includeBattlePass
                end
                local v27 = not v26
                if v27 then
                    v27 = v23
                end
                if v27 then
                    return nil
                else
                    local v28 = u17
                    if v28 ~= nil then
                        v28 = v28.onlyBattlePass
                    end
                    if v28 then
                        v28 = not v23
                    end
                    if v28 then
                        return nil
                    else
                        local v29 = u17
                        if v29 ~= nil then
                            v29 = v29.kitClass
                        end
                        if v29 ~= 0 and (v29 == v29 and v29) then
                            local v30 = v21.kitClass
                            local v31 = u17
                            if v31 ~= nil then
                                v31 = v31.kitClass
                            end
                            v29 = v30 ~= v31
                        end
                        if v29 == 0 or (v29 ~= v29 or not v29) then
                            return v20
                        else
                            return nil
                        end
                    end
                end
            end
        end
    end
    local v33 = 0
    local v34 = {}
    for v35, v36 in v18 do
        local v37 = v32(v36, v35 - 1, v18)
        if v37 ~= nil then
            v33 = v33 + 1
            v34[v33] = v37
        end
    end
    return v34
end
local u39 = {
    [v14.BATTLE_PASS_1_5X] = {
        ["displayName"] = "1.5x BattlePass XP Boost",
        ["description"] = "Boosts the battlepass xp of your next (3 matches)",
        ["maxMatchUses"] = 3,
        ["stackMaxMatchUses"] = true,
        ["xpMultiplier"] = 1.5,
        ["category"] = v15.BATTLE_PASS_XP,
        ["image"] = v9.XP_BOOST,
        ["displayInLocker"] = {
            ["merge"] = true,
            ["usable"] = true
        },
        ["rarity"] = v11.ONE_STAR
    },
    [v14.BATTLE_PASS_2X] = {
        ["displayName"] = "2x BattlePass XP Boost",
        ["description"] = "Boosts the battlepass xp of your next (3 matches)",
        ["maxMatchUses"] = 3,
        ["stackMaxMatchUses"] = true,
        ["xpMultiplier"] = 2,
        ["category"] = v15.BATTLE_PASS_XP,
        ["image"] = v9.XP_BOOST,
        ["displayInLocker"] = {
            ["merge"] = true,
            ["usable"] = true
        },
        ["rarity"] = v11.TWO_STAR
    },
    [v14.BATTLE_PASS_3X] = {
        ["displayName"] = "3x BattlePass XP Boost",
        ["description"] = "Boosts the battlepass xp of your next (3 matches)",
        ["maxMatchUses"] = 3,
        ["stackMaxMatchUses"] = true,
        ["xpMultiplier"] = 3,
        ["category"] = v15.BATTLE_PASS_XP,
        ["image"] = v9.XP_BOOST,
        ["displayInLocker"] = {
            ["merge"] = true,
            ["usable"] = true
        },
        ["rarity"] = v11.FOUR_STAR
    },
    [v14.ARMOR_TRIM_1_5X] = {
        ["displayName"] = "1.5x Armor Trim XP Boost",
        ["description"] = "Boosts the armor trim xp of your next (5 matches)",
        ["maxMatchUses"] = 5,
        ["stackMaxMatchUses"] = false,
        ["xpMultiplier"] = 1.5,
        ["timeToExpiration"] = 1209600,
        ["category"] = v15.ARMOR_TRIM_XP,
        ["image"] = v9.ARMOR_TRIM_XP_BOOST,
        ["displayInLocker"] = {
            ["usable"] = true
        },
        ["rarity"] = v11.TWO_STAR
    },
    [v14.ARMOR_TRIM_2X] = {
        ["displayName"] = "2x Armor Trim XP Boost",
        ["description"] = "Boosts the armor trim xp of your next (5 matches)",
        ["maxMatchUses"] = 5,
        ["stackMaxMatchUses"] = false,
        ["xpMultiplier"] = 2,
        ["timeToExpiration"] = 1209600,
        ["category"] = v15.ARMOR_TRIM_XP,
        ["image"] = v9.ARMOR_TRIM_XP_BOOST,
        ["displayInLocker"] = {
            ["usable"] = true
        },
        ["rarity"] = v11.THREE_STAR
    },
    [v14.ARMOR_TRIM_3X] = {
        ["displayName"] = "3x Armor Trim XP Boost",
        ["description"] = "Boosts the armor trim xp of your next (5 matches)",
        ["maxMatchUses"] = 5,
        ["stackMaxMatchUses"] = false,
        ["xpMultiplier"] = 3,
        ["timeToExpiration"] = 1209600,
        ["category"] = v15.ARMOR_TRIM_XP,
        ["image"] = v9.ARMOR_TRIM_XP_BOOST,
        ["displayInLocker"] = {
            ["usable"] = true
        },
        ["rarity"] = v11.FOUR_STAR
    },
    [v14.KIT_RENTAL_ALL_7] = {
        ["displayName"] = "Kit Rental Ticket (ANY)",
        ["description"] = "Unlocks any kit for (3 days), excluding limited time kits from bundles. Usable in the kit shop",
        ["activeDuration"] = 259200,
        ["category"] = v15.KIT_RENTAL,
        ["rentableKits"] = v38({
            ["includeBattlePass"] = true,
            ["includeLimiteds"] = true
        }),
        ["image"] = v9.KIT_RENTAL_PASS_ALL,
        ["displayInLocker"] = {
            ["merge"] = true,
            ["usable"] = false
        },
        ["rarity"] = v11.FIVE_STAR
    },
    [v14.KIT_RENTAL_BATTLEPASS_7] = {
        ["displayName"] = "Kit Rental Ticket (BattlePass)",
        ["description"] = "Unlocks a Battle Pass kit for (3 days), excluding kits from the current Battle Pass Season. Usable in the kit shop",
        ["activeDuration"] = 259200,
        ["image"] = "rbxassetid://12925108145",
        ["category"] = v15.KIT_RENTAL,
        ["rentableKits"] = v38({
            ["includeBattlePass"] = true,
            ["onlyBattlePass"] = true
        }),
        ["displayInLocker"] = {
            ["merge"] = true,
            ["usable"] = false
        },
        ["rarity"] = v11.FOUR_STAR
    }
}
local v40 = v14.KIT_RENTAL_DEFENDER_7
local v41 = {
    ["displayName"] = "Kit Rental Ticket (Defender)",
    ["description"] = "Unlocks any non-battlepass Defender kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610212",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.DEFENDER
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v40] = v41
local v42 = v14.KIT_RENTAL_ECONOMY_7
local v43 = {
    ["displayName"] = "Kit Rental Ticket (Economy)",
    ["description"] = "Unlocks any non-battlepass Economy kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284609902",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.ECONOMY
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v42] = v43
local v44 = v14.KIT_RENTAL_FIGHTER_7
local v45 = {
    ["displayName"] = "Kit Rental Ticket (Fighter)",
    ["description"] = "Unlocks any non-battlepass Fighter kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610380",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.FIGHTER
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v44] = v45
local v46 = v14.KIT_RENTAL_MOVEMENT_7
local v47 = {
    ["displayName"] = "Kit Rental Ticket (Movement)",
    ["description"] = "Unlocks any non-battlepass Movement kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610107",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.MOVEMENT
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v46] = v47
local v48 = v14.KIT_RENTAL_SUPPORT_7
local v49 = {
    ["displayName"] = "Kit Rental Ticket (Support)",
    ["description"] = "Unlocks any non-battlepass Support kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284609758",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.SUPPORT
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v48] = v49
local v50 = v14.KIT_RENTAL_TANK_7
local v51 = {
    ["displayName"] = "Kit Rental Ticket (Tank)",
    ["description"] = "Unlocks any non-battlepass Tank kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610292",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.TANK
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v50] = v51
local v52 = v14.KIT_RENTAL_DESTROYER_7
local v53 = {
    ["displayName"] = "Kit Rental Ticket (Destroyer)",
    ["description"] = "Unlocks any non-battlepass Destroyer kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610017",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.DESTROYER
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v52] = v53
local v54 = v14.KIT_RENTAL_RANGED_7
local v55 = {
    ["displayName"] = "Kit Rental Ticket (Ranged)",
    ["description"] = "Unlocks any non-battlepass Ranged kit for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12510116571",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["kitClass"] = v8.RANGED
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v54] = v55
u39[v14.KIT_RENTAL_GRIM_REAPER] = {
    ["displayName"] = "Kit Rental Ticket (Grim Reaper)",
    ["description"] = "Unlocks Grim Reaper for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12510116571",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = { v6.GRIM_REAPER },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_INFERNAL_SHIELDER] = {
    ["displayName"] = "Kit Rental Ticket (Infernal Shielder)",
    ["description"] = "Unlocks Infernal Shielder for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610292",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = { v6.SHIELDER },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_AGNI] = {
    ["displayName"] = "Kit Rental Ticket (Agni)",
    ["description"] = "Unlocks Agni for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610107",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = { v6.AGNI },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_PYRO] = {
    ["displayName"] = "Kit Rental Ticket (Pyro)",
    ["description"] = "Unlocks Pyro for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://12284610380",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = { v6.PYRO },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_FREIYA] = {
    ["displayName"] = "Kit Rental Ticket (Freiya)",
    ["description"] = "Unlocks Freiya for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://99590202643099",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = { v6.ICE_QUEEN },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_YETI] = {
    ["displayName"] = "Kit Rental Ticket (YETI)",
    ["description"] = "Unlocks Yeti for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://136923206161648",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = { v6.YETI },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_FROSTY] = {
    ["displayName"] = "Kit Rental Ticket (Frosty)",
    ["description"] = "Unlocks Frosty for (3 days). Usable in the kit shop",
    ["activeDuration"] = 259200,
    ["image"] = "rbxassetid://121673995464093",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = { v6.FROSTY },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.AUTO_COMPLETE_DAILY_MISSION_TICKET] = {
    ["displayName"] = "Auto-Complete Daily Mission Ticket",
    ["description"] = "Automatically completes any daily mission.",
    ["category"] = v15.MISSION_TICKET,
    ["image"] = v9.MISSION_TICKET_DAILY,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.TWO_STAR
}
u39[v14.AUTO_COMPLETE_WEEKLY_MISSION_TICKET] = {
    ["displayName"] = "Auto-Complete Weekly Mission Ticket",
    ["description"] = "Automatically completes any weekly mission.",
    ["category"] = v15.MISSION_TICKET,
    ["image"] = v9.MISSION_TICKET_WEEKLY,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.LEVEL_UP_CRATE] = {
    ["displayName"] = "Lucky Crate",
    ["description"] = "Use this crate at the golden altars in the lobby to unlock rewards! You earn a new lucky crate on every player level up.",
    ["category"] = v15.REWARD_CRATE,
    ["crateType"] = v12.LEVEL_UP_CRATE,
    ["image"] = v9.LUCKY_CRATE_RENDER,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.TWO_STAR
}
u39[v14.DIAMOND_LUCKY_CRATE] = {
    ["displayName"] = "Diamond Lucky Crate",
    ["description"] = "Use this crate at the golden altars in the lobby to unlock rewards! You earn this every 5 levels.",
    ["category"] = v15.REWARD_CRATE,
    ["crateType"] = v12.DIAMOND_LUCKY_CRATE,
    ["image"] = v9.DIAMOND_LUCKY_CRATE_RENDER,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.AFK_CRATE] = {
    ["displayName"] = "AFK Lucky Crate",
    ["description"] = "Use this crate at the golden altars in the lobby to unlock rewards! You earn this from afking in the afk area.",
    ["category"] = v15.REWARD_CRATE,
    ["crateType"] = v12.AFK_CRATE,
    ["image"] = v9.AFK_CRATE_RENDER,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_BEGINNER] = {
    ["displayName"] = "Kit Rental Ticket (Beginner)",
    ["description"] = "Unlocks a beginner kit for 7 days.",
    ["activeDuration"] = 604800,
    ["image"] = "rbxassetid://17686693427",
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = {
        v6.BARBARIAN,
        v6.ARCHER,
        v6.BUILDER,
        v6.FARMER_CLETUS
    },
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = true,
        ["useButtonText"] = "View Kits"
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KIT_RENTAL_NORMAL] = {
    ["displayName"] = "Kit Rental Ticket (Normal)",
    ["description"] = "Unlocks non-limited/battlepass kits of any class for 3 days.",
    ["activeDuration"] = 259200,
    ["category"] = v15.KIT_RENTAL,
    ["rentableKits"] = v38({
        ["includeBattlePass"] = false,
        ["includeLimiteds"] = false
    }),
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    },
    ["image"] = v9.KIT_RENTAL_SILVER_ANY_CLASS,
    ["rarity"] = v11.THREE_STAR
}
local v56 = v14.RED_ENVELOPE
local v57 = {
    ["displayName"] = "Red Envelope",
    ["description"] = "Open for LNY 2025 event currency!",
    ["image"] = "rbxassetid://107555109436355",
    ["category"] = v15.RED_ENVELOPE,
    ["redEnvelope"] = v3.Assets.Misc.FullRedEnvelope
}
local v58 = {}
local v59 = {}
local v60 = {
    ["weight"] = 60
}
local v61 = {}
local v62 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 50,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v61, 1, {v62})
v60.rewards = v61
local v63 = {
    ["weight"] = 30
}
local v64 = {}
local v65 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 100,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v64, 1, {v65})
v63.rewards = v64
local v66 = {
    ["weight"] = 10
}
local v67 = {}
local v68 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 300,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v67, 1, {v68})
v66.rewards = v67
__set_list(v59, 1, {v60, v63, v66})
__set_list(v58, 1, {v59})
v57.rewardTables = v58
v57.displayInLocker = {
    ["merge"] = true,
    ["usable"] = true,
    ["useButtonText"] = "Open Envelope"
}
v57.rarity = v11.TWO_STAR
u39[v56] = v57
local v69 = v14.RED_GOLD_ENVELOPE
local v70 = {
    ["displayName"] = "Red & Gold Envelope",
    ["description"] = "Open for event currency and more!",
    ["image"] = "rbxassetid://112452931528519",
    ["category"] = v15.RED_ENVELOPE,
    ["redEnvelope"] = v3.Assets.Misc.RedGoldEnvelope
}
local v71 = {}
local v72 = {}
local v73 = {
    ["weight"] = 60
}
local v74 = {}
local v75 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 150,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v74, 1, {v75})
v73.rewards = v74
local v76 = {
    ["weight"] = 30
}
local v77 = {}
local v78 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 300,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v77, 1, {v78})
v76.rewards = v77
local v79 = {
    ["weight"] = 10
}
local v80 = {}
local v81 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 1000,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v80, 1, {v81})
v79.rewards = v80
__set_list(v72, 1, {v73, v76, v79})
__set_list(v71, 1, {v72, {
    {
        ["weight"] = 60,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 25
            }
        }
    },
    {
        ["weight"] = 30,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 50
            }
        }
    },
    {
        ["weight"] = 10,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 150
            }
        }
    }
}})
v70.rewardTables = v71
v70.displayInLocker = {
    ["merge"] = true,
    ["usable"] = true,
    ["useButtonText"] = "Open Envelope"
}
v70.rarity = v11.TWO_STAR
u39[v69] = v70
local v82 = v14.GOLDEN_ENVELOPE
local v83 = {
    ["displayName"] = "Golden Envelope",
    ["description"] = "Open for event currency and even more!",
    ["image"] = "rbxassetid://116705481106448",
    ["category"] = v15.RED_ENVELOPE,
    ["redEnvelope"] = v3.Assets.Misc.FullGoldEnvelope
}
local v84 = {}
local v85 = {}
local v86 = {
    ["weight"] = 60
}
local v87 = {}
local v88 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 1000,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v87, 1, {v88})
v86.rewards = v87
local v89 = {
    ["weight"] = 30
}
local v90 = {}
local v91 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 3000,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v90, 1, {v91})
v89.rewards = v90
local v92 = {
    ["weight"] = 10
}
local v93 = {}
local v94 = {
    ["paid"] = false,
    ["eventCurrency"] = {
        ["amount"] = 5000,
        ["currency"] = v5.LNY_2025_CURRENCY
    }
}
__set_list(v93, 1, {v94})
v92.rewards = v93
__set_list(v85, 1, {v86, v89, v92})
local v95 = {}
local v96 = {
    ["weight"] = 60
}
local v97 = {}
local v98 = {
    ["paid"] = false,
    ["consumable"] = {
        ["consumableType"] = v16.BATTLE_PASS_2X
    }
}
__set_list(v97, 1, {v98})
v96.rewards = v97
local v99 = {
    ["weight"] = 30
}
local v100 = {}
local v101 = {
    ["paid"] = false,
    ["consumable"] = {
        ["consumableType"] = v16.AUTO_COMPLETE_DAILY_MISSION_TICKET
    }
}
__set_list(v100, 1, {v101})
v99.rewards = v100
local v102 = {
    ["weight"] = 10
}
local v103 = {}
local v104 = {
    ["paid"] = false,
    ["consumable"] = {
        ["consumableType"] = v16.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
    }
}
__set_list(v103, 1, {v104})
v102.rewards = v103
__set_list(v95, 1, {v96, v99, v102})
__set_list(v84, 1, {v85, {
    {
        ["weight"] = 60,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 100
            }
        }
    },
    {
        ["weight"] = 30,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 300
            }
        }
    },
    {
        ["weight"] = 10,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 1000
            }
        }
    }
}, v95})
v83.rewardTables = v84
v83.displayInLocker = {
    ["merge"] = true,
    ["usable"] = true,
    ["useButtonText"] = "Open Envelope"
}
v83.rarity = v11.TWO_STAR
u39[v82] = v83
local v105 = v14.LNY_2026_ENVELOPE
local v106 = {
    ["displayName"] = "Fire Horse Envelope (Tier 1)",
    ["description"] = "Open for rewards!",
    ["category"] = v15.RED_ENVELOPE,
    ["image"] = v9.LNY2026_FIRE_HORSE_RED_GOLD_ENVELOPE,
    ["redEnvelope"] = v3.Assets.Misc.RedGoldEnvelope_Horse
}
local v107 = {}
local v108 = {}
local v109 = {
    ["weight"] = 60
}
local v110 = {}
local v111 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 1000,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v110, 1, {v111})
v109.rewards = v110
local v112 = {
    ["weight"] = 30
}
local v113 = {}
local v114 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 2500,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v113, 1, {v114})
v112.rewards = v113
local v115 = {
    ["weight"] = 10
}
local v116 = {}
local v117 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 5000,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v116, 1, {v117})
v115.rewards = v116
__set_list(v108, 1, {v109, v112, v115})
__set_list(v107, 1, {v108, {
    {
        ["weight"] = 60,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 25
            }
        }
    },
    {
        ["weight"] = 30,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 50
            }
        }
    },
    {
        ["weight"] = 10,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 150
            }
        }
    }
}})
v106.rewardTables = v107
v106.displayInLocker = {
    ["merge"] = true,
    ["usable"] = true,
    ["useButtonText"] = "Open Envelope"
}
v106.rarity = v11.TWO_STAR
u39[v105] = v106
local v118 = v14.LNY_2026_ENVELOPE_2
local v119 = {
    ["displayName"] = "Fire Horse Envelope (Tier 2)",
    ["description"] = "Open for rewards!",
    ["category"] = v15.RED_ENVELOPE,
    ["image"] = v9.LNY2026_FIRE_HORSE_FULL_RED_ENVELOPE,
    ["redEnvelope"] = v3.Assets.Misc.FullRedEnvelope_Horse
}
local v120 = {}
local v121 = {}
local v122 = {
    ["weight"] = 40
}
local v123 = {}
local v124 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 2000,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v123, 1, {v124})
v122.rewards = v123
local v125 = {
    ["weight"] = 20
}
local v126 = {}
local v127 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 5000,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v126, 1, {v127})
v125.rewards = v126
local v128 = {
    ["weight"] = 10
}
local v129 = {}
local v130 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 10000,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v129, 1, {v130})
v128.rewards = v129
local v131 = {
    ["weight"] = 7.5
}
local v132 = {}
local v133 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.ARMOR_TRIM_1_5X
    }
}
__set_list(v132, 1, {v133})
v131.rewards = v132
local v134 = {
    ["weight"] = 5
}
local v135 = {}
local v136 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.ARMOR_TRIM_2X
    }
}
__set_list(v135, 1, {v136})
v134.rewards = v135
local v137 = {
    ["weight"] = 2.5
}
local v138 = {}
local v139 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.ARMOR_TRIM_3X
    }
}
__set_list(v138, 1, {v139})
v137.rewards = v138
local v140 = {
    ["weight"] = 7.5
}
local v141 = {}
local v142 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.BATTLE_PASS_1_5X
    }
}
__set_list(v141, 1, {v142})
v140.rewards = v141
local v143 = {
    ["weight"] = 5
}
local v144 = {}
local v145 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.BATTLE_PASS_2X
    }
}
__set_list(v144, 1, {v145})
v143.rewards = v144
local v146 = {
    ["weight"] = 2.5
}
local v147 = {}
local v148 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.BATTLE_PASS_3X
    }
}
__set_list(v147, 1, {v148})
v146.rewards = v147
__set_list(v121, 1, {v122, v125, v128, v131, v134, v137, v140, v143, v146})
__set_list(v120, 1, {v121, {
    {
        ["weight"] = 60,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 50
            }
        }
    },
    {
        ["weight"] = 30,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 100
            }
        }
    },
    {
        ["weight"] = 10,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["bedCoins"] = 300
            }
        }
    }
}})
v119.rewardTables = v120
v119.displayInLocker = {
    ["merge"] = true,
    ["usable"] = true,
    ["useButtonText"] = "Open Envelope"
}
v119.rarity = v11.TWO_STAR
u39[v118] = v119
local v149 = v14.LNY_2026_ENVELOPE_3
local v150 = {
    ["displayName"] = "Fire Horse Envelope (Tier 3)",
    ["description"] = "Open for rewards!",
    ["category"] = v15.RED_ENVELOPE,
    ["image"] = v9.LNY2026_FIRE_HORSE_FULL_GOLD_ENVELOPE,
    ["redEnvelope"] = v3.Assets.Misc.FullGoldEnvelope_Horse
}
local v151 = {}
local v152 = {}
local v153 = {
    ["weight"] = 60
}
local v154 = {}
local v155 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 3000,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v154, 1, {v155})
v153.rewards = v154
local v156 = {
    ["weight"] = 30
}
local v157 = {}
local v158 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 7500,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v157, 1, {v158})
v156.rewards = v157
local v159 = {
    ["weight"] = 10
}
local v160 = {}
local v161 = {
    ["paid"] = false,
    ["battlepassXP"] = {
        ["amount"] = 15000,
        ["battlepass"] = v4.LNY_2026
    }
}
__set_list(v160, 1, {v161})
v159.rewards = v160
__set_list(v152, 1, {v153, v156, v159})
local v162 = {}
local v163 = {
    ["weight"] = 3
}
local v164 = {}
local v165 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.KITSKIN_CRATE_FRAGMENT
    }
}
__set_list(v164, 1, {v165})
v163.rewards = v164
__set_list(v162, 1, {{
    ["weight"] = 57,
    ["rewards"] = {
        {
            ["paid"] = false,
            ["bedCoins"] = 75
        }
    }
}, {
    ["weight"] = 30,
    ["rewards"] = {
        {
            ["paid"] = false,
            ["bedCoins"] = 150
        }
    }
}, {
    ["weight"] = 10,
    ["rewards"] = {
        {
            ["paid"] = false,
            ["bedCoins"] = 450
        }
    }
}, v163})
local v166 = {}
local v167 = {
    ["weight"] = 25
}
local v168 = {}
local v169 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.ARMOR_TRIM_1_5X
    }
}
__set_list(v168, 1, {v169})
v167.rewards = v168
local v170 = {
    ["weight"] = 22
}
local v171 = {}
local v172 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.ARMOR_TRIM_2X
    }
}
__set_list(v171, 1, {v172})
v170.rewards = v171
local v173 = {
    ["weight"] = 3
}
local v174 = {}
local v175 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.ARMOR_TRIM_3X
    }
}
__set_list(v174, 1, {v175})
v173.rewards = v174
local v176 = {
    ["weight"] = 25
}
local v177 = {}
local v178 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.BATTLE_PASS_1_5X
    }
}
__set_list(v177, 1, {v178})
v176.rewards = v177
local v179 = {
    ["weight"] = 22
}
local v180 = {}
local v181 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.BATTLE_PASS_2X
    }
}
__set_list(v180, 1, {v181})
v179.rewards = v180
local v182 = {
    ["weight"] = 3
}
local v183 = {}
local v184 = {
    ["paid"] = false,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v16.BATTLE_PASS_3X
    }
}
__set_list(v183, 1, {v184})
v182.rewards = v183
__set_list(v166, 1, {v167, v170, v173, v176, v179, v182})
__set_list(v151, 1, {v152, v162, v166})
v150.rewardTables = v151
v150.displayInLocker = {
    ["merge"] = true,
    ["usable"] = true,
    ["useButtonText"] = "Open Envelope"
}
v150.rarity = v11.TWO_STAR
u39[v149] = v150
u39[v14.MINI_POTION] = {
    ["displayName"] = "Shrink Potion",
    ["description"] = "Shrink Potion",
    ["image"] = "rbxassetid://7911163448",
    ["category"] = v15.LOBBY_ITEM,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = true,
        ["useButtonText"] = "Retrieve From Locker",
        ["disableOpenSound"] = true
    },
    ["rarity"] = v11.ONE_STAR,
    ["giveItem"] = v10.SHRINK_POTION
}
u39[v14.BIG_POTION] = {
    ["displayName"] = "Big Potion",
    ["description"] = "Makes You Big Potion",
    ["image"] = "rbxassetid://7911163626",
    ["category"] = v15.LOBBY_ITEM,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = true,
        ["useButtonText"] = "Retrieve From Locker",
        ["disableOpenSound"] = true
    },
    ["rarity"] = v11.ONE_STAR,
    ["giveItem"] = v10.GIANT_POTION
}
u39[v14.HELICOPTER_DEPLOY] = {
    ["displayName"] = "Helicopter",
    ["description"] = "Helicopter Deploy",
    ["image"] = "rbxassetid://9559559860",
    ["category"] = v15.LOBBY_ITEM,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = true,
        ["useButtonText"] = "Retrieve From Locker",
        ["disableOpenSound"] = true
    },
    ["rarity"] = v11.ONE_STAR,
    ["giveItem"] = v10.HELICOPTER_DEPLOY
}
u39[v14.UFO_DEPLOY] = {
    ["displayName"] = "Helicopter",
    ["description"] = "Helicopter Deploy",
    ["image"] = "rbxassetid://11977366776",
    ["category"] = v15.LOBBY_ITEM,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = true,
        ["useButtonText"] = "Retrieve From Locker",
        ["disableOpenSound"] = true
    },
    ["rarity"] = v11.TWO_STAR,
    ["giveItem"] = v10.UFO_DEPLOY
}
u39[v14.KITSKIN_CRATE_FRAGMENT] = {
    ["displayName"] = "Skin Crate Fragment",
    ["description"] = "A fragment of a skin crate. Collect (10) fragments to craft a Skin Crate",
    ["mergeInventory"] = true,
    ["consumeCost"] = 10,
    ["category"] = v15.CURRENCY,
    ["image"] = v9.KIT_SKIN_CRATE_FRAGMENT,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = true,
        ["useButtonText"] = "Craft Crate",
        ["disableOpenSound"] = true
    },
    ["rarity"] = v11.THREE_STAR
}
u39[v14.KITSKIN_CRATE] = {
    ["displayName"] = "Skin Crate",
    ["description"] = "Open to unlock a random skin!",
    ["crateType"] = v12.KITSKIN_CRATE,
    ["category"] = v15.REWARD_CRATE,
    ["image"] = v9.KIT_SKIN_CRATE,
    ["rarity"] = v11.SIX_STAR,
    ["displayInLocker"] = {
        ["merge"] = true,
        ["usable"] = false
    }
}
return {
    ["getConsumableMeta"] = function(p185) --[[ Name: getConsumableMeta, Line 1086 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        return u39[p185]
    end,
    ["ConsumableTypeMeta"] = u39
}