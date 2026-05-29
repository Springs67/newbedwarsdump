local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "armor-trim-reducer").ArmorTrimReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u9 = v1.import(script, script.Parent, "armor-trim-app").ArmorTrimApp
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u8
        [5] = u7
        [6] = u2
        [7] = u3
        [8] = u9
    --]]
    local v11 = u4.Store.new
    local v12 = {
        ["Lobby"] = u6,
        ["ArmorTrim"] = u5
    }
    local v13 = u4.combineReducers(v12)
    local v14 = {}
    local v15 = {}
    local v16 = {
        [u8.BARBARIAN] = {
            {
                ["xpEarned"] = 400,
                ["trim"] = u7.TRIM_5
            }
        },
        [u8.AERY] = {
            {
                ["xpEarned"] = 1000,
                ["trim"] = u7.TRIM_1
            }
        }
    }
    v15.allKitProgress = v16
    v15.effectUnlocks = {}
    v15.allKitXpPotential = {
        [u8.BARBARIAN] = 20
    }
    local v17 = {
        [u8.BARBARIAN] = {
            ["type"] = u7.TRIM_5,
            ["color"] = {
                ["r"] = 100,
                ["g"] = 100,
                ["b"] = 255
            }
        }
    }
    v15.selectedArmorTrimConfigs = v17
    v14.ArmorTrim = v15
    local v18 = v11(v13, v14)
    local u19 = u2.mount(u2.createElement(u3, {
        ["store"] = v18
    }, { u2.createElement(u9, {
            ["AppId"] = "ArmorTrimSelectionApp",
            ["SelectedKit"] = u8.BARBARIAN
        }) }), p10)
    return function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u19
        --]]
        return u2.unmount(u19)
    end
end