local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local u7 = v1.import(script, script.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper
local u8 = v1.import(script, script.Parent, "winning-team", "ui", "winning-team").WinningTeamWrapper
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
        [4] = u4
        [5] = u8
        [6] = u7
        [7] = u3
    --]]
    u5:dispatch({
        ["type"] = "BedwarsSetMatchExperienceEarned",
        ["matchExperienceEarned"] = {
            ["startingExperience"] = 0,
            ["totalExperienceEarned"] = 3100,
            ["reasons"] = {
                {
                    ["experience"] = 900,
                    ["name"] = "Victory"
                },
                {
                    ["experience"] = 200,
                    ["name"] = "Game Finish"
                },
                {
                    ["experience"] = 2000,
                    ["name"] = "Battle Pass XP Bonus"
                }
            }
        }
    })
    u5:dispatch({
        ["type"] = "GameSetSpectator",
        ["spectating"] = true,
        ["spectatingPlayer"] = u2.Dummy.SnickTrix
    })
    local _ = {
        ["rpDelta"] = 110,
        ["rankVisible"] = true,
        ["matchesPlayed"] = 10,
        ["demotionShieldActive"] = true,
        ["oldDivision"] = {
            ["rankPoints"] = 80,
            ["division"] = u6.PLATINUM_3
        },
        ["newDivision"] = {
            ["rankPoints"] = 10,
            ["division"] = u6.PLATINUM_3
        }
    }
    local u10 = u4("WinningTeam", u8, {
        ["WinningTeamId"] = 0,
        ["NewLeaderboardPos"] = 12673,
        ["PreviousLeaderboardPos"] = 63864
    }, {}, {
        ["Parent"] = p9
    })
    local u11 = u4("LobbyControls", u7, {}, {}, {
        ["Parent"] = p9
    })
    return function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
            [3] = u11
        --]]
        u3.unmount(u10)
        u3.unmount(u11)
    end
end