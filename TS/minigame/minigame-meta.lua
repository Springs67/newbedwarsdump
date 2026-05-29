local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.SNOWBALL_DODGEBALL = 0
v2[0] = "SNOWBALL_DODGEBALL"
v3.ICE_FISHING = 1
v2[1] = "ICE_FISHING"
v3.COLOR_BLOCK = 2
v2[2] = "COLOR_BLOCK"
v3.FADING_PLATFORMS = 3
v2[3] = "FADING_PLATFORMS"
v3.SNOWBOARDING = 4
v2[4] = "SNOWBOARDING"
local u4 = {
    [v3.SNOWBALL_DODGEBALL] = {
        ["displayName"] = "Snowball Dodgeball",
        ["description"] = "Throw snowballs to knock the other team off their platform. Last team standing wins!",
        ["infoImage"] = "rbxassetid://11847964691",
        ["type"] = v3.SNOWBALL_DODGEBALL,
        ["teamConfig"] = {
            ["teams"] = 2,
            ["targetSize"] = 16
        },
        ["winCondition"] = {
            ["elimTeamsPerc"] = 0.5
        },
        ["teamScoresHud"] = {
            ["title"] = "PLAYERS REMAINING"
        }
    },
    [v3.ICE_FISHING] = {
        ["displayName"] = "Ice Fishing",
        ["description"] = "Catch fish to earn points. The team with the most points at the end wins.",
        ["infoImage"] = "rbxassetid://11847878245",
        ["duration"] = 50,
        ["type"] = v3.ICE_FISHING,
        ["teamConfig"] = {
            ["teams"] = 2,
            ["targetSize"] = 8
        }
    },
    [v3.COLOR_BLOCK] = {
        ["displayName"] = "Color Block",
        ["description"] = "Stay on the correct color blocks to win! The longer you stay alive the more points you earn.",
        ["infoImage"] = "rbxassetid://11847878417",
        ["type"] = v3.COLOR_BLOCK,
        ["teamConfig"] = {
            ["teams"] = 2,
            ["targetSize"] = 4
        }
    },
    [v3.FADING_PLATFORMS] = {
        ["displayName"] = "Fading Platforms",
        ["description"] = "Platforms will begin to fade away once stepped on and falling means elimination. Survive until half of the participating teams get eliminated.",
        ["infoImage"] = "rbxassetid://11847867117",
        ["type"] = v3.FADING_PLATFORMS,
        ["winCondition"] = {
            ["elimTeamsPerc"] = 0.5
        },
        ["teamScoresHud"] = {
            ["title"] = "PLAYERS REMAINING"
        }
    },
    [v3.SNOWBOARDING] = {
        ["displayName"] = "Snowboarding",
        ["description"] = "Snowboard down a tricky course while being pursued by an avalanche that can eliminate you. The first half of the teams with at least one member to finish will move on to the next round.",
        ["infoImage"] = "rbxassetid://111150519086526",
        ["disableAutoUnanchorPlayers"] = true,
        ["type"] = v3.SNOWBOARDING,
        ["teamScoresHud"] = {
            ["title"] = "PLAYERS REMAINING",
            ["disable"] = true
        },
        ["winCondition"] = {
            ["elimTeamsPerc"] = 0.5
        },
        ["musicOverride"] = v1.SNOWBOARD_MUSIC
    }
}
return {
    ["MinigameType"] = v3,
    ["getMinigameMeta"] = function(p5) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end
}