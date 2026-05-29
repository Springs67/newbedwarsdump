local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u5 = {
    [v4.BEDWARS] = {
        ["title"] = "Bedwars",
        ["image"] = v2.BED_RED_RENDER
    },
    [v4.INFECTED] = {
        ["title"] = "Infected",
        ["image"] = v2.INFECTED_RENDER
    },
    [v4.SKYWARS] = {
        ["title"] = "Skywars",
        ["image"] = v2.SKYWARS_CHEST_RENDER,
        ["excludedStats"] = {
            v3.BEDBREAKS,
            v3.IRONCOLLECTED,
            v3.DIAMONDCOLLECTED,
            v3.EMERALDCOLLECTED,
            v3.ENCHANTS,
            v3.TITANKILLS,
            v3.DIAMONDGUARDIANKILLS
        }
    },
    [v4.SURVIVAL] = {
        ["title"] = "Penguin Survival",
        ["image"] = v2.PENGUIN_SNIPER_RENDER
    },
    [v4.JUGGERNAUT] = {
        ["title"] = "Juggernaut TDM",
        ["image"] = v2.JUGGERNAUT_ARMOR_RENDER
    },
    [v4.JUGGERNAUT_V2] = {
        ["title"] = "Juggernaut",
        ["image"] = v2.JUGGERNAUT_ARMOR_RENDER
    },
    [v4.GUN_GAME] = {
        ["title"] = "Gun Game",
        ["image"] = v2.KNIFE_RAIN,
        ["excludedStats"] = {
            v3.BEDBREAKS,
            v3.BLOCKBREAKS,
            v3.BLOCKSPLACED,
            v3.IRONCOLLECTED,
            v3.DIAMONDCOLLECTED,
            v3.EMERALDCOLLECTED,
            v3.ENCHANTS,
            v3.TITANKILLS,
            v3.DIAMONDGUARDIANKILLS,
            v3.TELEPEARLSUSED,
            v3.TELEPEARLBLOCKSTRAVELLED
        }
    },
    [v4.FLAG_CAPTURE] = {
        ["title"] = "Capture The Flag",
        ["image"] = v2.DEFENSE_FLAG_RENDER
    },
    [v4.TNT_WARS] = {
        ["title"] = "TNT Wars",
        ["image"] = v2.TNT_TEXTURE
    },
    [v4.HALLOWEEN_EVENT] = {
        ["title"] = "Halloween Event 2022"
    },
    [v4.WINTER_EVENT] = {
        ["title"] = "Winter Event 2022"
    },
    [v4.MURDERER_GAME] = {
        ["title"] = "Murderer"
    },
    [v4.SKULL_DROP] = {
        ["title"] = "Hunter"
    },
    [v4.SANDBOX] = {
        ["title"] = "Sandbox",
        ["image"] = v2.BED_RED_RENDER
    },
    [v4.BLOCK_HUNT] = {
        ["title"] = "Block Hunt"
    },
    [v4.BRIDGE_DUEL] = {
        ["title"] = "Bridge Battle",
        ["excludedStats"] = {
            v3.IRONCOLLECTED,
            v3.DIAMONDCOLLECTED,
            v3.EMERALDCOLLECTED,
            v3.ENCHANTS,
            v3.TITANKILLS,
            v3.DIAMONDGUARDIANKILLS,
            v3.TELEPEARLSUSED,
            v3.TELEPEARLBLOCKSTRAVELLED
        }
    },
    [v4.CAPTURE_THE_POINTS] = {
        ["title"] = "Capture the Points"
    },
    [v4.ONE_IN_THE_CHAMBER] = {
        ["title"] = "One In The Chamber"
    },
    [v4.TRAINING_ROOM] = {
        ["title"] = "Training Room"
    },
    [v4.EGG_HUNT] = {
        ["title"] = "Egg Hunt"
    },
    [v4.LASSO_WARS] = {
        ["title"] = "Lasso Wars",
        ["excludedStats"] = {
            v3.BEDBREAKS,
            v3.BLOCKBREAKS,
            v3.BLOCKSPLACED,
            v3.IRONCOLLECTED,
            v3.DIAMONDCOLLECTED,
            v3.EMERALDCOLLECTED,
            v3.ENCHANTS,
            v3.TITANKILLS,
            v3.DIAMONDGUARDIANKILLS,
            v3.TELEPEARLSUSED,
            v3.TELEPEARLBLOCKSTRAVELLED
        }
    },
    [v4.HOT_POTATO] = {
        ["title"] = "TNT Run",
        ["image"] = v2.TNT_TEXTURE
    },
    [v4.FAST_CASUAL] = {
        ["title"] = "Fast & Casual"
    },
    [v4.PVP_ARENA] = {
        ["title"] = "Arena Duels",
        ["image"] = v2.PVP_ARENA_ICON,
        ["excludedStats"] = {
            v3.IRONCOLLECTED,
            v3.DIAMONDCOLLECTED,
            v3.EMERALDCOLLECTED,
            v3.ENCHANTS
        }
    },
    [v4.BATTLE_ROYALE] = {
        ["title"] = "Battle Royale",
        ["image"] = v2.PVP_ARENA_ICON
    },
    [v4.HALLOWEEN_2024_EVENT] = {
        ["title"] = "Halloween 2024 Event"
    },
    [v4.HALLOWEEN_2025_EVENT_PVE] = {
        ["title"] = "Halloween 2025 Event"
    },
    [v4.LB_ONEBLOCK] = {
        ["title"] = "Luckyblock Towers"
    },
    [v4.COMBINED_KIT] = {
        ["title"] = "Kit Fusion"
    },
    [v4.CUSTOM_KIT] = {
        ["title"] = "Custom Kit"
    },
    [v4.CUSTOM_KIT_CREATOR] = {
        ["title"] = "Custom Kit Creator"
    },
    [v4.MINE_WARS] = {
        ["title"] = "Mine Wars"
    },
    [v4.OVERPOWERED] = {
        ["title"] = "Overpowered"
    }
}
return {
    ["getGameMeta"] = function(p6) --[[ Name: getGameMeta, Line 125 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p6]
    end,
    ["GameMeta"] = u5
}