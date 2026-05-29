local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "kit-reducer").KitReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade").BloodUpgrade
local u8 = v1.import(script, script.Parent, "contract-select-app").ContractSelectApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u7
        [4] = u5
        [5] = u2
        [6] = u3
        [7] = u8
    --]]
    local v10 = u4.Store.new
    local v11 = {
        ["Kit"] = u6
    }
    local v12 = u4.combineReducers(v11)
    local v13 = {}
    local v14 = {
        ["bloodUpgrades"] = {
            [u7.DAMAGE] = 3,
            [u7.ARMOR_PEN] = 15,
            [u7.THRILL_OF_THE_HUNT] = 1
        },
        ["availableContracts"] = {},
        ["activeContract"] = {
            ["rewardValue"] = 1,
            ["id"] = 0.5,
            ["rewardUpgrade"] = u7.ASSASSIN_INSTINCT,
            ["rewardExplanation"] = {
                ["assassin"] = true
            },
            ["activationTime"] = u5:GetServerTimeNow() - 35
        }
    }
    v13.Kit = v14
    local v15 = {
        ["store"] = v10(v12, v13)
    }
    local u16 = u2.mount(u2.createElement(u3, v15, { u2.createElement(u8, {
            ["AppId"] = "ContractSelect"
        }) }), p9)
    return function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
        --]]
        return u2.unmount(u16)
    end
end