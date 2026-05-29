local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "draft-reducer").DraftReducer
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, script.Parent, "combined-kit-draft-app").CombinedKitDraftApp
return function(p14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u11
        [4] = u5
        [5] = u10
        [6] = u8
        [7] = u6
        [8] = u7
        [9] = u9
        [10] = u3
        [11] = u4
        [12] = u13
    --]]
    local function v19() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u11
        --]]
        local v15 = u2.values(u12)
        local v16 = table.create(#v15)
        for v17, v18 in v15 do
            local _ = v17 - 1
            v16[v17] = { v18, u11.DEFAULT }
        end
        return u2.fromEntries(v16)
    end
    local v20 = u5.Store.new
    local v21 = {
        ["Game"] = u10,
        ["Bedwars"] = u8,
        ["Clans"] = u6,
        ["Consumable"] = u7,
        ["Draft"] = u9
    }
    local v22 = u5.combineReducers(v21)
    local v23 = {}
    local v24 = {
        ["playerLevel"] = 20,
        ["freeKitLevel"] = 20,
        ["favoriteKits"] = {
            [u12.CYBER] = true,
            [u12.NAZAR] = true,
            [u12.FROSTY_HAMMER] = true
        },
        ["ownedKits"] = { u12.FROSTY_HAMMER },
        ["equippedKitSkins"] = v19()
    }
    v23.Bedwars = v24
    v23.Clans = {}
    local v25 = {
        ["store"] = v20(v22, v23)
    }
    local u26 = u3.mount(u3.createElement(u4, v25, { u3.createElement(u13, {
            ["AppId"] = "CombinedKitDraftApp"
        }) }), p14)
    return function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u26
        --]]
        return u3.unmount(u26)
    end
end