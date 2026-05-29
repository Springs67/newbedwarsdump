local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u8 = u1.import(script, script.Parent, "queue-app").QueueApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u5
        [4] = u7
        [5] = u6
        [6] = u2
        [7] = u1
        [8] = u3
    --]]
    local u10 = u4("QueueStatus", u8, {}, {}, {
        ["Parent"] = p9
    })
    local u11 = os.time()
    local v12 = u5
    local v13 = {
        ["type"] = "PartyUpdateAll"
    }
    local v14 = {
        ["leader"] = u7.Dummy.SnickTrix,
        ["members"] = { u7.Dummy.spleenhook },
        ["queueData"] = {
            ["ticketId"] = "",
            ["lastPollTime"] = 0,
            ["pollAttempts"] = 0,
            ["queueType"] = u6.BEDWARS_TO4,
            ["joinTime"] = u11
        },
        ["queueState"] = u2.IN_QUEUE,
        ["outgoingInviteUserIds"] = {}
    }
    v13.party = v14
    v12:dispatch(v13)
    u1.Promise.delay(3):andThen(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u6
            [4] = u11
            [5] = u2
        --]]
        local v15 = u5
        local v16 = {
            ["type"] = "PartyUpdateAll"
        }
        local v17 = {
            ["leader"] = u7.Dummy.SnickTrix,
            ["members"] = { u7.Dummy.spleenhook },
            ["queueData"] = {
                ["ticketId"] = "",
                ["lastPollTime"] = 0,
                ["pollAttempts"] = 0,
                ["queueType"] = u6.BEDWARS_TO4,
                ["joinTime"] = u11
            },
            ["queueState"] = u2.MATCH_FOUND,
            ["outgoingInviteUserIds"] = {}
        }
        v16.party = v17
        v15:dispatch(v16)
    end)
    return function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
        --]]
        return u3.unmount(u10)
    end
end