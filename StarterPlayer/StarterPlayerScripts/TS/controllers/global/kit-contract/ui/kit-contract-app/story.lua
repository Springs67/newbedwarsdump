local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u7 = v1.import(script, script.Parent, "kit-contract-app").KitContractApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u2
        [5] = u3
        [6] = u7
    --]]
    local v9 = u4.Store.new
    local v10 = {
        ["Lobby"] = u5
    }
    local v11 = u4.combineReducers(v10)
    local v12 = {}
    local v13 = {}
    local v14 = {
        [u6.BARBARIAN] = {
            ["wins"] = 500,
            ["kills"] = 400
        },
        [u6.SPIRIT_ASSASSIN] = {
            ["wins"] = 1000,
            ["kills"] = 1000,
            ["dashes"] = 132,
            ["dash kills"] = 12
        },
        [u6.SUMMONER] = {
            ["wins"] = 1000,
            ["kills"] = 1000
        }
    }
    v13.kitStatsProfiles = v14
    local v15 = {
        [u6.SPIRIT_ASSASSIN] = {
            ["purchasedUnlock"] = false,
            ["claimedRewards"] = {}
        },
        [u6.SUMMONER] = {
            ["purchasedUnlock"] = false,
            ["claimedRewards"] = {}
        }
    }
    v13.kitContractProfiles = v15
    v12.Lobby = v13
    local v16 = v9(v11, v12)
    local u17 = u2.mount(u2.createElement(u3, {
        ["store"] = v16
    }, { u2.createElement(u7, {
            ["AppId"] = "KitContractApp",
            ["SelectedKit"] = u6.SUMMONER
        }) }), p8)
    return function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u17
        --]]
        return u2.unmount(u17)
    end
end