local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u8 = v1.import(script, script.Parent, "reward-notification").RewardNotification
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u7
        [4] = u6
        [5] = u2
        [6] = u3
        [7] = u8
    --]]
    local v10 = u4.Store.new
    local v11 = {
        ["Lobby"] = u5
    }
    local v12 = u4.combineReducers(v11)
    local v13 = {}
    local v14 = {
        ["rewardsToDisplay"] = {
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
            },
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
            },
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
            },
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
            },
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
    v13.Lobby = v14
    local v15 = {
        ["store"] = v10(v12, v13)
    }
    local u16 = u2.mount(u2.createElement(u3, v15, { u2.createElement(u8, {
            ["AppId"] = "AppId"
        }) }), p9)
    return function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
        --]]
        return u2.unmount(u16)
    end
end