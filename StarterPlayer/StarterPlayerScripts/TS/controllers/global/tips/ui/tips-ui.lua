local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["TipsUi"] = v7.new(u6)(function(u10, p11) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u4
            [4] = u3
            [5] = u5
            [6] = u9
        --]]
        local _ = p11.useState
        local v12 = p11.useEffect
        local u13 = u6.createRef()
        local u14 = u6.createRef()
        v12(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u14
                [3] = u10
                [4] = u8
                [5] = u4
            --]]
            local u15 = u13:getValue()
            local u16 = u14:getValue()
            local v17 = u10.Lifetime
            local v18 = v17 == nil and 10 or v17
            local u19 = math.max(v18, 0.6)
            local function u20() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u15
                    [3] = u19
                    [4] = u16
                --]]
                u8:Create(u15, TweenInfo.new(0.1), {
                    ["Position"] = UDim2.new(1, -10, 0.1, 10)
                }):Play()
                task.delay(u19 - 0.5, function() --[[ Line: 34 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u15
                    --]]
                    u8:Create(u15, TweenInfo.new(0.5), {
                        ["Position"] = UDim2.new(2, -10, 0.1, 10)
                    }):Play()
                end)
                u8:Create(u16, TweenInfo.new(u19 - 0.5, Enum.EasingStyle.Linear), {
                    ["Size"] = UDim2.new(0, 0, 0, 2)
                }):Play()
            end
            if u4.isHoarceKat() then
                task.delay(1, function() --[[ Line: 44 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                    --]]
                    return u20()
                end)
            else
                u20()
            end
        end)
        local v21 = u6.createFragment
        local v22 = {}
        local v23 = u6.createElement
        local v24 = {}
        local v25 = u6.createElement
        local v26 = {
            [u6.Ref] = u13,
            ["Size"] = UDim2.new(0.3, 0, 0.2, 0),
            ["Position"] = UDim2.new(2, -10, 0.1, 10),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["BackgroundColor3"] = u3.hexColor(295),
            ["BackgroundTransparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            [u6.Event.Activated] = function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u5
                --]]
                if u4.isHoarceKat() then
                    return nil
                end
                u5.Controllers.TipsController:dismissTip()
            end
        }
        local v27 = {
            u6.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.02, 0),
                ["PaddingBottom"] = UDim.new(0.02, 0),
                ["PaddingLeft"] = UDim.new(0.04, 0),
                ["PaddingRight"] = UDim.new(0.04, 0)
            }),
            u6.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new(380, 90)
            }),
            u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 4.222222222222222
            }),
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Color"] = u3.hexColor(42957)
            }),
            u6.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 1, -2)
            }, { u6.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.02, 0)
                }), u6.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = u9.EXCLAMATION_CIRCLE,
                    ["Size"] = UDim2.fromScale(0.1, 1),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["ImageColor3"] = u3.hexColor(63231)
                }), u6.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["TextWrapped"] = true,
                    ["Text"] = u10.Text,
                    ["Size"] = UDim2.fromScale(0.88, 1),
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
                }, { u6.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 20
                    }) }) }),
            ["TipDisplayTimer"] = u6.createElement("Frame", {
                [u6.Ref] = u14,
                ["Size"] = UDim2.new(1, 0, 0, 2),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["BorderSizePixel"] = 0,
                ["BackgroundColor3"] = Color3.fromRGB(0, 199, 227)
            })
        }
        v24.TipsContainer = v25("ImageButton", v26, v27)
        v22.Tips = v23("ScreenGui", {
            ["DisplayOrder"] = 49,
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true
        }, v24)
        return v21(v22)
    end)
}