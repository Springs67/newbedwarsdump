local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AppInfoReducer
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out")
local u4 = v3.PartyReducer
local u5 = v3.QueueState
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "app-reducer").AppReducer
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u15 = v1.import(script, script.Parent.Parent.Parent, "inventory", "reducers", "inventory-reducer").InventoryReducer
local u16 = v1.import(script, script.Parent, "hotbar-app").HotbarApp
return function(p17) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u11
        [4] = u2
        [5] = u9
        [6] = u15
        [7] = u4
        [8] = u13
        [9] = u12
        [10] = u14
        [11] = u5
        [12] = u6
        [13] = u7
        [14] = u16
    --]]
    local v18 = u8.Store.new
    local v19 = {
        ["Bedwars"] = u10,
        ["Game"] = u11,
        ["AppInfo"] = u2,
        ["App"] = u9,
        ["Inventory"] = u15,
        ["Party"] = u4
    }
    local v20 = u8.combineReducers(v19)
    local v21 = {
        ["Bedwars"] = {
            ["kit"] = u13.AERY
        },
        ["Game"] = {
            ["spectating"] = true,
            ["spectatingPlayer"] = nil,
            ["queueType"] = u12.BEDWARS_TEST,
            ["teams"] = {}
        },
        ["App"] = {
            ["showHotbarPartyControls"] = false
        },
        ["AppInfo"] = {
            ["openApps"] = {}
        }
    }
    local v22 = {
        ["observedPlayer"] = nil
    }
    local v23 = {
        ["hotbarSlot"] = 0,
        ["hotbar"] = {
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            },
            {
                ["item"] = nil
            }
        },
        ["inventory"] = {
            ["hand"] = nil,
            ["backpack"] = nil,
            ["items"] = {},
            ["armor"] = {}
        },
        ["observedChest"] = {
            ["items"] = {}
        }
    }
    v22.observedInventory = v23
    v21.Inventory = v22
    v21.Party = {
        ["leader"] = u14.Dummy.oiogy,
        ["queueState"] = u5.NONE
    }
    local v24 = {
        ["store"] = v18(v20, v21)
    }
    local u25 = u6.mount(u6.createElement(u7, v24, { u6.createElement(u16) }), p17)
    return function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u25
        --]]
        return u6.unmount(u25)
    end
end