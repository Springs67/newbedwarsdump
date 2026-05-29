local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta
return {
    ["CarouselReward"] = v3.new(u2)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u6
            [4] = u5
        --]]
        local _ = p8.useState
        local v9 = p8.useMemo
        local v10 = p8.useEffect
        local u11 = u2.createRef()
        v10(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u7
                [3] = u4
            --]]
            local u12 = true
            task.spawn(function() --[[ Line: 16 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u7
                    [3] = u4
                    [4] = u12
                --]]
                local v13 = u11:getValue()
                if v13 == nil then
                    return nil
                end
                local v14 = u7.Position.X.Scale + u7.totalRewardCount / 2
                local v15 = u4:Create(v13, TweenInfo.new(v14 * 2, Enum.EasingStyle.Linear), {
                    ["Position"] = UDim2.fromScale(-u7.totalRewardCount / 2, 0.5)
                })
                v15:Play()
                v15.Completed:Wait()
                while u12 do
                    local u16 = u11:getValue()
                    if u16 == nil then
                        return nil
                    end
                    u16.Position = UDim2.fromScale(u7.totalRewardCount / 2, 0.5);
                    (function() --[[ Line: 33 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u16
                            [3] = u7
                        --]]
                        local v17 = u4:Create(u16, TweenInfo.new(2 * u7.totalRewardCount, Enum.EasingStyle.Linear), {
                            ["Position"] = UDim2.fromScale(-u7.totalRewardCount / 2, 0.5)
                        })
                        v17:Play()
                        v17.Completed:Wait()
                    end)()
                end
            end)
            return function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12 = false
            end
        end, {})
        local u18 = u6[u7.rewardId]
        return v9(function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u11
                [3] = u7
                [4] = u18
                [5] = u5
            --]]
            local v19 = {
                [u2.Ref] = u11,
                ["Position"] = u7.Position,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
            local v20 = {}
            local v21 = #v20
            local v22
            if u18.item == nil then
                v22 = false
            else
                v22 = u2.createElement(u5, {
                    ["ImageTransparency"] = 0,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["ItemType"] = u18.item.itemType
                })
            end
            if v22 then
                v20[v21 + 1] = v22
            end
            local v23 = #v20
            local v24
            if u18.custom == nil then
                v24 = false
            else
                v24 = u2.createElement("ImageLabel", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0,
                    ["Image"] = u18.custom.image,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                })
            end
            if v24 then
                v20[v23 + 1] = v24
            end
            return u2.createElement("Frame", v19, v20)
        end)
    end)
}