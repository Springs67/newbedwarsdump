local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v12 = {
    ["id"] = "GoldLuckyCrate",
    ["levelRequirement"] = 1,
    ["description"] = "Every Level",
    ["instantClaim"] = true,
    ["reward"] = {
        ["paid"] = false,
        ["crate"] = v11.LEVEL_UP_CRATE
    }
}
local v13 = {
    ["id"] = "OwlKit",
    ["levelRequirement"] = 10,
    ["description"] = v4[v3.OWL].name,
    ["reward"] = {
        ["paid"] = false,
        ["kit"] = v3.OWL
    }
}
local v14 = {
    ["id"] = "TaliyahKit",
    ["levelRequirement"] = 15,
    ["description"] = v4[v3.TALIYAH].name,
    ["reward"] = {
        ["paid"] = false,
        ["kit"] = v3.TALIYAH
    }
}
local v15 = {
    ["id"] = "FreeKitSlot",
    ["description"] = "+1 Weekly Kit",
    ["levelRequirement"] = v5.FreeKitRotation.FreeKitLevelReq[1],
    ["reward"] = {
        ["freeKitSlot"] = true,
        ["displayTitle"] = "Free Kit Slot",
        ["image"] = v6.FREE_KIT_SLOT
    }
}
local v16 = {
    ["id"] = "DiamondLuckyCrate_1",
    ["levelRequirement"] = 30,
    ["description"] = "Every 5 Levels",
    ["instantClaim"] = true,
    ["reward"] = {
        ["paid"] = false,
        ["crate"] = v11.DIAMOND_LUCKY_CRATE
    }
}
local v17 = {
    ["id"] = "MythicDaggerLobbyGadget",
    ["levelRequirement"] = 40,
    ["description"] = "Mythic Dagger",
    ["reward"] = {
        ["paid"] = false,
        ["lobbyGadget"] = v7.MYTHIC_DAGGER
    }
}
local v18 = {
    ["id"] = "HeroTitle",
    ["levelRequirement"] = 50
}
local v19 = v8[v9.HERO].name
v18.description = v19 == nil and "" or v19
v18.reward = {
    ["paid"] = false,
    ["title"] = v9.HERO
}
local u20 = {
    v12,
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    {
        ["id"] = "InfernalWhisper",
        ["levelRequirement"] = 75,
        ["description"] = "Infernal Whisper Kit Skin",
        ["reward"] = {
            ["paid"] = false,
            ["kitSkin"] = v2.OWL_FIRE
        }
    },
    {
        ["id"] = "AngelWings",
        ["levelRequirement"] = 100,
        ["description"] = "Angel Wings",
        ["reward"] = {
            ["paid"] = false,
            ["lobbyGadget"] = v7.ANGEL_WINGS
        }
    },
    {
        ["id"] = "AngelWingWinEffect",
        ["levelRequirement"] = 125,
        ["description"] = "Angel Wings Win Effect",
        ["reward"] = {
            ["paid"] = false,
            ["image"] = "rbxassetid://135761624707868",
            ["winEffect"] = v10.ANGEL_WINGS
        }
    },
    {
        ["id"] = "AngelWingWinEffect",
        ["levelRequirement"] = 150,
        ["description"] = "Win Effect Upgrade",
        ["reward"] = {
            ["paid"] = false,
            ["displayTitle"] = "Win Effect Upgrade",
            ["image"] = "rbxassetid://135761624707868"
        }
    },
    {
        ["id"] = "AngelWingWinEffect3",
        ["levelRequirement"] = 175,
        ["description"] = "Win Effect Upgrade 2",
        ["reward"] = {
            ["paid"] = false,
            ["displayTitle"] = "Win Effect Upgrade 2",
            ["image"] = "rbxassetid://135761624707868"
        }
    },
    {
        ["id"] = "CyanAngelWings",
        ["levelRequirement"] = 200,
        ["description"] = "Angel Wings",
        ["reward"] = {
            ["paid"] = false,
            ["displayTitle"] = "Cyan Angel Wings",
            ["image"] = "rbxassetid://103691640953373"
        }
    }
}
table.sort(u20, function(p21, p22) --[[ Line: 138 ]]
    return p21.levelRequirement < p22.levelRequirement
end)
return {
    ["countUnclaimedMilestones"] = function(u23, u24) --[[ Name: countUnclaimedMilestones, Line 142 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if u23 == 0 or (u23 ~= u23 or not (u23 and u24)) then
            return 0
        end
        local u25 = 0
        local function v31(p26) --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
                [3] = u25
            --]]
            local v27 = u23 >= p26.levelRequirement
            if v27 then
                local v28 = nil
                for v29, v30 in u24 do
                    local _ = v29 - 1
                    if v30 == p26.id == true then
                        v28 = v30
                        break
                    end
                end
                v27 = not v28
            end
            if v27 then
                u25 = u25 + 1
            end
        end
        local v32 = u25
        for v33, v34 in u20 do
            v31(v34, v33 - 1, u20)
        end
        return v32
    end,
    ["MilestoneRewards"] = u20
}