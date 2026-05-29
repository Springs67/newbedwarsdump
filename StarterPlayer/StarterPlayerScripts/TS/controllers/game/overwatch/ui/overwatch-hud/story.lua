local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "report", "report").ReportTicketResult
local u9 = v1.import(script, script.Parent, "overwatch-hud").OverwatchHud
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u7
        [5] = u2
        [6] = u3
        [7] = u9
        [8] = u8
    --]]
    local v11 = u4.Store.new
    local v12 = {
        ["Game"] = u6,
        ["Bedwars"] = u5
    }
    local v13 = u4.combineReducers(v12)
    local v14 = {
        ["Game"] = {
            ["queueType"] = u7.BEDWARS_20v20
        }
    }
    local v15 = {
        ["kills"] = { 32 }
    }
    v14.Bedwars = v15
    local v16 = v11(v13, v14)
    local v17 = u2.mount
    local v18 = u2.createElement
    local v19 = u3
    local v20 = {}
    local v21 = u2.createElement
    local v22 = u9
    local v23 = {
        ["AppId"] = "OverwatchHud",
        ["ReportTicket"] = {
            ["_id"] = "1",
            ["reports"] = 1,
            ["priorityReports"] = 1,
            ["reported"] = 1,
            ["resolution"] = u8.PENDING,
            ["lastReported"] = os.time(),
            ["firstReported"] = os.time() - 10
        }
    }
    __set_list(v20, 1, {v21(v22, v23)})
    local u24 = v17(v18(v19, {
        ["store"] = v16
    }, v20), p10)
    return function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u24
        --]]
        return u2.unmount(u24)
    end
end