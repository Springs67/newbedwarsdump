local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "kit-reducer").KitReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util").CardUpgradeType
local u7 = v1.import(script, script.Parent, "card-upgrades").CardUpgradesApp
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
        ["Kit"] = u5
    }
    local v11 = u4.combineReducers(v10)
    local v12 = {
        ["Kit"] = {
            ["cardUpgrades"] = {
                u6.CARD_COUNT_INCREASE_II,
                u6.FIRE,
                u6.KNOCKBACK,
                u6.MINISIZED,
                u6.LIFE_STEAL
            }
        }
    }
    local v13 = {
        ["store"] = v9(v11, v12)
    }
    local u14 = u2.mount(u2.createElement(u3, v13, { u2.createElement(u7, {
            ["AppId"] = "CardUpgradesApp"
        }) }), p8)
    return function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        return u2.unmount(u14)
    end
end