local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u9 = v1.import(script, script.Parent, "pvp-arena-intermission-ui").PvPArenaIntermissionUI
local u10 = v1.import(script, script.Parent, "pvp-arena-round-ui").PvPArenaRoundUI
return function(p11) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
        [4] = u2
        [5] = u8
        [6] = u3
        [7] = u4
        [8] = u10
        [9] = u9
    --]]
    local v12 = u5.Store.new
    local v13 = {
        ["Bedwars"] = u6,
        ["Game"] = u7
    }
    local v14 = u5.combineReducers(v13)
    local v15 = {}
    local v16 = {}
    local v17 = {
        ["userIdAugmentMap"] = {
            [u2.Dummy.Bryan3838.userId] = {
                u8.AERY,
                u8.GOLIATH,
                u8.GOLDEN_APPLE,
                u8.BULK_UP,
                u8.BAKERS_DELIGHT,
                u8.MELODY_GUITAR
            }
        }
    }
    v16.pvpArena = v17
    v15.Bedwars = v16
    local v18 = {}
    local v19 = {}
    local v20 = {
        ["health"] = 100
    }
    local v21 = {
        ["id"] = "1",
        ["name"] = "Blue",
        ["color"] = Color3.fromHex("#49b4f2"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v20.team = v21
    local v22 = {
        ["health"] = 100
    }
    local v23 = {
        ["id"] = "2",
        ["name"] = "Orange",
        ["color"] = Color3.fromHex("#f28e29"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v22.team = v23
    local v24 = {
        ["health"] = 90
    }
    local v25 = {
        ["id"] = "3",
        ["name"] = "Pink",
        ["color"] = Color3.fromHex("#ff55ff"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v24.team = v25
    local v26 = {
        ["health"] = 90
    }
    local v27 = {
        ["id"] = "4",
        ["name"] = "Yellow",
        ["color"] = Color3.fromHex("#ffff55"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v26.team = v27
    local v28 = {
        ["health"] = 80
    }
    local v29 = {
        ["id"] = "5",
        ["name"] = "Brown",
        ["color"] = Color3.fromHex("#9a6324"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v28.team = v29
    local v30 = {
        ["health"] = 80
    }
    local v31 = {
        ["id"] = "6",
        ["name"] = "White",
        ["color"] = Color3.fromHex("#f3feff"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v30.team = v31
    local v32 = {
        ["health"] = 70
    }
    local v33 = {
        ["id"] = "7",
        ["name"] = "Cyan",
        ["color"] = Color3.fromHex("#55ffff"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v32.team = v33
    local v34 = {
        ["health"] = 70
    }
    local v35 = {
        ["id"] = "8",
        ["name"] = "Purple",
        ["color"] = Color3.fromHex("#aa00aa"),
        ["members"] = {
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            },
            {
                ["displayName"] = "test",
                ["name"] = "bryan3838",
                ["userId"] = 20663325
            }
        }
    }
    v34.team = v35
    __set_list(v19, 1, {v20, v22, v24, v26, v28, v30, v32, v34})
    v18.pvpArenaTeamHealth = v19
    v15.Game = v18
    local v36 = {
        ["store"] = v12(v14, v15)
    }
    local u37 = u3.mount(u3.createElement(u4, v36, { u3.createElement("ScreenGui", {}, { u3.createElement(u10, {
                ["AppId"] = "PvPArenaRoundUI"
            }), u3.createElement(u9, {
                ["AppId"] = "PvPArenaIntermissionUI"
            }) }) }), p11)
    return function() --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u37
        --]]
        u3.unmount(u37)
    end
end