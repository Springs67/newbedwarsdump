local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "custom-match-reducer").CustomMatchReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u10 = v1.import(script, script.Parent, "top-bar-app").TopBarApp
return function(p11) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u5
        [4] = u6
        [5] = u8
        [6] = u9
        [7] = u2
        [8] = u3
        [9] = u10
    --]]
    local v12 = u4.Store.new
    local v13 = {
        ["Game"] = u7,
        ["Bedwars"] = u5,
        ["CustomMatch"] = u6
    }
    local v14 = u4.combineReducers(v13)
    local v15 = {
        ["Game"] = {
            ["queueType"] = u8.BEDWARS_TO2
        }
    }
    local v16 = {
        ["kills"] = { 3 },
        ["finalDeaths"] = { false },
        ["bedHealth"] = {
            ["1"] = {
                ["maxHealth"] = 24,
                ["health"] = 12
            }
        },
        ["bedPlatingHealth"] = {
            ["1"] = {
                ["maxHealth"] = 24,
                ["health"] = 24
            }
        },
        ["teamBedStatus"] = {
            ["1"] = u9.BedStatus.BED_PLATING_ACTIVE
        }
    }
    v15.Bedwars = v16
    v15.CustomMatch = {
        ["mapSaveData"] = nil
    }
    local v17 = {
        ["store"] = v12(v14, v15)
    }
    local u18 = u2.mount(u2.createElement(u3, v17, { u2.createElement(u10, {
            ["AppId"] = "1",
            ["LocalPlayerId"] = 1,
            ["ForceGameApp"] = true
        }) }), p11)
    return function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
        --]]
        return u2.unmount(u18)
    end
end