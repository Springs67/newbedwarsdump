local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.RandomUtil
local u7 = v2.SoundManager
local u8 = v2.UIUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-constants").RewardConstants
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = {
    v17.BUBBLE_POP1,
    v17.BUBBLE_POP2,
    v17.BUBBLE_POP3,
    v17.BUBBLE_POP4,
    v17.BUBBLE_POP5,
    v17.BUBBLE_POP6
}
return {
    ["RewardNotificationTile"] = v11.new(u10)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u9
            [4] = u8
            [5] = u6
            [6] = u18
            [7] = u7
            [8] = u12
            [9] = u16
            [10] = u15
            [11] = u3
            [12] = u5
            [13] = u13
            [14] = u14
        --]]
        local _ = p20.useState
        local v21 = p20.useEffect
        local u22 = u10.createRef()
        local u23 = u10.createRef()
        v21(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u23
                [3] = u19
                [4] = u4
                [5] = u9
                [6] = u8
                [7] = u6
                [8] = u18
                [9] = u7
                [10] = u12
                [11] = u16
                [12] = u15
            --]]
            local u24 = u22:getValue()
            local u25 = u23:getValue()
            local v26 = 0.15 * u19.Index
            if not u25 then
                return nil
            end
            local u27
            if u4.isHoarceKat() then
                u27 = true
            else
                local v28 = u9.Controllers.RewardNotificationController:getRewardsDisplayed()
                local v29 = u19.Reward
                local v30 = table.find(v28, v29) ~= nil
                u27 = not v30
            end
            local u31
            if u27 then
                u31 = u8:setContainerTransparency(u25, 1, {
                    ["onCleanUpTweenInfo"] = TweenInfo.new(0.35),
                    ["durationTillCleanUp"] = v26
                })
            else
                u31 = nil
            end
            task.delay(v26, function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u4
                    [3] = u9
                    [4] = u19
                    [5] = u6
                    [6] = u18
                    [7] = u7
                    [8] = u31
                    [9] = u12
                    [10] = u25
                    [11] = u24
                    [12] = u16
                    [13] = u8
                    [14] = u15
                --]]
                if not u27 then
                    return nil
                end
                task.spawn(function() --[[ Line: 54 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u9
                        [3] = u19
                        [4] = u6
                        [5] = u18
                        [6] = u7
                        [7] = u31
                        [8] = u12
                        [9] = u25
                        [10] = u24
                        [11] = u16
                        [12] = u8
                        [13] = u15
                    --]]
                    if not u4.isHoarceKat() then
                        u9.Controllers.RewardNotificationController:addRewardDisplayed(u19.Reward)
                    end
                    local v32 = u18
                    u7:playSound(u6.fromList(unpack(v32)), {
                        ["looped"] = false
                    })
                    local v33 = u31
                    if v33 ~= nil then
                        v33:DoCleaning()
                    end
                    u12:Create(u25, TweenInfo.new(0.35, Enum.EasingStyle.Cubic), {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }):Play()
                    u12:Create(u25, TweenInfo.new(0.35, Enum.EasingStyle.Cubic), {
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }):Play()
                    if u24 then
                        task.delay(u16.REWARD_NOTIFICATION_LIFETIME - 0.3, function() --[[ Line: 76 ]]
                            --[[
                            Upvalues:
                                [1] = u8
                                [2] = u24
                            --]]
                            u8:setContainerTransparency(u24, 1, {
                                ["onSetTweenInfo"] = TweenInfo.new(0.3, Enum.EasingStyle.Cubic)
                            })
                        end)
                        task.delay(u16.REWARD_NOTIFICATION_LIFETIME, function() --[[ Line: 81 ]]
                            --[[
                            Upvalues:
                                [1] = u15
                                [2] = u19
                                [3] = u24
                            --]]
                            u15:dispatch({
                                ["type"] = "LobbyRemoveRewardToDisplay",
                                ["rerender"] = true,
                                ["reward"] = u19.Reward
                            })
                            u24:Destroy()
                        end)
                    end
                end)
            end)
        end)
        return u10.createElement(u3, {
            [u10.Ref] = u22,
            ["OnClick"] = function() --[[ Name: OnClick, Line 95 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u19
                --]]
                u15:dispatch({
                    ["type"] = "LobbyRemoveRewardToDisplay",
                    ["rerender"] = true,
                    ["reward"] = u19.Reward
                })
            end,
            ["BackgroundTransparency"] = 1,
            ["DisableDefaultSound"] = true,
            ["LayoutOrder"] = u19.Index,
            ["ZIndex"] = 2
        }, { u10.createElement(u5, {
                [u10.Ref] = u23,
                ["Size"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.2)
            }, { u10.createElement(u13, {
                    ["Simple"] = true,
                    ["DisablePreview"] = true,
                    ["Reward"] = u19.Reward
                }) }), u10.createElement(u14) })
    end)
}