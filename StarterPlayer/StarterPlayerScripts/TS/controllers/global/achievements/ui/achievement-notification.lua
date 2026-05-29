local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.ShineEffect
local u6 = v2.ShineEffectVariation
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, script.Parent, "achievement-icon").AchievementIcon
return {
    ["AchievementNotification"] = v9.new(u8)(function(p14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u7
            [4] = u10
            [5] = u4
            [6] = u3
            [7] = u5
            [8] = u6
            [9] = u13
            [10] = u12
        --]]
        local _ = p15.useState
        local v16 = p15.useEffect
        local v17 = u11.getMeta(p14.Id)
        local u18 = u8.createRef()
        local u19 = u8.createRef()
        local u20 = u8.createRef()
        local u21 = u8.createRef()
        v16(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u20
                [4] = u21
                [5] = u7
                [6] = u10
                [7] = u4
            --]]
            local u22 = u18:getValue()
            local u23 = u19:getValue()
            local u24 = u20:getValue()
            local u25 = u21:getValue()
            local function u26() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u22
                    [3] = u10
                    [4] = u4
                    [5] = u23
                    [6] = u24
                    [7] = u25
                --]]
                u7:setContainerTransparency(u22, 1, {
                    ["durationTillCleanUp"] = 0.01,
                    ["onSetTweenInfo"] = TweenInfo.new(0),
                    ["onCleanUpTweenInfo"] = TweenInfo.new(0.1)
                })
                u10:Create(u22, TweenInfo.new(0.1), {
                    ["Position"] = UDim2.new(0.5, 0, 0, u4.isSmallScreen() and 15 or 30)
                }):Play()
                u10:Create(u23, TweenInfo.new(0.6, Enum.EasingStyle.Back), {
                    ["Size"] = UDim2.fromScale(1, 1)
                }):Play()
                u10:Create(u24, TweenInfo.new(1.2, Enum.EasingStyle.Exponential), {
                    ["Rotation"] = 420,
                    ["Size"] = UDim2.fromScale(3, 3)
                }):Play()
                task.delay(0.9, function() --[[ Line: 47 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u24
                    --]]
                    u10:Create(u24, TweenInfo.new(1.5), {
                        ["ImageTransparency"] = 1
                    }):Play()
                end)
                task.delay(3, function() --[[ Line: 53 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u22
                        [3] = u10
                    --]]
                    u7:setContainerTransparency(u22, 1, {
                        ["onSetTweenInfo"] = TweenInfo.new(0.1)
                    })
                    u10:Create(u22, TweenInfo.new(0.1), {
                        ["Position"] = UDim2.new(0.5, 0, 0, 0)
                    }):Play()
                end)
                u7:setContainerTransparency(u25, 1, {
                    ["durationTillCleanUp"] = 0.01,
                    ["onSetTweenInfo"] = TweenInfo.new(0),
                    ["onCleanUpTweenInfo"] = TweenInfo.new(0.1)
                })
                task.delay(0.5, function() --[[ Line: 67 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u25
                    --]]
                    u7:setContainerTransparency(u25, 1, {
                        ["onSetTweenInfo"] = TweenInfo.new(0.1, Enum.EasingStyle.Sine)
                    })
                end)
                task.delay(2, function() --[[ Line: 72 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    u25:Destroy()
                end)
            end
            if u4.isHoarceKat() then
                task.delay(0, function() --[[ Line: 77 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    return u26()
                end)
            else
                u26()
            end
        end)
        local v27 = {
            ["DisplayOrder"] = 9999,
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true
        }
        local v28 = {}
        local v29 = #v28
        local v30 = {
            [u8.Ref] = u18,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["Position"] = UDim2.new(0.5, 0, 0, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["BackgroundColor3"] = u3.WHITE,
            ["BorderSizePixel"] = 0
        }
        local v31 = { u8.createElement("UIGradient", {
                ["Rotation"] = 0,
                ["Color"] = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 105)),
                    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 150, 105)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(228, 175, 0)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 119, 91))
                })
            }), u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 20)
            }), u8.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u3.WHITE
            }) }
        local v32 = #v31
        local v33 = {}
        local v34 = math
        local v35 = v17.goal
        if v35 ~= nil then
            v35 = v35.value
        end
        local v36 = v35 == nil and 0 or v35
        local v37 = #v17.description(v36) * 10 + 100
        v33.AspectRatio = v34.max(v37, 340) / 70
        v31[v32 + 1] = u8.createElement("UIAspectRatioConstraint", v33)
        v31[v32 + 2] = u8.createElement("UISizeConstraint", {
            ["MaxSize"] = Vector2.new((1 / 0), u4.isSmallScreen() and 35 or 70)
        })
        v31[v32 + 3] = u8.createElement("Frame", {
            [u8.Ref] = u21,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["ClipsDescendants"] = true
        }, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 20)
            }), u8.createElement(u5, {
                ["Speed"] = 2,
                ["Loop"] = false,
                ["DelayTime"] = u4.isHoarceKat() and 1 or 0,
                ["Variation"] = u6.solid
            }) })
        local v38 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v39 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["AchievementImage"] = u8.createElement("Frame", {
                ["LayoutOrder"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(0, u4.isSmallScreen() and 40 or 80, 1, 0)
            }, {
                u8.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 2),
                    ["PaddingBottom"] = UDim.new(0, 2),
                    ["PaddingLeft"] = UDim.new(0, 5),
                    ["PaddingRight"] = UDim.new(0, 0)
                }),
                ["AchievementIconWrapper"] = u8.createElement("Frame", {
                    [u8.Ref] = u19,
                    ["Size"] = UDim2.fromScale(2.5, 2.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 2
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u8.createElement(u13, {
                        ["Simple"] = true,
                        ["Darkened"] = false,
                        ["Id"] = p14.Id
                    }) }),
                ["AchievementGlow"] = u8.createElement("ImageLabel", {
                    [u8.Ref] = u20,
                    ["Size"] = UDim2.fromScale(0, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u12.ACHIEVEMENT_GLOW,
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 1
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        }
        local _ = #v39
        local v40 = {
            ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(u4.isSmallScreen() and 35 or 70, 0),
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1
        }
        local v41 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, u4.isSmallScreen() and 5 or 10)
            }),
            u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, u4.isSmallScreen() and 5 or 15),
                ["PaddingBottom"] = UDim.new(0, u4.isSmallScreen() and 5 or 15),
                ["PaddingLeft"] = UDim.new(0, 0),
                ["PaddingRight"] = UDim.new(0, u4.isSmallScreen() and 10 or 15)
            }),
            ["AchievementUnlocked"] = u8.createElement("TextLabel", {
                ["Text"] = "ACHIEVEMENT UNLOCKED!",
                ["TextScaled"] = true,
                ["LayoutOrder"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.45),
                ["FontFace"] = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u8.createElement("UIStroke", {
                    ["Transparency"] = 0.8,
                    ["Thickness"] = 1,
                    ["Color"] = Color3.fromRGB(64, 220, 255)
                }) })
        }
        local _ = #v41
        local v42 = {
            ["Size"] = UDim2.fromScale(1, 0.55)
        }
        local v43 = v17.goal
        if v43 ~= nil then
            v43 = v43.value
        end
        local v44 = v43 == nil and 0 or v43
        v42.Text = v17.description(v44)
        v42.Font = Enum.Font.LuckiestGuy
        v42.TextScaled = true
        v42.TextColor3 = u3.WHITE
        v42.LayoutOrder = 1
        v42.BackgroundTransparency = 1
        v41.AchievementDesc = u8.createElement("TextLabel", v42, { u8.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = Color3.fromRGB(0, 151, 138)
            }) })
        v39.AchievementText = u8.createElement("Frame", v40, v41)
        v31.AchievementContainer = u8.createElement("Frame", v38, v39)
        v28[v29 + 1] = u8.createElement("Frame", v30, v31)
        return u8.createFragment({
            ["AchievementNotification"] = u8.createElement("ScreenGui", v27, v28)
        })
    end)
}