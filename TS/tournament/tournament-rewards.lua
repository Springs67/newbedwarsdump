local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision
local v5 = {}
local _ = v4.Division_I
local _ = v4.Division_II
local _ = v4.Division_III
local u6 = {}
local v7 = v4.Division_I
local v8 = {
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 300
        }
    },
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 800
        }
    },
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 1500
        },
        {
            ["paid"] = false,
            ["emote"] = v2.TOURNAMENT_WINNER
        },
        {
            ["paid"] = false,
            ["title"] = v3.TOURNAMENT_CHAMPION
        }
    }
}
u6[v7] = v8
local v9 = v4.Division_II
local v10 = {
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 250
        }
    },
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 700
        }
    },
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 1250
        },
        {
            ["paid"] = false,
            ["emote"] = v2.TOURNAMENT_WINNER
        },
        {
            ["paid"] = false,
            ["title"] = v3.TOURNAMENT_CHAMPION
        }
    }
}
u6[v9] = v10
local v11 = v4.Division_III
local v12 = {
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 200
        }
    },
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 550
        }
    },
    {
        {
            ["paid"] = false,
            ["bedCoins"] = 1000
        },
        {
            ["paid"] = false,
            ["emote"] = v2.TOURNAMENT_WINNER
        },
        {
            ["paid"] = false,
            ["title"] = v3.TOURNAMENT_CHAMPION
        }
    }
}
u6[v11] = v12
v5.REWARDS_BY_WINS = u6
function v5.getRewardsByDivisionWins(p13, p14) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v15 = u6[p13]
    if v15 ~= nil then
        v15 = v15[p14]
    end
    return v15 == nil and {} or v15
end
return {
    ["TournamentRewards"] = v5
}