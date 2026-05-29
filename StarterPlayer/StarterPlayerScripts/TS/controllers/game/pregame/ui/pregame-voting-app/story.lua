local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u6 = v1.import(script, script.Parent, "pregame-voting-app").PregameVotingApp
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u6
    --]]
    local v8 = u4.Store.new
    local v9 = {
        ["Bedwars"] = u5
    }
    local v10 = u4.combineReducers(v9)
    local v11 = {}
    local v12 = {}
    local v13 = {
        ["voteState"] = {
            {
                ["pregameVotingOption"] = {
                    ["mapName"] = "to4_Halloween-Map-2025"
                },
                ["voterUserIds"] = { 4491239179, 4491239179, 4491239179 }
            },
            {
                ["pregameVotingOption"] = {
                    ["mapName"] = "to4_Volatile"
                },
                ["voterUserIds"] = {}
            },
            {
                ["pregameVotingOption"] = {
                    ["mapName"] = "to4_Skull-Island"
                },
                ["voterUserIds"] = { 4491239179, 4491239179 }
            },
            {
                ["pregameVotingOption"] = {
                    ["mapName"] = "to4_Sanctum"
                },
                ["voterUserIds"] = { 4491239179 }
            }
        }
    }
    v12.pregameVote = v13
    v11.Bedwars = v12
    local u14 = v8(v10, v11)
    local u15 = u2.mount(u2.createElement(u3, {
        ["store"] = u14
    }, { u2.createElement(u6, {
            ["AppId"] = "PregameVotingApp",
            ["VoteStartTime"] = os.time(),
            ["VoteEndTime"] = os.time() + 5
        }) }), p7)
    task.delay(5, function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:dispatch({
            ["type"] = "SetPregameVoteWon",
            ["winningVoterIndex"] = 0,
            ["winningVotingOption"] = {
                ["mapName"] = "to4_Sanctum"
            }
        })
    end)
    return function() --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
        --]]
        return u2.unmount(u15)
    end
end