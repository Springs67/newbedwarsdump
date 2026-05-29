local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u8 = v1.import(script, script.Parent, "popup").Popup
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u8
        [6] = u7
        [7] = u6
    --]]
    local v10 = {
        ["Game"] = u5
    }
    local v11 = u4.Store.new(u4.combineReducers(v10), {})
    local v12 = u2.mount
    local v13 = u2.createElement
    local v14 = u3
    local v15 = {}
    local v16 = u2.createElement
    local v17 = u8
    local v18 = {
        ["AppId"] = "Popup",
        ["title"] = "Clan War Beta #2",
        ["message"] = "Thanks for participating. Here\'s a reward!",
        ["reward"] = {
            {
                ["paid"] = false,
                ["clanShopContribution"] = 1000
            },
            {
                ["paid"] = false,
                ["killEffect"] = u7.BOXING_GLOVE
            },
            {
                ["paid"] = false,
                ["emote"] = u6.DISCO
            },
            {
                ["paid"] = false,
                ["emote"] = u6.PENGUIN_DISCO
            }
        }
    }
    __set_list(v15, 1, {v16(v17, v18)})
    local u19 = v12(v13(v14, {
        ["store"] = v11
    }, v15), p9)
    return function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u19
        --]]
        return u2.unmount(u19)
    end
end