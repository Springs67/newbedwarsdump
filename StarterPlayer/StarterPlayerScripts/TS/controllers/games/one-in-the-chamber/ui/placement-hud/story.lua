local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u8 = v1.import(script, script.Parent, "placement-hud").PlacementHud
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u6
        [4] = u3
        [5] = u4
        [6] = u8
        [7] = u7
    --]]
    local v10 = {}
    local v11 = {
        ["id"] = "1",
        ["name"] = "Red",
        ["members"] = {
            [u2.Dummy.oiogy.userId] = u2.Dummy.oiogy
        },
        ["color"] = Color3.fromRGB(255, 71, 71)
    }
    local v12 = {
        ["id"] = "2",
        ["name"] = "Blue",
        ["members"] = {
            [u2.Dummy.Asen.userId] = u2.Dummy.Asen
        },
        ["color"] = Color3.fromRGB(66, 46, 255)
    }
    local v13 = {
        ["id"] = "3",
        ["name"] = "Green",
        ["members"] = {
            [u2.Dummy.spleenhook.userId] = u2.Dummy.spleenhook
        },
        ["color"] = Color3.fromRGB(115, 255, 71)
    }
    local v14 = {
        ["id"] = "4",
        ["name"] = "Orange",
        ["members"] = {
            [u2.Dummy.Bryan3838.userId] = u2.Dummy.Bryan3838
        },
        ["color"] = Color3.fromRGB(255, 166, 71)
    }
    __set_list(v10, 1, {v11, v12, v13, v14})
    local v15 = u5.Store.new
    local v16 = {
        ["Game"] = u6
    }
    local v17 = u5.combineReducers(v16)
    local v18 = {
        ["Game"] = {
            ["teamScores"] = {
                {
                    ["teamId"] = "1",
                    ["score"] = 16
                },
                {
                    ["teamId"] = "2",
                    ["score"] = 24
                },
                {
                    ["teamId"] = "3",
                    ["score"] = 4
                },
                {
                    ["teamId"] = "4",
                    ["score"] = 7
                }
            },
            ["teams"] = v10,
            ["myTeam"] = v10[1]
        }
    }
    local v19 = v15(v17, v18)
    local u20 = u3.mount(u3.createElement(u4, {
        ["store"] = v19
    }, { u3.createElement(u8, {
            ["AppId"] = "PlacementHud",
            ["queueType"] = u7.ONE_IN_THE_CHAMBER
        }) }), p9)
    return function() --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u20
        --]]
        return u3.unmount(u20)
    end
end