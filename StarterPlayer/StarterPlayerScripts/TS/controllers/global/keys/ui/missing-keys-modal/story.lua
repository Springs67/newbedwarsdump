local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "keys-reducer").KeysReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-type").KeyType
local u9 = v1.import(script, script.Parent, "missing-keys-modal").MissingKeysModal
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u5
        [4] = u6
        [5] = u2
        [6] = u3
        [7] = u9
        [8] = u7
    --]]
    local v11 = {
        [u8.HALLOWEEN_LTM] = {
            ["amount"] = 4,
            ["keyRegenStartTime"] = os.time() - 30
        }
    }
    local v12 = {
        ["Game"] = u5,
        ["Keys"] = u6
    }
    local v13 = u4.combineReducers(v12)
    local v14 = {
        ["Keys"] = {
            ["keysData"] = v11
        }
    }
    local v15 = u4.Store.new(v13, v14)
    local v16 = u2.mount
    local v17 = u2.createElement
    local v18 = u3
    local v19 = {}
    local v20 = u2.createElement
    local v21 = u9
    local v22 = {
        ["AppId"] = "",
        ["MissingKeys"] = {
            {
                ["amount"] = 1,
                ["keyType"] = u8.HALLOWEEN_LTM
            }
        },
        ["QueueType"] = u7.HALLOWEEN_EVENT
    }
    __set_list(v19, 1, {v20(v21, v22)})
    local u23 = v16(v17(v18, {
        ["store"] = v15
    }, v19), p10)
    return function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u23
        --]]
        return u2.unmount(u23)
    end
end