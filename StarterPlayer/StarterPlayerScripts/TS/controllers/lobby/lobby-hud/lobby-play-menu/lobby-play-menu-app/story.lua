local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "keys-reducer").KeysReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-type").KeyType
local u8 = v1.import(script, script.Parent, "lobby-play-menu-app").LobbyPlayMenuApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u7
        [5] = u2
        [6] = u3
        [7] = u8
    --]]
    local v10 = u4.Store.new
    local v11 = {
        ["Game"] = u5,
        ["Keys"] = u6
    }
    local v12 = u4.combineReducers(v11)
    local v13 = {}
    local v14 = {}
    local v15 = {
        [u7.HALLOWEEN_LTM] = {
            ["amount"] = 3,
            ["keyRegenStartTime"] = os.time() + 10000
        }
    }
    v14.keysData = v15
    v13.Keys = v14
    local v16 = {
        ["store"] = v10(v12, v13)
    }
    local u17 = u2.mount(u2.createElement(u3, v16, { u2.createElement(u8, {
            ["AppId"] = "LobbyQueueMenu"
        }) }), p9)
    return function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u17
        --]]
        return u2.unmount(u17)
    end
end