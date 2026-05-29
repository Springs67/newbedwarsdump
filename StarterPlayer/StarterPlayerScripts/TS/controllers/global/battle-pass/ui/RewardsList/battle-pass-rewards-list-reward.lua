local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.EmptyButton
local u5 = v2.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.TweenService
local u11 = v9.UserInputService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").LobbyTitleDefaults
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["BattlePassRewardsListReward"] = v8.new(u7)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u13
            [4] = u14
            [5] = u6
            [6] = u16
            [7] = u10
            [8] = u11
            [9] = u5
            [10] = u4
            [11] = u17
            [12] = u15
            [13] = u12
        --]]
        local v20 = p19.useEffect
        local v21 = {
            ["name"] = "",
            ["borderColor"] = u3.darken(Color3.fromRGB(78, 80, 130), 0.8),
            ["backgroundColor"] = Color3.fromRGB(92, 94, 153),
            ["frameSize"] = UDim2.new(0, 75, 0, 75)
        }
        local u22 = v21
        local v23 = u18.Reward.comingSoon
        local u24 = u7.createRef()
        local u25 = u7.createRef()
        if u18.RewardDisplayType then
            local v26 = u13[u18.RewardDisplayType]
            if u18.Reward.emote and not u14[u18.Reward.emote].animation then
                u22 = v21
            else
                u22 = v26
            end
        elseif v23 then
            local v27 = nil
            for v28, v29 in u6.values(u16) do
                local _ = v28 - 1
                if v23.rewardDisplayType == v29 == true then
                    v27 = v29
                    break
                end
            end
            if v27 then
                u22 = u13[v27]
            end
        end
        v20(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u22
                [3] = u10
            --]]
            local v30 = u25:getValue()
            if v30 and u22.frameShine then
                u10:Create(v30, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut, -1, true), {
                    ["Offset"] = Vector2.new(1, 0)
                }):Play()
            end
        end, {})
        v20(function() --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u11
                [3] = u5
                [4] = u24
            --]]
            if u18.GamepadShouldAutoSelect and u11.GamepadEnabled then
                u5:selectGui(u24:getValue())
            end
        end, {})
        local v31 = u7.createFragment
        local v32 = {}
        local v33 = u7.createElement
        local v34 = u4
        local v35 = {
            ["Size"] = u22.frameSize or v21.frameSize,
            ["BackgroundTransparency"] = 0,
            ["BackgroundColor3"] = u17.backgroundSecondary,
            ["LayoutOrder"] = u18.LayoutOrder,
            [u7.Event.MouseEnter] = function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18.SetReward(u18.Reward)
                u18.SetActive(u18.Reward)
            end,
            ["Selectable"] = true,
            [u7.Ref] = u24
        }
        local v36 = {}
        local v37
        if v23 then
            v37 = u7.createElement("TextLabel", {
                ["Text"] = "Coming Soon",
                ["TextScaled"] = true,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.new(1, 0, 0, 40),
                ["TextColor3"] = u15.color,
                ["TextTransparency"] = u18.Locked and 0.6 or 0,
                ["Font"] = u15.font,
                ["BackgroundColor3"] = u15.backgroundColor,
                ["BackgroundTransparency"] = u15.backgroundTransparency
            }, { u7.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 4),
                    ["PaddingBottom"] = UDim.new(0, 4),
                    ["PaddingRight"] = UDim.new(0, 6),
                    ["PaddingLeft"] = UDim.new(0, 6)
                }) })
        else
            v37 = u7.createElement(u12, {
                ["Reward"] = u18.Reward
            })
        end
        __set_list(v36, 1, {v37})
        v32.LevelRewardFrame = v33(v34, v35, v36)
        return v31(v32)
    end)
}