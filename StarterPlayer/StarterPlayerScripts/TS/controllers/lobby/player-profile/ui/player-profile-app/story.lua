local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out")
local u3 = v2.PartyInvitesReducer
local u4 = v2.PartyReducer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "event-reducer").EventReducer
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u11 = v1.import(script, script.Parent.Parent, "dummy-player-profile-data").DummyProfileData
local v12 = v1.import(script, script.Parent, "player-profile-app")
local u13 = v12.PlayerProfileApp
local u14 = v12.PlayerProfileTab
return function(p15) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u4
        [4] = u3
        [5] = u8
        [6] = u9
        [7] = u7
        [8] = u13
        [9] = u11
        [10] = u14
        [11] = u5
    --]]
    local v16 = {
        ["Bedwars"] = u10,
        ["Party"] = u4,
        ["PartyInvites"] = u3,
        ["Clans"] = u8,
        ["Event"] = u9
    }
    u6.Store.new(u6.combineReducers(v16))
    local u17 = u7("PlayerProfileApp", u13, {
        ["AppId"] = "PlayerProfile",
        ["ProfileData"] = u11,
        ["DefaultTab"] = u14.ACHIEVEMENTS
    }, {}, {
        ["Parent"] = p15
    })
    return function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u17
        --]]
        u5.unmount(u17)
    end
end