local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "tournament-reducer").TournamentReducer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision
local u11 = v1.import(script, script.Parent, "tournament-app").TournamentApp
return function(p12) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u8
        [4] = u9
        [5] = u2
        [6] = u3
        [7] = u10
        [8] = u4
        [9] = u5
        [10] = u11
    --]]
    local v13 = u6.Store.new
    local v14 = {
        ["Game"] = u7,
        ["Tournament"] = u8
    }
    local v15 = u6.combineReducers(v14)
    local v16 = {}
    local v17 = {
        ["myTeamId"] = "1",
        ["myTeamName"] = "Faze Clan",
        ["myTeamIcon"] = u9.ACADEMY_AERY_GL,
        ["myTeamLeader"] = u2.Dummy.oiogy.userId,
        ["myTeamRegion"] = u3.NA,
        ["myTeamMembers"] = { u2.Dummy.Asen.userId, u2.Dummy.Chase.userId, u2.Dummy.Bryan3838.userId },
        ["outboundTournamentInvites"] = { u2.Dummy.spleenhook.userId, u2.Dummy.SnickTrix.userId, u2.Dummy.DVwastaken.userId },
        ["incomingTournamentInvites"] = {
            {
                ["teamId"] = "2",
                ["teamName"] = "Jeep Joggers",
                ["teamTag"] = "JJ",
                ["weekId"] = "22",
                ["teamIcon"] = u9.AXOLOTL_SLEEPING,
                ["division"] = u10.Division_I,
                ["invitingPlayer"] = u2.Dummy.Midciel.userId
            }
        },
        ["myTeamDivision"] = u10.Division_I
    }
    v16.Tournament = v17
    local v18 = {
        ["store"] = v13(v15, v16)
    }
    local u19 = u4.mount(u4.createElement(u5, v18, { u4.createElement(u11, {
            ["AppId"] = "TournamentApp"
        }) }), p12)
    return function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u19
        --]]
        return u4.unmount(u19)
    end
end