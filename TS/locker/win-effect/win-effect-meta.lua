local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v4 = {
    [v3.NONE] = {
        ["name"] = "None"
    },
    [v3.JUGGERNAUT_BARBARIAN] = {
        ["name"] = "Juggernaut Barbarian",
        ["image"] = "rbxassetid://14559884081"
    },
    [v3.TRAIN] = {
        ["name"] = "Choo Choo Champion",
        ["image"] = "rbxassetid://15716142989"
    },
    [v3.SPIRIT_ASSASSIN] = {
        ["name"] = "Haunted Spirit Assassin",
        ["image"] = "rbxassetid://16390553155 "
    },
    [v3.GRIM_REAPER] = {
        ["name"] = "Grim Reaper",
        ["image"] = "rbxassetid://17762371072"
    },
    [v3.STATUE_OF_TRIUMPH] = {
        ["name"] = "Divine Triumph",
        ["image"] = "rbxassetid://18961510440"
    },
    [v3.SPIRIT_BLOSSOM] = {
        ["name"] = "Spirit Blossom",
        ["image"] = "rbxassetid://101360357491868"
    },
    [v3.DRAGON_RIDER] = {
        ["name"] = "Dragon Rider",
        ["image"] = "rbxassetid://126549113430992"
    },
    [v3.DUST_DEVIL] = {
        ["name"] = "Dust Devil",
        ["image"] = "rbxassetid://91511116780512"
    },
    [v3.ANGEL_WINGS] = {
        ["name"] = "Angel Wings",
        ["image"] = "rbxassetid://135761624707868"
    },
    [v3.OWL] = {
        ["name"] = "Spirit Owl",
        ["image"] = v2.OWL_WIN_EFFECT_RENDER
    },
    [v3.MEGA_BLOCK] = {
        ["name"] = "Mega Block",
        ["image"] = v2.MEGA_BLOCK_WIN_EFFECT_RENDER
    },
    [v3.SNOWBOARDER] = {
        ["name"] = "Snowboarder Win Effect",
        ["image"] = "rbxassetid://94827208647470"
    },
    [v3.SNOW_BALL_RIDER] = {
        ["name"] = "Snowball Rider Win Effect",
        ["image"] = "rbxassetid://7911163294"
    }
}
return {
    ["WinEffectMeta"] = v4
}