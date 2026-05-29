local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.CircularProgress
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-constants").SurvivalConstants
return {
    ["SurvivalComboUi"] = v8.new(u7)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u9
            [4] = u4
            [5] = u6
            [6] = u3
            [7] = u5
        --]]
        local _ = p12.useEffect
        local _ = p12.useState
        local v13 = p11.Chain >= u10.COMBO_BOOST_AMOUNT
        local v14 = {
            ["DisplayOrder"] = 10,
            ["ResetOnSpawn"] = false
        }
        local v15 = {}
        local v16 = #v15
        local v17 = {
            ["Size"] = UDim2.fromScale(0.13, 0.13),
            ["Position"] = UDim2.new(0.8, 0, 0.1, 0)
        }
        local v18 = { (u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.5
            })) }
        local v19 = u7.createElement
        local v20 = "ImageLabel"
        local v21 = {
            ["ImageTransparency"] = 0,
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 9,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = u9.CIRCLE_PROGRESS_BAR
        }
        local v22
        if v13 then
            v22 = Color3.fromRGB(255, 179, 79)
        else
            v22 = Color3.fromRGB(255, 242, 79)
        end
        v21.ImageColor3 = v22
        v18.BackgroundCircle = v19(v20, v21)
        __set_list(v18, 2, {(u7.createElement(u4, {
    ["Progress"] = 0,
    ["ZIndex"] = 10,
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Position"] = UDim2.fromScale(0.5, 0.5),
    ["Color"] = Color3.fromRGB(102, 102, 102),
    ["Duration"] = u10.COMBO_COOLDOWN
}))})
        local v23 = u7.createElement
        local v24 = "TextLabel"
        local v25 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(0.5, 0.6),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.45)
        }
        local v26 = p11.Chain
        v25.Text = tostring(v26)
        v25.Font = Enum.Font.GothamBold
        local v27
        if v13 then
            v27 = Color3.fromRGB(255, 242, 79)
        else
            v27 = Color3.fromRGB(255, 255, 255)
        end
        v25.TextColor3 = v27
        local v28 = {}
        local v29 = u7.createElement
        local v30 = "UIStroke"
        local v31 = {}
        local v32
        if v13 then
            v32 = Color3.fromRGB(138, 92, 5)
        else
            v32 = Color3.fromRGB(0, 0, 0)
        end
        v31.Color = v32
        __set_list(v28, 1, {v29(v30, v31)})
        v18.ChainCount = v23(v24, v25, v28)
        local v33 = u7.createElement
        local v34 = "TextLabel"
        local v35 = {
            ["Text"] = "STREAK",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 11,
            ["Size"] = UDim2.fromScale(0.4, 0.2),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.6)
        }
        local v36
        if v13 then
            v36 = Color3.fromRGB(255, 242, 79)
        else
            v36 = Color3.fromRGB(255, 255, 255)
        end
        v35.TextColor3 = v36
        v35.Font = Enum.Font.GothamBold
        local v37 = {}
        local v38 = u7.createElement
        local v39 = "UIStroke"
        local v40 = {}
        local v41
        if v13 then
            v41 = Color3.fromRGB(138, 92, 5)
        else
            v41 = Color3.fromRGB(0, 0, 0)
        end
        v40.Color = v41
        __set_list(v37, 1, {v38(v39, v40)})
        v18.StreakText = v33(v34, v35, v37)
        local v42 = #v18
        if v13 then
            v13 = u7.createElement(u6, {}, { u7.createElement(u3, {
                    ["Text"] = "ON FIRE! Deal increased damage!",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) })
        end
        if v13 then
            v18[v42 + 1] = v13
        end
        v15[v16 + 1] = u7.createElement(u5, v17, v18)
        return u7.createFragment({
            ["SurvivalComboUi"] = u7.createElement("ScreenGui", v14, v15)
        })
    end)
}