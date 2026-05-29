local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta").CrateMeta
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-item").AfkShopItem
local v13 = {}
local v14 = v12.AFK_CRATE
local v15 = {
    ["price"] = 4000,
    ["maxPurchases"] = (1 / 0),
    ["name"] = v10[v11.AFK_CRATE].displayName,
    ["image"] = v10[v11.AFK_CRATE].image,
    ["items"] = {
        {
            ["crate"] = v11.AFK_CRATE
        }
    }
}
v13[v14] = v15
v13[v12.MINI_POTION] = {
    ["name"] = "Shrink Potion(Single Use)",
    ["image"] = "rbxassetid://7911163448",
    ["price"] = 500,
    ["maxPurchases"] = (1 / 0),
    ["items"] = {},
    ["consumableItem"] = v4.MINI_POTION
}
v13[v12.BIG_POTION] = {
    ["name"] = "Big Potion(Single Use)",
    ["image"] = "rbxassetid://7911163626",
    ["price"] = 500,
    ["maxPurchases"] = (1 / 0),
    ["items"] = {},
    ["consumableItem"] = v4.BIG_POTION
}
v13[v12.MINI_COPTER] = {
    ["name"] = "Helicopter (Single Use)",
    ["image"] = "rbxassetid://9559559860",
    ["price"] = 5000,
    ["maxPurchases"] = (1 / 0),
    ["items"] = {},
    ["consumableItem"] = v4.HELICOPTER_DEPLOY
}
local v16 = v12.PILLOW
local v17 = {
    ["name"] = "Lobby Gadget Pillow",
    ["image"] = "rbxassetid://77581289137921",
    ["price"] = 120000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["lobbyGadget"] = v8.PILLOW
        }
    }
}
v13[v16] = v17
local v18 = v12.KING_OF_AFK_TITLE
local v19 = {
    ["name"] = "King Of AFK Title",
    ["textImage"] = "King Of AFK",
    ["price"] = 120000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["title"] = v9.THE_AFK_KING
        }
    }
}
v13[v18] = v19
local v20 = v12.YAWN_EMOTE
local v21 = {
    ["name"] = "Yawn Emote",
    ["price"] = 50000,
    ["maxPurchases"] = 1,
    ["animation"] = v3:getAssetId(v2.YAWN),
    ["items"] = {
        {
            ["emote"] = v6.YAWN
        }
    }
}
v13[v20] = v21
local v22 = v12.PILLOW_SMASH_EMOTE
local v23 = {
    ["name"] = "Pillow War Emote",
    ["price"] = 50000,
    ["maxPurchases"] = 1,
    ["animation"] = v3:getAssetId(v2.PILLOW_FIGHT),
    ["items"] = {
        {
            ["emote"] = v6.PILLOW_FIGHT
        }
    }
}
v13[v22] = v23
local v24 = v12.BRB_SIGN
local v25 = {
    ["name"] = "Lobby Gadget: Brb Sign ",
    ["image"] = "rbxassetid://75760243397525",
    ["price"] = 50000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["lobbyGadget"] = v8.BRB_SIGN
        }
    }
}
v13[v24] = v25
local v26 = v12.AFK_EMOTE
local v27 = {
    ["name"] = "AFK",
    ["image"] = "rbxassetid://122356771310461",
    ["price"] = 12000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["emote"] = v6.AFK
        }
    }
}
v13[v26] = v27
local v28 = v12.SLEEP_EMOTE
local v29 = {
    ["name"] = "Sleeping",
    ["image"] = "rbxassetid://97766277904110",
    ["price"] = 12000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["emote"] = v6.SLEEP
        }
    }
}
v13[v28] = v29
local v30 = v12.BRB_EMOTE
local v31 = {
    ["name"] = "brb",
    ["image"] = "rbxassetid://129699399595884",
    ["price"] = 12000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["emote"] = v6.BRB
        }
    }
}
v13[v30] = v31
local v32 = v12.PILLOW_KILL_EFFECT
local v33 = {
    ["name"] = "Pillow Kill Effect",
    ["image"] = "rbxassetid://134628536593359",
    ["price"] = 120000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["killEffect"] = v7.PILLOW_KILL_EFFECT
        }
    }
}
v13[v32] = v33
local v34 = v12.PILLOW_BED_BREAK_EFFECT
local v35 = {
    ["name"] = "Pillow bed break Effect",
    ["image"] = "rbxassetid://139531314537564",
    ["price"] = 50000,
    ["maxPurchases"] = 1,
    ["items"] = {
        {
            ["bedBreakEffect"] = v5.PILLOW
        }
    }
}
v13[v34] = v35
return {
    ["AfkShopItemMeta"] = v13
}