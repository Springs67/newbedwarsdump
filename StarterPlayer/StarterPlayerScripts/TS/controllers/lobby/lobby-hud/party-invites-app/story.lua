local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out")
local u4 = v3.PartyInvitesApp
local u5 = v3.PartyInvitesReducer
local u6 = v3.PartyReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
return function(_) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u6
        [4] = u5
        [5] = u2
        [6] = u7
        [7] = u8
        [8] = u4
    --]]
    local v11 = u9.Store.new
    local v12 = {
        ["Game"] = u10,
        ["Party"] = u6,
        ["PartyInvites"] = u5
    }
    local v13 = u9.combineReducers(v12)
    local v14 = {}
    local v15 = {}
    local v16 = {}
    local v17 = {
        ["fromPlayer"] = {
            ["name"] = "SnickTrix",
            ["userId"] = u2.Dummy.SnickTrix.userId
        },
        ["time"] = os.time()
    }
    local v18 = {
        ["fromPlayer"] = {
            ["name"] = "spleenhook",
            ["userId"] = u2.Dummy.SnickTrix.userId
        },
        ["time"] = os.time() - 10
    }
    __set_list(v16, 1, {v17, v18})
    v15.incomingInvites = v16
    v14.PartyInvites = v15
    local v19 = {
        ["store"] = v11(v13, v14)
    }
    local u20 = u7.mount(u7.createElement(u8, v19, { u7.createElement(u4, {
            ["AppId"] = "PARTY_INVITES"
        }) }))
    return function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u20
        --]]
        u7.unmount(u20)
    end
end