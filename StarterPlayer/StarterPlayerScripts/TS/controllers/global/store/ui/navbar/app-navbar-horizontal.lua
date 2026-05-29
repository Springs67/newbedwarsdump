local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.Padding
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["AppNavbarHorizontal"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(u6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        local _ = p7.useState
        local _ = p7.useEffect
        local v8 = {
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v9 = u6.FrameProps
        if v9 then
            for v10, v11 in v9 do
                v8[v10] = v11
            end
        end
        local v12 = {}
        local _ = #v12
        local v13 = u6.NavButtons
        local function v31(u14) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u5
            --]]
            local v15 = u6.ActiveAppId == u14.Id
            local v16 = u5.createElement
            local v17 = "ImageButton"
            local v18 = {
                ["Size"] = UDim2.fromScale(1, 0.8),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                [u5.Event.Activated] = function() --[[ Line: 32 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u14
                    --]]
                    if u6.ActiveAppId == u14.Id then
                        return nil
                    end
                    u6.SetActiveAppId(u14.Id)
                end,
                ["ZIndex"] = 2
            }
            local v19 = {}
            local v20 = u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            })
            local v21 = u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })
            local v22 = u5.createElement
            local v23 = "UIStroke"
            local v24 = {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }
            local v25 = {}
            local v26 = u5.createElement
            local v27 = "UIGradient"
            local v28 = {
                ["Rotation"] = 90
            }
            local v29 = ColorSequence.new
            local v30
            if v15 then
                v30 = Color3.fromRGB(255, 255, 255)
            else
                v30 = Color3.fromRGB(131, 131, 131)
            end
            v28.Color = v29(v30)
            v28.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.49, 1),
                NumberSequenceKeypoint.new(0.5, 0.4),
                NumberSequenceKeypoint.new(1, 0)
            })
            __set_list(v25, 1, {v26(v27, v28)})
            __set_list(v19, 1, {v20, v21, (v22(v23, v24, v25))})
            v19.Icon = u5.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = u14.Icon
            })
            v19.Title = u5.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 2,
                ["Text"] = u14.Title,
                ["Size"] = UDim2.fromScale(1.25, 0.45),
                ["Position"] = UDim2.fromScale(0.5, 1.45),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
            })
            return v16(v17, v18, v19)
        end
        local v32 = table.create(#v13)
        for v33, v34 in v13 do
            v32[v33] = v31(v34, v33 - 1, v13)
        end
        local v35 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0, -0.08)
        }
        local v36 = { u5.createElement(u4, {
                ["Padding"] = {
                    ["Horizontal"] = 32
                }
            }), u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["Padding"] = UDim.new(0, 32)
            }) }
        local v37 = #v36
        for v38, v39 in v32 do
            v36[v37 + v38] = v39
        end
        v12.NavButtons = u5.createElement(u3, v35, v36)
        v12.Background = u5.createElement("Frame", {
            ["BackgroundTransparency"] = 0.7,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.75),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }, { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }) })
        return u5.createFragment({
            ["Navbar"] = u5.createElement(u3, v8, v12)
        })
    end)
}