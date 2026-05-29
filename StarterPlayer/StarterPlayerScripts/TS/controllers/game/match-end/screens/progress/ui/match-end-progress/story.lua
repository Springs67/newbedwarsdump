local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local u9 = v1.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper
local u10 = v1.import(script, script.Parent, "match-end-progress").MatchEndProgressWrapper
return function(p11) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
        [4] = u7
        [5] = u6
        [6] = u4
        [7] = u10
        [8] = u9
        [9] = u3
    --]]
    local v12 = {
        ["startingExperience"] = 5000,
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
    u5:dispatch({
        ["type"] = "GameSetSpectator",
        ["spectating"] = true,
        ["spectatingPlayer"] = u2.Dummy.SnickTrix
    })
    u5:dispatch({
        ["type"] = "SetMatchEndSummaryVisible",
        ["visible"] = true
    })
    local v13 = {
        ["rpDelta"] = -10,
        ["rankVisible"] = true,
        ["matchesPlayed"] = 10,
        ["demotionShieldActive"] = true,
        ["oldDivision"] = {
            ["rankPoints"] = 10,
            ["division"] = u8.PLATINUM_3
        },
        ["newDivision"] = {
            ["rankPoints"] = 20,
            ["division"] = u8.PLATINUM_2
        }
    }
    local u14 = u4("MatchEndProgressApp", u10, {
        ["WinningTeamId"] = 0,
        ["ClanContributionEarned"] = 100,
        ["DisableAnimation"] = true,
        ["RankChangeData"] = v13,
        ["PlayerMatchExperienceEarned"] = v12,
        ["BattlePassMatchExperienceEarned"] = v12,
        ["BedCoinsEarned"] = {
            ["matchAmountEarned"] = 100,
            ["dailyAmountEarned"] = 100,
            ["eligible"] = true,
            ["reachedTotalCap"] = false
        },
        ["ArmorTrimXpEarned"] = {
            ["xpEarned"] = 400,
            ["kit"] = u7.BARBARIAN,
            ["equipped"] = u6.TRIM_4
        },
        ["KitStatsDelta"] = {
            ["plays"] = 10,
            ["wins"] = 0,
            ["kills"] = 1,
            ["dashes"] = 100
        },
        ["EquippedKit"] = u7.BARBARIAN
    }, {}, {
        ["Parent"] = p11
    })
    local u15 = u4("LobbyControls", u9, {}, {}, {
        ["Parent"] = p11
    })
    return function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u14
            [3] = u15
        --]]
        u3.unmount(u14)
        u3.unmount(u15)
    end
end