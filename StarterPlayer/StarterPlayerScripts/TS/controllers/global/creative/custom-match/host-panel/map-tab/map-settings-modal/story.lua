local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u7 = v1.import(script, script.Parent, "map-settings-modal").MapSettingsModal
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u7
        [6] = u6
    --]]
    local v9 = {
        ["Game"] = u5
    }
    local v10 = u4.Store.new(u4.combineReducers(v9), {})
    local v11 = u2.mount
    local v12 = u2.createElement
    local v13 = u3
    local v14 = {}
    local v15 = u2.createElement
    local v16 = u7
    local v17 = {
        ["AppId"] = "MapSettingsModal",
        ["MapSaveDisplayInfo"] = {
            ["code"] = "1234ACBD5678",
            ["name"] = "hello",
            ["creator"] = 214,
            ["copylock"] = true,
            ["published"] = false,
            ["queueType"] = u6.BEDWARS_20v20,
            ["dateCreated"] = os.time(),
            ["lastUpdated"] = os.time()
        }
    }
    __set_list(v14, 1, {v15(v16, v17)})
    local u18 = v11(v12(v13, {
        ["store"] = v10
    }, v14), p8)
    return function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
        --]]
        return u2.unmount(u18)
    end
end