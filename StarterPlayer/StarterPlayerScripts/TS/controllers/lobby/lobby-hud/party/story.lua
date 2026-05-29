local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out")
local u4 = v3.PartyApp
local u5 = v3.PartyInvitesReducer
local u6 = v3.PartyReducer
local u7 = v3.QueueState
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
return function(p12) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u6
        [4] = u5
        [5] = u2
        [6] = u7
        [7] = u8
        [8] = u9
        [9] = u4
    --]]
    local v13 = u10.Store.new
    local v14 = {
        ["Game"] = u11,
        ["Party"] = u6,
        ["PartyInvites"] = u5
    }
    local v15 = u10.combineReducers(v14)
    local v16 = {
        ["Party"] = {
            ["queueData"] = nil,
            ["leader"] = u2.Dummy.oiogy,
            ["members"] = {
                u2.Dummy.SnickTrix,
                u2.Dummy.spleenhook,
                u2.Dummy.grilme99,
                u2.Dummy.grilme99
            },
            ["queueState"] = u7.NONE,
            ["outgoingInviteUserIds"] = {}
        }
    }
    local v17 = {}
    local v18 = {}
    local v19 = {
        ["fromPlayer"] = {
            ["name"] = "SnickTrix",
            ["userId"] = u2.Dummy.SnickTrix.userId
        },
        ["time"] = os.time()
    }
    local v20 = {
        ["fromPlayer"] = {
            ["name"] = "spleenhook",
            ["userId"] = u2.Dummy.spleenhook.userId
        },
        ["time"] = os.time() - 10
    }
    local v21 = {
        ["fromPlayer"] = {
            ["name"] = "Sprux",
            ["userId"] = u2.Dummy.oiogy.userId
        },
        ["time"] = os.time()
    }
    local v22 = {
        ["fromPlayer"] = {
            ["name"] = "Bryan3838",
            ["userId"] = u2.Dummy.Bryan3838.userId
        },
        ["time"] = os.time() - 10
    }
    local v23 = {
        ["fromPlayer"] = {
            ["name"] = "AsenDev",
            ["userId"] = u2.Dummy.Asen.userId
        },
        ["time"] = os.time()
    }
    local v24 = {
        ["fromPlayer"] = {
            ["name"] = "Rascal",
            ["userId"] = u2.Dummy.Rascal.userId
        },
        ["time"] = os.time()
    }
    __set_list(v18, 1, {v19, v20, v21, v22, v23, v24})
    v17.incomingInvites = v18
    v16.PartyInvites = v17
    local v25 = {
        ["store"] = v13(v15, v16)
    }
    local u26 = u8.mount(u8.createElement(u9, v25, { u8.createElement(u4, {
            ["AppId"] = "PARTY"
        }) }), p12)
    return function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u26
        --]]
        return u8.unmount(u26)
    end
end