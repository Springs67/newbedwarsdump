local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u7 = v1.import(script, script.Parent, "popup").Popup
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u2
        [4] = u3
        [5] = u7
        [6] = u5
    --]]
    local v9 = {
        ["Game"] = u6
    }
    local v10 = u4.Store.new(u4.combineReducers(v9), {})
    local v11 = u2.mount
    local v12 = u2.createElement
    local v13 = u3
    local v14 = {}
    local v15 = u2.createElement
    local v16 = u7
    local v17 = {
        ["AppId"] = "Popup",
        ["title"] = "PARTY IS RESTRICTED",
        ["message"] = "We understand that sometimes you may need to cancel a match, but quitting before the game begins can make the game less enjoyable for other players and disrupt the matchmaking process. If you keep leaving matches, the time you have to wait before playing again will get longer each time and you\'ll receive a deduction of rank points.\n\n<font transparency=\".6\" size=\"10\">69D0_DOD0_DOSA_S9D2AS</font>",
        ["countdown"] = {
            ["preText"] = "Penalty Timer: ",
            ["endTime"] = u5:GetServerTimeNow() + 600
        }
    }
    __set_list(v14, 1, {v15(v16, v17)})
    local u18 = v11(v12(v13, {
        ["store"] = v10
    }, v14), p8)
    return function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
        --]]
        return u2.unmount(u18)
    end
end