local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-eggs")
local v3 = v2.EggHunt2026Egg
local v4 = v2.EggHunt2026EggMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "old-eggs").EggHunt2025Egg
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil.generateMissions
local v7 = {}
local v8 = {
    ["name"] = "Teamwork Egg: Deposit 6 Diamonds in the team crate",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.TEAM_WORK_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v5.TEAM_WORK_EGG].name,
        ["icon"] = v4[v5.TEAM_WORK_EGG].image
    },
    ["layoutOrder"] = v4[v5.TEAM_WORK_EGG].order
}
local v9 = {
    ["name"] = "Sword Egg: Kill a player with sword",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.SWORD_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.SWORD_EGG].name,
        ["icon"] = v4[v3.SWORD_EGG].image
    },
    ["layoutOrder"] = v4[v3.SWORD_EGG].order
}
local v10 = {
    ["name"] = "Dance Party Egg: Join a dance emote with 3 or more players",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.DANCE_PARTY_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.DANCE_PARTY_EGG].name,
        ["icon"] = v4[v3.DANCE_PARTY_EGG].image
    },
    ["layoutOrder"] = v4[v3.DANCE_PARTY_EGG].order
}
local v11 = {
    ["name"] = "Enchant Egg: Get an Enchant from the Enchant Table",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.ENCHANT_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.ENCHANT_EGG].name,
        ["icon"] = v4[v3.ENCHANT_EGG].image
    },
    ["layoutOrder"] = v4[v3.ENCHANT_EGG].order
}
local v12 = {
    ["name"] = "Friendship Egg: Win a game with a friend",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.FRIENDSHIP_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.FRIENDSHIP_EGG].name,
        ["icon"] = v4[v3.FRIENDSHIP_EGG].image
    },
    ["layoutOrder"] = v4[v3.FRIENDSHIP_EGG].order
}
local v13 = {
    ["name"] = "Deviled Egg: Emote after killing a player",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.DEVIL_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.DEVIL_EGG].name,
        ["icon"] = v4[v3.DEVIL_EGG].image
    },
    ["layoutOrder"] = v4[v3.DEVIL_EGG].order
}
local v14 = {
    ["name"] = "Cracked Egg: Kill a person with fall damage",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.CRACKED_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.CRACKED_EGG].name,
        ["icon"] = v4[v3.CRACKED_EGG].image
    },
    ["layoutOrder"] = v4[v3.CRACKED_EGG].order
}
local v15 = {
    ["name"] = "Titan Egg: Kill the Titan",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.TITAN_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.TITAN_EGG].name,
        ["icon"] = v4[v3.TITAN_EGG].image
    },
    ["layoutOrder"] = v4[v3.TITAN_EGG].order
}
local v16 = {
    ["name"] = "Sky Egg: Build up to the height limit",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.SKY_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.SKY_EGG].name,
        ["icon"] = v4[v3.SKY_EGG].image
    },
    ["layoutOrder"] = v4[v3.SKY_EGG].order
}
local v17 = {
    ["name"] = "Fragile Egg: ?",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.FALL_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.FALL_EGG].name,
        ["icon"] = v4[v3.FALL_EGG].image
    },
    ["layoutOrder"] = v4[v3.FALL_EGG].order
}
local v18 = {
    ["name"] = "Burnt Egg: ?",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.BURNT_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.BURNT_EGG].name,
        ["icon"] = v4[v3.BURNT_EGG].image
    },
    ["layoutOrder"] = v4[v3.BURNT_EGG].order
}
local v19 = {
    ["name"] = "Void\'s Reclaim Egg: ???",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.VOID_TRIBUTE_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.VOID_TRIBUTE_EGG].name,
        ["icon"] = v4[v3.VOID_TRIBUTE_EGG].image
    },
    ["layoutOrder"] = v4[v3.VOID_TRIBUTE_EGG].order
}
local v20 = {
    ["name"] = "Shear Egg: ?",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.SHEER_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.SHEER_EGG].name,
        ["icon"] = v4[v3.SHEER_EGG].image
    },
    ["layoutOrder"] = v4[v3.SHEER_EGG].order
}
local v21 = {
    ["name"] = "Void\'s Eye Egg: ???",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.VOID_EYE_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.VOID_EYE_EGG].name,
        ["icon"] = v4[v3.VOID_EYE_EGG].image
    },
    ["layoutOrder"] = v4[v3.VOID_EYE_EGG].order
}
local v22 = {
    ["name"] = "Lobby Egg: ?",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.LOBBY_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.LOBBY_EGG].name,
        ["icon"] = v4[v3.LOBBY_EGG].image
    },
    ["layoutOrder"] = v4[v3.LOBBY_EGG].order
}
local v23 = {
    ["name"] = "Dozen Egg: ???",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.DOZEN_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.DOZEN_EGG].name,
        ["icon"] = v4[v3.DOZEN_EGG].image
    },
    ["layoutOrder"] = v4[v3.DOZEN_EGG].order
}
__set_list(v7, 1, {v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23})
local v24 = {
    ["name"] = "Titan Disco Egg: ???",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.TITAN_DANCE_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.TITAN_DANCE_EGG].name,
        ["icon"] = v4[v3.TITAN_DANCE_EGG].image
    },
    ["layoutOrder"] = v4[v3.TITAN_DANCE_EGG].order
}
local v25 = {
    ["name"] = "Rotten Egg: ?",
    ["progressAllowedInCustomMatches"] = false,
    ["rewardAmount"] = 1,
    ["metaId"] = v3.ROTTEN_EGG,
    ["stages"] = {
        {
            ["type"] = "Manual",
            ["progress"] = 1
        }
    },
    ["reward"] = {
        ["name"] = v4[v3.ROTTEN_EGG].name,
        ["icon"] = v4[v3.ROTTEN_EGG].image
    },
    ["layoutOrder"] = v4[v3.ROTTEN_EGG].order
}
__set_list(v7, 17, {v24, v25})
return {
    ["EggHuntEvent_2026_Missions"] = v6(v7)
}