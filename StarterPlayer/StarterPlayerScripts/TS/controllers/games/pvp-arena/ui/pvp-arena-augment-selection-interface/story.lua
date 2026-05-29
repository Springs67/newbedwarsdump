local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "app-reducer").AppReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u9 = v1.import(script, script.Parent, "pvp-arena-augment-selection-interface").PvPArenaAugmentSelectionInterface
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u7
        [4] = u5
        [5] = u2
        [6] = u3
        [7] = u9
        [8] = u8
    --]]
    local v11 = {
        ["Bedwars"] = u6,
        ["Game"] = u7,
        ["App"] = u5
    }
    local v12 = u4.combineReducers(v11)
    local v13 = u4.Store.new(v12, {
        ["Bedwars"] = {}
    })
    local u14 = u2.mount(u2.createElement(u3, {
        ["store"] = v13
    }, { u2.createElement(u9, {
            ["AppId"] = "PvPArenaAugmentVotingInterface",
            ["Rerolls"] = 2,
            ["SelectionEndTime"] = os.time() + 1000,
            ["Augments"] = { u8.INVISIBILITY_JUTSU, u8.DECAYING_SHIELD, u8.PROJECTILE_DAMAGE }
        }) }), p10)
    return function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        u2.unmount(u14)
    end
end