local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "reducers", "inventory-reducer").InventoryReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u10 = v1.import(script, script.Parent, "team-upgrade-app").TeamUpgradeApp
return function(p11) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u6
        [4] = u5
        [5] = u9
        [6] = u8
        [7] = u2
        [8] = u3
        [9] = u10
    --]]
    local v12 = u4.Store.new
    local v13 = {
        ["Game"] = u7,
        ["Bedwars"] = u6,
        ["Inventory"] = u5
    }
    local v14 = u4.combineReducers(v13)
    local v15 = {}
    local v16 = {
        ["myTeamUpgrades"] = {},
        ["myBedTeamUpgrades"] = {},
        ["teamBedStatus"] = { u9.BedStatus.BED_ALIVE }
    }
    v15.Bedwars = v16
    v15.Game = {
        ["queueType"] = u8
    }
    local v17 = {
        ["store"] = v12(v14, v15)
    }
    local u18 = u2.mount(u2.createElement(u3, v17, { u2.createElement(u10, {
            ["AppId"] = "TeamUpgradeApp",
            ["TeamId"] = "0",
            ["IsHomeBase"] = false
        }) }), p11)
    return function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
        --]]
        return u2.unmount(u18)
    end
end