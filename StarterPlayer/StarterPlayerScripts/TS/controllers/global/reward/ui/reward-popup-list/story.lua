local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u8 = v1.import(script, script.Parent, "reward-list").RewardList
local u9 = v1.import(script, script.Parent, "reward-showcase").RewardShowcase
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u8
        [6] = u9
        [7] = u6
        [8] = u7
    --]]
    local v11 = {
        ["Game"] = u5
    }
    local v12 = u4.Store.new(u4.combineReducers(v11), {})
    local v13 = u2.mount
    local v14 = u2.createElement
    local v15 = u3
    local v16 = {}
    local v17 = u2.createElement
    local v18 = u8
    local v19 = {}
    local v20 = u2.createElement
    local v21 = u9
    local v22 = {
        ["Reward"] = {
            ["paid"] = false,
            ["kit"] = u6.AERY
        }
    }
    local v23 = v20(v21, v22)
    local v24 = u2.createElement
    local v25 = u9
    local v26 = {
        ["Reward"] = {
            ["paid"] = false,
            ["killEffect"] = u7.SNOWBALL
        }
    }
    __set_list(v19, 1, {v23, v24(v25, v26), u2.createElement(u9, {
    ["Reward"] = {
        ["paid"] = false,
        ["clanShopContribution"] = 1000
    }
})})
    __set_list(v16, 1, {v17(v18, {}, v19)})
    local u27 = v13(v14(v15, {
        ["store"] = v12
    }, v16), p10)
    return function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u27
        --]]
        return u2.unmount(u27)
    end
end