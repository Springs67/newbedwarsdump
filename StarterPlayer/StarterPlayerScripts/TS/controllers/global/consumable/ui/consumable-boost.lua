local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Countdown
local u6 = v2.StringUtil
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
return {
    ["ConsumableBoost"] = v9.new(u8)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u8
            [4] = u5
            [5] = u3
            [6] = u6
            [7] = u7
        --]]
        local _ = p12.useState
        local v13 = u10(p11.Consumable.consumable)
        local v14 = {
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 0.3,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v15 = { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u8.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7, 0.7),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v13.image
            }) }
        local v16 = #v15
        local v17
        if p11.Consumable.matchUsesLeft == nil then
            v17 = false
        else
            local v18 = u8.createElement
            local v19 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.4, 0.4),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.9, 0.9),
                ["BackgroundColor3"] = Color3.fromRGB(2, 135, 236)
            }
            local v20 = {}
            local v21 = u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            })
            local v22 = u8.createElement
            local v23 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7, 0.7),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v24 = p11.Consumable.matchUsesLeft
            v23.Text = "x" .. tostring(v24)
            v23.TextColor3 = u4.WHITE
            v23.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            __set_list(v20, 1, {v21, v22("TextLabel", v23)})
            v17 = v18("Frame", v19, v20)
        end
        if v17 then
            v15[v16 + 1] = v17
        end
        local v25 = #v15
        local v26
        if p11.Consumable.endTime == nil then
            v26 = false
        else
            local v27 = u8.createElement
            local v28 = u5
            local v29 = {
                ["TextLabel"] = {
                    ["Size"] = UDim2.fromScale(0.7, 0.6),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                },
                ["CountdownConfig"] = {
                    ["days"] = false
                },
                ["EndTime"] = p11.Consumable.endTime
            }
            v26 = v27(v28, v29)
        end
        if v26 then
            v15[v25 + 1] = v26
        end
        local v30 = #v15
        local v31 = { u8.createElement(u3, {
                ["TextSize"] = 16,
                ["Text"] = v13.displayName,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }) }
        local v32 = #v31
        local v33
        if p11.Consumable.endTime == nil then
            v33 = false
        else
            v33 = u8.createElement(u3, {
                ["TextSize"] = 14,
                ["Text"] = u6.fromNow(p11.Consumable.endTime, {
                    ["hideIfZero"] = true
                }),
                ["Font"] = Enum.Font.SourceSans,
                ["TextColor3"] = Color3.fromRGB(2, 135, 236),
                ["Limits"] = Vector2.new(300, 60)
            })
        end
        if v33 then
            v31[v32 + 1] = v33
        end
        local v34 = #v31
        local v35
        if p11.Consumable.matchUsesLeft == nil then
            v35 = false
        else
            local v36 = u8.createElement
            local v37 = u3
            local v38 = {
                ["TextSize"] = 14
            }
            local v39 = p11.Consumable.matchUsesLeft
            v38.Text = tostring(v39) .. " Match Uses Left"
            v38.Font = Enum.Font.SourceSans
            v38.TextColor3 = Color3.fromRGB(2, 135, 236)
            v38.Limits = Vector2.new(300, 60)
            v35 = v36(v37, v38)
        end
        if v35 then
            v31[v34 + 1] = v35
        end
        local v40 = #v31
        local v41
        if v13.description == nil then
            v41 = false
        else
            v41 = u8.createElement(u3, {
                ["TextSize"] = 14,
                ["Text"] = v13.description,
                ["Font"] = Enum.Font.SourceSans,
                ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                ["Limits"] = Vector2.new(300, 60)
            })
        end
        if v41 then
            v31[v40 + 1] = v41
        end
        v15[v30 + 1] = u8.createElement(u7, {}, v31)
        return u8.createElement("Frame", v14, v15)
    end)
}